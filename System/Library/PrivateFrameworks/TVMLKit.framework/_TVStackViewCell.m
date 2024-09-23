@implementation _TVStackViewCell

- (void)setViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVStackViewCell;
  v4 = a3;
  -[_TVStackCollectionViewCell setViewController:](&v7, sel_setViewController_, v4);
  -[_TVStackCollectionViewCell viewController](self, "viewController", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  self->_isAdhocViewController = objc_opt_isKindOfClass() & 1;

  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tv_setShowcaseFactor:", self->_showcaseFactor);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TVStackViewCell;
  v4 = a3;
  -[_TVStackViewCell applyLayoutAttributes:](&v9, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "showcaseFactor", v9.receiver, v9.super_class);
  v6 = v5;

  self->_showcaseFactor = v6;
  -[_TVStackCollectionViewCell viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tv_setShowcaseFactor:", self->_showcaseFactor);

  if (self->_isAdhocViewController)
    -[_TVStackViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_TVStackViewCell;
  -[_TVStackCollectionViewCell layoutSubviews](&v13, sel_layoutSubviews);
  -[_TVStackViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_TVStackCollectionViewCell viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isAdhocViewController)
  {
    -[_TVStackCollectionViewCell viewController](self, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "showcaseConfig");

  }
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v4, v6, v9, v10);
  objc_msgSend(v8, "setAlpha:", 1.0);

}

@end
