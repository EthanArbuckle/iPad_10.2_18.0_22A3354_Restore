@implementation PXPhotosKeyAssetSectionHeaderLayout

- (PXPhotosKeyAssetSectionHeaderLayout)initWithViewModel:(id)a3
{
  id v5;
  PXPhotosKeyAssetSectionHeaderLayout *v6;
  PXPhotosKeyAssetSectionHeaderLayout *v7;
  __int128 v8;
  uint64_t v9;
  PXNumberAnimator *bannerAppearanceAnimator;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  v6 = -[PXGLayout init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    v8 = *((_OWORD *)off_1E50B8778 + 1);
    *(_OWORD *)&v7->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
    *(_OWORD *)&v7->_sectionIndexPath.item = v8;
    v9 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    bannerAppearanceAnimator = v7->_bannerAppearanceAnimator;
    v7->_bannerAppearanceAnimator = (PXNumberAnimator *)v9;

    -[PXNumberAnimator registerChangeObserver:context:](v7->_bannerAppearanceAnimator, "registerChangeObserver:context:", v7, BannerAppearanceAnimatorObservationContext);
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateKeyAssetFetch](v7, "_invalidateKeyAssetFetch");
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateContentSize](v7, "_invalidateContentSize");
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateTitle](v7, "_invalidateTitle");
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateTitleMetrics](v7, "_invalidateTitleMetrics");
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateBannerView](v7, "_invalidateBannerView");
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateContent](v7, "_invalidateContent");
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateFloatParameters](v7, "_invalidateFloatParameters");
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateAnimations](v7, "_invalidateAnimations");
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
  }

  return v7;
}

- (void)setDataSource:(id)a3
{
  PXAssetsDataSource *v5;
  PXAssetsDataSource *v6;

  v5 = (PXAssetsDataSource *)a3;
  if (self->_dataSource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateKeyAssetFetch](self, "_invalidateKeyAssetFetch");
    v5 = v6;
  }

}

- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&self->_sectionIndexPath.dataSourceIdentifier, *(int64x2_t *)&a3->dataSourceIdentifier), (int32x4_t)vceqq_s64(*(int64x2_t *)&self->_sectionIndexPath.item, *(int64x2_t *)&a3->item))), 0xFuLL))) & 1) == 0)
  {
    v3 = *(_OWORD *)&a3->item;
    *(_OWORD *)&self->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&self->_sectionIndexPath.item = v3;
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateKeyAssetFetch](self, "_invalidateKeyAssetFetch");
  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *title;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      title = self->_title;
      self->_title = v6;

      -[PXPhotosKeyAssetSectionHeaderLayout _invalidateTitleMetrics](self, "_invalidateTitleMetrics");
      -[PXPhotosKeyAssetSectionHeaderLayout _bumpTitleVersion](self, "_bumpTitleVersion");
    }
  }

}

- (void)setTitleBaseFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_titleBaseFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_titleBaseFrame = &self->_titleBaseFrame;
  if (!CGRectEqualToRect(a3, self->_titleBaseFrame))
  {
    p_titleBaseFrame->origin.x = x;
    p_titleBaseFrame->origin.y = y;
    p_titleBaseFrame->size.width = width;
    p_titleBaseFrame->size.height = height;
    -[PXPhotosKeyAssetSectionHeaderLayout _updateContent](self, "_updateContent");
    -[PXPhotosKeyAssetSectionHeaderLayout _updateFloatParameters](self, "_updateFloatParameters");
  }
}

- (void)setTitleAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *titleAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_titleAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      titleAttributes = self->_titleAttributes;
      self->_titleAttributes = v6;

      -[PXPhotosKeyAssetSectionHeaderLayout _bumpTitleVersion](self, "_bumpTitleVersion");
    }
  }

}

- (void)setSpec:(id)a3
{
  PXPhotosLayoutSpec *v5;
  PXPhotosLayoutSpec *v6;

  v5 = (PXPhotosLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateTitleMetrics](self, "_invalidateTitleMetrics");
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateBannerView](self, "_invalidateBannerView");
    v5 = v6;
  }

}

- (void)setBannerProvider:(id)a3
{
  PXPhotosBannerProvider *v5;
  PXPhotosBannerProvider *v6;

  v5 = (PXPhotosBannerProvider *)a3;
  if (self->_bannerProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bannerProvider, a3);
    -[PXPhotosBannerProvider setInvalidationDelegate:](self->_bannerProvider, "setInvalidationDelegate:", self);
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateBannerRequest](self, "_invalidateBannerRequest");
    -[PXPhotosKeyAssetSectionHeaderLayout _loadBannerIfNecessary](self, "_loadBannerIfNecessary");
    v5 = v6;
  }

}

- (void)setBannerView:(id)a3
{
  PXPhotosBannerView *v5;
  PXPhotosBannerView *v6;

  v5 = (PXPhotosBannerView *)a3;
  if (self->_bannerView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bannerView, a3);
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateBannerView](self, "_invalidateBannerView");
    -[PXPhotosKeyAssetSectionHeaderLayout _bumpBannerVersion](self, "_bumpBannerVersion");
    v5 = v6;
  }

}

- (void)setShouldHideBanner:(BOOL)a3
{
  id v4;

  if (self->_shouldHideBanner != a3)
  {
    self->_shouldHideBanner = a3;
    -[PXPhotosKeyAssetSectionHeaderLayout bannerView](self, "bannerView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPhotosKeyAssetSectionHeaderLayout _transitionToBannerView:version:](self, "_transitionToBannerView:version:", v4, self->_currentBannerRequestVersion);

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout update]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXPhotosKeyAssetSectionHeaderLayout _updateKeyAssetFetch](self, "_updateKeyAssetFetch");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout update]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXPhotosKeyAssetSectionHeaderLayout _updateContentSize](self, "_updateContentSize");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout update]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXPhotosKeyAssetSectionHeaderLayout _updateTitle](self, "_updateTitle");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout update]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXPhotosKeyAssetSectionHeaderLayout _updateTitleMetrics](self, "_updateTitleMetrics");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout update]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v8 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXPhotosKeyAssetSectionHeaderLayout _updateBannerView](self, "_updateBannerView");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout update]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v9 & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXPhotosKeyAssetSectionHeaderLayout _updateContent](self, "_updateContent");
      v9 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout update]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 201, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v35.receiver = self;
  v35.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  -[PXGLayout update](&v35, sel_update);
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  if (self->_postUpdateFlags.needsUpdate)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout update]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 0;
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = -1;
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout update]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v11 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x400uLL;
    if ((v11 & 0x400) != 0)
    {
      p_postUpdateFlags->needsUpdate = v11 & 0xFFFFFFFFFFFFFBFFLL;
      -[PXPhotosKeyAssetSectionHeaderLayout _updateFloatParameters](self, "_updateFloatParameters");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout update]");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v12 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800uLL;
    if ((v12 & 0x800) != 0)
    {
      p_postUpdateFlags->needsUpdate = v12 & 0xFFFFFFFFFFFFF7FFLL;
      -[PXPhotosKeyAssetSectionHeaderLayout _updateAnimations](self, "_updateAnimations");
      v12 = p_postUpdateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    p_updateFlags->updated = 0;
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout update]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 210, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

    }
  }
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  -[PXGLayout willUpdate](&v7, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
  self->_postUpdateFlags.willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout willUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

  }
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  -[PXGLayout didUpdate](&v7, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout didUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.willPerformUpdate"));

  }
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXPhotosKeyAssetSectionHeaderLayout _invalidateContentSize](self, "_invalidateContentSize");
  -[PXPhotosKeyAssetSectionHeaderLayout _invalidateTitleMetrics](self, "_invalidateTitleMetrics");
  -[PXPhotosKeyAssetSectionHeaderLayout _invalidateBannerView](self, "_invalidateBannerView");
  -[PXPhotosKeyAssetSectionHeaderLayout _invalidateFloatParameters](self, "_invalidateFloatParameters");
}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  -[PXGLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXPhotosKeyAssetSectionHeaderLayout _invalidateFloatParameters](self, "_invalidateFloatParameters");
}

- (void)appearStateDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosKeyAssetSectionHeaderLayout;
  -[PXGLayout appearStateDidChange](&v3, sel_appearStateDidChange);
  -[PXPhotosKeyAssetSectionHeaderLayout _loadBannerIfNecessary](self, "_loadBannerIfNecessary");
}

- (void)_invalidateKeyAssetFetch
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout _invalidateKeyAssetFetch]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 246, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateKeyAssetFetch
{
  void *v3;
  void *v4;
  PXDisplayAssetFetchResult *v5;
  PXDisplayAssetFetchResult *keyAssetFetch;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[PXDisplayAssetFetchResult firstObject](self->_keyAssetFetch, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosKeyAssetSectionHeaderLayout dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosKeyAssetSectionHeaderLayout sectionIndexPath](self, "sectionIndexPath");
  objc_msgSend(v4, "keyAssetsInSectionIndexPath:", &v13);
  v5 = (PXDisplayAssetFetchResult *)objc_claimAutoreleasedReturnValue();
  keyAssetFetch = self->_keyAssetFetch;
  self->_keyAssetFetch = v5;

  -[PXDisplayAssetFetchResult firstObject](self->_keyAssetFetch, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  v9 = v8;
  if (v7 == v8)
  {

  }
  else
  {
    if (v8)
      v10 = v7 == 0;
    else
      v10 = 1;
    if (v10)
    {

LABEL_12:
      -[PXPhotosKeyAssetSectionHeaderLayout _bumpAssetVersion](self, "_bumpAssetVersion");
      goto LABEL_13;
    }
    v11 = objc_msgSend(v7, "isContentEqualTo:", v8);
    v12 = v11;
    if (!v11)
      v12 = objc_msgSend(v9, "isContentEqualTo:", v7);

    if (v12 != 2)
      goto LABEL_12;
  }
LABEL_13:

}

- (void)_invalidateContentSize
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout _invalidateContentSize]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 259, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContentSize
{
  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXGLayout setContentSize:](self, "setContentSize:");
}

- (void)_invalidateTitle
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout _invalidateTitle]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 270, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[PXPhotosKeyAssetSectionHeaderLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosKeyAssetSectionHeaderLayout dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v7 = v8;
  else
    v7 = v6;
  -[PXPhotosKeyAssetSectionHeaderLayout setTitle:](self, "setTitle:", v7);

}

- (void)_invalidateTitleMetrics
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout _invalidateTitleMetrics]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 282, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateTitleMetrics
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  -[PXPhotosKeyAssetSectionHeaderLayout spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v5;
  objc_msgSend(v4, "leading");
  v8 = v6 + v7;
  objc_msgSend(v3, "headerTitleLeadingSpacing");
  v10 = v9;
  objc_msgSend(v3, "headerTitleButtonAlignmentSpacing");
  v12 = v10 + v11;
  -[PXGLayout referenceSize](self, "referenceSize");
  v14 = v13 + v12 * -2.0;
  v15 = *MEMORY[0x1E0DC1138];
  v25[0] = v4;
  v16 = *MEMORY[0x1E0DC1140];
  v24[0] = v15;
  v24[1] = v16;
  objc_msgSend(v3, "headerTitleOverContentColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosKeyAssetSectionHeaderLayout setTitleAttributes:](self, "setTitleAttributes:", v18);
  -[PXPhotosKeyAssetSectionHeaderLayout title](self, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 35, v18, 0, v14, v8 * 1.1);
  v21 = v20;
  v23 = v22;

  -[PXPhotosKeyAssetSectionHeaderLayout setTitleBaseFrame:](self, "setTitleBaseFrame:", v12, 0.0, v21, v23);
}

- (void)_invalidateBannerView
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout _invalidateBannerView]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 309, CFSTR("invalidating %lu after it already has been updated"), 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 16;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateBannerView
{
  void *v3;
  id v4;

  -[PXPhotosKeyAssetSectionHeaderLayout bannerView](self, "bannerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosKeyAssetSectionHeaderLayout spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpec:", v3);

  -[PXGLayout referenceSize](self, "referenceSize");
  objc_msgSend(v4, "sizeThatFits:");
  -[PXPhotosKeyAssetSectionHeaderLayout setBannerViewSize:](self, "setBannerViewSize:");

}

- (void)setBannerViewSize:(CGSize)a3
{
  if (self->_bannerViewSize.width != a3.width || self->_bannerViewSize.height != a3.height)
  {
    self->_bannerViewSize = a3;
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateFloatParameters](self, "_invalidateFloatParameters");
  }
}

- (void)_invalidateContent
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 329, CFSTR("invalidating %lu after it already has been updated"), 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 32;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContent
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[16];

  if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") != 3)
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", 0, 3, &__block_literal_global_158631, 0);
  -[PXGLayout displayScale](self, "displayScale");
  v22 = v3;
  -[PXPhotosKeyAssetSectionHeaderLayout _keyAssetSize](self, "_keyAssetSize");
  v5 = v4;
  v7 = v6;
  -[PXPhotosKeyAssetSectionHeaderLayout _bestCropRectForAspectRatio:](self, "_bestCropRectForAspectRatio:", v4 / v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PXPhotosKeyAssetSectionHeaderLayout titleBaseFrame](self, "titleBaseFrame");
  v17 = v16;
  v19 = v18;
  -[PXPhotosKeyAssetSectionHeaderLayout bannerViewSize](self, "bannerViewSize");
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __53__PXPhotosKeyAssetSectionHeaderLayout__updateContent__block_invoke_2;
  v23[3] = &unk_1E512F390;
  v23[5] = v9;
  v23[6] = v11;
  v23[7] = v13;
  v23[8] = v15;
  *(double *)&v23[9] = v5;
  *(double *)&v23[10] = v7;
  v23[4] = self;
  v23[11] = v22;
  v23[12] = v17;
  v23[13] = v19;
  v23[14] = v20;
  v23[15] = v21;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", 0x300000000, v23);
}

- (void)_invalidateAnimations
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x800) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout _invalidateAnimations]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 369, CFSTR("invalidating %lu after it already has been updated"), 2048);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 2048;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateAnimations
{
  double v3;
  _QWORD v4[6];

  -[PXNumberAnimator presentationValue](self->_bannerAppearanceAnimator, "presentationValue");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__PXPhotosKeyAssetSectionHeaderLayout__updateAnimations__block_invoke;
  v4[3] = &__block_descriptor_48_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
  *(double *)&v4[4] = 1.0 - v3;
  *(double *)&v4[5] = v3;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", 0x300000000, v4);
}

- (void)_invalidateFloatParameters
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x400;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x400) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosKeyAssetSectionHeaderLayout _invalidateFloatParameters]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 383, CFSTR("invalidating %lu after it already has been updated"), 1024);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 1024;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateFloatParameters
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  CGFloat MaxY;
  uint64_t v25;
  _QWORD v26[16];
  CGRect v27;

  -[PXPhotosKeyAssetSectionHeaderLayout _floatOffset](self, "_floatOffset");
  v4 = v3;
  v5 = -v3;
  -[PXGLayout contentSize](self, "contentSize");
  v7 = v6;
  -[PXGLayout contentSize](self, "contentSize");
  v9 = v8 + -2.0;
  -[PXPhotosKeyAssetSectionHeaderLayout titleBaseFrame](self, "titleBaseFrame");
  v11 = v10;
  v25 = v12;
  v14 = v13;
  -[PXGLayout contentSize](self, "contentSize");
  v16 = v15 - v14 + -10.0 - v4;
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v18 = v17 + 10.0;
  if (v16 >= v18)
    v19 = v16;
  else
    v19 = v18;
  -[PXPhotosKeyAssetSectionHeaderLayout setShouldHideBanner:](self, "setShouldHideBanner:", v16 != v19);
  -[PXPhotosKeyAssetSectionHeaderLayout bannerViewSize](self, "bannerViewSize");
  v21 = v20;
  v23 = v22;
  v27.origin.x = 0.0;
  v27.origin.y = v5;
  v27.size.width = v7;
  v27.size.height = v9;
  MaxY = CGRectGetMaxY(v27);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __61__PXPhotosKeyAssetSectionHeaderLayout__updateFloatParameters__block_invoke;
  v26[3] = &__block_descriptor_128_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
  v26[4] = 0;
  *(double *)&v26[5] = v5;
  *(CGFloat *)&v26[6] = v7;
  *(double *)&v26[7] = v9;
  v26[8] = v11;
  *(double *)&v26[9] = v19;
  v26[10] = v25;
  *(double *)&v26[11] = v14;
  v26[12] = 0;
  *(double *)&v26[13] = MaxY - v23;
  v26[14] = v21;
  *(double *)&v26[15] = v23;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", 0x300000000, v26);
}

- (void)_invalidateBannerRequest
{
  self->_desiredBannerRequestVersion = (self->_desiredBannerRequestVersion + 1) % 1000;
}

- (void)_loadBannerIfNecessary
{
  void *v3;
  void *desiredBannerRequestVersion;
  _QWORD v5[4];
  id v6[2];
  id location;

  if (self->_currentBannerRequestVersion != self->_desiredBannerRequestVersion
    && -[PXGLayout appearState](self, "appearState") == 1)
  {
    -[PXPhotosKeyAssetSectionHeaderLayout bannerProvider](self, "bannerProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_initWeak(&location, self);
      desiredBannerRequestVersion = (void *)self->_desiredBannerRequestVersion;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __61__PXPhotosKeyAssetSectionHeaderLayout__loadBannerIfNecessary__block_invoke;
      v5[3] = &unk_1E5140EA8;
      objc_copyWeak(v6, &location);
      v6[1] = desiredBannerRequestVersion;
      objc_msgSend(v3, "loadBannerView:", v5);
      objc_destroyWeak(v6);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PXPhotosKeyAssetSectionHeaderLayout _transitionToBannerView:version:](self, "_transitionToBannerView:version:", 0, self->_desiredBannerRequestVersion);
    }

  }
}

- (void)_transitionToBannerView:(id)a3 version:(int64_t)a4
{
  _BOOL4 v7;
  int v8;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 434, CFSTR("%s must be called on the main thread"), "-[PXPhotosKeyAssetSectionHeaderLayout _transitionToBannerView:version:]");

  }
  if (self->_desiredBannerRequestVersion == a4)
  {
    self->_currentBannerRequestVersion = a4;
    v7 = -[PXPhotosKeyAssetSectionHeaderLayout shouldHideBanner](self, "shouldHideBanner");
    if (v13)
      v8 = v7;
    else
      v8 = 1;
    if (!self->_isDisplayingBanner && v8 == 0)
    {
      v11 = &__block_literal_global_42;
      v10 = 1;
    }
    else
    {
      if (!self->_isDisplayingBanner)
        v8 = 0;
      if (v8 != 1)
        goto LABEL_17;
      v10 = 0;
      v11 = &__block_literal_global_43_158622;
    }
    self->_isDisplayingBanner = v10;
    -[PXNumberAnimator performChangesWithDuration:curve:changes:](self->_bannerAppearanceAnimator, "performChangesWithDuration:curve:changes:", 1, v11, 0.2);
LABEL_17:
    -[PXPhotosKeyAssetSectionHeaderLayout setBannerView:](self, "setBannerView:", v13);
  }

}

- (double)_floatOffset
{
  double v2;

  -[PXGLayout visibleRect](self, "visibleRect");
  return fmax(v2, 0.0);
}

- (CGSize)_keyAssetSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[PXGLayout contentSize](self, "contentSize");
  v4 = v3;
  -[PXGLayout contentSize](self, "contentSize");
  v6 = v5 + -2.0;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGRect)_bestCropRectForAspectRatio:(double)a3
{
  void *v4;
  double v5;
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
  CGRect result;

  -[PXDisplayAssetFetchResult firstObject](self->_keyAssetFetch, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestCropRectForAspectRatioV2:verticalContentMode:cropMode:", 2, 1, a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_bumpTitleVersion
{
  self->_titleVersion = self->_titleVersion
                      + 1
                      - 1000 * ((4294968 * (unint64_t)(self->_titleVersion + 1)) >> 32);
  -[PXPhotosKeyAssetSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
}

- (void)_bumpAssetVersion
{
  self->_keyAssetVersion = self->_keyAssetVersion
                         + 1
                         - 1000 * ((4294968 * (unint64_t)(self->_keyAssetVersion + 1)) >> 32);
  -[PXPhotosKeyAssetSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
}

- (void)_bumpBannerVersion
{
  self->_bannerVersion = self->_bannerVersion
                       + 1
                       - 1000 * ((4294968 * (unint64_t)(self->_bannerVersion + 1)) >> 32);
  -[PXPhotosKeyAssetSectionHeaderLayout _invalidateContent](self, "_invalidateContent");
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 1;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  PXDisplayAssetFetchResult *keyAssetFetch;

  if (-[PXDisplayAssetFetchResult count](self->_keyAssetFetch, "count", a3, a4) < 1)
    keyAssetFetch = 0;
  else
    keyAssetFetch = self->_keyAssetFetch;
  return keyAssetFetch;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return (Class)objc_opt_class();
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v5;
  PXGSingleViewUserData *v6;
  void *v7;
  PXGSingleViewUserData *v8;

  -[PXPhotosKeyAssetSectionHeaderLayout bannerView](self, "bannerView", *(_QWORD *)&a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [PXGSingleViewUserData alloc];
    -[PXPhotosKeyAssetSectionHeaderLayout bannerView](self, "bannerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXGSingleViewUserData initWithContentView:](v6, "initWithContentView:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v8;
  id v9;

  v9 = a3;
  if ((void *)BannerAppearanceAnimatorObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosKeyAssetSectionHeaderLayout.m"), 538, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXPhotosKeyAssetSectionHeaderLayout _invalidateAnimations](self, "_invalidateAnimations");

}

- (void)photosBannerProviderInvalidateLoadedBanner:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotosKeyAssetSectionHeaderLayout bannerProvider](self, "bannerProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PXPhotosKeyAssetSectionHeaderLayout _invalidateBannerRequest](self, "_invalidateBannerRequest");
    -[PXPhotosKeyAssetSectionHeaderLayout _loadBannerIfNecessary](self, "_loadBannerIfNecessary");
  }
}

- (id)axSpriteIndexes
{
  if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"))
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
  else
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isInSelectMode
{
  return self->isInSelectMode;
}

- (void)setIsInSelectMode:(BOOL)a3
{
  self->isInSelectMode = a3;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->selectionSnapshot;
}

- (void)setSelectionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->selectionSnapshot, a3);
}

- (PXPhotosLayoutSpec)spec
{
  return self->_spec;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[32].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[32].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXPhotosBannerProvider)bannerProvider
{
  return self->_bannerProvider;
}

- (NSString)title
{
  return self->_title;
}

- (CGRect)titleBaseFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_titleBaseFrame.origin.x;
  y = self->_titleBaseFrame.origin.y;
  width = self->_titleBaseFrame.size.width;
  height = self->_titleBaseFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSDictionary)titleAttributes
{
  return self->_titleAttributes;
}

- (PXPhotosBannerView)bannerView
{
  return self->_bannerView;
}

- (CGSize)bannerViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_bannerViewSize.width;
  height = self->_bannerViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)shouldHideBanner
{
  return self->_shouldHideBanner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_titleAttributes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bannerProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_bannerAppearanceAnimator, 0);
  objc_storeStrong((id *)&self->_keyAssetFetch, 0);
}

uint64_t __71__PXPhotosKeyAssetSectionHeaderLayout__transitionToBannerView_version___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 0.0);
}

uint64_t __71__PXPhotosKeyAssetSectionHeaderLayout__transitionToBannerView_version___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 1.0);
}

void __61__PXPhotosKeyAssetSectionHeaderLayout__loadBannerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_transitionToBannerView:version:", v4, *(_QWORD *)(a1 + 40));

}

float32x2_t __61__PXPhotosKeyAssetSectionHeaderLayout__updateFloatParameters__block_invoke(double *a1, uint64_t a2, float32x2_t *a3)
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  float64x2_t v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  float64x2_t v34;
  float32x2_t result;
  CGFloat Width;
  CGFloat v37;
  CGFloat v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v39.origin.x = v5;
  v39.origin.y = v6;
  v39.size.width = v7;
  v39.size.height = v8;
  MidX = CGRectGetMidX(v39);
  v40.origin.x = v5;
  v40.origin.y = v6;
  v40.size.width = v7;
  v40.size.height = v8;
  MidY = CGRectGetMidY(v40);
  v41.origin.x = v5;
  v41.origin.y = v6;
  v41.size.width = v7;
  v41.size.height = v8;
  Width = CGRectGetWidth(v41);
  v42.origin.x = v5;
  v42.origin.y = v6;
  v42.size.width = v7;
  v42.size.height = v8;
  Height = CGRectGetHeight(v42);
  v12.f64[0] = Width;
  v12.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[2] = (float32x2_t)0xBFF0000000000000;
  a3[3] = vcvt_f32_f64(v12);
  v13 = a1[8];
  v14 = a1[9];
  v15 = a1[10];
  v16 = a1[11];
  v17 = v13;
  v12.f64[0] = v14;
  v18 = v15;
  v19 = v16;
  v20 = CGRectGetMidX(*(CGRect *)((char *)&v12 - 8));
  v43.origin.x = v13;
  v43.origin.y = v14;
  v43.size.width = v15;
  v43.size.height = v16;
  v21 = CGRectGetMidY(v43);
  v44.origin.x = v13;
  v44.origin.y = v14;
  v44.size.width = v15;
  v44.size.height = v16;
  v37 = CGRectGetWidth(v44);
  v45.origin.x = v13;
  v45.origin.y = v14;
  v45.size.width = v15;
  v45.size.height = v16;
  v22 = CGRectGetHeight(v45);
  v23.f64[0] = v37;
  v23.f64[1] = v22;
  *(CGFloat *)&a3[4] = v20;
  *(CGFloat *)&a3[5] = v21;
  a3[6] = (float32x2_t)0xBFF19999A0000000;
  a3[7] = vcvt_f32_f64(v23);
  v24 = a1[12];
  v25 = a1[13];
  v26 = a1[14];
  v27 = a1[15];
  v28 = v24;
  v23.f64[0] = v25;
  v29 = v26;
  v30 = v27;
  v31 = CGRectGetMidX(*(CGRect *)((char *)&v23 - 8));
  v46.origin.x = v24;
  v46.origin.y = v25;
  v46.size.width = v26;
  v46.size.height = v27;
  v32 = CGRectGetMidY(v46);
  v47.origin.x = v24;
  v47.origin.y = v25;
  v47.size.width = v26;
  v47.size.height = v27;
  v38 = CGRectGetWidth(v47);
  v48.origin.x = v24;
  v48.origin.y = v25;
  v48.size.width = v26;
  v48.size.height = v27;
  v33 = CGRectGetHeight(v48);
  v34.f64[0] = v38;
  v34.f64[1] = v33;
  result = vcvt_f32_f64(v34);
  *(CGFloat *)&a3[8] = v31;
  *(CGFloat *)&a3[9] = v32;
  a3[10] = 0;
  a3[11] = result;
  return result;
}

float __56__PXPhotosKeyAssetSectionHeaderLayout__updateAnimations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v4;
  float v5;
  float result;

  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 32);
  *(float *)(a4 + 160) = v5;
  result = v4;
  *(float *)(a4 + 320) = result;
  return result;
}

float32x2_t __53__PXPhotosKeyAssetSectionHeaderLayout__updateContent__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float32x2_t *a5)
{
  float v5;
  float v6;
  float v7;
  float32x2_t result;

  *(float32x4_t *)(a4 + 4) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 40)), *(float64x2_t *)(a1 + 56));
  a5->i16[0] = 512;
  v5 = *(double *)(a1 + 88);
  a5[1] = vmul_n_f32(vcvt_f32_f64(*(float64x2_t *)(a1 + 72)), v5);
  a5[4].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 32) + 904);
  a5[5].i16[0] = 768;
  v6 = *(double *)(a1 + 88);
  a5[6] = vmul_n_f32(vcvt_f32_f64(*(float64x2_t *)(a1 + 96)), v6);
  a5[9].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 32) + 906);
  a5[10].i16[0] = 2561;
  v7 = *(double *)(a1 + 88);
  result = vmul_n_f32(vcvt_f32_f64(*(float64x2_t *)(a1 + 112)), v7);
  a5[11] = result;
  a5[14].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 32) + 908);
  return result;
}

void __53__PXPhotosKeyAssetSectionHeaderLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;

  v3 = (HIDWORD(a2) + a2);
  if (v3 > a2)
  {
    v4 = v3 - a2;
    v5 = *((_OWORD *)off_1E50B83A0 + 6);
    v6 = *((_OWORD *)off_1E50B83A0 + 7);
    v7 = 160 * a2;
    v8 = *((_OWORD *)off_1E50B83A0 + 8);
    v9 = *((_OWORD *)off_1E50B83A0 + 9);
    v10 = *((_OWORD *)off_1E50B83A0 + 2);
    v11 = *((_OWORD *)off_1E50B83A0 + 3);
    v12 = *((_OWORD *)off_1E50B83A0 + 4);
    v13 = *((_OWORD *)off_1E50B83A0 + 5);
    v14 = *(_OWORD *)off_1E50B83A0;
    v15 = *((_OWORD *)off_1E50B83A0 + 1);
    do
    {
      v16 = (_OWORD *)(*(_QWORD *)(a3 + 24) + v7);
      v16[6] = v5;
      v16[7] = v6;
      v16[8] = v8;
      v16[9] = v9;
      v16[2] = v10;
      v16[3] = v11;
      v16[4] = v12;
      v16[5] = v13;
      *v16 = v14;
      v16[1] = v15;
      v7 += 160;
      --v4;
    }
    while (v4);
  }
}

@end
