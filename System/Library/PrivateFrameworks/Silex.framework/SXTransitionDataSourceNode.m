@implementation SXTransitionDataSourceNode

- (SXTransitionDataSourceNode)initWithComponentView:(id)a3 transitionType:(unint64_t)a4 usesThumbnail:(BOOL)a5
{
  id v9;
  SXTransitionDataSourceNode *v10;
  SXTransitionDataSourceNode *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXTransitionDataSourceNode;
  v10 = -[SXTransitionDataSourceNode init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_componentView, a3);
    v11->_transitionType = a4;
    v11->_usesThumbnail = a5;
  }

  return v11;
}

- (UIView)transitionContainerView
{
  void *v2;
  void *v3;

  -[SXTransitionDataSourceNode componentView](self, "componentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIView)transitionContentView
{
  void *v2;
  void *v3;

  -[SXTransitionDataSourceNode componentView](self, "componentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)transitionViewIsVisible
{
  void *v2;
  char v3;

  -[SXTransitionDataSourceNode componentView](self, "componentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitionViewIsVisible");

  return v3;
}

- (BOOL)transitionViewShouldFadeInContent
{
  void *v2;
  char v3;

  -[SXTransitionDataSourceNode componentView](self, "componentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitionViewShouldFadeInContent");

  return v3;
}

- (CGRect)transitionVisibleFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SXTransitionDataSourceNode componentView](self, "componentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionVisibleFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)transitionContainerFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SXTransitionDataSourceNode componentView](self, "componentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionContainerFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)transitionContentFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SXTransitionDataSourceNode componentView](self, "componentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionContentFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)isTransitionable
{
  void *v2;
  char v3;

  -[SXTransitionDataSourceNode componentView](self, "componentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTransitionable");

  return v3;
}

- (unint64_t)transitionType
{
  return self->_transitionType;
}

- (SXTransitionableComponentView)componentView
{
  return self->_componentView;
}

- (BOOL)usesThumbnail
{
  return self->_usesThumbnail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentView, 0);
}

@end
