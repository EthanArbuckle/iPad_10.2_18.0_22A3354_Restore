@implementation NSAttributedString

void __108__NSAttributedString_REMCRMergeableStringDocument_Hashtags__rem_enumerateHashtagInRange_options_usingBlock___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  REMTTHashtag *v10;
  void *v11;
  REMTTHashtag *v12;
  NSObject *v13;
  NSRange v14;

  v7 = a2;
  v8 = objc_opt_class();
  REMDynamicCast(v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = [REMTTHashtag alloc];
    objc_msgSend(v9, "objectIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[REMTTHashtag initWithObjectIdentifier:](v10, "initWithObjectIdentifier:", v11);

  }
  else
  {
    if (v7)
    {
      +[REMLog crdt](REMLog, "crdt");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14.location = a3;
        v14.length = a4;
        __108__NSAttributedString_REMCRMergeableStringDocument_Hashtags__rem_enumerateHashtagInRange_options_usingBlock___block_invoke_cold_1((int)v7, v14);
      }

    }
    v12 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __108__NSAttributedString_REMCRMergeableStringDocument_Hashtags__rem_enumerateHashtagInRange_options_usingBlock___block_invoke_cold_1(int a1, NSRange range)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromRange(range);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "Unexpected Class of TTREMHashtagAttributeName objects found in enumeration {value: %@, range: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

@end
