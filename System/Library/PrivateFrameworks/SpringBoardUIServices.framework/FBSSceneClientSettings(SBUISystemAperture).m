@implementation FBSSceneClientSettings(SBUISystemAperture)

- (id)SBUISA_elementIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_stringforSetting:", 3213043);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)SBUISA_contentRole
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_contentRoleforSetting:", 3213018);

  return v2;
}

- (uint64_t)SBUISA_preferredLayoutMode
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_layoutModeforSetting:", 3213019);

  return v2;
}

- (uint64_t)SBUISA_minimumLayoutMode
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_layoutModeforSetting:", 3213020);

  return v2;
}

- (uint64_t)SBUISA_maximumLayoutMode
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_layoutModeforSetting:", 3213021);

  return v2;
}

- (uint64_t)SBUISA_appliedLayoutMode
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_layoutModeforSetting:", 3213022);

  return v2;
}

- (id)SBUISA_associatedScenePersistenceIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_stringforSetting:", 3213023);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)SBUISA_associatedAppBundleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_stringforSetting:", 3213037);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)SBUISA_launchURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_URLforSetting:", 3213051);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)SBUISA_launchAction
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_BSActionforSetting:", 3213052);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)SBUISA_preferredLeadingViewSize
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_CGSizeforSetting:", 3213024);
  v3 = v2;

  return v3;
}

- (double)SBUISA_preferredTrailingViewSize
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_CGSizeforSetting:", 3213025);
  v3 = v2;

  return v3;
}

- (double)SBUISA_preferredMinimalViewSize
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_CGSizeforSetting:", 3213026);
  v3 = v2;

  return v3;
}

- (double)SBUISA_preferredDetachedMinimalViewSize
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_CGSizeforSetting:", 3213027);
  v3 = v2;

  return v3;
}

- (uint64_t)SBUISA_leadingViewRenderingId
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_renderingIdforSetting:", 3213029);

  return v2;
}

- (uint64_t)SBUISA_trailingViewRenderingId
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_renderingIdforSetting:", 3213030);

  return v2;
}

- (uint64_t)SBUISA_minimalViewRenderingId
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_renderingIdforSetting:", 3213031);

  return v2;
}

- (uint64_t)SBUISA_detachedMinimalViewRenderingId
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_renderingIdforSetting:", 3213032);

  return v2;
}

- (uint64_t)SBUISA_contextId
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_contextIdforSetting:", 3213028);

  return v2;
}

- (double)SBUISA_customLayoutPreferredOutsetsFromUnsafeArea
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_directionalEdgeInsetsforSetting:", 3213033);
  v3 = v2;

  return v3;
}

- (id)SBUISA_backgroundActivitiesToSuppress
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_backgroundActivityIdentifiersForSetting:", 3213034);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)SBUISA_preferredCustomAspectRatio
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_CGSizeforSetting:", 3213035);
  v3 = v2;

  return v3;
}

- (uint64_t)SBUISA_preferredCustomLayout
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_customLayoutModeforSetting:", 3213036);

  return v2;
}

- (uint64_t)SBUISA_hasMenuPresentation
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 3213038);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)SBUISA_presentationBehaviors
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "SBUISA_presentationBehaviorsForSetting:", 3213039);

  return v2;
}

- (BOOL)SBUISA_specifiesPreferredPaddingForCompactLayout
{
  void *v1;
  void *v2;
  double v3;
  _BOOL8 v4;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 3213040);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "directionalEdgeInsetsValue");
    v4 = v3 != *MEMORY[0x1E0CEBDE0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)SBUISA_attachedMinimalViewRequiresZeroPadding
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 3213041);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)SBUISA_prefersFixedPortraitOrientation
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 3213042);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (double)SBUISA_preferredPaddingForCompactLayout
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_directionalEdgeInsetsforSetting:", 3213040);
  v3 = v2;

  return v3;
}

- (uint64_t)SBUISA_preventsInteractiveDismissal
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 3213048);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)SBUISA_preventsAutomaticDismissal
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 3213049);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)SBUISA_leadingViewAccessibilityLabel
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_stringforSetting:", 3213044);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)SBUISA_trailingViewAccessibilityLabel
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_stringforSetting:", 3213045);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)SBUISA_minimalViewAccessibilityLabel
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_stringforSetting:", 3213046);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)SBUISA_detachedMinimalViewAccessibilityLabel
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_stringforSetting:", 3213047);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)SBUISA_keyColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUISA_UIColorForSetting:", 3213050);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)SBUI_systemApertureDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "SBUI_systemApertureDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)SBUI_systemApertureDescriptionOfDiffFromSettings:()SBUISystemAperture
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "otherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "SBUI_systemApertureDescriptionOfDiffFromSettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
