@implementation SUScriptGradient

- (SUScriptGradient)init
{
  return -[SUScriptGradient initWithGradient:](self, "initWithGradient:", 0);
}

- (id)initLinearGradientWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6
{
  SUScriptGradient *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUScriptGradient;
  v10 = -[SUScriptObject init](&v12, sel_init);
  if (v10)
    v10->_nativeGradient = -[SUGradient initWithPoint0:point1:type:]([SUGradient alloc], "initWithPoint0:point1:type:", 0, a3, a4, 0.0, a5, a6, 0.0);
  return v10;
}

- (id)initRadialGraidentWithX0:(double)a3 y0:(double)a4 r0:(double)a5 x1:(double)a6 y1:(double)a7 r1:(double)a8
{
  SUScriptGradient *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SUScriptGradient;
  v14 = -[SUScriptObject init](&v16, sel_init);
  if (v14)
    v14->_nativeGradient = -[SUGradient initWithPoint0:point1:type:]([SUGradient alloc], "initWithPoint0:point1:type:", 1, a3, a4, a5, a6, a7, a8);
  return v14;
}

- (SUScriptGradient)initWithGradient:(id)a3
{
  SUScriptGradient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptGradient;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_nativeGradient = (SUGradient *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptGradient;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)copyNativeGradient
{
  SUGradient *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_nativeGradient;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)addColorStopWithOffset:(double)a3 color:(id)a4
{
  id v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      a4 = -[SUScriptColor initWithStyleString:]([SUScriptColor alloc], "initWithStyleString:", a4);
    }
    -[SUScriptObject lock](self, "lock");
    -[SUGradient addColorStopWithOffset:color:](self->_nativeGradient, "addColorStopWithOffset:color:", objc_msgSend((id)objc_msgSend(a4, "nativeColor"), "CGColor"), a3);
    -[SUScriptObject unlock](self, "unlock");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (id)patternColorWithWidth:(double)a3 height:(double)a4 opaque:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  SUScriptColor *v10;

  v5 = a5;
  -[SUScriptObject lock](self, "lock");
  v9 = -[SUGradient newPatternColorWithSize:opaque:](self->_nativeGradient, "newPatternColorWithSize:opaque:", v5, a3, a4);
  -[SUScriptObject unlock](self, "unlock");
  if (v9)
    v10 = -[SUScriptColor initWithUIColor:]([SUScriptColor alloc], "initWithUIColor:", v9);
  else
    v10 = 0;

  return v10;
}

- (id)_className
{
  return CFSTR("iTunesGradient");
}

- (NSString)type
{
  const __CFString *v3;

  -[SUScriptObject lock](self, "lock");
  if (-[SUGradient gradientType](self->_nativeGradient, "gradientType") == 1)
    v3 = CFSTR("radial");
  else
    v3 = CFSTR("linear");
  -[SUScriptObject unlock](self, "unlock");
  return &v3->isa;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_32, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptGradient;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_26, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptGradient;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptGradient;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_32, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_26 = (uint64_t)sel_addColorStopWithOffset_color_;
    unk_255186710 = CFSTR("addColorStop");
    qword_255186718 = (uint64_t)sel_patternColorWithWidth_height_opaque_;
    unk_255186720 = CFSTR("getPatternColor");
    __KeyMapping_32 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("type"), 0);
  }
}

@end
