@implementation TUIRatingsView

+ (id)tuiReuseIdentifier
{
  return CFSTR("TUIReuseIdentifierRatingsView");
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  float v21;
  _TUIRatingsViewState *viewStateToRestore;
  double v23;
  _TUIRatingsViewState *v24;
  TUIMutableDynamicValue *v25;
  TUIMutableDynamicValue *dynamicViewState;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  unsigned int v37;
  void *v38;
  objc_super v39;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  if (v9)
  {
    v10 = objc_opt_class(TUIRenderModelRatings);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    v12 = TUIDynamicCast(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v14 = objc_opt_class(TUIRenderModelRatings);
    v15 = TUIDynamicCast(v14, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v16, "rating");
    v18 = v17;
    v38 = v13;
    if (objc_msgSend(v13, "isEqualToRenderModel:", v16))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
        objc_msgSend(v20, "value");
        v18 = v21;

      }
    }
    viewStateToRestore = self->_viewStateToRestore;
    if (viewStateToRestore)
    {
      -[_TUIRatingsViewState value](viewStateToRestore, "value");
      v18 = v23;
      v24 = self->_viewStateToRestore;
      self->_viewStateToRestore = 0;

    }
    v25 = (TUIMutableDynamicValue *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewState"));
    dynamicViewState = self->_dynamicViewState;
    self->_dynamicViewState = v25;

    v39.receiver = self;
    v39.super_class = (Class)TUIRatingsView;
    -[TUIInteractiveBaseView configureWithModel:outsets:](&v39, "configureWithModel:outsets:", v9, top, left, bottom, right);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));

    v37 = objc_msgSend(v16, "enabled");
    v28 = objc_msgSend(v16, "direction");
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "color"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startColor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backgroundColor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backgroundImageName"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "foregroundImageName"));
    objc_msgSend(v16, "starWidth");
    v35 = v34;
    objc_msgSend(v16, "starPadding");
    if (v27)
      -[TUIRatingsView updateControlWithValue:enabled:direction:color:startColor:backgroundColor:backgroundImageName:foregroundImageName:starWidth:starPadding:](self, "updateControlWithValue:enabled:direction:color:startColor:backgroundColor:backgroundImageName:foregroundImageName:starWidth:starPadding:", v37, v28, v29, v30, v31, v32, v18, v35, v36, v33);
    else
      -[TUIRatingsView loadControlWithValue:enabled:direction:color:startColor:backgroundColor:backgroundImageName:foregroundImageName:starWidth:starPadding:](self, "loadControlWithValue:enabled:direction:color:startColor:backgroundColor:backgroundImageName:foregroundImageName:starWidth:starPadding:", v37, v28, v29, v30, v31, v32, v18, v35, v36, v33);

  }
}

- (void)_updateDynamicViewState
{
  void *v3;
  TUIMutableDynamicValue *dynamicViewState;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  if (self->_dynamicViewState)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));

    if (v3)
    {
      dynamicViewState = self->_dynamicViewState;
      v8 = CFSTR("value");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      objc_msgSend(v5, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      v9 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
      -[TUIMutableDynamicValue updateWithValueIfChanged:](dynamicViewState, "updateWithValueIfChanged:", v7);

    }
  }
}

- (void)updateControlWithValue:(double)a3 enabled:(BOOL)a4 direction:(unint64_t)a5 color:(id)a6 startColor:(id)a7 backgroundColor:(id)a8 backgroundImageName:(id)a9 foregroundImageName:(id)a10 starWidth:(double)a11 starPadding:(double)a12
{
  _BOOL8 v18;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  double v26;
  id v27;

  v18 = a4;
  v21 = a10;
  v22 = a9;
  v23 = a8;
  v24 = a7;
  v25 = a6;
  v27 = (id)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v27, "_updateImagesIfNeededWithForegroundImageName:backgroundImageName:starWidth:starPadding:", v21, v22, a11, a12);

  objc_msgSend(v27, "setForegroundColor:", v25);
  objc_msgSend(v27, "setStartColor:", v24);

  objc_msgSend(v27, "setBackgroundColor:", v23);
  *(float *)&v26 = a3;
  objc_msgSend(v27, "setValue:", v26);
  objc_msgSend(v27, "setEnabled:", v18);

}

- (void)loadControlWithValue:(double)a3 enabled:(BOOL)a4 direction:(unint64_t)a5 color:(id)a6 startColor:(id)a7 backgroundColor:(id)a8 backgroundImageName:(id)a9 foregroundImageName:(id)a10 starWidth:(double)a11 starPadding:(double)a12
{
  _BOOL8 v19;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  TUIStarRatingControl *v27;

  v19 = a4;
  v22 = a10;
  v23 = a9;
  v24 = a8;
  v25 = a7;
  v26 = a6;
  v27 = -[TUIStarRatingControl initWithRating:backgroundImageName:foregroundImageName:direction:color:startColor:backgroundColor:starWidth:starPadding:]([TUIStarRatingControl alloc], "initWithRating:backgroundImageName:foregroundImageName:direction:color:startColor:backgroundColor:starWidth:starPadding:", v23, v22, a5, v26, v25, v24, a3, a11, a12);

  -[TUIStarRatingControl setHitPadding:](v27, "setHitPadding:", CGSizeZero.width, CGSizeZero.height);
  -[TUIRatingsView bounds](self, "bounds");
  -[TUIStarRatingControl setFrame:](v27, "setFrame:");
  -[TUIStarRatingControl setEnabled:](v27, "setEnabled:", v19);
  -[TUIStarRatingControl addTarget:action:forControlEvents:](v27, "addTarget:action:forControlEvents:", self, "_ratingControlChanged:", 4096);
  -[TUIStarRatingControl addTarget:action:forControlEvents:](v27, "addTarget:action:forControlEvents:", self, "_ratingControlTouchDown:", 1);
  -[TUIStarRatingControl addTarget:action:forControlEvents:](v27, "addTarget:action:forControlEvents:", self, "_ratingControlTouchUp:", 64);
  -[TUIStarRatingControl addTarget:action:forControlEvents:](v27, "addTarget:action:forControlEvents:", self, "_ratingControlTouchUp:", 128);
  -[TUIStarRatingControl setAutoresizingMask:](v27, "setAutoresizingMask:", 18);
  -[TUIRatingsView addSubview:](self, "addSubview:", v27);
  -[TUIInteractiveBaseView setControl:](self, "setControl:", v27);

}

- (void)_ratingControlChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionHandler"));
  v12 = CFSTR("value");
  v6 = objc_opt_class(TUIStarRatingControl);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v8 = TUIDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  objc_msgSend(v5, "invoke:arguments:", CFSTR("changedInput"), v11);

  -[TUIRatingsView _updateDynamicViewState](self, "_updateDynamicViewState");
}

- (void)_ratingControlTouchDown:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionHandler"));
  v12 = CFSTR("value");
  v6 = objc_opt_class(TUIStarRatingControl);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v8 = TUIDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  objc_msgSend(v5, "invoke:arguments:", CFSTR("beginInput"), v11);

}

- (void)_ratingControlTouchUp:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionHandler"));
  v12 = CFSTR("value");
  v6 = objc_opt_class(TUIStarRatingControl);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v8 = TUIDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  objc_msgSend(v5, "invoke:arguments:", CFSTR("endInput"), v11);

}

+ (id)renderModelWithStates:(id)a3 actionHandler:(id)a4 viewState:(id)a5 identifier:(id)a6 name:(id)a7 rating:(double)a8 enabled:(BOOL)a9 direction:(unint64_t)a10 color:(id)a11 startColor:(id)a12 backgroundColor:(id)a13 backgroundImageName:(id)a14 foregroundImageName:(id)a15 starWidth:(double)a16 starPadding:(double)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  TUIRenderModelRatings *v27;
  void *v28;
  id v30;
  id v31;
  id v33;
  id v35;
  id v37;
  _BOOL4 v39;
  TUIRenderModelRatings *v40;

  v39 = a9;
  v35 = a15;
  v22 = a14;
  v31 = a13;
  v23 = a12;
  v24 = a11;
  v25 = a7;
  v30 = a6;
  v33 = a5;
  v26 = a4;
  v37 = a3;
  v27 = [TUIRenderModelRatings alloc];
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tuiReuseIdentifier"));
  v40 = -[TUIRenderModelRatings initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:rating:direction:color:startColor:backgroundColor:backgroundImageName:foregroundImageName:starWidth:starPadding:](v27, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:rating:direction:color:startColor:backgroundColor:backgroundImageName:foregroundImageName:starWidth:starPadding:", v28, v30, v37, v26, v33, v39, a8, a16, a17, v25, a10, v24, v23, v31, v22, v35);

  return v40;
}

- (id)viewStateSave
{
  void *v3;
  _TUIRatingsViewState *v4;
  void *v5;
  float v6;
  _TUIRatingsViewState *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  if (objc_msgSend(v3, "isEnabled"))
  {
    v4 = [_TUIRatingsViewState alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v5, "value");
    v7 = -[_TUIRatingsViewState initWithValue:](v4, "initWithValue:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)viewStateRestore:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));

  if (v8 && v4)
  {
    objc_msgSend(v8, "value");
    v6 = v5;

    v8 = (id)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    *(float *)&v6 = v6;
    LODWORD(v7) = LODWORD(v6);
    objc_msgSend(v8, "setValue:", v7);
  }
  else
  {
    -[TUIRatingsView setViewStateToRestore:](self, "setViewStateToRestore:", v8);
  }

}

- (_TUIRatingsViewState)viewStateToRestore
{
  return self->_viewStateToRestore;
}

- (void)setViewStateToRestore:(id)a3
{
  objc_storeStrong((id *)&self->_viewStateToRestore, a3);
}

- (TUIMutableDynamicValue)dynamicViewState
{
  return self->_dynamicViewState;
}

- (void)setDynamicViewState:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicViewState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicViewState, 0);
  objc_storeStrong((id *)&self->_viewStateToRestore, 0);
}

@end
