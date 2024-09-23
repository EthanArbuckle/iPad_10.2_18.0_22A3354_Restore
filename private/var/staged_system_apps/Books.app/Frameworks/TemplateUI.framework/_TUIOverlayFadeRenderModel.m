@implementation _TUIOverlayFadeRenderModel

- (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("TUIReuseIdentifierOverlayFadeView");
}

- (unint64_t)kind
{
  return 4;
}

- (TUIRenderModel)submodel
{
  return 0;
}

- (void)prepare
{
  -[TUIRenderModelSubviews prepare](self->_content, "prepare");
  -[TUIRenderModelSubviews prepare](self->_overlay, "prepare");
}

- (void)teardown
{
  -[TUIRenderModelSubviews teardown](self->_content, "teardown");
  -[TUIRenderModelSubviews teardown](self->_overlay, "teardown");
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  _TUIOverlayFadeRenderModel *v4;
  id v5;
  id v6;
  void *v7;
  _TUIOverlayFadeRenderModel *v8;

  v4 = self;
  v5 = -[TUIRenderModelSubviews copyForInitialAppearanceWithFlags:](v4->_content, "copyForInitialAppearanceWithFlags:", a3);
  v6 = -[TUIRenderModelSubviews copyForInitialAppearanceWithFlags:](v4->_overlay, "copyForInitialAppearanceWithFlags:", a3);
  v7 = v6;
  if (__PAIR128__((unint64_t)v6, (unint64_t)v5) != *(_OWORD *)&v4->_content)
  {
    v8 = -[_TUIOverlayFadeRenderModel initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:]([_TUIOverlayFadeRenderModel alloc], "initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:", v4->_identifier, v5, v6, v4->_layoutDirection, v4->_size.width, v4->_size.height, v4->_contentOrigin.x, v4->_contentOrigin.y, v4->_contentErasableInsets.top, v4->_contentErasableInsets.left, v4->_contentErasableInsets.bottom, v4->_contentErasableInsets.right, *(_QWORD *)&v4->_overlayOrigin.x, *(_QWORD *)&v4->_overlayOrigin.y, *(_QWORD *)&v4->_padding, *(_QWORD *)&v4->_gradientWidth);

    v4 = v8;
  }

  return v4;
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  _TUIOverlayFadeRenderModel *v4;
  id v5;
  id v6;
  void *v7;
  _TUIOverlayFadeRenderModel *v8;

  v4 = self;
  v5 = -[TUIRenderModelSubviews copyForFinalAppearanceWithFlags:](v4->_content, "copyForFinalAppearanceWithFlags:", a3);
  v6 = -[TUIRenderModelSubviews copyForFinalAppearanceWithFlags:](v4->_overlay, "copyForFinalAppearanceWithFlags:", a3);
  v7 = v6;
  if (__PAIR128__((unint64_t)v6, (unint64_t)v5) != *(_OWORD *)&v4->_content)
  {
    v8 = -[_TUIOverlayFadeRenderModel initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:]([_TUIOverlayFadeRenderModel alloc], "initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:", v4->_identifier, v5, v4->_overlay, v4->_layoutDirection, v4->_size.width, v4->_size.height, v4->_contentOrigin.x, v4->_contentOrigin.y, v4->_contentErasableInsets.top, v4->_contentErasableInsets.left, v4->_contentErasableInsets.bottom, v4->_contentErasableInsets.right, *(_QWORD *)&v4->_overlayOrigin.x, *(_QWORD *)&v4->_overlayOrigin.y, *(_QWORD *)&v4->_padding, *(_QWORD *)&v4->_gradientWidth);

    v4 = v8;
  }

  return v4;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  float64x2_t *v4;
  uint64_t v5;
  uint64_t v6;
  float64x2_t *v7;
  float64x2_t *v8;
  unsigned __int8 v9;
  TUIRenderModelSubviews *content;
  TUIRenderModelSubviews *overlay;

  v4 = (float64x2_t *)a3;
  if (!v4)
  {
    v9 = 0;
    goto LABEL_9;
  }
  v5 = objc_opt_class(self);
  v6 = objc_opt_class(v4);
  if (v5 == v6)
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;
  if (v5 != v6
    || self->_padding != v4[2].f64[1]
    || self->_gradientWidth != v4[3].f64[0]
    || self->_layoutDirection != *(_QWORD *)&v4[3].f64[1])
  {
    goto LABEL_6;
  }
  if (self->_contentOrigin.x != v4[5].f64[0] || self->_contentOrigin.y != v4[5].f64[1])
    goto LABEL_6;
  v9 = 0;
  if (self->_overlayOrigin.x != v4[6].f64[0] || self->_overlayOrigin.y != v4[6].f64[1])
    goto LABEL_7;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentErasableInsets.top, v4[7]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentErasableInsets.bottom, v4[8]))), 0xFuLL))) & 1) != 0&& ((content = self->_content, content == *(TUIRenderModelSubviews **)&v4[1].f64[1])|| -[TUIRenderModelSubviews isEqualToRenderModel:](content, "isEqualToRenderModel:")))
  {
    overlay = self->_overlay;
    if (overlay == *(TUIRenderModelSubviews **)&v4[2].f64[0])
      v9 = 1;
    else
      v9 = -[TUIRenderModelSubviews isEqualToRenderModel:](overlay, "isEqualToRenderModel:");
  }
  else
  {
LABEL_6:
    v9 = 0;
  }
LABEL_7:

LABEL_9:
  return v9;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (_TUIOverlayFadeRenderModel)initWithIdentifier:(id)a3 size:(CGSize)a4 content:(id)a5 contentOrigin:(CGPoint)a6 contentErasableInsets:(UIEdgeInsets)a7 overlay:(id)a8 overlayOrigin:(CGPoint)a9 padding:(double)a10 gradientWidth:(double)a11 layoutDirection:(unint64_t)a12
{
  CGFloat x;
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat y;
  CGFloat v19;
  CGFloat height;
  CGFloat width;
  id v25;
  id v26;
  id v27;
  _TUIOverlayFadeRenderModel *v28;
  _TUIOverlayFadeRenderModel *v29;
  objc_super v31;
  double v32;
  double v33;

  x = a9.x;
  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  y = a6.y;
  v19 = a6.x;
  height = a4.height;
  width = a4.width;
  v25 = a3;
  v26 = a5;
  v27 = a8;
  v31.receiver = self;
  v31.super_class = (Class)_TUIOverlayFadeRenderModel;
  v28 = -[_TUIOverlayFadeRenderModel init](&v31, "init");
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_identifier, a3);
    v29->_size.width = width;
    v29->_size.height = height;
    objc_storeStrong((id *)&v29->_content, a5);
    v29->_contentOrigin.x = v19;
    v29->_contentOrigin.y = y;
    v29->_contentErasableInsets.top = top;
    v29->_contentErasableInsets.left = left;
    v29->_contentErasableInsets.bottom = bottom;
    v29->_contentErasableInsets.right = right;
    objc_storeStrong((id *)&v29->_overlay, a8);
    v29->_overlayOrigin.x = a10;
    v29->_overlayOrigin.y = a11;
    v29->_padding = v32;
    v29->_gradientWidth = v33;
    *(CGFloat *)&v29->_layoutDirection = x;
  }

  return v29;
}

- (NSArray)debugContainedSubmodels
{
  TUIRenderModelSubviews *overlay;
  _QWORD v4[2];

  overlay = self->_overlay;
  v4[0] = self->_content;
  v4[1] = overlay;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 2));
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  TUIRenderModelSubviews *content;
  __int128 v7;
  id v8;
  TUIRenderModelSubviews *overlay;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  content = self->_content;
  v7 = *(_OWORD *)&a4->c;
  v11 = *(_OWORD *)&a4->a;
  v12 = v7;
  v13 = *(_OWORD *)&a4->tx;
  v8 = a3;
  -[TUIRenderModelSubviews appendResourcesToCollector:transform:](content, "appendResourcesToCollector:transform:", v8, &v11);
  overlay = self->_overlay;
  v10 = *(_OWORD *)&a4->c;
  v11 = *(_OWORD *)&a4->a;
  v12 = v10;
  v13 = *(_OWORD *)&a4->tx;
  -[TUIRenderModelSubviews appendResourcesToCollector:transform:](overlay, "appendResourcesToCollector:transform:", v8, &v11);

}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  TUIRenderModelSubviews *content;
  __int128 v11;
  id v12;
  id v13;
  id v14;
  TUIRenderModelSubviews *overlay;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  content = self->_content;
  v11 = *(_OWORD *)&a4->c;
  v17 = *(_OWORD *)&a4->a;
  v18 = v11;
  v19 = *(_OWORD *)&a4->tx;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  -[TUIRenderModelSubviews appendReferencesToCollector:transform:query:liveTransformResolver:](content, "appendReferencesToCollector:transform:query:liveTransformResolver:", v14, &v17, v13, v12);
  overlay = self->_overlay;
  v16 = *(_OWORD *)&a4->c;
  v17 = *(_OWORD *)&a4->a;
  v18 = v16;
  v19 = *(_OWORD *)&a4->tx;
  -[TUIRenderModelSubviews appendReferencesToCollector:transform:query:liveTransformResolver:](overlay, "appendReferencesToCollector:transform:query:liveTransformResolver:", v14, &v17, v13, v12);

}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  return 0;
}

- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4
{
  return 0;
}

- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4
{
  return 0;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TUIRenderModelSubviews)content
{
  return self->_content;
}

- (CGPoint)contentOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOrigin.x;
  y = self->_contentOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIEdgeInsets)contentErasableInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentErasableInsets.top;
  left = self->_contentErasableInsets.left;
  bottom = self->_contentErasableInsets.bottom;
  right = self->_contentErasableInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (TUIRenderModelSubviews)overlay
{
  return self->_overlay;
}

- (CGPoint)overlayOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_overlayOrigin.x;
  y = self->_overlayOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)padding
{
  return self->_padding;
}

- (double)gradientWidth
{
  return self->_gradientWidth;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
