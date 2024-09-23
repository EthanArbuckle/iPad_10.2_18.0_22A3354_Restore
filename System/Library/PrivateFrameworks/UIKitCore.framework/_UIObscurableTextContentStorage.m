@implementation _UIObscurableTextContentStorage

- (id)attributedString
{
  void *v3;
  objc_super v5;

  if (-[_UIObscurableTextContentStorage isObscured](self, "isObscured"))
  {
    -[_UIObscurableTextContentStorage obscuredAttributedString](self, "obscuredAttributedString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIObscurableTextContentStorage;
    -[NSTextContentStorage attributedString](&v5, sel_attributedString);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isObscured
{
  return self->_obscured;
}

- (_UIObscurableTextContentStorage)initWithTextStorage:(id)a3
{
  id v4;
  _UIObscurableTextContentStorage *v5;
  _UIObscurableTextContentStorage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIObscurableTextContentStorage;
  v5 = -[NSTextContentStorage init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UIObscurableTextContentStorage setTextStorage:](v5, "setTextStorage:", v4);

  return v6;
}

- (void)setTextStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  objc_storeStrong((id *)&self->_cascadingTextStorage, v6);

  v7.receiver = self;
  v7.super_class = (Class)_UIObscurableTextContentStorage;
  -[NSTextContentStorage setTextStorage:](&v7, sel_setTextStorage_, v4);

}

- (void)setUnobscuredRange:(_NSRange)a3
{
  _NSRange *p_unobscuredRange;
  NSRange unobscuredRange;
  BOOL v7;
  NSRange v8;
  NSUInteger location;
  NSUInteger length;
  id v11;

  p_unobscuredRange = &self->_unobscuredRange;
  unobscuredRange = self->_unobscuredRange;
  if (unobscuredRange.location != a3.location || unobscuredRange.length != a3.length)
  {
    *p_unobscuredRange = a3;
    if (unobscuredRange.length)
      v7 = a3.length == 0;
    else
      v7 = 1;
    if (v7)
    {
      if (a3.length)
        length = a3.length;
      else
        length = unobscuredRange.length;
      if (a3.length)
        location = a3.location;
      else
        location = unobscuredRange.location;
    }
    else
    {
      v8 = NSUnionRange(unobscuredRange, a3);
      location = v8.location;
      length = v8.length;
    }
    -[NSTextContentStorage textStorage](self, "textStorage");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIObscurableTextContentStorage processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:](self, "processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:", v11, 2, location, length, 0, location, length);

  }
}

- (void)processEditingForTextStorage:(id)a3 edited:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 invalidatedRange:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  objc_super v13;

  length = a5.length;
  location = a5.location;
  v12 = a3;
  -[_UIObscurableTextContentStorage _validateUnobscuredRange](self, "_validateUnobscuredRange");
  -[_UIObscurableTextContentStorage _invalidateObscuredAttributedString](self, "_invalidateObscuredAttributedString");
  v13.receiver = self;
  v13.super_class = (Class)_UIObscurableTextContentStorage;
  -[NSTextContentStorage processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:](&v13, sel_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange_, v12, a4, location, length, a6, a7.location, a7.length);

}

- (void)_validateUnobscuredRange
{
  void *v3;
  unint64_t v4;
  NSUInteger location;

  -[NSTextContentStorage textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  location = self->_unobscuredRange.location;
  if (self->_unobscuredRange.length + location > v4)
  {
    if (location >= v4)
      location = v4;
    self->_unobscuredRange.location = location;
    self->_unobscuredRange.length = v4 - location;
  }
}

- (void)_invalidateObscuredAttributedString
{
  NSAttributedString *obscuredAttributedString;

  obscuredAttributedString = self->_obscuredAttributedString;
  self->_obscuredAttributedString = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obscuredAttributedString, 0);
  objc_storeStrong((id *)&self->_cascadingTextStorage, 0);
}

- (NSAttributedString)obscuredAttributedString
{
  NSAttributedString *obscuredAttributedString;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSAttributedString *v22;
  _UIObscurableTextContentStorage *v24;
  unint64_t v25;
  id v26;
  objc_super v27;

  obscuredAttributedString = self->_obscuredAttributedString;
  if (!obscuredAttributedString)
  {
    v27.receiver = self;
    v27.super_class = (Class)_UIObscurableTextContentStorage;
    -[NSTextContentStorage attributedString](&v27, sel_attributedString);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v24 = self;
    v6 = -[_UIObscurableTextContentStorage unobscuredRange](self, "unobscuredRange");
    v25 = v7;
    if (objc_msgSend(v4, "length"))
    {
      v8 = 0;
      v9 = *(_QWORD *)off_1E1678D90;
      do
      {
        if (v6 > v8 || v8 - v6 >= v25)
        {
          objc_msgSend(v4, "attributesAtIndex:effectiveRange:", v8, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v11, "mutableCopy");

          objc_msgSend(v10, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            v14 = v12;
          }
          else
          {
            -[_UICascadingTextStorage font](v24->_cascadingTextStorage, "font");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
            {
              v17 = v15;
            }
            else
            {
              objc_msgSend(off_1E167A828, "defaultFontSize");
              objc_msgSend(off_1E167A828, "systemFontOfSize:");
              v17 = (id)objc_claimAutoreleasedReturnValue();
            }
            v14 = v17;

          }
          v26 = 0;
          objc_msgSend(v14, "_ui_bulletStringWithFont:", &v26);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v26;
          if (v19)
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v9);
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v18, v10);
          objc_msgSend(v5, "appendAttributedString:", v20);

        }
        else
        {
          objc_msgSend(v4, "attributedSubstringFromRange:", v8, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendAttributedString:", v10);
        }

        ++v8;
      }
      while (v8 < objc_msgSend(v4, "length"));
    }
    v21 = objc_msgSend(v5, "copy");
    v22 = v24->_obscuredAttributedString;
    v24->_obscuredAttributedString = (NSAttributedString *)v21;

    obscuredAttributedString = v24->_obscuredAttributedString;
  }
  return obscuredAttributedString;
}

- (void)setObscured:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (self->_obscured != a3)
  {
    self->_obscured = a3;
    -[NSTextContentStorage textStorage](self, "textStorage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length");
    -[_UIObscurableTextContentStorage processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:](self, "processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:", v5, 2, 0, v4, 0, 0, v4);

  }
}

- (_NSRange)unobscuredRange
{
  _NSRange *p_unobscuredRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_unobscuredRange = &self->_unobscuredRange;
  location = self->_unobscuredRange.location;
  length = p_unobscuredRange->length;
  result.length = length;
  result.location = location;
  return result;
}

@end
