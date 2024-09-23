@implementation TUIRenderModelTransform

- (CGRect)frame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  __int128 v7;
  CGAffineTransform v8;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGRect v13;
  CGRect result;

  if (CGRectIsNull(self->_frame))
  {
    -[TUIRenderModel size](self->_submodel, "size");
    v4 = v3;
    v6 = v5;
    memset(&v12, 0, sizeof(v12));
    CGAffineTransformMakeTranslation(&v12, v3 * -0.5, v5 * -0.5);
    t1 = v12;
    v7 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t2.c = v7;
    *(_OWORD *)&t2.tx = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v11, &t1, &t2);
    v12 = v11;
    CGAffineTransformMakeTranslation(&v8, self->_center.x, self->_center.y);
    t1 = v12;
    CGAffineTransformConcat(&v11, &t1, &v8);
    v12 = v11;
    v13.origin.x = 0.0;
    v13.origin.y = 0.0;
    v13.size.width = v4;
    v13.size.height = v6;
    result = CGRectApplyAffineTransform(v13, &v11);
    self->_frame = result;
  }
  else
  {
    return self->_frame;
  }
  return result;
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

  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v6 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->_transform.tx;
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

- (TUIRenderModelTransform)initWithSubmodel:(id)a3
{
  id v5;
  TUIRenderModelTransform *v6;
  TUIRenderModelTransform *v7;
  CGSize size;
  __int128 v9;
  TUILiveTransform *liveTransform;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUIRenderModelTransform;
  v6 = -[TUIRenderModelTransform init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    size = CGRectNull.size;
    v6->_frame.origin = CGRectNull.origin;
    v6->_frame.size = size;
    objc_storeStrong((id *)&v6->_submodel, a3);
    v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v7->_transform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v7->_transform.c = v9;
    *(_OWORD *)&v7->_transform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v7->_alpha = 1.0;
    liveTransform = v7->_liveTransform;
    v7->_itemIndex = 0x7FFFFFFFFFFFFFFFLL;
    v7->_liveTransform = 0;

  }
  return v7;
}

- (NSArray)debugContainedSubmodels
{
  void *v2;
  TUIRenderModel *submodel;

  if (self->_submodel)
  {
    submodel = self->_submodel;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &submodel, 1));
  }
  else
  {
    v2 = &__NSArray0__struct;
  }
  return (NSArray *)v2;
}

- (id)copyWithItemIndex:(unint64_t)a3
{
  TUIRenderModelTransform *v5;
  __int128 v6;
  __int128 v7;
  int64_t zIndex;
  TUIAnimationGroupCollection *v9;
  TUIAnimationGroupCollection *animationGroups;
  TUIAnimationGroupRenderModelCollection *v11;
  TUIAnimationGroupRenderModelCollection *animationRenderModels;
  __int128 v13;

  if (self->_itemIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_itemIndex = a3;
    return self;
  }
  else
  {
    v5 = -[TUIRenderModelTransform initWithSubmodel:]([TUIRenderModelTransform alloc], "initWithSubmodel:", self->_submodel);
    v6 = *(_OWORD *)&self->_transform.tx;
    v7 = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&v5->_transform.c = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&v5->_transform.tx = v6;
    *(_OWORD *)&v5->_transform.a = v7;
    v5->_center = self->_center;
    zIndex = self->_zIndex;
    v5->_alpha = self->_alpha;
    v5->_zIndex = zIndex;
    v5->_itemIndex = a3;
    v9 = (TUIAnimationGroupCollection *)-[TUIAnimationGroupCollection copy](self->_animationGroups, "copy");
    animationGroups = v5->_animationGroups;
    v5->_animationGroups = v9;

    v11 = (TUIAnimationGroupRenderModelCollection *)-[TUIAnimationGroupRenderModelCollection copy](self->_animationRenderModels, "copy");
    animationRenderModels = v5->_animationRenderModels;
    v5->_animationRenderModels = v11;

    objc_storeStrong((id *)&v5->_liveTransform, self->_liveTransform);
    objc_storeStrong((id *)&v5->_refId, self->_refId);
    objc_storeStrong((id *)&v5->_refInstance, self->_refInstance);
    v13 = *(_OWORD *)&self->_outsets.bottom;
    *(_OWORD *)&v5->_outsets.top = *(_OWORD *)&self->_outsets.top;
    *(_OWORD *)&v5->_outsets.bottom = v13;
    return v5;
  }
}

- (id)copyWithAlpha:(double)a3
{
  TUIRenderModelTransform *v5;
  __int128 v6;
  __int128 v7;
  int64_t zIndex;
  TUIAnimationGroupCollection *v9;
  TUIAnimationGroupCollection *animationGroups;
  TUIAnimationGroupRenderModelCollection *v11;
  TUIAnimationGroupRenderModelCollection *animationRenderModels;
  __int128 v13;

  if (self->_alpha == a3)
    return self;
  v5 = -[TUIRenderModelTransform initWithSubmodel:]([TUIRenderModelTransform alloc], "initWithSubmodel:", self->_submodel);
  v6 = *(_OWORD *)&self->_transform.a;
  v7 = *(_OWORD *)&self->_transform.tx;
  *(_OWORD *)&v5->_transform.c = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v5->_transform.tx = v7;
  *(_OWORD *)&v5->_transform.a = v6;
  v5->_center = self->_center;
  zIndex = self->_zIndex;
  v5->_alpha = a3;
  v5->_zIndex = zIndex;
  v5->_itemIndex = 0x7FFFFFFFFFFFFFFFLL;
  v9 = (TUIAnimationGroupCollection *)-[TUIAnimationGroupCollection copy](self->_animationGroups, "copy");
  animationGroups = v5->_animationGroups;
  v5->_animationGroups = v9;

  v11 = (TUIAnimationGroupRenderModelCollection *)-[TUIAnimationGroupRenderModelCollection copy](self->_animationRenderModels, "copy");
  animationRenderModels = v5->_animationRenderModels;
  v5->_animationRenderModels = v11;

  objc_storeStrong((id *)&v5->_liveTransform, self->_liveTransform);
  objc_storeStrong((id *)&v5->_refId, self->_refId);
  objc_storeStrong((id *)&v5->_refInstance, self->_refInstance);
  v13 = *(_OWORD *)&self->_outsets.bottom;
  *(_OWORD *)&v5->_outsets.top = *(_OWORD *)&self->_outsets.top;
  *(_OWORD *)&v5->_outsets.bottom = v13;
  return v5;
}

- (id)copyWithAlpha:(double)a3 submodel:(id)a4
{
  TUIRenderModel *v6;
  TUIRenderModel *submodel;
  TUIRenderModelTransform *v8;
  __int128 v9;
  __int128 v10;
  int64_t zIndex;
  TUIAnimationGroupCollection *v12;
  TUIAnimationGroupCollection *animationGroups;
  TUIAnimationGroupRenderModelCollection *v14;
  TUIAnimationGroupRenderModelCollection *animationRenderModels;
  __int128 v16;

  v6 = (TUIRenderModel *)a4;
  if (self->_alpha == a3
    && ((submodel = self->_submodel, submodel == v6)
     || -[TUIRenderModel isEqual:](submodel, "isEqual:", v6)))
  {
    v8 = self;
  }
  else
  {
    v8 = -[TUIRenderModelTransform initWithSubmodel:]([TUIRenderModelTransform alloc], "initWithSubmodel:", v6);
    v9 = *(_OWORD *)&self->_transform.a;
    v10 = *(_OWORD *)&self->_transform.tx;
    *(_OWORD *)&v8->_transform.c = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&v8->_transform.tx = v10;
    *(_OWORD *)&v8->_transform.a = v9;
    v8->_center = self->_center;
    zIndex = self->_zIndex;
    v8->_alpha = a3;
    v8->_zIndex = zIndex;
    v8->_itemIndex = 0x7FFFFFFFFFFFFFFFLL;
    v12 = (TUIAnimationGroupCollection *)-[TUIAnimationGroupCollection copy](self->_animationGroups, "copy");
    animationGroups = v8->_animationGroups;
    v8->_animationGroups = v12;

    v14 = (TUIAnimationGroupRenderModelCollection *)-[TUIAnimationGroupRenderModelCollection copy](self->_animationRenderModels, "copy");
    animationRenderModels = v8->_animationRenderModels;
    v8->_animationRenderModels = v14;

    objc_storeStrong((id *)&v8->_liveTransform, self->_liveTransform);
    objc_storeStrong((id *)&v8->_refId, self->_refId);
    objc_storeStrong((id *)&v8->_refInstance, self->_refInstance);
    v16 = *(_OWORD *)&self->_outsets.bottom;
    *(_OWORD *)&v8->_outsets.top = *(_OWORD *)&self->_outsets.top;
    *(_OWORD *)&v8->_outsets.bottom = v16;
  }

  return v8;
}

- (unint64_t)kind
{
  return (unint64_t)-[TUIRenderModel kind](self->_submodel, "kind");
}

- (void)setSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize size;

  height = a3.height;
  width = a3.width;
  -[TUIRenderModel size](self->_submodel, "size");
  if (width != v7 || height != v6)
  {
    -[TUIRenderModel setSize:](self->_submodel, "setSize:", width, height);
    size = CGRectNull.size;
    self->_frame.origin = CGRectNull.origin;
    self->_frame.size = size;
  }
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  -[TUIRenderModel size](self->_submodel, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setIdentifier:(id)a3
{
  -[TUIRenderModel setIdentifier:](self->_submodel, "setIdentifier:", a3);
}

- (TUIIdentifier)identifier
{
  return (TUIIdentifier *)-[TUIRenderModel identifier](self->_submodel, "identifier");
}

- (void)prepare
{
  -[TUIRenderModel prepare](self->_submodel, "prepare");
}

- (void)teardown
{
  -[TUIRenderModel teardown](self->_submodel, "teardown");
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v6 = a3;
  -[TUIRenderModelTransform size](self, "size");
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, v7 * -0.5, v8 * -0.5);
  t1 = v15;
  v9 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t2.c = v9;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_transform.tx;
  CGAffineTransformConcat(&v14, &t1, &t2);
  v15 = v14;
  CGAffineTransformMakeTranslation(&v11, self->_center.x, self->_center.y);
  t1 = v15;
  CGAffineTransformConcat(&v14, &t1, &v11);
  v15 = v14;
  t1 = v14;
  v10 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformConcat(&v14, &t1, &t2);
  v15 = v14;
  -[TUIRenderModel appendResourcesToCollector:transform:](self->_submodel, "appendResourcesToCollector:transform:", v6, &v14);

}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSString *refId;
  NSString *refInstance;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CGFloat a;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  CGFloat tx;
  CGFloat ty;
  double y;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  TUIRenderReferenceTransform *v45;
  TUIRenderReferenceIdentifier *v46;
  void *v47;
  void *v48;
  TUIRenderReferenceIdentifier *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  double v55;
  double v56;
  CGAffineTransform v57;
  CGAffineTransform t2;
  _OWORD v59[2];
  CGFloat v60;
  CGFloat v61;
  CGAffineTransform v62;
  CGAffineTransform t1;
  CGAffineTransform v64;
  CGAffineTransform v65;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[TUIRenderModelTransform size](self, "size");
  v14 = v13;
  v16 = v15;
  if (v11
    && (refId = self->_refId,
        refInstance = self->_refInstance,
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelTransform identifier](self, "identifier")),
        LODWORD(refId) = objc_msgSend(v11, "matchesRefId:refInstance:identifier:", refId, refInstance, v19), v19, !(_DWORD)refId))
  {
    memset(&v65, 0, sizeof(v65));
    CGAffineTransformMakeTranslation(&v65, v14 * -0.5, v16 * -0.5);
    t1 = v65;
    v30 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t2.c = v30;
    *(_OWORD *)&t2.tx = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v64, &t1, &t2);
    v65 = v64;
    CGAffineTransformMakeTranslation(&v57, self->_center.x, self->_center.y);
    t1 = v65;
    CGAffineTransformConcat(&v64, &t1, &v57);
    v65 = v64;
    t1 = v64;
    v31 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t2.c = v31;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v64, &t1, &t2);
    v65 = v64;
    -[TUIRenderModel appendReferencesToCollector:transform:query:liveTransformResolver:](self->_submodel, "appendReferencesToCollector:transform:query:liveTransformResolver:", v10, &v64, v11, v12);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelTransform liveTransform](self, "liveTransform"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "liveLayoutAttributesForRenderModel:", self));
      objc_msgSend(v21, "center");
      v23 = v22;
      objc_msgSend(v21, "center");
      CGAffineTransformMakeTranslation(&v65, v23, v24);
      v51 = *(_OWORD *)&v65.c;
      v53 = *(_OWORD *)&v65.a;
      v50 = *(_OWORD *)&v65.tx;
      objc_msgSend(v21, "size");
      v55 = v25;
      v56 = v26;

      v28 = v50;
      v27 = v51;
      v29 = v53;
    }
    else
    {
      CGAffineTransformMakeTranslation(&v65, self->_center.x, self->_center.y);
      v29 = *(_OWORD *)&v65.a;
      v27 = *(_OWORD *)&v65.c;
      v28 = *(_OWORD *)&v65.tx;
      v55 = v14;
      v56 = v16;
    }
    *(_OWORD *)&v64.a = v29;
    *(_OWORD *)&v64.c = v27;
    *(_OWORD *)&v64.tx = v28;
    v32 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t1.c = v32;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v65, &v64, &t1);
    v33 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&v64.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&v64.c = v33;
    *(_OWORD *)&v64.tx = *(_OWORD *)&self->_transform.tx;
    t1 = v65;
    CGAffineTransformConcat(&v65, &v64, &t1);
    a = v65.a;
    b = v65.b;
    c = v65.c;
    d = v65.d;
    tx = v65.tx;
    ty = v65.ty;
    y = CGPointZero.y;
    v41 = v65.tx + v65.c * y + v65.a * CGPointZero.x;
    v42 = v65.ty + v65.d * y + v65.b * CGPointZero.x;
    CGAffineTransformMakeTranslation(&v62, -v41, -v42);
    v64.a = a;
    v64.b = b;
    v64.c = c;
    v64.d = d;
    v64.tx = tx;
    v64.ty = ty;
    CGAffineTransformConcat(&v65, &v64, &v62);
    v52 = *(_OWORD *)&v65.c;
    v54 = *(_OWORD *)&v65.a;
    v43 = v65.tx;
    v44 = v65.ty;
    v45 = objc_alloc_init(TUIRenderReferenceTransform);
    -[TUIRenderReferenceTransform setRenderModel:](v45, "setRenderModel:", self->_submodel);
    -[TUIRenderReferenceTransform setSize:](v45, "setSize:", v55, v56);
    v59[0] = v54;
    v59[1] = v52;
    v60 = v43;
    v61 = v44;
    -[TUIRenderReferenceTransform setTransform:](v45, "setTransform:", v59);
    -[TUIRenderReferenceTransform setCenter:](v45, "setCenter:", v41, v42);
    v46 = [TUIRenderReferenceIdentifier alloc];
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uid"));
    v49 = -[TUIRenderReferenceIdentifier initWithUUID:uid:refId:refInstance:](v46, "initWithUUID:uid:refId:refInstance:", v47, v48, self->_refId, self->_refInstance);
    objc_msgSend(v10, "appendReference:withIdentifier:", v45, v49);

  }
}

- (void)setCenter:(CGPoint)a3
{
  float64x2_t v5;
  float64_t x;
  float64_t y;

  if (a3.x != self->_center.x || a3.y != self->_center.y)
  {
    x = a3.x;
    y = a3.y;
    if (!CGRectIsNull(self->_frame))
    {
      v5.f64[0] = x;
      v5.f64[1] = y;
      self->_frame.origin = (CGPoint)vaddq_f64((float64x2_t)self->_frame.origin, vsubq_f64(v5, (float64x2_t)self->_center));
    }
    self->_center.x = x;
    self->_center.y = y;
  }
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  id v22;
  TUIRenderModel *v23;
  TUIRenderModel *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  TUIRenderModel *v31;
  TUIRenderModel *submodel;
  TUIRenderModel *v33;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_class(self);
    if (v6 == objc_opt_class(v5))
    {
      v9 = v5;
    }
    else
    {
      v7 = objc_opt_class(TUIRenderModelTransform);
      v8 = TUIDynamicCast(v7, v5);
      v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    }
    v11 = v9;
    if (TUIRenderModelIsEqualToRenderModel(self, v9))
    {
      -[TUIRenderModelTransform transform](self, "transform");
      if (v11)
        objc_msgSend(v11, "transform");
      else
        memset(&t2, 0, sizeof(t2));
      if (CGAffineTransformEqualToTransform(&t1, &t2))
      {
        -[TUIRenderModelTransform center](self, "center");
        v13 = v12;
        v15 = v14;
        objc_msgSend(v11, "center");
        v10 = 0;
        if (v13 != v17 || v15 != v16)
          goto LABEL_32;
        v18 = -[TUIRenderModelTransform zIndex](self, "zIndex");
        if (v18 == objc_msgSend(v11, "zIndex"))
        {
          -[TUIRenderModelTransform alpha](self, "alpha");
          v20 = v19;
          objc_msgSend(v11, "alpha");
          if (v20 == v21)
          {
            v22 = -[TUIRenderModelTransform itemIndex](self, "itemIndex");
            if (v22 == objc_msgSend(v11, "itemIndex"))
            {
              v23 = (TUIRenderModel *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelTransform refId](self, "refId"));
              v24 = (TUIRenderModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "refId"));
              if (v23 != v24)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelTransform refId](self, "refId"));
                v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "refId"));
                if (!objc_msgSend(v25, "isEqualToString:", v3))
                {

                  v10 = 0;
                  goto LABEL_30;
                }
                v35 = v25;
              }
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelTransform refInstance](self, "refInstance", v35));
              v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "refInstance"));
              if (v26 == (void *)v27)
              {

                v31 = v23;
                if (v23 != v24)
                {

                  v31 = v24;
                }

                goto LABEL_28;
              }
              v28 = (void *)v27;
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelTransform refInstance](self, "refInstance"));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "refInstance"));
              v37 = objc_msgSend(v29, "isEqualToString:", v30);

              if (v23 == v24)
              {

              }
              else
              {

              }
              if ((v37 & 1) != 0)
              {
LABEL_28:
                submodel = self->_submodel;
                v23 = (TUIRenderModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "submodel"));
                if (submodel == v23)
                {
                  v10 = 1;
                  goto LABEL_35;
                }
                v33 = self->_submodel;
                v24 = (TUIRenderModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "submodel"));
                v10 = -[TUIRenderModel isEqualToRenderModel:](v33, "isEqualToRenderModel:", v24);
LABEL_30:

LABEL_35:
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
    v10 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v10 = 0;
LABEL_33:

  return v10;
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  unsigned int v5;
  double alpha;
  id v7;
  id v8;

  v5 = -[TUIRenderModel handlesAlphaForInitialAppearance](self->_submodel, "handlesAlphaForInitialAppearance");
  if ((a3 & 1) != 0 || (alpha = 0.0, v5))
    alpha = self->_alpha;
  v7 = -[TUIRenderModel copyForInitialAppearanceWithFlags:](self->_submodel, "copyForInitialAppearanceWithFlags:", v5 ^ 1 | a3);
  v8 = -[TUIRenderModelTransform copyWithAlpha:submodel:](self, "copyWithAlpha:submodel:", v7, alpha);

  return v8;
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  unsigned int v5;
  double alpha;
  id v7;
  id v8;

  v5 = -[TUIRenderModel handlesAlphaForFinalAppearance](self->_submodel, "handlesAlphaForFinalAppearance");
  if ((a3 & 1) != 0 || (alpha = 0.0, v5))
    alpha = self->_alpha;
  v7 = -[TUIRenderModel copyForFinalAppearanceWithFlags:](self->_submodel, "copyForFinalAppearanceWithFlags:", v5 ^ 1 | a3);
  v8 = -[TUIRenderModelTransform copyWithAlpha:submodel:](self, "copyWithAlpha:submodel:", v7, alpha);

  return v8;
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  TUIRenderModel *submodel;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_opt_class(self->_submodel);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "submodel"));
  if (v13 == objc_opt_class(v14))
  {
    v16 = -[TUIRenderModel conformsToProtocol:](self->_submodel, "conformsToProtocol:", &OBJC_PROTOCOL___TUIRenderModelContaining);

    if (!v16)
    {
      v15 = 0;
      goto LABEL_7;
    }
    submodel = self->_submodel;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "submodel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "submodel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModel computeContainerUpdateCurrent:from:tracker:flags:](submodel, "computeContainerUpdateCurrent:from:tracker:flags:", v14, v18, v12, a6));

  }
  else
  {
    v15 = 0;
  }

LABEL_7:
  return v15;
}

- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4
{
  id v5;
  id v6;

  v5 = -[TUIRenderModel newToContainerPlusDeletesWithUpdate:interests:](self->_submodel, "newToContainerPlusDeletesWithUpdate:interests:", a3, a4);
  v6 = -[TUIRenderModelTransform copyWithAlpha:submodel:](self, "copyWithAlpha:submodel:", v5, self->_alpha);

  return v6;
}

- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4
{
  TUIRenderModel *submodel;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  submodel = self->_submodel;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "submodel"));
  v9 = -[TUIRenderModel newCurrentContainerPlusInsertsWithCurrent:update:](submodel, "newCurrentContainerPlusInsertsWithCurrent:update:", v8, v6);

  objc_msgSend(v7, "alpha");
  v10 = objc_msgSend(v7, "copyWithAlpha:submodel:", v9);

  return v10;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 1;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelTransform identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  __int128 v12;
  NSString *v13;
  void *v14;
  id v15;
  CGAffineTransform transform;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p"), v6, self);

  if (self->_refId)
    objc_msgSend(v7, "appendFormat:", CFSTR(" refid=%@"), self->_refId);
  if (self->_refInstance)
    objc_msgSend(v7, "appendFormat:", CFSTR(" refinst=%@"), self->_refInstance);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_zIndex));
  objc_msgSend(v7, "appendFormat:", CFSTR(" zIndex=%@"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_alpha));
  objc_msgSend(v7, "appendFormat:", CFSTR(" alpha=%@"), v9);

  v10 = NSStringFromCGPoint(self->_center);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v7, "appendFormat:", CFSTR(" center=%@"), v11);

  v12 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&transform.c = v12;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->_transform.tx;
  v13 = NSStringFromCGAffineTransform(&transform);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v7, "appendFormat:", CFSTR(" transform=%@"), v14);

  objc_msgSend(v7, "appendFormat:", CFSTR(" submodel=%@"), self->_submodel);
  objc_msgSend(v7, "appendFormat:", CFSTR(">"));
  v15 = objc_msgSend(v7, "copy");

  return (NSString *)v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  __int128 v5;
  __int128 v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v11;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithSubmodel:", self->_submodel);
  v5 = *(_OWORD *)&self->_transform.tx;
  v6 = *(_OWORD *)&self->_transform.a;
  *((_OWORD *)v4 + 11) = *(_OWORD *)&self->_transform.c;
  *((_OWORD *)v4 + 12) = v5;
  *((_OWORD *)v4 + 10) = v6;
  *((_OWORD *)v4 + 7) = self->_center;
  *((_QWORD *)v4 + 9) = self->_zIndex;
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_alpha;
  *((_QWORD *)v4 + 10) = self->_itemIndex;
  v7 = -[TUIAnimationGroupCollection copy](self->_animationGroups, "copy");
  v8 = (void *)*((_QWORD *)v4 + 6);
  *((_QWORD *)v4 + 6) = v7;

  v9 = -[TUIAnimationGroupRenderModelCollection copy](self->_animationRenderModels, "copy");
  v10 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v9;

  objc_storeStrong((id *)v4 + 11, self->_liveTransform);
  objc_storeStrong((id *)v4 + 12, self->_refId);
  objc_storeStrong((id *)v4 + 13, self->_refInstance);
  v11 = *(_OWORD *)&self->_outsets.bottom;
  *((_OWORD *)v4 + 8) = *(_OWORD *)&self->_outsets.top;
  *((_OWORD *)v4 + 9) = v11;
  return v4;
}

- (id)submodel
{
  return self->_submodel;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].a;
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

- (TUIAnimationGroupRenderModelCollection)animationRenderModels
{
  return self->_animationRenderModels;
}

- (void)setAnimationRenderModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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

- (int64_t)zIndex
{
  return self->_zIndex;
}

- (void)setZIndex:(int64_t)a3
{
  self->_zIndex = a3;
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

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (TUILiveTransform)liveTransform
{
  return self->_liveTransform;
}

- (void)setLiveTransform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)refId
{
  return self->_refId;
}

- (void)setRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)refInstance
{
  return self->_refInstance;
}

- (void)setRefInstance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refInstance, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_liveTransform, 0);
  objc_storeStrong((id *)&self->_animationRenderModels, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_submodel, 0);
}

@end
