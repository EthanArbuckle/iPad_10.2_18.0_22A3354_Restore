@implementation PXPhotosGridMessagesBodyLayout

- (PXPhotosGridMessagesBodyLayout)init
{
  PXPhotosGridMessagesBodyLayout *v2;
  PXPhotosGridMessagesBodyLayout *v3;
  void *v4;
  PXPhotosGridAssetDecorationSource *v5;
  PXPhotosGridAssetDecorationSource *assetDecorationSource;
  PXPhotosGridAssetDecorationSource *v7;
  NSShadow *v8;
  NSShadow *contentShadow;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXPhotosGridMessagesBodyLayout;
  v2 = -[PXGGridLayout init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXGGridLayout setMediaKind:](v2, "setMediaKind:", 2);
    -[PXGGridLayout setPresentationType:](v3, "setPresentationType:", 0);
    -[PXGItemsLayout setLazy:](v3, "setLazy:", 1);
    -[PXGLayout setContentSource:](v3, "setContentSource:", v3);
    -[PXGGridLayout setContentMode:](v3, "setContentMode:", 1);
    -[PXGGridLayout setEnablePerItemMargin:](v3, "setEnablePerItemMargin:", 1);
    +[PXMessagesUISettings sharedInstance](PXMessagesUISettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(PXPhotosGridAssetDecorationSource);
    -[PXPhotosGridAssetDecorationSource setDecoratedLayout:](v5, "setDecoratedLayout:", v3);
    -[PXPhotosGridAssetDecorationSource setForbiddenBadges:](v5, "setForbiddenBadges:", 0xFFFFFFFDFFFFFFFFLL);
    assetDecorationSource = v3->_assetDecorationSource;
    v3->_assetDecorationSource = v5;
    v7 = v5;

    v8 = (NSShadow *)objc_alloc_init(MEMORY[0x1E0DC1298]);
    contentShadow = v3->_contentShadow;
    v3->_contentShadow = v8;

    objc_msgSend(v4, "gridShadowXOffset");
    v11 = v10;
    objc_msgSend(v4, "gridShadowYOffset");
    -[NSShadow setShadowOffset:](v3->_contentShadow, "setShadowOffset:", v11, v12);
    objc_msgSend(v4, "gridShadowBlurRadius");
    -[NSShadow setShadowBlurRadius:](v3->_contentShadow, "setShadowBlurRadius:");
    v13 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v4, "gridShadowAlpha");
    objc_msgSend(v13, "colorWithWhite:alpha:", 0.0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSShadow setShadowColor:](v3->_contentShadow, "setShadowColor:", v15);

  }
  return v3;
}

- (void)setSpec:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  PXPhotosGridMessagesLayoutSpec *v9;

  v9 = (PXPhotosGridMessagesLayoutSpec *)a3;
  if (self->_spec != v9)
  {
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXPhotosGridMessagesLayoutSpec interItemSpacing](v9, "interItemSpacing");
    -[PXGGridLayout setInterItemSpacing:](self, "setInterItemSpacing:");
    -[PXPhotosGridMessagesLayoutSpec padding](v9, "padding");
    -[PXGGridLayout setPadding:](self, "setPadding:");
    -[PXPhotosGridMessagesLayoutSpec itemCornerRadius](v9, "itemCornerRadius");
    *(float *)&v5 = v5;
    LODWORD(v6) = LODWORD(v5);
    LODWORD(v7) = LODWORD(v5);
    LODWORD(v8) = LODWORD(v5);
    -[PXGGridLayout setItemCornerRadius:](self, "setItemCornerRadius:", v5, v6, v7, v8);
    -[PXPhotosGridMessagesBodyLayout _updateNumberOfColumns](self, "_updateNumberOfColumns");
  }

}

- (void)_updateNumberOfColumns
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[PXPhotosGridMessagesBodyLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "numberOfSections") < 1)
  {
    v5 = 0;
  }
  else
  {
    -[PXPhotosGridMessagesBodyLayout dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfItemsInSection:", 0);

  }
  -[PXPhotosGridMessagesBodyLayout spec](self, "spec");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PXPhotosGridMessagesBodyLayout spec](self, "spec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGGridLayout setNumberOfColumns:](self, "setNumberOfColumns:", objc_msgSend(v6, "numberOfColumnsForNumberOfItems:", v5));

  }
  else
  {
    -[PXGGridLayout setNumberOfColumns:](self, "setNumberOfColumns:", 4);
  }

}

- (void)setDataSource:(id)a3 section:(int64_t)a4
{
  id v7;
  void *v8;
  PXDisplayAssetFetchResult *cachedClampedFetchResult;
  id v10;

  v7 = a3;
  if (*(_OWORD *)&self->_section != __PAIR128__((unint64_t)v7, a4))
  {
    v10 = v7;
    objc_storeStrong((id *)&self->_dataSource, a3);
    self->_section = a4;
    -[PXPhotosGridMessagesBodyLayout assetDecorationSource](self, "assetDecorationSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDataSource:section:", v10, a4);

    self->_cachedClampedItemRange = (_NSRange)xmmword_1A7C0C330;
    cachedClampedFetchResult = self->_cachedClampedFetchResult;
    self->_cachedClampedFetchResult = 0;

    -[PXPhotosGridMessagesBodyLayout _updateNumberOfColumns](self, "_updateNumberOfColumns");
    v7 = v10;
  }

}

- (id)assetForItemIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v8[4];

  -[PXPhotosGridMessagesBodyLayout dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = objc_msgSend(v5, "identifier");
  v8[1] = -[PXPhotosGridMessagesBodyLayout section](self, "section");
  v8[2] = a3;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "assetAtItemIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)assetReferenceForItemIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v8[4];

  -[PXPhotosGridMessagesBodyLayout dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = objc_msgSend(v5, "identifier");
  v8[1] = -[PXPhotosGridMessagesBodyLayout section](self, "section");
  v8[2] = a3;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "assetReferenceAtItemIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  BOOL v9;
  PXDisplayAssetFetchResult *cachedClampedFetchResult;
  PXDisplayAssetFetchResult *v11;
  void *v12;
  void *v13;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[2];
  int64x2_t v21;

  v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridMessagesBodyLayout.m"), 106, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layout"), v17, v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridMessagesBodyLayout.m"), 106, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layout"), v17);
  }

LABEL_3:
  v7 = objc_msgSend(v6, "itemForSpriteIndex:", 0);
  v8 = objc_msgSend(v6, "numberOfItems") - v7;
  v9 = self->_cachedClampedItemRange.location == v7 && self->_cachedClampedItemRange.length == v8;
  if (v9 && (cachedClampedFetchResult = self->_cachedClampedFetchResult) != 0)
  {
    v11 = cachedClampedFetchResult;
  }
  else
  {
    -[PXPhotosGridMessagesBodyLayout dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = objc_msgSend(v12, "identifier");
    v20[1] = -[PXPhotosGridMessagesBodyLayout section](self, "section");
    v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_msgSend(v12, "assetsInSectionIndexPath:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PXDisplayAssetFetchResultSubfetchResultWithRange();
    v11 = (PXDisplayAssetFetchResult *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_cachedClampedFetchResult, v11);
    self->_cachedClampedItemRange.location = v7;
    self->_cachedClampedItemRange.length = v8;

  }
  return v11;
}

- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3
{
  return 1;
}

- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return self->_contentShadow;
}

- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v4;
  double v5;
  double v6;

  -[PXPhotosGridMessagesBodyLayout spec](self, "spec", *(_QWORD *)&a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemCornerRadius");
  v6 = v5;

  return v6;
}

- (PXPhotosGridAssetDecorationSource)assetDecorationSource
{
  return self->_assetDecorationSource;
}

- (int64_t)section
{
  return self->_section;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (PXPhotosGridMessagesLayoutSpec)spec
{
  return self->_spec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_assetDecorationSource, 0);
  objc_storeStrong((id *)&self->_contentShadow, 0);
  objc_storeStrong((id *)&self->_cachedClampedFetchResult, 0);
}

@end
