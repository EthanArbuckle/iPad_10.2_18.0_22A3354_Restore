@implementation WFVariableString(AttributedString)

- (void)initWithAttributedString:()AttributedString
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFVariableString+AttributedString.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[attributedString isKindOfClass:[NSAttributedString class]]"));

  }
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__WFVariableString_AttributedString__initWithAttributedString___block_invoke;
  v12[3] = &unk_24EE24888;
  v7 = v5;
  v13 = v7;
  v8 = (void *)objc_msgSend(a1, "initWithAttachmentCharacterString:variableGetter:", v6, v12);

  if (v8)
  {
    objc_setAssociatedObject(v8, sel_attributedString, v7, (void *)3);
    v9 = v8;
  }

  return v8;
}

- (id)attributedString
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, sel_attributedString);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v13 = sel_attributedString;
    v3 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = a1;
    objc_msgSend(a1, "stringsAndVariables");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v5)
      goto LABEL_14;
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v9);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_12;
          objc_msgSend(MEMORY[0x24BEC4180], "attributedStringWithVariable:", v9, v13);
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v11 = (void *)v10;
        objc_msgSend(v3, "appendAttributedString:", v10, v13);

LABEL_12:
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v6)
      {
LABEL_14:

        v2 = (void *)objc_msgSend(v3, "copy");
        objc_setAssociatedObject(v14, v13, v2, (void *)1);

        return v2;
      }
    }
  }
  return v2;
}

- (id)stringByReplacingCharactersInRange:()AttributedString withVariable:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  objc_msgSend(a1, "attributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(MEMORY[0x24BEC4180], "attributedStringWithVariable:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", a3, a4, v11);
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAttributedString:", v10);

  return v12;
}

- (id)stringByReplacingCharactersInRange:()AttributedString withVariableString:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  objc_msgSend(a1, "attributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v8, "attributedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", a3, a4, v11);
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAttributedString:", v10);

  return v12;
}

- (id)substringWithRange:()AttributedString
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedSubstringFromRange:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAttributedString:", v7);
  return v8;
}

- (id)attributedStringByAddingTypingAttributes:()AttributedString
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addAttributes:range:", v4, 0, objc_msgSend(v6, "length"));
  return v6;
}

+ (id)attributedStringWithVariable:()AttributedString
{
  id v3;
  WFVariableAttachment *v4;
  void *v5;

  v3 = a3;
  v4 = -[WFVariableAttachment initWithVariable:]([WFVariableAttachment alloc], "initWithVariable:", v3);

  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
