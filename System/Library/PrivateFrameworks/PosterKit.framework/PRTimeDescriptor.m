@implementation PRTimeDescriptor

- (BOOL)isEqual:(id)a3
{
  PRTimeDescriptor *v4;
  PRTimeDescriptor *v5;
  char v6;

  v4 = (PRTimeDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4 && -[UIFont isEqual:](self->_font, "isEqual:", v4->_font))
  {
    v6 = -[UIColor isEqual:](self->_color, "isEqual:", v5->_color);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  UIFont *font;
  id v5;

  font = self->_font;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", font, CFSTR("_font"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_color, CFSTR("_color"));

}

- (PRTimeDescriptor)initWithBSXPCCoder:(id)a3
{
  id v4;
  PRTimeDescriptor *v5;
  uint64_t v6;
  UIFont *font;
  uint64_t v8;
  UIColor *color;

  v4 = a3;
  v5 = -[PRTimeDescriptor init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_font"));
    v6 = objc_claimAutoreleasedReturnValue();
    font = v5->_font;
    v5->_font = (UIFont *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_color"));
    v8 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (UIColor *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PRTimeDescriptor *v4;

  v4 = objc_alloc_init(PRTimeDescriptor);
  objc_storeStrong((id *)&v4->_font, self->_font);
  objc_storeStrong((id *)&v4->_color, self->_color);
  return v4;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end
