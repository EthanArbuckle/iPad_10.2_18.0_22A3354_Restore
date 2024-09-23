@implementation _UIStatesFeedbackGeneratorPreviewConfiguration

+ (id)defaultConfiguration
{
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70___UIStatesFeedbackGeneratorPreviewConfiguration_defaultConfiguration__block_invoke;
  v4[3] = &__block_descriptor_40_e43_v16__0___UIFeedbackGeneratorConfiguration_8l;
  v4[4] = a1;
  objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("preview"), v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInitialState:", CFSTR("reveal"));
  objc_msgSend(v2, "setActivationStyle:", 1);
  return v2;
}

- (int64_t)requiredSupportLevel
{
  return 1;
}

- (BOOL)defaultEnabled
{
  return 1;
}

+ (id)revealState
{
  return CFSTR("reveal");
}

+ (id)previewState
{
  return CFSTR("preview");
}

+ (id)commitState
{
  return CFSTR("commit");
}

+ (id)cancelState
{
  return CFSTR("cancel");
}

@end
