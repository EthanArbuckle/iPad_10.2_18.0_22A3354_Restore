@implementation REMColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckSymbolicColorName, 0);
  objc_storeStrong((id *)&self->_daHexString, 0);
  objc_storeStrong((id *)&self->_daSymbolicColorName, 0);
}

- (REMColor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  REMColor *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  uint64_t v21;
  NSObject *v22;
  REMColor *v23;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daSymbolicColorName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daHexString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ckSymbolicColorName"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = 0;
  else
    v9 = v6 == 0;
  if (v9 && v7 == 0)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("red"));
    v13 = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("green"));
    v15 = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("blue"));
    v17 = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("alpha"));
    v19 = v18;
    v20 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("colorRGBSpace"));
    v21 = (int)v20;
    if (v20 >= 3)
    {
      v22 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[REMColor initWithCoder:].cold.1(v21, v22);

      v21 = 2;
    }
    v11 = -[REMColor initWithRed:green:blue:alpha:colorSpace:](self, "initWithRed:green:blue:alpha:colorSpace:", v21, v13, v15, v17, v19);
  }
  else
  {
    v11 = -[REMColor initWithDASymbolicColorName:daHexString:ckSymbolicColorName:](self, "initWithDASymbolicColorName:daHexString:ckSymbolicColorName:", v5, v6, v7);
  }
  v23 = v11;

  return v23;
}

- (REMColor)initWithDASymbolicColorName:(id)a3 daHexString:(id)a4 ckSymbolicColorName:(id)a5
{
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  REMColor *v18;
  id v19;
  REMColor *v20;
  id *p_isa;

  v8 = a3;
  v9 = (__CFString *)a5;
  objc_msgSend(a4, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x1E0DDBBD0];
  if (!v8)
    v8 = v11;
  v12 = v8;
  if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
  {
    v13 = v10;
    v14 = v13;
  }
  else
  {
    EKSymbolicColorToRGBMapping();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v16;
    if (v10)
      v17 = v10;
    else
      v17 = (void *)v16;
    v13 = v17;

  }
  v18 = 0;
  if (v14 && v13)
  {
    if (!v9)
    {
      if (REMSymbolicColorIsSupportedByCK(v12))
        v9 = (__CFString *)v12;
      else
        v9 = CFSTR("custom");
    }
    v19 = v14;
    v20 = -[REMColor initWithHexString:](self, "initWithHexString:", v19);
    p_isa = (id *)&v20->super.isa;
    if (v20)
    {
      objc_storeStrong((id *)&v20->_daSymbolicColorName, v8);
      objc_storeStrong(p_isa + 7, v13);
      objc_storeStrong(p_isa + 8, v9);
    }
    self = p_isa;

    v18 = self;
  }

  return v18;
}

- (REMColor)initWithHexString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  REMColor *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  REMColor *v35;
  uint64_t v37;
  uint64_t v38;

  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "hasPrefix:", CFSTR("#")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("white")))
    {
      +[REMColor whiteColor](REMColor, "whiteColor");
      v10 = (REMColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("black")))
      {
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("red")))
        {
          +[REMColor redColor](REMColor, "redColor");
          v10 = (REMColor *)objc_claimAutoreleasedReturnValue();
          goto LABEL_30;
        }
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("green")))
        {
          +[REMColor greenColor](REMColor, "greenColor");
          v10 = (REMColor *)objc_claimAutoreleasedReturnValue();
          goto LABEL_30;
        }
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("blue")))
        {
          +[REMColor blueColor](REMColor, "blueColor");
          v10 = (REMColor *)objc_claimAutoreleasedReturnValue();
          goto LABEL_30;
        }
        goto LABEL_25;
      }
      +[REMColor blackColor](REMColor, "blackColor");
      v10 = (REMColor *)objc_claimAutoreleasedReturnValue();
    }
LABEL_30:
    v35 = v10;
    goto LABEL_31;
  }
  objc_msgSend(v4, "substringFromIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  v38 = 0;
  if (objc_msgSend(v5, "length") == 8)
  {
    objc_msgSend(v5, "substringFromIndex:", 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringToIndex:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "scanHexInt:", &v37);

    objc_msgSend(v5, "substringToIndex:", 6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LODWORD(v37) = 255;
    v9 = 1;
    v4 = v5;
  }
  if (objc_msgSend(v4, "length", v37) != 6)
  {
    if (objc_msgSend(v4, "length") != 3)
      goto LABEL_25;
    objc_msgSend(v4, "substringToIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "substringToIndex:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "substringFromIndex:", 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "substringToIndex:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v11);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "scanHexInt:", (char *)&v38 + 4);

      if (v30)
      {
        objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v13);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "scanHexInt:", &v38);

        if (v32)
        {
          objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v15);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "scanHexInt:", (char *)&v37 + 4);

          LODWORD(v37) = 15;
          v26 = 15.0;
          if (v34)
            goto LABEL_20;
          goto LABEL_25;
        }
      }
    }
    LODWORD(v37) = 15;
LABEL_24:

    goto LABEL_25;
  }
  objc_msgSend(v4, "substringToIndex:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringFromIndex:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "substringToIndex:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "substringFromIndex:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "substringToIndex:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_24;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "scanHexInt:", (char *)&v38 + 4);

  if (!v17)
    goto LABEL_24;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "scanHexInt:", &v38);

  if ((v19 & 1) == 0)
    goto LABEL_24;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "scanHexInt:", (char *)&v37 + 4);

  if ((v21 & 1) != 0)
  {
    v26 = 255.0;
LABEL_20:
    LODWORD(v22) = HIDWORD(v38);
    LODWORD(v23) = v38;
    LODWORD(v24) = HIDWORD(v37);
    LODWORD(v25) = v37;
    v10 = -[REMColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", (double)v22 / v26, (double)v23 / v26, (double)v24 / v26, (double)v25 / v26);
    self = v10;
    goto LABEL_30;
  }
LABEL_25:
  v35 = 0;
LABEL_31:

  return v35;
}

- (REMColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7
{
  REMColor *v12;
  REMColor *v13;
  uint64_t v14;
  NSString *daHexString;
  NSString *ckSymbolicColorName;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)REMColor;
  v12 = -[REMColor init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_blue = a5;
    v12->_red = a3;
    v12->_green = a4;
    v12->_alpha = a6;
    v12->_colorRGBSpace = a7;
    objc_storeStrong((id *)&v12->_daSymbolicColorName, (id)*MEMORY[0x1E0DDBBD0]);
    -[REMColor hexString](v13, "hexString");
    v14 = objc_claimAutoreleasedReturnValue();
    daHexString = v13->_daHexString;
    v13->_daHexString = (NSString *)v14;

    ckSymbolicColorName = v13->_ckSymbolicColorName;
    v13->_ckSymbolicColorName = (NSString *)CFSTR("custom");

  }
  return v13;
}

- (REMColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return -[REMColor initWithRed:green:blue:alpha:colorSpace:](self, "initWithRed:green:blue:alpha:colorSpace:", 2, a3, a4, a5, a6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[REMColor red](self, "red");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("red"));
  -[REMColor green](self, "green");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("green"));
  -[REMColor blue](self, "blue");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("blue"));
  -[REMColor alpha](self, "alpha");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("alpha"));
  objc_msgSend(v4, "encodeInt:forKey:", -[REMColor colorRGBSpace](self, "colorRGBSpace"), CFSTR("colorRGBSpace"));
  -[REMColor daSymbolicColorName](self, "daSymbolicColorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("daSymbolicColorName"));

  -[REMColor daHexString](self, "daHexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("daHexString"));

  -[REMColor ckSymbolicColorName](self, "ckSymbolicColorName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ckSymbolicColorName"));

}

- (id)hexString
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[REMColor red](self, "red");
  v5 = (int)(v4 * 255.0 + 0.5);
  -[REMColor green](self, "green");
  v7 = (int)(v6 * 255.0 + 0.5);
  -[REMColor blue](self, "blue");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("#%02X%02X%02X"), v5, v7, (int)(v8 * 255.0 + 0.5));
}

- (double)red
{
  return self->_red;
}

- (double)green
{
  return self->_green;
}

- (double)blue
{
  return self->_blue;
}

- (NSString)ckSymbolicColorName
{
  return self->_ckSymbolicColorName;
}

- (double)alpha
{
  return self->_alpha;
}

- (NSString)daSymbolicColorName
{
  return self->_daSymbolicColorName;
}

- (NSString)daHexString
{
  return self->_daHexString;
}

- (unint64_t)colorRGBSpace
{
  return self->_colorRGBSpace;
}

+ (REMColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return (REMColor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

+ (REMColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7
{
  return (REMColor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:colorSpace:", a7, a3, a4, a5, a6);
}

+ (REMColor)colorWithHexString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHexString:", v4);

  return (REMColor *)v5;
}

+ (id)clearColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.0, 0.0);
}

+ (id)blackColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.0, 1.0);
}

+ (id)whiteColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 1.0, 1.0);
}

+ (id)grayColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.5, 1.0);
}

+ (id)lightGrayColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.667, 1.0);
}

+ (id)redColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 1.0);
}

+ (id)greenColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 1.0);
}

+ (id)blueColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 1.0);
}

+ (id)cyanColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.0, 1.0, 1.0, 1.0);
}

+ (id)yellowColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 1.0, 0.0, 1.0);
}

+ (id)magentaColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 0.0, 1.0, 1.0);
}

+ (id)orangeColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 0.5, 0.0, 1.0);
}

+ (id)purpleColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.5, 0.0, 0.5, 1.0);
}

+ (id)brownColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.6, 0.4, 0.2, 1.0);
}

- (REMColor)initWithWhite:(double)a3 alpha:(double)a4
{
  return -[REMColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", a3, a3, a3, a4);
}

- (REMColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7 daSymbolicColorName:(id)a8 daHexString:(id)a9 ckSymbolicColorName:(id)a10
{
  id v19;
  id v20;
  id v21;
  REMColor *v22;
  REMColor *v23;
  objc_super v25;

  v19 = a8;
  v20 = a9;
  v21 = a10;
  v25.receiver = self;
  v25.super_class = (Class)REMColor;
  v22 = -[REMColor init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_blue = a5;
    v22->_red = a3;
    v22->_green = a4;
    v22->_alpha = a6;
    v22->_colorRGBSpace = a7;
    objc_storeStrong((id *)&v22->_daSymbolicColorName, a8);
    objc_storeStrong((id *)&v23->_daHexString, a9);
    objc_storeStrong((id *)&v23->_ckSymbolicColorName, a10);
  }

  return v23;
}

- (REMColor)initWithDASymbolicColorName:(id)a3 daHexString:(id)a4
{
  return -[REMColor initWithDASymbolicColorName:daHexString:ckSymbolicColorName:](self, "initWithDASymbolicColorName:daHexString:ckSymbolicColorName:", a3, a4, 0);
}

- (REMColor)initWithCKSymbolicColorName:(id)a3 hexString:(id)a4
{
  __CFString *v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  REMColor *v16;

  v6 = (__CFString *)a3;
  v7 = a4;
  if (v6)
    v8 = v6;
  else
    v8 = CFSTR("custom");
  v9 = v8;
  if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("custom")) & 1) != 0)
  {
    v10 = (__CFString *)(id)*MEMORY[0x1E0DDBBD0];
    v11 = v7;
LABEL_14:
    self = -[REMColor initWithDASymbolicColorName:daHexString:ckSymbolicColorName:](self, "initWithDASymbolicColorName:daHexString:ckSymbolicColorName:", v10, v11, v9);
    v16 = self;
    goto LABEL_15;
  }
  ckSymbolicColorNameToRGBMapping();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    if (REMSymbolicColorIsSupportedByDA(v9))
    {
      v10 = v9;
      v15 = v7;
    }
    else
    {
      v10 = (__CFString *)(id)*MEMORY[0x1E0DDBBD0];
      if (v7)
        v15 = v7;
      else
        v15 = v14;
    }
    v11 = v15;

    goto LABEL_14;
  }

  v11 = 0;
  v10 = 0;
  v16 = 0;
LABEL_15:

  return v16;
}

- (id)hexStringWithAlpha
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[REMColor red](self, "red");
  v5 = (int)(v4 * 255.0 + 0.5);
  -[REMColor green](self, "green");
  v7 = (int)(v6 * 255.0 + 0.5);
  -[REMColor blue](self, "blue");
  v9 = (int)(v8 * 255.0 + 0.5);
  -[REMColor alpha](self, "alpha");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("#%02X%02X%02X%02X"), v5, v7, v9, (int)(v10 * 255.0 + 0.5));
}

- (BOOL)isEqual:(id)a3
{
  REMColor *v4;
  REMColor *v5;
  REMColor *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  unint64_t v33;

  v4 = (REMColor *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMColor hexStringWithAlpha](self, "hexStringWithAlpha");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMColor hexStringWithAlpha](v6, "hexStringWithAlpha");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMColor hexStringWithAlpha](self, "hexStringWithAlpha");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMColor hexStringWithAlpha](v6, "hexStringWithAlpha");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_18;
      }
      -[REMColor daSymbolicColorName](self, "daSymbolicColorName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMColor daSymbolicColorName](v6, "daSymbolicColorName");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[REMColor daSymbolicColorName](self, "daSymbolicColorName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMColor daSymbolicColorName](v6, "daSymbolicColorName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_18;
      }
      -[REMColor daHexString](self, "daHexString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMColor daHexString](v6, "daHexString");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[REMColor daHexString](self, "daHexString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMColor daHexString](v6, "daHexString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_18;
      }
      -[REMColor ckSymbolicColorName](self, "ckSymbolicColorName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMColor ckSymbolicColorName](v6, "ckSymbolicColorName");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[REMColor ckSymbolicColorName](self, "ckSymbolicColorName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMColor ckSymbolicColorName](v6, "ckSymbolicColorName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_18;
      }
      v33 = -[REMColor colorRGBSpace](self, "colorRGBSpace");
      v13 = v33 == -[REMColor colorRGBSpace](v6, "colorRGBSpace");
      goto LABEL_19;
    }
LABEL_18:
    v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v13 = 1;
LABEL_20:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  -[REMColor hexStringWithAlpha](self, "hexStringWithAlpha");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[REMColor daSymbolicColorName](self, "daSymbolicColorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[REMColor daHexString](self, "daHexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[REMColor colorRGBSpace](self, "colorRGBSpace");

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[REMColor red](self, "red");
  v5 = v4;
  -[REMColor green](self, "green");
  v7 = v6;
  -[REMColor blue](self, "blue");
  v9 = v8;
  -[REMColor alpha](self, "alpha");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("REMColor:rgba(%lf,%lf,%lf,%lf)"), v5, v7, v9, v10);
}

+ (REMColor)colorWithDictionaryData:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  REMColor *v9;
  BOOL v10;
  NSObject *v11;
  id v13;

  v5 = (objc_class *)MEMORY[0x1E0CB3710];
  v6 = a3;
  v13 = 0;
  v7 = (void *)objc_msgSend([v5 alloc], "initForReadingFromData:error:", v6, &v13);

  v8 = v13;
  v9 = -[REMColor initWithCoder:]([REMColor alloc], "initWithCoder:", v7);
  if (v9)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (!v10)
  {
    +[REMLog utility](REMLog, "utility");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[REMColor colorWithDictionaryData:error:].cold.1((uint64_t)v8, v11);

    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v9;
}

- (id)archivedDictionaryDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[REMColor encodeWithCoder:](self, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[REMLog utility](REMLog, "utility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[REMColor archivedDictionaryDataWithError:].cold.1(v6);

  }
  return v5;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Unknown REMColorRGBSpace %ld", (uint8_t *)&v2, 0xCu);
}

+ (void)colorWithDictionaryData:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Error decoding color {error: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)archivedDictionaryDataWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B4A39000, log, OS_LOG_TYPE_ERROR, "Error encoding color", v1, 2u);
}

@end
