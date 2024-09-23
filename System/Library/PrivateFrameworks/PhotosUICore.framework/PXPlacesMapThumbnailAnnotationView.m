@implementation PXPlacesMapThumbnailAnnotationView

- (PXPlacesMapThumbnailAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4 extendedTraitCollection:(id)a5 imageCache:(id)a6 countLabelStyle:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PXPlacesMapThumbnailAnnotationView *v16;
  PXPlacesMapThumbnailAnnotationView *v17;
  uint64_t v18;
  UILabel *countLabel;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  UIImageView *countLabelBackgroundImageView;
  void *v29;
  void *v30;
  uint64_t v31;
  id extendedTraitObserver;
  _QWORD aBlock[4];
  id v35;
  id location;
  objc_super v37;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v37.receiver = self;
  v37.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  v16 = -[MKAnnotationView initWithAnnotation:reuseIdentifier:](&v37, sel_initWithAnnotation_reuseIdentifier_, v12, v13);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_extendedTraitCollection, a5);
    objc_storeStrong((id *)&v17->_imageCache, a6);
    v17->_geotaggablesCount = 0;
    v17->_countLabelStyle = a7;
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    countLabel = v17->_countLabel;
    v17->_countLabel = (UILabel *)v18;

    _FontForCountLabelStyle(a7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17->_countLabel, "setFont:", v20);

    if (a7)
    {
      if (a7 == 1)
      {
        v21 = 4;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSTextAlignment _TextAlignmentForCountLabelStyle(PXPlacesMapCountLabelStyle)");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PXPlacesMapThumbnailAnnotationView.m"), 53, CFSTR("Unsupported style: %@"), v24);

        v21 = 0;
      }
    }
    else
    {
      v21 = 1;
    }
    -[UILabel setTextAlignment:](v17->_countLabel, "setTextAlignment:", v21);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17->_countLabel, "setTextColor:", v25);

    -[UILabel setHidden:](v17->_countLabel, "setHidden:", 1);
    if (!a7)
    {
      v26 = objc_alloc(MEMORY[0x1E0DC3890]);
      v27 = objc_msgSend(v26, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      countLabelBackgroundImageView = v17->_countLabelBackgroundImageView;
      v17->_countLabelBackgroundImageView = (UIImageView *)v27;

      -[PXPlacesMapThumbnailAnnotationView addSubview:](v17, "addSubview:", v17->_countLabelBackgroundImageView);
    }
    -[PXPlacesMapThumbnailAnnotationView addSubview:](v17, "addSubview:", v17->_countLabel);
    objc_initWeak(&location, v17);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __124__PXPlacesMapThumbnailAnnotationView_initWithAnnotation_reuseIdentifier_extendedTraitCollection_imageCache_countLabelStyle___block_invoke;
    aBlock[3] = &unk_1E51441D8;
    objc_copyWeak(&v35, &location);
    v29 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserverForName:object:queue:usingBlock:", CFSTR("kPKExtendedTraitCollectionChangedNotification"), 0, 0, v29);
    v31 = objc_claimAutoreleasedReturnValue();
    extendedTraitObserver = v17->_extendedTraitObserver;
    v17->_extendedTraitObserver = (id)v31;

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v17;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[PXPlacesMapThumbnailAnnotationView extendedTraitObserver](self, "extendedTraitObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapThumbnailAnnotationView extendedTraitObserver](self, "extendedTraitObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  -[MKAnnotationView dealloc](&v6, sel_dealloc);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  v4 = a3;
  -[PXPlacesMapThumbnailAnnotationView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[PXPlacesMapThumbnailAnnotationView traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[PXPlacesMapThumbnailAnnotationView _updatePlaceholderImageIfNeeded](self, "_updatePlaceholderImageIfNeeded");
}

- (void)setAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  -[MKAnnotationView annotation](self, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  -[MKAnnotationView setAnnotation:](&v11, sel_setAnnotation_, v4);
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EEB5F3D8))
  {
    objc_msgSend(v4, "geotaggables");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_geotaggablesCount = objc_msgSend(v6, "count");

  }
  -[PXPlacesMapThumbnailAnnotationView extendedTraitCollection](self, "extendedTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXPlacesMapThumbnailAnnotationView thumbnailCurationDelegate](self, "thumbnailCurationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = 0;
    }
    else
    {
      -[MKAnnotationView image](self, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      if (v10 && v5)
        v9 = objc_msgSend(v5, "isEqual:", v4);

    }
    -[PXPlacesMapThumbnailAnnotationView _reloadData:](self, "_reloadData:", v9 ^ 1u);
  }

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  -[MKAnnotationView prepareForReuse](&v5, sel_prepareForReuse);
  -[PXPlacesMapThumbnailAnnotationView setImage:](self, "setImage:", 0);
  -[PXPlacesMapThumbnailAnnotationView countLabel](self, "countLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_1E5149688);

  -[PXPlacesMapThumbnailAnnotationView _hideCountLabel](self, "_hideCountLabel");
  -[PXPlacesMapThumbnailAnnotationView displayCompletion](self, "displayCompletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[PXPlacesMapThumbnailAnnotationView setDisplayCompletion:](self, "setDisplayCompletion:", 0);
}

- (void)setExtendedTraitCollection:(id)a3
{
  double v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_extendedTraitCollection, a3);
  objc_msgSend(v7, "displayScale");
  if (v5 != 0.0)
  {
    -[MKAnnotationView image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[PXPlacesMapThumbnailAnnotationView _reloadData:](self, "_reloadData:", 1);
  }

}

- (id)primaryGeotaggable
{
  void *v2;
  void *v3;
  void *v4;

  -[MKAnnotationView annotation](self, "annotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geotaggables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userCacheKey
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXPlacesMapThumbnailAnnotationView extendedTraitCollection](self, "extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;
  -[PXPlacesMapThumbnailAnnotationView extendedTraitCollection](self, "extendedTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "layoutSizeClass");
  -[PXPlacesMapThumbnailAnnotationView extendedTraitCollection](self, "extendedTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%f-%ld-%ld"), v6, v8, objc_msgSend(v9, "layoutSizeSubclass"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UIImageView)countLabelBackgroundImageView
{
  void *v3;
  _QWORD block[5];

  -[UIImageView image](self->_countLabelBackgroundImageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PXPlacesMapThumbnailAnnotationView_countLabelBackgroundImageView__block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    if (countLabelBackgroundImageView_token != -1)
      dispatch_once(&countLabelBackgroundImageView_token, block);
    -[UIImageView setImage:](self->_countLabelBackgroundImageView, "setImage:", countLabelBackgroundImageView_stretchablecountLabelBgImage);
  }
  return self->_countLabelBackgroundImageView;
}

- (id)_countLabelBackgroundColor
{
  if (_countLabelBackgroundColor_token != -1)
    dispatch_once(&_countLabelBackgroundColor_token, &__block_literal_global_276786);
  return (id)_countLabelBackgroundColor_countLabelBackgroundColor;
}

- (void)_reloadData:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id v10[5];
  id v11;
  PXPlacesMapThumbnailAnnotationView *v12;
  id v13[5];
  id v14;
  id location;

  if (!self->_geotaggablesCount)
  {
    objc_initWeak(&location, self);
    v13[1] = (id)MEMORY[0x1E0C809B0];
    v13[2] = (id)3221225472;
    v13[3] = __50__PXPlacesMapThumbnailAnnotationView__reloadData___block_invoke;
    v13[4] = &unk_1E5148D30;
    v9 = &v14;
    objc_copyWeak(&v14, &location);
    px_dispatch_on_main_queue();
LABEL_8:
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
    return;
  }
  if (!a3)
  {
    objc_initWeak(&location, self);
    v9 = v10;
    objc_copyWeak(v10, &location);
    px_dispatch_on_main_queue();
    goto LABEL_8;
  }
  -[PXPlacesMapThumbnailAnnotationView primaryGeotaggable](self, "primaryGeotaggable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapThumbnailAnnotationView imageCache](self, "imageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_10:
    -[PXPlacesMapThumbnailAnnotationView _fetchImageWithNetworkAccessAllowed:](self, "_fetchImageWithNetworkAccessAllowed:", 0);
    goto LABEL_11;
  }
  -[PXPlacesMapThumbnailAnnotationView userCacheKey](self, "userCacheKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapThumbnailAnnotationView imageCache](self, "imageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedRenderedImageForGeotaggble:andKey:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {

    goto LABEL_10;
  }
  objc_initWeak(&location, self);
  v10[1] = (id)MEMORY[0x1E0C809B0];
  v10[2] = (id)3221225472;
  v10[3] = __50__PXPlacesMapThumbnailAnnotationView__reloadData___block_invoke_2;
  v10[4] = &unk_1E5147B18;
  objc_copyWeak(v13, &location);
  v11 = v8;
  v12 = self;
  px_dispatch_on_main_queue();

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

LABEL_11:
}

- (id)preferredGeotaggableWithFallbackGeotaggable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[MKAnnotationView annotation](self, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_8;
  }
  -[PXPlacesMapThumbnailAnnotationView thumbnailCurationDelegate](self, "thumbnailCurationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_8:
    v12 = v4;
    goto LABEL_9;
  }
  -[MKAnnotationView annotation](self, "annotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "geotaggables");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapThumbnailAnnotationView thumbnailCurationDelegate](self, "thumbnailCurationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "curatedGeotaggableFromSet:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v10;
  else
    v11 = v4;
  v12 = v11;

LABEL_9:
  return v12;
}

- (void)_fetchImageWithNetworkAccessAllowed:(BOOL)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  -[MKAnnotationView annotation](self, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "_thumbnailSelectionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PXPlacesMapThumbnailAnnotationView__fetchImageWithNetworkAccessAllowed___block_invoke;
  v9[3] = &unk_1E5144F48;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v12 = a3;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_fetchImageForGeotaggable:(id)a3 renderer:(id)a4 networkAccessAllowed:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26[5];
  BOOL v27;
  id location;

  v8 = a3;
  v9 = a4;
  if (-[PXPlacesMapThumbnailAnnotationView countLabelStyle](self, "countLabelStyle") == 1)
    v10 = 3;
  else
    v10 = 2;
  v11 = v9;
  +[PXPlacesPopoverImageFactory sharedInstance](PXPlacesPopoverImageFactory, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapThumbnailAnnotationView extendedTraitCollection](self, "extendedTraitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "thumbnailImageSizeForImageType:usingTraitCollection:includeScale:", v10, v13, 1);
  v15 = v14;
  v17 = v16;

  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EEB60128))
  {
    v10 = objc_msgSend(v11, "popoverImageType");
    v18 = (void *)objc_msgSend(v11, "imageOptions");
  }
  else
  {
    v18 = 0;
  }
  objc_initWeak(&location, self);
  +[PXPlacesMapThumbnailAnnotationView _thumbnailFetchOperationQueue](PXPlacesMapThumbnailAnnotationView, "_thumbnailFetchOperationQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __94__PXPlacesMapThumbnailAnnotationView__fetchImageForGeotaggable_renderer_networkAccessAllowed___block_invoke;
  v22[3] = &unk_1E51440F8;
  v23 = v11;
  v20 = v8;
  v24 = v20;
  v26[1] = v15;
  v26[2] = v17;
  v27 = a5;
  objc_copyWeak(v26, &location);
  v21 = v23;
  v25 = v21;
  v26[3] = (id)v10;
  v26[4] = v18;
  objc_msgSend(v19, "addOperationWithBlock:", v22);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

}

- (void)_updatePlaceholderImageIfNeeded
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id location;

  -[MKAnnotationView image](self, "image");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        v5 = -[PXPlacesMapThumbnailAnnotationView imageIsPlaceholder](self, "imageIsPlaceholder"),
        v4,
        v5))
  {
    -[PXPlacesMapThumbnailAnnotationView extendedTraitCollection](self, "extendedTraitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapThumbnailAnnotationView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTraitCollectionForMapKit:", v7);

    if (-[PXPlacesMapThumbnailAnnotationView countLabelStyle](self, "countLabelStyle") == 1)
      v8 = 3;
    else
      v8 = 2;
    +[PXPlacesPopoverImageFactory sharedInstance](PXPlacesPopoverImageFactory, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeholderImageForImageType:usingTraitCollection:", v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    objc_copyWeak(&v12, &location);
    v11 = v10;
    px_dispatch_on_main_queue();

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

- (void)_processGeotaggable:(id)a3 withImage:(CGImage *)a4 popoverImageType:(int64_t)a5 imageOptions:(unint64_t)a6 shouldCache:(BOOL)a7 expectedGeotaggable:(id)a8
{
  id v14;
  id v15;
  size_t Width;
  size_t Height;
  id v18;
  void *v19;
  void *v20;
  _QWORD aBlock[4];
  id v22;
  id v23;
  PXPlacesMapThumbnailAnnotationView *v24;
  id v25[4];
  BOOL v26;
  id location;

  v14 = a3;
  v15 = a8;
  if (a4 && (Width = CGImageGetWidth(a4), Height = CGImageGetHeight(a4), Width) && Height)
  {
    CFRetain(a4);
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __130__PXPlacesMapThumbnailAnnotationView__processGeotaggable_withImage_popoverImageType_imageOptions_shouldCache_expectedGeotaggable___block_invoke;
    aBlock[3] = &unk_1E5144148;
    objc_copyWeak(v25, &location);
    v22 = v14;
    v25[1] = a4;
    v25[2] = (id)a5;
    v25[3] = (id)a6;
    v18 = v15;
    v26 = a7;
    v23 = v18;
    v24 = self;
    v19 = _Block_copy(aBlock);
    +[PXPlacesMapThumbnailAnnotationView _thumbnailCreationOperationQueue](PXPlacesMapThumbnailAnnotationView, "_thumbnailCreationOperationQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addOperationWithBlock:", v19);

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
  else if (objc_msgSend(v14, "isEqual:", v15))
  {
    -[PXPlacesMapThumbnailAnnotationView _processPostImage](self, "_processPostImage");
  }

}

- (void)_processPostImage
{
  void *v3;
  void (**v4)(void);
  id v5;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  px_dispatch_on_main_queue();
  -[PXPlacesMapThumbnailAnnotationView displayCompletion](self, "displayCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXPlacesMapThumbnailAnnotationView displayCompletion](self, "displayCompletion");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[PXPlacesMapThumbnailAnnotationView setDisplayCompletion:](self, "setDisplayCompletion:", 0);
  }
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setImage:(id)a3
{
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  -[MKAnnotationView setImage:](&v7, sel_setImage_, a3);
  -[MKAnnotationView image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;

  -[MKAnnotationView setCenterOffset:](self, "setCenterOffset:", 0.0, v6 * -0.5);
  -[PXPlacesMapThumbnailAnnotationView setImageIsPlaceholder:](self, "setImageIsPlaceholder:", 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  -[MKAnnotationView setSelected:animated:](&v11, sel_setSelected_animated_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 1.0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");

    objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("inputColor"));
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapThumbnailAnnotationView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", v9);

  }
  else
  {
    -[PXPlacesMapThumbnailAnnotationView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", 0);
  }

}

- (void)_reloadCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  _QWORD block[5];

  if (a3 > 1)
  {
    -[PXPlacesMapThumbnailAnnotationView countLabel](self, "countLabel");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringFromNumber:numberStyle:", v6, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "text");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      v10 = objc_msgSend(v7, "isEqualToString:", v8);

      if ((v10 & 1) == 0)
      {
        objc_msgSend(v27, "setText:", v7);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __51__PXPlacesMapThumbnailAnnotationView__reloadCount___block_invoke;
        block[3] = &unk_1E5149198;
        block[4] = self;
        if (_reloadCount__onceToken != -1)
          dispatch_once(&_reloadCount__onceToken, block);
        -[MKAnnotationView image](self, "image");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "size");
        v13 = v12;

        if (-[PXPlacesMapThumbnailAnnotationView countLabelStyle](self, "countLabelStyle"))
        {
          objc_msgSend(v27, "intrinsicContentSize");
          objc_msgSend(v27, "setFrame:", 10.0, v13 - v14 + -10.0, v13 + -20.0, v14);
        }
        else
        {
          v15 = 26.0;
          objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 2, _reloadCount__countAttributes, 0, v13, 26.0);
          if (v16 + 10.0 >= 26.0)
            v15 = v16 + 10.0;
          objc_msgSend(v27, "frame");
          if (v17 != v15)
          {
            objc_msgSend(v27, "setFrame:", v13 + v15 * -3.0 * 0.25, -13.0, v15, 26.0);
            objc_msgSend(v27, "frame");
            v19 = v18;
            v21 = v20;
            v23 = v22;
            v25 = v24;
            -[PXPlacesMapThumbnailAnnotationView countLabelBackgroundImageView](self, "countLabelBackgroundImageView");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

          }
        }
        -[PXPlacesMapThumbnailAnnotationView _showCountLabel](self, "_showCountLabel");
      }
    }

  }
  else
  {
    -[PXPlacesMapThumbnailAnnotationView _hideCountLabel](self, "_hideCountLabel");
  }
}

- (void)_showCountLabel
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[PXPlacesMapThumbnailAnnotationView countLabel](self, "countLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if (v4)
  {
    -[PXPlacesMapThumbnailAnnotationView countLabel](self, "countLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    -[PXPlacesMapThumbnailAnnotationView countLabelBackgroundImageView](self, "countLabelBackgroundImageView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);

  }
}

- (void)_hideCountLabel
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[PXPlacesMapThumbnailAnnotationView countLabel](self, "countLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) == 0)
  {
    -[PXPlacesMapThumbnailAnnotationView countLabel](self, "countLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[PXPlacesMapThumbnailAnnotationView countLabelBackgroundImageView](self, "countLabelBackgroundImageView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

  }
}

- (id)renderToImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGContext *CurrentContext;
  void *v13;
  void *v14;
  CGSize v16;

  -[PXPlacesMapThumbnailAnnotationView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[PXPlacesMapThumbnailAnnotationView countLabel](self, "countLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;

  v16.width = v4 + v9 * 0.25;
  v16.height = v6 + v11 * 0.5;
  UIGraphicsBeginImageContextWithOptions(v16, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, 0.0, v11 * 0.5);
  -[PXPlacesMapThumbnailAnnotationView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "renderInContext:", CurrentContext);

  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v14;
}

- (id)displayCompletion
{
  return self->_displayCompletion;
}

- (void)setDisplayCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (PXPlacesMapThumbnailCurationDelegate)thumbnailCurationDelegate
{
  return (PXPlacesMapThumbnailCurationDelegate *)objc_loadWeakRetained((id *)&self->_thumbnailCurationDelegate);
}

- (void)setThumbnailCurationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailCurationDelegate, a3);
}

- (PKExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (id)extendedTraitObserver
{
  return self->_extendedTraitObserver;
}

- (void)setExtendedTraitObserver:(id)a3
{
  objc_storeStrong(&self->_extendedTraitObserver, a3);
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_countLabel, a3);
}

- (void)setCountLabelBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_countLabelBackgroundImageView, a3);
}

- (PXPlacesImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (BOOL)imageIsPlaceholder
{
  return self->_imageIsPlaceholder;
}

- (void)setImageIsPlaceholder:(BOOL)a3
{
  self->_imageIsPlaceholder = a3;
}

- (int64_t)countLabelStyle
{
  return self->_countLabelStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_countLabelBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong(&self->_extendedTraitObserver, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_destroyWeak((id *)&self->_thumbnailCurationDelegate);
  objc_storeStrong(&self->_displayCompletion, 0);
}

void __51__PXPlacesMapThumbnailAnnotationView__reloadCount___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0DC1138];
  _FontForCountLabelStyle(objc_msgSend(*(id *)(a1 + 32), "countLabelStyle"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_reloadCount__countAttributes;
  _reloadCount__countAttributes = v2;

}

void __55__PXPlacesMapThumbnailAnnotationView__processPostImage__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_reloadCount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032));

}

void __130__PXPlacesMapThumbnailAnnotationView__processGeotaggable_withImage_popoverImageType_imageOptions_shouldCache_expectedGeotaggable___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  +[PXPlacesPopoverImageFactory sharedInstance](PXPlacesPopoverImageFactory, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  objc_msgSend(WeakRetained, "extendedTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createPopoverImageForGeotaggable:withImage:imageType:imageOptions:usingTraitCollection:", v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CFRelease(*(CFTypeRef *)(a1 + 64));
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    if (*(_BYTE *)(a1 + 88))
    {
      objc_msgSend(WeakRetained, "userCacheKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "imageCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cacheRenderedImage:forGeotaggble:andKey:", v10, *(_QWORD *)(a1 + 32), v11);

    }
    v13 = WeakRetained;
    v14 = v10;
    objc_copyWeak(&v15, v2);
    v16 = *(_BYTE *)(a1 + 88);
    px_dispatch_on_main_queue();
    objc_destroyWeak(&v15);

  }
}

void __130__PXPlacesMapThumbnailAnnotationView__processGeotaggable_withImage_popoverImageType_imageOptions_shouldCache_expectedGeotaggable___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_reloadCount:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1032));

  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "_processPostImage");
}

void __69__PXPlacesMapThumbnailAnnotationView__updatePlaceholderImageIfNeeded__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setImage:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "setImageIsPlaceholder:", 1);
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_reloadCount:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1032));

}

void __94__PXPlacesMapThumbnailAnnotationView__fetchImageForGeotaggable_renderer_networkAccessAllowed___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  __int128 v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 96);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__PXPlacesMapThumbnailAnnotationView__fetchImageForGeotaggable_renderer_networkAccessAllowed___block_invoke_2;
  v5[3] = &unk_1E51440D0;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 80);
  objc_msgSend(v2, "imageForGeotaggable:ofSize:networkAccessAllowed:andCompletion:", v3, v4, v5, *(double *)(a1 + 64), *(double *)(a1 + 72));

  objc_destroyWeak(&v8);
}

void __94__PXPlacesMapThumbnailAnnotationView__fetchImageForGeotaggable_renderer_networkAccessAllowed___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v21 = a2;
  v9 = a5;
  v10 = v9;
  if (!a3 || a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_updatePlaceholderImageIfNeeded");

    if (v10)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C58]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 && objc_msgSend(v15, "BOOLValue"))
      {
        v17 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v17, "_fetchImageForGeotaggable:renderer:networkAccessAllowed:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
      }
      else
      {
        v17 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v17, "_processPostImage");
      }

    }
    else
    {
      v16 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v16, "_processPostImage");
    }
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", PKPlacesCoarseLocationMediaInfoKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if ((v12 & 1) != 0)
      v13 = 4;
    else
      v13 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C58]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    if (v18 && objc_msgSend(v18, "BOOLValue"))
    {
      v19 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v19, "_processGeotaggable:withImage:popoverImageType:imageOptions:shouldCache:expectedGeotaggable:", v21, a3, v13, *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 32));

      v20 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v20, "_fetchImageForGeotaggable:renderer:networkAccessAllowed:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
    }
    else
    {
      v20 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v20, "_processGeotaggable:withImage:popoverImageType:imageOptions:shouldCache:expectedGeotaggable:", v21, a3, v13, *(_QWORD *)(a1 + 64), 1, *(_QWORD *)(a1 + 32));
    }

  }
}

void __74__PXPlacesMapThumbnailAnnotationView__fetchImageWithNetworkAccessAllowed___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "primaryGeotaggable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredGeotaggableWithFallbackGeotaggable:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_fetchImageForGeotaggable:renderer:networkAccessAllowed:", v4, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

    WeakRetained = v5;
  }

}

void __50__PXPlacesMapThumbnailAnnotationView__reloadData___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setImage:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_hideCountLabel");

}

void __50__PXPlacesMapThumbnailAnnotationView__reloadData___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setImage:", *(_QWORD *)(a1 + 32));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_reloadCount:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1032));

}

void __50__PXPlacesMapThumbnailAnnotationView__reloadData___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_reloadCount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032));

}

void __64__PXPlacesMapThumbnailAnnotationView__countLabelBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0823529412, 0.494117647, 0.984313725, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_countLabelBackgroundColor_countLabelBackgroundColor;
  _countLabelBackgroundColor_countLabelBackgroundColor = v0;

}

void __67__PXPlacesMapThumbnailAnnotationView_countLabelBackgroundImageView__block_invoke(uint64_t a1)
{
  CGContext *CurrentContext;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  CGSize v7;
  CGRect v8;

  v7.width = 26.0;
  v7.height = 26.0;
  UIGraphicsBeginImageContextWithOptions(v7, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(*(id *)(a1 + 32), "_countLabelBackgroundColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v3, "CGColor"));

  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 26.0;
  v8.size.height = 26.0;
  CGContextFillEllipseInRect(CurrentContext, v8);
  UIGraphicsGetImageFromCurrentImageContext();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v6, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 13.0, 0.0, 13.0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)countLabelBackgroundImageView_stretchablecountLabelBgImage;
  countLabelBackgroundImageView_stretchablecountLabelBgImage = v4;

}

void __124__PXPlacesMapThumbnailAnnotationView_initWithAnnotation_reuseIdentifier_extendedTraitCollection_imageCache_countLabelStyle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  id v5;

  objc_msgSend(a2, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kPKExtendedTraitCollectionKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setExtendedTraitCollection:", v3);

  }
}

+ (id)_thumbnailFetchOperationQueue
{
  if (_thumbnailFetchOperationQueue_token != -1)
    dispatch_once(&_thumbnailFetchOperationQueue_token, &__block_literal_global_127);
  return (id)_thumbnailFetchOperationQueue;
}

+ (id)_thumbnailCreationOperationQueue
{
  if (_thumbnailCreationOperationQueue_token != -1)
    dispatch_once(&_thumbnailCreationOperationQueue_token, &__block_literal_global_129_276805);
  return (id)_thumbnailCreationOperationQueue;
}

+ (id)_thumbnailSelectionQueue
{
  if (_thumbnailSelectionQueue_onceToken != -1)
    dispatch_once(&_thumbnailSelectionQueue_onceToken, &__block_literal_global_130_276803);
  return (id)_thumbnailSelectionQueue_thumbnailSelectionQueue;
}

void __62__PXPlacesMapThumbnailAnnotationView__thumbnailSelectionQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INTERACTIVE, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("PXPlacesMapThumbnailAnnotationView.thumbnailSelectionQueue", attr);
  v2 = (void *)_thumbnailSelectionQueue_thumbnailSelectionQueue;
  _thumbnailSelectionQueue_thumbnailSelectionQueue = (uint64_t)v1;

}

uint64_t __70__PXPlacesMapThumbnailAnnotationView__thumbnailCreationOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_thumbnailCreationOperationQueue;
  _thumbnailCreationOperationQueue = (uint64_t)v0;

  objc_msgSend((id)_thumbnailCreationOperationQueue, "setMaxConcurrentOperationCount:", 4);
  return objc_msgSend((id)_thumbnailCreationOperationQueue, "setQualityOfService:", 25);
}

uint64_t __67__PXPlacesMapThumbnailAnnotationView__thumbnailFetchOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_thumbnailFetchOperationQueue;
  _thumbnailFetchOperationQueue = (uint64_t)v0;

  objc_msgSend((id)_thumbnailFetchOperationQueue, "setMaxConcurrentOperationCount:", 4);
  return objc_msgSend((id)_thumbnailFetchOperationQueue, "setQualityOfService:", 17);
}

@end
