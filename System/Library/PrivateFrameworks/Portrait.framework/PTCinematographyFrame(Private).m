@implementation PTCinematographyFrame(Private)

- (void)_initWithCinematographyDictionary:()Private .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_1C9281000, a2, a3, "warning: no detection found from legacy coefficients dictionary %@", (uint8_t *)&v3);
}

- (void)focusOnNothing
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "error: focusing on nothing", v1, 2u);
}

@end
