@implementation _UIBarCustomizationSession

+ (_UIBarCustomizationSession)sessionWithVisibleItems:(id)a3 additionalItems:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v7, "setSourceItems:", v8);

  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v7, "set_mutableVisibleItems:", v9);

  v10 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v7, "set_mutableAdditionalItems:", v10);

  return (_UIBarCustomizationSession *)v7;
}

- (_UIBarCustomizerAnimating)beginAnimationCoordinator
{
  _UIBarCustomizerAnimating *beginAnimationCoordinator;
  _UIBarCustomizerAnimating *v4;
  _UIBarCustomizerAnimating *v5;

  beginAnimationCoordinator = self->_beginAnimationCoordinator;
  if (!beginAnimationCoordinator)
  {
    v4 = (_UIBarCustomizerAnimating *)objc_opt_new();
    v5 = self->_beginAnimationCoordinator;
    self->_beginAnimationCoordinator = v4;

    beginAnimationCoordinator = self->_beginAnimationCoordinator;
  }
  return beginAnimationCoordinator;
}

- (_UIBarCustomizerAnimating)endAnimationCoordinator
{
  _UIBarCustomizerAnimating *endAnimationCoordinator;
  _UIBarCustomizerAnimating *v4;
  _UIBarCustomizerAnimating *v5;

  endAnimationCoordinator = self->_endAnimationCoordinator;
  if (!endAnimationCoordinator)
  {
    v4 = (_UIBarCustomizerAnimating *)objc_opt_new();
    v5 = self->_endAnimationCoordinator;
    self->_endAnimationCoordinator = v4;

    endAnimationCoordinator = self->_endAnimationCoordinator;
  }
  return endAnimationCoordinator;
}

- (NSArray)visibleItems
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[_UIBarCustomizationSession _mutableVisibleItems](self, "_mutableVisibleItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)additionalItems
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[_UIBarCustomizationSession _mutableAdditionalItems](self, "_mutableAdditionalItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)sourceItems
{
  return self->_sourceItems;
}

- (void)setSourceItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableArray)_mutableVisibleItems
{
  return self->__mutableVisibleItems;
}

- (void)set_mutableVisibleItems:(id)a3
{
  objc_storeStrong((id *)&self->__mutableVisibleItems, a3);
}

- (NSMutableArray)_mutableAdditionalItems
{
  return self->__mutableAdditionalItems;
}

- (void)set_mutableAdditionalItems:(id)a3
{
  objc_storeStrong((id *)&self->__mutableAdditionalItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mutableAdditionalItems, 0);
  objc_storeStrong((id *)&self->__mutableVisibleItems, 0);
  objc_storeStrong((id *)&self->_sourceItems, 0);
  objc_storeStrong((id *)&self->_endAnimationCoordinator, 0);
  objc_storeStrong((id *)&self->_beginAnimationCoordinator, 0);
}

@end
