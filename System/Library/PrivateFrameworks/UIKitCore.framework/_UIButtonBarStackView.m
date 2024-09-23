@implementation _UIButtonBarStackView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)updateConstraints
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42___UIButtonBarStackView_updateConstraints__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
  v3.receiver = self;
  v3.super_class = (Class)_UIButtonBarStackView;
  -[UIStackView updateConstraints](&v3, sel_updateConstraints);
}

- (void)layoutSubviews
{
  id WeakRetained;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBarStackView;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_buttonBar);
  objc_msgSend(WeakRetained, "_updateHitRects");

  v4 = objc_loadWeakRetained((id *)&self->_buttonBar);
  objc_msgSend(v4, "_buttonBarStackViewDidLayoutSubviews:", self);

}

- (void)traitCollectionDidChange:(id)a3
{
  _UIButtonBar **p_buttonBar;
  id v5;
  id WeakRetained;
  objc_super v7;

  p_buttonBar = &self->_buttonBar;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_buttonBar);
  objc_msgSend(WeakRetained, "_updateForTraitCollectionChange:", v5);

  v7.receiver = self;
  v7.super_class = (Class)_UIButtonBarStackView;
  -[UIView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v5);

}

- (NSString)description
{
  void *v3;
  id WeakRetained;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIButtonBarStackView;
  -[UIStackView description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_buttonBar);
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" buttonBar=%p"), WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  _UIButtonBar **p_buttonBar;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;

  p_buttonBar = &self->_buttonBar;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_buttonBar);
  objc_msgSend(WeakRetained, "pointerInteraction:regionForRequest:defaultRegion:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  _UIButtonBar **p_buttonBar;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_buttonBar = &self->_buttonBar;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_buttonBar);
  objc_msgSend(WeakRetained, "pointerInteraction:styleForRegion:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  _UIButtonBar **p_buttonBar;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_buttonBar = &self->_buttonBar;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_buttonBar);
  objc_msgSend(WeakRetained, "pointerInteraction:willEnterRegion:animator:", v10, v9, v8);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  _UIButtonBar **p_buttonBar;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_buttonBar = &self->_buttonBar;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_buttonBar);
  objc_msgSend(WeakRetained, "pointerInteraction:willExitRegion:animator:", v10, v9, v8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_buttonBar);
}

@end
