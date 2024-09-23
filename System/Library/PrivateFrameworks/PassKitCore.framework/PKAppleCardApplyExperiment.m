@implementation PKAppleCardApplyExperiment

- (id)namespaceName
{
  return CFSTR("WALLET_APP_BROADWAY_APPLY");
}

- (id)variant
{
  return -[PKExperiment stringForFactor:](self, "stringForFactor:", CFSTR("variant"));
}

- (id)heroImagePath
{
  const __CFString *v3;

  if (PKScreenScale() <= 2.0)
    v3 = CFSTR("image_hero_2x");
  else
    v3 = CFSTR("image_hero_3x");
  return -[PKExperiment filePathForFactor:](self, "filePathForFactor:", v3);
}

- (id)heroInstallmentImagePath
{
  const __CFString *v3;

  if (PKScreenScale() <= 2.0)
    v3 = CFSTR("image_hero_installment_2x");
  else
    v3 = CFSTR("image_hero_installment_3x");
  return -[PKExperiment filePathForFactor:](self, "filePathForFactor:", v3);
}

- (id)experimentDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKAppleCardApplyExperiment;
  -[PKExperiment experimentDetails](&v8, sel_experimentDetails);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PKAppleCardApplyExperiment variant](self, "variant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safelySetObject:forKey:", v5, CFSTR("variant"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

@end
