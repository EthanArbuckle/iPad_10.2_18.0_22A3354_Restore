@implementation _SBKeyboardServiceSceneResolver

- (id)sceneForSceneIdentityToken:(id)a3 inProcess:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  SBSystemUIScenesCoordinator *systemUIScenesCoordinator;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneFromIdentityToken:", v6);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)v17[5];
  if (!v8)
  {
    systemUIScenesCoordinator = self->_systemUIScenesCoordinator;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72___SBKeyboardServiceSceneResolver_sceneForSceneIdentityToken_inProcess___block_invoke;
    v12[3] = &unk_1E8E9E2C0;
    v15 = a4;
    v13 = v6;
    v14 = &v16;
    -[SBSystemUIScenesCoordinator enumerateScenesWithBlock:](systemUIScenesCoordinator, "enumerateScenesWithBlock:", v12);

    v8 = (void *)v17[5];
  }
  v10 = v8;
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (SBSystemUIScenesCoordinator)systemUIScenesCoordinator
{
  return self->_systemUIScenesCoordinator;
}

- (void)setSystemUIScenesCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_systemUIScenesCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemUIScenesCoordinator, 0);
}

@end
