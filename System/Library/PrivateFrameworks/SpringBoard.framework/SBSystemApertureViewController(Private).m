@implementation SBSystemApertureViewController(Private)

- (void)hostOrientationDidChangeTo:()Private withPreviousOrientation:context:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Participant's orientation is unknown?", a5, a6, a7, a8, 0);
}

- (void)hostOrientationDidChangeTo:()Private withPreviousOrientation:context:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  OUTLINED_FUNCTION_20_0();
  BSInterfaceOrientationDescription();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  BSInterfaceOrientationDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v1, v2, "Participant's previous orientation:(%@) does not match our previous view controller orientation:(%@) ", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_20();
}

@end
