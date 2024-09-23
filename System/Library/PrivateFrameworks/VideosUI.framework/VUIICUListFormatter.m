@implementation VUIICUListFormatter

- (VUIICUListFormatter)initWithLocale:(id)a3
{
  return -[VUIICUListFormatter initWithLocale:style:](self, "initWithLocale:style:", a3, 0);
}

- (VUIICUListFormatter)initWithLocale:(id)a3 style:(id)a4
{
  id v6;
  id v7;
  VUIICUListFormatter *v8;
  VUIICUListFormatter *v9;
  VUIICUListFormatter *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIICUListFormatter;
  v8 = -[NSListFormatter initWithLocale:](&v12, sel_initWithLocale_, v6);
  v9 = v8;
  if (v8)
  {
    -[VUIICUListFormatter setStyle:](v8, "setStyle:", v7);
    v10 = v9;
  }

  return v9;
}

- (void)setStyle:(id)a3
{
  __CFString *v4;
  __CFString *v5;

  v5 = (__CFString *)a3;
  if (-[__CFString length](v5, "length"))
    v4 = v5;
  else
    v4 = CFSTR("standard");
  objc_storeStrong((id *)&self->_style, v4);

}

- (id)_stringFromStringArray:(id)a3
{
  const __CFArray *v4;
  __CFListFormatter *v5;
  NSString *v6;
  __CFString *StringByStyleJoiningStrings;

  v4 = (const __CFArray *)a3;
  v5 = -[NSListFormatter _listFormatter](self, "_listFormatter");
  -[VUIICUListFormatter style](self, "style");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  StringByStyleJoiningStrings = (__CFString *)VUICFListFormatterCreateStringByStyleJoiningStrings((const __CFAllocator *)*MEMORY[0x1E0C9AE30], v5, v6, v4);

  return StringByStyleJoiningStrings;
}

+ (id)localizedStringByJoiningStrings:(id)a3
{
  objc_msgSend(a1, "localizedStringByJoiningStrings:style:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedStringByJoiningStrings:(id)a3 style:(id)a4
{
  id v5;
  id v6;
  void *v7;
  VUIICUListFormatter *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VUIICUListFormatter initWithLocale:style:]([VUIICUListFormatter alloc], "initWithLocale:style:", v7, v6);
  -[VUIICUListFormatter _stringFromStringArray:](v8, "_stringFromStringArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
}

@end
