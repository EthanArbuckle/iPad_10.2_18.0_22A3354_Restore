@implementation RecognizerProvider

- (RecognizerProvider)initWithRecognitionLanguage:(id)a3 mode:(int)a4
{
  id v7;
  RecognizerProvider *v8;
  RecognizerProvider *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RecognizerProvider;
  v8 = -[RecognizerProvider init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recognitionLanguage, a3);
    v9->_recognitionMode = a4;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[RecognizerProvider unloadRecognizer](self, "unloadRecognizer");
  v3.receiver = self;
  v3.super_class = (Class)RecognizerProvider;
  -[RecognizerProvider dealloc](&v3, sel_dealloc);
}

- (CHRecognizer)recognizer
{
  RecognizerProvider *v2;
  CHRecognizer *recognizer;
  CHRecognizer *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CHRecognizer *v9;
  CHRecognizer *v10;
  CHRecognizer *v11;
  CHRecognizer *v12;
  void *v13;
  void (**v14)(void);
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  recognizer = v2->_recognizer;
  v4 = recognizer;
  if (!recognizer)
  {
    v5 = (void *)MEMORY[0x24BE1BDE8];
    v6 = -[RecognizerProvider recognitionMode](v2, "recognitionMode");
    -[RecognizerProvider recognitionLanguage](v2, "recognitionLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (CHRecognizer *)objc_msgSend(v5, "newRemoteRecognizerWithMode:locales:", v6, v8);

    v10 = v2->_recognizer;
    v2->_recognizer = v9;
    v11 = v9;

    -[CHRecognizer setMaxRecognitionResultCount:](v2->_recognizer, "setMaxRecognitionResultCount:", 15);
    v4 = v2->_recognizer;
  }
  v12 = v4;
  objc_sync_exit(v2);

  if (!recognizer)
  {
    -[RecognizerProvider recognizerDidLoadBlock](v2, "recognizerDidLoadBlock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[RecognizerProvider recognizerDidLoadBlock](v2, "recognizerDidLoadBlock");
      v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v14[2]();

    }
  }
  return v12;
}

- (void)provideRecognizerToBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  RecognizerProvider *obj;

  if (a3)
  {
    obj = self;
    v4 = (void (**)(id, _QWORD))a3;
    objc_sync_enter(obj);
    ((void (**)(id, CHRecognizer *))v4)[2](v4, obj->_recognizer);

    objc_sync_exit(obj);
  }
}

- (void)unloadRecognizer
{
  CHRecognizer *recognizer;
  RecognizerProvider *obj;

  obj = self;
  objc_sync_enter(obj);
  recognizer = obj->_recognizer;
  obj->_recognizer = 0;

  objc_sync_exit(obj);
}

- (NSLocale)recognitionLanguage
{
  return (NSLocale *)objc_getProperty(self, a2, 24, 1);
}

- (int)recognitionMode
{
  return self->_recognitionMode;
}

- (id)recognizerDidLoadBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setRecognizerDidLoadBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recognizerDidLoadBlock, 0);
  objc_storeStrong((id *)&self->_recognitionLanguage, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

@end
