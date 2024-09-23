@implementation _SBSceneRenderingEnvironmentParticipantHostComponent

- (void)setScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_SBSceneRenderingEnvironmentParticipantHostComponent;
  v5 = a3;
  -[FBSSceneComponent setScene:](&v12, sel_setScene_, v5);
  objc_msgSend((id)SBApp, "sceneRenderingEnvironmentManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneRenderingEnvironmentParticipantSceneExtension.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manager"));

  }
  objc_msgSend(v5, "loggingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerParticipantForSceneWithIdentifier:displayConfiguration:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBSceneRenderingEnvironmentParticipantHostComponent _setParticipant:](self, "_setParticipant:", v10);

}

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayConfiguration");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "previousSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v16;
  if (v16 != v9)
  {
    objc_msgSend((id)SBApp, "sceneRenderingEnvironmentManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneRenderingEnvironmentParticipantSceneExtension.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manager"));

    }
    -[FBSSceneComponent hostScene](self, "hostScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerParticipantForSceneWithIdentifier:displayConfiguration:", v13, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBSceneRenderingEnvironmentParticipantHostComponent _setParticipant:](self, "_setParticipant:", v14);

    v10 = v16;
  }

}

- (void)_setParticipant:(id)a3
{
  SBSceneRenderingEnvironmentParticipant *v5;
  SBSceneRenderingEnvironmentParticipant *participant;
  void *v7;
  void *v8;
  void *v9;
  SBSceneRenderingEnvironmentParticipant *v10;

  v5 = (SBSceneRenderingEnvironmentParticipant *)a3;
  participant = self->_participant;
  v10 = v5;
  if (participant != v5)
  {
    -[SBSceneRenderingEnvironmentParticipant invalidate](participant, "invalidate");
    objc_storeStrong((id *)&self->_participant, a3);
    -[FBSSceneComponent hostScene](self, "hostScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renderingEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneRenderingEnvironmentParticipant renderingEnvironmentIdentifier](v10, "renderingEnvironmentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSystemDisplayIdentifier:", v9);

  }
}

- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4
{
  SBSceneRenderingEnvironmentParticipant *participant;

  -[SBSceneRenderingEnvironmentParticipant invalidate](self->_participant, "invalidate", a3, a4);
  participant = self->_participant;
  self->_participant = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participant, 0);
}

@end
