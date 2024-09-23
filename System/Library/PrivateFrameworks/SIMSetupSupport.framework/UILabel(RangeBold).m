@implementation UILabel(RangeBold)

- (void)setBoldSubString:()RangeBold
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  objc_msgSend(a1, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:", v4);
  v8 = v7;

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(a1, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pointSize");
    objc_msgSend(v9, "fontWithDescriptor:size:", v12);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "attributedText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(a1, "attributedText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "mutableCopy");
    }
    else
    {
      v17 = objc_alloc(MEMORY[0x24BDD1688]);
      objc_msgSend(a1, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v17, "initWithString:", v15);
    }
    v18 = (void *)v16;

    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x24BEBB360], v20, v6, v8);
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(a1, "setAttributedText:", v19);

  }
}

- (void)setColor:()RangeBold toSubstring:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_msgSend(a1, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rangeOfString:options:", v6, 4);
  v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "attributedText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(a1, "attributedText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "mutableCopy");
    }
    else
    {
      v14 = objc_alloc(MEMORY[0x24BDD1688]);
      objc_msgSend(a1, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "initWithString:", v12);
    }
    v15 = (void *)v13;

    objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x24BEBB368], v17, v8, v10);
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(a1, "setAttributedText:", v16);

  }
}

@end
