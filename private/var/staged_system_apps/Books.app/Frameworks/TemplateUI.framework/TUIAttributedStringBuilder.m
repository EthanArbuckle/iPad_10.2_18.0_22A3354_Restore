@implementation TUIAttributedStringBuilder

- (TUIAttributedStringBuilder)initWithFontSpec:(id)a3 style:(unint64_t)a4 color:(id)a5 textAlignment:(int64_t)a6
{
  id v10;
  id v11;
  TUIAttributedStringBuilder *v12;
  TUIFontSpec *v13;
  TUIFontSpec *fontSpec;
  UIColor *v15;
  UIColor *color;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  UIColor *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  NSDictionary *v31;
  NSDictionary *attributes;
  NSMutableAttributedString *v33;
  NSMutableAttributedString *attributedString;
  objc_super v36;

  v10 = a3;
  v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)TUIAttributedStringBuilder;
  v12 = -[TUIAttributedStringBuilder init](&v36, "init");
  if (v12)
  {
    v13 = (TUIFontSpec *)objc_msgSend(v10, "copy");
    fontSpec = v12->_fontSpec;
    v12->_fontSpec = v13;

    v15 = (UIColor *)objc_msgSend(v11, "copy");
    color = v12->_color;
    v12->_color = v15;

    v17 = objc_msgSend(v10, "caps");
    v12->_style = a4;
    v12->_caps = (unint64_t)v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attributesForAttributedString"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "attributes"));
    v20 = objc_msgSend(v19, "mutableCopy");
    v21 = v20;
    if (v20)
      v22 = (NSMutableDictionary *)v20;
    else
      v22 = objc_opt_new(NSMutableDictionary);
    v23 = v22;

    v24 = v12->_color;
    if (v24)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v24, NSForegroundColorAttributeName);
    if (a6 != 4)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", NSParagraphStyleAttributeName));
      v26 = v25;
      if (v25)
        v27 = v25;
      else
        v27 = (id)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
      v28 = v27;

      v29 = objc_msgSend(v28, "mutableCopy");
      objc_msgSend(v29, "setAlignment:", a6);
      v30 = objc_msgSend(v29, "copy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v30, NSParagraphStyleAttributeName);

    }
    v31 = (NSDictionary *)-[NSMutableDictionary copy](v23, "copy");
    attributes = v12->_attributes;
    v12->_attributes = v31;

    v33 = (NSMutableAttributedString *)objc_alloc_init((Class)NSMutableAttributedString);
    attributedString = v12->_attributedString;
    v12->_attributedString = v33;

  }
  return v12;
}

- (void)appendHyperlinkWithURL:(id)a3 block:(id)a4
{
  id *p_attributes;
  NSDictionary *attributes;
  NSDictionary *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;
  NSDictionary *v17;
  void (**v18)(void);

  v18 = (void (**)(void))a4;
  attributes = self->_attributes;
  p_attributes = (id *)&self->_attributes;
  v8 = attributes;
  v9 = *p_attributes;
  v10 = a3;
  v11 = objc_msgSend(v9, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = (NSMutableDictionary *)v11;
  else
    v13 = objc_opt_new(NSMutableDictionary);
  v14 = v13;

  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v10, NSLinkAttributeName);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v15, NSUnderlineColorAttributeName);

  objc_storeStrong(p_attributes, v14);
  if (v18)
    v18[2]();
  v16 = *p_attributes;
  *p_attributes = v8;
  v17 = v8;

}

- (void)appendString:(id)a3
{
  id v4;
  unint64_t caps;
  uint64_t v6;
  void *v7;
  NSMutableAttributedString *attributedString;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    caps = self->_caps;
    v10 = v4;
    switch(caps)
    {
      case 5uLL:
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedLowercaseString"));
        break;
      case 4uLL:
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedCapitalizedString"));
        break;
      case 2uLL:
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedUppercaseString"));
        break;
      default:
LABEL_10:
        attributedString = self->_attributedString;
        v9 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v10, self->_attributes);
        -[NSMutableAttributedString appendAttributedString:](attributedString, "appendAttributedString:", v9);

        return;
    }
    v7 = (void *)v6;

    v10 = v7;
    goto LABEL_10;
  }
}

- (void)appendWithStyle:(unint64_t)a3 color:(id)a4 fontSpec:(id)a5 block:(id)a6
{
  id v11;
  void (**v12)(_QWORD);
  NSDictionary *v13;
  UIColor *v14;
  unint64_t v15;
  char v16;
  id v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  NSDictionary *v23;
  NSDictionary *attributes;
  NSDictionary *v25;
  NSDictionary *v26;
  UIColor *color;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSDictionary *v37;
  void *v38;
  NSDictionary *v39;
  void (**v40)(_QWORD);
  UIColor *v41;
  __int128 v42;
  id v43;

  v43 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  v13 = self->_attributes;
  v42 = *(_OWORD *)&self->_style;
  v14 = self->_color;
  v15 = self->_style | a3;
  self->_style = v15;
  v41 = v14;
  if (v11)
  {
    if (objc_msgSend(v11, "caps"))
      self->_caps = (unint64_t)objc_msgSend(v11, "caps");
LABEL_8:
    if (!v43)
    {
      v16 = 1;
LABEL_11:
      v17 = -[NSDictionary mutableCopy](self->_attributes, "mutableCopy");
      v18 = v17;
      if (v17)
        v19 = (NSMutableDictionary *)v17;
      else
        v19 = objc_opt_new(NSMutableDictionary);
      v20 = v19;

      if (v11)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attributesForAttributedString"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "attributes"));
        -[NSMutableDictionary addEntriesFromDictionary:](v20, "addEntriesFromDictionary:", v22);

      }
      if ((v16 & 1) != 0)
      {
        if ((a3 & 1) == 0)
          goto LABEL_18;
      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v43, NSForegroundColorAttributeName);
        if ((a3 & 1) == 0)
        {
LABEL_18:
          if ((a3 & 2) == 0)
            goto LABEL_19;
          goto LABEL_27;
        }
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", NSFontAttributeName));
      v29 = v28;
      if (v28)
      {
        v39 = v13;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "fontDescriptor"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "fontDescriptorWithSymbolicTraits:", 2));
        objc_msgSend(v29, "pointSize");
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v31));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v32, NSFontAttributeName);

        v13 = v39;
      }

      if ((a3 & 2) == 0)
      {
LABEL_19:
        if ((a3 & 8) == 0)
        {
LABEL_21:
          v23 = (NSDictionary *)-[NSMutableDictionary copy](v20, "copy");
          attributes = self->_attributes;
          self->_attributes = v23;

          v12[2](v12);
          goto LABEL_22;
        }
LABEL_20:
        -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", &off_2523F8, NSStrikethroughStyleAttributeName);
        goto LABEL_21;
      }
LABEL_27:
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", NSFontAttributeName));
      v34 = v33;
      if (v33)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "fontDescriptor"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "fontDescriptorWithSymbolicTraits:", 1));
        v40 = v12;
        v37 = v13;
        objc_msgSend(v34, "pointSize");
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v36));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v38, NSFontAttributeName);

        v13 = v37;
        v12 = v40;

      }
      if ((a3 & 8) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
LABEL_9:
    objc_storeStrong((id *)&self->_color, a4);
    v16 = 0;
    goto LABEL_11;
  }
  if (v15 != (_QWORD)v42)
    goto LABEL_8;
  if (v43 && (-[UIColor isEqual:](self->_color, "isEqual:", v43) & 1) == 0)
    goto LABEL_9;
  v12[2](v12);
LABEL_22:
  v25 = self->_attributes;
  self->_attributes = v13;
  v26 = v13;

  *(_OWORD *)&self->_style = v42;
  color = self->_color;
  self->_color = v41;

}

- (_NSRange)appendWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  _BYTE *v5;
  char *v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[NSMutableAttributedString length](self->_attributedString, "length");
  if (v4)
    v4[2](v4);
  v6 = (char *)((_BYTE *)-[NSMutableAttributedString length](self->_attributedString, "length") - v5);

  v7 = (NSUInteger)v5;
  v8 = (NSUInteger)v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)finalizeTextModelWithContext:(id)a3
{
  return -[NSMutableAttributedString copy](self->_attributedString, "copy", a3);
}

- (void)addImageModel:(id)a3 forRole:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableAttributedString *attributedString;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "isEqualToString:", CFSTR("content")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "image"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTextAttachment textAttachmentWithImage:](NSTextAttachment, "textAttachmentWithImage:", v8));
    attributedString = self->_attributedString;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v9));
    -[NSMutableAttributedString appendAttributedString:](attributedString, "appendAttributedString:", v11);

    if (self->_color && objc_msgSend(v8, "isSymbolImage"))
      -[NSMutableAttributedString addAttribute:value:range:](self->_attributedString, "addAttribute:value:range:", NSForegroundColorAttributeName, self->_color, (char *)-[NSMutableAttributedString length](self->_attributedString, "length") - 1, 1);

  }
}

- (id)finalizeModelsWithParent:(id)a3 box:(id)a4 context:(id)a5
{
  return 0;
}

- (id)finalizeAnimationGroups
{
  return 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (NSArray)axActions
{
  return self->_axActions;
}

- (void)setAXActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (void)setFontSpec:(id)a3
{
  objc_storeStrong((id *)&self->_fontSpec, a3);
}

- (NSMutableAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_attributedString, a3);
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)caps
{
  return self->_caps;
}

- (void)setCaps:(unint64_t)a3
{
  self->_caps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);
  objc_storeStrong((id *)&self->_axActions, 0);
}

@end
