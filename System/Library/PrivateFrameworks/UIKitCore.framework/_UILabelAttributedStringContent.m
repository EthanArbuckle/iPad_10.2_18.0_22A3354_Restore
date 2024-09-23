@implementation _UILabelAttributedStringContent

- (BOOL)isAttributed
{
  void *v3;
  BOOL v4;
  void *v5;

  -[_UILabelAttributedStringContent string](self, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[_UILabelAttributedStringContent attributedString](self, "attributedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (id)string
{
  return -[NSAttributedString string](self->_attributedString, "string");
}

- (id)defaultValueForAttribute:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[_UILabelAttributedStringContent length](self, "length") < 1
    || (-[NSAttributedString attribute:atIndex:effectiveRange:](self->_attributedString, "attribute:atIndex:effectiveRange:", v4, 0, 0), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[NSDictionary objectForKeyedSubscript:](self->super._defaultAttributes, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (int64_t)length
{
  return -[NSAttributedString length](self->_attributedString, "length");
}

- (BOOL)isNil
{
  return self->_attributedString == 0;
}

- (BOOL)isWidthVariant
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UILabelAttributedStringContent initWithAttributedString:defaultAttributes:]([_UILabelAttributedStringContent alloc], "initWithAttributedString:defaultAttributes:", self->_attributedString, self->super._defaultAttributes);
}

- (_UILabelAttributedStringContent)initWithAttributedString:(id)a3 defaultAttributes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _UILabelAttributedStringContent *v9;
  id v10;
  uint64_t v11;
  _UILabelAttributedStringContent *v12;
  NSAttributedString *attributedString;
  _UILabelAttributedStringContent *v14;
  objc_super v16;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v16.receiver = self;
    v16.super_class = (Class)_UILabelAttributedStringContent;
    v8 = a4;
    v9 = -[_UILabelContent initWithDefaultAttributes:](&v16, sel_initWithDefaultAttributes_, v8);

    if (v9)
    {
      +[_NSAttributedStringIntentResolver attributedStringByResolvingString:](_UIAttributedStringIntentResolver, "attributedStringByResolvingString:", v7, v16.receiver, v16.super_class);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (dyld_program_sdk_at_least())
        v11 = objc_msgSend(v10, "copy");
      else
        v11 = objc_msgSend(v10, "mutableCopy");
      attributedString = v9->_attributedString;
      v9->_attributedString = (NSAttributedString *)v11;

    }
    else
    {
      v10 = v7;
    }
    v12 = v9;
    self = v12;
  }
  else
  {
    v10 = a4;
    v12 = -[_UILabelContent initWithDefaultAttributes:]([_UILabelContent alloc], "initWithDefaultAttributes:", v10);
  }
  v14 = v12;

  return v14;
}

- (_UILabelAttributedStringContent)contentWithAttributedString:(id)a3
{
  id v4;
  NSAttributedString *v5;
  NSAttributedString *v6;
  NSAttributedString *v7;
  int v8;
  _UILabelAttributedStringContent *v9;
  _UILabelAttributedStringContent *v10;

  v4 = a3;
  v5 = self->_attributedString;
  v6 = (NSAttributedString *)v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (!v6 || !v5)
    {

      if (!v7)
      {
        v9 = -[_UILabelContent initWithDefaultAttributes:]([_UILabelContent alloc], "initWithDefaultAttributes:", self->super._defaultAttributes);
        goto LABEL_11;
      }
      goto LABEL_9;
    }
    v8 = -[NSAttributedString isEqual:](v5, "isEqual:", v6);

    if (!v8)
    {
LABEL_9:
      v9 = -[_UILabelAttributedStringContent initWithAttributedString:defaultAttributes:]([_UILabelAttributedStringContent alloc], "initWithAttributedString:defaultAttributes:", v7, self->super._defaultAttributes);
      goto LABEL_11;
    }
  }
  v9 = self;
LABEL_11:
  v10 = v9;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightInertAttributedString, 0);
  objc_storeStrong((id *)&self->_lightReactiveAttributedString, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

- (id)attributedString
{
  return self->_attributedString;
}

- (_UILabelAttributedStringContent)contentWithString:(id)a3
{
  id v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  _UILabelStringContent *v21;
  _UILabelStringContent *v22;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  v5 = self->super._defaultAttributes;
  v6 = -[_UILabelAttributedStringContent length](self, "length");
  if (v6 >= 1)
  {
    v7 = v6;
    v24 = 0;
    v25 = 0;
    -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self->_attributedString, "attributesAtIndex:longestEffectiveRange:inRange:", 0, &v24, 0, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v25 == v7 && objc_msgSend(v8, "count"))
    {
      v10 = (void *)-[NSDictionary mutableCopy](self->super._defaultAttributes, "mutableCopy");
      objc_msgSend(v10, "addEntriesFromDictionary:", v9);
      v11 = v10;
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        v12 = *(_QWORD *)off_1E1678F98;
        -[NSDictionary objectForKeyedSubscript:](self->super._defaultAttributes, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F98);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "minimumLineHeight");
        v15 = v14;
        objc_msgSend(v13, "maximumLineHeight");
        v17 = v16;
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");

        objc_msgSend(v19, "setMinimumLineHeight:", v15);
        objc_msgSend(v19, "setMaximumLineHeight:", v17);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v12);

        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, *(_QWORD *)off_1E1679060);
      }
      objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)off_1E1678C28);
      objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)off_1E1678C48);

      if ((objc_msgSend(v11, "isEqual:", self->super._defaultAttributes) & 1) == 0)
      {
        v20 = (NSDictionary *)v11;

        v5 = v20;
      }

    }
  }
  if (v4)
    v21 = -[_UILabelStringContent initWithString:defaultAttributes:]([_UILabelStringContent alloc], "initWithString:defaultAttributes:", v4, v5);
  else
    v21 = -[_UILabelContent initWithDefaultAttributes:]([_UILabelContent alloc], "initWithDefaultAttributes:", v5);
  v22 = v21;

  return (_UILabelAttributedStringContent *)v22;
}

- (BOOL)isAttribute:(id)a3 uniformlyEqualToValue:(id)a4
{
  id v6;
  NSAttributedString *attributedString;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  attributedString = self->_attributedString;
  v8 = a3;
  v9 = -[NSAttributedString length](attributedString, "length");
  if (v9)
  {
    v10 = v9;
    v16 = 0;
    v17 = 0;
    -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_attributedString, "attribute:atIndex:longestEffectiveRange:inRange:", v8, 0, &v16, 0, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 != v17)
    {
      v12 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->super._defaultAttributes, "objectForKeyedSubscript:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = v11;
  v13 = v6;
  v14 = v13;
  if (v11 == v13)
  {
    v12 = 1;
  }
  else
  {
    v12 = 0;
    if (v13 && v11)
      v12 = objc_msgSend(v11, "isEqual:", v13);
  }

LABEL_11:
  return v12;
}

- (id)contentByApplyingAttribute:(id)a3 value:(id)a4 toRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  _UILabelAttributedStringContent *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _UILabelAttributedStringContent *v24;
  void *v25;
  void *v27;
  int v28;
  void *v29;
  objc_super v30;
  objc_super v31;
  uint64_t v32;
  uint64_t v33;

  length = a5.length;
  location = a5.location;
  v9 = a3;
  v10 = a4;
  if (location >= -[_UILabelAttributedStringContent length](self, "length"))
    goto LABEL_31;
  if (location + length >= -[_UILabelAttributedStringContent length](self, "length"))
    length = -[_UILabelAttributedStringContent length](self, "length") - location;
  if (!v9 || !length)
  {
LABEL_31:
    v30.receiver = self;
    v30.super_class = (Class)_UILabelAttributedStringContent;
    -[_UILabelContent contentByApplyingAttribute:value:toRange:](&v30, sel_contentByApplyingAttribute_value_toRange_, v9, v10, location, length);
    self = (_UILabelAttributedStringContent *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  v32 = 0;
  v33 = 0;
  -[NSAttributedString attribute:atIndex:effectiveRange:](self->_attributedString, "attribute:atIndex:effectiveRange:", v9, location, &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v32 != location || v33 != length)
    goto LABEL_26;
  v13 = v11;
  v14 = v10;
  v15 = v14;
  if (v13 != v14)
  {
    if (v14 && v13)
    {
      v16 = objc_msgSend(v13, "isEqual:", v14);

      if ((v16 & 1) == 0)
      {
        v17 = (void *)-[NSAttributedString mutableCopy](self->_attributedString, "mutableCopy");
        goto LABEL_27;
      }
      goto LABEL_14;
    }

    if (!v13)
    {
      -[NSDictionary objectForKeyedSubscript:](self->super._defaultAttributes, "objectForKeyedSubscript:", v9);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v15;
      v29 = v19;
      if (v19 == v20)
      {
        v23 = v20;

        v21 = v19;
      }
      else
      {
        if (!v15 || !v19)
        {

          v21 = v19;
LABEL_25:

          goto LABEL_26;
        }
        v21 = v19;
        v22 = v20;
        v28 = objc_msgSend(v29, "isEqual:", v20);

        if (!v28)
          goto LABEL_25;
      }
      v24 = self;

      goto LABEL_15;
    }
LABEL_26:
    v25 = (void *)-[NSAttributedString mutableCopy](self->_attributedString, "mutableCopy");
    v17 = v25;
    if (!v10)
    {
      objc_msgSend(v25, "removeAttribute:range:", v9, location, length);
      goto LABEL_29;
    }
LABEL_27:
    objc_msgSend(v17, "addAttribute:value:range:", v9, v10, location, length);
LABEL_29:
    if (!objc_msgSend(v17, "isEqualToAttributedString:", self->_attributedString))
    {
      v31.receiver = self;
      v31.super_class = (Class)_UILabelAttributedStringContent;
      -[_UILabelContent contentByApplyingAttribute:value:toRange:](&v31, sel_contentByApplyingAttribute_value_toRange_, v9, v10, location, length);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "contentWithAttributedString:", v17);
      self = (_UILabelAttributedStringContent *)objc_claimAutoreleasedReturnValue();

      goto LABEL_32;
    }

    goto LABEL_31;
  }

LABEL_14:
  v18 = self;
LABEL_15:

LABEL_32:
  return self;
}

- (BOOL)_isContentEqualToContent:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToAttributedString:", self->_attributedString))
  {
    v7.receiver = self;
    v7.super_class = (Class)_UILabelAttributedStringContent;
    v5 = -[_UILabelContent _isContentEqualToContent:](&v7, sel__isContentEqualToContent_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToAttributedString:(id)a3
{
  NSAttributedString *attributedString;

  attributedString = self->_attributedString;
  return attributedString == a3
      || -[NSAttributedString isEqualToAttributedString:](attributedString, "isEqualToAttributedString:");
}

- (BOOL)isEqualToString:(id)a3
{
  unint64_t v4;
  NSAttributedString *attributedString;
  char v6;
  void *v7;

  v4 = (unint64_t)a3;
  attributedString = self->_attributedString;
  if (v4 | (unint64_t)attributedString)
  {
    -[NSAttributedString string](attributedString, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v4);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isEqualToContent:(id)a3 byAttribute:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UILabelAttributedStringContent;
  if (!-[_UILabelContent isEqualToContent:byAttribute:](&v14, sel_isEqualToContent_byAttribute_, v6, v7))
    goto LABEL_5;
  v12 = 0;
  v13 = 0;
  -[NSAttributedString attribute:atIndex:effectiveRange:](self->_attributedString, "attribute:atIndex:effectiveRange:", v7, 0, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v9 != -[_UILabelAttributedStringContent length](self, "length"))
  {

LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "isAttribute:uniformlyEqualToValue:", v7, v8);

LABEL_6:
  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  objc_super v5;

  v3 = -[NSAttributedString hash](self->_attributedString, "hash");
  v5.receiver = self;
  v5.super_class = (Class)_UILabelAttributedStringContent;
  return -[_UILabelContent hash](&v5, sel_hash) + v3;
}

- (id)intelligenceLightAttributedStrings
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSAttributedString *attributedString;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;

  if (!-[NSAttributedString length](self->_attributedString, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[NSAttributedString mutableCopy](self->_attributedString, "mutableCopy");
  v5 = (void *)-[NSAttributedString mutableCopy](self->_attributedString, "mutableCopy");
  v6 = objc_msgSend(v5, "length");
  attributedString = self->_attributedString;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __69___UILabelAttributedStringContent_intelligenceLightAttributedStrings__block_invoke;
  v17 = &unk_1E16E6108;
  v18 = v5;
  v19 = v4;
  v8 = v4;
  v9 = v5;
  -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](attributedString, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("_NSIntelligenceLightReactiveAttributeName"), 0, v6, 0x100000, &v14);
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_msgSend(v8, "copy", v14, v15, v16, v17);
  objc_msgSend(v10, "setLightReactiveAttributedString:", v11);

  v12 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v10, "setLightInertAttributedString:", v12);

  return v10;
}

- (id)labelViewTextAttachments
{
  void *v3;
  NSAttributedString *attributedString;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  attributedString = self->_attributedString;
  v5 = *(_QWORD *)off_1E1678C48;
  v6 = -[NSAttributedString length](attributedString, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59___UILabelAttributedStringContent_labelViewTextAttachments__block_invoke;
  v10[3] = &unk_1E16B15D0;
  v7 = v3;
  v11 = v7;
  -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](attributedString, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v10);
  if (objc_msgSend(v7, "count"))
    v8 = (void *)objc_msgSend(v7, "copy");
  else
    v8 = 0;

  return v8;
}

@end
