@implementation NSMutableAttributedString(REMCRMergeableStringDocument_Hashtags)

- (void)rem_addHashtag:()REMCRMergeableStringDocument_Hashtags range:
{
  id v8;
  unint64_t v9;
  TTREMHashtag *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  TTREMHashtag *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  NSRange v21;
  NSRange v22;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    +[REMLog crdt](REMLog, "crdt");
    v10 = (TTREMHashtag *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    {
      v22.location = a4;
      v22.length = a5;
      -[NSMutableAttributedString(REMCRMergeableStringDocument_Hashtags) rem_addHashtag:range:].cold.1((int)a1, v22);
    }
    goto LABEL_12;
  }
  v9 = objc_msgSend(a1, "length");
  if (a4 >= v9)
    a4 = v9;
  if (a4 + a5 > v9)
    a5 = v9 - a4;
  if (a5)
  {
    v10 = objc_alloc_init(TTREMHashtag);
    objc_msgSend(v8, "objectIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTREMHashtag setObjectIdentifier:](v10, "setObjectIdentifier:", v11);

    objc_msgSend(a1, "addAttribute:value:range:", CFSTR("_TTREMHashtag"), v10, a4, a5);
    +[REMLog crdt](REMLog, "crdt");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v21.location = a4;
      v21.length = a5;
      NSStringFromRange(v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134218498;
      v15 = a1;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1B4A39000, v12, OS_LOG_TYPE_INFO, "Added TTREMHashtag to this NSMutableAttributedString {self: %p, value: %@, range: %@}", (uint8_t *)&v14, 0x20u);

    }
LABEL_12:

  }
}

- (unint64_t)rem_removeHashtagInRange:()REMCRMergeableStringDocument_Hashtags
{
  unint64_t result;
  unint64_t v8;
  unint64_t v9;

  result = objc_msgSend(a1, "length");
  if (a3 >= result)
    v8 = result;
  else
    v8 = a3;
  if (v8 + a4 <= result)
    v9 = a4;
  else
    v9 = result - v8;
  if (v9)
    return objc_msgSend(a1, "removeAttribute:range:", CFSTR("_TTREMHashtag"));
  return result;
}

- (void)rem_addHashtag:()REMCRMergeableStringDocument_Hashtags range:.cold.1(int a1, NSRange range)
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
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "Invalid nil value provided when trying to -rem_addHashtag:range: to this NSMutableAttributedString {self: %p, range: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

@end
