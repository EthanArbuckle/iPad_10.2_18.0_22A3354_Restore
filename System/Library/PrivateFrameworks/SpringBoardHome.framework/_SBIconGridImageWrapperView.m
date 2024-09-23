@implementation _SBIconGridImageWrapperView

- (void)setElement:(id)a3
{
  _SBFolderPageElement *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _SBFolderPageElement *v10;

  v5 = (_SBFolderPageElement *)a3;
  if (self->_element != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_element, a3);
    -[_SBFolderPageElement gridImage](v10, "gridImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if (-[_SBFolderPageElement isGridImagePossible](v10, "isGridImagePossible"))
      {
        -[_SBIconGridImageWrapperView folderIconImageView](self, "folderIconImageView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fulfillGridImageForPageElement:", v10);
        -[_SBFolderPageElement gridImage](v10, "gridImage");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = 0;
      }
    }
    -[_SBIconGridImageWrapperView setImage:](self, "setImage:", v6);
    objc_msgSend(v6, "size");
    -[_SBIconGridImageWrapperView setBounds:](self, "setBounds:", 0.0, 0.0, v8, v9);
    -[_SBIconGridImageWrapperView reposition](self, "reposition");

    v5 = v10;
  }

}

- (void)reposition
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  -[_SBIconGridImageWrapperView element](self, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_SBIconGridImageWrapperView element](self, "element");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gridImage");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "size");
    v6 = v5;
    objc_msgSend(v16, "listLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_class();
    -[_SBIconGridImageWrapperView element](self, "element");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rectAtIndex:inLayout:maxCount:", objc_msgSend(v9, "firstVisibleMiniIconIndex"), v7, objc_msgSend(v16, "numberOfCells"));
    v11 = v10;

    objc_msgSend((id)objc_opt_class(), "sizeForLayout:", v7);
    v12 = fmax(fmin(v11 / v6, 1.0), 0.0);
    v14 = fmax(fmin(v13 / v6, 1.0), 0.0);
    -[_SBIconGridImageWrapperView layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentsRect:", 0.0, v12, 1.0, v14);

  }
}

- (void)positionAtRow:(unint64_t)a3
{
  void *v5;

  -[_SBIconGridImageWrapperView element](self, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisibleRow:", a3);

  -[_SBIconGridImageWrapperView reposition](self, "reposition");
}

- (_SBFolderPageElement)element
{
  return self->_element;
}

- (SBFolderIconImageView)folderIconImageView
{
  return (SBFolderIconImageView *)objc_loadWeakRetained((id *)&self->_folderIconImageView);
}

- (void)setFolderIconImageView:(id)a3
{
  objc_storeWeak((id *)&self->_folderIconImageView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_folderIconImageView);
  objc_storeStrong((id *)&self->_element, 0);
}

@end
