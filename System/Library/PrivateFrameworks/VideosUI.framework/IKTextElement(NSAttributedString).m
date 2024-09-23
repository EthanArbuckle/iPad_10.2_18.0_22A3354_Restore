@implementation IKTextElement(NSAttributedString)

- (id)textAttributes
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (textAttributes_onceToken != -1)
    dispatch_once(&textAttributes_onceToken, &__block_literal_global_38);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attributedStringWithFont:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__IKTextElement_NSAttributedString__textAttributes__block_invoke_2;
  v8[3] = &unk_1E9F9BCD8;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0x100000, v8);

  return v6;
}

@end
