@implementation TUILayoutAttributes

+ (id)newLayoutAttributesWithIndexPath:(id)a3
{
  id v3;
  TUILayoutAttributes *v4;

  v3 = a3;
  v4 = objc_alloc_init(TUILayoutAttributes);
  -[TUILayoutAttributes setIndexPath:](v4, "setIndexPath:", v3);

  return v4;
}

- (TUILayoutAttributes)init
{
  TUILayoutAttributes *result;
  CGSize size;
  CGSize v4;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUILayoutAttributes;
  result = -[TUILayoutAttributes init](&v6, "init");
  if (result)
  {
    size = CGRectNull.size;
    result->_frame.origin = CGRectNull.origin;
    result->_frame.size = size;
    v4 = CGRectZero.size;
    result->_bounds.origin = CGRectZero.origin;
    result->_bounds.size = v4;
    result->_center = CGPointZero;
    v5 = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&result->_outsets.bottom = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    result->_alpha = 1.0;
    result->_zIndex = 0;
    *(_OWORD *)&result->_outsets.top = v5;
  }
  return result;
}

- (TUILayoutAttributes)initWithOther:(id)a3
{
  char *v4;
  char *v5;
  char *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v13;

  v4 = (char *)a3;
  v13.receiver = self;
  v13.super_class = (Class)TUILayoutAttributes;
  v5 = -[TUILayoutAttributes init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    v7 = *(_OWORD *)(v4 + 8);
    *(_OWORD *)(v5 + 24) = *(_OWORD *)(v4 + 24);
    *(_OWORD *)(v5 + 8) = v7;
    v8 = *(_OWORD *)(v4 + 120);
    *(_OWORD *)(v5 + 136) = *(_OWORD *)(v4 + 136);
    *(_OWORD *)(v5 + 120) = v8;
    *((_QWORD *)v5 + 7) = *((_QWORD *)v4 + 7);
    *((_QWORD *)v5 + 6) = *((_QWORD *)v4 + 6);
    v9 = *(_OWORD *)(v4 + 184);
    v10 = *(_OWORD *)(v4 + 200);
    *(_OWORD *)(v5 + 216) = *(_OWORD *)(v4 + 216);
    *(_OWORD *)(v5 + 200) = v10;
    *(_OWORD *)(v5 + 184) = v9;
    *(_OWORD *)(v5 + 104) = *(_OWORD *)(v4 + 104);
    v5[40] = v4[40];
    objc_storeStrong((id *)v5 + 8, *((id *)v4 + 8));
    objc_storeStrong((id *)v6 + 9, *((id *)v4 + 9));
    objc_storeStrong((id *)v6 + 10, *((id *)v4 + 10));
    objc_storeStrong((id *)v6 + 11, *((id *)v4 + 11));
    objc_storeStrong((id *)v6 + 12, *((id *)v4 + 12));
    v11 = *(_OWORD *)(v4 + 152);
    *(_OWORD *)(v6 + 168) = *(_OWORD *)(v4 + 168);
    *(_OWORD *)(v6 + 152) = v11;
    v6[41] = v4[41];
  }

  return (TUILayoutAttributes *)v6;
}

- (void)setSize:(CGSize)a3
{
  CGSize size;

  if (self->_bounds.size.width != a3.width || self->_bounds.size.height != a3.height)
  {
    self->_bounds.size = a3;
    size = CGRectNull.size;
    self->_frame.origin = CGRectNull.origin;
    self->_frame.size = size;
  }
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGSize size;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_bounds, a3))
  {
    self->_bounds.origin.x = x;
    self->_bounds.origin.y = y;
    self->_bounds.size.width = width;
    self->_bounds.size.height = height;
    size = CGRectNull.size;
    self->_frame.origin = CGRectNull.origin;
    self->_frame.size = size;
  }
}

- (void)setCenter:(CGPoint)a3
{
  CGSize size;

  if (self->_center.x != a3.x || self->_center.y != a3.y)
  {
    self->_center = a3;
    size = CGRectNull.size;
    self->_frame.origin = CGRectNull.origin;
    self->_frame.size = size;
  }
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGSize size;
  CGAffineTransform v10;
  CGAffineTransform t1;

  v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_transform.tx;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v7 = *(_OWORD *)&a3->a;
    v8 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->_transform.tx = v8;
    *(_OWORD *)&self->_transform.a = v7;
    size = CGRectNull.size;
    self->_frame.origin = CGRectNull.origin;
    self->_frame.size = size;
  }
}

- (CGRect)frame
{
  CGFloat y;
  double width;
  double height;
  __int128 v6;
  CGAffineTransform v7;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGRect v12;
  CGRect result;

  if (CGRectIsNull(self->_frame))
  {
    y = CGPointZero.y;
    width = self->_bounds.size.width;
    height = self->_bounds.size.height;
    memset(&v11, 0, sizeof(v11));
    CGAffineTransformMakeTranslation(&v11, width * -0.5, height * -0.5);
    t1 = v11;
    v6 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t2.c = v6;
    *(_OWORD *)&t2.tx = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v10, &t1, &t2);
    v11 = v10;
    CGAffineTransformMakeTranslation(&v7, self->_center.x, self->_center.y);
    t1 = v11;
    CGAffineTransformConcat(&v10, &t1, &v7);
    v11 = v10;
    v12.origin.x = CGPointZero.x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    result = CGRectApplyAffineTransform(v12, &v10);
    self->_frame = result;
  }
  else
  {
    return self->_frame;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUILayoutAttributes initWithOther:](+[TUILayoutAttributes allocWithZone:](TUILayoutAttributes, "allocWithZone:", a3), "initWithOther:", self);
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  unsigned __int8 v8;
  TUIRenderModel *renderModel;
  NSString *refId;
  NSString *refInstance;
  CGAffineTransform v13;
  CGAffineTransform t1;

  v4 = (char *)a3;
  v5 = objc_opt_class(TUILayoutAttributes);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
    goto LABEL_12;
  if (!CGRectEqualToRect(self->_bounds, *(CGRect *)(v4 + 120)))
    goto LABEL_12;
  v6 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_transform.tx;
  v7 = *(_OWORD *)(v4 + 200);
  *(_OWORD *)&v13.a = *(_OWORD *)(v4 + 184);
  *(_OWORD *)&v13.c = v7;
  *(_OWORD *)&v13.tx = *(_OWORD *)(v4 + 216);
  if (!CGAffineTransformEqualToTransform(&t1, &v13))
    goto LABEL_12;
  v8 = 0;
  if (self->_center.x == *((double *)v4 + 13) && self->_center.y == *((double *)v4 + 14))
  {
    if (self->_alpha == *((double *)v4 + 6)
      && self->_zIndex == *((_QWORD *)v4 + 7)
      && self->_hidden == v4[40]
      && self->_forceVisibleOnHover == v4[41])
    {
      if (-[NSIndexPath isEqual:](self->_indexPath, "isEqual:", *((_QWORD *)v4 + 8)))
      {
        if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_outsets.top, *(float64x2_t *)(v4 + 152)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_outsets.bottom, *(float64x2_t *)(v4 + 168)))), 0xFuLL))) & 1) != 0)
        {
          renderModel = self->_renderModel;
          if (renderModel == *((TUIRenderModel **)v4 + 9)
            || -[TUIRenderModel isEqualToRenderModel:](renderModel, "isEqualToRenderModel:"))
          {
            refId = self->_refId;
            if (refId == *((NSString **)v4 + 11) || -[NSString isEqualToString:](refId, "isEqualToString:"))
            {
              refInstance = self->_refInstance;
              if (refInstance == *((NSString **)v4 + 12))
                v8 = 1;
              else
                v8 = -[NSString isEqualToString:](refInstance, "isEqualToString:");
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (id)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  NSString *v20;
  void *v21;
  void *v22;
  CGFloat x;
  double y;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  float64x2_t v37;
  float64x2_t v38;
  CGFloat left;
  CGFloat right;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  CGAffineTransform transform;
  CGRect v47;
  CGRect v48;

  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v3, "addObject:", CFSTR("<"));
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %p"), self));
  objc_msgSend(v3, "addObject:", v7);

  v47.origin.x = CGRectNull.origin.x;
  v47.origin.y = CGRectNull.origin.y;
  v47.size.width = CGRectNull.size.width;
  v47.size.height = CGRectNull.size.height;
  if (!CGRectEqualToRect(self->_frame, v47))
  {
    v8 = NSStringFromCGRect(self->_frame);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" frame: (%@)"), v9));
    objc_msgSend(v3, "addObject:", v10);

  }
  v48.origin.x = CGRectZero.origin.x;
  v48.origin.y = CGRectZero.origin.y;
  v48.size.width = CGRectZero.size.width;
  v48.size.height = CGRectZero.size.height;
  if (!CGRectEqualToRect(self->_bounds, v48))
  {
    v11 = NSStringFromCGRect(self->_bounds);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" bounds: (%@)"), v12));
    objc_msgSend(v3, "addObject:", v13);

  }
  if (self->_zIndex)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" zIndex: (%@)"), v14));
    objc_msgSend(v3, "addObject:", v15);

  }
  if (fabs(self->_alpha + -1.0) >= 2.22044605e-16)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" alpha: (%@)"), v16));
    objc_msgSend(v3, "addObject:", v17);

  }
  v18 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&transform.c = v18;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->_transform.tx;
  if (!CGAffineTransformIsIdentity(&transform))
  {
    v19 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&transform.c = v19;
    *(_OWORD *)&transform.tx = *(_OWORD *)&self->_transform.tx;
    v20 = NSStringFromCGAffineTransform(&transform);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" transform: (%@)"), v21));
    objc_msgSend(v3, "addObject:", v22);

  }
  x = self->_center.x;
  y = self->_center.y;
  if (x != CGPointZero.x || y != CGPointZero.y)
  {
    v25 = NSStringFromCGPoint(*(CGPoint *)&x);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" center: (%@)"), v26));
    objc_msgSend(v3, "addObject:", v27);

  }
  if (self->_hidden)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" hidden: (%@)"), v28));
    objc_msgSend(v3, "addObject:", v29);

  }
  if (self->_forceVisibleOnHover)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" forceVisibleOnHover: (%@)"), v30));
    objc_msgSend(v3, "addObject:", v31);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" index path: (%@)"), self->_indexPath));
  objc_msgSend(v3, "addObject:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" render model: (%p)"), self->_renderModel));
  objc_msgSend(v3, "addObject:", v33);

  if (self->_generic)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" generic: (%p)"), self->_generic));
    objc_msgSend(v3, "addObject:", v34);

  }
  if (-[NSString length](self->_refId, "length"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" ref id: (%@)"), self->_refId));
    objc_msgSend(v3, "addObject:", v35);

  }
  if (-[NSString length](self->_refInstance, "length"))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" ref instance: (%@)"), self->_refInstance));
    objc_msgSend(v3, "addObject:", v36);

  }
  v37 = *(float64x2_t *)&self->_outsets.top;
  v38 = *(float64x2_t *)&self->_outsets.bottom;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v37, *(float64x2_t *)&UIEdgeInsetsZero.top), (int32x4_t)vceqq_f64(v38, *(float64x2_t *)&UIEdgeInsetsZero.bottom))), 0xFuLL))) & 1) == 0)
  {
    left = self->_outsets.left;
    right = self->_outsets.right;
    v41 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)v37.f64);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" outsets: (%@)"), v42));
    objc_msgSend(v3, "addObject:", v43);

  }
  objc_msgSend(v3, "addObject:", CFSTR(">"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", &stru_243BF0));

  return v44;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].d;
  return self;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (int64_t)zIndex
{
  return self->_zIndex;
}

- (void)setZIndex:(int64_t)a3
{
  self->_zIndex = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (BOOL)forceVisibleOnHover
{
  return self->_forceVisibleOnHover;
}

- (void)setForceVisibleOnHover:(BOOL)a3
{
  self->_forceVisibleOnHover = a3;
}

- (TUIRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_renderModel, a3);
}

- (id)generic
{
  return self->_generic;
}

- (void)setGeneric:(id)a3
{
  objc_storeStrong(&self->_generic, a3);
}

- (NSString)refId
{
  return self->_refId;
}

- (void)setRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)refInstance
{
  return self->_refInstance;
}

- (void)setRefInstance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIEdgeInsets)outsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_outsets.top;
  left = self->_outsets.left;
  bottom = self->_outsets.bottom;
  right = self->_outsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setOutsets:(UIEdgeInsets)a3
{
  self->_outsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refInstance, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong(&self->_generic, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
}

@end
