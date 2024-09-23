@implementation _SAUIPortalView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)portalLayer
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[_SAUIPortalView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)setSourceView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_sourceView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sourceView, a3);
    -[_SAUIPortalView _configurePortalViewIfNeeded](self, "_configurePortalViewIfNeeded");
    v5 = v6;
  }

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SAUIPortalView;
  -[_SAUIPortalView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[_SAUIPortalView _configurePortalViewIfNeeded](self, "_configurePortalViewIfNeeded");
}

- (void)_configurePortalViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id from;
  id location;

  -[UIView layer](self->_sourceView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);
  -[_SAUIPortalView portalLayer](self, "portalLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
  {

  }
  else
  {
    -[_SAUIPortalView portalLayer](self, "portalLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CALayerGetContext();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (objc_msgSend(MEMORY[0x24BDE57D8], "currentState")
        && objc_msgSend(MEMORY[0x24BDE57D8], "currentPhase") != 2)
      {
        objc_initWeak(&from, self);
        v9 = (void *)MEMORY[0x24BDE57D8];
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __47___SAUIPortalView__configurePortalViewIfNeeded__block_invoke;
        v10[3] = &unk_25193CFC0;
        objc_copyWeak(&v11, &from);
        objc_copyWeak(&v12, &location);
        objc_msgSend(v9, "addCommitHandler:forPhase:", v10, 2);
        objc_destroyWeak(&v12);
        objc_destroyWeak(&v11);
        objc_destroyWeak(&from);
      }
      else
      {
        -[_SAUIPortalView portalLayer](self, "portalLayer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSourceLayer:", v3);

      }
    }
  }
  objc_destroyWeak(&location);

}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end
