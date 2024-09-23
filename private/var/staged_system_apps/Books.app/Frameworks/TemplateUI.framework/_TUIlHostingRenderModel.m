@implementation _TUIlHostingRenderModel

- (_TUIlHostingRenderModel)initWithIdentifier:(id)a3 size:(CGSize)a4 requestedSize:(CGSize)a5 usingGeometry:(BOOL)a6 insets:(UIEdgeInsets)a7 hostingIdentifier:(id)a8 hostingProperties:(id)a9 anchorPoint:(CGPoint)a10
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  double v18;
  double v19;
  id v22;
  _TUIlHostingRenderModel *v23;
  _TUIlHostingRenderModel *v24;
  objc_super v26;
  CGFloat v27;
  CGFloat v28;

  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  height = a5.height;
  width = a5.width;
  v18 = a4.height;
  v19 = a4.width;
  v22 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_TUIlHostingRenderModel;
  v23 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:](&v26, "initWithReuseIdentifier:identifier:submodel:", CFSTR("TUIReuseIdentifierHostingView"), a3, 0);
  v24 = v23;
  if (v23)
  {
    v23->_requestedSize.width = width;
    v23->_requestedSize.height = height;
    v23->_usingGeometry = a6;
    objc_storeStrong((id *)&v23->_hostingIdentifier, a8);
    v24->_anchorPoint.x = v27;
    v24->_anchorPoint.y = v28;
    v24->_insets.top = top;
    v24->_insets.left = left;
    v24->_insets.bottom = bottom;
    v24->_insets.right = right;
    -[TUIRenderModelView setSize:](v24, "setSize:", v19, v18);
  }

  return v24;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  BOOL v9;
  BOOL v10;
  unsigned __int8 v11;
  TUIHostingIdentifier *hostingIdentifier;
  objc_super v14;

  v4 = (unsigned __int8 *)a3;
  if (v4)
  {
    v5 = objc_opt_class(self);
    v6 = objc_opt_class(v4);
    if (v5 == v6)
      v7 = v4;
    else
      v7 = 0;
    v8 = v7;
    if (v5 == v6
      && (v14.receiver = self,
          v14.super_class = (Class)_TUIlHostingRenderModel,
          -[TUIRenderModelView isEqualToRenderModel:](&v14, "isEqualToRenderModel:", v4))
      && (self->_requestedSize.width == *((double *)v4 + 11)
        ? (v9 = self->_requestedSize.height == *((double *)v4 + 12))
        : (v9 = 0),
          v9
       && self->_usingGeometry == v4[64]
       && (self->_anchorPoint.x == *((double *)v4 + 13)
         ? (v10 = self->_anchorPoint.y == *((double *)v4 + 14))
         : (v10 = 0),
           v10
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.top, *(float64x2_t *)(v4 + 120)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.bottom, *(float64x2_t *)(v4 + 136)))), 0xFuLL))) & 1) != 0)))
    {
      hostingIdentifier = self->_hostingIdentifier;
      if (hostingIdentifier == *((TUIHostingIdentifier **)v4 + 9))
        v11 = 1;
      else
        v11 = -[TUIHostingIdentifier isEqual:](hostingIdentifier, "isEqual:");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CGSize)requestedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_requestedSize.width;
  height = self->_requestedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)usingGeometry
{
  return self->_usingGeometry;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (TUIHostingIdentifier)hostingIdentifier
{
  return self->_hostingIdentifier;
}

- (TUIHostingProperties)hostingProperties
{
  return self->_hostingProperties;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingProperties, 0);
  objc_storeStrong((id *)&self->_hostingIdentifier, 0);
}

@end
