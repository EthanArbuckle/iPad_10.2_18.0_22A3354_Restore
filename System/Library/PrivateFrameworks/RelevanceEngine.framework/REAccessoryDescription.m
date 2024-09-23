@implementation REAccessoryDescription

- (REAccessoryDescription)initWithCoder:(id)a3
{
  id v4;
  REAccessoryDescription *v5;
  uint64_t v6;
  UIColor *backgroundColor;
  uint64_t v8;
  CLKTextProvider *textProvider;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REAccessoryDescription;
  v5 = -[REAccessoryDescription init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_backgroundColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_textProvider"));
    v8 = objc_claimAutoreleasedReturnValue();
    textProvider = v5->_textProvider;
    v5->_textProvider = (CLKTextProvider *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UIColor *backgroundColor;
  id v5;

  backgroundColor = self->_backgroundColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", backgroundColor, CFSTR("_backgroundColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_textProvider, CFSTR("_textProvider"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  REAccessoryDescription *v4;

  v4 = -[REAccessoryDescription init](+[REAccessoryDescription allocWithZone:](REAccessoryDescription, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_backgroundColor, self->_backgroundColor);
  objc_storeStrong((id *)&v4->_textProvider, self->_textProvider);
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[CLKTextProvider hash](self->_textProvider, "hash");
  return -[UIColor hash](self->_backgroundColor, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  CLKTextProvider *v6;
  CLKTextProvider *v7;
  CLKTextProvider *v8;
  int v9;
  UIColor *v10;
  UIColor *v11;
  UIColor *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (CLKTextProvider *)v5[2];
    v7 = self->_textProvider;
    v8 = v7;
    if (v7 == v6)
      v9 = 1;
    else
      v9 = -[CLKTextProvider isEqual:](v7, "isEqual:", v6);

    v10 = (UIColor *)v5[1];
    v11 = self->_backgroundColor;
    v12 = v11;
    if (v11 != v10)
      v9 &= -[UIColor isEqual:](v11, "isEqual:", v10);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)REAccessoryDescription;
    LOBYTE(v9) = -[REAccessoryDescription isEqual:](&v14, sel_isEqual_, v4);
  }

  return v9;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
