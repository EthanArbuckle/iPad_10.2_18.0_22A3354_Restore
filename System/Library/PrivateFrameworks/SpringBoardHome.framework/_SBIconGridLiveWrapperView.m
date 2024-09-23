@implementation _SBIconGridLiveWrapperView

- (void)setElement:(id)a3
{
  _SBFolderPageElement *v5;
  _SBFolderPageElement *element;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SBFolderPageElement *v11;

  v5 = (_SBFolderPageElement *)a3;
  element = self->_element;
  if (element != v5)
  {
    v11 = v5;
    -[_SBFolderPageElement gridLayer](element, "gridLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->_element, a3);
    -[_SBFolderPageElement gridLayer](v11, "gridLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      || -[_SBFolderPageElement isGridImagePossible](v11, "isGridImagePossible")
      && (-[_SBIconGridLiveWrapperView folderIconImageView](self, "folderIconImageView"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "fulfillGridLayerForPageElement:", v11),
          -[_SBFolderPageElement gridLayer](v11, "gridLayer"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v8))
    {
      objc_msgSend(v8, "bounds");
      -[_SBIconGridLiveWrapperView setBounds:](self, "setBounds:");
      -[_SBIconGridLiveWrapperView layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSublayer:", v8);

    }
    -[_SBIconGridLiveWrapperView setNeedsLayout](self, "setNeedsLayout");

    v5 = v11;
  }

}

- (void)positionAtRow:(unint64_t)a3
{
  id v4;

  -[_SBIconGridLiveWrapperView element](self, "element");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisibleRow:", a3);

}

- (void)layoutSubviews
{
  void *v3;
  id v4;

  -[_SBIconGridLiveWrapperView element](self, "element");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBIconGridLiveWrapperView bounds](self, "bounds");
  UIRectGetCenter();
  objc_msgSend(v3, "setPosition:");

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
