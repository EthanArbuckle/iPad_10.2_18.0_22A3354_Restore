@implementation TLKVibrantDarkAppearance

- (id)primaryColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (id)compositingFilter
{
  return (id)*MEMORY[0x1E0CD2EA0];
}

- (id)quaternaryColor
{
  return -[TLKAppearance primaryColorWithDefaultAlpha:](self, "primaryColorWithDefaultAlpha:", 0.1);
}

- (id)tertiaryColor
{
  return -[TLKAppearance primaryColorWithDefaultAlpha:](self, "primaryColorWithDefaultAlpha:", 0.2);
}

- (id)secondaryColor
{
  return -[TLKAppearance primaryColorWithDefaultAlpha:](self, "primaryColorWithDefaultAlpha:", 0.6);
}

- (BOOL)isVibrant
{
  return 1;
}

- (id)platterColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.14);
}

- (unint64_t)style
{
  return 3;
}

- (id)name
{
  return CFSTR("Vibrant Dark");
}

- (id)textColorForColor:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  switch(a3)
  {
    case 4:
      v3 = 76;
      v4 = 217;
      v5 = 100;
      break;
    case 2:
      v3 = 255;
      v4 = 179;
      v5 = 64;
      break;
    case 1:
      v3 = 255;
      v4 = 105;
      v5 = 97;
      break;
    default:
      v8.receiver = self;
      v8.super_class = (Class)TLKVibrantDarkAppearance;
      -[TLKAppearance textColorForColor:](&v8, sel_textColorForColor_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
  }
  +[TLKAppearance colorWithRed:green:blue:](TLKAppearance, "colorWithRed:green:blue:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

@end
