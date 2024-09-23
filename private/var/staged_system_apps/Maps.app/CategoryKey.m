@implementation CategoryKey

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  CGSize v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CategoryKey category](self, "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CategoryKey prefix](self, "prefix"));
  if (-[CategoryKey transitMode](self, "transitMode"))
    v6 = CFSTR("yes");
  else
    v6 = CFSTR("no");
  -[CategoryKey size](self, "size");
  v7 = NSStringFromCGSize(v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[CategoryKey scale](self, "scale");
  v10 = v9;
  if (-[CategoryKey isCarPlay](self, "isCarPlay"))
    v11 = CFSTR("yes");
  else
    v11 = CFSTR("no");
  if (-[CategoryKey renderAsTemplate](self, "renderAsTemplate"))
    v12 = CFSTR("yes");
  else
    v12 = CFSTR("no");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CategoryKey: %@ <prefix:%@, transit:%@, size:%@, scale:%#.1f isCarplay=%@>, renderAsTemplate:%@"), v4, v5, v6, v8, v10, v11, v12));

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  NSUInteger v5;
  double scale;
  uint64_t v7;
  uint32x4_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int64x2_t v11;
  unint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSearchCategory styleAttributes](self->_category, "styleAttributes"));
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_prefix, "hash");
  scale = self->_scale;
  v7 = scale;
  LODWORD(scale) = *(_DWORD *)&self->_transitMode;
  v8 = vmovl_u16(vshl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)&scale), (uint16x4_t)0x5000400030002));
  v9.i64[0] = v8.u32[2];
  v9.i64[1] = v8.u32[3];
  v10.i64[0] = 255;
  v10.i64[1] = 255;
  v11 = (int64x2_t)vandq_s8(v9, v10);
  v9.i64[0] = v8.u32[0];
  v9.i64[1] = v8.u32[1];
  v12 = vaddvq_s64(vaddq_s64((int64x2_t)vandq_s8(v9, v10), v11)) + v7 + 2 * ((_QWORD)v4 + v5);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CategoryKey *v4;
  CategoryKey *v5;
  uint64_t v6;
  double *v7;
  id *v8;
  BOOL v9;
  NSString *prefix;
  void *v11;
  void *v12;
  BOOL v13;

  v4 = (CategoryKey *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_17;
  if (v4 == self)
  {
    v13 = 1;
    goto LABEL_21;
  }
  v6 = objc_opt_class(CategoryKey);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
    v8 = (id *)v7;
    if (self->_scale == v7[4]
      && (self->_size.width == v7[5] ? (v9 = self->_size.height == v7[6]) : (v9 = 0),
          v9
       && self->_transitMode == *((unsigned __int8 *)v7 + 8)
       && self->_isCarPlay == *((unsigned __int8 *)v7 + 9)
       && self->_isNightMode == *((unsigned __int8 *)v7 + 10)
       && self->_renderAsTemplate == *((unsigned __int8 *)v7 + 11)
       && ((prefix = self->_prefix, prefix == v8[3]) || -[NSString isEqualToString:](prefix, "isEqualToString:"))))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSearchCategory styleAttributes](self->_category, "styleAttributes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[2], "styleAttributes"));
      v13 = GeoCodecsFeatureStyleAttributesCompare(v11, v12) == 0;

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
LABEL_17:
    v13 = 0;
  }
LABEL_21:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;

  v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v4[8] = self->_transitMode;
  objc_storeStrong((id *)v4 + 3, self->_prefix);
  objc_storeStrong((id *)v4 + 2, self->_category);
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_scale;
  *(CGSize *)(v4 + 40) = self->_size;
  v4[9] = self->_isCarPlay;
  v4[10] = self->_isNightMode;
  v4[11] = self->_renderAsTemplate;
  return v4;
}

- (GEOSearchCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)transitMode
{
  return self->_transitMode;
}

- (void)setTransitMode:(BOOL)a3
{
  self->_transitMode = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (BOOL)isCarPlay
{
  return self->_isCarPlay;
}

- (void)setIsCarPlay:(BOOL)a3
{
  self->_isCarPlay = a3;
}

- (BOOL)isNightMode
{
  return self->_isNightMode;
}

- (void)setIsNightMode:(BOOL)a3
{
  self->_isNightMode = a3;
}

- (BOOL)renderAsTemplate
{
  return self->_renderAsTemplate;
}

- (void)setRenderAsTemplate:(BOOL)a3
{
  self->_renderAsTemplate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
