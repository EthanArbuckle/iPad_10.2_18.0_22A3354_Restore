@implementation NSFont

+ (NSFont)fontWithName:(NSString *)fontName size:(CGFloat)fontSize
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___NSFont;
  return (NSFont *)objc_msgSendSuper2(&v5, sel_fontWithName_size_, fontName, fontSize);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (NSFont)initWithCoder:(id)a3
{
  uint64_t v4;
  float v5;
  double v6;
  UIFont *v7;

  v4 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSName"));
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("NSSize"));
  v6 = v5;
  v7 = +[UIFont fontWithName:size:](UIFont, "fontWithName:size:", v4, v5);
  if (!v7)
    v7 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v6);
  return (NSFont *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSFont is never expected to be encoded in iOS. UIFonts should be used."));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
