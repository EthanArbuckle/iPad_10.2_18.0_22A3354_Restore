@implementation _PXSimulatedFailingMediaRequest

- (_PXSimulatedFailingMediaRequest)initWithWrappedMediaRequest:(id)a3 error:(id)a4
{
  id v7;
  _PXSimulatedFailingMediaRequest *v8;
  _PXSimulatedFailingMediaRequest *v9;

  v7 = a4;
  v8 = -[_PXSimulatedMediaRequest initWithWrappedMediaRequest:](self, "initWithWrappedMediaRequest:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_error, a4);

  return v9;
}

- (void)handleOriginalResult:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  _PXSimulatedFailingMediaRequest *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v10 & 1) != 0)
  {
    v15.receiver = v8;
    v15.super_class = (Class)_PXSimulatedFailingMediaRequest;
    -[_PXSimulatedMediaRequest handleOriginalResult:info:](&v15, sel_handleOriginalResult_info_, v6, v7);
  }
  else if (!v8->_didReturnError)
  {
    v11 = (void *)objc_msgSend(v7, "mutableCopy");
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = v13;

    objc_msgSend(v14, "setObject:forKeyedSubscript:", v8->_error, *MEMORY[0x1E0CD1BE8]);
    v16.receiver = v8;
    v16.super_class = (Class)_PXSimulatedFailingMediaRequest;
    -[_PXSimulatedMediaRequest handleOriginalResult:info:](&v16, sel_handleOriginalResult_info_, 0, v14);
    v8->_didReturnError = 1;

  }
  objc_sync_exit(v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
