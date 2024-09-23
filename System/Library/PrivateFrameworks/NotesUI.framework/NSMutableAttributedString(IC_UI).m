@implementation NSMutableAttributedString(IC_UI)

- (void)ic_setParagraphStyleForWritingDirection:()IC_UI andAlignment:
{
  id v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  CFRange v13;

  v7 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  v12 = v7;
  if (a3 == -1)
  {
    objc_msgSend(a1, "string");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13.length = objc_msgSend(a1, "length");
    v13.location = 0;
    v9 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v8, v13);

    if (v9)
      a3 = objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v9) == 2;
    else
      a3 = -1;

    v7 = v12;
  }
  if ((a4 & (a3 != -1)) != 0)
    v10 = 2 * (a3 != 0);
  else
    v10 = 4;
  objc_msgSend(v7, "setAlignment:", v10);
  objc_msgSend(v12, "setBaseWritingDirection:", a3);
  v11 = *MEMORY[0x1E0DC1178];
  objc_msgSend(a1, "removeAttribute:range:", *MEMORY[0x1E0DC1178], 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "addAttribute:value:range:", v11, v12, 0, objc_msgSend(a1, "length"));

}

- (void)ic_addForegroundColorInRangesWhereNoColorAlreadyExists:()IC_UI
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v9 = a3;
  if (v9)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v5 = *MEMORY[0x1E0DC1140];
    v6 = objc_msgSend(a1, "length");
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__NSMutableAttributedString_IC_UI__ic_addForegroundColorInRangesWhereNoColorAlreadyExists___block_invoke;
    v12[3] = &unk_1E5C1E120;
    v13 = v4;
    v8 = v4;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v12);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __91__NSMutableAttributedString_IC_UI__ic_addForegroundColorInRangesWhereNoColorAlreadyExists___block_invoke_2;
    v10[3] = &unk_1E5C23588;
    v10[4] = a1;
    v11 = v9;
    objc_msgSend(v8, "enumerateRangesUsingBlock:", v10);

  }
}

@end
