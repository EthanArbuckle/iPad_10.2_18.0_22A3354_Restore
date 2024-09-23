@implementation MCDRadioMusicKitContentManager

- (id)_modelRequest
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _Unwind_Exception *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = (void *)objc_opt_new(MPModelStoreBrowseRequest);
  objc_msgSend(v3, "setFilteringPolicy:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v5 = objc_opt_respondsToSelector(v4, "parentSection");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentSection"));
    objc_msgSend(v3, "configureWithParentSection:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v9 = objc_opt_respondsToSelector(v8, "domain");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    objc_msgSend(v3, "setDomain:", objc_msgSend(v10, "domain"));

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v11 = (_QWORD *)qword_1011ECE58;
  v26 = qword_1011ECE58;
  if (!qword_1011ECE58)
  {
    v12 = (void *)sub_100032FDC();
    v11 = dlsym(v12, "MCDMusicCarPlayBundleIdentifier");
    v24[3] = (uint64_t)v11;
    qword_1011ECE58 = (uint64_t)v11;
  }
  _Block_object_dispose(&v23, 8);
  if (!v11)
  {
    sub_100DE9368();
LABEL_23:
    sub_100DE9368();
    goto LABEL_24;
  }
  objc_msgSend(v3, "setClientIdentifier:", *v11, v23);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v13 = (_QWORD *)qword_1011ECE68;
  v26 = qword_1011ECE68;
  if (!qword_1011ECE68)
  {
    v14 = (void *)sub_100032FDC();
    v13 = dlsym(v14, "MCDMusicCarPlayVersion");
    v24[3] = (uint64_t)v13;
    qword_1011ECE68 = (uint64_t)v13;
  }
  _Block_object_dispose(&v23, 8);
  if (!v13)
    goto LABEL_23;
  objc_msgSend(v3, "setClientVersion:", *v13, v23);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v15 = (_QWORD *)qword_1011ECE70;
  v26 = qword_1011ECE70;
  if (!qword_1011ECE70)
  {
    v16 = (void *)sub_100032FDC();
    v15 = dlsym(v16, "MCDMusicCarPlayPlatformIdentifier");
    v24[3] = (uint64_t)v15;
    qword_1011ECE70 = (uint64_t)v15;
  }
  _Block_object_dispose(&v23, 8);
  if (!v15)
  {
LABEL_24:
    v22 = (_Unwind_Exception *)sub_100DE9368();
    _Block_object_dispose(&v23, 8);
    _Unwind_Resume(v22);
  }
  objc_msgSend(v3, "setClientPlatformIdentifier:", *v15, v23);
  objc_msgSend(v3, "setRequestEndpoint:", 1);
  objc_msgSend(v3, "setAuthenticationOptions:", 1);
  v17 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mobileipod"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "musicSubscriptionStatus"));

  if ((objc_msgSend(v17, "BOOLForKey:", CFSTR("UserRequestedSubscriptionHidden")) & 1) != 0)
  {
    v20 = 3;
LABEL_20:
    objc_msgSend(v3, "setSubscriptionStatus:", v20);
    goto LABEL_21;
  }
  if (v19)
  {
    if (objc_msgSend(v19, "hasCapability:", 1))
      v20 = 1;
    else
      v20 = 2;
    goto LABEL_20;
  }
LABEL_21:
  objc_msgSend(v3, "setAdditionalContent:", 1);
  objc_msgSend(v3, "setOptions:", 7);

  return v3;
}

- (void)_initiatePlaybackForItem:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_opt_class(MPModelStoreBrowseSection);
  if ((objc_opt_isKindOfClass(v13, v4) & 1) != 0)
  {
    v5 = v13;
    if (!objc_msgSend(v5, "hasLoadedValueForKey:", MPModelStoreBrowseSectionRelationshipRadioStation))
    {
LABEL_7:

      v12 = v13;
      goto LABEL_8;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager playbackManager](self, "playbackManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "radioStation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "combinedPlayActivityFeatureName"));
    objc_msgSend(v6, "initiatePlaybackForRadioStation:lastResponse:shuffled:playActivityFeatureName:", v7, 0, 0, v9);

LABEL_6:
    goto LABEL_7;
  }
  v10 = objc_opt_class(MPModelStoreBrowseContentItem);
  isKindOfClass = objc_opt_isKindOfClass(v13, v10);
  v12 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager playbackManager](self, "playbackManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "combinedPlayActivityFeatureName"));
    objc_msgSend(v5, "initiatePlaybackForRadioStation:lastResponse:shuffled:playActivityFeatureName:", v13, 0, 0, v7);
    goto LABEL_6;
  }
LABEL_8:

}

- (id)nextUpcomingShowStartTime
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100032E4C;
  v11 = sub_100032E5C;
  v12 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "results"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100032E64;
  v6[3] = &unk_1010A9600;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateSectionsUsingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

@end
