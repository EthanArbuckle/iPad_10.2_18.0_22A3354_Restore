@implementation _UILabelStringContent

- (id)string
{
  return self->_string;
}

- (BOOL)isAttributed
{
  return 0;
}

- (int64_t)length
{
  return -[NSString length](self->_string, "length");
}

- (BOOL)isNil
{
  return self->_string == 0;
}

- (BOOL)isWidthVariant
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)contentByApplyingAttribute:(id)a3 value:(id)a4 toRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  NSUInteger v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_super v21;
  objc_super v22;

  length = a5.length;
  location = a5.location;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9 && v10 && (v12 = -[_UILabelStringContent length](self, "length"), v12 > location))
  {
    v13 = v12;
    if (location + length <= v12)
      v14 = length;
    else
      v14 = v12 - location;
    v22.receiver = self;
    v22.super_class = (Class)_UILabelStringContent;
    -[_UILabelContent contentByApplyingAttribute:value:toRange:](&v22, sel_contentByApplyingAttribute_value_toRange_, v9, v11, location, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (location || v14 != v13)
    {
      -[_UILabelStringContent attributedString](self, "attributedString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

      objc_msgSend(v19, "addAttribute:value:range:", v9, v11, location, v14);
      objc_msgSend(v16, "contentWithAttributedString:", v19);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = v15;
    }

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)_UILabelStringContent;
    -[_UILabelContent contentByApplyingAttribute:value:toRange:](&v21, sel_contentByApplyingAttribute_value_toRange_, v9, v11, location, length);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

- (id)attributedString
{
  void *v2;

  if (self->_string)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", self->_string, self->super._defaultAttributes);
  else
    v2 = 0;
  return v2;
}

- (BOOL)_isContentEqualToContent:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", self->_string))
  {
    v7.receiver = self;
    v7.super_class = (Class)_UILabelStringContent;
    v5 = -[_UILabelContent _isContentEqualToContent:](&v7, sel__isContentEqualToContent_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToString:(id)a3
{
  NSString *string;

  string = self->_string;
  return string == a3 || -[NSString isEqualToString:](string, "isEqualToString:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UILabelStringContent initWithString:defaultAttributes:]([_UILabelStringContent alloc], "initWithString:defaultAttributes:", self->_string, self->super._defaultAttributes);
}

- (_UILabelStringContent)initWithString:(id)a3 defaultAttributes:(id)a4
{
  id v6;
  id v7;
  _UILabelStringContent *v8;
  uint64_t v9;
  NSString *string;
  _UILabelStringContent *v11;
  id v12;
  objc_super v14;

  v6 = a3;
  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)_UILabelStringContent;
    v7 = a4;
    v8 = -[_UILabelContent initWithDefaultAttributes:](&v14, sel_initWithDefaultAttributes_, v7);

    if (v8)
    {
      v9 = objc_msgSend(v6, "copy", v14.receiver, v14.super_class);
      string = v8->_string;
      v8->_string = (NSString *)v9;

      *(_BYTE *)&v8->_flags = *(_BYTE *)&v8->_flags & 0xFE | _NSStringIsWidthVariant(v6);
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v12 = a4;
    v11 = -[_UILabelContent initWithDefaultAttributes:]([_UILabelContent alloc], "initWithDefaultAttributes:", v12);

  }
  return v11;
}

- (_UILabelStringContent)contentWithString:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  int v8;
  _UILabelStringContent *v9;
  _UILabelStringContent *v10;

  v4 = a3;
  v5 = self->_string;
  v6 = (NSString *)v4;
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
    v8 = -[NSString isEqual:](v5, "isEqual:", v6);

    if (!v8)
    {
LABEL_9:
      v9 = -[_UILabelStringContent initWithString:defaultAttributes:]([_UILabelStringContent alloc], "initWithString:defaultAttributes:", v7, self->super._defaultAttributes);
      goto LABEL_11;
    }
  }
  v9 = self;
LABEL_11:
  v10 = v9;

  return v10;
}

- (id)attributedStringContent
{
  void *v3;
  void *v4;

  -[_UILabelStringContent attributedString](self, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILabelStringContent contentWithAttributedString:](self, "contentWithAttributedString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_UILabelStringContent)contentWithAttributedString:(id)a3
{
  id v4;
  _UILabelAttributedStringContent *v5;
  _UILabelAttributedStringContent *v6;

  v4 = a3;
  if (v4)
    v5 = -[_UILabelAttributedStringContent initWithAttributedString:defaultAttributes:]([_UILabelAttributedStringContent alloc], "initWithAttributedString:defaultAttributes:", v4, self->super._defaultAttributes);
  else
    v5 = -[_UILabelContent initWithDefaultAttributes:]([_UILabelContent alloc], "initWithDefaultAttributes:", self->super._defaultAttributes);
  v6 = v5;

  return (_UILabelStringContent *)v6;
}

- (BOOL)isEqualToAttributedString:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (v4 || self->_string)
  {
    -[_UILabelStringContent attributedString](self, "attributedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToAttributedString:", v4);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  objc_super v5;

  v3 = -[NSString hash](self->_string, "hash");
  v5.receiver = self;
  v5.super_class = (Class)_UILabelStringContent;
  return -[_UILabelContent hash](&v5, sel_hash) + v3;
}

@end
