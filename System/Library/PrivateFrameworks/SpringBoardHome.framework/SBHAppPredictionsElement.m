@implementation SBHAppPredictionsElement

+ (id)elementIdentifier
{
  return CFSTR("com.apple.proactive.appprediction.panel");
}

+ (id)elementKind
{
  return CFSTR("SBHSpecialAvocadoDescriptorKindAppPredictions");
}

- (id)displayName
{
  void *v2;
  void *v3;

  SBHBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PROACTIVE_SUGGESTIONS_WIDGET_COLLECTION_NAME"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v11 = (void *)getAPUIAppPredictionViewControllerClass_softClass;
  v19 = getAPUIAppPredictionViewControllerClass_softClass;
  if (!getAPUIAppPredictionViewControllerClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getAPUIAppPredictionViewControllerClass_block_invoke;
    v15[3] = &unk_1E8D85AF8;
    v15[4] = &v16;
    __getAPUIAppPredictionViewControllerClass_block_invoke((uint64_t)v15);
    v11 = (void *)v17[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v12, "imageForIconSize:scale:", v9, v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)iconShouldIgnoreOtherDataSources:(id)a3
{
  return 1;
}

- (id)supportedGridSizeClasses
{
  return -[SBHIconGridSizeClassSet initWithGridSizeClass:]([SBHIconGridSizeClassSet alloc], "initWithGridSizeClass:", CFSTR("SBHIconGridSizeClassMedium"));
}

@end
