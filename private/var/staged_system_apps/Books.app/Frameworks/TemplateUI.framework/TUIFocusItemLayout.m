@implementation TUIFocusItemLayout

- (id)collectLinkEntities
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "linkEntities"));

  return v3;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  if (a3 < 4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "renderModelForContainerLayout:kind:", self, 6));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "focusStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionHandler"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "linkEntities"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFocusContainerView renderModelWithSubviewsModel:identifier:focusStyle:actionHandler:linkEntities:](TUIFocusContainerView, "renderModelWithSubviewsModel:identifier:focusStyle:actionHandler:linkEntities:", v5, v6, v8, v10, v12));

  return v13;
}

- (CGRect)computedErasableBoundsPrimitive
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect result;
  CGRect v25;

  v21.receiver = self;
  v21.super_class = (Class)TUIFocusItemLayout;
  -[TUILayout computedErasableBoundsPrimitive](&v21, "computedErasableBoundsPrimitive");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "focusStyle"));

  if (v12)
  {
    -[TUILayout computedBounds](self, "computedBounds");
    objc_msgSend(v12, "erasableBoundsWithBounds:");
    v25.origin.x = v13;
    v25.origin.y = v14;
    v25.size.width = v15;
    v25.size.height = v16;
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v23 = CGRectUnion(v22, v25);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
  }

  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end
