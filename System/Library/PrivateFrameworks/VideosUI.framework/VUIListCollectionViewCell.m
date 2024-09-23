@implementation VUIListCollectionViewCell

- (void)setHighlightedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setShouldAppearSelected:(BOOL)a3
{
  if (self->_shouldAppearSelected != a3)
  {
    self->_shouldAppearSelected = a3;
    -[VUIListCollectionViewCell setSelected:](self, "setSelected:");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  UIColor **p_highlightedBackgroundColor;
  objc_super v7;

  v4 = self->_shouldAppearSelected || a3;
  v7.receiver = self;
  v7.super_class = (Class)VUIListCollectionViewCell;
  -[VUIListCollectionViewCell setHighlighted:](&v7, sel_setHighlighted_, v4);
  if (self->_highlightedBackgroundColor && self->_backgroundColor)
  {
    -[VUIListCollectionViewCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 | -[VUIListCollectionViewCell isSelected](self, "isSelected"))
      p_highlightedBackgroundColor = &self->_highlightedBackgroundColor;
    else
      p_highlightedBackgroundColor = &self->_backgroundColor;
    objc_msgSend(v5, "setBackgroundColor:", *p_highlightedBackgroundColor);

  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  UIColor **p_highlightedBackgroundColor;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)VUIListCollectionViewCell;
  -[VUIListCollectionViewCell setSelected:](&v18, sel_setSelected_);
  if (self->_highlightedBackgroundColor && self->_backgroundColor)
  {
    -[VUIListCollectionViewCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      p_highlightedBackgroundColor = &self->_highlightedBackgroundColor;
    else
      p_highlightedBackgroundColor = &self->_backgroundColor;
    objc_msgSend(v5, "setBackgroundColor:", *p_highlightedBackgroundColor);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VUIListCollectionViewCell contentView](self, "contentView", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setHighlighted:", v3);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v11);
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIListCollectionViewCell;
  -[VUIListCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  self->_shouldAppearSelected = 0;
  if (-[VUIListCollectionViewCell isHighlighted](self, "isHighlighted"))
    -[VUIListCollectionViewCell setHighlighted:](self, "setHighlighted:", 0);
  if (-[VUIListCollectionViewCell isSelected](self, "isSelected"))
    -[VUIListCollectionViewCell setSelected:](self, "setSelected:", 0);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (BOOL)shouldAppearSelected
{
  return self->_shouldAppearSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
