@implementation THPresentationType

- (NSString)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  NSString *v5;

  -[THPresentationType willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->mName = v5;
}

- (THPresentationType)initWithString:(id)a3 context:(id)a4
{
  THPresentationType *v5;
  THPresentationType *v6;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THPresentationType;
  v5 = -[THPresentationType initWithContext:](&v9, "initWithContext:", a4);
  v6 = v5;
  if (v5)
  {
    -[THPresentationType setName:](v5, "setName:", a3);
    v6->_pageSize = CGSizeZero;
    v6->_fontSize = 0;
    v6->_columnCount = 0;
    v6->_gutterWidth = 0.0;
    v7 = *(_OWORD *)&TSDEdgeInsetsZero[2];
    *(_OWORD *)&v6->_contentInsets.top = *(_OWORD *)TSDEdgeInsetsZero;
    *(_OWORD *)&v6->_contentInsets.bottom = v7;
    v6->_compactWidth = -1;
    v6->_compactHeight = -1;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->mName = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPresentationType;
  -[THPresentationType dealloc](&v3, "dealloc");
}

- (CGSize)pageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pageSize.width;
  height = self->_pageSize.height;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
    -[THPresentationTypePageSizeDelegate pageSizeForPresentationType:](-[THPresentationType pageSizeDelegate](self, "pageSizeDelegate"), "pageSizeForPresentationType:", self);
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)fontSize
{
  unint64_t result;

  result = self->_fontSize;
  if (!result)
  {
    result = -[THPresentationType pageSizeDelegate](self, "pageSizeDelegate");
    if (result)
      return (unint64_t)-[THPresentationTypePageSizeDelegate fontSizeForPresentationType:](-[THPresentationType pageSizeDelegate](self, "pageSizeDelegate"), "fontSizeForPresentationType:", self);
  }
  return result;
}

- (int64_t)columnCount
{
  int64_t result;

  result = self->_columnCount;
  if (!result)
  {
    result = -[THPresentationType pageSizeDelegate](self, "pageSizeDelegate");
    if (result)
      return (int64_t)-[THPresentationTypePageSizeDelegate columnCountForPresentationType:](-[THPresentationType pageSizeDelegate](self, "pageSizeDelegate"), "columnCountForPresentationType:", self);
  }
  return result;
}

- (double)gutterWidth
{
  double gutterWidth;
  double result;

  gutterWidth = self->_gutterWidth;
  if (gutterWidth != 0.0 || !-[THPresentationType pageSizeDelegate](self, "pageSizeDelegate"))
    return gutterWidth;
  -[THPresentationTypePageSizeDelegate gutterWidthForPresentationType:](-[THPresentationType pageSizeDelegate](self, "pageSizeDelegate"), "gutterWidthForPresentationType:", self);
  return result;
}

- (UIEdgeInsets)contentInsets
{
  float64x2_t v2;
  float64x2_t v3;
  CGFloat left;
  CGFloat right;
  THPresentationTypePageSizeDelegate *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  UIEdgeInsets result;

  v2 = *(float64x2_t *)&self->_contentInsets.top;
  v3 = *(float64x2_t *)&self->_contentInsets.bottom;
  left = self->_contentInsets.left;
  right = self->_contentInsets.right;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v2, TSDEdgeInsetsZero[0]), (int32x4_t)vceqq_f64(v3, TSDEdgeInsetsZero[1]))), 0xFuLL))) & 1) != 0)
  {
    v12 = *(_OWORD *)&self->_contentInsets.bottom;
    v13 = *(_OWORD *)&self->_contentInsets.top;
    v7 = -[THPresentationType pageSizeDelegate](self, "pageSizeDelegate");
    *(_QWORD *)&v3.f64[0] = v12;
    *(_QWORD *)&v2.f64[0] = v13;
    if (v7)
    {
      -[THPresentationTypePageSizeDelegate contentInsetsForPresentationType:](-[THPresentationType pageSizeDelegate](self, "pageSizeDelegate", *(double *)&v13), "contentInsetsForPresentationType:", self);
      left = v8;
      right = v9;
    }
  }
  v10 = left;
  v11 = right;
  result.bottom = v3.f64[0];
  result.top = v2.f64[0];
  result.right = v11;
  result.left = v10;
  return result;
}

- (BOOL)isCompactWidth
{
  int compactWidth;

  compactWidth = self->_compactWidth;
  if (compactWidth < 0)
    return -[THPresentationTypePageSizeDelegate isCompactWidthForPresentationType:](self->_pageSizeDelegate, "isCompactWidthForPresentationType:", self);
  else
    return compactWidth != 0;
}

- (BOOL)isCompactHeight
{
  int compactHeight;

  compactHeight = self->_compactHeight;
  if (compactHeight < 0)
    return -[THPresentationTypePageSizeDelegate isCompactHeightForPresentationType:](self->_pageSizeDelegate, "isCompactHeightForPresentationType:", self);
  else
    return compactHeight != 0;
}

- (id)copyFixingSize
{
  _BYTE *v3;

  v3 = objc_msgSend(objc_allocWithZone((Class)objc_opt_class(self, a2)), "initWithString:context:", -[THPresentationType name](self, "name"), -[THPresentationType context](self, "context"));
  -[THPresentationType pageSize](self, "pageSize");
  objc_msgSend(v3, "setPageSize:");
  objc_msgSend(v3, "setFontSize:", -[THPresentationType fontSize](self, "fontSize"));
  objc_msgSend(v3, "setColumnCount:", -[THPresentationType columnCount](self, "columnCount"));
  -[THPresentationType gutterWidth](self, "gutterWidth");
  objc_msgSend(v3, "setGutterWidth:");
  -[THPresentationType contentInsets](self, "contentInsets");
  objc_msgSend(v3, "setContentInsets:");
  v3[16] = -[THPresentationType isCompactWidth](self, "isCompactWidth");
  v3[17] = -[THPresentationType isCompactHeight](self, "isCompactHeight");
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "initWithString:context:", -[THPresentationType name](self, "name"), -[THPresentationType context](self, "context"));
  objc_msgSend(v4, "setPageSizeDelegate:", self->_pageSizeDelegate);
  objc_msgSend(v4, "setPageSize:", self->_pageSize.width, self->_pageSize.height);
  objc_msgSend(v4, "setFontSize:", self->_fontSize);
  objc_msgSend(v4, "setColumnCount:", self->_columnCount);
  objc_msgSend(v4, "setGutterWidth:", self->_gutterWidth);
  objc_msgSend(v4, "setContentInsets:", self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);
  v4[16] = self->_compactWidth;
  v4[17] = self->_compactHeight;
  return v4;
}

+ (id)flowPresentationTypeInContext:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithString:context:", CFSTR("THFlowPresentationType"), a3);
}

+ (id)paginatedPresentationTypeInContext:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithString:context:", CFSTR("THPaginatedPresentationType"), a3);
}

+ (id)flowPresentationTypeInContext:(id)a3 pageSize:(CGSize)a4
{
  double height;
  double width;
  id v6;

  height = a4.height;
  width = a4.width;
  v6 = objc_msgSend(a1, "flowPresentationTypeInContext:", a3);
  objc_msgSend(v6, "setPageSize:", width, height);
  return v6;
}

+ (id)paginatedPresentationTypeInContext:(id)a3 pageSize:(CGSize)a4
{
  double height;
  double width;
  id v6;

  height = a4.height;
  width = a4.width;
  v6 = objc_msgSend(a1, "paginatedPresentationTypeInContext:", a3);
  objc_msgSend(v6, "setPageSize:", width, height);
  return v6;
}

- (BOOL)isFlow
{
  return -[NSString isEqualToString:](-[THPresentationType name](self, "name"), "isEqualToString:", CFSTR("THFlowPresentationType"));
}

- (BOOL)isPaginated
{
  return -[NSString isEqualToString:](-[THPresentationType name](self, "name"), "isEqualToString:", CFSTR("THPaginatedPresentationType"));
}

- (BOOL)isMutableViaDelegate
{
  THPresentationTypePageSizeDelegate *v3;

  v3 = -[THPresentationType pageSizeDelegate](self, "pageSizeDelegate");
  if (v3)
    LOBYTE(v3) = self->_pageSize.height == CGSizeZero.height && self->_pageSize.width == CGSizeZero.width;
  return (char)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  v5 = objc_opt_class(THPresentationType, a2);
  return -[NSString isEqualToString:](-[THPresentationType name](self, "name"), "isEqualToString:", objc_msgSend((id)TSUDynamicCast(v5, a3), "name"));
}

- (BOOL)isEqualIncludingSize:(id)a3
{
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unsigned int v30;
  unsigned __int8 v31;

  v5 = -[NSString isEqualToString:](-[THPresentationType name](self, "name"), "isEqualToString:", objc_msgSend(a3, "name"));
  if (v5)
  {
    -[THPresentationType pageSize](self, "pageSize");
    v7 = v6;
    v9 = v8;
    v10 = objc_msgSend(a3, "pageSize");
    v5 = TSDNearlyEqualSizes(v10, v7, v9, v11, v12);
    if (v5)
    {
      v13 = -[THPresentationType fontSize](self, "fontSize");
      if (v13 != objc_msgSend(a3, "fontSize"))
        goto LABEL_11;
      v14 = -[THPresentationType columnCount](self, "columnCount");
      if (v14 != objc_msgSend(a3, "columnCount"))
        goto LABEL_11;
      -[THPresentationType gutterWidth](self, "gutterWidth");
      v16 = v15;
      objc_msgSend(a3, "gutterWidth");
      if (v16 != v17)
        goto LABEL_11;
      -[THPresentationType contentInsets](self, "contentInsets");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      objc_msgSend(a3, "contentInsets");
      LOBYTE(v5) = 0;
      if (v21 == v29 && v19 == v26 && v25 == v28 && v23 == v27)
      {
        v30 = -[THPresentationType isCompactWidth](self, "isCompactWidth");
        if (v30 != objc_msgSend(a3, "isCompactWidth"))
        {
LABEL_11:
          LOBYTE(v5) = 0;
          return v5;
        }
        v31 = -[THPresentationType isCompactHeight](self, "isCompactHeight");
        LOBYTE(v5) = v31 ^ objc_msgSend(a3, "isCompactHeight") ^ 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](-[THPresentationType name](self, "name"), "hash");
}

- (unint64_t)hashIncludingSize
{
  CGFloat v3;
  CGFloat v4;

  v3 = self->_pageSize.width
     + (double)-[NSString hash](-[THPresentationType name](self, "name"), "hash")
     + self->_pageSize.height
     + (double)self->_fontSize
     + (double)self->_columnCount
     + self->_gutterWidth
     + self->_contentInsets.left
     + self->_contentInsets.right
     + self->_contentInsets.bottom
     + self->_contentInsets.top;
  v4 = v3 + (double)-[THPresentationType isCompactWidth](self, "isCompactWidth");
  return (unint64_t)(v4 + (double)-[THPresentationType isCompactHeight](self, "isCompactHeight"));
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> name=%@ size={%f,%f}"), objc_opt_class(self, a2), self, self->mName, *(_QWORD *)&self->_pageSize.width, *(_QWORD *)&self->_pageSize.height);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THPresentationType)initWithCoder:(id)a3
{
  uint64_t v4;
  THPresentationType *v5;
  uint64_t v6;
  id v7;
  CGSize *p_pageSize;
  CGFloat v9;
  CGFloat v10;
  float v11;
  float v12;
  uint64_t v13;
  id v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)THPresentationType;
  v5 = -[THPresentationType initWithContext:](&v20, "initWithContext:", 0);
  if (v5)
  {
    -[THPresentationType setName:](v5, "setName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v4), CFSTR("name")));
    v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSValue, v6), CFSTR("pageSize"));
    p_pageSize = &v5->_pageSize;
    if (v7)
    {
      objc_msgSend(v7, "CGSizeValue");
      p_pageSize->width = v9;
      v5->_pageSize.height = v10;
    }
    else
    {
      *p_pageSize = CGSizeZero;
    }
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("fontSize"));
    v5->_fontSize = (unint64_t)v11;
    v5->_columnCount = (int64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("columnCount"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("gutterWidth"));
    v5->_gutterWidth = v12;
    v14 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSValue, v13), CFSTR("contentInsets"));
    if (v14)
    {
      objc_msgSend(v14, "TSDEdgeInsetsValue");
      v5->_contentInsets.top = v15;
      v5->_contentInsets.left = v16;
      v5->_contentInsets.bottom = v17;
      v5->_contentInsets.right = v18;
    }
    v5->_compactWidth = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("compactWidth"));
    v5->_compactHeight = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("compactHeight"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;

  objc_msgSend(a3, "encodeObject:forKey:", -[THPresentationType name](self, "name"), CFSTR("name"));
  -[THPresentationType pageSize](self, "pageSize");
  objc_msgSend(a3, "encodeObject:forKey:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:"), CFSTR("pageSize"));
  *(float *)&v5 = (float)-[THPresentationType fontSize](self, "fontSize");
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("fontSize"), v5);
  objc_msgSend(a3, "encodeInteger:forKey:", -[THPresentationType columnCount](self, "columnCount"), CFSTR("columnCount"));
  -[THPresentationType gutterWidth](self, "gutterWidth");
  *(float *)&v6 = v6;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("gutterWidth"), v6);
  -[THPresentationType contentInsets](self, "contentInsets");
  objc_msgSend(a3, "encodeObject:forKey:", +[NSValue valueWithTSDEdgeInsets:](NSValue, "valueWithTSDEdgeInsets:"), CFSTR("contentInsets"));
  objc_msgSend(a3, "encodeBool:forKey:", -[THPresentationType isCompactWidth](self, "isCompactWidth"), CFSTR("compactWidth"));
  objc_msgSend(a3, "encodeBool:forKey:", -[THPresentationType isCompactHeight](self, "isCompactHeight"), CFSTR("compactHeight"));
}

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
}

- (void)setFontSize:(unint64_t)a3
{
  self->_fontSize = a3;
}

- (void)setColumnCount:(int64_t)a3
{
  self->_columnCount = a3;
}

- (void)setGutterWidth:(double)a3
{
  self->_gutterWidth = a3;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (THPresentationTypePageSizeDelegate)pageSizeDelegate
{
  return self->_pageSizeDelegate;
}

- (void)setPageSizeDelegate:(id)a3
{
  self->_pageSizeDelegate = (THPresentationTypePageSizeDelegate *)a3;
}

@end
