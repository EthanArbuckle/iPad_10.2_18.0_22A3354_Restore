@implementation NSAttributedString(REMCRMergeableStringDocument_Hashtags)

- (uint64_t)rem_hashtagAtIndex:()REMCRMergeableStringDocument_Hashtags effectiveRange:
{
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  return objc_msgSend(a1, "rem_hashtagAtIndex:effectiveRange:wantsLongestEffectiveRange:inRange:", a3, a4, 0, 0, v8);
}

- (uint64_t)rem_hashtagAtIndex:()REMCRMergeableStringDocument_Hashtags longestEffectiveRange:inRange:
{
  return objc_msgSend(a1, "rem_hashtagAtIndex:effectiveRange:wantsLongestEffectiveRange:inRange:", a3, a4, 1, a5, a6);
}

- (REMTTHashtag)rem_hashtagAtIndex:()REMCRMergeableStringDocument_Hashtags effectiveRange:wantsLongestEffectiveRange:inRange:
{
  REMTTHashtag *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  REMTTHashtag *v17;
  void *v18;
  REMTTHashtag *v19;
  NSObject *v20;

  if (objc_msgSend(a1, "length"))
  {
    if (a5)
      objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("_TTREMHashtag"), a3, a4, a6, a7);
    else
      objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("_TTREMHashtag"), a3, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    REMDynamicCast(v15, (uint64_t)v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = [REMTTHashtag alloc];
      objc_msgSend(v16, "objectIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[REMTTHashtag initWithObjectIdentifier:](v17, "initWithObjectIdentifier:", v18);

    }
    else
    {
      if (v14)
      {
        +[REMLog crdt](REMLog, "crdt");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[NSAttributedString(REMCRMergeableStringDocument_Hashtags) rem_hashtagAtIndex:effectiveRange:wantsLongestEffectiveRange:inRange:].cold.1((uint64_t)v14, a4);

      }
      v19 = 0;
    }
    v13 = v19;

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)rem_enumerateHashtagInRange:()REMCRMergeableStringDocument_Hashtags options:usingBlock:
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __108__NSAttributedString_REMCRMergeableStringDocument_Hashtags__rem_enumerateHashtagInRange_options_usingBlock___block_invoke;
  v12[3] = &unk_1E67F90E8;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("_TTREMHashtag"), a3, a4, a5, v12);

}

- (void)rem_hashtagAtIndex:()REMCRMergeableStringDocument_Hashtags effectiveRange:wantsLongestEffectiveRange:inRange:.cold.1(uint64_t a1, NSRange *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromRange(*a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "Unexpected Class of TTREMHashtagAttributeName objects found {value: %@, range: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

@end
