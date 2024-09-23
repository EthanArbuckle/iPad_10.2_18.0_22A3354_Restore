@implementation TSTLayoutContentCachedKey

- (TSTLayoutContentCachedKey)initWithString:(id)a3 width:(double)a4 height:(double)a5 paragraphStyle:(id)a6 cellWraps:(BOOL)a7 valueType:(int)a8 paddingInsets:(UIEdgeInsets)a9 verticalAlignment:(unsigned int)a10 writingDirection:(int)a11
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  TSTLayoutContentCachedKey *v23;
  objc_super v25;

  right = a9.right;
  bottom = a9.bottom;
  left = a9.left;
  top = a9.top;
  v25.receiver = self;
  v25.super_class = (Class)TSTLayoutContentCachedKey;
  v23 = -[TSTLayoutContentCachedKey init](&v25, sel_init);
  if (v23)
  {
    v23->mString = (NSString *)objc_msgSend(a3, "copy");
    v23->mWidth = a4;
    v23->mHeight = a5;
    v23->mParagraphStyle = (TSWPParagraphStyle *)a6;
    v23->mCellWraps = a7;
    v23->mValueType = a8;
    v23->mPaddingInsets.top = top;
    v23->mPaddingInsets.left = left;
    v23->mPaddingInsets.bottom = bottom;
    v23->mPaddingInsets.right = right;
    v23->mVerticalAlignment = a10;
    v23->mWritingDirection = a11;
  }
  return v23;
}

- (void)dealloc
{
  objc_super v3;

  self->mString = 0;
  self->mParagraphStyle = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTLayoutContentCachedKey;
  -[TSTLayoutContentCachedKey dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSTLayoutContentCachedKey *v4;
  NSString *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  TSWPParagraphStyle *v10;
  _BOOL8 v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = +[TSTLayoutContentCachedKey allocWithZone:](TSTLayoutContentCachedKey, "allocWithZone:", a3);
  v5 = -[TSTLayoutContentCachedKey string](self, "string");
  -[TSTLayoutContentCachedKey width](self, "width");
  v7 = v6;
  -[TSTLayoutContentCachedKey height](self, "height");
  v9 = v8;
  v10 = -[TSTLayoutContentCachedKey paragraphStyle](self, "paragraphStyle");
  v11 = -[TSTLayoutContentCachedKey cellWraps](self, "cellWraps");
  v12 = -[TSTLayoutContentCachedKey valueType](self, "valueType");
  -[TSTLayoutContentCachedKey paddingInsets](self, "paddingInsets");
  return -[TSTLayoutContentCachedKey initWithString:width:height:paragraphStyle:cellWraps:valueType:paddingInsets:verticalAlignment:writingDirection:](v4, "initWithString:width:height:paragraphStyle:cellWraps:valueType:paddingInsets:verticalAlignment:writingDirection:", v5, v10, v11, v12, -[TSTLayoutContentCachedKey verticalAlignment](self, "verticalAlignment"), -[TSTLayoutContentCachedKey writingDirection](self, "writingDirection"), v7, v9, v13, v14, v15, v16);
}

- (unint64_t)hash
{
  return -[NSString hash](self->mString, "hash") ^ (unint64_t)self->mWidth ^ (unint64_t)self->mHeight ^ (unint64_t)self->mParagraphStyle ^ self->mCellWraps ^ (unint64_t)self->mValueType ^ (unint64_t)self->mPaddingInsets.left;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[TSTLayoutContentCachedKey isEqualToLayoutContentCachedKey:](self, "isEqualToLayoutContentCachedKey:", a3);
  }
  return 0;
}

- (BOOL)isEqualToLayoutContentCachedKey:(id)a3
{
  double mWidth;
  double v6;
  double mHeight;
  double v8;
  int mCellWraps;
  unsigned int mVerticalAlignment;
  int mWritingDirection;
  int mValueType;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  double v17;

  if (self == a3)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    mWidth = self->mWidth;
    objc_msgSend(a3, "width");
    if (vabdd_f64(mWidth, v6) < 0.00999999978
      && (mHeight = self->mHeight, objc_msgSend(a3, "height"), vabdd_f64(mHeight, v8) < 0.00999999978)
      && (mCellWraps = self->mCellWraps, mCellWraps == objc_msgSend(a3, "cellWraps"))
      && (mVerticalAlignment = self->mVerticalAlignment,
          mVerticalAlignment == objc_msgSend(a3, "verticalAlignment"))
      && (mWritingDirection = self->mWritingDirection,
          mWritingDirection == objc_msgSend(a3, "writingDirection"))
      && (mValueType = self->mValueType, mValueType == objc_msgSend(a3, "valueType")))
    {
      objc_msgSend(a3, "paddingInsets");
      LOBYTE(v16) = 0;
      if (self->mPaddingInsets.left == v17
        && self->mPaddingInsets.top == v13
        && self->mPaddingInsets.right == v15
        && self->mPaddingInsets.bottom == v14)
      {
        v16 = -[TSSStyle isEqual:](self->mParagraphStyle, "isEqual:", objc_msgSend(a3, "paragraphStyle"));
        if (v16)
          LOBYTE(v16) = -[NSString isEqualToString:](self->mString, "isEqualToString:", objc_msgSend(a3, "string"));
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  return v16;
}

- (id)description
{
  void *v3;
  const __CFString *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C60], "descriptionWithObject:class:", self, objc_opt_class());
  objc_msgSend(v3, "addField:value:", CFSTR("string"), self->mString);
  objc_msgSend(v3, "addField:format:", CFSTR("width"), CFSTR("%f"), *(_QWORD *)&self->mWidth);
  objc_msgSend(v3, "addField:format:", CFSTR("height"), CFSTR("%f"), *(_QWORD *)&self->mHeight);
  objc_msgSend(v3, "addField:value:", CFSTR("vertical"), TSWPStringFromTSWPVerticalAlignment(self->mVerticalAlignment));
  objc_msgSend(v3, "addField:value:", CFSTR("direction"), TSWPStringFromTSWPWritingDirection(self->mWritingDirection));
  if (self->mCellWraps)
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  objc_msgSend(v3, "addField:value:", CFSTR("wraps"), v4);
  objc_msgSend(v3, "addField:format:", CFSTR("paragraphStyle"), CFSTR("%p"), self->mParagraphStyle);
  return (id)objc_msgSend(v3, "descriptionString");
}

- (NSString)string
{
  return self->mString;
}

- (double)width
{
  return self->mWidth;
}

- (double)height
{
  return self->mHeight;
}

- (TSWPParagraphStyle)paragraphStyle
{
  return self->mParagraphStyle;
}

- (BOOL)cellWraps
{
  return self->mCellWraps;
}

- (int)valueType
{
  return self->mValueType;
}

- (UIEdgeInsets)paddingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->mPaddingInsets.top;
  left = self->mPaddingInsets.left;
  bottom = self->mPaddingInsets.bottom;
  right = self->mPaddingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (unsigned)verticalAlignment
{
  return self->mVerticalAlignment;
}

- (int)writingDirection
{
  return self->mWritingDirection;
}

@end
