@implementation _TUISymbolImage

- (_TUISymbolImage)initWithImage:(id)a3 contentInsets:(UIEdgeInsets)a4 isMulticolor:(BOOL)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v12;
  _TUISymbolImage *v13;
  _TUISymbolImage *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  unsigned int v19;
  double v20;
  objc_super v22;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v12 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_TUISymbolImage;
  v13 = -[_TUISymbolImage init](&v22, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_image, a3);
    v14->_contentInsets.top = top;
    v14->_contentInsets.left = left;
    v14->_contentInsets.bottom = bottom;
    v14->_contentInsets.right = right;
    objc_msgSend(v12, "alignmentRectInsets");
    v14->_alignmentInsets.top = v15;
    v14->_alignmentInsets.left = v16;
    v14->_alignmentInsets.bottom = v17;
    v14->_alignmentInsets.right = v18;
    v19 = objc_msgSend(v12, "hasBaseline");
    v14->_hasBaseline = v19;
    v20 = 0.0;
    if (v19)
      objc_msgSend(v12, "baselineOffsetFromBottom", 0.0);
    v14->_baselineOffsetFromBottom = v20;
    v14->_isMulticolor = a5;
  }

  return v14;
}

- (_TUISymbolImage)initWithImage:(id)a3
{
  id v4;
  _TUISymbolImage *v5;

  v4 = a3;
  objc_msgSend(v4, "contentInsets");
  v5 = -[_TUISymbolImage initWithImage:contentInsets:isMulticolor:](self, "initWithImage:contentInsets:isMulticolor:", v4, 0);

  return v5;
}

- (_TUISymbolImage)initWithOther:(id)a3
{
  id *v4;
  _TUISymbolImage *v5;
  _TUISymbolImage *v6;
  __int128 v7;
  __int128 v8;
  objc_super v10;

  v4 = (id *)a3;
  v10.receiver = self;
  v10.super_class = (Class)_TUISymbolImage;
  v5 = -[_TUISymbolImage init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_image, v4[1]);
    v7 = *((_OWORD *)v4 + 3);
    *(_OWORD *)&v6->_contentInsets.top = *((_OWORD *)v4 + 2);
    *(_OWORD *)&v6->_contentInsets.bottom = v7;
    v8 = *((_OWORD *)v4 + 5);
    *(_OWORD *)&v6->_alignmentInsets.top = *((_OWORD *)v4 + 4);
    *(_OWORD *)&v6->_alignmentInsets.bottom = v8;
    v6->_hasBaseline = *((_BYTE *)v4 + 16);
    *(_QWORD *)&v6->_baselineOffsetFromBottom = v4[3];
    v6->_isMulticolor = *((_BYTE *)v4 + 17);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  float64x2_t *v4;
  float64x2_t *v5;
  uint64_t v6;
  UIImage *image;
  BOOL v8;

  v4 = (float64x2_t *)a3;
  v5 = v4;
  v8 = v4
    && (v6 = objc_opt_class(v4), v6 == objc_opt_class(_TUISymbolImage))
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentInsets.top, v5[2]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentInsets.bottom, v5[3]))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_alignmentInsets.top, v5[4]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_alignmentInsets.bottom, v5[5]))), 0xFuLL))) & 1) != 0&& self->_hasBaseline == LOBYTE(v5[1].f64[0])&& self->_baselineOffsetFromBottom == v5[1].f64[1]&& ((image = self->_image, image == *(UIImage **)&v5->f64[1]) || -[UIImage isEqual:](image, "isEqual:"))&& self->_isMulticolor == BYTE1(v5[1].f64[0]);

  return v8;
}

- (CGImage)CGImage
{
  return -[UIImage CGImage](self->_image, "CGImage");
}

- (id)newImageWithoutContentInsets
{
  id v3;
  CGImage *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)UIImage);
  v4 = -[UIImage CGImage](self->_image, "CGImage");
  -[UIImage scale](self->_image, "scale");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tui_initWithCGImage:scale:", v4));

  if (self->_hasBaseline)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithBaselineOffsetFromBottom:", self->_baselineOffsetFromBottom - self->_contentInsets.bottom));

    return v6;
  }
  return v5;
}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[UIImage size](self->_image, "size");
  v4 = v3;
  v6 = v5;
  -[UIImage contentInsets](self->_image, "contentInsets");
  v11 = v6 - (v9 + v10);
  v12 = v4 - (v7 + v8) + self->_contentInsets.left + self->_contentInsets.right;
  v13 = v11 + self->_contentInsets.top + self->_contentInsets.bottom;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TUISymbolImage)symbolImageWithContentInsets:(UIEdgeInsets)a3 alignmentInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  _TUISymbolImage *v12;
  _TUISymbolImage *v13;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  _TUISymbolImage *v20;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v8 = a3.right;
  v9 = a3.bottom;
  v10 = a3.left;
  v11 = a3.top;
  v12 = self;
  v13 = v12;
  v16 = v10 == v12->_contentInsets.left
     && v11 == v12->_contentInsets.top
     && v8 == v12->_contentInsets.right
     && v9 == v12->_contentInsets.bottom;
  if (!v16
    || (left == v12->_alignmentInsets.left ? (v17 = top == v12->_alignmentInsets.top) : (v17 = 0),
        v17 ? (v18 = right == v12->_alignmentInsets.right) : (v18 = 0),
        v18 ? (v19 = bottom == v12->_alignmentInsets.bottom) : (v19 = 0),
        !v19))
  {
    v20 = -[_TUISymbolImage initWithOther:]([_TUISymbolImage alloc], "initWithOther:", v12);

    v20->_contentInsets.top = v11;
    v20->_contentInsets.left = v10;
    v20->_contentInsets.bottom = v9;
    v20->_contentInsets.right = v8;
    v20->_alignmentInsets.top = top;
    v20->_alignmentInsets.left = left;
    v13 = v20;
    v20->_alignmentInsets.bottom = bottom;
    v20->_alignmentInsets.right = right;
  }
  return v13;
}

- (_TUISymbolImage)symbolImageWithoutBaseline
{
  _TUISymbolImage *v2;
  _TUISymbolImage *v3;

  v2 = self;
  if (v2->_hasBaseline)
  {
    v3 = -[_TUISymbolImage initWithOther:]([_TUISymbolImage alloc], "initWithOther:", v2);

    v3->_hasBaseline = 0;
    v3->_baselineOffsetFromBottom = 0.0;
    v2 = v3;
  }
  return v2;
}

- (_TUISymbolImage)symbolImageWithBaselineOffsetFromBottom:(double)a3
{
  _TUISymbolImage *v4;
  _TUISymbolImage *v5;
  _TUISymbolImage *v6;

  v4 = self;
  v5 = v4;
  if (!v4->_hasBaseline || v4->_baselineOffsetFromBottom != a3)
  {
    v6 = -[_TUISymbolImage initWithOther:]([_TUISymbolImage alloc], "initWithOther:", v4);

    v6->_hasBaseline = 1;
    v6->_baselineOffsetFromBottom = a3;
    v5 = v6;
  }
  return v5;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)alignmentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentInsets.top;
  left = self->_alignmentInsets.left;
  bottom = self->_alignmentInsets.bottom;
  right = self->_alignmentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)hasBaseline
{
  return self->_hasBaseline;
}

- (double)baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (BOOL)isMulticolor
{
  return self->_isMulticolor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
