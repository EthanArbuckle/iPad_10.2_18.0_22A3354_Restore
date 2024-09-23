@implementation TUIRenderModelToggle

- (TUIRenderModelToggle)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 title:(id)a10 isOn:(BOOL)a11
{
  id v18;
  TUIRenderModelToggle *v19;
  NSString *v20;
  NSString *title;
  BOOL v23;
  objc_super v24;

  v18 = a10;
  v24.receiver = self;
  v24.super_class = (Class)TUIRenderModelToggle;
  v23 = a8;
  v19 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](&v24, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", a3, a4, 0, a5, 0, a6, 1.0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, a7, v23, 0, 0, 0,
          a9);
  if (v19)
  {
    v20 = (NSString *)objc_msgSend(v18, "copy");
    title = v19->_title;
    v19->_title = v20;

    v19->_isOn = a11;
  }

  return v19;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  int isOn;
  NSString *title;
  NSString *v10;
  NSString *v11;
  void *v12;
  unsigned __int8 v13;
  objc_super v15;

  v4 = a3;
  v5 = objc_opt_class(TUIRenderModelToggle);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v15.receiver = self;
  v15.super_class = (Class)TUIRenderModelToggle;
  if (-[TUIRenderModelInteractive isEqualToRenderModel:](&v15, "isEqualToRenderModel:", v7)
    && (isOn = self->_isOn, isOn == objc_msgSend(v7, "isOn")))
  {
    title = self->_title;
    v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    if (title == v10)
    {
      v13 = 1;
    }
    else
    {
      v11 = self->_title;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
      v13 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  id v18;

  v18 = objc_alloc((Class)objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive reuseIdentifier](self, "reuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive identifier](self, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive stateToModel](self, "stateToModel"));
  v9 = sub_14DA34(v8, a3, &stru_242868);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive actionHandler](self, "actionHandler"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive viewState](self, "viewState"));
  v12 = -[TUIRenderModelInteractive enabled](self, "enabled");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive name](self, "name"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelToggle title](self, "title"));
  LOBYTE(v17) = self->_isOn;
  v15 = objc_msgSend(v18, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:title:isOn:", v6, v7, v9, v10, v11, v12, v13, v14, v17);

  TUIRenderModelCopyProperties(v15, self);
  return v15;
}

- (BOOL)isOn
{
  return self->_isOn;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
