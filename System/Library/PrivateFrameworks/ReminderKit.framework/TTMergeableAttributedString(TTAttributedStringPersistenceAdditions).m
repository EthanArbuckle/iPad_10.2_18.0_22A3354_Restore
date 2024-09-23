@implementation TTMergeableAttributedString(TTAttributedStringPersistenceAdditions)

- (void)initWithArchive:()TTAttributedStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "TTMergeableAttributedString attribute length is not equal to string length.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithArchive:()TTAttributedStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "TTMergeableAttributedString cannot load attributes.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)attributesForRun:()TTAttributedStringPersistenceAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "TTMergeableAttributedString cannot load attachment without identifier/info.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)saveAttributes:()TTAttributedStringPersistenceAdditions toArchive:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "Saving hashtag without identifier!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)saveAttributes:()TTAttributedStringPersistenceAdditions toArchive:.cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = 4;
  v3 = 1024;
  v4 = a1;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Incorrect number of color components for foreground color. Expected %d and got %d", (uint8_t *)v2, 0xEu);
}

@end
