@implementation UIWindowScene(SBSUIScreenSharingOverlaySceneSpecification)

- (void)SBSUI_preferredSystemRootLayerTransform
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a1, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSUIScreenSharingOverlaySceneSpecification.m"), 54, CFSTR("*** SBSUI_preferredSystemRootLayerTransform is unavailable for this window scene. If this message surprises you, contact your friendly SBSUI engineer. ***"));

  }
  objc_msgSend(a1, "_FBSScene");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredSystemRootTransform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "CGAffineTransformValue");
  }
  else
  {
    a3[1] = 0u;
    a3[2] = 0u;
    *a3 = 0u;
  }

}

- (void)setSBSUI_preferredSystemRootLayerTransform:()SBSUIScreenSharingOverlaySceneSpecification
{
  void *v6;
  __int128 v7;
  _QWORD v8[6];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  objc_msgSend(a1, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __105__UIWindowScene_SBSUIScreenSharingOverlaySceneSpecification__setSBSUI_preferredSystemRootLayerTransform___block_invoke;
  v8[3] = &unk_1E4C3EBA8;
  v8[4] = a1;
  v8[5] = a2;
  v7 = a3[1];
  v9 = *a3;
  v10 = v7;
  v11 = a3[2];
  objc_msgSend(v6, "updateClientSettings:", v8);

}

@end
