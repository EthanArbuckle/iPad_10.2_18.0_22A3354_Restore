@implementation TTMergeableString(TTMergeableStringPersistenceAdditions)

- (void)initWithData:()TTMergeableStringPersistenceAdditions andReplicaID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "TTMergeableString protobuf corrupt.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "Corrupt mergeable string, bad string data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "Corrupt mergeable string, zeroed UUID timestamp.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "Corrupt mergeable string, length of substrings != attributedString length.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "Corrupt mergeable string, uuid index > number of uuids - loading empty string.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "Corrupt mergeable string, child substring index > number of substrings.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "Corrupt mergeable string, substring max > string max.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "Corrupt mergeable string, substring missing component.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
