@implementation FBScene

uint64_t __63__FBScene_PRScene__pr_createPosterSceneWithRole_path_provider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serverIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

void __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a2;
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v5);

  objc_msgSend(MEMORY[0x1E0DC3488], "specification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSpecification:", v6);

  objc_msgSend(v7, "setClientIdentity:", *(_QWORD *)(a1 + 32));
}

void __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke_315(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke_2;
  v13[3] = &unk_1E2185CA0;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v16 = v5;
  v17 = v6;
  v7 = a2;
  objc_msgSend(v7, "updateSettingsWithBlock:", v13);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke_3;
  v10[3] = &unk_1E2185CC8;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v7, "updateClientSettingsWithBlock:", v10);

}

void __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "pui_setRole:", v3);
  objc_msgSend(*(id *)(a1 + 40), "serverIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pui_setProvider:", v6);

  objc_msgSend(*(id *)(a1 + 48), "pr_applyPosterPath:toSettings:", *(_QWORD *)(a1 + 40), v4);
  objc_msgSend(v4, "pr_posterConfiguredProperties");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "bls_setSupportsAlwaysOn:", objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D7FD98]));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "renderingConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v5, "pr_setDepthEffectDisabled:", objc_msgSend(v3, "isDepthEffectDisabled"));
    objc_msgSend(v5, "pr_setParallaxEnabled:", objc_msgSend(v4, "isParallaxEnabled"));
  }

}

@end
