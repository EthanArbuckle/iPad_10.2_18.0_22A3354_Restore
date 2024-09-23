@implementation TypistKeyboardPunjabi

- (id)init:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardPunjabi;
  return -[TypistKeyboard init:options:locale:](&v5, sel_init_options_locale_, a3, a4, CFSTR("pa"));
}

- (id)getPostfixKey:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  char v8;
  CGRect v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  if (CGRectGetHeight(v9) > 1194.0 && !-[TypistKeyboard isFloating](self, "isFloating"))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ਇ")) & 1) != 0)
    {

    }
    else
    {
      v8 = objc_msgSend(v4, "isEqualToString:", CFSTR("ਈ"));

      if ((v8 & 1) == 0)
        goto LABEL_4;
    }
    v6 = CFSTR("ੲ");
    goto LABEL_5;
  }

LABEL_4:
  v6 = (__CFString *)v4;
LABEL_5:

  return v6;
}

- (id)addAccentKeyAction:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];
  CGRect v16;

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  if (CGRectGetHeight(v16) <= 1194.0)
  {

  }
  else
  {
    v6 = -[TypistKeyboard isFloating](self, "isFloating");

    if (!v6)
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("ਇ")))
      {
        -[TypistKeyboard findKeyOnAnyPlane:](self, "findKeyOnAnyPlane:", CFSTR("ਿ"));
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v7)
        {
          v15[0] = v7;
          v9 = (void *)MEMORY[0x24BDBCE30];
          v10 = v15;
LABEL_12:
          objc_msgSend(v9, "arrayWithObjects:count:", v10, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

          goto LABEL_8;
        }
        goto LABEL_13;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("ਈ")))
      {
        -[TypistKeyboard findKeyOnAnyPlane:](self, "findKeyOnAnyPlane:", CFSTR("ੀ"));
        v13 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v13;
        if (v13)
        {
          v14 = v13;
          v9 = (void *)MEMORY[0x24BDBCE30];
          v10 = &v14;
          goto LABEL_12;
        }
LABEL_13:
        v11 = 0;
        goto LABEL_14;
      }
    }
  }
  v11 = 0;
LABEL_8:

  return v11;
}

@end
