@implementation _UILabelContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
}

- (BOOL)isAttribute:(id)a3 uniformlyEqualToValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v6 = a4;
  -[_UILabelContent defaultValueForAttribute:](self, "defaultValueForAttribute:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {
    v10 = 1;
  }
  else
  {
    v10 = 0;
    if (v8 && v7)
      v10 = objc_msgSend(v7, "isEqual:", v8);
  }

  return v10;
}

- (id)defaultValueForAttribute:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_defaultAttributes, "objectForKeyedSubscript:", a3);
}

- (id)font
{
  return -[_UILabelContent defaultValueForAttribute:](self, "defaultValueForAttribute:", *(_QWORD *)off_1E1678D90);
}

- (id)contentByApplyingAttributeToEntireRange:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[_UILabelContent contentByApplyingAttribute:value:toRange:](self, "contentByApplyingAttribute:value:toRange:", v7, v6, 0, -[_UILabelContent length](self, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)contentByApplyingAttribute:(id)a3 value:(id)a4 toRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _UILabelContent *v14;
  id v15;
  id v16;
  void *v17;
  char v18;

  length = a5.length;
  location = a5.location;
  v9 = a3;
  v10 = a4;
  if (v9 && !location && length == -[_UILabelContent length](self, "length"))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_defaultAttributes, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v10 && v11)
    {
      v13 = (void *)-[NSDictionary mutableCopy](self->_defaultAttributes, "mutableCopy");
      objc_msgSend(v13, "removeObjectForKey:", v9);
      -[_UILabelContent contentWithDefaultAttributes:](self, "contentWithDefaultAttributes:", v13);
      v14 = (_UILabelContent *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      goto LABEL_15;
    }
    if (v10)
    {
      v15 = v11;
      v16 = v10;
      v17 = v16;
      if (v15 == v16)
      {

      }
      else
      {
        if (!v12)
        {

LABEL_17:
          -[_UILabelContent contentByAddingAttribute:toDefaultAttributesWithValue:](self, "contentByAddingAttribute:toDefaultAttributesWithValue:", v9, v17);
          v14 = (_UILabelContent *)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
        v18 = objc_msgSend(v15, "isEqual:", v16);

        if ((v18 & 1) == 0)
          goto LABEL_17;
      }
    }

  }
  v14 = self;
LABEL_15:

  return v14;
}

- (id)contentByAddingAttribute:(id)a3 toDefaultAttributesWithValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  _UILabelContent *v12;
  void *v13;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_defaultAttributes, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {

  }
  else
  {
    if (!v9 || !v8)
    {

LABEL_9:
      v15 = v6;
      v16[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILabelContent contentByAddingAttributesToDefaultAttributes:](self, "contentByAddingAttributesToDefaultAttributes:", v13);
      v12 = (_UILabelContent *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    v11 = objc_msgSend(v8, "isEqual:", v9);

    if (!v11)
      goto LABEL_9;
  }
  v12 = self;
LABEL_10:

  return v12;
}

- (id)contentByAddingAttributesToDefaultAttributes:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *defaultAttributes;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  int v10;
  _UILabelContent *v11;
  _UILabelContent *v12;
  uint64_t v14;
  NSDictionary *v15;

  v4 = a3;
  if (!v4)
  {
LABEL_12:
    v11 = self;
    goto LABEL_13;
  }
  if (-[NSDictionary count](self->_defaultAttributes, "count"))
  {
    if (objc_msgSend(v4, "count"))
    {
      v5 = (void *)-[NSDictionary mutableCopy](self->_defaultAttributes, "mutableCopy");
      objc_msgSend(v5, "addEntriesFromDictionary:", v4);
      defaultAttributes = self->_defaultAttributes;
      v7 = v5;
      v8 = defaultAttributes;
      if (v7 == v8)
      {

      }
      else
      {
        v9 = v8;
        if (!v7 || !v8)
        {

LABEL_16:
          v12 = (_UILabelContent *)-[_UILabelContent copy](self, "copy");
          v14 = -[NSDictionary copy](v7, "copy");
          v15 = v12->_defaultAttributes;
          v12->_defaultAttributes = (NSDictionary *)v14;

          goto LABEL_14;
        }
        v10 = -[NSDictionary isEqual:](v7, "isEqual:", v8);

        if (!v10)
          goto LABEL_16;
      }

    }
    goto LABEL_12;
  }
  -[_UILabelContent contentWithDefaultAttributes:](self, "contentWithDefaultAttributes:", v4);
  v11 = (_UILabelContent *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v12 = v11;
LABEL_14:

  return v12;
}

- (_UILabelContent)initWithDefaultAttributes:(id)a3
{
  id v4;
  _UILabelContent *v5;
  uint64_t v6;
  NSDictionary *defaultAttributes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UILabelContent;
  v5 = -[_UILabelContent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    defaultAttributes = v5->_defaultAttributes;
    v5->_defaultAttributes = (NSDictionary *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UILabelContent initWithDefaultAttributes:]([_UILabelContent alloc], "initWithDefaultAttributes:", self->_defaultAttributes);
}

- (BOOL)isEqual:(id)a3
{
  _UILabelContent *v4;
  _UILabelContent *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  char v10;

  v4 = (_UILabelContent *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v6 = -[_UILabelContent isNil](v5, "isNil"), v6 == -[_UILabelContent isNil](self, "isNil"))
         && (v7 = -[_UILabelContent isAttributed](v5, "isAttributed"),
             v7 == -[_UILabelContent isAttributed](self, "isAttributed"))
         && (v8 = -[_UILabelContent isWidthVariant](v5, "isWidthVariant"),
             v8 == -[_UILabelContent isWidthVariant](self, "isWidthVariant"))
         && (v9 = -[_UILabelContent length](v5, "length"), v9 == -[_UILabelContent length](self, "length")))
  {
    v10 = -[_UILabelContent _isContentEqualToContent:](v5, "_isContentEqualToContent:", self);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)differenceVersusContent:(id)a3
{
  _UILabelContent *v4;
  _UILabelContent *v5;
  _BOOL4 v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  int64_t v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  int v28;
  id v29;
  int v30;
  int v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  uint64_t (*v54)(uint64_t, id, id);
  uint64_t (*v55)(void *, void *);
  uint64_t (*v56)(uint64_t, id, id);
  uint64_t (*v57)(void *, void *);
  void *v58;
  void *v59;
  uint64_t AttributeDifference;
  int v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v4 = (_UILabelContent *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v15 = 0;
  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[_UILabelContent isNil](v5, "isNil");
      v7 = v6 ^ -[_UILabelContent isNil](self, "isNil");
      v8 = -[_UILabelContent isAttributed](v5, "isAttributed");
      if (v8 ^ -[_UILabelContent isAttributed](self, "isAttributed") | v7)
        v9 = 256;
      else
        v9 = 0;
      v10 = -[_UILabelContent isWidthVariant](v5, "isWidthVariant");
      if (v10 != -[_UILabelContent isWidthVariant](self, "isWidthVariant"))
        v11 = 8448;
      else
        v11 = v9;
      -[_UILabelContent defaultAttributes](v5, "defaultAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILabelContent defaultAttributes](self, "defaultAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_UILabelContent isAttributed](v5, "isAttributed") || -[_UILabelContent isAttributed](self, "isAttributed");
      v16 = v12;
      v17 = v13;
      v18 = v17;
      if (v16 == v17)
      {

      }
      else
      {
        if (!v16 || !v17)
        {

          goto LABEL_24;
        }
        v19 = objc_msgSend(v16, "isEqual:", v17);

        if ((v19 & 1) == 0)
        {
LABEL_24:
          v11 |= 0x200uLL;
          if (v14)
          {
            v20 = 0;
          }
          else
          {
            v21 = *(void **)off_1E1678D98;
            v22 = v16;
            v64 = v11;
            v23 = v18;
            LODWORD(v21) = HasAttributeDifferenceDefaults(v21, v22, v23);
            if (HasAttributeDifferenceDefaults(*(void **)off_1E1678C50, v22, v23) | v21)
              v24 = 0x20000;
            else
              v24 = 0;
            if (HasAttributeDifferenceDefaults(*(void **)off_1E1678F98, v22, v23))
              v24 |= 0xC000uLL;
            v25 = v24 | GetShadowAttributeDifferenceDefaults(v22, v23);
            v62 = HasAttributeDifferenceDefaults(*(void **)off_1E1678D90, v22, v23);
            v26 = v14;
            v27 = v18;
            v28 = HasAttributeDifferenceDefaults((void *)*MEMORY[0x1E0CA8248], v22, v23);
            v29 = v16;
            v30 = HasAttributeDifferenceDefaults((void *)*MEMORY[0x1E0CA8358], v22, v23);

            v31 = v30 | v28;
            v18 = v27;
            v14 = v26;
            v20 = 0;
            v16 = v29;
            v32 = (v31 | v62) == 0;
            v33 = v25 | 0x14000;
            if (v32)
              v33 = v25;
            v11 = v33 | v64;
          }
LABEL_35:
          v34 = -[_UILabelContent length](v5, "length");
          if (v34 != -[_UILabelContent length](self, "length"))
          {
            v11 |= 0x1800uLL;
LABEL_78:
            v15 = (8 * (int)v11) & 0x4000 | v11;

            goto LABEL_79;
          }
          if (!v14)
          {
            -[_UILabelContent string](v5, "string");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UILabelContent string](self, "string");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v46;
            v49 = v47;
            v50 = v49;
            if (v48 == v49)
            {
              v51 = 1;
            }
            else
            {
              v51 = 0;
              if (v48 && v49)
                v51 = objc_msgSend(v48, "isEqual:", v49);
            }

            if (!v51)
              v11 |= 0x4800uLL;
            goto LABEL_78;
          }
          -[_UILabelContent attributedString](v5, "attributedString");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UILabelContent attributedString](self, "attributedString");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20 || (objc_msgSend(v35, "isEqualToAttributedString:", v36) & 1) == 0)
          {
            v63 = v16;
            v65 = v18;
            v37 = v11;
            v38 = -[_UILabelContent length](self, "length");
            objc_msgSend(v35, "string");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "string");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v39, "isEqualToString:", v40);

            if ((v41 & 1) != 0)
            {
              if (v38)
              {
                v68 = 0;
                v69 = 0;
                v66 = 0;
                v67 = 0;
                objc_msgSend(v35, "attributesAtIndex:longestEffectiveRange:inRange:", 0, &v68, 0, v38);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "attributesAtIndex:longestEffectiveRange:inRange:", 0, &v66, 0, v38);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                if (v69 == v38 && v68 == v66 && v38 == v67)
                {
                  v16 = v63;
                  v44 = (void *)objc_msgSend(v63, "mutableCopy");
                  objc_msgSend(v44, "addEntriesFromDictionary:", v42);
                  v45 = (void *)objc_msgSend(v65, "mutableCopy");
                  objc_msgSend(v45, "addEntriesFromDictionary:", v43);
                  if ((UIEqual(v44, v45) & 1) != 0)
                  {
                    v11 = v37;
                    if ((UIEqual(v42, v43) & 1) != 0)
                    {

LABEL_76:
                      v18 = v65;

                      goto LABEL_77;
                    }
                    v56 = (uint64_t (*)(uint64_t, id, id))HasAttributeDifferenceDefaults;
                    v57 = GetShadowAttributeDifferenceDefaults;
                    v58 = v42;
                    v59 = v43;
LABEL_70:
                    if (GetAttributeDifference(v56, v57, v58, v59))
                    {

                      AttributeDifference = 8;
                      goto LABEL_72;
                    }

                    goto LABEL_74;
                  }
                  v54 = (uint64_t (*)(uint64_t, id, id))HasAttributeDifferenceDefaults;
                  v55 = GetShadowAttributeDifferenceDefaults;
                }
                else
                {
                  -[_UILabelContent defaultAttributes](v5, "defaultAttributes");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSAttributedString _ui_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:](v35, 0, v38, v52);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                  -[_UILabelContent defaultAttributes](self, "defaultAttributes");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSAttributedString _ui_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:](v36, 0, v38, v53);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();

                  if ((objc_msgSend(v44, "isEqualToAttributedString:", v45) & 1) != 0)
                  {
                    v11 = v37;
                    if ((objc_msgSend(v35, "isEqualToAttributedString:", v36) & 1) != 0)
                    {

LABEL_75:
                      v16 = v63;
                      goto LABEL_76;
                    }
                    v56 = (uint64_t (*)(uint64_t, id, id))HasAttributeDifferenceString;
                    v57 = GetShadowAttributeDifferenceString;
                    v58 = v35;
                    v59 = v36;
                    goto LABEL_70;
                  }
                  v54 = (uint64_t (*)(uint64_t, id, id))HasAttributeDifferenceString;
                  v55 = GetShadowAttributeDifferenceString;
                }
                AttributeDifference = GetAttributeDifference(v54, v55, v44, v45);
                v11 = v37;

                if (AttributeDifference)
                {
LABEL_72:
                  v11 |= AttributeDifference;
                  goto LABEL_75;
                }
LABEL_74:
                v11 |= 0x4400uLL;
                goto LABEL_75;
              }
              if ((v20 & 1) == 0)
              {
                v16 = v63;
                v18 = v65;
                v11 = GetAttributeDifference((uint64_t (*)(uint64_t, id, id))HasAttributeDifferenceDefaults, GetShadowAttributeDifferenceDefaults, v63, v65) | v37;
                goto LABEL_77;
              }
              v11 = v37;
            }
            else
            {
              v11 = v37 | 0x800;
            }
            v16 = v63;
            v18 = v65;
          }
LABEL_77:

          goto LABEL_78;
        }
      }
      v20 = 1;
      goto LABEL_35;
    }
    v15 = 4;
  }
  else
  {
    v15 = 2;
  }
LABEL_79:

  return v15;
}

- (int64_t)length
{
  return 0;
}

- (BOOL)isAttributed
{
  return 0;
}

- (BOOL)isNil
{
  return 1;
}

- (id)defaultAttributes
{
  return self->_defaultAttributes;
}

- (BOOL)isWidthVariant
{
  return 0;
}

- (id)string
{
  return 0;
}

- (id)widthVariantContentForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _UILabelContent *v7;

  v4 = a3;
  if (-[_UILabelContent isWidthVariant](self, "isWidthVariant"))
  {
    -[_UILabelContent string](self, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIAdaptLocalizedStringForView(v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UILabelContent contentWithString:](self, "contentWithString:", v6);
    v7 = (_UILabelContent *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self;
  }

  return v7;
}

- (BOOL)_isContentEqualToContent:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  BOOL v9;
  char v10;

  v4 = a3;
  v5 = (void *)v4[1];
  v6 = self->_defaultAttributes;
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {
    v10 = 1;
  }
  else
  {
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      v10 = 0;
    else
      v10 = -[NSDictionary isEqual:](v6, "isEqual:", v7);
  }

  return v10;
}

- (_UILabelContent)contentWithAttributedString:(id)a3
{
  id v4;
  _UILabelAttributedStringContent *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[_UILabelAttributedStringContent initWithAttributedString:defaultAttributes:]([_UILabelAttributedStringContent alloc], "initWithAttributedString:defaultAttributes:", v4, self->_defaultAttributes);

  }
  else
  {
    v5 = self;
  }
  return (_UILabelContent *)v5;
}

- (id)shadow
{
  return -[_UILabelContent defaultValueForAttribute:](self, "defaultValueForAttribute:", *(_QWORD *)off_1E1679048);
}

- (id)attributedString
{
  return 0;
}

- (id)paragraphStyle
{
  return -[_UILabelContent defaultValueForAttribute:](self, "defaultValueForAttribute:", *(_QWORD *)off_1E1678F98);
}

- (_UILabelContent)contentWithDefaultAttributes:(id)a3
{
  id v4;
  NSDictionary *defaultAttributes;
  NSDictionary *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  int v9;
  _UILabelContent *v10;
  uint64_t v11;
  NSDictionary *v12;

  v4 = a3;
  defaultAttributes = self->_defaultAttributes;
  v6 = (NSDictionary *)v4;
  v7 = defaultAttributes;
  if (v7 == v6)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_9:
      v10 = (_UILabelContent *)-[_UILabelContent copy](self, "copy");
      v11 = -[NSDictionary copy](v6, "copy");
      v12 = v10->_defaultAttributes;
      v10->_defaultAttributes = (NSDictionary *)v11;

      goto LABEL_10;
    }
    v9 = -[NSDictionary isEqual:](v6, "isEqual:", v7);

    if (!v9)
      goto LABEL_9;
  }
  v10 = self;
LABEL_10:

  return v10;
}

- (_UILabelContent)contentWithString:(id)a3
{
  id v4;
  _UILabelStringContent *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[_UILabelStringContent initWithString:defaultAttributes:]([_UILabelStringContent alloc], "initWithString:defaultAttributes:", v4, self->_defaultAttributes);

  }
  else
  {
    v5 = self;
  }
  return (_UILabelContent *)v5;
}

- (id)contentByCompletingDefaultAttributesWithAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDictionary *defaultAttributes;
  NSDictionary *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  int v12;
  _UILabelContent *v13;
  _UILabelContent *v14;
  uint64_t v16;
  NSDictionary *v17;

  v4 = a3;
  if (!v4)
  {
LABEL_15:
    v13 = self;
    goto LABEL_16;
  }
  if (-[NSDictionary count](self->_defaultAttributes, "count"))
  {
    if (objc_msgSend(v4, "count"))
    {
      v5 = (void *)objc_msgSend(v4, "mutableCopy");
      v6 = v5;
      if (self->_defaultAttributes)
        defaultAttributes = self->_defaultAttributes;
      else
        defaultAttributes = (NSDictionary *)MEMORY[0x1E0C9AA70];
      objc_msgSend(v5, "addEntriesFromDictionary:", defaultAttributes);
      v8 = self->_defaultAttributes;
      v9 = v6;
      v10 = v8;
      if (v9 == v10)
      {

      }
      else
      {
        v11 = v10;
        if (!v9 || !v10)
        {

LABEL_19:
          v14 = (_UILabelContent *)-[_UILabelContent copy](self, "copy");
          v16 = -[NSDictionary copy](v9, "copy");
          v17 = v14->_defaultAttributes;
          v14->_defaultAttributes = (NSDictionary *)v16;

          goto LABEL_17;
        }
        v12 = -[NSDictionary isEqual:](v9, "isEqual:", v10);

        if (!v12)
          goto LABEL_19;
      }

    }
    goto LABEL_15;
  }
  -[_UILabelContent contentWithDefaultAttributes:](self, "contentWithDefaultAttributes:", v4);
  v13 = (_UILabelContent *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v14 = v13;
LABEL_17:

  return v14;
}

- (BOOL)isEqualToString:(id)a3
{
  return a3 == 0;
}

- (BOOL)isEqualToAttributedString:(id)a3
{
  return a3 == 0;
}

- (BOOL)isEqualToContent:(id)a3 byAttribute:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;

  v6 = a4;
  v7 = a3;
  -[_UILabelContent defaultValueForAttribute:](self, "defaultValueForAttribute:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultValueForAttribute:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v8;
  v11 = v9;
  v12 = v11;
  if (v10 == v11)
  {
    v13 = 1;
  }
  else
  {
    v13 = 0;
    if (v10 && v11)
      v13 = objc_msgSend(v10, "isEqual:", v11);
  }

  return v13;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_defaultAttributes, "hash");
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p (empty) attr=%@>"), objc_opt_class(), self, self->_defaultAttributes);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UILabelContent string](self, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "length") >= 0x21)
    {
      objc_msgSend(v4, "substringWithRange:", 0, 32);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("..."));
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    if (-[_UILabelContent isAttributed](self, "isAttributed"))
      v9 = CFSTR("(attributed string) ");
    else
      v9 = CFSTR("(string) ");
    if (-[_UILabelContent isWidthVariant](self, "isWidthVariant"))
      v10 = CFSTR("variant ");
    else
      v10 = &stru_1E16EDF20;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@:%p %@%@len=%ld %@ attr=%@>"), v8, self, v9, v10, -[_UILabelContent length](self, "length"), v4, self->_defaultAttributes);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)intelligenceLightAttributedStrings
{
  return 0;
}

- (id)labelViewTextAttachments
{
  return 0;
}

- (id)textColor
{
  return -[_UILabelContent defaultValueForAttribute:](self, "defaultValueForAttribute:", *(_QWORD *)off_1E1678D98);
}

- (id)backgroundColor
{
  return -[_UILabelContent defaultValueForAttribute:](self, "defaultValueForAttribute:", *(_QWORD *)off_1E1678C50);
}

@end
