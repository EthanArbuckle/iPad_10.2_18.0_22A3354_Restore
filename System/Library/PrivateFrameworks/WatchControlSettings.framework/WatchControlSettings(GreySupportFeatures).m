@implementation WatchControlSettings(GreySupportFeatures)

- (void)setWatchControlHandGeturesEnabled:()GreySupportFeatures .cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  NSStringFromBOOL();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_22D269000, v1, v2, "Set AssistiveTouch hand gestures: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)setVoiceOverHandGestures:()GreySupportFeatures .cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  NSStringFromBOOL();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_22D269000, v1, v2, "Set VoiceOver hand gestures: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)setZoomHandGestures:()GreySupportFeatures .cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  NSStringFromBOOL();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_22D269000, v1, v2, "Set zoom hand gestures: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)disableAllGreySupportFeatures
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22D269000, v0, v1, "Disable AssistiveTouch since it is an active grey source.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
