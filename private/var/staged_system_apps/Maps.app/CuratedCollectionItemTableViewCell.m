@implementation CuratedCollectionItemTableViewCell

+ (double)estimatedCellHeight
{
  return 600.0;
}

- (CuratedCollectionItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CuratedCollectionItemTableViewCell *v4;
  CuratedCollectionItemTableViewCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CuratedCollectionItemTableViewCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CuratedCollectionItemTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[CuratedCollectionItemTableViewCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    -[CuratedCollectionItemTableViewCell _createSubviews](v5, "_createSubviews");
    -[CuratedCollectionItemTableViewCell _setupConstraints](v5, "_setupConstraints");
  }
  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CuratedCollectionItemTableViewCell;
  -[CuratedCollectionItemTableViewCell layoutSubviews](&v3, "layoutSubviews");
  -[CuratedCollectionItemTableViewCell _loadImageIfNeeded](self, "_loadImageIfNeeded");
  -[CuratedCollectionItemTableViewCell _loadPOIImage](self, "_loadPOIImage");
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CuratedCollectionItemTableViewCell;
  -[CuratedCollectionItemTableViewCell prepareForReuse](&v11, "prepareForReuse");
  self->_needsImageLoad = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
  objc_msgSend(v3, "setImage:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
  objc_msgSend(v4, "setAttributionString:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
  objc_msgSend(v5, "setHidden:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v6, "setAttributedText:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v7, "setHidden:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v8, "setText:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v9, "setHidden:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell poiIconImageView](self, "poiIconImageView"));
  objc_msgSend(v10, "setImage:", 0);

}

- (void)configureWithModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CuratedCollectionItemAppStoreAppClipViewModel *v34;
  void *v35;
  CuratedCollectionItemAppStoreAppClipViewModel *v36;
  void *v37;
  id v38;

  v38 = a3;
  -[CuratedCollectionItemTableViewCell setModel:](self, "setModel:", v38);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell placeSummaryView](self, "placeSummaryView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "placeSummaryModel"));
  objc_msgSend(v4, "configureWithModel:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "itemDescription"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
    objc_msgSend(v8, "setHidden:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "itemDescription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
    objc_msgSend(v10, "setAttributedText:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
    objc_msgSend(v12, "setTextColor:", v11);

  }
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    v13 = objc_msgSend(v38, "isItemInLibrary");
  else
    v13 = objc_msgSend(v38, "isItemInUserCollection");
  v14 = v13;
  v15 = sub_1002A8AA0(self);
  v16 = CFSTR("plus");
  if (v14)
    v16 = CFSTR("checkmark");
  v17 = CFSTR("checkmark.circle");
  if (!v14)
    v17 = CFSTR("plus.circle");
  if (v15 == 5)
    v16 = (__CFString *)v17;
  v18 = v16;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 7, 17.0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v18, v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageWithRenderingMode:", 2));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
  objc_msgSend(v22, "setImage:forState:", v21, 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "fullReviewString"));
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
    objc_msgSend(v25, "setHidden:", 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "fullReviewString"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
    objc_msgSend(v27, "setAttributedText:", v26);

  }
  if (objc_msgSend(v38, "hasImage"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
    objc_msgSend(v28, "setHidden:", 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "imageAttribution"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
    objc_msgSend(v30, "setAttributionString:", v29);

    self->_needsImageLoad = 1;
    -[CuratedCollectionItemTableViewCell _loadImageIfNeeded](self, "_loadImageIfNeeded");
  }
  if (sub_1002A8AA0(self) == 5
    && !+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell menuForAddButton](self, "menuForAddButton"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
    objc_msgSend(v32, "setMenu:", v31);

  }
  -[CuratedCollectionItemTableViewCell _loadPOIImage](self, "_loadPOIImage");
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "appClip"));

  if (v33)
  {
    v34 = [CuratedCollectionItemAppStoreAppClipViewModel alloc];
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "appClip"));
    v36 = -[CuratedCollectionItemAppStoreAppClipViewModel initWithAppStoreAppClip:](v34, "initWithAppStoreAppClip:", v35);

    -[CuratedCollectionItemAppClipView setViewModel:](self->_appClipView, "setViewModel:", v36);
    -[CuratedCollectionItemAppClipView setHidden:](self->_appClipView, "setHidden:", 0);

  }
  else
  {
    -[CuratedCollectionItemAppClipView setHidden:](self->_appClipView, "setHidden:", 1);
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  objc_msgSend(v37, "setNeedsLayout");

  -[CuratedCollectionItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_loadImageIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double height;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  height = CGSizeZero.height;

  if (v5 == CGSizeZero.width && v7 == height)
  {
    -[CuratedCollectionItemTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
  else if (self->_needsImageLoad)
  {
    self->_needsImageLoad = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell model](self, "model"));
    objc_initWeak(&location, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1009E5F1C;
    v17[3] = &unk_1011B8C20;
    objc_copyWeak(&v19, &location);
    v16 = v10;
    v18 = v16;
    objc_msgSend(v16, "loadImageForSize:completion:", v17, v13, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

- (void)_loadPOIImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell model](self, "model"));
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1009E61FC;
  v9[3] = &unk_1011C6C88;
  objc_copyWeak(&v11, &location);
  v8 = v3;
  v10 = v8;
  objc_msgSend(v4, "getImageForMapItem:completion:", v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_createSubviews
{
  void *v3;
  id v4;
  double y;
  double width;
  double height;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CuratedCollectionItemImageWithAttributionView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CuratedCollectionItemPOIIconImageView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CuratedCollectionPlaceSummaryView *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  const char *v52;
  void *v53;
  void *v54;
  void *v55;
  char **v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  double left;
  double bottom;
  double right;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  CuratedCollectionItemAppClipView *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CuratedCollectionItemTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_alloc((Class)UIStackView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionItemTableViewCell setStackView:](self, "setStackView:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  objc_msgSend(v10, "setAxis:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  objc_msgSend(v11, "setDistribution:", 3);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  objc_msgSend(v12, "setAlignment:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  objc_msgSend(v13, "setSpacing:", 16.0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("StackView"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  objc_msgSend(v15, "addSubview:", v16);

  v17 = -[CuratedCollectionItemImageWithAttributionView initWithFrame:]([CuratedCollectionItemImageWithAttributionView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionItemTableViewCell setItemImageView:](self, "setItemImageView:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
  objc_msgSend(v19, "setClipsToBounds:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
  objc_msgSend(v20, "_setContinuousCornerRadius:", 8.0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
  objc_msgSend(v21, "setHidden:", 1);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
  objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("ItemImageView"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
  objc_msgSend(v23, "addArrangedSubview:", v24);

  v25 = objc_alloc_init(CuratedCollectionItemPOIIconImageView);
  -[CuratedCollectionItemTableViewCell setPoiIconImageView:](self, "setPoiIconImageView:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell poiIconImageView](self, "poiIconImageView"));
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell poiIconImageView](self, "poiIconImageView"));
  objc_msgSend(v27, "setAccessibilityIdentifier:", CFSTR("POIIconImageView"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell poiIconImageView](self, "poiIconImageView"));
  objc_msgSend(v28, "addArrangedSubview:", v29);

  v30 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionItemTableViewCell setPlaceSummaryContainerStackView:](self, "setPlaceSummaryContainerStackView:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell placeSummaryContainerStackView](self, "placeSummaryContainerStackView"));
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell placeSummaryContainerStackView](self, "placeSummaryContainerStackView"));
  objc_msgSend(v32, "setAxis:", 0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell placeSummaryContainerStackView](self, "placeSummaryContainerStackView"));
  objc_msgSend(v33, "setDistribution:", 3);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell placeSummaryContainerStackView](self, "placeSummaryContainerStackView"));
  objc_msgSend(v34, "setAlignment:", 1);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell placeSummaryContainerStackView](self, "placeSummaryContainerStackView"));
  objc_msgSend(v35, "setSpacing:", 8.0);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell placeSummaryContainerStackView](self, "placeSummaryContainerStackView"));
  objc_msgSend(v36, "setAccessibilityIdentifier:", CFSTR("PlaceSummaryContainerStackView"));

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell placeSummaryContainerStackView](self, "placeSummaryContainerStackView"));
  objc_msgSend(v37, "addArrangedSubview:", v38);

  v39 = -[CuratedCollectionPlaceSummaryView initWithFrame:]([CuratedCollectionPlaceSummaryView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionItemTableViewCell setPlaceSummaryView:](self, "setPlaceSummaryView:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell placeSummaryView](self, "placeSummaryView"));
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell placeSummaryContainerStackView](self, "placeSummaryContainerStackView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell placeSummaryView](self, "placeSummaryView"));
  objc_msgSend(v41, "addArrangedSubview:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  -[CuratedCollectionItemTableViewCell setAddToLibraryOrUserCollectionsButton:](self, "setAddToLibraryOrUserCollectionsButton:", v43);

  if (sub_1002A8AA0(self) == 5)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus.circle")));
    v94 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "imageWithRenderingMode:", 2));

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system20](UIFont, "system20"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v46));
    objc_msgSend(v45, "setPreferredSymbolConfiguration:forImageInState:", v47, 0);

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_keyColor](UIColor, "_maps_keyColor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
    objc_msgSend(v49, "setTintColor:", v48);

    LODWORD(v49) = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
    v51 = v50;
    if ((_DWORD)v49)
    {
      v52 = "_tappedAddOrRemoveFromLibraryButton:";
    }
    else
    {
      objc_msgSend(v50, "setContextMenuInteractionEnabled:", 1);

      v60 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
      objc_msgSend(v60, "setShowsMenuAsPrimaryAction:", 1);

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
      v51 = v50;
      v52 = "_tappedAddToUserCollectionButton:";
    }
    objc_msgSend(v50, "addTarget:action:forControlEvents:", self, v52, 64);
  }
  else
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus")));
    v94 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "imageWithRenderingMode:", 2));

    LODWORD(v53) = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
    v55 = v54;
    v56 = &selRef__tappedAddOrRemoveFromLibraryButton_;
    if (!(_DWORD)v53)
      v56 = &selRef__tappedAddToUserCollectionButton_;
    objc_msgSend(v54, "addTarget:action:forControlEvents:", self, *v56, 64);

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
    objc_msgSend(v58, "setBackgroundColor:", v57);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "layer"));
    objc_msgSend(v59, "setCornerRadius:", 18.5);

  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
  objc_msgSend(v61, "setImage:forState:", v94, 0);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
  objc_msgSend(v62, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
  objc_msgSend(v63, "setAccessibilityIdentifier:", CFSTR("AddToUserCollectionsButton"));

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell placeSummaryContainerStackView](self, "placeSummaryContainerStackView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
  objc_msgSend(v64, "addArrangedSubview:", v65);

  v66 = objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionItemTableViewCell setItemDescriptionTextView:](self, "setItemDescriptionTextView:", v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v67, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v68, "setDelegate:", self);

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v72, "setTextContainerInset:", UIEdgeInsetsZero.top, left, bottom, right);

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "textContainer"));
  objc_msgSend(v74, "setLineFragmentPadding:", 0.0);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v75, "setUserInteractionEnabled:", 1);

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v76, "setSelectable:", 1);

  v77 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v77, "setEditable:", 0);

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v78, "setScrollEnabled:", 0);

  v79 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v80, "setBackgroundColor:", v79);

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v81, "setHidden:", 1);

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v82, "setAccessibilityIdentifier:", CFSTR("ItemDescriptionTextView"));

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemDescriptionTextView](self, "itemDescriptionTextView"));
  objc_msgSend(v83, "addArrangedSubview:", v84);

  -[CuratedCollectionItemTableViewCell setupReviewLabel](self, "setupReviewLabel");
  v85 = -[CuratedCollectionItemAppClipView initWithFrame:]([CuratedCollectionItemAppClipView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionItemTableViewCell setAppClipView:](self, "setAppClipView:", v85);

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell appClipView](self, "appClipView"));
  objc_msgSend(v86, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell appClipView](self, "appClipView"));
  objc_msgSend(v87, "setUserInteractionEnabled:", 1);

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell appClipView](self, "appClipView"));
  objc_msgSend(v88, "setHidden:", 1);

  v89 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell appClipView](self, "appClipView"));
  objc_msgSend(v89, "addArrangedSubview:", v90);

  v91 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_tappedAppClip");
  -[CuratedCollectionItemTableViewCell setAppClipTapGestureRecognizer:](self, "setAppClipTapGestureRecognizer:", v91);

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell appClipView](self, "appClipView"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell appClipTapGestureRecognizer](self, "appClipTapGestureRecognizer"));
  objc_msgSend(v92, "addGestureRecognizer:", v93);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[11];

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell contentView](self, "contentView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell topAnchor](self, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
  v53[0] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell contentView](self, "contentView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell leadingAnchor](self, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v53[1] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell contentView](self, "contentView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell trailingAnchor](self, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v53[2] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell contentView](self, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell bottomAnchor](self, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v53[3] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell contentView](self, "contentView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 16.0));
  v53[4] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell contentView](self, "contentView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 16.0));
  v53[5] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell contentView](self, "contentView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, -16.0));
  v53[6] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, -16.0));
  v53[7] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "widthAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 37.0));
  v53[8] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "heightAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widthAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v53[9] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "heightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell itemImageView](self, "itemImageView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "widthAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:multiplier:", v10, 0.670000017));
  v53[10] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)addToUserCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
  objc_msgSend(v8, "didSelectAddToUserCollection:forMapItem:sourceView:onSaveCompletion:", 0, v6, v7, 0);

}

- (void)_tappedAddToUserCollectionButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  objc_msgSend(v8, "didSelectAddToUserCollection:forMapItem:sourceView:onSaveCompletion:", 0, v7, v4, 0);

}

- (void)_tappedAddOrRemoveFromLibraryButton:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell model](self, "model", a3));

  if (v4)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell model](self, "model"));
    v6 = objc_msgSend(v5, "isItemInLibrary") ^ 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell model](self, "model"));
    objc_msgSend(v8, "didSelectAddOrRemoveFromLibrary:forModel:", v6, v7);

  }
}

- (void)_tappedAddToUserCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell model](self, "model"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell addToLibraryOrUserCollectionsButton](self, "addToLibraryOrUserCollectionsButton"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009E7578;
  v10[3] = &unk_1011AC860;
  v10[4] = self;
  objc_msgSend(v5, "didSelectAddToUserCollection:forMapItem:sourceView:onSaveCompletion:", v4, v8, v9, v10);

}

- (id)menuForAddButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  void *v19;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id location;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionItem"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionsForAddingMapItems"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_initWeak(&location, self);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1009E793C;
        v20[3] = &unk_1011ACEC0;
        objc_copyWeak(&v21, &location);
        v20[4] = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v12, 0, 0, v20));

        if (objc_msgSend(v11, "containsItem:", v19))
          objc_msgSend(v13, "setAttributes:", 1);
        objc_msgSend(v7, "addObject:", v13);

        objc_destroyWeak(&v21);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v7, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[Curated Guide View] Save to Guides"), CFSTR("localized string not found"), 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", v15, v7));

  }
  else
  {
    v16 = 0;
  }
  objc_destroyWeak(&location);

  return v16;
}

- (void)_tappedAppClip
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemCellModel appClip](self->_model, "appClip"));
  objc_msgSend(v4, "openAppClip:", v3);

}

- (void)setupReviewLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double left;
  double bottom;
  double right;
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
  NSAttributedStringKey v28;
  void *v29;

  v3 = objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CuratedCollectionItemTableViewCell setReviewTextView:](self, "setReviewTextView:", v3);

  v28 = NSForegroundColorAttributeName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell mk_theme](self, "mk_theme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tintColor"));
  v29 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v7, "setLinkTextAttributes:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v8, "setTextAlignment:", 4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v9, "setDelegate:", self);

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v13, "setTextContainerInset:", UIEdgeInsetsZero.top, left, bottom, right);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textContainer"));
  objc_msgSend(v15, "setLineFragmentPadding:", 0.0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v17, "setDataDetectorTypes:", 2);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v18, "setUserInteractionEnabled:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v19, "setSelectable:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v20, "setEditable:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v21, "setScrollEnabled:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v23, "setBackgroundColor:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v24, "setHidden:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("ReviewTextView"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell stackView](self, "stackView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));
  objc_msgSend(v26, "addArrangedSubview:", v27);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell reviewTextView](self, "reviewTextView"));

  if (!a6 && v9 == v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell delegate](self, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemTableViewCell model](self, "model"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionItem"));
    objc_msgSend(v10, "willPunchOutToPublisherWebpageForPlaceCollectionItem:", v12);

  }
  return 1;
}

- (CuratedCollectionItemTableViewCellDelegate)delegate
{
  return (CuratedCollectionItemTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CuratedCollectionItemCellModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (UILayoutGuide)cellContentLayoutGuide
{
  return self->_cellContentLayoutGuide;
}

- (void)setCellContentLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_cellContentLayoutGuide, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (CuratedCollectionItemImageWithAttributionView)itemImageView
{
  return self->_itemImageView;
}

- (void)setItemImageView:(id)a3
{
  objc_storeStrong((id *)&self->_itemImageView, a3);
}

- (CuratedCollectionItemPOIIconImageView)poiIconImageView
{
  return self->_poiIconImageView;
}

- (void)setPoiIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_poiIconImageView, a3);
}

- (UIStackView)placeSummaryContainerStackView
{
  return self->_placeSummaryContainerStackView;
}

- (void)setPlaceSummaryContainerStackView:(id)a3
{
  objc_storeStrong((id *)&self->_placeSummaryContainerStackView, a3);
}

- (CuratedCollectionPlaceSummaryView)placeSummaryView
{
  return self->_placeSummaryView;
}

- (void)setPlaceSummaryView:(id)a3
{
  objc_storeStrong((id *)&self->_placeSummaryView, a3);
}

- (UIButton)addToLibraryOrUserCollectionsButton
{
  return self->_addToLibraryOrUserCollectionsButton;
}

- (void)setAddToLibraryOrUserCollectionsButton:(id)a3
{
  objc_storeStrong((id *)&self->_addToLibraryOrUserCollectionsButton, a3);
}

- (UITextView)itemDescriptionTextView
{
  return self->_itemDescriptionTextView;
}

- (void)setItemDescriptionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_itemDescriptionTextView, a3);
}

- (UITextView)reviewTextView
{
  return self->_reviewTextView;
}

- (void)setReviewTextView:(id)a3
{
  objc_storeStrong((id *)&self->_reviewTextView, a3);
}

- (CuratedCollectionItemAppClipView)appClipView
{
  return self->_appClipView;
}

- (void)setAppClipView:(id)a3
{
  objc_storeStrong((id *)&self->_appClipView, a3);
}

- (UITapGestureRecognizer)appClipTapGestureRecognizer
{
  return self->_appClipTapGestureRecognizer;
}

- (void)setAppClipTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_appClipTapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClipTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_appClipView, 0);
  objc_storeStrong((id *)&self->_reviewTextView, 0);
  objc_storeStrong((id *)&self->_itemDescriptionTextView, 0);
  objc_storeStrong((id *)&self->_addToLibraryOrUserCollectionsButton, 0);
  objc_storeStrong((id *)&self->_placeSummaryView, 0);
  objc_storeStrong((id *)&self->_placeSummaryContainerStackView, 0);
  objc_storeStrong((id *)&self->_poiIconImageView, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_cellContentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
