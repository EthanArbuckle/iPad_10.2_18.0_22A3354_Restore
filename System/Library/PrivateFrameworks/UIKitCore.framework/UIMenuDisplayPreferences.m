@implementation UIMenuDisplayPreferences

- (id)copyWithZone:(_NSZone *)a3
{
  UIMenuDisplayPreferences *v4;

  v4 = -[UIMenuDisplayPreferences init](+[UIMenuDisplayPreferences allocWithZone:](UIMenuDisplayPreferences, "allocWithZone:", a3), "init");
  -[UIMenuDisplayPreferences setMaximumNumberOfTitleLines:](v4, "setMaximumNumberOfTitleLines:", -[UIMenuDisplayPreferences maximumNumberOfTitleLines](self, "maximumNumberOfTitleLines"));
  return v4;
}

- (void)setMaximumNumberOfTitleLines:(int64_t)a3
{
  self->_maximumNumberOfTitleLines = a3;
}

- (UIMenuDisplayPreferences)init
{
  UIMenuDisplayPreferences *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIMenuDisplayPreferences;
  result = -[UIMenuDisplayPreferences init](&v3, sel_init);
  if (result)
    result->_maximumNumberOfTitleLines = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (int64_t)maximumNumberOfTitleLines
{
  return self->_maximumNumberOfTitleLines;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_maximumNumberOfTitleLines, CFSTR("maximumNumberOfTitleLines"));
}

- (UIMenuDisplayPreferences)initWithCoder:(id)a3
{
  id v4;
  UIMenuDisplayPreferences *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIMenuDisplayPreferences;
  v5 = -[UIMenuDisplayPreferences init](&v7, sel_init);
  if (v5)
    v5->_maximumNumberOfTitleLines = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumNumberOfTitleLines"));

  return v5;
}

@end
