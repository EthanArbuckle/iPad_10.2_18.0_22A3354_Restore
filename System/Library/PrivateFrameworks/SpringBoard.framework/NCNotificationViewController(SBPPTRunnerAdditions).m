@implementation NCNotificationViewController(SBPPTRunnerAdditions)

- (id)pptLongLookWillPresentBlock
{
  return objc_getAssociatedObject(a1, &_SBPPTRunnerBannerLongLookWillPresentCompletion);
}

- (void)setPPTLongLookWillPresentBlock:()SBPPTRunnerAdditions
{
  id v4;

  if (a3)
  {
    v4 = (id)MEMORY[0x1D17E5550](a3);
    objc_setAssociatedObject(a1, &_SBPPTRunnerBannerLongLookWillPresentCompletion, v4, (void *)3);

  }
}

- (id)pptLongLookDidPresentBlock
{
  return objc_getAssociatedObject(a1, &_SBPPTRunnerBannerLongLookDidPresentCompletion);
}

- (void)setPPTLongLookDidPresentBlock:()SBPPTRunnerAdditions
{
  id v4;

  if (a3)
  {
    v4 = (id)MEMORY[0x1D17E5550](a3);
    objc_setAssociatedObject(a1, &_SBPPTRunnerBannerLongLookDidPresentCompletion, v4, (void *)3);

  }
}

- (id)pptLongLookWillDismissBlock
{
  return objc_getAssociatedObject(a1, &_SBPPTRunnerBannerLongLookWillDismissCompletion);
}

- (void)setPPTLongLookWillDismissBlock:()SBPPTRunnerAdditions
{
  id v4;

  if (a3)
  {
    v4 = (id)MEMORY[0x1D17E5550](a3);
    objc_setAssociatedObject(a1, &_SBPPTRunnerBannerLongLookWillDismissCompletion, v4, (void *)3);

  }
}

- (id)pptLongLookDidDismissBlock
{
  return objc_getAssociatedObject(a1, &_SBPPTRunnerBannerLongLookDidDismissCompletion);
}

- (void)setPPTLongLookDidDismissBlock:()SBPPTRunnerAdditions
{
  id v4;

  if (a3)
  {
    v4 = (id)MEMORY[0x1D17E5550](a3);
    objc_setAssociatedObject(a1, &_SBPPTRunnerBannerLongLookDidDismissCompletion, v4, (void *)3);

  }
}

- (void)_recapSwipePresentLongLook
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bounds");
  UIRectGetCenter();
  objc_msgSend(v1, "convertPoint:toView:", 0);
  objc_msgSend(v2, "_convertPointToSceneReferenceSpace:");
  v4 = v3;
  v6 = v5;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__NCNotificationViewController_SBPPTRunnerAdditions___recapSwipePresentLongLook__block_invoke;
  v7[3] = &__block_descriptor_48_e34_v16__0___RCPEventStreamComposer__8l;
  v7[4] = v4;
  v7[5] = v6;
  SBPPTSynthesizeEventsForEventActions(v7, 0);

}

- (id)_dismissControlOfPresentedLongLook
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_presentedLongLookViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_lookView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "_lookView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_recapDismissLongLookViaPullDown
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  objc_msgSend(a1, "_presentedLongLookViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_lookView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  UIRectGetCenter();
  objc_msgSend(v2, "convertPoint:toView:", 0);
  objc_msgSend(v3, "_convertPointToSceneReferenceSpace:");
  v5 = v4;
  v7 = v6;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__NCNotificationViewController_SBPPTRunnerAdditions___recapDismissLongLookViaPullDown__block_invoke;
  v8[3] = &__block_descriptor_48_e34_v16__0___RCPEventStreamComposer__8l;
  v8[4] = v5;
  v8[5] = v7;
  SBPPTSynthesizeEventsForEventActions(v8, 0);

}

- (void)_recapDismissLongLookViaTapOutside
{
  void *v1;
  void *v2;
  double MinX;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];
  CGRect v9;
  CGRect v10;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bounds");
  MinX = CGRectGetMinX(v9);
  objc_msgSend(v1, "bounds");
  objc_msgSend(v1, "convertPoint:toView:", 0, MinX, CGRectGetMaxY(v10));
  objc_msgSend(v2, "_convertPointToSceneReferenceSpace:");
  v5 = v4;
  v7 = v6;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__NCNotificationViewController_SBPPTRunnerAdditions___recapDismissLongLookViaTapOutside__block_invoke;
  v8[3] = &__block_descriptor_48_e34_v16__0___RCPEventStreamComposer__8l;
  v8[4] = v5;
  v8[5] = v7;
  SBPPTSynthesizeEventsForEventActions(v8, 0);

}

@end
