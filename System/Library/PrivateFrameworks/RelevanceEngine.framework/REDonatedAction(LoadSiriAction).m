@implementation REDonatedAction(LoadSiriAction)

- (void)loadUserActivity:()LoadSiriAction .cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2_4();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_4(&dword_2132F7000, v4, v5, "Core duet unavailable for activity (event) with bundle ID: %@ (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_3_4();
}

@end
