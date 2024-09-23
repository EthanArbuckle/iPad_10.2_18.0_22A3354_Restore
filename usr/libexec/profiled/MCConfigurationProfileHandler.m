@implementation MCConfigurationProfileHandler

- (MCConfigurationProfileHandler)initWithProfile:(id)a3
{
  MCConfigurationProfileHandler *v3;
  MCConfigurationProfileHandler *v4;
  void *v5;
  void *v6;
  void *v7;
  MCProfileServiceProfileHandler *v8;
  MCProfileServiceProfileHandler *OTAHandler;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MCConfigurationProfileHandler;
  v3 = -[MCProfileHandler initWithProfile:](&v11, "initWithProfile:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](v3, "profile"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OTAProfile"));
    v7 = v6;
    if (v6)
    {
      v8 = (MCProfileServiceProfileHandler *)objc_msgSend(v6, "createHandler");
      OTAHandler = v4->_OTAHandler;
      v4->_OTAHandler = v8;

    }
  }
  return v4;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  MCProfileServiceProfileHandler *OTAHandler;
  BOOL v14;
  id v16;
  objc_super v17;
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MCConfigurationProfileHandler;
  v18 = 0;
  -[MCProfileHandler installWithInstaller:options:interactionClient:outError:](&v17, "installWithInstaller:options:interactionClient:outError:", v10, v11, v12, &v18);
  OTAHandler = (MCProfileServiceProfileHandler *)v18;
  if (!OTAHandler)
  {
    OTAHandler = self->_OTAHandler;
    if (!OTAHandler)
    {
      v14 = 1;
      goto LABEL_8;
    }
    v16 = 0;
    -[MCProfileServiceProfileHandler installWithInstaller:options:interactionClient:outError:](OTAHandler, "installWithInstaller:options:interactionClient:outError:", v10, v11, v12, &v16);
    OTAHandler = (MCProfileServiceProfileHandler *)v16;
  }
  v14 = OTAHandler == 0;
  if (a6 && OTAHandler)
  {
    OTAHandler = objc_retainAutorelease(OTAHandler);
    v14 = 0;
    *a6 = OTAHandler;
  }
LABEL_8:

  return v14;
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCConfigurationProfileHandler;
  v6 = a4;
  v7 = a3;
  -[MCProfileHandler didInstallOldGlobalRestrictions:newGlobalRestrictions:](&v8, "didInstallOldGlobalRestrictions:newGlobalRestrictions:", v7, v6);
  -[MCProfileServiceProfileHandler didInstallOldGlobalRestrictions:newGlobalRestrictions:](self->_OTAHandler, "didInstallOldGlobalRestrictions:newGlobalRestrictions:", v7, v6, v8.receiver, v8.super_class);

}

- (void)setAsideWithInstaller:(id)a3
{
  id v4;
  MCProfileServiceProfileHandler *OTAHandler;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MCConfigurationProfileHandler;
  -[MCProfileHandler setAsideWithInstaller:](&v6, "setAsideWithInstaller:", v4);
  OTAHandler = self->_OTAHandler;
  if (OTAHandler)
    -[MCProfileServiceProfileHandler setAsideWithInstaller:](OTAHandler, "setAsideWithInstaller:", v4);

}

- (void)unsetAside
{
  MCProfileServiceProfileHandler *OTAHandler;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCConfigurationProfileHandler;
  -[MCProfileHandler unsetAside](&v4, "unsetAside");
  OTAHandler = self->_OTAHandler;
  if (OTAHandler)
    -[MCProfileServiceProfileHandler unsetAside](OTAHandler, "unsetAside");
}

- (void)removeWithInstaller:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  MCProfileServiceProfileHandler *OTAHandler;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MCConfigurationProfileHandler;
  -[MCProfileHandler removeWithInstaller:options:](&v9, "removeWithInstaller:options:", v6, v7);
  OTAHandler = self->_OTAHandler;
  if (OTAHandler)
    -[MCProfileServiceProfileHandler removeWithInstaller:options:](OTAHandler, "removeWithInstaller:options:", v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OTAHandler, 0);
}

@end
