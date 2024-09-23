@implementation NSMutableAttributedString(ICTableAdditions)

- (void)ic_addTextBlocks:()ICTableAdditions range:
{
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v8 = a3;
  v15 = 0;
  v16 = 0;
  if (a4 < a4 + a5)
  {
    v9 = 0;
    v10 = *MEMORY[0x1E0DC1178];
    v11 = a4;
    do
    {
      v12 = v9;
      objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v10, v11, &v15, a4, a5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v13 = (void *)objc_msgSend(v9, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v14, "mutableCopy");

      }
      objc_msgSend(v13, "setTextBlocks:", v8, v15, v16);
      objc_msgSend(a1, "addAttribute:value:range:", v10, v13, v15, v16);
      v11 = v16 + v15;

    }
    while (v11 < a4 + a5);

  }
}

- (void)ic_convertParagraphStyleToBodyInRange:()ICTableAdditions
{
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D63928];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__NSMutableAttributedString_ICTableAdditions__ic_convertParagraphStyleToBodyInRange___block_invoke;
  v10[3] = &unk_1E5C21AC0;
  v10[4] = a1;
  v11 = v7;
  v9 = v7;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, a3, a4, 0, v10);

}

@end
