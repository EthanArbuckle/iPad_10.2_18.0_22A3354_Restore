@implementation TLKVibrantLightAppearance

- (unint64_t)style
{
  return 2;
}

- (id)name
{
  return CFSTR("Vibrant Light");
}

- (BOOL)isVibrant
{
  return 1;
}

- (id)primaryColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

- (id)secondaryColor
{
  return -[TLKAppearance primaryColorWithDefaultAlpha:](self, "primaryColorWithDefaultAlpha:", 0.6);
}

- (id)tertiaryColor
{
  return -[TLKAppearance primaryColorWithDefaultAlpha:](self, "primaryColorWithDefaultAlpha:", 0.2);
}

- (id)quaternaryColor
{
  return -[TLKAppearance primaryColorWithDefaultAlpha:](self, "primaryColorWithDefaultAlpha:", 0.1);
}

- (id)compositingFilter
{
  return (id)*MEMORY[0x1E0CD2E98];
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
      v3 = 28;
      v4 = 188;
      v5 = 52;
      break;
    case 2:
      v3 = 255;
      v4 = 132;
      v5 = 0;
      break;
    case 1:
      v3 = 255;
      v4 = 59;
      v5 = 48;
      break;
    default:
      v8.receiver = self;
      v8.super_class = (Class)TLKVibrantLightAppearance;
      -[TLKAppearance textColorForColor:](&v8, sel_textColorForColor_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
  }
  +[TLKAppearance colorWithRed:green:blue:](TLKAppearance, "colorWithRed:green:blue:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

@end
