@implementation PEEditSessionEventBuilder(LegacyEventsBuilder)

- (id)initWithLegacyEnterEditEvent:()LegacyEventsBuilder andExitEvent:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = a1;
  v12.super_class = (Class)&off_1EED30BD0;
  v8 = objc_msgSendSuper2(&v12, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAsset:", v9);

    objc_msgSend(v6, "enterEditDuration");
    objc_msgSend(v8, "setEnterEditDuration:");
    objc_msgSend(v6, "resourceCheckingDuration");
    objc_msgSend(v8, "setResourceCheckingDuration:");
    objc_msgSend(v6, "resourceDownloadDuration");
    objc_msgSend(v8, "setResourceDownloadDuration:");
    objc_msgSend(v6, "resourceLoadingDuration");
    objc_msgSend(v8, "setResourceLoadingDuration:");
    objc_msgSend(v6, "autoCalcDuration");
    objc_msgSend(v8, "setAutoCalcDuration:");
    objc_msgSend(v8, "setSessionEndReason:", objc_msgSend(v7, "sessionEndReason"));
    objc_msgSend(v7, "exitEditDuration");
    objc_msgSend(v8, "setExitEditDuration:");
    objc_msgSend(v8, "setFirstSinceLaunch:", objc_msgSend(v7, "isFirstSinceLaunch"));
    objc_msgSend(v7, "compositionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompositionController:", v10);

    objc_msgSend(v8, "setSaveActionType:", objc_msgSend(v7, "saveActionType"));
  }

  return v8;
}

@end
