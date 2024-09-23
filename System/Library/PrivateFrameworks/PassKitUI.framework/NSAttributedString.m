@implementation NSAttributedString

void __87__NSAttributedString_PKUIUtilities__pkui_sizeThatFits_withNumberOfLines_forceWordWrap___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a2;
  v8 = *MEMORY[0x1E0DC1178];
  v13 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "setLineBreakMode:", 0);
    v12 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v8);
    objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v12, a3, a4);

  }
}

@end
