@implementation TUIShelfLayout

- (void)onChildrenUpdated
{
  void *v3;
  void *v4;
  void *v5;
  TUILayout *v6;
  TUILayout *content;
  void *v8;
  TUILayout *v9;
  TUILayout *contentBackground;
  void *v11;
  TUILayout *v12;
  TUILayout *background;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUIShelfLayout;
  -[TUILayout onChildrenUpdated](&v14, "onChildrenUpdated");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "content"));
  v6 = (TUILayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutForModel:", v5));
  content = self->_content;
  self->_content = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentBackground"));
  v9 = (TUILayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutForModel:", v8));
  contentBackground = self->_contentBackground;
  self->_contentBackground = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "background"));
  v12 = (TUILayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutForModel:", v11));
  background = self->_background;
  self->_background = v12;

}

- (BOOL)validatesAllChildren
{
  return 0;
}

- (void)computeLayout
{
  double v3;
  double v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  TUILayout *contentBackground;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  TUILayout *background;
  uint64_t v23;
  double v24;
  uint64_t v25;
  double v26;

  -[TUILayout computeWidth](self, "computeWidth");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v6 = objc_msgSend(v5, "contentWidth");
  v8 = v7;
  v9 = *(float *)&v7;

  v10 = *(float *)&v6;
  v11 = fmin(v9, fmax(*((float *)&v6 + 1), v4));
  if ((v8 & 0x8000000000000) != 0)
    v10 = v11;
  -[TUILayout setContainingWidth:](self->_content, "setContainingWidth:", v10, v11);
  -[TUILayout containingHeight](self, "containingHeight");
  -[TUILayout setContainingHeight:](self->_content, "setContainingHeight:");
  -[TUILayout validateLayout](self->_content, "validateLayout");
  -[TUILayout computedTransformedSize](self->_content, "computedTransformedSize");
  v13 = v12;
  v15 = v14;
  v16 = (v4 - v12) * 0.5;
  -[TUILayout setComputedOrigin:](self->_content, "setComputedOrigin:", v16, 0.0);
  contentBackground = self->_contentBackground;
  if (contentBackground)
  {
    -[TUILayout setContainingWidth:](contentBackground, "setContainingWidth:", v13);
    -[TUILayout setContainingHeight:](self->_contentBackground, "setContainingHeight:", v15);
    -[TUILayout computedWidth](self->_contentBackground, "computedWidth");
    if ((v18 & 0x8000000000000) != 0)
      v19 = v13;
    else
      v19 = NAN;
    -[TUILayout setFlexedWidth:](self->_contentBackground, "setFlexedWidth:", v19);
    -[TUILayout computedHeight](self->_contentBackground, "computedHeight");
    if ((v20 & 0x8000000000000) != 0)
      v21 = v15;
    else
      v21 = NAN;
    -[TUILayout setFlexedHeight:](self->_contentBackground, "setFlexedHeight:", v21);
    -[TUILayout validateLayout](self->_contentBackground, "validateLayout");
    -[TUILayout setComputedOrigin:](self->_contentBackground, "setComputedOrigin:", v16, 0.0);
  }
  background = self->_background;
  if (background)
  {
    -[TUILayout setContainingWidth:](background, "setContainingWidth:", v4);
    -[TUILayout setContainingHeight:](self->_background, "setContainingHeight:", v15);
    -[TUILayout computedWidth](self->_background, "computedWidth");
    if ((v23 & 0x8000000000000) != 0)
      v24 = v4;
    else
      v24 = NAN;
    -[TUILayout setFlexedWidth:](self->_background, "setFlexedWidth:", v24);
    -[TUILayout computedHeight](self->_background, "computedHeight");
    if ((v25 & 0x8000000000000) != 0)
      v26 = v15;
    else
      v26 = NAN;
    -[TUILayout setFlexedHeight:](self->_background, "setFlexedHeight:", v26);
    -[TUILayout validateLayout](self->_background, "validateLayout");
    -[TUILayout setComputedOrigin:](self->_background, "setComputedOrigin:", CGPointZero.x, CGPointZero.y);
  }
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v15);
}

- (TUILayout)content
{
  return self->_content;
}

- (TUILayout)contentBackground
{
  return self->_contentBackground;
}

- (TUILayout)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_contentBackground, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
