@implementation _SBFolderPageElement

- (unint64_t)firstVisibleMiniIconIndex
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  -[_SBFolderPageElement gridImage](self, "gridImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_SBFolderPageElement visibleRow](self, "visibleRow");
  v5 = objc_msgSend(v3, "numberOfColumns") * v4;

  return v5;
}

- (unint64_t)visibleRow
{
  return self->_visibleRow;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndex = a3;
}

- (void)setFolderIcon:(id)a3
{
  objc_storeWeak((id *)&self->_folderIcon, a3);
}

- (void)setVisibleRow:(unint64_t)a3
{
  self->_visibleRow = a3;
}

- (void)setGridImagePossible:(BOOL)a3
{
  self->_gridImagePossible = a3;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (SBIconGridImage)gridImage
{
  void *v2;
  void *v3;
  void *v4;
  SBIconGridImage *v5;

  -[_SBFolderPageElement image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)isGridImagePossible
{
  return self->_gridImagePossible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_folderIcon);
  objc_storeStrong((id *)&self->_gridLayer, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (unint64_t)firstVisibleRowForGap
{
  return 0;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CALayer)gridLayer
{
  return self->_gridLayer;
}

- (void)setGridLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gridLayer, a3);
}

- (SBFolderIcon)folderIcon
{
  return (SBFolderIcon *)objc_loadWeakRetained((id *)&self->_folderIcon);
}

@end
