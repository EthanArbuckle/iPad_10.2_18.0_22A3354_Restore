@implementation PXSurveyQuestionAssetGroupView

- (PXSurveyQuestionAssetGroupView)initWithAssetCollection:(id)a3
{
  return -[PXSurveyQuestionAssetGroupView initWithAssetCollection:customMaximumPreviewAssetCount:keyAssetLocalIdentifier:](self, "initWithAssetCollection:customMaximumPreviewAssetCount:keyAssetLocalIdentifier:", a3, 0, 0);
}

- (PXSurveyQuestionAssetGroupView)initWithAssetCollection:(id)a3 customMaximumPreviewAssetCount:(id)a4 keyAssetLocalIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXSurveyQuestionAssetGroupView *v12;
  PXSurveyQuestionAssetGroupView *v13;
  NSMutableSet *v14;
  NSMutableSet *presentedAssetIds;
  NSDateFormatter *v16;
  NSDateFormatter *dateFormatter;
  void *v18;
  UIView *v19;
  UIView *metadataView;
  uint64_t v21;
  CAGradientLayer *metadataViewGradient;
  UILabel *v23;
  UILabel *locationLabel;
  UILabel *v25;
  UILabel *dateRangeLabel;
  void *v27;
  uint64_t v28;
  NSNumber *customMaximumPreviewAssetCount;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PXSurveyQuestionAssetGroupView;
  v12 = -[PXSurveyQuestionAssetGroupView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetCollection, a3);
    v13->_imagePadding = 2.0;
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    presentedAssetIds = v13->_presentedAssetIds;
    v13->_presentedAssetIds = v14;

    v16 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v13->_dateFormatter;
    v13->_dateFormatter = v16;

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v13->_dateFormatter, "setLocale:", v18);

    -[NSDateFormatter setDateStyle:](v13->_dateFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v13->_dateFormatter, "setTimeStyle:", 0);
    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    metadataView = v13->_metadataView;
    v13->_metadataView = v19;

    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v21 = objc_claimAutoreleasedReturnValue();
    metadataViewGradient = v13->_metadataViewGradient;
    v13->_metadataViewGradient = (CAGradientLayer *)v21;

    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    locationLabel = v13->_locationLabel;
    v13->_locationLabel = v23;

    v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    dateRangeLabel = v13->_dateRangeLabel;
    v13->_dateRangeLabel = v25;

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v13, sel__handleViewTap);
    -[PXSurveyQuestionAssetGroupView addGestureRecognizer:](v13, "addGestureRecognizer:", v27);
    -[PXSurveyQuestionAssetGroupView validCustomMaximumPreviewAssetCountForCustomMaximumPreviewAssetCount:](v13, "validCustomMaximumPreviewAssetCountForCustomMaximumPreviewAssetCount:", v10);
    v28 = objc_claimAutoreleasedReturnValue();
    customMaximumPreviewAssetCount = v13->_customMaximumPreviewAssetCount;
    v13->_customMaximumPreviewAssetCount = (NSNumber *)v28;

    objc_storeStrong((id *)&v13->_keyAssetLocalIdentifier, a5);
  }

  return v13;
}

- (id)validCustomMaximumPreviewAssetCountForCustomMaximumPreviewAssetCount:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  uint8_t v8[16];

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v5 = objc_msgSend(v3, "intValue");
  if (v5 > 9 || ((1 << v5) & 0x216) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PXSurveyQuestionAssetGroupView] invalid customMaximumPreviewAssetCount input. Must be 1, 2, 4, or 9.", v8, 2u);
    }
    goto LABEL_7;
  }
  v6 = v4;
LABEL_8:

  return v6;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  NSObject *v16;
  _QWORD block[5];
  objc_super v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXSurveyQuestionAssetGroupView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v18.receiver = self;
  v18.super_class = (Class)PXSurveyQuestionAssetGroupView;
  -[PXSurveyQuestionAssetGroupView setFrame:](&v18, sel_setFrame_, x, y, width, height);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  if (!CGRectEqualToRect(v19, v20))
  {
    -[PXSurveyQuestionAssetGroupView imageViewsQueue](self, "imageViewsQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PXSurveyQuestionAssetGroupView_setFrame___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_sync(v16, block);

  }
}

- (OS_dispatch_queue)imageViewsQueue
{
  OS_dispatch_queue *imageViewsQueue;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  imageViewsQueue = self->_imageViewsQueue;
  if (!imageViewsQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.ui.photosChallenge.imageViewsQueue", v4);
    v6 = self->_imageViewsQueue;
    self->_imageViewsQueue = v5;

    imageViewsQueue = self->_imageViewsQueue;
  }
  return imageViewsQueue;
}

- (NSMutableArray)imageViews
{
  NSMutableArray *imageViews;
  NSMutableArray *v4;
  NSMutableArray *v5;

  imageViews = self->_imageViews;
  if (!imageViews)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_imageViews;
    self->_imageViews = v4;

    imageViews = self->_imageViews;
  }
  return imageViews;
}

- (unsigned)_getTotalViews
{
  NSNumber *customMaximumPreviewAssetCount;

  customMaximumPreviewAssetCount = self->_customMaximumPreviewAssetCount;
  if (customMaximumPreviewAssetCount)
    return -[NSNumber intValue](customMaximumPreviewAssetCount, "intValue");
  if (-[PHAssetCollection estimatedAssetCount](self->_assetCollection, "estimatedAssetCount") < 2)
    return 1;
  if (-[PHAssetCollection estimatedAssetCount](self->_assetCollection, "estimatedAssetCount") < 4)
    return 2;
  if (-[PHAssetCollection estimatedAssetCount](self->_assetCollection, "estimatedAssetCount") >= 9)
    return 9;
  return 4;
}

- (void)_setupViews
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  _QWORD block[5];
  id v14;
  NSObject *v15;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSurveyQuestionAssetGroupView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = -[PXSurveyQuestionAssetGroupView _getTotalViews](self, "_getTotalViews");
  v5 = dispatch_group_create();
  v6 = MEMORY[0x1E0C809B0];
  if ((_DWORD)v4)
  {
    v7 = 1;
    do
    {
      dispatch_group_enter(v5);
      -[PXSurveyQuestionAssetGroupView _imageViewForPosition:totalViewCount:](self, "_imageViewForPosition:totalViewCount:", v7, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContentMode:", 2);
      objc_msgSend(v8, "setClipsToBounds:", 1);
      if ((v7 & 1) != 0)
        objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v9);

      -[PXSurveyQuestionAssetGroupView imageViewsQueue](self, "imageViewsQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __45__PXSurveyQuestionAssetGroupView__setupViews__block_invoke;
      block[3] = &unk_1E51457C8;
      block[4] = self;
      v14 = v8;
      v15 = v5;
      v11 = v8;
      dispatch_sync(v10, block);

      ++v7;
    }
    while (v4 >= v7);
  }
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __45__PXSurveyQuestionAssetGroupView__setupViews__block_invoke_3;
  v12[3] = &unk_1E5149198;
  v12[4] = self;
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v12);
  -[PXSurveyQuestionAssetGroupView _setupMetadataView](self, "_setupMetadataView");

}

- (void)_setupMetadataView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
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
  char isKindOfClass;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  _QWORD v67[3];

  v67[2] = *MEMORY[0x1E0C80C00];
  -[PXSurveyQuestionAssetGroupView metadataView](self, "metadataView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PXSurveyQuestionAssetGroupView metadataView](self, "metadataView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionAssetGroupView addSubview:](self, "addSubview:", v5);

    -[PXSurveyQuestionAssetGroupView metadataView](self, "metadataView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setZPosition:", 1.79769313e308);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionAssetGroupView locationLabel](self, "locationLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    v10 = *MEMORY[0x1E0DC1438];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 17.0, *MEMORY[0x1E0DC1438]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionAssetGroupView locationLabel](self, "locationLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionAssetGroupView dateRangeLabel](self, "dateRangeLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 17.0, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionAssetGroupView dateRangeLabel](self, "dateRangeLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v15);

    -[PXSurveyQuestionAssetGroupView metadataView](self, "metadataView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", self->_locationLabel);

    -[PXSurveyQuestionAssetGroupView metadataView](self, "metadataView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", self->_dateRangeLabel);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v67[0] = objc_msgSend(v19, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "colorWithAlphaComponent:", 0.8);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v67[1] = objc_msgSend(v21, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionAssetGroupView metadataViewGradient](self, "metadataViewGradient");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setColors:", v22);

    -[PXSurveyQuestionAssetGroupView bounds](self, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[PXSurveyQuestionAssetGroupView metadataViewGradient](self, "metadataViewGradient");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

    -[PXSurveyQuestionAssetGroupView metadataViewGradient](self, "metadataViewGradient");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLocations:", &unk_1E53EA248);

    -[PXSurveyQuestionAssetGroupView metadataViewGradient](self, "metadataViewGradient");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setZPosition:", 1000.0);

    -[PXSurveyQuestionAssetGroupView layer](self, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionAssetGroupView metadataViewGradient](self, "metadataViewGradient");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addSublayer:", v36);

  }
  -[PXSurveyQuestionAssetGroupView bounds](self, "bounds");
  v38 = v37 * 0.666;
  -[PXSurveyQuestionAssetGroupView bounds](self, "bounds");
  v40 = v39;
  -[PXSurveyQuestionAssetGroupView bounds](self, "bounds");
  v42 = v41 / 3.0;
  -[PXSurveyQuestionAssetGroupView metadataView](self, "metadataView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFrame:", 0.0, v38, v40, v42);

  -[PXSurveyQuestionAssetGroupView delegate](self, "delegate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "px_surveyQuestionAssetGroupViewMetadataLocationString:", self);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSurveyQuestionAssetGroupView locationLabel](self, "locationLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setText:", v45);

  -[PXSurveyQuestionAssetGroupView delegate](self, "delegate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "px_surveyQuestionAssetGroupViewMetadataDateRangeStringWithFormatter:assetGroupView:", self->_dateFormatter, self);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSurveyQuestionAssetGroupView dateRangeLabel](self, "dateRangeLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setText:", v48);

  -[PXSurveyQuestionAssetGroupView locationLabel](self, "locationLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "text");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v51, "length"))
    goto LABEL_6;
  -[PXSurveyQuestionAssetGroupView delegate](self, "delegate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonExhaustiveMomentLabelingNoLocation"), CFSTR("PhotosUICore"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionAssetGroupView locationLabel](self, "locationLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setText:", v50);
LABEL_6:

  }
  -[PXSurveyQuestionAssetGroupView metadataView](self, "metadataView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bounds");
  v56 = v55 + -40.0;
  -[PXSurveyQuestionAssetGroupView metadataView](self, "metadataView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bounds");
  v59 = v58 + -20.0;
  -[PXSurveyQuestionAssetGroupView dateRangeLabel](self, "dateRangeLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFrame:", 10.0, v56, v59, 40.0);

  -[PXSurveyQuestionAssetGroupView dateRangeLabel](self, "dateRangeLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "frame");
  v63 = v62 + -20.0;
  -[PXSurveyQuestionAssetGroupView bounds](self, "bounds");
  v65 = v64 + -20.0;
  -[PXSurveyQuestionAssetGroupView locationLabel](self, "locationLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setFrame:", 10.0, v63, v65, 40.0);

}

- (void)_handleViewTap
{
  id v3;

  -[PXSurveyQuestionAssetGroupView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_surveyQuestionAssetGroupViewWasTapped:", self);

}

- (void)_beginImageFetchFromCollection
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PXSurveyQuestionAssetGroupView__beginImageFetchFromCollection__block_invoke;
  block[3] = &unk_1E5147280;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)_arrangeAssetsForDisplay:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((unint64_t)objc_msgSend(v3, "count") >= 3
    && objc_msgSend(v3, "count") != 4
    && objc_msgSend(v3, "count") != 9)
  {
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    objc_msgSend(v3, "removeObjectAtIndex:", 0);
    v8 = 0;
    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      objc_msgSend(v3, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeLastObject");
    }
    if ((unint64_t)objc_msgSend(v3, "count") < 4)
    {
      v20 = v3;

      v4 = v20;
      if (!v8)
      {
LABEL_15:

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v11);

      if ((unint64_t)objc_msgSend(v3, "count") >= 9)
      {
        v12 = ((unint64_t)objc_msgSend(v3, "count") >> 1) - 1;
        objc_msgSend(v3, "objectAtIndexedSubscript:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v13;
        objc_msgSend(v3, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = v14;
        objc_msgSend(v3, "objectAtIndexedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22[2] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v16);

      }
      objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count") - 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count", v17) - 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v19);

      if (!v8)
        goto LABEL_15;
    }
    objc_msgSend(v4, "addObject:", v8);
    goto LABEL_15;
  }
  v5 = v3;

  v4 = v5;
LABEL_5:

  return v4;
}

- (void)_loadAndApplyImagesFromAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  -[PXSurveyQuestionAssetGroupView presentedAssetIds](self, "presentedAssetIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[PXSurveyQuestionAssetGroupView assetCollection](self, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithUUIDs:options:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke;
  v10[3] = &unk_1E51478D8;
  v10[4] = self;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

- (id)_imageViewForPosition:(unsigned __int8)a3 totalViewCount:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v4 = a4;
  v5 = a3;
  v7 = objc_alloc(MEMORY[0x1E0DC3890]);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = -[PXSurveyQuestionAssetGroupView getHorizontalViewCountForTotalNumberOfViews:](self, "getHorizontalViewCountForTotalNumberOfViews:", v4);
  v10 = -[PXSurveyQuestionAssetGroupView getVerticalViewCountForTotalNumberOfViews:](self, "getVerticalViewCountForTotalNumberOfViews:", v4);
  -[PXSurveyQuestionAssetGroupView frame](self, "frame");
  v12 = v11;
  if (v9 != 1)
    v12 = v11 / (double)v9 + self->_imagePadding * -0.5;
  -[PXSurveyQuestionAssetGroupView frame](self, "frame");
  if (v10)
    v14 = v13 / (double)v10;
  else
    v14 = v13 / 0.0 + self->_imagePadding * -0.5;
  -[PXSurveyQuestionAssetGroupView minXPositionForViewPosition:totalNumberOfViews:](self, "minXPositionForViewPosition:totalNumberOfViews:", v5, v4);
  v16 = v15;
  -[PXSurveyQuestionAssetGroupView minYPositionForViewPosition:totalNumberOfViews:](self, "minYPositionForViewPosition:totalNumberOfViews:", v5, v4);
  objc_msgSend(v8, "setFrame:", v16, v17, v12, v14);
  return v8;
}

- (unsigned)getVerticalViewCountForTotalNumberOfViews:(unsigned __int8)a3
{
  unsigned __int8 v3;

  if (a3 == 9)
    v3 = 3;
  else
    v3 = 0;
  if (a3 == 4)
    v3 = 2;
  if (a3 < 3u)
    return 1;
  else
    return v3;
}

- (unsigned)getHorizontalViewCountForTotalNumberOfViews:(unsigned __int8)a3
{
  char v3;
  unsigned __int8 v4;

  if (a3 == 9)
    v3 = 3;
  else
    v3 = 0;
  if (a3 >= 5u)
    v4 = v3;
  else
    v4 = 2;
  if (a3 >= 2u)
    return v4;
  else
    return 1;
}

- (void)setFrameForSubview:(id)a3 inPosition:(unsigned __int8)a4
{
  double v4;
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "bounds");
  v5 = v4;
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, v5);

}

- (double)minXPositionForViewPosition:(unsigned __int8)a3 totalNumberOfViews:(unsigned __int8)a4
{
  unsigned int v4;
  int v6;
  double result;
  double v8;
  double v9;
  double imagePadding;
  double v11;
  double v12;

  v4 = a3;
  v6 = -[PXSurveyQuestionAssetGroupView getHorizontalViewCountForTotalNumberOfViews:](self, "getHorizontalViewCountForTotalNumberOfViews:", a4);
  result = 0.0;
  if (v4 <= 9)
  {
    if (((1 << v4) & 0x124) != 0)
    {
      if (v6 == 3)
      {
        -[PXSurveyQuestionAssetGroupView frame](self, "frame", 0.0);
        return v12 / 3.0 + self->_imagePadding * 0.5;
      }
      if (v6 != 2)
      {
LABEL_8:
        -[PXSurveyQuestionAssetGroupView frame](self, "frame", 0.0);
        v9 = v8 / 1.5;
        imagePadding = self->_imagePadding;
        return imagePadding + v9;
      }
LABEL_11:
      -[PXSurveyQuestionAssetGroupView frame](self, "frame", 0.0);
      imagePadding = v11 * 0.5;
      v9 = self->_imagePadding * 0.5;
      return imagePadding + v9;
    }
    if (((1 << v4) & 0x248) != 0)
    {
      if (v6 == 2)
        return result;
      goto LABEL_8;
    }
    if (v4 == 4 && v6 == 2)
      goto LABEL_11;
  }
  return result;
}

- (double)minYPositionForViewPosition:(unsigned __int8)a3 totalNumberOfViews:(unsigned __int8)a4
{
  int v4;
  int v6;
  double result;
  double v8;
  double v9;
  double imagePadding;
  double v11;
  double v12;

  v4 = a3;
  v6 = -[PXSurveyQuestionAssetGroupView getVerticalViewCountForTotalNumberOfViews:](self, "getVerticalViewCountForTotalNumberOfViews:", a4);
  result = 0.0;
  switch(v4)
  {
    case 3:
      if (v6 == 2)
        goto LABEL_6;
      break;
    case 4:
      if (v6 != 2)
        goto LABEL_8;
LABEL_6:
      -[PXSurveyQuestionAssetGroupView frame](self, "frame", 0.0);
      imagePadding = v11 * 0.5;
      v9 = self->_imagePadding * 0.5;
      goto LABEL_7;
    case 5:
    case 6:
LABEL_8:
      -[PXSurveyQuestionAssetGroupView frame](self, "frame", 0.0);
      result = v12 / 3.0 + self->_imagePadding * 0.5;
      break;
    case 7:
    case 8:
    case 9:
      -[PXSurveyQuestionAssetGroupView frame](self, "frame", 0.0);
      v9 = v8 / 1.5;
      imagePadding = self->_imagePadding;
LABEL_7:
      result = imagePadding + v9;
      break;
    default:
      return result;
  }
  return result;
}

- (PXSurveyQuestionAssetGroupViewDelegate)delegate
{
  return (PXSurveyQuestionAssetGroupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)presentedAssetIds
{
  return self->_presentedAssetIds;
}

- (void)setPresentedAssetIds:(id)a3
{
  objc_storeStrong((id *)&self->_presentedAssetIds, a3);
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_imageViews, a3);
}

- (void)setImageViewsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewsQueue, a3);
}

- (UIView)metadataView
{
  return self->_metadataView;
}

- (void)setMetadataView:(id)a3
{
  objc_storeStrong((id *)&self->_metadataView, a3);
}

- (CAGradientLayer)metadataViewGradient
{
  return self->_metadataViewGradient;
}

- (void)setMetadataViewGradient:(id)a3
{
  objc_storeStrong((id *)&self->_metadataViewGradient, a3);
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_locationLabel, a3);
}

- (UILabel)dateRangeLabel
{
  return self->_dateRangeLabel;
}

- (void)setDateRangeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateRangeLabel, a3);
}

- (NSNumber)customMaximumPreviewAssetCount
{
  return self->_customMaximumPreviewAssetCount;
}

- (void)setCustomMaximumPreviewAssetCount:(id)a3
{
  objc_storeStrong((id *)&self->_customMaximumPreviewAssetCount, a3);
}

- (NSString)keyAssetLocalIdentifier
{
  return self->_keyAssetLocalIdentifier;
}

- (void)setKeyAssetLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetLocalIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_customMaximumPreviewAssetCount, 0);
  objc_storeStrong((id *)&self->_dateRangeLabel, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_metadataViewGradient, 0);
  objc_storeStrong((id *)&self->_metadataView, 0);
  objc_storeStrong((id *)&self->_imageViewsQueue, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_presentedAssetIds, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

void __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD block[5];
  NSObject *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v21[3];
  char v22;

  v5 = a2;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  objc_msgSend(*(id *)(a1 + 32), "imageViewsQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_2;
  block[3] = &unk_1E51402E0;
  v19 = v21;
  v20 = a3;
  block[4] = *(_QWORD *)(a1 + 32);
  v18 = v6;
  v9 = v6;
  dispatch_sync(v7, block);

  dispatch_get_global_queue(25, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_3;
  v13[3] = &unk_1E51402E0;
  v11 = *(_QWORD *)(a1 + 32);
  v15 = v21;
  v16 = a3;
  v13[4] = v11;
  v14 = v5;
  v12 = v5;
  dispatch_group_notify(v9, v10, v13);

  _Block_object_dispose(v21, 8);
}

void __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_2(uint64_t a1)
{
  unint64_t v2;

  v2 = *(_QWORD *)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "count");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_3(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CD15A0]);
    objc_msgSend(*(id *)(a1[4] + 456), "objectAtIndexedSubscript:", a1[7]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[5];
    objc_msgSend(v3, "bounds");
    v6 = v5;
    v8 = v7;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_4;
    v11[3] = &unk_1E51356B8;
    v9 = (void *)a1[5];
    v11[4] = a1[4];
    v12 = v9;
    v13 = v3;
    v10 = v3;
    objc_msgSend(v2, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v4, 1, 0, v11, v6, v8);

  }
}

void __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[5];
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "imageViewsQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_5;
  block[3] = &unk_1E5148D08;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  dispatch_sync(v4, block);

  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_6;
  v8[3] = &unk_1E5148D08;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "presentedAssetIds");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v2);

}

uint64_t __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
}

void __64__PXSurveyQuestionAssetGroupView__beginImageFetchFromCollection__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v2 = objc_alloc_init(MEMORY[0x1E0CD1570]);
  objc_msgSend(v2, "setFetchLimit:", 9);
  objc_msgSend(v2, "setIncludeHiddenAssets:", 0);
  objc_msgSend(v2, "setIncludeAllBurstAssets:", 0);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__203667;
  v13 = __Block_byref_object_dispose__203668;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "keyAssetLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)v10[5];
    objc_msgSend(*(id *)(a1 + 32), "keyAssetLocalIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448), v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__PXSurveyQuestionAssetGroupView__beginImageFetchFromCollection__block_invoke_150;
    v8[3] = &unk_1E5135690;
    v8[4] = &v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  }

  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "_arrangeAssetsForDisplay:", v10[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_loadAndApplyImagesFromAssets:", v7);

  _Block_object_dispose(&v9, 8);
}

void __64__PXSurveyQuestionAssetGroupView__beginImageFetchFromCollection__block_invoke_150(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "localIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __45__PXSurveyQuestionAssetGroupView__setupViews__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginImageFetchFromCollection");
}

void __45__PXSurveyQuestionAssetGroupView__setupViews__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "imageViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PXSurveyQuestionAssetGroupView__setupViews__block_invoke_2;
  block[3] = &unk_1E51457C8;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __45__PXSurveyQuestionAssetGroupView__setupViews__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __43__PXSurveyQuestionAssetGroupView_setFrame___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "enumerateObjectsUsingBlock:", &__block_literal_global_203683);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "removeAllObjects");
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PXSurveyQuestionAssetGroupView_setFrame___block_invoke_3;
  block[3] = &unk_1E5149198;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __43__PXSurveyQuestionAssetGroupView_setFrame___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupViews");
}

uint64_t __43__PXSurveyQuestionAssetGroupView_setFrame___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

@end
