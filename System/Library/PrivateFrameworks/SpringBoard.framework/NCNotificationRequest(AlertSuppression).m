@implementation NCNotificationRequest(AlertSuppression)

- (uint64_t)sb_shouldSuppressAlert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutStatePrimaryElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workspaceEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationSceneEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sceneIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v8, "isForeground") && (objc_msgSend(v8, "isOccluded") & 1) == 0)
  {
    objc_msgSend(v6, "application");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "suppressesAlertsWhenAppIsActive") & 1) != 0)
    {
      objc_msgSend(a1, "sectionIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v12);

      if ((v15 & 1) != 0)
      {
        v9 = 1;
LABEL_14:

        goto LABEL_5;
      }
    }
    else
    {

    }
    objc_msgSend(a1, "options");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alertSuppressionContexts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sectionIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "shouldSuppressAlertForSuppressionContexts:sectionIdentifier:", v17, v18) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(a1, "options");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "alertSuppressionContexts");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "parentSectionIdentifier");
      v23 = v11;
      v21 = v12;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "shouldSuppressAlertForSuppressionContexts:sectionIdentifier:", v20, v22);

      v12 = v21;
      v11 = v23;

    }
    goto LABEL_14;
  }
  v9 = 0;
LABEL_5:

  return v9;
}

@end
