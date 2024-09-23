@implementation TUIMutableHStack

- (TUIMutableHStack)initWithLayout:(id)a3 spacing:(id *)a4 maxWidth:(double)a5
{
  uint64_t v5;
  uint64_t v7;
  TUIMutableHStack *v9;
  TUIMutableHStack *v10;
  NSMutableArray *v11;
  CGFloat height;
  objc_super v14;

  v7 = v5;
  v14.receiver = self;
  v14.super_class = (Class)TUIMutableHStack;
  v9 = -[TUIHStack initWithLayout:](&v14, "initWithLayout:", a3);
  v10 = v9;
  if (v9)
  {
    *(_QWORD *)&v9->_accumulatedWidth = a4;
    *(_QWORD *)&v9->_spacing.value = v7;
    *(double *)&v9->_muChildren = a5;
    v9->_maxWidth = 0.0;
    v11 = objc_opt_new(NSMutableArray);
    height = v10->super._layoutSize.height;
    *(_QWORD *)&v10->super._layoutSize.height = v11;

  }
  return v10;
}

- (id)children
{
  return *(id *)&self->super._layoutSize.height;
}

- (BOOL)addChildLayout:(id)a3 ifFitting:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  _TUIHStackSpacer *v12;
  void *v13;
  void *v14;
  void *v15;
  _TUIHStackSpacer *v16;
  BOOL v17;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "computedTransformedSize");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHStack guideLayoutController](self, "guideLayoutController"));
  objc_msgSend(v6, "setGuideLayoutController:", v9);

  objc_msgSend(v6, "validateGuides");
  v10 = objc_msgSend(*(id *)&self->super._layoutSize.height, "count");
  if (v10)
    v8 = v8 + *(float *)&self->_accumulatedWidth;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHStack guideLayoutController](self, "guideLayoutController"));
  if (v4 && !TUICGFloatIsLessThanOrAlmostEqualFloat(v8 + self->_maxWidth, *(double *)&self->_muChildren))
  {
    v17 = 0;
  }
  else
  {
    if (v10)
    {
      v12 = [_TUIHStackSpacer alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHStack layout](self, "layout"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHStack layout](self, "layout"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "controller"));
      v16 = -[TUILayout initWithModel:parent:controller:](v12, "initWithModel:parent:controller:", 0, v13, v15);

      -[_TUIHStackSpacer setSpecifiedWidth:](v16, "setSpecifiedWidth:", *(_QWORD *)&self->_accumulatedWidth, *(_QWORD *)&self->_spacing.value);
      objc_msgSend(*(id *)&self->super._layoutSize.height, "addObject:", v16);
      -[TUILayout setGuideLayoutController:](v16, "setGuideLayoutController:", v11);
      if (v11)
        -[TUILayout validateGuides](v16, "validateGuides");
      -[TUILayout invalidateLayout](v16, "invalidateLayout");

    }
    objc_msgSend(v6, "setGuideLayoutController:", v11);
    if (v11)
    {
      objc_msgSend(v6, "validateGuides");
      objc_msgSend(v6, "invalidateLayout");
    }
    objc_msgSend(*(id *)&self->super._layoutSize.height, "addObject:", v6);
    self->_maxWidth = v8 + self->_maxWidth;
    v17 = 1;
  }

  return v17;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)spacing
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_accumulatedWidth;
}

- (double)maxWidth
{
  return *(double *)&self->_muChildren;
}

- (double)accumulatedWidth
{
  return self->_maxWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->super._layoutSize.height, 0);
}

@end
