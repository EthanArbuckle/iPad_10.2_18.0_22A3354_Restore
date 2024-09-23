@implementation _UIDatePickerLinkedLabelCacheKey

+ (id)keyWithText:(id)a3 font:(id)a4 height:(double)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithText:font:height:", v9, v8, a5);

  return v10;
}

- (_UIDatePickerLinkedLabelCacheKey)initWithText:(id)a3 font:(id)a4 height:(double)a5
{
  id v9;
  id v10;
  _UIDatePickerLinkedLabelCacheKey *v11;
  _UIDatePickerLinkedLabelCacheKey *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIDatePickerLinkedLabelCacheKey;
  v11 = -[_UIDatePickerLinkedLabelCacheKey init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_text, a3);
    objc_storeStrong((id *)&v12->_font, a4);
    v12->_height = a5;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t result;
  NSUInteger v4;

  result = self->_hash;
  if (!result)
  {
    v4 = -[NSString hash](self->_text, "hash");
    result = -[UIFont hash](self->_font, "hash") ^ v4 ^ (unint64_t)self->_height;
    self->_hash = result;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _UIDatePickerLinkedLabelCacheKey *v4;
  _UIDatePickerLinkedLabelCacheKey *v5;
  BOOL v6;

  v4 = (_UIDatePickerLinkedLabelCacheKey *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (-[_UIDatePickerLinkedLabelCacheKey isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = self->_height == v5->_height
      && -[UIFont isEqual:](self->_font, "isEqual:", v5->_font)
      && -[NSString isEqualToString:](self->_text, "isEqualToString:", v5->_text);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
