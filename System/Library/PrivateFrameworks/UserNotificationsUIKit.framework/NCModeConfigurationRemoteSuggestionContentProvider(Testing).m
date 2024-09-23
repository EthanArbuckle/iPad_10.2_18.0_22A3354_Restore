@implementation NCModeConfigurationRemoteSuggestionContentProvider(Testing)

+ (void)_localizedSummaryStringForSuggestionType:()Testing configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = a2;
  objc_msgSend(a3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3(&dword_1CFC3D000, v6, v7, "Ignoring invalid summary format: \"%{public}@\": %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_0();
}

+ (void)_localizedSummaryStringForSuggestionType:()Testing configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:.cold.2(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = OUTLINED_FUNCTION_4_0(a1);
  objc_msgSend(v2, "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 2024), "numberWithUnsignedInteger:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3(&dword_1CFC3D000, v7, v8, "Received unexpected notification management thread suggestion for mode configuration with configuration type %@ for scope %@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_0_0();
}

+ (void)_localizedSummaryStringForSuggestionType:()Testing configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:.cold.3(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v5 = OUTLINED_FUNCTION_4_0(a1);
  objc_msgSend(v2, "numberWithUnsignedInteger:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 2024), "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3(&dword_1CFC3D000, v8, v9, "Received unexpected notification management suggestion for mode configuration with configuration type %@ for scope %@", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_0_0();
}

+ (void)_localizedSummaryStringForSuggestionType:()Testing configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:.cold.4(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a1;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1CFC3D000, v6, v9, "Received unexpected notification management removal suggestion for mode configuration with configuration type %@ for scope %@", v10);

}

@end
