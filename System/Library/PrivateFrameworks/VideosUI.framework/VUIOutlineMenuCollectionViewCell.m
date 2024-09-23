@implementation VUIOutlineMenuCollectionViewCell

- (void)prepareForReuse
{
  NSString *title;
  NSString *imageName;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIOutlineMenuCollectionViewCell;
  -[VUIOutlineMenuCollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
  title = self->_title;
  self->_title = 0;

  imageName = self->_imageName;
  self->_imageName = 0;

  self->_shouldAppearAsHeader = 0;
  -[VUIOutlineMenuCollectionViewCell setTrailingAccessoryConfigurations:](self, "setTrailingAccessoryConfigurations:", MEMORY[0x1E0C9AA60]);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  -[VUIOutlineMenuCollectionViewCell _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
  -[VUIOutlineMenuCollectionViewCell _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
}

- (void)_updateViewConfigurationsWithState:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSString *title;
  void *v9;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VUIOutlineMenuCollectionViewCell;
  -[VUIOutlineMenuCollectionViewCell _updateViewConfigurationsWithState:](&v10, sel__updateViewConfigurationsWithState_, a3);
  objc_msgSend(MEMORY[0x1E0DC4040], "outlineCellConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldAppearAsHeader)
  {
    objc_msgSend(MEMORY[0x1E0DC4040], "outlineRootParentCellConfiguration");
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4070]), "initWithCellSelectionTogglesExpansionState:", 1);
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIOutlineMenuCollectionViewCell setTrailingAccessoryConfigurations:](self, "setTrailingAccessoryConfigurations:", v7);
    v4 = (void *)v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", self->_imageName);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v6);
  }

  title = self->_title;
  objc_msgSend(v4, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", title);

  -[VUIOutlineMenuCollectionViewCell _setContentViewConfiguration:](self, "_setContentViewConfiguration:", v4);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (BOOL)shouldAppearAsHeader
{
  return self->_shouldAppearAsHeader;
}

- (void)setShouldAppearAsHeader:(BOOL)a3
{
  self->_shouldAppearAsHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
