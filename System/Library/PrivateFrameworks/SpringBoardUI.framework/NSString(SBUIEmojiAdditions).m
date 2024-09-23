@implementation NSString(SBUIEmojiAdditions)

- (id)sbui_rangesOfEmojiTokens:()SBUIEmojiAdditions
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  NSRange v34;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  if (a3)
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  else
    v5 = 0;
  v27 = v5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3010000000;
  v20 = 0;
  v21 = 0;
  v19 = "";
  objc_msgSend(a1, "length");
  CEMEnumerateEmojiTokensInStringWithBlock();
  if (a3 && v23[5])
  {
    v6 = v17[4];
    v7 = v17[5];
    if (v7 + v6 < (unint64_t)objc_msgSend(a1, "length"))
    {
      v8 = v17[4];
      v9 = v17[5];
      v10 = objc_msgSend(a1, "length");
      v11 = v9 + v8;
      v34.length = v10 - (v17[4] + v17[5]);
      v12 = (void *)v23[5];
      v34.location = v11;
      NSStringFromRange(v34);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

    }
    *a3 = objc_retainAutorelease((id)v23[5]);
  }
  v14 = (id)v29[5];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v14;
}

@end
