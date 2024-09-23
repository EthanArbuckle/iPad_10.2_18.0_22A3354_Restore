@implementation _UIStatesFeedbackGeneratorSwipeActionConfiguration

+ (id)defaultConfiguration
{
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74___UIStatesFeedbackGeneratorSwipeActionConfiguration_defaultConfiguration__block_invoke;
  v4[3] = &__block_descriptor_40_e43_v16__0___UIFeedbackGeneratorConfiguration_8l;
  v4[4] = a1;
  objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("swipeAction"), v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInitialState:", CFSTR("resting"));
  return v2;
}

- (int64_t)requiredSupportLevel
{
  return 2;
}

- (int64_t)requiredPeripheralSupportLevel
{
  return 1;
}

+ (id)restingState
{
  return CFSTR("resting");
}

+ (id)openState
{
  return CFSTR("open");
}

+ (id)confirmState
{
  return CFSTR("confirm");
}

@end
