@implementation SVXModuleInstanceMap

- (SVXModuleInstanceMap)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  SVXModuleInstanceMap *v5;
  uint64_t v6;
  NSDictionary *dictionaryRepresentation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXModuleInstanceMap;
  v5 = -[SVXModuleInstanceMap init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;

  }
  return v5;
}

- (id)moduleInstanceWithIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", a3);
}

- (SVXDeviceSetupManager)deviceSetupManager
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.device-setup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.device-setup"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (SVXDeviceSetupManager *)v4;
}

- (SVXSynthesisManager)synthesisManager
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.synthesis-manager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.synthesis-manager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (SVXSynthesisManager *)v4;
}

- (SVXClientServiceServer)clientServiceServer
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.client-service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.client-service"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (SVXClientServiceServer *)v4;
}

- (SVXServiceCommandHandler)serviceCommandHandler
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.service-command"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.service-command"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (SVXServiceCommandHandler *)v4;
}

- (SVXSessionManager)sessionManager
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.session-manager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.session-manager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (SVXSessionManager *)v4;
}

- (SVXSpeechSynthesizer)speechSynthesizer
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.speech-synthesis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.speech-synthesis"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (SVXSpeechSynthesizer *)v4;
}

- (SVXSystemObserver)systemObserver
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.system-observation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", CFSTR("com.apple.SiriVOXService.system-observation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (SVXSystemObserver *)v4;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end
