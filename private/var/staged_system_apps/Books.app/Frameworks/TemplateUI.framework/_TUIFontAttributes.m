@implementation _TUIFontAttributes

- (UIFont)font
{
  return (UIFont *)-[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", NSFontAttributeName);
}

- (UIColor)foregroundColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", NSForegroundColorAttributeName);
}

- (_TUIFontAttributes)initWithAttributes:(id)a3 caps:(unint64_t)a4
{
  id v7;
  _TUIFontAttributes *v8;
  _TUIFontAttributes *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_TUIFontAttributes;
  v8 = -[_TUIFontAttributes init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_attributes, a3);
    v9->_caps = a4;
  }

  return v9;
}

- (id)attributedStringWithText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (self->_caps == 2)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedUppercaseString"));

    v5 = (void *)v6;
  }
  if (v5)
    v7 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v5, self->_attributes);
  else
    v7 = 0;

  return v7;
}

- (_TUIFontAttributes)attributesWithTruncated:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  _TUIFontAttributes *v14;

  v3 = a3;
  v5 = -[NSDictionary mutableCopy](self->_attributes, "mutableCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSParagraphStyleAttributeName));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
  v9 = v8;

  v10 = objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v3)
    v12 = 4;
  else
    v12 = 0;
  objc_msgSend(v10, "setLineBreakMode:", v12);
  v13 = objc_msgSend(v11, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, NSParagraphStyleAttributeName);

  v14 = -[_TUIFontAttributes initWithAttributes:caps:]([_TUIFontAttributes alloc], "initWithAttributes:caps:", v5, self->_caps);
  return v14;
}

- (_TUIFontAttributes)attributesWithCentered:(BOOL)a3 truncated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _TUIFontAttributes *v17;

  v4 = a4;
  v5 = a3;
  v7 = -[NSDictionary mutableCopy](self->_attributes, "mutableCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSParagraphStyleAttributeName));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
  v11 = v10;

  v12 = objc_msgSend(v11, "mutableCopy");
  v13 = v12;
  if (v5)
  {
    objc_msgSend(v12, "setAlignment:", 1);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
    objc_msgSend(v13, "setAlignment:", objc_msgSend(v14, "alignment"));

  }
  if (v4)
    v15 = 4;
  else
    v15 = 0;
  objc_msgSend(v13, "setLineBreakMode:", v15);
  v16 = objc_msgSend(v13, "copy");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, NSParagraphStyleAttributeName);

  v17 = -[_TUIFontAttributes initWithAttributes:caps:]([_TUIFontAttributes alloc], "initWithAttributes:caps:", v7, self->_caps);
  return v17;
}

- (_TUIFontAttributes)attributesWithLineSpacing:(double)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _TUIFontAttributes *v12;

  v5 = -[NSDictionary mutableCopy](self->_attributes, "mutableCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSParagraphStyleAttributeName));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
  v9 = v8;

  v10 = objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v10, "setLineSpacing:", a3);
  v11 = objc_msgSend(v10, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, NSParagraphStyleAttributeName);

  v12 = -[_TUIFontAttributes initWithAttributes:caps:]([_TUIFontAttributes alloc], "initWithAttributes:caps:", v5, self->_caps);
  return v12;
}

- (_TUIFontAttributes)attributesWithForegroundColor:(id)a3
{
  NSDictionary *attributes;
  id v5;
  id v6;
  _TUIFontAttributes *v7;

  attributes = self->_attributes;
  v5 = a3;
  v6 = -[NSDictionary mutableCopy](attributes, "mutableCopy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, NSForegroundColorAttributeName);

  v7 = -[_TUIFontAttributes initWithAttributes:caps:]([_TUIFontAttributes alloc], "initWithAttributes:caps:", v6, self->_caps);
  return v7;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (unint64_t)caps
{
  return self->_caps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
