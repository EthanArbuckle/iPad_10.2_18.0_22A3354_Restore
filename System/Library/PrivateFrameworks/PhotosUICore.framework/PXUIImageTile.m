@implementation PXUIImageTile

- (void)_setAnimationCount:(int64_t)a3
{
  if (self->__animationCount != a3)
  {
    self->__animationCount = a3;
    -[PXUIImageTile _invalidateImageView](self, "_invalidateImageView");
  }
}

- (void)_performChanges:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL4 isPerformingChanges;
  void (**v6)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  v6 = v4;
  if (v4)
  {
    v4[2](v4);
    v4 = v6;
  }
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    -[PXUIImageTile _updateIfNeeded](self, "_updateIfNeeded");
    v4 = v6;
  }

}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;
  id v5;

  if (-[PXUIImageTile _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PXUIImageTile _updateImageViewIfNeeded](self, "_updateImageViewIfNeeded");
    -[PXUIImageTile _updateImageRequesterIfNeeded](self, "_updateImageRequesterIfNeeded");
    -[PXUIImageTile _updateImageIfNeeded](self, "_updateImageIfNeeded");
    self->_isPerformingUpdates = isPerformingUpdates;
    if (-[PXUIImageTile _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIImageTile.m"), 86, CFSTR("update still needed after update pass"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.imageView || self->_needsUpdateFlags.imageRequester || self->_needsUpdateFlags.image;
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIImageTile.m"), 98, CFSTR("not inside -performChanges: or _updateIfNeeded"));

  }
}

- (void)_invalidateImageView
{
  self->_needsUpdateFlags.imageView = 1;
  -[PXUIImageTile _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateImageViewIfNeeded
{
  if (self->_needsUpdateFlags.imageView)
  {
    self->_needsUpdateFlags.imageView = 0;
    -[PXImageUIView setAnimating:withFlags:](self->_imageView, "setAnimating:withFlags:", -[PXUIImageTile _animationCount](self, "_animationCount") > 0, self->_animationFlags);
  }
}

- (void)_invalidateImageRequester
{
  self->_needsUpdateFlags.imageRequester = 1;
  -[PXUIImageTile _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateImageRequesterIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[8];

  if (self->_needsUpdateFlags.imageRequester)
  {
    self->_needsUpdateFlags.imageRequester = 0;
    -[PXUIImageTile _contentSize](self, "_contentSize");
    v4 = v3;
    v6 = v5;
    -[PXUIImageTile _displayScale](self, "_displayScale");
    v8 = v7;
    -[PXUIImageTile imageRequester](self, "imageRequester");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__PXUIImageTile__updateImageRequesterIfNeeded__block_invoke;
    v10[3] = &unk_1E5131290;
    v10[5] = v4;
    v10[6] = v6;
    v10[7] = v8;
    v10[4] = self;
    objc_msgSend(v9, "performChanges:", v10);

  }
}

- (void)_invalidateImage
{
  self->_needsUpdateFlags.image = 1;
  -[PXUIImageTile _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateImageIfNeeded
{
  void *v3;
  id v4;

  if (self->_needsUpdateFlags.image)
  {
    self->_needsUpdateFlags.image = 0;
    -[PXUIImageTile imageRequester](self, "imageRequester");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImageUIView setImage:](self->_imageView, "setImage:", v3);

  }
}

- (UIView)view
{
  PXImageUIView *imageView;
  PXImageUIView *v4;
  PXImageUIView *v5;
  _QWORD v7[5];

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = objc_alloc_init(PXImageUIView);
    v5 = self->_imageView;
    self->_imageView = v4;

    -[PXImageUIView setContentMode:](self->_imageView, "setContentMode:", 2);
    -[PXImageUIView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 0);
    -[PXImageUIView setDrawsFocusRing:](self->_imageView, "setDrawsFocusRing:", -[PXUIImageTile drawsFocusRing](self, "drawsFocusRing"));
    -[PXImageUIView setSpec:](self->_imageView, "setSpec:", self->__spec);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __21__PXUIImageTile_view__block_invoke;
    v7[3] = &unk_1E5149198;
    v7[4] = self;
    -[PXUIImageTile _performChanges:](self, "_performChanges:", v7);
    imageView = self->_imageView;
  }
  return (UIView *)imageView;
}

- (void)_setSpec:(id)a3
{
  PXImageViewSpec *v5;

  v5 = (PXImageViewSpec *)a3;
  if (self->__spec != v5)
  {
    objc_storeStrong((id *)&self->__spec, a3);
    -[PXImageUIView setSpec:](self->_imageView, "setSpec:", v5);
  }

}

- (void)_setContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->__contentsRect, a3))
  {
    self->__contentsRect.origin.x = x;
    self->__contentsRect.origin.y = y;
    self->__contentsRect.size.width = width;
    self->__contentsRect.size.height = height;
    -[PXUIImageTile view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentsRect:", self->__contentsRect.origin.x, self->__contentsRect.origin.y, self->__contentsRect.size.width, self->__contentsRect.size.height);

  }
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGSize size;
  CGSize v17;
  _QWORD v18[5];
  CGPoint origin;
  CGSize v20;
  CGPoint center;
  CGSize v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  objc_msgSend(a4, "viewSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "imageSpec");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  -[PXUIImageTile _setSpec:](self, "_setSpec:", v6);
  if (v6)
  {
    objc_msgSend(v6, "displayScale");
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v9 = v11;

  }
  v18[1] = 3221225472;
  v12 = *(_OWORD *)&a3->contentSize.height;
  v27 = *(_OWORD *)&a3->hidden;
  v28 = v12;
  v13 = *(_OWORD *)&a3->contentsRect.size.height;
  v29 = *(_OWORD *)&a3->contentsRect.origin.y;
  v30 = v13;
  v14 = *(_OWORD *)&a3->transform.c;
  v23 = *(_OWORD *)&a3->transform.a;
  v24 = v14;
  v15 = *(_OWORD *)&a3->alpha;
  v25 = *(_OWORD *)&a3->transform.tx;
  v26 = v15;
  size = a3->frame.size;
  origin = a3->frame.origin;
  v20 = size;
  v17 = a3->size;
  center = a3->center;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[2] = __47__PXUIImageTile_didApplyGeometry_withUserData___block_invoke;
  v18[3] = &unk_1E51312B8;
  v18[4] = self;
  v22 = v17;
  v31 = v9;
  -[PXUIImageTile _performChanges:](self, "_performChanges:", v18);

}

- (void)willAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];

  v7 = a5;
  self->_animationFlags = 0;
  if ((objc_msgSend(v7, "flags") & 1) != 0)
  {
    self->_animationFlags |= 2uLL;
  }
  else
  {
    -[PXUIImageTile view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "flags") & 2) != 0)
    {
      objc_msgSend(v8, "bounds");
      if (a3->size.width == v10 && a3->size.height == v9)
      {
        -[PXUIImageTile _spec](self, "_spec");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "overlaySpecs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14)
          self->_animationFlags |= 1uLL;
      }
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__PXUIImageTile_willAnimateToGeometry_toUserData_withOptions___block_invoke;
  v15[3] = &unk_1E5149198;
  v15[4] = self;
  -[PXUIImageTile _performChanges:](self, "_performChanges:", v15);

}

- (void)didAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PXUIImageTile_didAnimateToGeometry_toUserData_withOptions___block_invoke;
  v5[3] = &unk_1E5149198;
  v5[4] = self;
  -[PXUIImageTile _performChanges:](self, "_performChanges:", v5, a4, a5);
}

- (void)setImageRequester:(id)a3
{
  PXImageRequester *v5;
  PXImageRequester *imageRequester;
  _QWORD v7[5];

  v5 = (PXImageRequester *)a3;
  imageRequester = self->_imageRequester;
  if (imageRequester != v5)
  {
    -[PXImageRequester unregisterChangeObserver:context:](imageRequester, "unregisterChangeObserver:context:", self, PXImageRequesterObservationContext);
    objc_storeStrong((id *)&self->_imageRequester, a3);
    -[PXImageRequester registerChangeObserver:context:](self->_imageRequester, "registerChangeObserver:context:", self, PXImageRequesterObservationContext);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__PXUIImageTile_setImageRequester___block_invoke;
    v7[3] = &unk_1E5149198;
    v7[4] = self;
    -[PXUIImageTile _performChanges:](self, "_performChanges:", v7);
  }

}

- (void)setDrawsFocusRing:(BOOL)a3
{
  PXImageUIView *imageView;

  if (self->_drawsFocusRing != a3)
  {
    self->_drawsFocusRing = a3;
    imageView = self->_imageView;
    if (imageView)
      -[PXImageUIView setDrawsFocusRing:](imageView, "setDrawsFocusRing:");
  }
}

- (void)_setContentSize:(CGSize)a3
{
  if (a3.width != self->__contentSize.width || a3.height != self->__contentSize.height)
  {
    self->__contentSize = a3;
    -[PXUIImageTile _invalidateImageRequester](self, "_invalidateImageRequester");
  }
}

- (void)_setDisplayScale:(double)a3
{
  if (self->__displayScale != a3)
  {
    self->__displayScale = a3;
    -[PXUIImageTile _invalidateImageRequester](self, "_invalidateImageRequester");
  }
}

- (void)becomeReusable
{
  -[PXUIImageTile setImageRequester:](self, "setImageRequester:", 0);
  -[PXImageUIView setHidden:](self->_imageView, "setHidden:", 1);
}

- (void)prepareForReuse
{
  -[PXImageUIView setHidden:](self->_imageView, "setHidden:", 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v9 = a3;
  if ((void *)PXImageRequesterObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIImageTile.m"), 303, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 4) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__PXUIImageTile_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5149198;
    v12[4] = self;
    -[PXUIImageTile _performChanges:](self, "_performChanges:", v12);
  }

}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (BOOL)drawsFocusRing
{
  return self->_drawsFocusRing;
}

- (PXImageViewSpec)_spec
{
  return self->__spec;
}

- (CGSize)_contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->__contentSize.width;
  height = self->__contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)_displayScale
{
  return self->__displayScale;
}

- (CGRect)_contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__contentsRect.origin.x;
  y = self->__contentsRect.origin.y;
  width = self->__contentsRect.size.width;
  height = self->__contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)_animationCount
{
  return self->__animationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

uint64_t __46__PXUIImageTile_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateImage");
}

uint64_t __35__PXUIImageTile_setImageRequester___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateImageRequester");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateImage");
}

uint64_t __61__PXUIImageTile_didAnimateToGeometry_toUserData_withOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "_animationCount") - 1);
}

uint64_t __62__PXUIImageTile_willAnimateToGeometry_toUserData_withOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "_animationCount") + 1);
}

uint64_t __47__PXUIImageTile_didApplyGeometry_withUserData___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setContentSize:", *(double *)(a1 + 176), *(double *)(a1 + 184));
  objc_msgSend(*(id *)(a1 + 32), "_setDisplayScale:", *(double *)(a1 + 232));
  return objc_msgSend(*(id *)(a1 + 32), "_setContentsRect:", *(double *)(a1 + 192), *(double *)(a1 + 200), *(double *)(a1 + 208), *(double *)(a1 + 216));
}

uint64_t __21__PXUIImageTile_view__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateImageView");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateImage");
}

void __46__PXUIImageTile__updateImageRequesterIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v7 = a2;
  objc_msgSend(v7, "setContentSize:", v3, v4);
  objc_msgSend(v7, "setScale:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "bounds");
  objc_msgSend(v7, "setViewportSize:", v5, v6);

}

@end
