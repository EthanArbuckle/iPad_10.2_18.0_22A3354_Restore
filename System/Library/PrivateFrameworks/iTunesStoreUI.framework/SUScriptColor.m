@implementation SUScriptColor

- (SUScriptColor)initWithUIColor:(id)a3
{
  SUScriptColor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptColor;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_color = (UIColor *)a3;
  return v4;
}

- (SUScriptColor)initWithStyleString:(id)a3
{
  SUScriptColor *v4;
  CGColorRef v5;
  CGColor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUScriptColor;
  v4 = -[SUScriptObject init](&v8, sel_init);
  if (v4)
  {
    v5 = SUCreateColorFromStyleString(a3);
    if (v5)
    {
      v6 = v5;
      v4->_color = (UIColor *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithCGColor:", v5);
      CGColorRelease(v6);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptColor;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (CGColor)copyCGColor
{
  CGColor *v2;
  CGColor *v3;

  v2 = -[UIColor CGColor](-[SUScriptColor nativeColor](self, "nativeColor"), "CGColor");
  v3 = v2;
  if (v2)
    CGColorRetain(v2);
  return v3;
}

- (UIColor)nativeColor
{
  UIColor *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_color;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)stringRepresentation
{
  double v4;
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  -[SUScriptObject lock](self, "lock");
  SUColorGetRGBA(-[UIColor CGColor](self->_color, "CGColor"), &v7, &v6, &v5, &v4);
  -[SUScriptObject unlock](self, "unlock");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rgba(%.0f, %.0f, %.0f, %.0f)"), v7 * 255.0, v6 * 255.0, v5 * 255.0, v4 * 255.0);
}

- (void)setHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  -[SUScriptObject lock](self, "lock");

  self->_color = (UIColor *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithHue:saturation:brightness:alpha:", a3, a4, a5, a6);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  -[SUScriptObject lock](self, "lock");

  self->_color = (UIColor *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithRed:green:blue:alpha:", a3, a4, a5, a6);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setWhite:(double)a3 alpha:(double)a4
{
  -[SUScriptObject lock](self, "lock");

  self->_color = (UIColor *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithWhite:alpha:", a3, a4);
  -[SUScriptObject unlock](self, "unlock");
}

- (double)alpha
{
  double v4;

  v4 = 0.0;
  -[SUScriptObject lock](self, "lock");
  SUColorGetRGBA(-[UIColor CGColor](self->_color, "CGColor"), 0, 0, 0, &v4);
  -[SUScriptObject unlock](self, "unlock");
  return v4;
}

- (double)blue
{
  double v4;

  v4 = 0.0;
  -[SUScriptObject lock](self, "lock");
  SUColorGetRGBA(-[UIColor CGColor](self->_color, "CGColor"), 0, 0, &v4, 0);
  -[SUScriptObject unlock](self, "unlock");
  return v4;
}

- (id)_className
{
  return CFSTR("iTunesColor");
}

- (double)green
{
  double v4;

  v4 = 0.0;
  -[SUScriptObject lock](self, "lock");
  SUColorGetRGBA(-[UIColor CGColor](self->_color, "CGColor"), 0, &v4, 0, 0);
  -[SUScriptObject unlock](self, "unlock");
  return v4;
}

- (double)red
{
  double v4;

  v4 = 0.0;
  -[SUScriptObject lock](self, "lock");
  SUColorGetRGBA(-[UIColor CGColor](self->_color, "CGColor"), &v4, 0, 0, 0);
  -[SUScriptObject unlock](self, "unlock");
  return v4;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_31, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptColor;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_25, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptColor;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptColor;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_31, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_25 = (uint64_t)sel_setHue_saturation_brightness_alpha_;
    *(_QWORD *)algn_2551866D8 = CFSTR("setHSBA");
    qword_2551866E0 = (uint64_t)sel_setRed_green_blue_alpha_;
    unk_2551866E8 = CFSTR("setRGBA");
    qword_2551866F0 = (uint64_t)sel_setWhite_alpha_;
    unk_2551866F8 = CFSTR("setWhite");
    __KeyMapping_31 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("alpha"), CFSTR("blue"), CFSTR("blue"), CFSTR("green"), CFSTR("green"), CFSTR("red"), CFSTR("red"), 0);
  }
}

@end
