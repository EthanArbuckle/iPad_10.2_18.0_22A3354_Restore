@implementation TUIEmbeddedCollectionViewRenderModel

- (TUIEmbeddedCollectionViewRenderModel)initWithUpdateController:(id)a3 uid:(id)a4 UUID:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUIEmbeddedCollectionViewRenderModel *v12;
  TUIEmbeddedCollectionViewRenderModel *v13;
  NSString *v14;
  NSString *uid;
  NSUUID *v16;
  NSUUID *UUID;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TUIEmbeddedCollectionViewRenderModel;
  v12 = -[TUIEmbeddedCollectionViewRenderModel init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_updateController, a3);
    v14 = (NSString *)objc_msgSend(v10, "copy");
    uid = v13->_uid;
    v13->_uid = v14;

    v16 = (NSUUID *)objc_msgSend(v11, "copy");
    UUID = v13->_UUID;
    v13->_UUID = v16;

  }
  return v13;
}

- (unint64_t)kind
{
  return 10;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  double x;
  double y;
  __int128 v13;
  void *v14;
  CGAffineTransform v15;
  CGAffineTransform t1;
  CGAffineTransform v17;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel identifier](self, "identifier"));
  v8 = objc_msgSend(v6, "resourceCollectorShouldIncludeEmbeddedForIdentifier:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel identifier](self, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resourceCollectorViewStateForIdentifier:", v9));

    if (v10)
    {
      objc_msgSend(v10, "contentOffset");
    }
    else
    {
      x = CGPointZero.x;
      y = CGPointZero.y;
    }
    memset(&v17, 0, sizeof(v17));
    CGAffineTransformMakeTranslation(&t1, -x, -y);
    v13 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v15.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v15.c = v13;
    *(_OWORD *)&v15.tx = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v17, &t1, &v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateCollectionController renderModel](self->_updateController, "renderModel"));
    v15 = v17;
    objc_msgSend(v14, "appendResourcesToCollector:transform:", v6, &v15);

  }
}

- (UIEdgeInsets)_computedContentInsetsWithRenderModel:(id)a3
{
  int8x16_t v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  float64x2_t v12;
  int8x16_t v13;
  UIEdgeInsets result;

  if (a3)
  {
    objc_msgSend(a3, "insets");
  }
  else
  {
    v3.i64[0] = *(_QWORD *)&UIEdgeInsetsZero.top;
    v4.i64[0] = *(_QWORD *)&UIEdgeInsetsZero.left;
    v5.i64[0] = *(_QWORD *)&UIEdgeInsetsZero.bottom;
    v6.i64[0] = *(_QWORD *)&UIEdgeInsetsZero.right;
  }
  if (self->_gradientInsets.left < 0.0)
    v4.i64[0] = *(_QWORD *)&self->_gradientInsets.left;
  if (self->_gradientInsets.right < 0.0)
    v6.i64[0] = *(_QWORD *)&self->_gradientInsets.right;
  *(double *)v7.i64 = ceil(fabs(*(double *)v3.i64));
  *(double *)v8.i64 = ceil(fabs(*(double *)v4.i64));
  *(double *)v9.i64 = ceil(fabs(*(double *)v5.i64));
  *(double *)v10.i64 = ceil(fabs(*(double *)v6.i64));
  *(double *)v3.i64 = -*(double *)v3.i64;
  v12.f64[0] = NAN;
  v12.f64[1] = NAN;
  v13 = (int8x16_t)vnegq_f64(v12);
  v3.i64[0] = vbslq_s8(v13, v7, v3).u64[0];
  *(double *)v4.i64 = -*(double *)v4.i64;
  v4.i64[0] = vbslq_s8(v13, v8, v4).u64[0];
  *(double *)v5.i64 = -*(double *)v5.i64;
  v5.i64[0] = vbslq_s8(v13, v9, v5).u64[0];
  *(double *)v6.i64 = -*(double *)v6.i64;
  v6.i64[0] = vbslq_s8(v13, v10, v6).u64[0];
  result.right = *(double *)v6.i64;
  result.bottom = *(double *)v5.i64;
  result.left = *(double *)v4.i64;
  result.top = *(double *)v3.i64;
  return result;
}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double x;
  double v17;
  double y;
  void *v19;
  __int128 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  CGAffineTransform *p_t2;
  void *v31;
  CGAffineTransform v32;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v35;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel identifier](self, "identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewStateForIdentifier:", v13));

  if (v14)
  {
    objc_msgSend(v14, "contentOffset");
    x = v15;
    y = v17;
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateCollectionController renderModel](self->_updateController, "renderModel"));
  v20 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v35.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v35.c = v20;
  *(_OWORD *)&v35.tx = *(_OWORD *)&a4->tx;
  -[TUIEmbeddedCollectionViewRenderModel _computedContentInsetsWithRenderModel:](self, "_computedContentInsetsWithRenderModel:", v19);
  v22 = v21;
  v24 = v23;
  if (objc_msgSend(v19, "layoutDirection") == (char *)&dword_0 + 2)
  {
    -[TUIEmbeddedCollectionViewRenderModel size](self, "size");
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateCollectionController renderModel](self->_updateController, "renderModel"));
    objc_msgSend(v27, "size");
    v29 = v28;

    CGAffineTransformMakeTranslation(&v32, x + v24 + v26 - v29, -(y + v22));
    t1 = v35;
    p_t2 = &v32;
  }
  else
  {
    CGAffineTransformMakeTranslation(&t2, -(x + v24), -(y + v22));
    t1 = v35;
    p_t2 = &t2;
  }
  CGAffineTransformConcat(&v35, &t1, p_t2);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateCollectionController renderModel](self->_updateController, "renderModel"));
  t1 = v35;
  objc_msgSend(v31, "appendReferencesToCollector:transform:query:liveTransformResolver:", v10, &t1, v12, v11);

}

- (BOOL)isEqualToRenderModel:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  BOOL v14;
  BOOL v16;
  TUIScrollablePolicy *scrollPolicy;
  TUIScrollablePolicy *v18;
  int acceptsDrop;
  double decelerationRate;
  double v21;
  TUIElementActionTriggerHandler *dropHandler;
  TUIElementActionTriggerHandler *v23;
  TUIElementActionTriggerHandler *v24;
  TUIRenderUpdateCollectionController *updateController;
  TUIRenderUpdateCollectionController *v27;

  v5 = a3;
  v6 = objc_opt_class(TUIEmbeddedCollectionViewRenderModel);
  v7 = TUIDynamicCast(v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (TUIRenderModelIsEqualToRenderModel(self, v8))
  {
    objc_msgSend(v8, "gradientInsets");
    v13 = self->_gradientInsets.left == v12 && self->_gradientInsets.top == v9;
    v14 = v13 && self->_gradientInsets.right == v11;
    if (v14 && self->_gradientInsets.bottom == v10)
    {
      scrollPolicy = self->_scrollPolicy;
      v18 = (TUIScrollablePolicy *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollPolicy"));
      if (scrollPolicy != v18
        || (acceptsDrop = self->_acceptsDrop, acceptsDrop != objc_msgSend(v8, "acceptsDrop"))
        || (decelerationRate = self->_decelerationRate, objc_msgSend(v8, "decelerationRate"), decelerationRate != v21))
      {
        v16 = 0;
LABEL_20:

        goto LABEL_21;
      }
      dropHandler = self->_dropHandler;
      v23 = (TUIElementActionTriggerHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dropHandler"));
      if (dropHandler == v23
        || (v24 = self->_dropHandler,
            v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dropHandler")),
            -[TUIElementActionTriggerHandler isEqual:](v24, "isEqual:", v3)))
      {
        updateController = self->_updateController;
        v27 = (TUIRenderUpdateCollectionController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "updateController"));
        v16 = updateController == v27;

        if (dropHandler == v23)
        {
          v23 = dropHandler;
          goto LABEL_25;
        }
      }
      else
      {
        v16 = 0;
      }

LABEL_25:
      goto LABEL_20;
    }
  }
  v16 = 0;
LABEL_21:

  return v16;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 1;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (NSArray)debugContainedSubmodels
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v2 = objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateCollectionController renderModel](self->_updateController, "renderModel"));
  v3 = (void *)v2;
  if (v2)
  {
    v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  else
  {
    v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TUIRenderUpdateCollectionController)updateController
{
  return self->_updateController;
}

- (void)setUpdateController:(id)a3
{
  objc_storeStrong((id *)&self->_updateController, a3);
}

- (TUIScrollablePolicy)scrollPolicy
{
  return self->_scrollPolicy;
}

- (void)setScrollPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_scrollPolicy, a3);
}

- (BOOL)acceptsDrop
{
  return self->_acceptsDrop;
}

- (void)setAcceptsDrop:(BOOL)a3
{
  self->_acceptsDrop = a3;
}

- (TUIElementActionTriggerHandler)dropHandler
{
  return self->_dropHandler;
}

- (void)setDropHandler:(id)a3
{
  objc_storeStrong((id *)&self->_dropHandler, a3);
}

- (double)decelerationRate
{
  return self->_decelerationRate;
}

- (void)setDecelerationRate:(double)a3
{
  self->_decelerationRate = a3;
}

- (double)pageGap
{
  return self->_pageGap;
}

- (void)setPageGap:(double)a3
{
  self->_pageGap = a3;
}

- (UIEdgeInsets)gradientInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gradientInsets.top;
  left = self->_gradientInsets.left;
  bottom = self->_gradientInsets.bottom;
  right = self->_gradientInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGradientInsets:(UIEdgeInsets)a3
{
  self->_gradientInsets = a3;
}

- (UIEdgeInsets)gradientFraction
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gradientFraction.top;
  left = self->_gradientFraction.left;
  bottom = self->_gradientFraction.bottom;
  right = self->_gradientFraction.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGradientFraction:(UIEdgeInsets)a3
{
  self->_gradientFraction = a3;
}

- (TUIIdentifier)scrollIdentifier
{
  return self->_scrollIdentifier;
}

- (void)setScrollIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_scrollIdentifier, a3);
}

- (TUIIdentifier)ancestorScrollIdentifier
{
  return self->_ancestorScrollIdentifier;
}

- (void)setAncestorScrollIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ancestorScrollIdentifier, a3);
}

- (NSString)uid
{
  return self->_uid;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_ancestorScrollIdentifier, 0);
  objc_storeStrong((id *)&self->_scrollIdentifier, 0);
  objc_storeStrong((id *)&self->_dropHandler, 0);
  objc_storeStrong((id *)&self->_scrollPolicy, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
