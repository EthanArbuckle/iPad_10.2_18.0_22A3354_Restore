@implementation NSMutableAttributedString(ReminderKitAdditions)

- (BOOL)rem_replaceTTREMHashtag:()ReminderKitAdditions withTTREMHashtag:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v16;
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3010000000;
  v23 = &unk_1B4BA3356;
  v24 = xmmword_1B4B743E0;
  v8 = objc_msgSend(a1, "length");
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __92__NSMutableAttributedString_ReminderKitAdditions__rem_replaceTTREMHashtag_withTTREMHashtag___block_invoke;
  v16 = &unk_1E67F9098;
  v17 = a1;
  v9 = v6;
  v18 = v9;
  v19 = &v20;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("_TTREMHashtag"), 0, v8, 0, &v13);
  v10 = v21[4];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "removeAttribute:range:", CFSTR("_TTREMHashtag"), v21[4], v21[5], v13, v14, v15, v16, v17);
    v25 = CFSTR("_TTREMHashtag");
    v26[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setAttributes:range:", v11, v21[4], v21[5]);

  }
  _Block_object_dispose(&v20, 8);

  return v10 != 0x7FFFFFFFFFFFFFFFLL;
}

@end
