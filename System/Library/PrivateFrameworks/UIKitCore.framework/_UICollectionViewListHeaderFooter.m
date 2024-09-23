@implementation _UICollectionViewListHeaderFooter

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (_UICollectionViewListHeaderFooter)initWithFrame:(CGRect)a3
{
  _UICollectionViewListHeaderFooter *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewListHeaderFooter;
  v3 = -[UICollectionReusableView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_contentViewClass"));
    -[UIView bounds](v3, "bounds");
    v5 = (void *)objc_msgSend(v4, "initWithFrame:");
    -[_UICollectionViewListHeaderFooter setContentView:](v3, "setContentView:", v5);

    _UICollectionViewListHeaderFooterCommonInit(v3);
  }
  return v3;
}

- (_UICollectionViewListHeaderFooter)initWithCoder:(id)a3
{
  id v4;
  _UICollectionViewListHeaderFooter *v5;
  uint64_t v6;
  UIView *contentView;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewListHeaderFooter;
  v5 = -[UICollectionReusableView initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIContentView"));
    v6 = objc_claimAutoreleasedReturnValue();
    contentView = v5->_contentView;
    v5->_contentView = (UIView *)v6;

    if (v5->_contentView)
    {
      -[UIView addSubview:](v5, "addSubview:");
    }
    else
    {
      v8 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_contentViewClass"));
      -[UIView bounds](v5, "bounds");
      v9 = (void *)objc_msgSend(v8, "initWithFrame:");
      -[_UICollectionViewListHeaderFooter setContentView:](v5, "setContentView:", v9);

    }
    _UICollectionViewListHeaderFooterCommonInit(v5);
  }

  return v5;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UICollectionViewListHeaderFooter;
  -[UIView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  if (self->_systemBackgroundView)
    objc_msgSend(v4, "removeObject:");

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UIView *contentView;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewListHeaderFooter;
  -[UICollectionReusableView encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  contentView = self->_contentView;
  if (contentView)
    objc_msgSend(v4, "encodeObject:forKey:", contentView, CFSTR("UIContentView"));

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewListHeaderFooter;
  -[UICollectionReusableView prepareForReuse](&v3, sel_prepareForReuse);
  -[UIView _removeAllAnimations:](self, "_removeAllAnimations:", 1);
  -[_UICollectionViewListHeaderFooter _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
}

- (void)_setLayoutAttributes:(id)a3
{
  int v4;
  id v5;
  void *v6;
  objc_super v7;
  CGRect v8;

  v4 = *((unsigned __int16 *)&self->_headerFooterFlags + 2);
  v5 = a3;
  *((_WORD *)&self->_headerFooterFlags + 2) = *(_WORD *)(&self->_headerFooterFlags + 1) & 0xFFF8 | -[_UICollectionViewListHeaderFooter _styleFromLayoutAttributes:](self, "_styleFromLayoutAttributes:", v5) & 7;
  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewListHeaderFooter;
  -[UICollectionReusableView _setLayoutAttributes:](&v7, sel__setLayoutAttributes_, v5);

  -[UIView bounds](self->_contentView, "bounds");
  if (CGRectEqualToRect(v8, *MEMORY[0x1E0C9D648]))
    -[_UICollectionViewListHeaderFooter _layoutContentView](self, "_layoutContentView");
  if (((*((unsigned __int16 *)&self->_headerFooterFlags + 2) ^ v4) & 7) != 0
    || (-[_UICollectionViewListHeaderFooter _backgroundViewConfigurationProvider](self, "_backgroundViewConfigurationProvider"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    -[_UICollectionViewListHeaderFooter _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
  }
}

- (int64_t)_styleFromLayoutAttributes:(id)a3
{
  _QWORD *v3;
  int64_t v4;

  -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3[2];
  else
    v4 = 0;

  return v4;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewListHeaderFooter;
  -[UIView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_, v3);
  if (v5 != -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    -[_UICollectionViewListHeaderFooter _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
}

- (void)_setContentViewConfiguration:(id)a3
{
  id v5;
  Class contentViewConfigurationClass;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  Class v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v5 = a3;
  contentViewConfigurationClass = self->_contentViewConfigurationClass;
  if (v5)
  {
    if ((*(_WORD *)(&self->_headerFooterFlags + 1) & 0x100) != 0 && !self->_contentViewConfigurationProvider)
    {
      v15 = v5;
      v7 = -[_UICollectionViewListHeaderFooter _viewConfigurationState](self, "_viewConfigurationState");
      -[UIView traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updatedConfigurationForState:traitCollection:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListHeaderFooter.m"), 143, CFSTR("Updated configuration was nil for configuration: %@"), v15);

      }
      v5 = (id)v9;
    }
    v16 = v5;
    if (contentViewConfigurationClass)
    {
      v10 = self->_contentViewConfigurationClass;
      v11 = objc_opt_class();
      self->_contentViewConfigurationClass = (Class)objc_opt_class();
      if (v10 == (Class)v11)
      {
        -[UIView setConfiguration:](self->_contentView, "setConfiguration:", v16);
LABEL_14:

        return;
      }
    }
    else
    {
      self->_contentViewConfigurationClass = (Class)objc_opt_class();
    }
    objc_msgSend(v16, "createContentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewListHeaderFooter setContentView:](self, "setContentView:", v13);

    goto LABEL_14;
  }
  self->_contentViewConfigurationClass = (Class)objc_opt_class();
  if (contentViewConfigurationClass)
  {
    v12 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_contentViewClass"));
    -[UIView bounds](self, "bounds");
    v17 = (id)objc_msgSend(v12, "initWithFrame:");
    -[_UICollectionViewListHeaderFooter setContentView:](self, "setContentView:");

  }
}

- (_UIContentViewConfiguration)_contentViewConfiguration
{
  void *v2;

  if (self->_contentViewConfigurationClass)
  {
    -[UIView configuration](self->_contentView, "configuration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (_UIContentViewConfiguration *)v2;
}

- (void)_setAutomaticallyUpdatesContentViewConfiguration:(BOOL)a3
{
  id contentViewConfigurationProvider;
  $A5A6A253756E84E4E91A049044A955C8 *v4;
  __int16 v5;

  if (a3)
  {
    contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    v4 = &self->_headerFooterFlags + 1;
    v5 = *((_WORD *)&self->_headerFooterFlags + 2);
    if ((contentViewConfigurationProvider == 0) != ((v5 & 0x100) == 0))
      return;
    if (!contentViewConfigurationProvider)
    {
      *(_WORD *)v4 = v5 | 0x100;
      -[_UICollectionViewListHeaderFooter _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
      return;
    }
  }
  else
  {
    v4 = &self->_headerFooterFlags + 1;
    v5 = *((_WORD *)&self->_headerFooterFlags + 2);
    if ((v5 & 0x100) == 0)
      return;
  }
  *(_WORD *)v4 = v5 & 0xFEFF;
}

- (BOOL)_automaticallyUpdatesContentViewConfiguration
{
  return HIBYTE(*((unsigned __int16 *)&self->_headerFooterFlags + 2)) & 1;
}

- (void)_setContentViewConfigurationProvider:(id)a3
{
  void *v4;
  id contentViewConfigurationProvider;

  if (self->_contentViewConfigurationProvider != a3)
  {
    if (a3)
      *((_WORD *)&self->_headerFooterFlags + 2) &= ~0x100u;
    v4 = (void *)objc_msgSend(a3, "copy");
    contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    self->_contentViewConfigurationProvider = v4;

    -[_UICollectionViewListHeaderFooter _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
  }
}

- (id)_contentViewConfigurationProvider
{
  return _Block_copy(self->_contentViewConfigurationProvider);
}

- (void)_updateContentViewConfigurationForState:(unint64_t)a3
{
  void (**contentViewConfigurationProvider)(id, unint64_t);
  uint64_t v5;
  _UICollectionViewListHeaderFooter *v6;
  void *v7;
  void *v8;
  id v9;

  contentViewConfigurationProvider = (void (**)(id, unint64_t))self->_contentViewConfigurationProvider;
  if (contentViewConfigurationProvider)
  {
    contentViewConfigurationProvider[2](contentViewConfigurationProvider, a3);
    v5 = objc_claimAutoreleasedReturnValue();
    v9 = (id)v5;
    v6 = self;
    goto LABEL_3;
  }
  if ((*(_WORD *)(&self->_headerFooterFlags + 1) & 0x100) != 0)
  {
    -[_UICollectionViewListHeaderFooter _contentViewConfiguration](self, "_contentViewConfiguration", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_4;
    v8 = v7;
    v6 = self;
    v9 = v8;
    v5 = (uint64_t)v8;
LABEL_3:
    -[_UICollectionViewListHeaderFooter _setContentViewConfiguration:](v6, "_setContentViewConfiguration:", v5);
    v7 = v9;
LABEL_4:

  }
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  UIView *v7;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView setSemanticContentAttribute:](v7, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self, "semanticContentAttribute"));
    v5 = v7;
    if (v7)
    {
      -[UIView addSubview:](self, "addSubview:", self->_contentView);
      v5 = v7;
    }
  }

}

- (void)_setBackgroundViewConfiguration:(id)a3
{
  id v4;
  unsigned int v5;
  int v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v5 = *((unsigned __int16 *)&self->_headerFooterFlags + 2);
  v6 = (v5 >> 6) & 1;
  v8 = v4;
  if (v4)
    v6 = 1;
  if (v6)
    v7 = 64;
  else
    v7 = 0;
  *((_WORD *)&self->_headerFooterFlags + 2) = v7 | v5 & 0xFFBF;
  if ((v5 & 0x20) == 0 && v6)
    -[_UICollectionViewListHeaderFooter _setBackgroundViewConfigurationProvider:](self, "_setBackgroundViewConfigurationProvider:", 0);
  -[_UICollectionViewListHeaderFooter _applyBackgroundViewConfiguration:](self, "_applyBackgroundViewConfiguration:", v8);

}

- (void)_applyBackgroundViewConfiguration:(id)a3
{
  id v5;
  _UISystemBackgroundView *systemBackgroundView;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  _UISystemBackgroundView *v11;
  _UISystemBackgroundView *v12;
  _UISystemBackgroundView *v13;
  void *v14;
  id v15;
  id v16;

  v5 = a3;
  systemBackgroundView = self->_systemBackgroundView;
  if (v5)
  {
    v7 = v5;
    if ((*(_WORD *)(&self->_headerFooterFlags + 1) & 0x80) != 0 && !self->_backgroundViewConfigurationProvider)
    {
      v15 = v5;
      v8 = -[_UICollectionViewListHeaderFooter _viewConfigurationState](self, "_viewConfigurationState");
      -[UIView traitCollection](self, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updatedConfigurationForState:traitCollection:", v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListHeaderFooter.m"), 236, CFSTR("Updated configuration was nil for configuration: %@"), v15);

      }
      v7 = (id)v10;
    }
    v16 = v7;
    if (systemBackgroundView)
    {
      -[_UISystemBackgroundView setConfiguration:](self->_systemBackgroundView, "setConfiguration:", v7);
    }
    else
    {
      -[_UICollectionViewListHeaderFooter _resetBackgroundColor](self, "_resetBackgroundColor");
      v12 = -[_UISystemBackgroundView initWithConfiguration:]([_UISystemBackgroundView alloc], "initWithConfiguration:", v16);
      v13 = self->_systemBackgroundView;
      self->_systemBackgroundView = v12;

      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_systemBackgroundView, 0);
    }
    -[UIView setNeedsLayout](self, "setNeedsLayout");

  }
  else if (systemBackgroundView)
  {
    -[UIView removeFromSuperview](self->_systemBackgroundView, "removeFromSuperview");
    v11 = self->_systemBackgroundView;
    self->_systemBackgroundView = 0;

  }
}

- (_UIBackgroundViewConfiguration)_backgroundViewConfiguration
{
  return (_UIBackgroundViewConfiguration *)-[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
}

- (void)_setAutomaticallyUpdatesBackgroundViewConfiguration:(BOOL)a3
{
  id backgroundViewConfigurationProvider;
  $A5A6A253756E84E4E91A049044A955C8 *v4;
  __int16 v5;

  if (a3)
  {
    backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    v4 = &self->_headerFooterFlags + 1;
    v5 = *((_WORD *)&self->_headerFooterFlags + 2);
    if ((backgroundViewConfigurationProvider == 0) != ((v5 & 0x80) == 0))
      return;
    if (!backgroundViewConfigurationProvider)
    {
      *(_WORD *)v4 = v5 | 0x80;
      -[_UICollectionViewListHeaderFooter _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
      return;
    }
  }
  else
  {
    v4 = &self->_headerFooterFlags + 1;
    v5 = *((_WORD *)&self->_headerFooterFlags + 2);
    if ((v5 & 0x80) == 0)
      return;
  }
  *(_WORD *)v4 = v5 & 0xFF7F;
}

- (BOOL)_automaticallyUpdatesBackgroundViewConfiguration
{
  return (*((unsigned __int16 *)&self->_headerFooterFlags + 2) >> 7) & 1;
}

- (void)_setBackgroundViewConfigurationProvider:(id)a3
{
  unsigned int v3;
  int v4;
  __int16 v5;
  __int16 v6;
  id v8;
  void *v9;
  id backgroundViewConfigurationProvider;

  v3 = *((unsigned __int16 *)&self->_headerFooterFlags + 2);
  v4 = (v3 >> 5) & 1;
  if (a3)
    v4 = 1;
  if (v4)
    v5 = 32;
  else
    v5 = 0;
  v6 = v5 | v3 & 0xFFDF;
  *((_WORD *)&self->_headerFooterFlags + 2) = v6;
  if (self->_backgroundViewConfigurationProvider != a3)
  {
    if (a3)
      *((_WORD *)&self->_headerFooterFlags + 2) = v6 & 0xFF7F;
    v8 = a3;
    v9 = (void *)objc_msgSend(v8, "copy");
    backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    self->_backgroundViewConfigurationProvider = v9;

    -[_UICollectionViewListHeaderFooter _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
  }
}

- (id)_backgroundViewConfigurationProvider
{
  return _Block_copy(self->_backgroundViewConfigurationProvider);
}

- (id)_defaultBackgroundViewConfigurationProvider
{
  uint64_t v2;
  _QWORD aBlock[5];

  v2 = *(_WORD *)(&self->_headerFooterFlags + 1) & 7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80___UICollectionViewListHeaderFooter__defaultBackgroundViewConfigurationProvider__block_invoke;
  aBlock[3] = &__block_descriptor_40_e40____UIBackgroundViewConfiguration_16__0Q8l;
  aBlock[4] = v2;
  return _Block_copy(aBlock);
}

- (void)_updateDefaultBackgroundAppearance
{
  __int16 v2;
  _QWORD v4[5];

  v2 = *((_WORD *)&self->_headerFooterFlags + 2);
  if ((v2 & 0x70) == 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __71___UICollectionViewListHeaderFooter__updateDefaultBackgroundAppearance__block_invoke;
    v4[3] = &unk_1E16B1B28;
    v4[4] = self;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v4);
    *((_WORD *)&self->_headerFooterFlags + 2) = *(_WORD *)(&self->_headerFooterFlags + 1) & 0xFF5F | v2 & 0x80;
  }
}

- (void)_resetBackgroundColor
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58___UICollectionViewListHeaderFooter__resetBackgroundColor__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v2);
}

- (void)_resetBackgroundViewConfiguration
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __70___UICollectionViewListHeaderFooter__resetBackgroundViewConfiguration__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v2);
}

- (void)_updateBackgroundViewConfigurationForState:(unint64_t)a3
{
  void (**backgroundViewConfigurationProvider)(id, unint64_t);
  uint64_t v5;
  _UICollectionViewListHeaderFooter *v6;
  void *v7;
  void *v8;
  id v9;

  backgroundViewConfigurationProvider = (void (**)(id, unint64_t))self->_backgroundViewConfigurationProvider;
  if (backgroundViewConfigurationProvider)
  {
    backgroundViewConfigurationProvider[2](backgroundViewConfigurationProvider, a3);
    v5 = objc_claimAutoreleasedReturnValue();
    v9 = (id)v5;
    v6 = self;
    goto LABEL_3;
  }
  if ((*(_WORD *)(&self->_headerFooterFlags + 1) & 0x80) != 0)
  {
    -[_UICollectionViewListHeaderFooter _backgroundViewConfiguration](self, "_backgroundViewConfiguration", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_4;
    v8 = v7;
    v6 = self;
    v9 = v8;
    v5 = (uint64_t)v8;
LABEL_3:
    -[_UICollectionViewListHeaderFooter _applyBackgroundViewConfiguration:](v6, "_applyBackgroundViewConfiguration:", v5);
    v7 = v9;
LABEL_4:

  }
}

- (unint64_t)_viewConfigurationState
{
  unint64_t v3;

  if (-[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    v3 = 0;
  else
    v3 = 2;
  if (-[UIView isFocused](self, "isFocused"))
    return v3 | 8;
  else
    return v3;
}

- (void)_setNeedsConfigurationStateUpdate
{
  *((_WORD *)&self->_headerFooterFlags + 2) |= 8u;
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    -[_UICollectionViewListHeaderFooter _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
  }
  else
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_performConfigurationStateUpdate
{
  __int16 v2;
  void *v4;
  unint64_t v5;

  v2 = *((_WORD *)&self->_headerFooterFlags + 2);
  if ((v2 & 8) != 0)
  {
    *((_WORD *)&self->_headerFooterFlags + 2) = v2 & 0xFFF7;
    v4 = (void *)_UISetCurrentFallbackEnvironment(self);
    v5 = -[_UICollectionViewListHeaderFooter _viewConfigurationState](self, "_viewConfigurationState");
    -[_UICollectionViewListHeaderFooter _updateBackgroundViewConfigurationForState:](self, "_updateBackgroundViewConfigurationForState:", v5);
    -[_UICollectionViewListHeaderFooter _updateContentViewConfigurationForState:](self, "_updateContentViewConfigurationForState:", v5);
    -[_UICollectionViewListHeaderFooter _updateViewConfigurationsWithState:](self, "_updateViewConfigurationsWithState:", v5);
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[_UICollectionViewListHeaderFooter _layoutSystemBackgroundView](self, "_layoutSystemBackgroundView");
    }
    _UIRestorePreviousFallbackEnvironment(v4);
  }
}

- (void)_layoutSystemBackgroundView
{
  _UISystemBackgroundView *systemBackgroundView;

  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    -[_UISystemBackgroundView frameInContainerView:](systemBackgroundView, "frameInContainerView:", self);
    -[_UISystemBackgroundView setFrame:](self->_systemBackgroundView, "setFrame:");
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UIView layoutIfNeeded](self->_systemBackgroundView, "layoutIfNeeded");
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  unsigned int v5;
  int v6;
  __int16 v7;
  objc_super v8;

  v4 = a3;
  if (v4)
    -[_UICollectionViewListHeaderFooter _resetBackgroundViewConfiguration](self, "_resetBackgroundViewConfiguration");
  v5 = *((unsigned __int16 *)&self->_headerFooterFlags + 2);
  v6 = (v5 >> 4) & 1;
  if (v4)
    v6 = 1;
  if (v6)
    v7 = 16;
  else
    v7 = 0;
  *((_WORD *)&self->_headerFooterFlags + 2) = v7 | v5 & 0xFFEF;
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewListHeaderFooter;
  -[UIView setBackgroundColor:](&v8, sel_setBackgroundColor_, v4);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewListHeaderFooter;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UICollectionViewListHeaderFooter _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
  -[_UICollectionViewListHeaderFooter _layoutSystemBackgroundView](self, "_layoutSystemBackgroundView");
  -[_UICollectionViewListHeaderFooter _layoutContentView](self, "_layoutContentView");
}

- (void)_layoutContentView
{
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

  if (-[UIView translatesAutoresizingMaskIntoConstraints](self->_contentView, "translatesAutoresizingMaskIntoConstraints"))
  {
    -[UIView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[_UICollectionViewListHeaderFooter _contentViewInsets](self, "_contentViewInsets");
    -[UIView setFrame:](self->_contentView, "setFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewListHeaderFooter;
  -[UIView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[_UICollectionViewListHeaderFooter _updateConstants](self, "_updateConstants");
  -[_UICollectionViewListHeaderFooter _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
}

- (void)_updateConstants
{
  void *v3;
  UITableConstants *v4;
  UITableConstants *obj;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v3);
  obj = (UITableConstants *)objc_claimAutoreleasedReturnValue();

  v4 = obj;
  if (obj != self->_constants)
  {
    objc_storeStrong((id *)&self->_constants, obj);
    -[_UICollectionViewListHeaderFooter _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
    v4 = obj;
  }

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewListHeaderFooter;
  -[UIView setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_);
  -[_UICollectionViewListHeaderFooter contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSemanticContentAttribute:", a3);

}

- (CGSize)_contentTargetSizeForTargetSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5 forUseWithSizeThatFits:(BOOL)a6
{
  double height;
  double width;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  uint8_t buf[4];
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  _UICollectionViewListHeaderFooter *v36;
  uint64_t v37;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v37 = *MEMORY[0x1E0C80C00];
  -[_UICollectionViewListHeaderFooter _contentViewInsets](self, "_contentViewInsets");
  v14 = v13;
  v16 = v15;
  v17 = width - (v11 + v12);
  v27 = height;
  v18 = height - (v13 + v15);
  if (v17 < 0.0)
  {
    v19 = v11;
    v17 = 0.0;
    if (a4 >= 1000.0)
    {
      v20 = v12;
      v21 = _MergedGlobals_9_6;
      if (!_MergedGlobals_9_6)
      {
        v21 = __UILogCategoryGetNode("CollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&_MergedGlobals_9_6);
      }
      v22 = *(NSObject **)(v21 + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        v30 = v19;
        v31 = 2048;
        v32 = v20;
        v33 = 2048;
        v34 = width;
        v35 = 2112;
        v36 = self;
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "The _UICollectionViewListHeaderFooter's content view insets (left: %g, right: %g) exceed the _UICollectionViewListHeaderFooter's target width of %g with required fitting priority. Header/footer: %@", buf, 0x2Au);
      }
    }
  }
  if (v18 < 0.0)
  {
    v18 = 0.0;
    if (a5 >= 1000.0)
    {
      v23 = qword_1ECD7ADA0;
      if (!qword_1ECD7ADA0)
      {
        v23 = __UILogCategoryGetNode("CollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&qword_1ECD7ADA0);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        v30 = v14;
        v31 = 2048;
        v32 = v16;
        v33 = 2048;
        v34 = v27;
        v35 = 2112;
        v36 = self;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "The _UICollectionViewListHeaderFooter's content view insets (top: %g, bottom: %g) exceed the _UICollectionViewListHeaderFooter's target height of %g with required fitting priority. Header/footer: %@", buf, 0x2Au);
      }
    }
  }
  v25 = 1.79769313e308;
  if (a5 < 1000.0 && a6)
    v26 = 1.79769313e308;
  else
    v26 = v18;
  if (a4 >= 1000.0 || !a6)
    v25 = v17;
  result.height = v26;
  result.width = v25;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIView *v24;
  double v25;
  double v26;
  _UICollectionViewListHeaderFooter *v27;
  int v28;
  double v29;
  double v30;
  _UICollectionViewListHeaderFooter *v31;
  int has_internal_diagnostics;
  BOOL v33;
  double v34;
  double v35;
  uint8_t *v37;
  double v38;
  double v39;
  double v41;
  double v42;
  double v43;
  uint8_t *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  unint64_t v56;
  NSObject *v57;
  double v58;
  double v59;
  objc_super v60;
  _QWORD block[5];
  uint8_t buf[4];
  _UICollectionViewListHeaderFooter *v63;
  uint64_t v64;
  CGSize v65;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v64 = *MEMORY[0x1E0C80C00];
  -[_UICollectionViewListHeaderFooter _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
  -[_UICollectionViewListHeaderFooter _contentViewInsets](self, "_contentViewInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[_UICollectionViewListHeaderFooter _layoutContentView](self, "_layoutContentView");
  if (!self->_contentViewConfigurationClass
    || !-[UIView translatesAutoresizingMaskIntoConstraints](self->_contentView, "translatesAutoresizingMaskIntoConstraints"))
  {
    v27 = self;
    if (-[UIView _wantsAutolayout](v27, "_wantsAutolayout"))
      v28 = 1;
    else
      v28 = objc_msgSend((id)objc_opt_class(), "requiresConstraintBasedLayout");
    if (-[UIView _wantsAutolayout](v27->_contentView, "_wantsAutolayout")
      || objc_msgSend((id)objc_opt_class(), "requiresConstraintBasedLayout"))
    {
      if (!v28
        || (v31 = v27, !-[UIView needsUpdateConstraints](v27, "needsUpdateConstraints"))
        && (v31 = v27,
            -[UIView translatesAutoresizingMaskIntoConstraints](v27->_contentView, "translatesAutoresizingMaskIntoConstraints")))
      {
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        v33 = -[UIView translatesAutoresizingMaskIntoConstraints](v27->_contentView, "translatesAutoresizingMaskIntoConstraints");
        if (has_internal_diagnostics)
        {
          if (!v33)
          {
            __UIFaultDebugAssertLog();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v27;
              _os_log_fault_impl(&dword_185066000, v55, OS_LOG_TYPE_FAULT, "contentView of _UICollectionViewListHeaderFooter has translatesAutoresizingMaskIntoConstraints false and is missing constraints to the header/footer, which will cause substandard performance in header/footer autosizing. Please leave the contentView's translatesAutoresizingMaskIntoConstraints true or else provide constraints between the contentView and the header/footer. %@", buf, 0xCu);
            }

          }
        }
        else if (!v33)
        {
          v56 = qword_1ECD7ADA8;
          if (!qword_1ECD7ADA8)
          {
            v56 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v56, (unint64_t *)&qword_1ECD7ADA8);
          }
          v57 = *(NSObject **)(v56 + 8);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v63 = v27;
            _os_log_impl(&dword_185066000, v57, OS_LOG_TYPE_ERROR, "contentView of _UICollectionViewListHeaderFooter has translatesAutoresizingMaskIntoConstraints false and is missing constraints to the header/footer, which will cause substandard performance in header/footer autosizing. Please leave the contentView's translatesAutoresizingMaskIntoConstraints true or else provide constraints between the contentView and the header/footer. %@", buf, 0xCu);
          }
        }
        if (-[UIView translatesAutoresizingMaskIntoConstraints](v27->_contentView, "translatesAutoresizingMaskIntoConstraints"))
        {
          -[UIView _setHostsLayoutEngine:](v27->_contentView, "_setHostsLayoutEngine:", 1);
        }
        v31 = v27->_contentView;

      }
    }
    else
    {
      v31 = v27;
      if (!v28)
      {
        v60.receiver = v27;
        v60.super_class = (Class)_UICollectionViewListHeaderFooter;
        *(float *)&v29 = a4;
        *(float *)&v30 = a5;
        -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v60, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v29, v30);
        v25 = v48;
        v26 = v49;
        v31 = v27;
LABEL_54:

        goto LABEL_55;
      }
    }
    -[UIView _setWantsAutolayout](v31, "_setWantsAutolayout");
    buf[0] = 1;
    if (v13 == 0.0 && v11 == 0.0 && v17 == 0.0 && v15 == 0.0
      || v31 != (_UICollectionViewListHeaderFooter *)v27->_contentView)
    {
      if (a5 == 50.0 && height == 0.0)
        v37 = buf;
      else
        v37 = 0;
      *(float *)&v34 = a4;
      *(float *)&v35 = a5;
      -[UIView _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:](v31, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:", v37, width, height, v34, v35);
      v25 = v38;
      v26 = v39;
    }
    else
    {
      *(float *)&v34 = a4;
      *(float *)&v35 = a5;
      -[_UICollectionViewListHeaderFooter _contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:](v27, "_contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:", 0, width, height, v34, v35);
      if (v43 == 0.0 && a5 == 50.0)
        v45 = buf;
      else
        v45 = 0;
      -[UIView _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:](v31, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:", v45);
      v25 = v46 - (-v17 - v13);
      v26 = v47 - (-v15 - v11);
    }
    if (v26 == 0.0 && buf[0] == 0)
    {
      -[_UICollectionViewListHeaderFooter sizeThatFits:](v27, "sizeThatFits:", width, height);
      v25 = v41;
      v26 = v42;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __119___UICollectionViewListHeaderFooter_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = v27;
      if (qword_1ECD7ADB0 != -1)
        dispatch_once(&qword_1ECD7ADB0, block);
    }
    goto LABEL_54;
  }
  v58 = v15;
  v59 = v11;
  *(float *)&v18 = a4;
  *(float *)&v19 = a5;
  -[_UICollectionViewListHeaderFooter _contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:](self, "_contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:", 1, width, height, v18, v19);
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  v21 = v20;
  v23 = v22;
  v24 = self->_contentView;
  if (a4 != 1000.0 && v21 > 2777777.0 || a5 != 1000.0 && v23 > 2777777.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UIContentViewAssertValidFittingSize(UIView * _Nonnull __strong, CGSize, UILayoutPriority, UILayoutPriority)");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v65.width = v21;
    v65.height = v23;
    NSStringFromCGSize(v65);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("_UIContentViewShared.h"), 66, CFSTR("Content view returned an invalid size %@ from -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority: which is not allowed. If you have implemented a custom content view, you need to add constraints inside it so that its size is not ambiguous, or you need to manually compute and return a valid size. Content view: %@"), v54, v24);

  }
  if (a4 >= 1000.0)
    v25 = width;
  else
    v25 = v21 - (-v17 - v13);
  if (a5 >= 1000.0)
    v26 = height;
  else
    v26 = v23 - (-v58 - v59);
LABEL_55:
  v50 = v25;
  v51 = v26;
  result.height = v51;
  result.width = v50;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UICollectionViewListHeaderFooter _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
  if (self->_contentViewConfigurationClass)
  {
    -[_UICollectionViewListHeaderFooter _layoutContentView](self, "_layoutContentView");
    if (width == 0.0)
      *(float *)&v6 = 50.0;
    else
      *(float *)&v6 = 1000.0;
    if (height == 0.0)
      *(float *)&v7 = 50.0;
    else
      *(float *)&v7 = 1000.0;
    -[_UICollectionViewListHeaderFooter _contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:](self, "_contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:", 1, width, height, v6, v7);
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
    v9 = v8;
    v11 = v10;
    -[_UICollectionViewListHeaderFooter _contentViewInsets](self, "_contentViewInsets");
    width = v9 - (-v13 - v14);
    height = v11 - (-v12 - v15);
  }
  v16 = width;
  v17 = height;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4;
  _UICollectionViewListHeaderFooter *v5;
  _UICollectionViewListHeaderFooter *v6;
  _UICollectionViewListHeaderFooter *v7;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "previouslyFocusedView");
  v5 = (_UICollectionViewListHeaderFooter *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

LABEL_5:
    -[_UICollectionViewListHeaderFooter _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
    goto LABEL_6;
  }
  v6 = v5;
  objc_msgSend(v4, "nextFocusedView");
  v7 = (_UICollectionViewListHeaderFooter *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
    goto LABEL_5;
LABEL_6:
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewListHeaderFooter;
  -[UIView _didUpdateFocusInContext:](&v8, sel__didUpdateFocusInContext_, v4);

}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIEdgeInsets)_contentViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentViewInsets.top;
  left = self->_contentViewInsets.left;
  bottom = self->_contentViewInsets.bottom;
  right = self->_contentViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UITableConstants)_constants
{
  return self->_constants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong(&self->_backgroundViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_systemBackgroundView, 0);
  objc_storeStrong(&self->_contentViewConfigurationProvider, 0);
}

@end
