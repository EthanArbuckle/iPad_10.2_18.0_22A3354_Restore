@implementation TVContainerCollectionViewCell

- (TVContainerCollectionViewCell)initWithFrame:(CGRect)a3
{
  TVContainerCollectionViewCell *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVContainerCollectionViewCell;
  result = -[TVContainerCollectionViewCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_selectSubviews = 1;
    result->_allowsFocus = 1;
  }
  return result;
}

- (BOOL)canBecomeFocused
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVContainerCollectionViewCell;
  v3 = -[TVContainerCollectionViewCell canBecomeFocused](&v5, sel_canBecomeFocused);
  if (v3)
    LOBYTE(v3) = self->_allowsFocus;
  return v3;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  -[TVContainerCollectionViewCell selectingView](self, "selectingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_preferredConfigurationForFocusAnimation:inContext:", a3, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TVContainerCollectionViewCell;
    -[TVContainerCollectionViewCell _preferredConfigurationForFocusAnimation:inContext:](&v12, sel__preferredConfigurationForFocusAnimation_inContext_, a3, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[TVContainerCollectionViewCell setFocused:animated:context:coordinator:](self, "setFocused:animated:context:coordinator:", -[TVContainerCollectionViewCell isFocused](self, "isFocused"), 1, v7, v6);

}

- (void)setFocused:(BOOL)a3 animated:(BOOL)a4 context:(id)a5 coordinator:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v7 = a4;
  v8 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  -[TVContainerCollectionViewCell selectingView](self, "selectingView");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (self->_selectSubviews)
  {
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v13, "setSelected:animated:focusUpdateContext:withAnimationCoordinator:", v8, v7, v10, v11);
      else
        objc_msgSend(v13, "setSelected:animated:withAnimationCoordinator:", v8, 1, v11);
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[TVContainerCollectionViewCell contentView](self, "contentView", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "subviews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v21 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "setSelected:animated:withAnimationCoordinator:", v8, 1, v11);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v17);
      }

    }
  }

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  -[TVContainerCollectionViewCell setFocused:animated:context:coordinator:](self, "setFocused:animated:context:coordinator:", a3, a4, 0, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  -[TVContainerCollectionViewCell setFocused:animated:context:coordinator:](self, "setFocused:animated:context:coordinator:", a3, a4, 0, a5);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVContainerCollectionViewCell;
  -[TVContainerCollectionViewCell pressesBegan:withEvent:](&v9, sel_pressesBegan_withEvent_, v6, a4);
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    if (v8 == 4)
      -[TVContainerCollectionViewCell _showPressState](self, "_showPressState");
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVContainerCollectionViewCell;
  -[TVContainerCollectionViewCell pressesEnded:withEvent:](&v9, sel_pressesEnded_withEvent_, v6, a4);
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    if (v8 == 4)
      -[TVContainerCollectionViewCell _clearPressState](self, "_clearPressState");
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVContainerCollectionViewCell;
  -[TVContainerCollectionViewCell pressesCancelled:withEvent:](&v9, sel_pressesCancelled_withEvent_, v6, a4);
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    if (v8 == 4)
      -[TVContainerCollectionViewCell _clearPressState](self, "_clearPressState");
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVContainerCollectionViewCell;
  -[TVContainerCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  self->_allowsFocus = 1;
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

- (BOOL)selectSubviews
{
  return self->_selectSubviews;
}

- (void)setSelectSubviews:(BOOL)a3
{
  self->_selectSubviews = a3;
}

@end
