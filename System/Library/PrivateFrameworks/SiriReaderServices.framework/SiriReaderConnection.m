@implementation SiriReaderConnection

- (SiriReaderConnection)init
{
  SiriReaderConnection *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriReaderConnection;
  v2 = -[SiriReaderConnection init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.siri.sirireaderd"), 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25767BAB0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global);
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_59);
  }
  return v2;
}

void __28__SiriReaderConnection_init__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[SiriReaderConnection init]_block_invoke";
    _os_log_impl(&dword_2471DC000, v0, OS_LOG_TYPE_DEFAULT, "%s SiriReaderConnection: connection invalidated", (uint8_t *)&v1, 0xCu);
  }
}

void __28__SiriReaderConnection_init__block_invoke_58()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[SiriReaderConnection init]_block_invoke";
    _os_log_impl(&dword_2471DC000, v0, OS_LOG_TYPE_DEFAULT, "%s SiriReaderConnection: connection invalidated", (uint8_t *)&v1, 0xCu);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SiriReaderConnection;
  -[SiriReaderConnection dealloc](&v3, sel_dealloc);
}

- (id)readerProtocol
{
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_63);
}

void __38__SiriReaderConnection_readerProtocol__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[SiriReaderConnection readerProtocol]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_2471DC000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)readText:(id)a3 textBody:(id)a4 textIdentifier:(id)a5 textLocale:(id)a6 textLeadingImage:(id)a7
{
  NSXPCConnection *connection;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  connection = self->_connection;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[NSXPCConnection resume](connection, "resume");
  -[SiriReaderConnection readerProtocol](self, "readerProtocol");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "readTextWithTextTitle:textBody:textIdentifier:textLocale:textLeadingImage:activationSource:", v17, v16, v15, v14, v13, 0);

  -[NSXPCConnection suspend](self->_connection, "suspend");
}

- (void)readText:(id)a3 textBody:(id)a4 textIdentifier:(id)a5 textLocale:(id)a6 textLeadingImage:(id)a7 activationSource:(int64_t)a8
{
  NSXPCConnection *connection;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  connection = self->_connection;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[NSXPCConnection resume](connection, "resume");
  -[SiriReaderConnection readerProtocol](self, "readerProtocol");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "readTextWithTextTitle:textBody:textIdentifier:textLocale:textLeadingImage:activationSource:", v19, v18, v17, v16, v15, a8);

  -[NSXPCConnection suspend](self->_connection, "suspend");
}

- (int64_t)getPlaybackStatusForIdentifier:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  -[NSXPCConnection resume](self->_connection, "resume");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SiriReaderConnection readerProtocol](self, "readerProtocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__SiriReaderConnection_getPlaybackStatusForIdentifier___block_invoke;
  v8[3] = &unk_251875C40;
  v8[4] = &v9;
  objc_msgSend(v5, "getPlaybackStatusForIdentifierWithTextIdentifier:reply:", v4, v8);
  -[NSXPCConnection suspend](self->_connection, "suspend");
  v6 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __55__SiriReaderConnection_getPlaybackStatusForIdentifier___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)pausePlaybackForIdentifier:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection resume](connection, "resume");
  -[SiriReaderConnection readerProtocol](self, "readerProtocol");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pausePlaybackForIdentifierWithTextIdentifier:", v5);

  -[NSXPCConnection suspend](self->_connection, "suspend");
}

- (void)resumePlaybackForIdentifier:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection resume](connection, "resume");
  -[SiriReaderConnection readerProtocol](self, "readerProtocol");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumePlaybackForIdentifierWithTextIdentifier:", v5);

  -[NSXPCConnection suspend](self->_connection, "suspend");
}

- (void)endMediaSessionForIdentifier:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection resume](connection, "resume");
  -[SiriReaderConnection readerProtocol](self, "readerProtocol");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endMediaSessionForIdentifierWithTextIdentifier:", v5);

  -[NSXPCConnection suspend](self->_connection, "suspend");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
