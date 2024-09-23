@implementation BMUserFocusModeComputed(ATXExtras)

- (const)modeUpdateSourceAsString
{
  unsigned int v2;
  NSObject *v4;

  v2 = objc_msgSend(a1, "updateSource");
  if (v2 < 4)
    return off_1E942EB80[v2];
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[BMUserFocusModeComputed(ATXExtras) modeUpdateSourceAsString].cold.1(a1);

  return CFSTR("Unknown");
}

- (const)modeUpdateReasonAsString
{
  unsigned int v2;
  NSObject *v4;

  v2 = objc_msgSend(a1, "updateReason");
  if (v2 < 4)
    return off_1E942EBA0[v2];
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[BMUserFocusModeComputed(ATXExtras) modeUpdateReasonAsString].cold.1(a1);

  return CFSTR("Unknown");
}

- (const)modeSemanticTypeAsString
{
  unsigned int v2;
  NSObject *v4;

  v2 = objc_msgSend(a1, "semanticType") - 1;
  if (v2 < 0xB)
    return off_1E942EBC0[v2];
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[BMUserFocusModeComputed(ATXExtras) modeSemanticTypeAsString].cold.1(a1);

  return CFSTR("Unknown");
}

- (uint64_t)atx_dndModeSemanticType
{
  int v2;
  uint64_t result;
  NSObject *v4;
  NSObject *v5;

  v2 = objc_msgSend(a1, "semanticType");
  result = 4;
  switch(v2)
  {
    case 0:
      __atxlog_handle_modes();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        -[BMUserFocusModeComputed(ATXExtras) atx_dndModeSemanticType].cold.2(v4);

      return 0;
    case 1:
      return -1;
    case 2:
      return 0;
    case 3:
      return 1;
    case 4:
      return 2;
    case 5:
      return 3;
    case 6:
      return result;
    case 7:
      return 5;
    case 8:
      return 6;
    case 9:
      return 7;
    case 10:
      return 8;
    case 11:
      return 9;
    default:
      __atxlog_handle_modes();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMUserFocusModeComputed(ATXExtras) atx_dndModeSemanticType].cold.1(a1);

      return 0;
  }
}

- (void)modeUpdateSourceAsString
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "updateSource");
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_3(&dword_1D2C00000, v1, v2, "BMUserFocusModeComputedUpdateSource modeUpdateSourceAsString: undefined mode update source: %lu. Returning Unknown", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_1();
}

- (void)modeUpdateReasonAsString
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "updateReason");
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_3(&dword_1D2C00000, v1, v2, "BMUserFocusModeComputedUpdateReason modeUpdateReasonAsString: undefined mode update reason: %lu. Returning Unknown", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_1();
}

- (void)modeSemanticTypeAsString
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "semanticType");
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_3(&dword_1D2C00000, v1, v2, "BMUserFocusModeComputedSemanticType modeSemanticTypeAsString: undefined mode semantic type: %lu. Returning Unknown", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_1();
}

- (void)atx_dndModeSemanticType
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D2C00000, log, OS_LOG_TYPE_FAULT, "atx_dndModeSemanticType: Encountered BMUserFocusModeComputedSemanticTypeUnknown in computed mode stream. Returning DNDModeSemanticTypeDefault", v1, 2u);
}

@end
