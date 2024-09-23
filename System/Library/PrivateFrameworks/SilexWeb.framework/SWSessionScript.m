@implementation SWSessionScript

- (NSString)identifier
{
  return (NSString *)CFSTR("session");
}

- (SWSessionScript)initWithSession:(id)a3
{
  id v5;
  SWSessionScript *v6;
  SWSessionScript *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWSessionScript;
  v6 = -[SWSessionScript init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_session, a3);

  return v7;
}

- (BOOL)queueable
{
  return 0;
}

- (WKUserScript)userScript
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1608];
  v11 = CFSTR("identifier");
  -[SWSessionScript session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("applenews.session = %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v8, 0, 1);

  return (WKUserScript *)v9;
}

- (SWSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
