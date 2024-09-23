@implementation NSAttributedString(ICQUIAdditions)

+ (id)spaceArrowAttributedStringWithBaseAttributes:()ICQUIAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x24BDD1688];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 8197);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  v8 = objc_msgSend(v7, "length");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB4B8]), "initWithData:ofType:", 0, 0);
  objc_msgSend(MEMORY[0x24BEBD640], "icqBundleImageNamed:", CFSTR("PresentationRightArrowBlue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v10);

  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendAttributedString:", v11);

  objc_msgSend(v7, "addAttributes:range:", v4, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x24BEBB330], &unk_24E436018, v8, objc_msgSend(v7, "length") - v8);
  v12 = (void *)objc_msgSend(v7, "copy");

  return v12;
}

+ (id)attributesForIndex:()ICQUIAdditions baseAttributes:
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCF48], "icqURLForIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x24BEBB388]);

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

+ (id)attributedStringWithFormat:()ICQUIAdditions attributes:links:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v43;

  v7 = a3;
  v41 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "length");
  v43 = (void *)objc_opt_new();
  v40 = v9;
  v10 = objc_msgSend(v7, "rangeOfString:options:range:", CFSTR("%@"), 2, 0, v9);
  v12 = v11;
  v13 = objc_msgSend(v8, "count");
  if (v13)
    v14 = v12;
  else
    v14 = 0;
  if (v13)
    v15 = v10;
  else
    v15 = 0x7FFFFFFFFFFFFFFFLL;
  v16 = 0;
  if (v14)
  {
    v17 = 0;
    v38 = v7;
    v39 = v8;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
      v18 = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attributesForIndex:baseAttributes:", v17, v41);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(v18, "substringWithRange:", v16, v15 - v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithString:attributes:", v22, v41);
      objc_msgSend(v43, "appendAttributedString:", v23);

      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v19, "text");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v26, v20);
      objc_msgSend(v43, "appendAttributedString:", v27);

      if ((objc_msgSend(v19, "options") & 1) != 0)
      {
        objc_msgSend(a1, "spaceArrowAttributedStringWithBaseAttributes:", v20);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "appendAttributedString:", v28);

      }
      v16 = v15 + v14;
      ++v17;

      v7 = v38;
      v29 = objc_msgSend(v38, "rangeOfString:options:range:", CFSTR("%@"), 2, v15 + v14, v40 - (v15 + v14));
      v31 = v30;
      v8 = v39;
      v32 = objc_msgSend(v39, "count");
      if (v17 >= v32)
        v14 = 0;
      else
        v14 = v31;
      if (v17 >= v32)
        v15 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v15 = v29;
    }
    while (v14);
  }
  v33 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(v7, "substringFromIndex:", v16);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v33, "initWithString:attributes:", v34, v41);
  objc_msgSend(v43, "appendAttributedString:", v35);

  v36 = (void *)objc_msgSend(v43, "copy");
  return v36;
}

@end
