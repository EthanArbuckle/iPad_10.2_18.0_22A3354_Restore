@implementation PRMonogram

- (id)stringAttributesForDiameter:(double)a3
{
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  +[PRMonogram fontForIndex:plateDiameter:](PRMonogram, "fontForIndex:plateDiameter:", -[PRMonogram fontIndex](self, "fontIndex"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PRMonogram fontIndex](self, "fontIndex");
  objc_msgSend(v4, "pointSize");
  +[PRMonogram kerningForFontIndex:fontSize:](PRMonogram, "kerningForFontIndex:fontSize:", v5);
  v7 = v6;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setAlignment:", 1);
  objc_msgSend(v8, "setAllowsDefaultTighteningForTruncation:", 1);
  v9 = *MEMORY[0x24BEBB360];
  v16[0] = v4;
  v10 = *MEMORY[0x24BEBB368];
  v15[0] = v9;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  v15[2] = *MEMORY[0x24BEBB378];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = *MEMORY[0x24BEBB3A8];
  v16[2] = v12;
  v16[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)appendToRecipe:(id)a3 text:(id)a4 fontIndex:(unsigned __int8)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  size_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  char v16;
  char v17;

  v7 = a3;
  v8 = (void *)objc_msgSend(a4, "copy");
  v9 = v8;
  if (v8 && (v10 = objc_retainAutorelease(v8), objc_msgSend(v10, "UTF8String")))
  {
    v11 = objc_retainAutorelease(v10);
    v12 = strlen((const char *)objc_msgSend(v11, "UTF8String"));
    v17 = a5 & 0xF | (16 * v12);
    objc_msgSend(v7, "appendBytes:length:", &v17, 1);
    v13 = (char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    v14 = v7;
    v15 = v12;
  }
  else
  {
    v16 = a5 & 0xF;
    v13 = &v16;
    v14 = v7;
    v15 = 1;
  }
  objc_msgSend(v14, "appendBytes:length:", v13, v15);

}

- (BOOL)_renderTextInContext:(CGContext *)a3 frame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  const __CTLine *v11;
  double TypographicBounds;
  BOOL v13;
  double v14;
  CGFloat MidX;
  CGFloat MidY;
  double v17;
  _QWORD v19[11];
  CGFloat descent;
  CGFloat ascent;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[PRMonogram text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  -[PRMonogram stringAttributesForDiameter:](self, "stringAttributesForDiameter:", CGRectGetWidth(v22));
  v11 = (const __CTLine *)CTLineCreateWithString();

  if (!v11)
    return 0;
  descent = 0.0;
  ascent = 0.0;
  TypographicBounds = CTLineGetTypographicBounds(v11, &ascent, &descent, 0);
  v13 = TypographicBounds > 0.0;
  if (TypographicBounds > 0.0)
  {
    v14 = TypographicBounds;
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    MidX = CGRectGetMidX(v23);
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    MidY = CGRectGetMidY(v24);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v17 = CGRectGetWidth(v25) * 0.800000012 / v14;
    if (v17 > 1.0)
      v17 = 1.0;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __41__PRMonogram__renderTextInContext_frame___block_invoke;
    v19[3] = &__block_descriptor_88_e5_v8__0l;
    v19[4] = a3;
    *(CGFloat *)&v19[5] = MidX;
    *(CGFloat *)&v19[6] = MidY;
    *(double *)&v19[7] = v17;
    *(double *)&v19[8] = v14 * 0.5;
    *(double *)&v19[9] = (ascent - descent) * 0.5;
    v19[10] = v11;
    UIGraphicsPushContext(a3);
    __41__PRMonogram__renderTextInContext_frame___block_invoke((uint64_t)v19);
    UIGraphicsPopContext();
  }
  CFRelease(v11);
  return v13;
}

- (id)dataRepresentationWithVersion:(unsigned __int8)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  _BYTE v18[4];
  double v19;
  double v20;
  double v21;
  double v22;
  unsigned __int8 v23;

  v23 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  objc_msgSend(v4, "appendBytes:length:", &v23, 1);
  -[PRMonogram text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PRMonogram text](self, "text");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "UTF8String");

    if (!v7)
      NSLog(CFSTR("PRMonogram cannot create data representation with NULL self.text.UTF8String, using empty string instead."));
  }
  else
  {
    NSLog(CFSTR("PRMonogram cannot create data representation with nil self.text, using empty string instead."));
  }
  -[PRMonogram text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRMonogram appendToRecipe:text:fontIndex:](self, "appendToRecipe:text:fontIndex:", v4, v8, -[PRMonogram fontIndex](self, "fontIndex"));

  if (v23)
  {
    -[PRMonogram monogramColor](self, "monogramColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRMonogram appendToRecipe:text:](self, "appendToRecipe:text:", v4, v10);

  }
  else
  {
    v21 = 0.0;
    v22 = 0.0;
    v19 = 0.0;
    v20 = 0.0;
    -[PRMonogram color](self, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "getRed:green:blue:alpha:", &v22, &v21, &v20, &v19);

    if (v12)
    {
      v13 = (int)(v22 * 255.0);
      v14 = (int)(v21 * 255.0);
      v15 = (int)(v20 * 255.0);
      v16 = (int)(v19 * 255.0);
    }
    else
    {
      v19 = 1.0;
      v20 = 1.0;
      v21 = 1.0;
      v22 = 1.0;
      LOBYTE(v16) = -1;
      LOBYTE(v15) = -1;
      LOBYTE(v14) = -1;
      LOBYTE(v13) = -1;
    }
    v18[0] = v13;
    v18[1] = v14;
    v18[2] = v15;
    v18[3] = v16;
    objc_msgSend(v4, "appendBytes:length:", v18, 4);
  }
  return v4;
}

- (PRMonogram)initWithText:(id)a3 fontIndex:(unint64_t)a4 monogramColor:(id)a5
{
  id v8;
  id v9;
  PRMonogram *v10;
  PRMonogram *v11;
  PRMonogram *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PRMonogram;
  v10 = -[PRMonogram init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_text, a3);
    v11->_fontIndex = 0;
    objc_storeStrong((id *)&v11->_monogramColor, a5);
    v12 = v11;
  }

  return v11;
}

void __24__PRMonogram__fontSpecs__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[10];

  v11[9] = *MEMORY[0x24BDAC8D0];
  +[_PRMonogramFontSpec specForFontWithName:baseSize:tracking:](_PRMonogramFontSpec, "specForFontWithName:baseSize:tracking:", 0, 105.0, 0.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PRMonogramFontSpec specForFontWithName:baseSize:tracking:](_PRMonogramFontSpec, "specForFontWithName:baseSize:tracking:", CFSTR("AmericanTypewriter-CondensedBold"), 113.0, 30.0, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v1;
  +[_PRMonogramFontSpec specForFontWithName:baseSize:tracking:](_PRMonogramFontSpec, "specForFontWithName:baseSize:tracking:", CFSTR("Baskerville-Bold"), 98.0, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v2;
  +[_PRMonogramFontSpec specForFontWithName:baseSize:tracking:](_PRMonogramFontSpec, "specForFontWithName:baseSize:tracking:", CFSTR("Futura-Medium"), 89.0, -20.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v3;
  +[_PRMonogramFontSpec specForFontWithName:baseSize:tracking:](_PRMonogramFontSpec, "specForFontWithName:baseSize:tracking:", CFSTR("Cochin-BoldItalic"), 86.0, 40.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v4;
  +[_PRMonogramFontSpec specForFontWithName:baseSize:tracking:](_PRMonogramFontSpec, "specForFontWithName:baseSize:tracking:", CFSTR("SuperClarendon-Regular"), 94.0, -20.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v5;
  +[_PRMonogramFontSpec specForFontWithName:baseSize:tracking:](_PRMonogramFontSpec, "specForFontWithName:baseSize:tracking:", CFSTR("Palatino-Bold"), 95.0, -10.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v6;
  +[_PRMonogramFontSpec specForFontWithName:baseSize:tracking:](_PRMonogramFontSpec, "specForFontWithName:baseSize:tracking:", CFSTR("Noteworthy-Bold"), 105.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[7] = v7;
  +[_PRMonogramFontSpec specForFontWithName:baseSize:tracking:](_PRMonogramFontSpec, "specForFontWithName:baseSize:tracking:", CFSTR("HoeflerText-Regular"), 118.0, -20.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[8] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 9);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_fontSpecs_fontSpecs;
  _fontSpecs_fontSpecs = v9;

}

- (id)snapshotWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5
{
  double height;
  double width;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v10;
  size_t v11;
  CGContextRef v12;
  CGContext *v13;
  double v14;
  id v15;
  id v16;
  CGColorRef v17;
  id v18;
  CGColorRef v19;
  __CFArray *Mutable;
  __CFArray *v21;
  CGGradient *v22;
  CGGradient *v23;
  CGImageRef Image;
  CGImage *v25;
  void *v26;
  CGPoint v28;
  CGPoint v29;
  CGRect v30;

  height = a3.height;
  width = a3.width;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v10 = DeviceRGB;
    v11 = (unint64_t)(width * a4);
    v12 = CGBitmapContextCreate(0, v11, v11, 8uLL, 4 * v11, DeviceRGB, 0x2001u);
    if (v12)
    {
      v13 = v12;
      v14 = (double)v11;
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(v13, (CGColorRef)objc_msgSend(v15, "CGColor"));

      CGContextSetAlpha(v13, 0.9);
      v30.origin.x = 0.0;
      v30.origin.y = 0.0;
      v30.size.width = v14;
      v30.size.height = v14;
      CGContextFillRect(v13, v30);
      -[PRMonogram plateGradientStartColor](self, "plateGradientStartColor");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = CGColorRetain((CGColorRef)objc_msgSend(v16, "CGColor"));

      if (v17)
      {
        -[PRMonogram plateGradientEndColor](self, "plateGradientEndColor");
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v19 = CGColorRetain((CGColorRef)objc_msgSend(v18, "CGColor"));

        if (v19)
        {
          Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x24BDBD690]);
          if (Mutable)
          {
            v21 = Mutable;
            CFArrayAppendValue(Mutable, v17);
            CFArrayAppendValue(v21, v19);
            CGContextSetAlpha(v13, 1.0);
            v22 = CGGradientCreateWithColors(v10, v21, 0);
            if (v22)
            {
              v23 = v22;
              v28.x = 0.0;
              v28.y = 0.0;
              v29.x = 0.0;
              v29.y = v14;
              CGContextDrawLinearGradient(v13, v22, v28, v29, 0);
              -[PRMonogram _renderTextInContext:frame:](self, "_renderTextInContext:frame:", v13, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v14, v14);
              Image = CGBitmapContextCreateImage(v13);
              if (Image)
              {
                v25 = Image;
                objc_msgSend(MEMORY[0x24BDF6AC8], "pr_imageWithCGImage:size:scale:", Image, width, height, a4);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                CGImageRelease(v25);
              }
              else
              {
                v26 = 0;
              }
              CGGradientRelease(v23);
            }
            else
            {
              v26 = 0;
            }
            CFRelease(v21);
          }
          else
          {
            v26 = 0;
          }
          CGColorRelease(v19);
        }
        else
        {
          v26 = 0;
        }
        CGColorRelease(v17);
      }
      else
      {
        v26 = 0;
      }
      CGContextRelease(v13);
    }
    else
    {
      v26 = 0;
    }
    CGColorSpaceRelease(v10);
  }
  else
  {
    v26 = 0;
  }
  return v26;
}

void __41__PRMonogram__renderTextInContext_frame___block_invoke(uint64_t a1)
{
  CGContextTranslateCTM(*(CGContextRef *)(a1 + 32), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(*(CGContextRef *)(a1 + 32), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 56));
  CGContextSetTextPosition(*(CGContextRef *)(a1 + 32), -*(double *)(a1 + 64), -*(double *)(a1 + 72));
  CTLineDraw(*(CTLineRef *)(a1 + 80), *(CGContextRef *)(a1 + 32));
}

- (id)dataRepresentation
{
  return -[PRMonogram dataRepresentationWithVersion:](self, "dataRepresentationWithVersion:", 1);
}

- (void)appendToRecipe:(id)a3 text:(id)a4
{
  -[PRMonogram appendToRecipe:text:fontIndex:](self, "appendToRecipe:text:fontIndex:", a3, a4, 0);
}

- (void)_takeValuesFromDataRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  _BYTE *v12;
  unint64_t v13;
  unsigned int v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _BYTE *v28;
  void *v29;
  PRMonogramColor *v30;
  _BYTE v31[12];
  _BYTE v32[12];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") <= 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("PRMonogram failed to create from data representation with length %@"), v5);
LABEL_3:

    goto LABEL_4;
  }
  v6 = objc_retainAutorelease(v4);
  v7 = (unsigned __int8 *)objc_msgSend(v6, "bytes");
  v8 = *v7;
  if (v8 > 1)
  {
    if ((v8 & 1) == 0)
      goto LABEL_4;
    v22 = v7[1];
    v23 = v22 >> 4;
    if (v22 > 0xCF || objc_msgSend(v6, "length") < v23 + 2)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PRMonogram failed to create from future data representation of length %@ version %@ textByteLength %@"), v5, v24, v25);

      goto LABEL_3;
    }
    objc_msgSend(v6, "getBytes:range:", v32, 2, v23);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v32, v23, 4);
    -[PRMonogram setText:](self, "setText:", v21);
LABEL_20:

    goto LABEL_4;
  }
  v9 = v7[1];
  v10 = v9 >> 4;
  v11 = &v7[v9 >> 4];
  v14 = v11[2];
  v12 = v11 + 2;
  v13 = v14;
  if ((v9 & 0xF) <= 8)
    v15 = v9 & 0xF;
  else
    v15 = 0;
  self->_fontIndex = v15;
  if (!(_DWORD)v8 && v9 <= 0xCF && objc_msgSend(v6, "length") == (_DWORD)v10 + 6)
  {
    objc_msgSend(v6, "getBytes:range:", v32, 2, v10);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v32, v10, 4);
    -[PRMonogram setText:](self, "setText:", v16);

    LOBYTE(v17) = *v12;
    LOBYTE(v18) = v12[1];
    LOBYTE(v19) = v12[2];
    LOBYTE(v20) = v12[3];
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (double)v17 / 255.0, (double)v18 / 255.0, (double)v19 / 255.0, (double)v20 / 255.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRMonogram setColor:](self, "setColor:", v21);
    goto LABEL_20;
  }
  objc_msgSend(v6, "getBytes:range:", v32, 2, v10);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v32, v10, 4);
  -[PRMonogram setText:](self, "setText:", v26);

  if (v13 >= 0x10)
  {
    MEMORY[0x24BDAC7A8]();
    v28 = &v31[-v27];
    objc_msgSend(v6, "getBytes:range:", &v31[-v27]);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v28, v13 >> 4, 4);
    v30 = -[PRMonogramColor initWithColorName:]([PRMonogramColor alloc], "initWithColorName:", v29);
    -[PRMonogram setMonogramColor:](self, "setMonogramColor:", v30);

  }
LABEL_4:

}

- (id)_initWithData:(id)a3
{
  id v4;
  PRMonogram *v5;
  PRMonogram *v6;

  v4 = a3;
  v5 = -[PRMonogram init](self, "init");
  v6 = v5;
  if (v4 && v5)
    -[PRMonogram _takeValuesFromDataRepresentation:](v5, "_takeValuesFromDataRepresentation:", v4);

  return v6;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  id v4;
  unint64_t v5;
  NSString *v6;
  NSString *text;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
    goto LABEL_5;
  v5 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4);
  if (v5 > 0xC)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("PRMonogram -setText: received string %@ with UTF-8 length %@ that is greater than our %@ byte limit. Ignoring."), v9, v8, &unk_24C3D17E0);

LABEL_5:
    text = self->_text;
    self->_text = (NSString *)&stru_24C3CF300;
    goto LABEL_6;
  }
  v6 = (NSString *)objc_msgSend(v9, "copy");
  text = self->_text;
  self->_text = v6;
LABEL_6:

}

- (UIColor)plateGradientStartColor
{
  void *v3;
  void *v4;
  void *v5;

  -[PRMonogram monogramColor](self, "monogramColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PRMonogram monogramColor](self, "monogramColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gradientStartColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PRMonogramColor defaultGradientStartColor](PRMonogramColor, "defaultGradientStartColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIColor *)v5;
}

- (UIColor)plateGradientEndColor
{
  void *v3;
  void *v4;
  void *v5;

  -[PRMonogram monogramColor](self, "monogramColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PRMonogram monogramColor](self, "monogramColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gradientEndColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PRMonogramColor defaultGradientEndColor](PRMonogramColor, "defaultGradientEndColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIColor *)v5;
}

- (PRMonogramColor)monogramColor
{
  return self->_monogramColor;
}

- (PRMonogram)init
{
  return -[PRMonogram initWithText:fontIndex:monogramColor:](self, "initWithText:fontIndex:monogramColor:", &stru_24C3CF300, 0, 0);
}

- (unint64_t)fontIndex
{
  return self->_fontIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (id)monogramWithData:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PRMonogram _initWithData:]([PRMonogram alloc], "_initWithData:", v3);

  return v4;
}

+ (id)monogram
{
  return objc_alloc_init(PRMonogram);
}

+ (double)kerningForFontIndex:(unint64_t)a3 fontSize:(double)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(a1, "_fontSpecs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tracking");
  v9 = v8 * a4 / 1000.0;

  return v9;
}

+ (id)fontForIndex:(unint64_t)a3 plateDiameter:(double)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "_fontSpecs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "baseSize");
  v9 = v8 * a4 / 225.0;
  objc_msgSend(v7, "fontName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BEBB520];
  if (v10)
  {
    objc_msgSend(v7, "fontName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fontWithName:size:", v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:design:", *MEMORY[0x24BDC4DF0], v9, *MEMORY[0x24BDC4E70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)_fontSpecs
{
  if (_fontSpecs_onceToken != -1)
    dispatch_once(&_fontSpecs_onceToken, &__block_literal_global);
  return (id)_fontSpecs_fontSpecs;
}

- (UIColor)color
{
  UIColor *color;

  color = self->_color;
  if (color)
    return color;
  -[PRMonogram plateFlatColor](self, "plateFlatColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)plateSelectedActiveColor
{
  void *v3;
  void *v4;
  void *v5;

  -[PRMonogram monogramColor](self, "monogramColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PRMonogram monogramColor](self, "monogramColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedActiveColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PRMonogramColor defaultSelectedActiveColor](PRMonogramColor, "defaultSelectedActiveColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIColor *)v5;
}

- (UIColor)plateSelectedInactiveColor
{
  void *v3;
  void *v4;
  void *v5;

  -[PRMonogram monogramColor](self, "monogramColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PRMonogram monogramColor](self, "monogramColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedInactiveColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PRMonogramColor defaultSelectedInactiveColor](PRMonogramColor, "defaultSelectedInactiveColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIColor *)v5;
}

- (UIColor)plateSelectedActiveTextColor
{
  void *v3;
  void *v4;
  void *v5;

  -[PRMonogram monogramColor](self, "monogramColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PRMonogram monogramColor](self, "monogramColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedActiveTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PRMonogramColor defaultSelectedActiveTextColor](PRMonogramColor, "defaultSelectedActiveTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIColor *)v5;
}

- (void)setFontIndex:(unint64_t)a3
{
  void *v4;

  if (a3 >= 9)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("PRMonogram -setFontIndex: received fontIndex %@ than our %@ limit. Ignoring."), v4, &unk_24C3D17F8);

    a3 = 0;
  }
  self->_fontIndex = a3;
}

- (void)setFontIndexToUnsupportedValue
{
  self->_fontIndex = 9;
}

- (id)description
{
  void *v3;
  NSString *text;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  text = self->_text;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_fontIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<PRMonogram %p _text %@ _fontIndex %@>"), self, text, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRMonogram monogramColor](self, "monogramColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PRMonogram monogramColor](self, "monogramColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" color %@"), v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  return v6;
}

+ (unint64_t)countOfFonts
{
  void *v2;
  unint64_t v3;

  objc_msgSend(a1, "_fontSpecs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

+ (CAGradientLayer)plateOverlayLayer
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDE56B8]);
  objc_msgSend(a1, "updatePlateOverlayLayer:", v3);
  return (CAGradientLayer *)v3;
}

+ (void)updatePlateOverlayLayer:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[PRMonogramColor defaultGradientStartColor](PRMonogramColor, "defaultGradientStartColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7[0] = objc_msgSend(v4, "CGColor");
  +[PRMonogramColor defaultGradientEndColor](PRMonogramColor, "defaultGradientEndColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7[1] = objc_msgSend(v5, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColors:", v6);

  objc_msgSend(v3, "setStartPoint:", 0.5, 1.0);
  objc_msgSend(v3, "setEndPoint:", 0.5, 0.0);

}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void)setMonogramColor:(id)a3
{
  objc_storeStrong((id *)&self->_monogramColor, a3);
}

@end
