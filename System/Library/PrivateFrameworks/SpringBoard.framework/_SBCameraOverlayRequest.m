@implementation _SBCameraOverlayRequest

- (_SBCameraOverlayRequest)initWithObservation:(id)a3
{
  id v4;
  _SBCameraOverlayRequest *v5;
  uint64_t v6;
  FBScene *sceneRequestingOverlay;
  uint64_t v8;
  BSAuditToken *auditTokenOfProcessRequestingOverlay;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SBCameraOverlayRequest;
  v5 = -[_SBCameraOverlayRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "cameraBehaviorScene");
    v6 = objc_claimAutoreleasedReturnValue();
    sceneRequestingOverlay = v5->_sceneRequestingOverlay;
    v5->_sceneRequestingOverlay = (FBScene *)v6;

    objc_msgSend(v4, "auditTokenForRequestingProcessOfCameraBehaviorScene");
    v8 = objc_claimAutoreleasedReturnValue();
    auditTokenOfProcessRequestingOverlay = v5->_auditTokenOfProcessRequestingOverlay;
    v5->_auditTokenOfProcessRequestingOverlay = (BSAuditToken *)v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  FBScene *sceneRequestingOverlay;
  uint64_t v7;
  id v8;
  void *v9;
  BSAuditToken *auditTokenOfProcessRequestingOverlay;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sceneRequestingOverlay = self->_sceneRequestingOverlay;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __35___SBCameraOverlayRequest_isEqual___block_invoke;
  v19[3] = &unk_1E8EA4320;
  v8 = v4;
  v20 = v8;
  objc_msgSend(v5, "appendObject:counterpart:", sceneRequestingOverlay, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  auditTokenOfProcessRequestingOverlay = self->_auditTokenOfProcessRequestingOverlay;
  v14 = v7;
  v15 = 3221225472;
  v16 = __35___SBCameraOverlayRequest_isEqual___block_invoke_2;
  v17 = &unk_1E8EA4320;
  v18 = v8;
  v11 = v8;
  objc_msgSend(v9, "appendObject:counterpart:", auditTokenOfProcessRequestingOverlay, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v12, "isEqual", v14, v15, v16, v17);

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_sceneRequestingOverlay);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_auditTokenOfProcessRequestingOverlay);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6;
}

- (FBScene)sceneRequestingOverlay
{
  return self->_sceneRequestingOverlay;
}

- (BSAuditToken)auditTokenOfProcessRequestingOverlay
{
  return self->_auditTokenOfProcessRequestingOverlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditTokenOfProcessRequestingOverlay, 0);
  objc_storeStrong((id *)&self->_sceneRequestingOverlay, 0);
}

@end
