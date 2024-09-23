@implementation STRemoteExtractor(STAEAExtractor)

+ (void)STAEAExtractorWithOptions:()STAEAExtractor .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

+ (void)STAEAExtractorWithOptions:()STAEAExtractor .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

+ (void)fullReplacementSTAEAExtractor:()STAEAExtractor .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

+ (void)incrementalPatchSTAEAExtractor:()STAEAExtractor srcDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

+ (void)incrementalPatchSTAEAExtractor:()STAEAExtractor srcDirectory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setSourceDirectory:()STAEAExtractor sandboxExtension:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s - Failed to get realpath for source dir, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setSourceDirectory:()STAEAExtractor sandboxExtension:.cold.2(uint64_t a1, NSObject *a2)
{
  int *v4;
  __int16 v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = __error();
  strerror(*v4);
  v7 = 136448002;
  v8 = "-[STRemoteExtractor(STAEAExtractor) setSourceDirectory:sandboxExtension:]";
  v9 = 2080;
  v10 = "-[STRemoteExtractor(STAEAExtractor) setSourceDirectory:sandboxExtension:]";
  v11 = 2080;
  OUTLINED_FUNCTION_3();
  v12 = a1;
  v13 = v5;
  v14 = v6;
  v15 = v5;
  v16 = "";
  v17 = v5;
  v18 = "/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STAEAExtractor.m";
  v19 = 1024;
  v20 = 183;
  _os_log_error_impl(&dword_2144F0000, a2, OS_LOG_TYPE_ERROR, "%{public}s: %s: AssertMacros: %s - Failed to get sandbox extension for \"%s\" : %s, %s file: %s, line: %d\n", (uint8_t *)&v7, 0x4Eu);
}

@end
