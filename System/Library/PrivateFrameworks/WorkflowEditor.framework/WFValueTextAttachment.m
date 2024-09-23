@implementation WFValueTextAttachment

- (WFValueTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  WFValueTextAttachment *v4;
  WFValueTextAttachment *v5;
  WFValueTextAttachment *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFValueTextAttachment;
  v4 = -[WFValueTextAttachment initWithData:ofType:](&v8, sel_initWithData_ofType_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WFValueTextAttachment setCornerRadius:](v4, "setCornerRadius:", 3.0);
    v6 = v5;
  }

  return v5;
}

- (UIEdgeInsets)textInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 3.0;
  v3 = 0.0;
  if (self->_selected)
    v3 = 3.0;
  v4 = 3.0;
  v5 = v3;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)borderInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  if (self->_selected)
    v3 = 3.0;
  else
    v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (NSAttributedString)displayString
{
  NSAttributedString *displayString;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSAttributedString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSAttributedString *v12;

  displayString = self->_displayString;
  if (!displayString)
  {
    -[WFValueTextAttachment attributes](self, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v6 = objc_alloc(MEMORY[0x24BDD1688]);
    -[WFValueTextAttachment valueName](self, "valueName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (NSAttributedString *)objc_msgSend(v6, "initWithString:attributes:", v7, v5);
    }
    else
    {
      -[WFValueTextAttachment stringValue](self, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (NSAttributedString *)objc_msgSend(v6, "initWithString:attributes:", v9, v5);

    }
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, *MEMORY[0x24BEBB368]);

    if (!self->_selected)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR(", "), v5);
      -[NSAttributedString appendAttributedString:](v8, "appendAttributedString:", v11);

    }
    v12 = self->_displayString;
    self->_displayString = v8;

    displayString = self->_displayString;
  }
  return displayString;
}

- (void)setRequiresRedraw:(BOOL)a3
{
  NSAttributedString *displayString;

  if (a3)
  {
    displayString = self->_displayString;
    self->_displayString = 0;

  }
  self->_requiresRedraw = a3;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;

  v3 = a3;
  if (-[WFValueTextAttachment requiresRedraw](self, "requiresRedraw"))
    v5 = 1;
  else
    v5 = self->_selected != v3;
  -[WFValueTextAttachment setRequiresRedraw:](self, "setRequiresRedraw:", v5);
  self->_selected = v3;
}

- (void)setAttributes:(id)a3
{
  NSDictionary *v4;
  uint64_t v5;
  NSDictionary *attributes;
  id v7;

  v7 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x24BEBB318]);
  v4 = (NSDictionary *)objc_msgSend(v7, "copy");
  if (-[WFValueTextAttachment requiresRedraw](self, "requiresRedraw"))
    v5 = 1;
  else
    v5 = -[NSDictionary isEqual:](self->_attributes, "isEqual:", v4) ^ 1;
  -[WFValueTextAttachment setRequiresRedraw:](self, "setRequiresRedraw:", v5);
  attributes = self->_attributes;
  self->_attributes = v4;

}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGContext *CurrentContext;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGImage *Image;
  size_t v25;
  size_t v26;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  const CGFloat *Decode;
  BOOL ShouldInterpolate;
  CGImage *v33;
  void *v34;
  id v35;
  const CGPath *v36;
  void *v37;
  CGAffineTransform v39;
  CGSize v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a3.size.height;
  width = a3.size.width;
  v8 = *MEMORY[0x24BDBEFB0];
  v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[WFValueTextAttachment borderInsets](self, "borderInsets", a4, a5, a3.origin.x, a3.origin.y);
  v11 = v8 + v10;
  v13 = v9 + v12;
  v15 = width - (v10 + v14);
  v17 = height - (v12 + v16);
  v40.width = width;
  v40.height = height;
  UIGraphicsBeginImageContextWithOptions(v40, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  -[WFValueTextAttachment displayString](self, "displayString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFValueTextAttachment textInsets](self, "textInsets");
  objc_msgSend(v19, "drawInRect:", v11 + v23, v13 + v20, v15 - (v23 + v21), v17 - (v20 + v22));

  -[WFValueTextAttachment setRequiresRedraw:](self, "setRequiresRedraw:", 0);
  if (-[WFValueTextAttachment selected](self, "selected"))
  {
    v41.origin.x = v8;
    v41.origin.y = v9;
    v41.size.width = width;
    v41.size.height = height;
    v39.b = 0.0;
    v39.c = 0.0;
    v39.a = 1.0;
    *(_OWORD *)&v39.d = xmmword_2268AB360;
    v39.ty = CGRectGetHeight(v41);
    CGContextConcatCTM(CurrentContext, &v39);
    Image = CGBitmapContextCreateImage(CurrentContext);
    v25 = CGImageGetWidth(Image);
    v26 = CGImageGetHeight(Image);
    BitsPerComponent = CGImageGetBitsPerComponent(Image);
    BitsPerPixel = CGImageGetBitsPerPixel(Image);
    BytesPerRow = CGImageGetBytesPerRow(Image);
    DataProvider = CGImageGetDataProvider(Image);
    Decode = CGImageGetDecode(Image);
    ShouldInterpolate = CGImageGetShouldInterpolate(Image);
    v33 = CGImageMaskCreate(v25, v26, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, Decode, ShouldInterpolate);
    v42.origin.x = v8;
    v42.origin.y = v9;
    v42.size.width = width;
    v42.size.height = height;
    CGContextClearRect(CurrentContext, v42);
    v43.origin.x = v8;
    v43.origin.y = v9;
    v43.size.width = width;
    v43.size.height = height;
    CGContextClipToMask(CurrentContext, v43, v33);
    -[WFValueTextAttachment attributes](self, "attributes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKey:", *MEMORY[0x24BEBB368]);
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v35, "CGColor"));

    v44.origin.x = v11;
    v44.origin.y = v13;
    v44.size.width = v15;
    v44.size.height = v17;
    v36 = CGPathCreateWithRoundedRect(v44, 3.0, 3.0, 0);
    CGContextAddPath(CurrentContext, v36);
    CGContextFillPath(CurrentContext);
    CGPathRelease(v36);
    UIGraphicsGetImageFromCurrentImageContext();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    CGImageRelease(v33);
    CGImageRelease(Image);
  }
  else
  {
    UIGraphicsGetImageFromCurrentImageContext();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    -[WFValueTextAttachment setImage:](self, "setImage:", v37);
  }
  return v37;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double y;
  CGFloat x;
  CGRect result;

  y = a4.origin.y;
  x = a4.origin.x;
  -[WFValueTextAttachment textInsets](self, "textInsets", a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  v31 = v8;
  v32 = v7;
  v10 = v9;
  v12 = v11;
  -[WFValueTextAttachment borderInsets](self, "borderInsets");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[WFValueTextAttachment displayString](self, "displayString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "size");
  v23 = v22;
  v25 = v24;

  v26 = v20 + v10 + v12 + v16 + v23;
  v27 = v18 + v32 + v31 + v14;
  v28 = v27 + v25;
  v29 = y - v27;
  v30 = x;
  result.size.height = v28;
  result.size.width = v26;
  result.origin.y = v29;
  result.origin.x = v30;
  return result;
}

- (id)value
{
  return 0;
}

- (NSString)valueName
{
  return 0;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (BOOL)selected
{
  return self->_selected;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (BOOL)requiresRedraw
{
  return self->_requiresRedraw;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

+ (id)humanReadableStringFromValueTextAttributedString:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v4 = *MEMORY[0x24BEBB318];
  v5 = objc_msgSend(v3, "length");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__WFValueTextAttachment_humanReadableStringFromValueTextAttributedString___block_invoke;
  v9[3] = &unk_24EE24BA0;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v9);
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __74__WFValueTextAttachment_humanReadableStringFromValueTextAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v14, "valueName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v14, "stringValue");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    if (a3 + a4 != objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      objc_msgSend(v12, "stringByAppendingString:", CFSTR(", "));
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, v12);

    v8 = v14;
  }

}

@end
