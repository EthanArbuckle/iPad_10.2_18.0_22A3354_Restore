@implementation TUIRenderModelRatings

- (TUIRenderModelRatings)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 rating:(double)a10 direction:(unint64_t)a11 color:(id)a12 startColor:(id)a13 backgroundColor:(id)a14 backgroundImageName:(id)a15 foregroundImageName:(id)a16 starWidth:(double)a17 starPadding:(double)a18
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  TUIRenderModelRatings *v29;
  TUIRenderModelRatings *v30;
  void *v31;
  void *v32;
  NSString *v33;
  NSString *backgroundImageName;
  NSString *v35;
  NSString *foregroundImageName;
  objc_super v42;

  v24 = a12;
  v25 = a13;
  v26 = a14;
  v27 = a15;
  v28 = a16;
  v42.receiver = self;
  v42.super_class = (Class)TUIRenderModelRatings;
  v29 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](&v42, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", a3, a4, 0, a5, 0, a6, 1.0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, a7, a8, 0, 0, 0,
          a9);
  v30 = v29;
  if (v29)
  {
    v29->_rating = a10;
    v29->_direction = a11;
    v29->_starWidth = a17;
    v29->_starPadding = a18;
    objc_storeStrong((id *)&v29->_color, a12);
    if (v25)
      v31 = v25;
    else
      v31 = v24;
    objc_storeStrong((id *)&v30->_startColor, v31);
    if (v26)
      v32 = v26;
    else
      v32 = v24;
    objc_storeStrong((id *)&v30->_backgroundColor, v32);
    v33 = (NSString *)objc_msgSend(v27, "copy");
    backgroundImageName = v30->_backgroundImageName;
    v30->_backgroundImageName = v33;

    v35 = (NSString *)objc_msgSend(v28, "copy");
    foregroundImageName = v30->_foregroundImageName;
    v30->_foregroundImageName = v35;

  }
  return v30;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  double rating;
  double v9;
  id direction;
  double starWidth;
  double v12;
  double starPadding;
  double v14;
  UIColor *color;
  uint64_t v16;
  void *v17;
  UIColor *v18;
  void *v19;
  UIColor *startColor;
  uint64_t v21;
  void *v22;
  UIColor *v23;
  void *v24;
  UIColor *backgroundColor;
  uint64_t v26;
  void *v27;
  UIColor *v28;
  void *v29;
  NSString *backgroundImageName;
  uint64_t v31;
  void *v32;
  NSString *v33;
  void *v34;
  unsigned __int8 v35;
  NSString *foregroundImageName;
  NSString *v38;
  NSString *v39;
  void *v40;
  objc_super v41;

  v4 = a3;
  v5 = objc_opt_class(TUIRenderModelRatings);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v41.receiver = self;
  v41.super_class = (Class)TUIRenderModelRatings;
  if (!-[TUIRenderModelInteractive isEqualToRenderModel:](&v41, "isEqualToRenderModel:", v7))
    goto LABEL_20;
  rating = self->_rating;
  objc_msgSend(v7, "rating");
  if (rating != v9)
    goto LABEL_20;
  direction = (id)self->_direction;
  if (direction != objc_msgSend(v7, "direction"))
    goto LABEL_20;
  starWidth = self->_starWidth;
  objc_msgSend(v7, "starWidth");
  if (starWidth != v12)
    goto LABEL_20;
  starPadding = self->_starPadding;
  objc_msgSend(v7, "starPadding");
  if (starPadding != v14)
    goto LABEL_20;
  color = self->_color;
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "color"));
  if (color == (UIColor *)v16)
  {

  }
  else
  {
    v17 = (void *)v16;
    v18 = self->_color;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "color"));
    LODWORD(v18) = -[UIColor isEqual:](v18, "isEqual:", v19);

    if (!(_DWORD)v18)
      goto LABEL_20;
  }
  startColor = self->_startColor;
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startColor"));
  if (startColor == (UIColor *)v21)
  {

  }
  else
  {
    v22 = (void *)v21;
    v23 = self->_startColor;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startColor"));
    LODWORD(v23) = -[UIColor isEqual:](v23, "isEqual:", v24);

    if (!(_DWORD)v23)
      goto LABEL_20;
  }
  backgroundColor = self->_backgroundColor;
  v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundColor"));
  if (backgroundColor == (UIColor *)v26)
  {

  }
  else
  {
    v27 = (void *)v26;
    v28 = self->_backgroundColor;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundColor"));
    LODWORD(v28) = -[UIColor isEqual:](v28, "isEqual:", v29);

    if (!(_DWORD)v28)
      goto LABEL_20;
  }
  backgroundImageName = self->_backgroundImageName;
  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundImageName"));
  if (backgroundImageName == (NSString *)v31)
  {

  }
  else
  {
    v32 = (void *)v31;
    v33 = self->_backgroundImageName;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundImageName"));
    LODWORD(v33) = -[NSString isEqualToString:](v33, "isEqualToString:", v34);

    if (!(_DWORD)v33)
    {
LABEL_20:
      v35 = 0;
      goto LABEL_21;
    }
  }
  foregroundImageName = self->_foregroundImageName;
  v38 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "foregroundImageName"));
  if (foregroundImageName == v38)
  {
    v35 = 1;
  }
  else
  {
    v39 = self->_foregroundImageName;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "foregroundImageName"));
    v35 = -[NSString isEqualToString:](v39, "isEqualToString:", v40);

  }
LABEL_21:

  return v35;
}

- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  id v17;
  TUIRenderModelRatings *v18;

  v7 = objc_alloc((Class)objc_opt_class(self));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive reuseIdentifier](self, "reuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive identifier](self, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive stateToModel](self, "stateToModel"));
  v11 = ((uint64_t (*)(void *, unint64_t))a4)(v10, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive actionHandler](self, "actionHandler"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive viewState](self, "viewState"));
  v15 = -[TUIRenderModelInteractive enabled](self, "enabled");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive name](self, "name"));
  v17 = objc_msgSend(v7, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:rating:direction:color:startColor:backgroundColor:backgroundImageName:foregroundImageName:starWidth:starPadding:", v8, v9, v12, v13, v14, v15, self->_rating, self->_starWidth, self->_starPadding, v16, self->_direction, self->_color, self->_startColor, self->_backgroundColor, self->_backgroundImageName, self->_foregroundImageName);

  TUIRenderModelCopyProperties(v17, self);
  v18 = self;

  return v18;
}

- (double)rating
{
  return self->_rating;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (UIColor)color
{
  return self->_color;
}

- (UIColor)startColor
{
  return self->_startColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)backgroundImageName
{
  return self->_backgroundImageName;
}

- (NSString)foregroundImageName
{
  return self->_foregroundImageName;
}

- (double)starWidth
{
  return self->_starWidth;
}

- (double)starPadding
{
  return self->_starPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundImageName, 0);
  objc_storeStrong((id *)&self->_backgroundImageName, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_startColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
