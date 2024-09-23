@implementation PXImageRequesterHelper

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXImageRequesterHelper;
  -[PXImageRequesterHelper performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPublishChanges
{
  char v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXImageRequesterHelper;
  -[PXImageRequesterHelper didPublishChanges](&v4, sel_didPublishChanges);
  v3 = -[PXImageRequesterHelper currentChanges](self, "currentChanges");
  if ((v3 & 3) != 0)
    -[PXImageRequesterHelper _updateAssetOrMediaProvider](self, "_updateAssetOrMediaProvider");
  if ((v3 & 0x14) != 0)
    -[PXImageRequesterHelper _updateImageRequester](self, "_updateImageRequester");
}

- (void)setAsset:(id)a3
{
  PXDisplayAsset *v5;
  PXDisplayAsset *v6;

  v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    -[PXImageRequesterHelper signalChange:](self, "signalChange:", 1);
    v5 = v6;
  }

}

- (void)setMediaProvider:(id)a3
{
  PXUIImageProvider *v5;
  PXUIImageProvider *v6;

  v5 = (PXUIImageProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PXImageRequesterHelper signalChange:](self, "signalChange:", 2);
    v5 = v6;
  }

}

- (void)setContentSize:(CGSize)a3
{
  if (a3.width != self->_contentSize.width || a3.height != self->_contentSize.height)
  {
    self->_contentSize = a3;
    -[PXImageRequesterHelper signalChange:](self, "signalChange:", 4);
  }
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[PXImageRequesterHelper signalChange:](self, "signalChange:", 16);
  }
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  char v6;
  UIImage *v7;

  v7 = (UIImage *)a3;
  v5 = self->_image;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[UIImage isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_image, a3);
      -[PXImageRequesterHelper signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentsRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(self->_contentsRect, a3))
  {
    p_contentsRect->origin.x = x;
    p_contentsRect->origin.y = y;
    p_contentsRect->size.width = width;
    p_contentsRect->size.height = height;
    -[PXImageRequesterHelper signalChange:](self, "signalChange:", 8);
  }
}

- (void)setImageRequester:(id)a3
{
  PXImageRequester *v5;
  PXImageRequester *imageRequester;
  PXImageRequester *v7;

  v5 = (PXImageRequester *)a3;
  imageRequester = self->_imageRequester;
  if (imageRequester != v5)
  {
    v7 = v5;
    -[PXImageRequester unregisterChangeObserver:context:](imageRequester, "unregisterChangeObserver:context:", self, PXImageRequesterObserverContext_186965);
    objc_storeStrong((id *)&self->_imageRequester, a3);
    -[PXImageRequester registerChangeObserver:context:](self->_imageRequester, "registerChangeObserver:context:", self, PXImageRequesterObserverContext_186965);
    -[PXImageRequesterHelper _updateImageRequester](self, "_updateImageRequester");
    -[PXImageRequesterHelper _updateImage](self, "_updateImage");
    v5 = v7;
  }

}

- (void)_updateImageRequester
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[9];

  -[PXImageRequesterHelper imageRequester](self, "imageRequester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(_QWORD *)off_1E50B86D0;
    v5 = *((_QWORD *)off_1E50B86D0 + 1);
    v6 = *((_QWORD *)off_1E50B86D0 + 2);
    v7 = *((_QWORD *)off_1E50B86D0 + 3);
    -[PXImageRequesterHelper asset](self, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((PXSizeIsEmpty() & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      PXSizeGetAspectRatio();
      objc_msgSend(v8, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 0, 3);
      v4 = v9;
      v5 = v10;
      v6 = v11;
      v7 = v12;
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__PXImageRequesterHelper__updateImageRequester__block_invoke;
    v13[3] = &unk_1E5133678;
    v13[4] = self;
    v13[5] = v4;
    v13[6] = v5;
    v13[7] = v6;
    v13[8] = v7;
    objc_msgSend(v3, "performChanges:", v13);

  }
}

- (void)_updateAssetOrMediaProvider
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  PXImageRequester *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id v13;

  -[PXImageRequesterHelper asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageRequesterHelper mediaProvider](self, "mediaProvider");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    -[PXImageRequesterHelper imageRequester](self, "imageRequester");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (PXImageRequester *)v6;
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __53__PXImageRequesterHelper__updateAssetOrMediaProvider__block_invoke;
      v11 = &unk_1E51336A0;
      v12 = v3;
      v13 = v5;
      -[PXImageRequester performChanges:](v7, "performChanges:", &v8);
      -[PXImageRequesterHelper _updateImageRequester](self, "_updateImageRequester", v8, v9, v10, v11);

    }
    else
    {
      v7 = -[PXImageRequester initWithMediaProvider:asset:]([PXImageRequester alloc], "initWithMediaProvider:asset:", v5, v3);
      -[PXImageRequesterHelper setImageRequester:](self, "setImageRequester:", v7);
    }

  }
  else
  {
    -[PXImageRequesterHelper setImageRequester:](self, "setImageRequester:", 0);
  }

}

- (void)_updateImage
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[PXImageRequesterHelper imageRequester](self, "imageRequester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__PXImageRequesterHelper__updateImage__block_invoke;
  v6[3] = &unk_1E51336C8;
  v7 = v4;
  v5 = v4;
  -[PXImageRequesterHelper performChanges:](self, "performChanges:", v6);

}

- (void)_updateContentsRect
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__PXImageRequesterHelper__updateContentsRect__block_invoke;
  v2[3] = &unk_1E51336C8;
  v2[4] = self;
  -[PXImageRequesterHelper performChanges:](self, "performChanges:", v2);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a3;
  if ((void *)PXImageRequesterObserverContext_186965 == a5)
  {
    v9 = v8;
    if ((v6 & 4) != 0)
    {
      -[PXImageRequesterHelper _updateImage](self, "_updateImage");
      v8 = v9;
    }
    if (v6 < 0)
    {
      -[PXImageRequesterHelper _updateContentsRect](self, "_updateContentsRect");
      v8 = v9;
    }
  }

}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (PXUIImageProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (UIImage)image
{
  return self->_image;
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

void __45__PXImageRequesterHelper__updateContentsRect__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "imageRequester");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsRect");
  objc_msgSend(v3, "setContentsRect:");

}

uint64_t __38__PXImageRequesterHelper__updateImage__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImage:", *(_QWORD *)(a1 + 32));
}

void __53__PXImageRequesterHelper__updateAssetOrMediaProvider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAsset:", v3);
  objc_msgSend(v4, "setMediaProvider:", *(_QWORD *)(a1 + 40));

}

void __47__PXImageRequesterHelper__updateImageRequester__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = *(double *)(*(_QWORD *)(a1 + 32) + 136);
  v4 = *(double *)(*(_QWORD *)(a1 + 32) + 144);
  v5 = a2;
  objc_msgSend(v5, "setContentSize:", v3, v4);
  objc_msgSend(v5, "setDesiredContentsRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v5, "setViewportSize:", *(double *)(*(_QWORD *)(a1 + 32) + 136), *(double *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(v5, "setScale:", *(double *)(*(_QWORD *)(a1 + 32) + 112));

}

@end
