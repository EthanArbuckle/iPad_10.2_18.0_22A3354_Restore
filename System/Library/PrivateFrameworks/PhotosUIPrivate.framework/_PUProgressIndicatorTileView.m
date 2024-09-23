@implementation _PUProgressIndicatorTileView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _PUProgressIndicatorTileView *v13;
  objc_super v15;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowsVisualIntelligenceV2");

  if (v9)
  {
    if (-[_PUProgressIndicatorTileView showingErrorProgressView](self, "showingErrorProgressView"))
    {
      v16.receiver = self;
      v16.super_class = (Class)_PUProgressIndicatorTileView;
      -[_PUProgressIndicatorTileView hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_PUProgressIndicatorTileView;
    -[_PUProgressIndicatorTileView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PUProgressIndicatorTileView extraHittableSubview](self, "extraHittableSubview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v10)
    {
      objc_msgSend(v11, "superview");
      v13 = (_PUProgressIndicatorTileView *)objc_claimAutoreleasedReturnValue();

      if (v13 == self)
      {
        objc_msgSend(v12, "convertPoint:fromView:", self, x, y);
        objc_msgSend(v12, "hitTest:withEvent:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
    }

  }
  return v10;
}

- (void)setTraitCollectionDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_traitCollectionDelegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_traitCollectionDelegate, obj);
    self->_delegateFlags.respondsToDidChangeTraitCollection = objc_opt_respondsToSelector() & 1;

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PUProgressIndicatorTileView;
  -[_PUProgressIndicatorTileView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  if (self->_delegateFlags.respondsToDidChangeTraitCollection)
  {
    -[_PUProgressIndicatorTileView traitCollectionDelegate](self, "traitCollectionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewTraitCollectionDidChange:", self);

  }
}

- (UIView)extraHittableSubview
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_extraHittableSubview);
}

- (void)setExtraHittableSubview:(id)a3
{
  objc_storeWeak((id *)&self->_extraHittableSubview, a3);
}

- (BOOL)showingErrorProgressView
{
  return self->_showingErrorProgressView;
}

- (void)setShowingErrorProgressView:(BOOL)a3
{
  self->_showingErrorProgressView = a3;
}

- (_PUProgressIndicatorTileViewDelegate)traitCollectionDelegate
{
  return (_PUProgressIndicatorTileViewDelegate *)objc_loadWeakRetained((id *)&self->_traitCollectionDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_traitCollectionDelegate);
  objc_destroyWeak((id *)&self->_extraHittableSubview);
}

@end
