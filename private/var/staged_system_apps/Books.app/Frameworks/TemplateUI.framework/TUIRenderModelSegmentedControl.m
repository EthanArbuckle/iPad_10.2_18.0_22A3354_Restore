@implementation TUIRenderModelSegmentedControl

- (TUIRenderModelSegmentedControl)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 selectIndex:(int64_t)a10 segments:(id)a11 tintColor:(id)a12
{
  id v19;
  TUIRenderModelSegmentedControl *v20;
  TUIRenderModelSegmentedControl *v21;
  NSArray *v22;
  NSArray *segments;
  BOOL v25;
  id v26;
  objc_super v27;

  v19 = a11;
  v26 = a12;
  v27.receiver = self;
  v27.super_class = (Class)TUIRenderModelSegmentedControl;
  v25 = a8;
  v20 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](&v27, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", a3, a4, 0, a5, 0, a6, 1.0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, a7, v25, 0, 0, 0,
          a9);
  v21 = v20;
  if (v20)
  {
    v20->_selectIndex = a10;
    objc_storeStrong((id *)&v20->_tintColor, a12);
    v22 = (NSArray *)objc_msgSend(v19, "copy");
    segments = v21->_segments;
    v21->_segments = v22;

  }
  return v21;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  UIColor *tintColor;
  uint64_t v9;
  void *v10;
  UIColor *v11;
  void *v12;
  unsigned __int8 v13;
  NSArray *segments;
  NSArray *v15;
  NSArray *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v5 = objc_opt_class(TUIRenderModelSegmentedControl);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v19.receiver = self;
  v19.super_class = (Class)TUIRenderModelSegmentedControl;
  if (!-[TUIRenderModelInteractive isEqualToRenderModel:](&v19, "isEqualToRenderModel:", v7))
    goto LABEL_4;
  tintColor = self->_tintColor;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tintColor"));
  if (tintColor == (UIColor *)v9)
  {

  }
  else
  {
    v10 = (void *)v9;
    v11 = self->_tintColor;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tintColor"));
    LODWORD(v11) = -[UIColor isEqual:](v11, "isEqual:", v12);

    if (!(_DWORD)v11)
    {
LABEL_4:
      v13 = 0;
      goto LABEL_10;
    }
  }
  segments = self->_segments;
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "segments"));
  if (segments == v15)
  {
    v13 = 1;
  }
  else
  {
    v16 = self->_segments;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "segments"));
    v13 = -[NSArray isEqualToArray:](v16, "isEqualToArray:", v17);

  }
LABEL_10:

  return v13;
}

- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  id v15;

  v6 = objc_alloc((Class)objc_opt_class(self));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive reuseIdentifier](self, "reuseIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive identifier](self, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive stateToModel](self, "stateToModel"));
  v10 = sub_14DA34(v9, a3, &stru_242868);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive actionHandler](self, "actionHandler"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive viewState](self, "viewState"));
  v13 = -[TUIRenderModelInteractive enabled](self, "enabled");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive name](self, "name"));
  v15 = objc_msgSend(v6, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:selectIndex:segments:tintColor:", v7, v8, v10, v11, v12, v13, v14, self->_selectIndex, self->_segments, self->_tintColor);

  TUIRenderModelCopyProperties(v15, self);
  return v15;
}

- (int64_t)selectIndex
{
  return self->_selectIndex;
}

- (NSArray)segments
{
  return self->_segments;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
