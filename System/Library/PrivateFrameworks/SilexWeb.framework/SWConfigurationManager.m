@implementation SWConfigurationManager

- (SWConfigurationManager)initWithWebContentScriptsManager:(id)a3 logger:(id)a4 serializer:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  SWConfigurationManager *v13;
  SWConfigurationManager *v14;
  id *p_isa;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)SWConfigurationManager;
    v14 = -[SWConfigurationManager init](&v17, sel_init);
    p_isa = (id *)&v14->super.isa;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_webContentScriptsManager, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 5, a5);
    }
    self = p_isa;
    v13 = self;
  }

  return v13;
}

- (void)setConfiguration:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SWConfiguration *v10;
  SWConfiguration *configuration;
  void *v12;
  void *v13;
  SWConfigurationScript *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (v17)
  {
    -[SWConfigurationManager configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToConfiguration:", v17);

    if ((v5 & 1) == 0)
    {
      -[SWConfigurationManager logger](self, "logger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Updating configuration with: %@"), v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "log:", v7);

      -[SWConfigurationManager webContentScriptsManager](self, "webContentScriptsManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWConfigurationManager configurationScript](self, "configurationScript");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeScript:", v9);

      v10 = (SWConfiguration *)objc_msgSend(v17, "copy");
      configuration = self->_configuration;
      self->_configuration = v10;

      -[SWConfigurationManager serializer](self, "serializer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serializeWebContentConfiguration:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = -[SWConfigurationScript initWithConfiguration:]([SWConfigurationScript alloc], "initWithConfiguration:", v13);
      -[SWConfigurationManager webContentScriptsManager](self, "webContentScriptsManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "executeScript:completion:", v14, 0);

      -[SWConfigurationManager webContentScriptsManager](self, "webContentScriptsManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addScript:", v14);

      -[SWConfigurationManager setConfigurationScript:](self, "setConfigurationScript:", v14);
    }
  }

}

- (SWConfiguration)configuration
{
  return self->_configuration;
}

- (SWScriptsManager)webContentScriptsManager
{
  return self->_webContentScriptsManager;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (SWScript)configurationScript
{
  return self->_configurationScript;
}

- (void)setConfigurationScript:(id)a3
{
  objc_storeStrong((id *)&self->_configurationScript, a3);
}

- (SWConfigurationSerializer)serializer
{
  return self->_serializer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_configurationScript, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_webContentScriptsManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
