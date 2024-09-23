@implementation SBSSKExternalDisplayServiceParticipantSceneClientComponent

- (void)setScene:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSSKExternalDisplayServiceParticipantSceneClientComponent;
  -[FBSSceneComponent setScene:](&v5, sel_setScene_, a3);
  objc_msgSend((id)SBApp, "sskExternalDisplayService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didConnectParticipant:", self);

}

- (void)invalidate
{
  void *v3;
  objc_super v4;

  objc_msgSend((id)SBApp, "sskExternalDisplayService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willDisconnectParticipant:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBSSKExternalDisplayServiceParticipantSceneClientComponent;
  -[FBSSceneComponent invalidate](&v4, sel_invalidate);
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  objc_msgSend(v4, "previousSettings");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isEqual:", v7);

}

- (FBSDisplayConfiguration)displayConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent clientScene](self, "clientScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSDisplayConfiguration *)v4;
}

- (BOOL)isActive
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent clientScene](self, "clientScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SSKDisplayEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasControlOfDisplay");

  return v4;
}

- (BOOL)isExtendedDisplayCapable
{
  void *v2;
  void *v3;
  void *v4;

  -[SBSSKExternalDisplayServiceParticipantSceneClientComponent displayConfiguration](self, "displayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalDisplayDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "displaySupportsExtendedDisplayMode:", v2);
  return (char)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_externalDisplayService, 0);
}

@end
