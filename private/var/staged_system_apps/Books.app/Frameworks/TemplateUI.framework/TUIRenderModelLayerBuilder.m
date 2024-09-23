@implementation TUIRenderModelLayerBuilder

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[_TUIAnimationState animationForLayer:forKey:](_TUIAnimationState, "animationForLayer:forKey:", a3, a4);
}

- (void)setModel:(id)a3
{
  TUIRenderModelLayer *v5;
  TUIRenderModelLayer *model;
  TUIRenderModelLayer **p_model;
  TUIRenderModelLayer *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CALayer *layer;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double MidX;
  double MidY;
  double v30;
  CGFloat MinY;
  TUIRenderModelLayer *v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v5 = (TUIRenderModelLayer *)a3;
  p_model = &self->_model;
  model = self->_model;
  if (model != v5)
  {
    v32 = v5;
    v8 = model;
    -[TUIRenderModelLayerBuilder _updateLayerWithPreviousModel:newModel:](self, "_updateLayerWithPreviousModel:newModel:", v8, v32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelLayer submodels](v8, "submodels"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelLayer submodels](v32, "submodels"));
    -[TUIRenderModelLayerBuilder _updateFromPreviousSubmodels:newSubmodels:](self, "_updateFromPreviousSubmodels:newSubmodels:", v9, v10);

    objc_storeStrong((id *)&self->_model, a3);
    if (!-[TUIRenderModelLayer isEqual:](v8, "isEqual:", v32))
    {
      -[TUIRenderModelLayerBuilder _updateSubmodelLayers](self, "_updateSubmodelLayers");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelLayer config](self->_model, "config"));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelLayer config](self->_model, "config"));
        objc_msgSend(v12, "configureSublayers:forLayer:", self->_sublayers, self->_layer);

      }
      else
      {
        -[CALayer setSublayers:](self->_layer, "setSublayers:", self->_sublayers);
      }
      -[TUIRenderModelLayer size](*p_model, "size");
      v14 = v13;
      v16 = v15;
      -[TUIRenderModelLayer eraseableInsets](*p_model, "eraseableInsets");
      if (UIEdgeInsetsZero.left == v18
        && UIEdgeInsetsZero.top == v17
        && UIEdgeInsetsZero.right == v20
        && UIEdgeInsetsZero.bottom == v19)
      {
        layer = self->_layer;
        v22 = 0.5;
        v23 = 0.5;
      }
      else
      {
        v24 = v18 + 0.0;
        v25 = v17 + 0.0;
        v26 = v14 - (v18 + v20);
        v27 = v16 - (v17 + v19);
        v33.origin.x = 0.0;
        v33.origin.y = 0.0;
        v33.size.width = v14;
        v33.size.height = v16;
        MidX = CGRectGetMidX(v33);
        v34.origin.x = 0.0;
        v34.origin.y = 0.0;
        v34.size.width = v14;
        v34.size.height = v16;
        MidY = CGRectGetMidY(v34);
        v35.origin.x = v24;
        v35.origin.y = v25;
        v35.size.width = v26;
        v35.size.height = v27;
        v30 = (MidX - CGRectGetMinX(v35)) / v26;
        v36.origin.x = v24;
        v36.origin.y = v25;
        v36.size.width = v26;
        v36.size.height = v27;
        MinY = CGRectGetMinY(v36);
        layer = self->_layer;
        v23 = (MidY - MinY) / v27;
        v22 = v30;
      }
      -[CALayer setAnchorPoint:](layer, "setAnchorPoint:", v22, v23);
    }

    v5 = v32;
  }

}

- (void)dynamicUserInterfaceTraitDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TUIRenderModelLayer config](self->_model, "config"));
  objc_msgSend(v3, "dynamicUserInterfaceTraitDidChangeForLayer:", self->_layer);

}

- (void)_updateLayerWithPreviousModel:(id)a3 newModel:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CALayer *layer;
  BOOL v23;
  unsigned int v24;
  CALayer *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  CALayer *v31;
  CALayer *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  id v40;
  CALayer *v41;
  CALayer *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  _QWORD v47[2];
  _QWORD v48[2];
  CGRect v49;
  CGRect v50;

  v46 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "config"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "config"));
  if (v8 == v7)
    goto LABEL_20;
  objc_msgSend(v6, "size");
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v7, "layerClassForSize:");
  objc_msgSend(v6, "eraseableInsets");
  v15 = v14 + 0.0;
  v17 = v16 + 0.0;
  v19 = v10 - (v14 + v18);
  v21 = v12 - (v16 + v20);
  layer = self->_layer;
  if (!layer)
    goto LABEL_10;
  -[CALayer bounds](layer, "bounds");
  v50.origin.x = v15;
  v50.origin.y = v17;
  v50.size.width = v19;
  v50.size.height = v21;
  v23 = CGRectEqualToRect(v49, v50);
  v24 = v23 ? 0 : objc_msgSend(v8, "reuseLayerForBoundsChange") ^ 1;
  v25 = self->_layer;
  if (v25
    && v13 == (id)objc_opt_class(v25)
    && (v26 = objc_opt_class(v8), v26 == objc_opt_class(v7))
    && (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "identifier")),
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier")),
        v29 = objc_msgSend(v27, "isEqual:", v28) ^ 1 | v24,
        v28,
        v27,
        v29 != 1))
  {
    v38 = objc_msgSend(v8, "isEqualToConfig:", v7);
    v39 = v38;
    if (v23)
    {
      if ((v38 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      -[CALayer setBounds:](self->_layer, "setBounds:", v15, v17, v19, v21);
      if ((v39 & 1) != 0)
      {
        objc_msgSend(v7, "configureBounds:", self->_layer);
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_10:
    if (v13)
      v30 = v13;
    else
      v30 = CALayer;
    v31 = (CALayer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "layer", v46));
    v32 = self->_layer;
    self->_layer = v31;

    -[CALayer setBounds:](self->_layer, "setBounds:", v15, v17, v19, v21);
  }
  objc_msgSend(v7, "configureLayer:", self->_layer, v46);
LABEL_15:
  objc_msgSend(v7, "configureDelegate:", self->_layer, v46);
  v33 = objc_claimAutoreleasedReturnValue(-[CALayer delegate](self->_layer, "delegate"));
  if (v33
    && (v34 = (void *)v33,
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer delegate](self->_layer, "delegate")),
        v36 = objc_opt_respondsToSelector(v35, "actionForLayer:forKey:"),
        v35,
        v34,
        (v36 & 1) == 0))
  {
    if (_TUIDeviceHasInternalInstall())
    {
      v40 = objc_alloc((Class)NSException);
      v47[0] = CFSTR("layer");
      v41 = self->_layer;
      v42 = v41;
      if (!v41)
        v42 = (CALayer *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v47[1] = CFSTR("config");
      v48[0] = v42;
      v43 = v7;
      if (!v7)
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v48[1] = v43;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));
      v45 = objc_msgSend(v40, "initWithName:reason:userInfo:", CFSTR("LayerWithoutAnimationDelegate"), CFSTR("A layer without an animation delegate will result in the wrong animations"), v44);

      if (!v7)
      if (!v41)

      objc_exception_throw(v45);
    }
  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer delegate](self->_layer, "delegate"));

    if (!v37)
      -[CALayer setDelegate:](self->_layer, "setDelegate:", self);
  }
LABEL_20:

}

- (void)_updateFromPreviousSubmodels:(id)a3 newSubmodels:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;
  NSDictionary *v8;
  NSDictionary *builderMap;
  NSMutableDictionary *v10;
  _QWORD v11[5];
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;

  if (a3 != a4)
  {
    v13 = v4;
    v14 = v5;
    v7 = a4;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_C6CF8;
    v11[3] = &unk_241050;
    v11[4] = self;
    v12 = objc_opt_new(NSMutableDictionary);
    v10 = v12;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

    v8 = (NSDictionary *)-[NSMutableDictionary copy](v10, "copy");
    builderMap = self->_builderMap;
    self->_builderMap = v8;

  }
}

- (void)_updateSubmodelLayers
{
  NSMutableArray *v3;
  void *v4;
  NSArray *v5;
  NSArray *sublayers;
  NSMutableArray *v7;
  _QWORD v8[5];
  NSMutableArray *v9;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelLayer submodels](self->_model, "submodels"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_C6E70;
  v8[3] = &unk_241050;
  v8[4] = self;
  v7 = v3;
  v9 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  if (-[NSMutableArray count](v7, "count"))
  {
    v5 = (NSArray *)-[NSMutableArray copy](v7, "copy");
    sublayers = self->_sublayers;
    self->_sublayers = v5;
  }
  else
  {
    sublayers = self->_sublayers;
    self->_sublayers = 0;
  }

}

- (NSArray)submodels
{
  return self->_submodels;
}

- (void)setSubmodels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (TUIRenderModelLayer)model
{
  return self->_model;
}

- (CALayer)layer
{
  return self->_layer;
}

- (NSDictionary)builderMap
{
  return self->_builderMap;
}

- (NSArray)sublayers
{
  return self->_sublayers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sublayers, 0);
  objc_storeStrong((id *)&self->_builderMap, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_submodels, 0);
}

@end
