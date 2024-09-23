@implementation SWConfigurationScript

- (SWConfigurationScript)initWithConfiguration:(id)a3
{
  id v4;
  SWConfigurationScript *v5;
  uint64_t v6;
  NSString *configuration;
  SWConfigurationScript *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)SWConfigurationScript;
    v5 = -[SWConfigurationScript init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      configuration = v5->_configuration;
      v5->_configuration = (NSString *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("configuration");
}

- (BOOL)queueable
{
  return 0;
}

- (WKUserScript)userScript
{
  void *v3;
  void *v4;

  if (-[NSString length](self->_configuration, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("applenews.configuration = %@"), self->_configuration);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v3, 0, 1);

  }
  else
  {
    v4 = 0;
  }
  return (WKUserScript *)v4;
}

- (NSString)executableScript
{
  void *v3;

  v3 = -[NSString length](self->_configuration, "length");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("                            var oldConfiguration = applenews.configuration;                             applenews.configuration = %@;                             var detail = {newConfiguration: applenews.configuration, oldConfiguration: oldConfiguration};                             var event = new CustomEvent('ANConfigurationChanged', {detail: detail});                             document.dispatchEvent(event);"),
      self->_configuration);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->userScript, 0);
}

@end
