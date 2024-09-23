@implementation SXMosaicGalleryComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[SXMosaicGalleryComponentSizer layouter](self, "layouter", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calculateLayoutForWidth:", a3);

  -[SXMosaicGalleryComponentSizer layouter](self, "layouter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentSize");
  v9 = v8;

  return v9;
}

- (SXMosaicGalleryLayouter)layouter
{
  SXMosaicGalleryLayouter *layouter;
  SXMosaicGalleryLayouter *v4;
  SXMosaicGalleryLayouter *v5;

  layouter = self->_layouter;
  if (!layouter)
  {
    v4 = -[SXMosaicGalleryLayouter initWithDataSource:]([SXMosaicGalleryLayouter alloc], "initWithDataSource:", self);
    v5 = self->_layouter;
    self->_layouter = v4;

    -[SXComponentSizer saveInfo:forRenderingPhaseWithIdentifier:](self, "saveInfo:forRenderingPhaseWithIdentifier:", self->_layouter, CFSTR("Layouter"));
    layouter = self->_layouter;
  }
  return layouter;
}

- (CGSize)galleryLayouter:(id)a3 dimensionsForItemAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[SXComponentSizer component](self, "component", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageResourceForIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dimensions");
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (id)galleryLayouter:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  return 0;
}

- (BOOL)galleryLayouter:(id)a3 viewIsCurrentlyFullscreenForItemAtIndex:(unint64_t)a4
{
  return 0;
}

- (unint64_t)numberOfItemsForGalleryLayouter:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[SXComponentSizer component](self, "component", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)documentColumnLayoutForGalleryLayouter:(id)a3
{
  void *v3;
  void *v4;

  -[SXComponentSizer layoutOptions](self, "layoutOptions", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "columnLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setLayouter:(id)a3
{
  objc_storeStrong((id *)&self->_layouter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layouter, 0);
}

@end
