@implementation _SVXRemoteExpressionParsingService

- (_SVXRemoteExpressionParsingService)initWithAceHandler:(id)a3
{
  id v5;
  _SVXRemoteExpressionParsingService *v6;
  _SVXRemoteExpressionParsingService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXRemoteExpressionParsingService;
  v6 = -[_SVXRemoteExpressionParsingService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_aceHandler, a3);

  return v7;
}

- (void)parseExpressions:(id)a3 targetDevice:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  SVXAceCommandHandling *aceHandler;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (objc_msgSend(v8, "count"))
    {
      v11 = objc_alloc_init(MEMORY[0x24BE81910]);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAceId:", v13);

      v14 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v11, "setExpressions:", v14);

      objc_msgSend(v11, "setTargetDevice:", v9);
      aceHandler = self->_aceHandler;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __74___SVXRemoteExpressionParsingService_parseExpressions_targetDevice_reply___block_invoke;
      v17[3] = &unk_24D24C4A0;
      v18 = v10;
      -[SVXAceCommandHandling handleAceCommand:reply:](aceHandler, "handleAceCommand:reply:", v11, v17);

    }
    else
    {
      v16 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[_SVXRemoteExpressionParsingService parseExpressions:targetDevice:reply:]";
        _os_log_impl(&dword_214934000, v16, OS_LOG_TYPE_INFO, "%s No parseable expressions - parsing failed", buf, 0xCu);
      }
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }
  }

}

- (SVXAceCommandHandling)aceHandler
{
  return self->_aceHandler;
}

- (void)setAceHandler:(id)a3
{
  objc_storeStrong((id *)&self->_aceHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceHandler, 0);
}

@end
