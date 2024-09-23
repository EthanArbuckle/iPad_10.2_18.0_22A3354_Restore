@implementation _TVCollectionViewCell

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVCollectionViewCell;
  -[_TVCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[_TVCollectionViewCell selectingView](self, "selectingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVCollectionViewCell bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v3, "layoutIfNeeded");

}

- (TVAuxiliaryViewSelecting)selectingView
{
  TVAuxiliaryViewSelecting **p_selectingView;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_selectingView = &self->_selectingView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectingView);

  if (!WeakRetained)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[_TVCollectionViewCell contentView](self, "contentView", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "conformsToProtocol:", &unk_25578CA30))
          {
            objc_storeWeak((id *)p_selectingView, v11);
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return (TVAuxiliaryViewSelecting *)objc_loadWeakRetained((id *)p_selectingView);
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;
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
  UIEdgeInsets result;

  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectingView);
  objc_msgSend(WeakRetained, "selectionMarginsForSize:", width, height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)setSelectingView:(id)a3
{
  objc_storeWeak((id *)&self->_selectingView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectingView);
}

@end
