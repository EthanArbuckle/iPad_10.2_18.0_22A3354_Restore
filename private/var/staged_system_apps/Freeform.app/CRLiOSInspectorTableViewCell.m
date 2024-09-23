@implementation CRLiOSInspectorTableViewCell

- (CRLiOSInspectorTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CRLiOSInspectorTableViewCell *v10;
  CRLiOSInspectorTableViewCell *v11;
  objc_super v13;

  v6 = a4;
  if (a3 == 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257F78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2B074();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257F98);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInspectorTableViewCell initWithStyle:reuseIdentifier:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Inspectors/CRLiOSInspectorTableViewCell.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 205, 0, "Table View Cell style Value2 is not supported in CRLiOSInspectorTableViewCell.");

    a3 = 1;
  }
  v13.receiver = self;
  v13.super_class = (Class)CRLiOSInspectorTableViewCell;
  v10 = -[CRLiOSInspectorTableViewCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, v6);
  v11 = v10;
  if (v10)
    -[CRLiOSInspectorTableViewCell p_commonInitWithStyle:](v10, "p_commonInitWithStyle:", a3);

  return v11;
}

- (CRLiOSInspectorTableViewCell)initWithCoder:(id)a3
{
  id v4;
  CRLiOSInspectorTableViewCell *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLiOSInspectorTableViewCell;
  v5 = -[CRLiOSInspectorTableViewCell initWithCoder:](&v11, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UITableViewCellStyle"));
    if (v6 == (id)2)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257FB8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2B0F4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257FD8);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInspectorTableViewCell initWithCoder:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Inspectors/CRLiOSInspectorTableViewCell.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 219, 0, "Table View Cell style Value2 is not supported in CRLiOSInspectorTableViewCell.");

    }
    -[CRLiOSInspectorTableViewCell p_commonInitWithStyle:](v5, "p_commonInitWithStyle:", v6);
  }

  return v5;
}

- (void)p_commonInitWithStyle:(int64_t)a3
{
  NSArray *activeConstraints;
  CRLiOSInspectorTableViewCellBackgroundView *v5;
  double y;
  double width;
  double height;
  CRLiOSInspectorTableViewCellBackgroundView *v9;
  CRLiOSInspectorTableViewCellBackgroundView *customBackgroundView;
  CRLiOSInspectorTableViewCellSelectedBackgroundView *v11;
  CRLiOSInspectorTableViewCellSelectedBackgroundView *customSelectedBackgroundView;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  UILayoutGuide *v17;
  UILayoutGuide *firstRowLayoutGuide;
  void *v19;
  UILayoutGuide *v20;
  UILayoutGuide *secondRowLayoutGuide;
  void *v22;
  UILayoutGuide *v23;
  UILayoutGuide *thirdRowLayoutGuide;
  void *v25;
  UILayoutGuide *v26;
  UILayoutGuide *titleAreaLayoutGuide;
  void *v28;
  UILayoutGuide *v29;
  UILayoutGuide *accessoryViewLayoutGuide;
  void *v31;
  UILayoutGuide *v32;
  UILayoutGuide *firstRowCenterFreeSpaceLayoutGuide;
  void *v34;
  UILayoutGuide *v35;
  UILayoutGuide *insetFirstRowCenterFreeSpaceLayoutGuide;
  void *v37;
  UILayoutGuide *v38;
  UILayoutGuide *titleAndDetailLayoutGuide;
  void *v40;
  void *v41;
  uint64_t v42;
  double v43;
  id v44;
  double v45;
  void *v46;
  id v47;

  self->_cellStyle = a3;
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = (NSArray *)&__NSArray0__struct;

  self->_activeConstrainedElements = 0;
  self->_automaticallyResizesForContentSizeCategory = 1;
  self->_usesTitleLabelColor = 1;
  self->_imageUsesTitleLabelColor = 1;
  self->_expandTextLabelToFillCell = 0;
  v5 = [CRLiOSInspectorTableViewCellBackgroundView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = -[CRLiOSInspectorTableViewCellBackgroundView initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  customBackgroundView = self->_customBackgroundView;
  self->_customBackgroundView = v9;

  -[CRLiOSInspectorTableViewCell setBackgroundView:](self, "setBackgroundView:", self->_customBackgroundView);
  v11 = -[CRLiOSInspectorTableViewCellSelectedBackgroundView initWithFrame:]([CRLiOSInspectorTableViewCellSelectedBackgroundView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  customSelectedBackgroundView = self->_customSelectedBackgroundView;
  self->_customSelectedBackgroundView = v11;

  -[CRLiOSInspectorTableViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", self->_customSelectedBackgroundView);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_storeWeak((id *)&self->_titleLabelColor, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_storeWeak((id *)&self->_detailLabelColor, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_storeWeak((id *)&self->_disclosureDetailLabelColor, v15);

  self->_usesDisclosureDetailLabelColor = 1;
  self->_usesSubtitleLabelColor = 0;
  -[CRLiOSInspectorTableViewCell setIndentationWidth:](self, "setIndentationWidth:", 16.0);
  self->_disablesContentWhenNotUserInteractive = 1;
  v16 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->_imageInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->_imageInsets.bottom = v16;
  v17 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  firstRowLayoutGuide = self->_firstRowLayoutGuide;
  self->_firstRowLayoutGuide = v17;

  -[UILayoutGuide setIdentifier:](self->_firstRowLayoutGuide, "setIdentifier:", CFSTR("firstRowLayoutGuide"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
  objc_msgSend(v19, "addLayoutGuide:", self->_firstRowLayoutGuide);

  v20 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  secondRowLayoutGuide = self->_secondRowLayoutGuide;
  self->_secondRowLayoutGuide = v20;

  -[UILayoutGuide setIdentifier:](self->_secondRowLayoutGuide, "setIdentifier:", CFSTR("secondRowLayoutGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
  objc_msgSend(v22, "addLayoutGuide:", self->_secondRowLayoutGuide);

  v23 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  thirdRowLayoutGuide = self->_thirdRowLayoutGuide;
  self->_thirdRowLayoutGuide = v23;

  -[UILayoutGuide setIdentifier:](self->_thirdRowLayoutGuide, "setIdentifier:", CFSTR("thirdRowLayoutGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
  objc_msgSend(v25, "addLayoutGuide:", self->_thirdRowLayoutGuide);

  v26 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  titleAreaLayoutGuide = self->_titleAreaLayoutGuide;
  self->_titleAreaLayoutGuide = v26;

  -[UILayoutGuide setIdentifier:](self->_titleAreaLayoutGuide, "setIdentifier:", CFSTR("titleAreaLayoutGuide"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
  objc_msgSend(v28, "addLayoutGuide:", self->_titleAreaLayoutGuide);

  v29 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  accessoryViewLayoutGuide = self->_accessoryViewLayoutGuide;
  self->_accessoryViewLayoutGuide = v29;

  -[UILayoutGuide setIdentifier:](self->_accessoryViewLayoutGuide, "setIdentifier:", CFSTR("accessoryViewLayoutGuide"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
  objc_msgSend(v31, "addLayoutGuide:", self->_accessoryViewLayoutGuide);

  v32 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  firstRowCenterFreeSpaceLayoutGuide = self->_firstRowCenterFreeSpaceLayoutGuide;
  self->_firstRowCenterFreeSpaceLayoutGuide = v32;

  -[UILayoutGuide setIdentifier:](self->_firstRowCenterFreeSpaceLayoutGuide, "setIdentifier:", CFSTR("firstRowCenterFreeSpaceLayoutGuide"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
  objc_msgSend(v34, "addLayoutGuide:", self->_firstRowCenterFreeSpaceLayoutGuide);

  v35 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  insetFirstRowCenterFreeSpaceLayoutGuide = self->_insetFirstRowCenterFreeSpaceLayoutGuide;
  self->_insetFirstRowCenterFreeSpaceLayoutGuide = v35;

  -[UILayoutGuide setIdentifier:](self->_insetFirstRowCenterFreeSpaceLayoutGuide, "setIdentifier:", CFSTR("insetFirstRowCenterFreeSpaceLayoutGuide"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
  objc_msgSend(v37, "addLayoutGuide:", self->_insetFirstRowCenterFreeSpaceLayoutGuide);

  v38 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  titleAndDetailLayoutGuide = self->_titleAndDetailLayoutGuide;
  self->_titleAndDetailLayoutGuide = v38;

  -[UILayoutGuide setIdentifier:](self->_titleAndDetailLayoutGuide, "setIdentifier:", CFSTR("titleAndDetailLayoutGuide"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
  objc_msgSend(v40, "addLayoutGuide:", self->_titleAndDetailLayoutGuide);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell heightAnchor](self, "heightAnchor"));
  *(_QWORD *)&v43 = objc_opt_class(self, v42).n128_u64[0];
  objc_msgSend(v44, "minimumHeight", v43);
  v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintGreaterThanOrEqualToConstant:"));

  LODWORD(v45) = 1148829696;
  objc_msgSend(v47, "setPriority:", v45);
  objc_msgSend(v47, "setActive:", 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v46, "addObserver:selector:name:object:", self, "p_willChangeStatusBarOrientation:", UIApplicationWillChangeStatusBarOrientationNotification, 0);
  objc_msgSend(v46, "addObserver:selector:name:object:", self, "p_contentSizeCategoryDidChangeNotification:", UIContentSizeCategoryDidChangeNotification, 0);
  -[CRLiOSInspectorTableViewCell p_setNeedsUpdateConstraints](self, "p_setNeedsUpdateConstraints");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSInspectorTableViewCell;
  -[CRLiOSInspectorTableViewCell dealloc](&v4, "dealloc");
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (BOOL)currentContentSizeCategoryWrapsToNextLine
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (CRLiOSInspectorLabel)customTextLabel
{
  CRLiOSInspectorLabel *customTextLabel;
  CRLiOSInspectorLabel *v4;
  CRLiOSInspectorLabel *v5;
  void *v6;
  void *v7;

  customTextLabel = self->_customTextLabel;
  if (!customTextLabel)
  {
    v4 = -[CRLiOSInspectorLabel initWithFrame:]([CRLiOSInspectorLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_customTextLabel;
    self->_customTextLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_currentLabelFont](self, "p_currentLabelFont"));
    -[CRLiOSInspectorLabel setFont:](self->_customTextLabel, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
    objc_msgSend(v7, "addSubview:", self->_customTextLabel);

    -[CRLiOSInspectorTableViewCell p_setNeedsUpdateConstraints](self, "p_setNeedsUpdateConstraints");
    customTextLabel = self->_customTextLabel;
  }
  return customTextLabel;
}

- (BOOL)hasTextLabel
{
  return self->_customTextLabel != 0;
}

- (UILabel)customDetailTextLabel
{
  UILabel *customDetailTextLabel;
  CRLiOSInspectorLabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;

  customDetailTextLabel = self->_customDetailTextLabel;
  if (!customDetailTextLabel)
  {
    if (self->_cellStyle)
    {
      v4 = -[CRLiOSInspectorLabel initWithFrame:]([CRLiOSInspectorLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v5 = self->_customDetailTextLabel;
      self->_customDetailTextLabel = &v4->super;

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_currentDetailLabelFont](self, "p_currentDetailLabelFont"));
      -[UILabel setFont:](self->_customDetailTextLabel, "setFont:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
      objc_msgSend(v7, "addSubview:", self->_customDetailTextLabel);

      -[CRLiOSInspectorTableViewCell p_setNeedsUpdateConstraints](self, "p_setNeedsUpdateConstraints");
      customDetailTextLabel = self->_customDetailTextLabel;
    }
    else
    {
      customDetailTextLabel = 0;
    }
  }
  return customDetailTextLabel;
}

- (CRLiOSInspectorTableCellImageView)customImageView
{
  CRLiOSInspectorTableCellImageView *customImageView;
  CRLiOSInspectorTableCellImageView *v4;
  CRLiOSInspectorTableCellImageView *v5;
  void *v6;
  CRLiOSInspectorTableCellImageButton *customImageButton;

  customImageView = self->_customImageView;
  if (!customImageView)
  {
    v4 = -[CRLiOSInspectorTableCellImageView initWithFrame:]([CRLiOSInspectorTableCellImageView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_customImageView;
    self->_customImageView = v4;

    -[CRLiOSInspectorTableCellImageView setContentMode:](self->_customImageView, "setContentMode:", 4);
    -[CRLiOSInspectorTableCellImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_customImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CRLiOSInspectorTableCellImageView setParentCell:](self->_customImageView, "setParentCell:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
    objc_msgSend(v6, "addSubview:", self->_customImageView);

    -[CRLiOSInspectorTableCellImageButton removeFromSuperview](self->_customImageButton, "removeFromSuperview");
    customImageButton = self->_customImageButton;
    self->_customImageButton = 0;

    -[CRLiOSInspectorTableViewCell p_setNeedsUpdateConstraints](self, "p_setNeedsUpdateConstraints");
    customImageView = self->_customImageView;
  }
  return customImageView;
}

- (CRLiOSInspectorTableCellImageButton)customImageButton
{
  CRLiOSInspectorTableCellImageButton *customImageButton;
  CRLiOSInspectorTableCellImageButton *v4;
  CRLiOSInspectorTableCellImageButton *v5;
  void *v6;
  CRLiOSInspectorTableCellImageView *customImageView;

  customImageButton = self->_customImageButton;
  if (!customImageButton)
  {
    v4 = -[CRLiOSInspectorTableCellImageButton initWithFrame:]([CRLiOSInspectorTableCellImageButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_customImageButton;
    self->_customImageButton = v4;

    -[CRLiOSInspectorTableCellImageButton setContentMode:](self->_customImageButton, "setContentMode:", 4);
    -[CRLiOSInspectorTableCellImageButton setTranslatesAutoresizingMaskIntoConstraints:](self->_customImageButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CRLiOSInspectorTableCellImageButton setParentCell:](self->_customImageButton, "setParentCell:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
    objc_msgSend(v6, "addSubview:", self->_customImageButton);

    -[CRLiOSInspectorTableCellImageView removeFromSuperview](self->_customImageView, "removeFromSuperview");
    customImageView = self->_customImageView;
    self->_customImageView = 0;

    -[CRLiOSInspectorTableViewCell p_setNeedsUpdateConstraints](self, "p_setNeedsUpdateConstraints");
    customImageButton = self->_customImageButton;
  }
  return customImageButton;
}

- (int64_t)customAccessoryType
{
  return self->_customAccessoryType;
}

- (void)setCustomAccessoryType:(int64_t)customAccessoryType
{
  void *v4;
  void *v5;
  void *v6;
  UIView *customStandardAccessoryView;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  UIView *v11;

  if (customAccessoryType == 3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257FF8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2B174();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258018);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInspectorTableViewCell setCustomAccessoryType:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Inspectors/CRLiOSInspectorTableViewCell.m"));

    -[CRLiOSInspectorTableViewCell setChecked:](self, "setChecked:", 1);
  }
  else if (self->_customAccessoryType != customAccessoryType)
  {
    self->_customAccessoryType = customAccessoryType;
    customStandardAccessoryView = self->_customStandardAccessoryView;
    if (customStandardAccessoryView)
    {
      -[UIView removeFromSuperview](customStandardAccessoryView, "removeFromSuperview");
      customAccessoryType = self->_customAccessoryType;
    }
    if ((unint64_t)customAccessoryType <= 4)
    {
      if (((1 << customAccessoryType) & 0xB) != 0)
      {
        v8 = self->_customStandardAccessoryView;
        self->_customStandardAccessoryView = 0;
      }
      else
      {
        v9 = (UIView *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 2));
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIView addTarget:action:forControlEvents:](v9, "addTarget:action:forControlEvents:", self, "p_detailButtonTapped:", 64);
        v10 = self->_customStandardAccessoryView;
        self->_customStandardAccessoryView = v9;
        v11 = v9;

        v8 = (UIView *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
        -[UIView addSubview:](v8, "addSubview:", self->_customStandardAccessoryView);

      }
    }
    -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setCustomAccessoryView:(id)a3
{
  UIView *v5;
  UIView **p_customAccessoryView;
  UIView *customAccessoryView;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_customAccessoryView = &self->_customAccessoryView;
  customAccessoryView = self->_customAccessoryView;
  if (customAccessoryView != v5)
  {
    v9 = v5;
    if (customAccessoryView)
      -[UIView removeFromSuperview](customAccessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customAccessoryView, a3);
    if (*p_customAccessoryView)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
      objc_msgSend(v8, "addSubview:", *p_customAccessoryView);

    }
    -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v9;
  }

}

+ (double)minimumHeight
{
  return 44.0;
}

- (void)setCheckable:(BOOL)a3
{
  _BOOL8 v4;
  id v5;

  if (self->_checkable != a3)
  {
    self->_checkable = a3;
    -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v4 = !self->_checked;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell checkmarkView](self, "checkmarkView"));
    objc_msgSend(v5, "setHidden:", v4);

  }
}

- (void)setChecked:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  UIAccessibilityTraits v10;
  UIAccessibilityTraits v11;

  v3 = a3;
  if (!self->_checkable)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258038);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2B1F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258058);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInspectorTableViewCell setChecked:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Inspectors/CRLiOSInspectorTableViewCell.m"));

  }
  if (self->_checked != v3)
  {
    self->_checked = v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell checkmarkView](self, "checkmarkView"));
    objc_msgSend(v8, "setHidden:", !v3);

  }
  if (v3)
  {
    v9 = (unint64_t)-[CRLiOSInspectorTableViewCell accessibilityTraits](self, "accessibilityTraits");
    v10 = UIAccessibilityTraitSelected | v9;
  }
  else
  {
    v11 = UIAccessibilityTraitSelected;
    v10 = (unint64_t)-[CRLiOSInspectorTableViewCell accessibilityTraits](self, "accessibilityTraits") & ~v11;
  }
  -[CRLiOSInspectorTableViewCell setAccessibilityTraits:](self, "setAccessibilityTraits:", v10);
}

- (void)setCustomCheckmarkImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_customCheckmarkImage != v5)
  {
    objc_storeStrong((id *)&self->_customCheckmarkImage, a3);
    -[CRLiOSInspectorCheckmark setCustomCheckmarkImage:](self->_checkmarkView, "setCustomCheckmarkImage:", v5);
    -[CRLiOSInspectorCheckmark setUsesCustomCheckmarkImage:](self->_checkmarkView, "setUsesCustomCheckmarkImage:", v5 != 0);
    -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)setCustomHighlightedCheckmarkImage:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_customHighlightedCheckmarkImage != v6)
  {
    objc_storeStrong((id *)&self->_customHighlightedCheckmarkImage, a3);
    -[CRLiOSInspectorCheckmark setCustomHighlightedCheckmarkImage:](self->_checkmarkView, "setCustomHighlightedCheckmarkImage:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorCheckmark customCheckmarkImage](self->_checkmarkView, "customCheckmarkImage"));
    -[CRLiOSInspectorCheckmark setUsesCustomCheckmarkImage:](self->_checkmarkView, "setUsesCustomCheckmarkImage:", v5 != 0);

    -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)setFullSizeControl:(id)a3
{
  UIView *v5;
  UIView *fullSizeControl;
  UIView *v7;

  v5 = (UIView *)a3;
  fullSizeControl = self->_fullSizeControl;
  if (fullSizeControl != v5)
  {
    v7 = v5;
    if (fullSizeControl)
      -[UIView removeFromSuperview](fullSizeControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_fullSizeControl, a3);
    -[UIView removeFromSuperview](self->_fullSizeControl, "removeFromSuperview");
    -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v7;
  }

}

- (void)setFullSizeControlInsets:(UIEdgeInsets)a3
{
  if (self->_fullSizeControlInsets.left != a3.left
    || self->_fullSizeControlInsets.top != a3.top
    || self->_fullSizeControlInsets.right != a3.right
    || self->_fullSizeControlInsets.bottom != a3.bottom)
  {
    self->_fullSizeControlInsets = a3;
    -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_imageInsets.left
    || a3.top != self->_imageInsets.top
    || a3.right != self->_imageInsets.right
    || a3.bottom != self->_imageInsets.bottom)
  {
    self->_imageInsets = a3;
    -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setImageUsesStandardMargins:(BOOL)a3
{
  if (self->_imageUsesStandardMargins != a3)
  {
    self->_imageUsesStandardMargins = a3;
    -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (UIButton)imageButton
{
  return (UIButton *)-[CRLiOSInspectorTableViewCell customImageButton](self, "customImageButton");
}

- (void)setTitleLabelColor:(id)a3
{
  id WeakRetained;
  _BOOL4 usesTitleLabelColor;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabelColor);
  if (WeakRetained == obj)
  {

  }
  else
  {
    usesTitleLabelColor = self->_usesTitleLabelColor;

    if (usesTitleLabelColor)
    {
      objc_storeWeak((id *)&self->_titleLabelColor, obj);
      -[CRLiOSInspectorLabel setTextColor:](self->_customTextLabel, "setTextColor:", obj);
      if (self->_imageUsesTitleLabelColor)
        -[CRLiOSInspectorTableViewCell p_updateImageTintColor](self, "p_updateImageTintColor");
    }
  }

}

- (void)setImageUsesTitleLabelColor:(BOOL)a3
{
  if (self->_imageUsesTitleLabelColor != a3)
  {
    self->_imageUsesTitleLabelColor = a3;
    -[CRLiOSInspectorTableViewCell p_updateImageTintColor](self, "p_updateImageTintColor");
  }
}

- (void)setDetailLabelColor:(id)a3
{
  id WeakRetained;
  void *v5;
  int64_t cellStyle;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_detailLabelColor);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_detailLabelColor, obj);
    v5 = obj;
    cellStyle = self->_cellStyle;
    if (cellStyle == 3 || cellStyle == 1 && !self->_usesDisclosureDetailLabelColor)
    {
      -[UILabel setTextColor:](self->_customDetailTextLabel, "setTextColor:", obj);
      v5 = obj;
    }
  }

}

- (void)setDisclosureDetailLabelColor:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_disclosureDetailLabelColor);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_disclosureDetailLabelColor, obj);
    v5 = obj;
    if (self->_cellStyle == 1 && self->_usesDisclosureDetailLabelColor)
    {
      -[UILabel setTextColor:](self->_customDetailTextLabel, "setTextColor:", obj);
      v5 = obj;
    }
  }

}

- (void)setSubtitleLabelColor:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_subtitleLabelColor);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_subtitleLabelColor, obj);
    v5 = obj;
    if (self->_cellStyle == 3 && self->_usesSubtitleLabelColor)
    {
      -[UILabel setTextColor:](self->_customDetailTextLabel, "setTextColor:", obj);
      v5 = obj;
    }
  }

}

- (void)setDetailButtonColor:(id)a3
{
  id WeakRetained;
  _BOOL4 usesDetailButtonColor;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_detailButtonColor);
  if (WeakRetained == obj)
  {

  }
  else
  {
    usesDetailButtonColor = self->_usesDetailButtonColor;

    if (usesDetailButtonColor)
    {
      objc_storeWeak((id *)&self->_detailButtonColor, obj);
      -[UIView setTintColor:](self->_customStandardAccessoryView, "setTintColor:", obj);
    }
  }

}

- (void)setUsesDetailButtonColor:(BOOL)a3
{
  id v4;

  if (self->_usesDetailButtonColor != a3)
  {
    self->_usesDetailButtonColor = a3;
    if ((self->_activeConstrainedElements & 0x400) != 0 && a3)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell detailButtonColor](self, "detailButtonColor"));
      -[UIView setTintColor:](self->_customStandardAccessoryView, "setTintColor:", v4);

    }
  }
}

- (void)setUsesDisclosureDetailLabelColor:(BOOL)a3
{
  id v4;

  if (self->_usesDisclosureDetailLabelColor != a3)
  {
    self->_usesDisclosureDetailLabelColor = a3;
    if (self->_cellStyle == 1 && (self->_activeConstrainedElements & 0x200) != 0 && a3)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell disclosureDetailLabelColor](self, "disclosureDetailLabelColor"));
      -[UILabel setTextColor:](self->_customDetailTextLabel, "setTextColor:", v4);

    }
  }
}

- (void)setUsesSubtitleLabelColor:(BOOL)a3
{
  id v4;

  if (self->_usesSubtitleLabelColor != a3)
  {
    self->_usesSubtitleLabelColor = a3;
    if ((self->_activeConstrainedElements & 2) != 0 && a3)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell subtitleLabelColor](self, "subtitleLabelColor"));
      -[UILabel setTextColor:](self->_customDetailTextLabel, "setTextColor:", v4);

    }
  }
}

- (void)setDisablesContentWhenNotUserInteractive:(BOOL)a3
{
  if (self->_disablesContentWhenNotUserInteractive != a3)
  {
    self->_disablesContentWhenNotUserInteractive = a3;
    -[CRLiOSInspectorTableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", -[CRLiOSInspectorTableViewCell isUserInteractionEnabled](self, "isUserInteractionEnabled"));
  }
}

- (void)setExpandAccessoryViewToFillCellHorizontally:(BOOL)a3
{
  if (self->_expandAccessoryViewToFillCellHorizontally != a3)
  {
    self->_expandAccessoryViewToFillCellHorizontally = a3;
    if ((self->_activeConstrainedElements & 0x400) != 0)
      -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setPreventTextLabelFromCompression:(BOOL)a3
{
  if (self->_preventTextLabelFromCompression != a3)
  {
    self->_preventTextLabelFromCompression = a3;
    if ((self->_activeConstrainedElements & 1) != 0)
      -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setAutomaticallyResizesForContentSizeCategory:(BOOL)a3
{
  if (self->_automaticallyResizesForContentSizeCategory != a3)
  {
    self->_automaticallyResizesForContentSizeCategory = a3;
    -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setLegacyFixedRowHeight:(double)a3
{
  if (self->_legacyFixedRowHeight != a3)
  {
    if (a3 < 0.0)
      a3 = 0.0;
    if (a3 > 0.0)
      self->_automaticallyResizesForContentSizeCategory = 0;
    self->_legacyFixedRowHeight = a3;
    -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (id)activeLayoutConstraints
{
  return self->_activeConstraints;
}

- (unint64_t)p_elementsToConstrain
{
  CRLiOSInspectorLabel *customTextLabel;
  void *v4;
  uint64_t v5;
  UILabel *customDetailTextLabel;
  void *v7;
  id v8;
  int64_t cellStyle;
  CRLiOSInspectorTableCellImageView *customImageView;
  void *v11;
  CRLiOSInspectorTableCellImageButton *customImageButton;
  void *v13;
  uint64_t v14;
  int64_t customAccessoryType;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;

  customTextLabel = self->_customTextLabel;
  if (customTextLabel)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorLabel text](customTextLabel, "text"));
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }
  customDetailTextLabel = self->_customDetailTextLabel;
  if (customDetailTextLabel)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](customDetailTextLabel, "text"));
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      cellStyle = self->_cellStyle;
      if (cellStyle == 1)
      {
        if (-[CRLiOSInspectorTableViewCell currentContentSizeCategoryWrapsToNextLine](self, "currentContentSizeCategoryWrapsToNextLine"))
        {
          v5 |= 2uLL;
        }
        else
        {
          v5 |= 4uLL;
        }
      }
      else if (cellStyle == 3)
      {
        v5 |= 2uLL;
      }
    }
  }
  customImageView = self->_customImageView;
  if (customImageView)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView image](customImageView, "image"));

    if (v11)
    {
      if (-[CRLiOSInspectorTableViewCell showsImageOnTrailingEdge](self, "showsImageOnTrailingEdge"))
        v5 |= 0x40uLL;
      else
        v5 |= 0x20uLL;
    }
  }
  customImageButton = self->_customImageButton;
  if (customImageButton)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton imageForState:](customImageButton, "imageForState:", 0));

    if (v13)
    {
      if (-[CRLiOSInspectorTableViewCell showsImageOnTrailingEdge](self, "showsImageOnTrailingEdge"))
        v5 |= 0x100uLL;
      else
        v5 |= 0x80uLL;
    }
  }
  if (self->_customAccessoryView)
    v14 = v5 | 0x400;
  else
    v14 = v5;
  customAccessoryType = self->_customAccessoryType;
  v16 = v14 | 0x200;
  v17 = v14 | 0x800;
  if (customAccessoryType == 2)
    v14 |= 0xA00uLL;
  if (customAccessoryType == 4)
    v14 = v17;
  if (customAccessoryType == 1)
    v18 = v16;
  else
    v18 = v14;
  if (-[CRLiOSInspectorTableViewCell checkable](self, "checkable")
    && (-[CRLiOSInspectorTableViewCell isEditing](self, "isEditing") & 1) == 0)
  {
    if (-[CRLiOSInspectorTableViewCell showsCheckmarkOnLeadingEdge](self, "showsCheckmarkOnLeadingEdge"))
      v18 |= 0x10uLL;
    else
      v18 |= 8uLL;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell fullSizeControl](self, "fullSizeControl"));

  if (v19)
    return v18 | 0x1000;
  else
    return v18;
}

- (void)p_prepareToChangeConstraintsForElements:(unint64_t)a3
{
  __int16 v3;
  unint64_t activeConstrainedElements;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CRLiOSInspectorCheckmark *v16;
  CRLiOSInspectorCheckmark *checkmarkView;
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
  CRLiOSInspectorTableViewCellDisclosureImageView *v28;
  UIImageView *disclosureView;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UIView *customAccessoryView;
  void *v35;
  void *v36;
  UIView *customStandardAccessoryView;
  void *v38;
  void *v39;
  UIView *fullSizeControl;
  void *v41;

  v3 = a3;
  activeConstrainedElements = self->_activeConstrainedElements;
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_activeConstraints);
  if ((v3 & 1) == 0 || (activeConstrainedElements & 1) != 0)
  {
    if ((v3 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorLabel superview](self->_customTextLabel, "superview"));

      if (v9)
        -[CRLiOSInspectorLabel removeFromSuperview](self->_customTextLabel, "removeFromSuperview");
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorLabel superview](self->_customTextLabel, "superview"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
      objc_msgSend(v7, "addSubview:", self->_customTextLabel);

    }
    if (self->_usesTitleLabelColor)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell titleLabelColor](self, "titleLabelColor"));
      -[CRLiOSInspectorLabel setTextColor:](self->_customTextLabel, "setTextColor:", v8);

    }
  }
  if ((activeConstrainedElements & 6) != 0)
  {
    if ((v3 & 6) != 0)
      goto LABEL_28;
    goto LABEL_17;
  }
  if ((v3 & 6) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_customDetailTextLabel, "superview"));

    if (v10)
    {
      if ((v3 & 0x200) == 0)
        goto LABEL_23;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
      objc_msgSend(v12, "addSubview:", self->_customDetailTextLabel);

      if ((v3 & 0x200) == 0)
        goto LABEL_23;
    }
    if (self->_cellStyle == 1 && self->_usesDisclosureDetailLabelColor)
    {
      v13 = objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell disclosureDetailLabelColor](self, "disclosureDetailLabelColor"));
LABEL_27:
      v14 = (void *)v13;
      -[UILabel setTextColor:](self->_customDetailTextLabel, "setTextColor:", v13);

      goto LABEL_28;
    }
LABEL_23:
    if ((v3 & 2) != 0 && self->_usesSubtitleLabelColor)
      v13 = objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell subtitleLabelColor](self, "subtitleLabelColor"));
    else
      v13 = objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell detailLabelColor](self, "detailLabelColor"));
    goto LABEL_27;
  }
LABEL_17:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_customDetailTextLabel, "superview"));

  if (v11)
    -[UILabel removeFromSuperview](self->_customDetailTextLabel, "removeFromSuperview");
LABEL_28:
  if ((v3 & 0x18) == 0 || (activeConstrainedElements & 0x18) != 0)
  {
    if ((v3 & 0x18) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorCheckmark superview](self->_checkmarkView, "superview"));

      if (v19)
        -[CRLiOSInspectorCheckmark removeFromSuperview](self->_checkmarkView, "removeFromSuperview");
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorCheckmark superview](self->_checkmarkView, "superview"));

    if (!v15)
    {
      if (!self->_checkmarkView)
      {
        v16 = (CRLiOSInspectorCheckmark *)objc_claimAutoreleasedReturnValue(+[CRLiOSInspectorCheckmark checkmark](CRLiOSInspectorCheckmark, "checkmark"));
        checkmarkView = self->_checkmarkView;
        self->_checkmarkView = v16;

        -[CRLiOSInspectorCheckmark setHidden:](self->_checkmarkView, "setHidden:", -[CRLiOSInspectorTableViewCell checked](self, "checked") ^ 1);
        -[CRLiOSInspectorCheckmark setTranslatesAutoresizingMaskIntoConstraints:](self->_checkmarkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[CRLiOSInspectorCheckmark setAccessibilityElementsHidden:](self->_checkmarkView, "setAccessibilityElementsHidden:", 1);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
      objc_msgSend(v18, "addSubview:", self->_checkmarkView);

      if (self->_customCheckmarkImage)
      {
        -[CRLiOSInspectorCheckmark setUsesCustomCheckmarkImage:](self->_checkmarkView, "setUsesCustomCheckmarkImage:", 1);
        -[CRLiOSInspectorCheckmark setCustomCheckmarkImage:](self->_checkmarkView, "setCustomCheckmarkImage:", self->_customCheckmarkImage);
        -[CRLiOSInspectorCheckmark setCustomHighlightedCheckmarkImage:](self->_checkmarkView, "setCustomHighlightedCheckmarkImage:", self->_customHighlightedCheckmarkImage);
      }
    }
  }
  if ((v3 & 0x60) == 0 || (activeConstrainedElements & 0x60) != 0)
  {
    if ((v3 & 0x60) == 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView superview](self->_customImageView, "superview"));

      if (v22)
        -[CRLiOSInspectorTableCellImageView removeFromSuperview](self->_customImageView, "removeFromSuperview");
    }
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView superview](self->_customImageView, "superview"));

    if (!v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
      objc_msgSend(v21, "addSubview:", self->_customImageView);

    }
  }
  if ((v3 & 0x180) == 0 || (activeConstrainedElements & 0x180) != 0)
  {
    if ((v3 & 0x180) == 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton superview](self->_customImageButton, "superview"));

      if (v25)
        -[CRLiOSInspectorTableCellImageButton removeFromSuperview](self->_customImageButton, "removeFromSuperview");
    }
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton superview](self->_customImageButton, "superview"));

    if (!v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
      objc_msgSend(v24, "addSubview:", self->_customImageButton);

    }
  }
  if ((v3 & 0x200) == 0 || (activeConstrainedElements & 0x200) != 0)
  {
    if ((v3 & 0x200) == 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView superview](self->_disclosureView, "superview"));

      if (v32)
        -[UIImageView removeFromSuperview](self->_disclosureView, "removeFromSuperview");
    }
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView superview](self->_disclosureView, "superview"));

    if (!v26)
    {
      if (!self->_disclosureView)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward")));
        v28 = -[CRLiOSInspectorTableViewCellDisclosureImageView initWithImage:]([CRLiOSInspectorTableViewCellDisclosureImageView alloc], "initWithImage:", v27);
        disclosureView = self->_disclosureView;
        self->_disclosureView = &v28->super;

        -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_disclosureView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIImageView setContentMode:](self->_disclosureView, "setContentMode:", 4);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
        -[UIImageView setTintColor:](self->_disclosureView, "setTintColor:", v30);

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
      objc_msgSend(v31, "addSubview:", self->_disclosureView);

    }
  }
  if ((v3 & 0x400) == 0 || (activeConstrainedElements & 0x400) != 0)
  {
    if ((v3 & 0x400) == 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_customAccessoryView, "superview"));

      if (v35)
      {
        -[UIView removeFromSuperview](self->_customAccessoryView, "removeFromSuperview");
        customAccessoryView = self->_customAccessoryView;
        self->_customAccessoryView = 0;
        goto LABEL_68;
      }
    }
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_customAccessoryView, "superview"));

    if (!v33)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_customAccessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      customAccessoryView = (UIView *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
      -[UIView addSubview:](customAccessoryView, "addSubview:", self->_customAccessoryView);
LABEL_68:

    }
  }
  if ((v3 & 0x800) == 0 || (activeConstrainedElements & 0x800) != 0)
  {
    if ((v3 & 0x800) == 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_customStandardAccessoryView, "superview"));

      if (v38)
      {
        -[UIView removeFromSuperview](self->_customStandardAccessoryView, "removeFromSuperview");
        customStandardAccessoryView = self->_customStandardAccessoryView;
        self->_customStandardAccessoryView = 0;
        goto LABEL_76;
      }
    }
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_customStandardAccessoryView, "superview"));

    if (!v36)
    {
      customStandardAccessoryView = (UIView *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
      -[UIView addSubview:](customStandardAccessoryView, "addSubview:", self->_customStandardAccessoryView);
LABEL_76:

    }
  }
  if ((v3 & 0x1000) == 0 || (activeConstrainedElements & 0x1000) != 0)
  {
    if ((v3 & 0x1000) == 0)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_fullSizeControl, "superview"));

      if (v41)
      {
        -[UIView removeFromSuperview](self->_fullSizeControl, "removeFromSuperview");
        fullSizeControl = self->_fullSizeControl;
        self->_fullSizeControl = 0;
        goto LABEL_84;
      }
    }
  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_fullSizeControl, "superview"));

    if (!v39)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_fullSizeControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      fullSizeControl = (UIView *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
      -[UIView addSubview:](fullSizeControl, "addSubview:", self->_fullSizeControl);
LABEL_84:

    }
  }
  -[CRLiOSInspectorTableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", -[CRLiOSInspectorTableViewCell isUserInteractionEnabled](self, "isUserInteractionEnabled"));
}

- (void)p_updateConstraintsForElements:(unint64_t)a3
{
  NSArray *v5;
  NSArray *activeConstraints;
  double v7;

  -[CRLiOSInspectorTableViewCell p_prepareToChangeConstraintsForElements:](self, "p_prepareToChangeConstraintsForElements:");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 64));
  -[CRLiOSInspectorTableViewCell p_generateGeneralConstraintsForImages:intoArray:](self, "p_generateGeneralConstraintsForImages:intoArray:", a3, v5);
  -[CRLiOSInspectorTableViewCell p_generateConstraintsForLeadingSideElements:intoArray:](self, "p_generateConstraintsForLeadingSideElements:intoArray:", a3, v5);
  -[CRLiOSInspectorTableViewCell p_generateConstraintsForTitleArea:margin:intoArray:](self, "p_generateConstraintsForTitleArea:margin:intoArray:", a3, v5);
  -[CRLiOSInspectorTableViewCell p_generateConstraintsForTrailingSideElements:intoArray:](self, "p_generateConstraintsForTrailingSideElements:intoArray:", a3, v5);
  if (-[CRLiOSInspectorTableViewCell currentContentSizeCategoryWrapsToNextLine](self, "currentContentSizeCategoryWrapsToNextLine"))
  {
    -[CRLiOSInspectorTableViewCell p_generateConstraintsForAccessoryAreaOnSecondLine:intoArray:](self, "p_generateConstraintsForAccessoryAreaOnSecondLine:intoArray:", a3, v5);
  }
  else
  {
    -[CRLiOSInspectorTableViewCell p_generateConstraintsForAccessoryAreaOnFirstLine:intoArray:](self, "p_generateConstraintsForAccessoryAreaOnFirstLine:intoArray:", a3, v5);
  }
  -[CRLiOSInspectorTableViewCell p_generateConstraintsForTitleAreaTrailingAnchor:intoArray:](self, "p_generateConstraintsForTitleAreaTrailingAnchor:intoArray:", a3, v5);
  -[CRLiOSInspectorTableViewCell p_generateConstraintsForFullSizeControl:intoArray:](self, "p_generateConstraintsForFullSizeControl:intoArray:", a3, v5);
  -[CRLiOSInspectorTableViewCell p_generateConstraintsForFirstRowLayoutGuideIntoArray:](self, "p_generateConstraintsForFirstRowLayoutGuideIntoArray:", v5);
  -[CRLiOSInspectorTableViewCell p_generateConstraintsForSecondRowLayoutGuide:intoArray:](self, "p_generateConstraintsForSecondRowLayoutGuide:intoArray:", a3, v5);
  -[CRLiOSInspectorTableViewCell p_generateConstraintsForThirdRowLayoutGuide:intoArray:](self, "p_generateConstraintsForThirdRowLayoutGuide:intoArray:", a3, v5);
  -[CRLiOSInspectorTableViewCell p_generateConstraintsForLegacyFixedRowHeightIntoArray:](self, "p_generateConstraintsForLegacyFixedRowHeightIntoArray:", v5);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v5;

  self->_activeConstrainedElements = a3;
  -[CRLiOSInspectorTableViewCell p_currentAccessibilitySizeRatio](self, "p_currentAccessibilitySizeRatio");
  self->_activeAccessibilitySizeMultiplier = v7;
  self->_constraintConstantsNeedUpdate = 0;
}

- (void)p_generateConstraintsForImage:(id)a3 container:(id)a4 intoArray:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  id v24;

  v24 = a4;
  v8 = a5;
  objc_msgSend(a3, "size");
  if (!self->_imageUsesStandardMargins)
  {
    v11 = v9;
    v12 = v10;
    v13 = objc_msgSend(v24, "contentMode");
    if (v13 != (id)2)
    {
      if (v13 == (id)1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "widthAnchor"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "heightAnchor"));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:multiplier:", v16, v11 / v12));
        goto LABEL_8;
      }
      if (v13)
      {
        *(_QWORD *)&v19 = objc_opt_class(self, v14).n128_u64[0];
        objc_msgSend(v20, "minimumHeight", v19);
        v22 = v21 + 10.0;
        if (v11 <= v21 + 10.0)
        {
          if (objc_msgSend(v24, "adjustsImageSizeForAccessibilityContentSizeCategory"))
          {
            -[CRLiOSInspectorTableViewCell p_currentAccessibilitySizeRatio](self, "p_currentAccessibilitySizeRatio");
            v22 = ceil(v22 * v23);
          }
        }
        else
        {
          v22 = v11 + 32.0;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "widthAnchor"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", v22));
        objc_msgSend(v8, "addObject:", v16);
        goto LABEL_14;
      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "widthAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "heightAnchor"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
LABEL_8:
    v18 = (void *)v17;
    objc_msgSend(v8, "addObject:", v17);

LABEL_14:
    goto LABEL_15;
  }
  LODWORD(v9) = 1148846080;
  objc_msgSend(v24, "setContentHuggingPriority:forAxis:", 0, v9);
LABEL_15:

}

- (void)p_generateGeneralConstraintsForImages:(unint64_t)a3 intoArray:(id)a4
{
  __int16 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  if ((v4 & 0x60) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView image](self->_customImageView, "image"));
    -[CRLiOSInspectorTableViewCell p_generateConstraintsForImage:container:intoArray:](self, "p_generateConstraintsForImage:container:intoArray:", v6, self->_customImageView, v8);

  }
  if ((v4 & 0x180) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton imageForState:](self->_customImageButton, "imageForState:", 0));
    -[CRLiOSInspectorTableViewCell p_generateConstraintsForImage:container:intoArray:](self, "p_generateConstraintsForImage:container:intoArray:", v7, self->_customImageButton, v8);

  }
}

- (id)p_centerYConstraintForView:(id)a3 atAnchor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (-[CRLiOSInspectorTableViewCell currentContentSizeCategoryWrapsToNextLine](self, "currentContentSizeCategoryWrapsToNextLine")&& (v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorLabel text](self->_customTextLabel, "text")), v9 = objc_msgSend(v8, "length"), v8, v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorLabel font](self->_customTextLabel, "font"));
    objc_msgSend(v10, "lineHeight");
    v12 = v11 * 0.5;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorLabel topAnchor](self->_customTextLabel, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, v12));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v7));
  }

  return v15;
}

- (double)p_generateConstraintsForLeadingSideElements:(unint64_t)a3 intoArray:(id)a4
{
  char v4;
  id v6;
  double v7;
  double v8;
  double right;
  void *v10;
  NSLayoutXAxisAnchor **p_leadingContentTrailingEdgeAnchor;
  double v12;
  double v13;
  CRLiOSInspectorCheckmark *checkmarkView;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  UIEdgeInsets *p_imageInsets;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  CRLiOSInspectorTableCellImageButton *customImageButton;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD *v34;
  CRLiOSInspectorTableCellImageView *customImageView;
  void *v36;
  void *v37;
  BOOL v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  UIEdgeInsets *v44;
  id *locationa;
  id *location;
  void *v47;
  void *v48;
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[2];

  v4 = a3;
  v6 = a4;
  -[CRLiOSInspectorTableViewCell indentationWidth](self, "indentationWidth");
  v8 = v7;
  right = v7 * (double)((uint64_t)-[CRLiOSInspectorTableViewCell indentationLevel](self, "indentationLevel") + 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_safeAreaLayoutGuide](self, "p_safeAreaLayoutGuide"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
  p_leadingContentTrailingEdgeAnchor = &self->_leadingContentTrailingEdgeAnchor;
  objc_storeWeak((id *)&self->_leadingContentTrailingEdgeAnchor, v10);

  self->_needsPaddingOnLeadingContentAnchor = 1;
  v48 = v6;
  if ((v4 & 0x10) != 0)
  {
    LODWORD(v12) = 1148846080;
    -[CRLiOSInspectorCheckmark setContentHuggingPriority:forAxis:](self->_checkmarkView, "setContentHuggingPriority:forAxis:", 1, v12);
    LODWORD(v13) = 1148846080;
    -[CRLiOSInspectorCheckmark setContentHuggingPriority:forAxis:](self->_checkmarkView, "setContentHuggingPriority:forAxis:", 0, v13);
    checkmarkView = self->_checkmarkView;
    locationa = (id *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(locationa, "centerYAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_centerYConstraintForView:atAnchor:](self, "p_centerYConstraintForView:atAnchor:", checkmarkView, v15));
    v51[0] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorCheckmark leadingAnchor](self->_checkmarkView, "leadingAnchor"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_leadingContentTrailingEdgeAnchor);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", WeakRetained, right));
    v51[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 2));
    objc_msgSend(v6, "addObjectsFromArray:", v20);

    p_leadingContentTrailingEdgeAnchor = &self->_leadingContentTrailingEdgeAnchor;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorCheckmark trailingAnchor](self->_checkmarkView, "trailingAnchor"));
    objc_storeWeak((id *)&self->_leadingContentTrailingEdgeAnchor, v21);

    self->_needsPaddingOnLeadingContentAnchor = 1;
    self->_firstRowHasContent = 1;
    right = v8;
  }
  p_imageInsets = &self->_imageInsets;
  v23 = 0.0;
  if (!self->_imageUsesStandardMargins)
    v23 = v8;
  v24 = right - v23 + self->_imageInsets.left;
  if ((v4 & 0x20) != 0)
  {
    v25 = 32;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView topAnchor](self->_customImageView, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_firstRowLayoutGuide, "topAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v42, p_imageInsets->top));
    v50[0] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView bottomAnchor](self->_customImageView, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_firstRowLayoutGuide, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:constant:", v26, -self->_imageInsets.bottom));
    v50[1] = v27;
    v44 = &self->_imageInsets;
    customImageView = self->_customImageView;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_firstRowLayoutGuide, "centerYAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_centerYConstraintForView:atAnchor:](self, "p_centerYConstraintForView:atAnchor:", customImageView, v29));
    v50[2] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView leadingAnchor](self->_customImageView, "leadingAnchor"));
    v32 = objc_loadWeakRetained((id *)p_leadingContentTrailingEdgeAnchor);
    location = (id *)p_leadingContentTrailingEdgeAnchor;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v24));
    v50[3] = v33;
    v34 = v50;
  }
  else
  {
    if ((v4 & 0x80) == 0)
      goto LABEL_13;
    v25 = 40;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton topAnchor](self->_customImageButton, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_firstRowLayoutGuide, "topAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v42, p_imageInsets->top));
    v49[0] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton bottomAnchor](self->_customImageButton, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_firstRowLayoutGuide, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:constant:", v26, -self->_imageInsets.bottom));
    v49[1] = v27;
    v44 = &self->_imageInsets;
    customImageButton = self->_customImageButton;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_firstRowLayoutGuide, "centerYAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_centerYConstraintForView:atAnchor:](self, "p_centerYConstraintForView:atAnchor:", customImageButton, v29));
    v49[2] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton leadingAnchor](self->_customImageButton, "leadingAnchor"));
    v32 = objc_loadWeakRetained((id *)p_leadingContentTrailingEdgeAnchor);
    location = (id *)p_leadingContentTrailingEdgeAnchor;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v24));
    v49[3] = v33;
    v34 = v49;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 4));
  objc_msgSend(v48, "addObjectsFromArray:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v25), "trailingAnchor"));
  objc_storeWeak(location, v37);

  v38 = 1;
  if (!self->_imageUsesStandardMargins)
    v38 = v44->right > 0.0;
  self->_needsPaddingOnLeadingContentAnchor = v38;
  self->_firstRowHasContent = 1;
  right = v8;
  if (!self->_imageUsesStandardMargins)
    right = self->_imageInsets.right;
LABEL_13:

  return right;
}

- (void)p_generateConstraintsForTitleArea:(unint64_t)a3 margin:(double)a4 intoArray:(id)a5
{
  void *v7;
  id WeakRetained;
  double v9;
  double v10;
  void *v11;
  int v12;
  double v13;
  double v14;
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
  double v25;
  char v26;
  id *p_customTextLabel;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD *v35;
  unsigned int v36;
  double v37;
  CRLiOSInspectorLabel *customTextLabel;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __int16 v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[3];
  void *v75;
  _QWORD v76[4];

  v67 = a3;
  v69 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_titleAreaLayoutGuide, "leadingAnchor"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_leadingContentTrailingEdgeAnchor);
  v9 = 0.0;
  if (self->_needsPaddingOnLeadingContentAnchor)
    v10 = a4;
  else
    v10 = 0.0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", WeakRetained, v10));

  v12 = 1148829696;
  LODWORD(v13) = 1148829696;
  objc_msgSend(v11, "setPriority:", v13);
  if (!-[CRLiOSInspectorTableViewCell expandTextLabelToFillCell](self, "expandTextLabelToFillCell"))
  {
    -[CRLiOSInspectorTableViewCell p_minimumVerticalTitlePadding](self, "p_minimumVerticalTitlePadding");
    v9 = v14;
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_titleAreaLayoutGuide, "centerYAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_firstRowLayoutGuide, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v15));
  v76[0] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_titleAreaLayoutGuide, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_firstRowLayoutGuide, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:constant:", v18, v9));
  v76[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_titleAreaLayoutGuide, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_firstRowLayoutGuide, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:constant:", v21, -v9));
  v76[2] = v22;
  v76[3] = v11;
  v66 = v11;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 4));
  objc_msgSend(v69, "addObjectsFromArray:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_titleAreaLayoutGuide, "topAnchor"));
  v26 = v67;
  if ((v67 & 1) != 0)
  {
    v36 = -[CRLiOSInspectorTableViewCell expandTextLabelToFillCell](self, "expandTextLabelToFillCell");
    p_customTextLabel = (id *)&self->_customTextLabel;
    customTextLabel = self->_customTextLabel;
    if (v36)
    {
      LODWORD(v37) = 1144733696;
      -[CRLiOSInspectorLabel setContentHuggingPriority:forAxis:](customTextLabel, "setContentHuggingPriority:forAxis:", 1, v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_customTextLabel, "bottomAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_titleAreaLayoutGuide, "bottomAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
      v75 = v41;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v75, 1));
      objc_msgSend(v69, "addObjectsFromArray:", v42);

    }
    else
    {
      LODWORD(v37) = 1148846080;
      -[CRLiOSInspectorLabel setContentHuggingPriority:forAxis:](customTextLabel, "setContentHuggingPriority:forAxis:", 1, v37);
    }
    LODWORD(v43) = 1144733696;
    objc_msgSend(*p_customTextLabel, "setContentHuggingPriority:forAxis:", 0, v43);
    if (!self->_preventTextLabelFromCompression
      || -[CRLiOSInspectorTableViewCell currentContentSizeCategoryWrapsToNextLine](self, "currentContentSizeCategoryWrapsToNextLine"))
    {
      v12 = 1144733696;
    }
    LODWORD(v44) = v12;
    objc_msgSend(*p_customTextLabel, "setContentCompressionResistancePriority:forAxis:", 0, v44);
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_customTextLabel, "topAnchor"));
    v64 = v24;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v24));
    v74[0] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_customTextLabel, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_titleAreaLayoutGuide, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
    v74[1] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_customTextLabel, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_titleAreaLayoutGuide, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:", v33));
    v74[2] = v34;
    v35 = v74;
    goto LABEL_17;
  }
  if ((v67 & 0x1000) != 0
    && -[CRLiOSInspectorTableViewCell fullSizeControlReplacesTextLabel](self, "fullSizeControlReplacesTextLabel"))
  {
    p_customTextLabel = (id *)&self->_fullSizeControl;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_fullSizeControl, "topAnchor"));
    v64 = v24;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v24));
    v73[0] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_fullSizeControl, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_titleAreaLayoutGuide, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
    v73[1] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_fullSizeControl, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_titleAreaLayoutGuide, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
    v73[2] = v34;
    v35 = v73;
LABEL_17:
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3));
    objc_msgSend(v69, "addObjectsFromArray:", v45);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_customTextLabel, "bottomAnchor"));
    self->_titleAreaHasContent = 1;
    self->_firstRowHasContent = 1;
    v26 = v67;
  }
  if ((v26 & 2) != 0)
  {
    LODWORD(v25) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](self->_customDetailTextLabel, "setContentHuggingPriority:forAxis:", 1, v25);
    LODWORD(v46) = 1144733696;
    -[UILabel setContentHuggingPriority:forAxis:](self->_customDetailTextLabel, "setContentHuggingPriority:forAxis:", 0, v46);
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_customDetailTextLabel, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v24));
    v72[0] = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_customDetailTextLabel, "leadingAnchor"));
    v65 = v24;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_titleAreaLayoutGuide, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v49));
    v72[1] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_customDetailTextLabel, "trailingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_titleAreaLayoutGuide, "trailingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintLessThanOrEqualToAnchor:", v52));
    v72[2] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v72, 3));
    objc_msgSend(v69, "addObjectsFromArray:", v54);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_customDetailTextLabel, "bottomAnchor"));
    self->_titleAreaHasContent = 1;
    self->_firstRowHasContent = 1;
  }
  v55 = v66;
  if (self->_titleAreaLayoutGuide)
  {
    v56 = -[CRLiOSInspectorTableViewCell expandTextLabelToFillCell](self, "expandTextLabelToFillCell");
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_titleAreaLayoutGuide, "bottomAnchor"));
    v58 = v57;
    if (v56)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_firstRowLayoutGuide, "bottomAnchor"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v59));
      v71 = v60;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v71, 1));
      objc_msgSend(v69, "addObjectsFromArray:", v61);

      v55 = v66;
    }
    else
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v24));
      v70 = v59;
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v70, 1));
      objc_msgSend(v69, "addObjectsFromArray:", v60);
    }

  }
}

- (void)p_generateConstraintsForTrailingSideElements:(unint64_t)a3 intoArray:(id)a4
{
  __int16 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSLayoutXAxisAnchor **p_trailingContentLeadingEdgeAnchor;
  double v12;
  double v13;
  double v14;
  UIImageView *disclosureView;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CRLiOSInspectorCheckmark *checkmarkView;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id *location;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_safeAreaLayoutGuide](self, "p_safeAreaLayoutGuide"));
  -[CRLiOSInspectorTableViewCell indentationWidth](self, "indentationWidth");
  v9 = v8;
  v35 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  p_trailingContentLeadingEdgeAnchor = &self->_trailingContentLeadingEdgeAnchor;
  objc_storeWeak((id *)&self->_trailingContentLeadingEdgeAnchor, v10);

  self->_needsPaddingOnTrailingContentAnchor = 1;
  v13 = -v9;
  if ((v4 & 0x200) != 0)
  {
    LODWORD(v12) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](self->_disclosureView, "setContentHuggingPriority:forAxis:", 1, v12);
    LODWORD(v14) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](self->_disclosureView, "setContentHuggingPriority:forAxis:", 0, v14);
    disclosureView = self->_disclosureView;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerYAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_centerYConstraintForView:atAnchor:](self, "p_centerYConstraintForView:atAnchor:", disclosureView, v16));
    v37[0] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_disclosureView, "trailingAnchor"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", WeakRetained, v13));
    v37[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
    objc_msgSend(v6, "addObjectsFromArray:", v21);

    p_trailingContentLeadingEdgeAnchor = &self->_trailingContentLeadingEdgeAnchor;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_disclosureView, "leadingAnchor"));
    objc_storeWeak((id *)&self->_trailingContentLeadingEdgeAnchor, v22);

    self->_needsPaddingOnTrailingContentAnchor = 1;
    self->_firstRowHasContent = 1;
  }
  if ((v4 & 8) != 0)
  {
    LODWORD(v12) = 1148846080;
    -[CRLiOSInspectorCheckmark setContentHuggingPriority:forAxis:](self->_checkmarkView, "setContentHuggingPriority:forAxis:", 1, v12);
    LODWORD(v23) = 1148846080;
    -[CRLiOSInspectorCheckmark setContentHuggingPriority:forAxis:](self->_checkmarkView, "setContentHuggingPriority:forAxis:", 0, v23);
    checkmarkView = self->_checkmarkView;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerYAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_centerYConstraintForView:atAnchor:](self, "p_centerYConstraintForView:atAnchor:", checkmarkView, v26));
    v36[0] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorCheckmark trailingAnchor](self->_checkmarkView, "trailingAnchor"));
    location = (id *)p_trailingContentLeadingEdgeAnchor;
    v29 = objc_loadWeakRetained((id *)p_trailingContentLeadingEdgeAnchor);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v13));
    v36[1] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
    objc_msgSend(v6, "addObjectsFromArray:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorCheckmark leadingAnchor](self->_checkmarkView, "leadingAnchor"));
    objc_storeWeak(location, v32);

    self->_needsPaddingOnTrailingContentAnchor = 1;
    self->_firstRowHasContent = 1;
  }

}

- (void)p_generateConstraintsForAccessoryAreaOnFirstLine:(unint64_t)a3 intoArray:(id)a4
{
  uint64_t v4;
  id v6;
  double v7;
  double v8;
  UIEdgeInsets *p_imageInsets;
  double v10;
  CGFloat left;
  double v12;
  int *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSLayoutXAxisAnchor **p_trailingContentLeadingEdgeAnchor;
  id WeakRetained;
  void *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  BOOL v33;
  double v34;
  void *v35;
  id v36;
  double v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  double v52;
  int *v53;
  id v54;
  void *v55;
  id v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  float v69;
  double v70;
  void *v71;
  id v72;
  double v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  UIEdgeInsets *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id *locationb;
  id *location;
  id *locationa;
  void *v128;
  BOOL v129;
  __int16 v130;
  void *v131;
  void *v132;
  _QWORD v133[3];
  _QWORD v134[4];
  _QWORD v135[9];
  _QWORD v136[4];
  _QWORD v137[4];
  _QWORD v138[3];
  _QWORD v139[3];

  LOWORD(v4) = a3;
  v6 = a4;
  -[CRLiOSInspectorTableViewCell indentationWidth](self, "indentationWidth");
  v8 = v7;
  p_imageInsets = &self->_imageInsets;
  v10 = -0.0;
  if (self->_imageUsesStandardMargins)
    v10 = v7;
  left = self->_imageInsets.right + v10;
  v12 = -left;
  v13 = &OBJC_IVAR___CRLGroupLayout__cachedPathForClippingConnectionLines;
  v130 = v4;
  v132 = v6;
  if ((v4 & 0x40) != 0)
  {
    v22 = 32;
    location = (id *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView topAnchor](self->_customImageView, "topAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_firstRowLayoutGuide, "topAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(location, "constraintEqualToAnchor:constant:", v120, p_imageInsets->top));
    v139[0] = v115;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView bottomAnchor](self->_customImageView, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_firstRowLayoutGuide, "bottomAnchor"));
    v110 = &self->_imageInsets;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -self->_imageInsets.bottom));
    v139[1] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView trailingAnchor](self->_customImageView, "trailingAnchor"));
    p_trailingContentLeadingEdgeAnchor = &self->_trailingContentLeadingEdgeAnchor;
    WeakRetained = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", WeakRetained, v12));
    v139[2] = v29;
    v30 = v139;
LABEL_10:
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 3));
    objc_msgSend(v132, "addObjectsFromArray:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v22), "leadingAnchor"));
    objc_storeWeak((id *)p_trailingContentLeadingEdgeAnchor, v32);

    if (self->_imageUsesStandardMargins)
    {
      v33 = 1;
    }
    else
    {
      left = v110->left;
      v33 = left > 0.0;
    }
    self->_needsPaddingOnTrailingContentAnchor = v33;
    LOWORD(v4) = v130;
    v13 = &OBJC_IVAR___CRLGroupLayout__cachedPathForClippingConnectionLines;
    goto LABEL_14;
  }
  if ((v4 & 0x100) == 0)
    goto LABEL_15;
  if (!-[CRLiOSInspectorTableViewCell showsImageButtonTrailingAdjacentToLabel](self, "showsImageButtonTrailingAdjacentToLabel"))
  {
    v22 = 40;
    location = (id *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton topAnchor](self->_customImageButton, "topAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_firstRowLayoutGuide, "topAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(location, "constraintEqualToAnchor:constant:", v120, p_imageInsets->top));
    v138[0] = v115;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton bottomAnchor](self->_customImageButton, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_firstRowLayoutGuide, "bottomAnchor"));
    v110 = &self->_imageInsets;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -self->_imageInsets.bottom));
    v138[1] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton trailingAnchor](self->_customImageButton, "trailingAnchor"));
    p_trailingContentLeadingEdgeAnchor = &self->_trailingContentLeadingEdgeAnchor;
    WeakRetained = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", WeakRetained, v12));
    v138[2] = v29;
    v30 = v138;
    goto LABEL_10;
  }
  if (!-[CRLiOSInspectorTableViewCell showsImageButtonTrailingAdjacentToLabel](self, "showsImageButtonTrailingAdjacentToLabel"))goto LABEL_15;
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton topAnchor](self->_customImageButton, "topAnchor"));
  locationb = (id *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_firstRowLayoutGuide, "topAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "constraintEqualToAnchor:constant:", locationb, p_imageInsets->top));
  v137[0] = v119;
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton bottomAnchor](self->_customImageButton, "bottomAnchor"));
  v4 = objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_firstRowLayoutGuide, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:constant:", v4, -self->_imageInsets.bottom));
  v137[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton leadingAnchor](self->_customImageButton, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorLabel trailingAnchor](self->_customTextLabel, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, v12));
  v137[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton trailingAnchor](self->_customImageButton, "trailingAnchor"));
  v19 = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:constant:", v19, v12));
  v137[3] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v137, 4));
  objc_msgSend(v132, "addObjectsFromArray:", v21);

  v13 = &OBJC_IVAR___CRLGroupLayout__cachedPathForClippingConnectionLines;
  LOWORD(v4) = v130;

LABEL_14:
  self->_firstRowHasContent = 1;
LABEL_15:
  if ((v4 & 0x800) != 0)
  {
    LODWORD(left) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](self->_customStandardAccessoryView, "setContentHuggingPriority:forAxis:", 1, left);
    LODWORD(v34) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](self->_customStandardAccessoryView, "setContentHuggingPriority:forAxis:", 0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_customStandardAccessoryView, "trailingAnchor"));
    v121 = v35;
    v36 = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
    v116 = v36;
    v37 = 0.0;
    if (self->_needsPaddingOnTrailingContentAnchor)
      v37 = -v8;
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v37));
    v136[0] = v111;
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_customStandardAccessoryView, "centerYAnchor"));
    v38 = v13[955];
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa
                                                                        + v38), "centerYAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:", v105));
    v136[1] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_customStandardAccessoryView, "topAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v38), "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintGreaterThanOrEqualToAnchor:", v41));
    v136[2] = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_customStandardAccessoryView, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v38), "bottomAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:", v44));
    v136[3] = v45;
    v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v136, 4));
    objc_msgSend(v132, "addObjectsFromArray:", v4);

    LOBYTE(v4) = v130;
    v13 = &OBJC_IVAR___CRLGroupLayout__cachedPathForClippingConnectionLines;

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_customStandardAccessoryView, "leadingAnchor"));
    objc_storeWeak((id *)&self->_trailingContentLeadingEdgeAnchor, v46);

    self->_needsPaddingOnTrailingContentAnchor = 1;
    self->_firstRowHasContent = 1;
    if ((v130 & 0x400) == 0)
    {
LABEL_17:
      if ((v4 & 4) == 0)
        goto LABEL_38;
      goto LABEL_33;
    }
  }
  else if ((v4 & 0x400) == 0)
  {
    goto LABEL_17;
  }
  if (self->_expandAccessoryViewToFillCellHorizontally)
    *(float *)&left = 250.0;
  else
    *(float *)&left = 1000.0;
  -[UIView setContentHuggingPriority:forAxis:](self->_customAccessoryView, "setContentHuggingPriority:forAxis:", 0, left);
  LODWORD(v47) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](self->_customAccessoryView, "setContentHuggingPriority:forAxis:", 1, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_customAccessoryView, "centerYAnchor"));
  v49 = v13[955];
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v49), "centerYAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v50));

  LODWORD(v52) = 1132068864;
  objc_msgSend(v51, "setPriority:", v52);
  if (self->_expandAccessoryViewToFillCellHorizontally)
  {
    v53 = &OBJC_IVAR___CRLGroupLayout__cachedPathForClippingConnectionLines;
    if ((v4 & 1) != 0)
    {
      v54 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorLabel trailingAnchor](self->_customTextLabel, "trailingAnchor"));
      v129 = 1;
    }
    else
    {
      v54 = objc_loadWeakRetained((id *)&self->_leadingContentTrailingEdgeAnchor);
      v129 = 0;
    }
  }
  else
  {
    v54 = (id)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_titleAreaLayoutGuide, "trailingAnchor"));
    v129 = 1;
    v53 = &OBJC_IVAR___CRLGroupLayout__cachedPathForClippingConnectionLines;
  }
  v94 = v54;
  locationa = (id *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_accessoryViewLayoutGuide, "topAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v49), "topAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(locationa, "constraintEqualToAnchor:", v122));
  v135[0] = v117;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_accessoryViewLayoutGuide, "bottomAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v49), "bottomAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v108));
  v135[1] = v103;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_accessoryViewLayoutGuide, "leadingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:constant:", v54, v8));
  v135[2] = v101;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_accessoryViewLayoutGuide, "trailingAnchor"));
  v100 = v55;
  v104 = (id *)((char *)&self->super.super.super.super.isa + v53[991]);
  v56 = objc_loadWeakRetained(v104);
  v98 = v56;
  v57 = 0.0;
  if (self->_needsPaddingOnTrailingContentAnchor)
    v57 = -v8;
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, v57));
  v135[3] = v97;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_customAccessoryView, "leadingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_accessoryViewLayoutGuide, "leadingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintLessThanOrEqualToAnchor:", v95));
  v135[4] = v93;
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_customAccessoryView, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_accessoryViewLayoutGuide, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:", v58));
  v135[5] = v59;
  v135[6] = v51;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_customAccessoryView, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_accessoryViewLayoutGuide, "topAnchor"));
  v99 = v51;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintGreaterThanOrEqualToAnchor:", v61));
  v135[7] = v62;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_customAccessoryView, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_accessoryViewLayoutGuide, "bottomAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintLessThanOrEqualToAnchor:", v64));
  v135[8] = v65;
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v135, 9));
  objc_msgSend(v132, "addObjectsFromArray:", v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_customAccessoryView, "leadingAnchor"));
  objc_storeWeak(v104, v67);

  self->_needsPaddingOnTrailingContentAnchor = v129;
  self->_firstRowHasContent = 1;

  v13 = &OBJC_IVAR___CRLGroupLayout__cachedPathForClippingConnectionLines;
  if ((v130 & 4) != 0)
  {
LABEL_33:
    LODWORD(left) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](self->_customDetailTextLabel, "setContentHuggingPriority:forAxis:", 1, left);
    LODWORD(v68) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](self->_customDetailTextLabel, "setContentHuggingPriority:forAxis:", 0, v68);
    -[CRLiOSInspectorLabel contentCompressionResistancePriorityForAxis:](self->_customTextLabel, "contentCompressionResistancePriorityForAxis:", 0);
    *(float *)&v70 = v69 + -1.0;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_customDetailTextLabel, "setContentCompressionResistancePriority:forAxis:", 0, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_customDetailTextLabel, "trailingAnchor"));
    v123 = v71;
    v72 = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
    v118 = v72;
    v73 = 0.0;
    if (self->_needsPaddingOnTrailingContentAnchor)
      v73 = -v8;
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72, v73));
    v134[0] = v113;
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_customDetailTextLabel, "centerYAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_titleAreaLayoutGuide, "centerYAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v106));
    v134[1] = v74;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_customDetailTextLabel, "topAnchor"));
    v76 = v13[955];
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v76), "topAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintGreaterThanOrEqualToAnchor:", v77));
    v134[2] = v78;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_customDetailTextLabel, "bottomAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v76), "bottomAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintLessThanOrEqualToAnchor:", v80));
    v134[3] = v81;
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v134, 4));
    objc_msgSend(v132, "addObjectsFromArray:", v82);

    if ((v130 & 1) != 0)
    {
      v131 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_titleAndDetailLayoutGuide, "leadingAnchor"));
      v124 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorLabel leadingAnchor](self->_customTextLabel, "leadingAnchor"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:", v124));
      v133[0] = v83;
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_titleAndDetailLayoutGuide, "trailingAnchor"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_customDetailTextLabel, "trailingAnchor"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v85));
      v133[1] = v86;
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorLabel widthAnchor](self->_customTextLabel, "widthAnchor"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_titleAndDetailLayoutGuide, "widthAnchor"));
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintLessThanOrEqualToAnchor:multiplier:", v88, 0.7));
      v133[2] = v89;
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v133, 3));
      objc_msgSend(v132, "addObjectsFromArray:", v90);

    }
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_customDetailTextLabel, "leadingAnchor"));
    objc_storeWeak((id *)&self->_trailingContentLeadingEdgeAnchor, v91);

    self->_needsPaddingOnTrailingContentAnchor = 1;
    self->_firstRowHasContent = 1;
  }
LABEL_38:

}

- (void)p_generateConstraintsForAccessoryAreaOnSecondLine:(unint64_t)a3 intoArray:(id)a4
{
  __int16 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  UIEdgeInsets *p_imageInsets;
  double right;
  double v14;
  double v15;
  int *v16;
  _BOOL4 v17;
  uint64_t v18;
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
  double v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  UIView *customAccessoryView;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  _QWORD *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  int *v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  __int16 v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  _QWORD v112[2];
  _QWORD v113[7];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[4];
  _QWORD v117[3];
  _QWORD v118[3];

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_safeAreaLayoutGuide](self, "p_safeAreaLayoutGuide"));
  -[CRLiOSInspectorTableViewCell indentationWidth](self, "indentationWidth");
  v9 = v8;
  v10 = v8 * (double)((uint64_t)-[CRLiOSInspectorTableViewCell indentationLevel](self, "indentationLevel") + 1);
  v105 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  p_imageInsets = &self->_imageInsets;
  right = self->_imageInsets.right;
  v14 = 0.0;
  if (!self->_imageUsesStandardMargins)
    v14 = v9;
  v15 = v10 - v14 + right;
  v16 = &OBJC_IVAR___CRLGroupLayout__cachedPathForClippingConnectionLines;
  v110 = v6;
  v106 = v4;
  if ((v4 & 0x40) != 0)
  {
    v18 = 32;
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView topAnchor](self->_customImageView, "topAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_secondRowLayoutGuide, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:constant:", v96, p_imageInsets->top));
    v118[0] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView bottomAnchor](self->_customImageView, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_secondRowLayoutGuide, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -self->_imageInsets.bottom));
    v118[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView leadingAnchor](self->_customImageView, "leadingAnchor"));
    v107 = v11;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v11, v15));
    v118[2] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v118, 3));
    objc_msgSend(v6, "addObjectsFromArray:", v25);

    goto LABEL_9;
  }
  if ((v4 & 0x100) != 0)
  {
    v18 = 40;
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton topAnchor](self->_customImageButton, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_secondRowLayoutGuide, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:constant:", v26, p_imageInsets->top));
    v117[0] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton bottomAnchor](self->_customImageButton, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_secondRowLayoutGuide, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -self->_imageInsets.bottom));
    v117[1] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton leadingAnchor](self->_customImageButton, "leadingAnchor"));
    v107 = v11;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v11, v15));
    v117[2] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v117, 3));
    objc_msgSend(v110, "addObjectsFromArray:", v33);

LABEL_9:
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v18), "trailingAnchor"));

    if (self->_imageUsesStandardMargins)
    {
      v17 = 1;
      v4 = v106;
      v16 = &OBJC_IVAR___CRLGroupLayout__cachedPathForClippingConnectionLines;
    }
    else
    {
      v4 = v106;
      v16 = &OBJC_IVAR___CRLGroupLayout__cachedPathForClippingConnectionLines;
      right = self->_imageInsets.left;
      v17 = right > 0.0;
    }
    self->_secondRowHasContent = 1;
    v10 = v9;
    if ((v4 & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_13;
  }
  v17 = 1;
  if ((v4 & 0x800) == 0)
    goto LABEL_16;
LABEL_13:
  LODWORD(right) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](self->_customStandardAccessoryView, "setContentHuggingPriority:forAxis:", 1, right);
  LODWORD(v34) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](self->_customStandardAccessoryView, "setContentHuggingPriority:forAxis:", 0, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_customStandardAccessoryView, "leadingAnchor"));
  v104 = v35;
  v36 = 0.0;
  if (v17)
    v36 = v10;
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v11, v36));
  v116[0] = v103;
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_customStandardAccessoryView, "centerYAnchor"));
  v37 = v16[956];
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v37), "centerYAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v97));
  v116[1] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_customStandardAccessoryView, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v37), "topAnchor"));
  v108 = v11;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:", v40));
  v116[2] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_customStandardAccessoryView, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v37), "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:", v43));
  v116[3] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v116, 4));
  objc_msgSend(v110, "addObjectsFromArray:", v45);

  v4 = v106;
  v16 = &OBJC_IVAR___CRLGroupLayout__cachedPathForClippingConnectionLines;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_customStandardAccessoryView, "trailingAnchor"));
  self->_secondRowHasContent = 1;
  v10 = v9;
  v17 = 1;
LABEL_16:
  v46 = -v9;
  if ((v4 & 0x400) != 0)
  {
    v109 = v11;
    customAccessoryView = self->_customAccessoryView;
    if (self->_expandAccessoryViewToFillCellHorizontally)
    {
      LODWORD(right) = 1132068864;
      -[UIView setContentHuggingPriority:forAxis:](customAccessoryView, "setContentHuggingPriority:forAxis:", 0, right);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_customAccessoryView, "trailingAnchor"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_accessoryViewLayoutGuide, "trailingAnchor"));
      v101 = v49;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
      v115[0] = v51;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_accessoryViewLayoutGuide, "trailingAnchor"));
      v53 = v16[956];
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa
                                                                         + v53), "trailingAnchor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v54, -v9));
      v115[1] = v55;
      v56 = v115;
    }
    else
    {
      LODWORD(right) = 1148846080;
      -[UIView setContentHuggingPriority:forAxis:](customAccessoryView, "setContentHuggingPriority:forAxis:", 0, right);
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_customAccessoryView, "trailingAnchor"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_accessoryViewLayoutGuide, "trailingAnchor"));
      v101 = v57;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v50));
      v114[0] = v51;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_accessoryViewLayoutGuide, "trailingAnchor"));
      v53 = v16[956];
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa
                                                                         + v53), "trailingAnchor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintLessThanOrEqualToAnchor:constant:", v54, -v9));
      v114[1] = v55;
      v56 = v114;
    }
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 2));
    objc_msgSend(v110, "addObjectsFromArray:", v58);

    LODWORD(v59) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](self->_customAccessoryView, "setContentHuggingPriority:forAxis:", 1, v59);
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_accessoryViewLayoutGuide, "topAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "topAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v98));
    v113[0] = v95;
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_accessoryViewLayoutGuide, "bottomAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v53), "bottomAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v93));
    v113[1] = v92;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_accessoryViewLayoutGuide, "leadingAnchor"));
    v91 = v60;
    v61 = 0.0;
    if (v17)
      v61 = v10;
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v11, v61));
    v113[2] = v90;
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_customAccessoryView, "leadingAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_accessoryViewLayoutGuide, "leadingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v88));
    v113[3] = v87;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_customAccessoryView, "centerYAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_accessoryViewLayoutGuide, "centerYAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v62));
    v113[4] = v63;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_customAccessoryView, "topAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_accessoryViewLayoutGuide, "topAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintGreaterThanOrEqualToAnchor:", v65));
    v113[5] = v66;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_customAccessoryView, "bottomAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_accessoryViewLayoutGuide, "bottomAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintLessThanOrEqualToAnchor:", v68));
    v113[6] = v69;
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v113, 7));
    objc_msgSend(v110, "addObjectsFromArray:", v70);

    if (self->_expandAccessoryViewToFillCellHorizontally)
      v11 = 0;
    else
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_customAccessoryView, "trailingAnchor"));
    LOBYTE(v4) = v106;

    self->_secondRowHasContent = 1;
    v17 = 1;
    v47 = v110;
    v16 = &OBJC_IVAR___CRLGroupLayout__cachedPathForClippingConnectionLines;
    if (!v11)
      goto LABEL_34;
  }
  else
  {
    v9 = v10;
    v47 = v110;
    if (!v11)
      goto LABEL_34;
  }
  if ((v4 & 4) == 0)
  {
    v71 = v16[956];
LABEL_33:
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v71), "trailingAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:constant:", v83, v46));
    v111 = v84;
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v111, 1));
    objc_msgSend(v47, "addObjectsFromArray:", v85);

    goto LABEL_34;
  }
  v72 = v16;
  v73 = v11;
  LODWORD(right) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_customDetailTextLabel, "setContentHuggingPriority:forAxis:", 1, right);
  LODWORD(v74) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_customDetailTextLabel, "setContentHuggingPriority:forAxis:", 0, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_customDetailTextLabel, "leadingAnchor"));
  v76 = v75;
  v77 = 0.0;
  if (v17)
    v77 = v9;
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:constant:", v11, v77));
  v112[0] = v78;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_customDetailTextLabel, "centerYAnchor"));
  v71 = v72[956];
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v71), "centerYAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v80));
  v112[1] = v81;
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v112, 2));
  objc_msgSend(v110, "addObjectsFromArray:", v82);

  v47 = v110;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_customDetailTextLabel, "trailingAnchor"));

  self->_secondRowHasContent = 1;
  if (v11)
    goto LABEL_33;
LABEL_34:

}

- (void)p_generateConstraintsForTitleAreaTrailingAnchor:(unint64_t)a3 intoArray:(id)a4
{
  double v5;
  double v6;
  _BOOL4 needsPaddingOnTrailingContentAnchor;
  _BOOL8 v8;
  double v9;
  double v11;
  unsigned int v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  void *v16;
  double v17;
  id v18;

  v18 = a4;
  -[CRLiOSInspectorTableViewCell indentationWidth](self, "indentationWidth");
  v6 = v5;
  needsPaddingOnTrailingContentAnchor = self->_needsPaddingOnTrailingContentAnchor;
  v8 = -[CRLiOSInspectorTableViewCell expandTextLabelToFillCell](self, "expandTextLabelToFillCell");
  v9 = -v6;
  if (!needsPaddingOnTrailingContentAnchor || v8)
    v11 = 0.0;
  else
    v11 = -v6;
  -[CRLiOSInspectorLabel setContainsTrailingMargin:](self->_customTextLabel, "setContainsTrailingMargin:", v8, v9);
  v12 = -[CRLiOSInspectorTableViewCell fullSizeControlReplacesTextLabel](self, "fullSizeControlReplacesTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_titleAreaLayoutGuide, "trailingAnchor"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
  if (v12)
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", WeakRetained, v11));
  else
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:constant:", WeakRetained, v11));
  v16 = (void *)v15;

  LODWORD(v17) = 1144766464;
  objc_msgSend(v16, "setPriority:", v17);
  if (v16)
    objc_msgSend(v18, "addObject:", v16);

}

- (void)p_generateConstraintsForFullSizeControl:(unint64_t)a3 intoArray:(id)a4
{
  __int16 v4;
  id v6;
  id v7;
  double top;
  double v9;
  double v10;
  double v11;
  UILayoutGuide *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
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
  _QWORD v31[5];

  v4 = a3;
  v6 = a4;
  if ((v4 & 0x1000) != 0
    && !-[CRLiOSInspectorTableViewCell fullSizeControlReplacesTextLabel](self, "fullSizeControlReplacesTextLabel"))
  {
    v7 = -[CRLiOSInspectorTableViewCell indentationLevel](self, "indentationLevel");
    top = self->_fullSizeControlInsets.top;
    v9 = self->_fullSizeControlInsets.left + (double)(uint64_t)v7 * 16.0;
    v10 = 0.0 - self->_fullSizeControlInsets.right;
    v11 = 0.0 - self->_fullSizeControlInsets.bottom;
    if (self->_firstRowHasContent || self->_secondRowHasContent)
    {
      v12 = self->_thirdRowLayoutGuide;
      v9 = v9 + (double)(uint64_t)-[CRLiOSInspectorTableViewCell indentationLevel](self, "indentationLevel") * 16.0;
      self->_thirdRowHasContent = 1;
    }
    else
    {
      v12 = self->_firstRowLayoutGuide;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_fullSizeControl, "centerYAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v12, "centerYAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));

    LODWORD(v16) = 1144750080;
    v30 = v15;
    objc_msgSend(v15, "setPriority:", v16);
    v31[0] = v15;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_fullSizeControl, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v12, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, top));
    v31[1] = v27;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_fullSizeControl, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v12, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, v9));
    v31[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_fullSizeControl, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v12, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, v10));
    v31[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_fullSizeControl, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v12, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, v11));
    v31[4] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 5));
    objc_msgSend(v6, "addObjectsFromArray:", v24);

  }
}

- (void)p_generateConstraintsForFirstRowLayoutGuideIntoArray:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 needsPaddingOnLeadingContentAnchor;
  _BOOL4 needsPaddingOnTrailingContentAnchor;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  NSLayoutXAxisAnchor **p_trailingContentLeadingEdgeAnchor;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id WeakRetained;
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
  void *v53;
  _QWORD v54[12];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_safeAreaLayoutGuide](self, "p_safeAreaLayoutGuide"));
  needsPaddingOnLeadingContentAnchor = self->_needsPaddingOnLeadingContentAnchor;
  needsPaddingOnTrailingContentAnchor = self->_needsPaddingOnTrailingContentAnchor;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](self->_firstRowLayoutGuide, "heightAnchor"));
  -[CRLiOSInspectorTableViewCell minimumRowHeight](self, "minimumRowHeight");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintGreaterThanOrEqualToConstant:"));

  LODWORD(v10) = 1148829696;
  objc_msgSend(v9, "setPriority:", v10);
  if (self->_firstRowLayoutGuide)
  {
    -[CRLiOSInspectorTableViewCell p_minimumVerticalTitlePadding](self, "p_minimumVerticalTitlePadding");
    v12 = v11;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_firstRowLayoutGuide, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
    v54[0] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_firstRowLayoutGuide, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
    v54[1] = v44;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_firstRowLayoutGuide, "trailingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
    v54[2] = v41;
    v54[3] = v9;
    v53 = v4;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_firstRowCenterFreeSpaceLayoutGuide, "topAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_firstRowLayoutGuide, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
    v54[4] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_firstRowCenterFreeSpaceLayoutGuide, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_firstRowLayoutGuide, "bottomAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
    v54[5] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_firstRowCenterFreeSpaceLayoutGuide, "leadingAnchor"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_leadingContentTrailingEdgeAnchor);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", WeakRetained));
    v54[6] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_firstRowCenterFreeSpaceLayoutGuide, "trailingAnchor"));
    p_trailingContentLeadingEdgeAnchor = &self->_trailingContentLeadingEdgeAnchor;
    v30 = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
    v54[7] = v29;
    v52 = v5;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_insetFirstRowCenterFreeSpaceLayoutGuide, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_firstRowLayoutGuide, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, v12));
    v54[8] = v26;
    v51 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_insetFirstRowCenterFreeSpaceLayoutGuide, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_firstRowLayoutGuide, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -v12));
    v54[9] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_insetFirstRowCenterFreeSpaceLayoutGuide, "leadingAnchor"));
    v18 = objc_loadWeakRetained((id *)&self->_leadingContentTrailingEdgeAnchor);
    v19 = 16.0;
    if (!needsPaddingOnLeadingContentAnchor)
      v19 = 0.0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, v19));
    v54[10] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_insetFirstRowCenterFreeSpaceLayoutGuide, "trailingAnchor"));
    v22 = objc_loadWeakRetained((id *)p_trailingContentLeadingEdgeAnchor);
    v23 = -16.0;
    if (!needsPaddingOnTrailingContentAnchor)
      v23 = 0.0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, v23));
    v54[11] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 12));
    objc_msgSend(v53, "addObjectsFromArray:", v25);

    v5 = v52;
    v4 = v53;

    v9 = v51;
  }

}

- (void)p_generateConstraintsForSecondRowLayoutGuide:(unint64_t)a3 intoArray:(id)a4
{
  char v4;
  id v6;
  void *v7;
  int *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UILayoutGuide *secondRowLayoutGuide;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[3];

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_safeAreaLayoutGuide](self, "p_safeAreaLayoutGuide"));
  if (self->_secondRowLayoutGuide)
  {
    if ((v4 & 3) == 1 && self->_secondRowHasContent && !self->_expandAccessoryViewToFillCellHorizontally)
      v8 = &OBJC_IVAR___CRLiOSInspectorTableViewCell__customTextLabel;
    else
      v8 = &OBJC_IVAR___CRLiOSInspectorTableViewCell__firstRowLayoutGuide;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v8), "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_secondRowLayoutGuide, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    v27[0] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_secondRowLayoutGuide, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v9));
    v27[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_secondRowLayoutGuide, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    v27[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 3));
    objc_msgSend(v6, "addObjectsFromArray:", v14);

  }
  secondRowLayoutGuide = self->_secondRowLayoutGuide;
  if (self->_secondRowHasContent)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](secondRowLayoutGuide, "heightAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](self->_firstRowLayoutGuide, "heightAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:multiplier:", v17, 0.5));

    if (v18)
    {
      LODWORD(v19) = 1148829696;
      objc_msgSend(v18, "setPriority:", v19);
      objc_msgSend(v6, "addObject:", v18);
    }
    goto LABEL_12;
  }
  if (secondRowLayoutGuide)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](secondRowLayoutGuide, "heightAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 0.0));
    v26 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    objc_msgSend(v6, "addObjectsFromArray:", v21);

LABEL_12:
  }

}

- (void)p_generateConstraintsForThirdRowLayoutGuide:(unint64_t)a3 intoArray:(id)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UILayoutGuide *thirdRowLayoutGuide;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UILayoutGuide *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
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
  _QWORD v39[4];

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_safeAreaLayoutGuide](self, "p_safeAreaLayoutGuide"));
  v36 = v6;
  if ((v4 & 1) != 0 && self->_secondRowHasContent)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_firstRowLayoutGuide, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorLabel topAnchor](self->_customTextLabel, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anchorWithOffsetToAnchor:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_secondRowLayoutGuide, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_thirdRowLayoutGuide, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anchorWithOffsetToAnchor:", v12));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_thirdRowLayoutGuide, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_secondRowLayoutGuide, "bottomAnchor"));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v13));

  thirdRowLayoutGuide = self->_thirdRowLayoutGuide;
  if (thirdRowLayoutGuide)
  {
    v39[0] = v14;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](thirdRowLayoutGuide, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v39[1] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_thirdRowLayoutGuide, "trailingAnchor"));
    v35 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v16));
    v39[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_thirdRowLayoutGuide, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
    v39[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 4));
    objc_msgSend(v36, "addObjectsFromArray:", v22);

    v7 = v35;
  }
  v23 = self->_thirdRowLayoutGuide;
  if (self->_thirdRowHasContent)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v23, "heightAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](self->_firstRowLayoutGuide, "heightAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:", v25));

    if (!v26)
    {
      v29 = v36;
      goto LABEL_14;
    }
    LODWORD(v27) = 1148829696;
    objc_msgSend(v26, "setPriority:", v27);
    v38 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
    v29 = v36;
    objc_msgSend(v36, "addObjectsFromArray:", v28);
LABEL_12:

LABEL_14:
    goto LABEL_15;
  }
  v29 = v36;
  if (v23)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v23, "heightAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", 0.0));
    v37 = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
    objc_msgSend(v36, "addObjectsFromArray:", v30);

    goto LABEL_12;
  }
LABEL_15:

}

- (void)p_generateConstraintsForLegacyFixedRowHeightIntoArray:(id)a3
{
  double legacyFixedRowHeight;
  id v5;
  uint64_t v6;
  double v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  legacyFixedRowHeight = self->_legacyFixedRowHeight;
  if (legacyFixedRowHeight > 0.0)
  {
    v5 = a3;
    *(_QWORD *)&v7 = objc_opt_class(self, v6).n128_u64[0];
    objc_msgSend(v8, "minimumHeight", v7);
    if (legacyFixedRowHeight < v9)
      legacyFixedRowHeight = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", legacyFixedRowHeight));
    v14 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    objc_msgSend(v5, "addObjectsFromArray:", v13);

  }
}

- (id)p_standardLabelFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", UIContentSizeCategoryLarge));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v2));

  return v3;
}

- (id)p_currentLabelFont
{
  return +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
}

- (id)p_currentDetailLabelFont
{
  const UIFontTextStyle *v2;

  if (self->_cellStyle == 3)
    v2 = &UIFontTextStyleCaption1;
  else
    v2 = &UIFontTextStyleBody;
  return +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", *v2);
}

- (double)p_currentAccessibilitySizeRatio
{
  unsigned int v3;
  double result;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v3 = -[CRLiOSInspectorTableViewCell automaticallyResizesForContentSizeCategory](self, "automaticallyResizesForContentSizeCategory");
  result = 1.0;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_standardLabelFont](self, "p_standardLabelFont", 1.0));
    objc_msgSend(v5, "pointSize");
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_currentLabelFont](self, "p_currentLabelFont"));
    objc_msgSend(v8, "pointSize");
    v10 = v9;

    return fmax(v10 / v7, 1.0);
  }
  return result;
}

- (double)p_minimumVerticalTitlePadding
{
  unsigned int v3;
  double result;
  double v5;

  v3 = -[CRLiOSInspectorTableViewCell currentContentSizeCategoryWrapsToNextLine](self, "currentContentSizeCategoryWrapsToNextLine");
  result = 6.0;
  if (v3)
  {
    -[CRLiOSInspectorTableViewCell p_currentAccessibilitySizeRatio](self, "p_currentAccessibilitySizeRatio", 6.0);
    return v5 * 10.0;
  }
  return result;
}

- (double)minimumRowHeight
{
  double v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  objc_msgSend(v4, "minimumHeight", v3);
  v6 = v5;
  if (-[CRLiOSInspectorTableViewCell currentContentSizeCategoryWrapsToNextLine](self, "currentContentSizeCategoryWrapsToNextLine"))
  {
    -[CRLiOSInspectorTableViewCell p_minimumVerticalTitlePadding](self, "p_minimumVerticalTitlePadding");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_currentLabelFont](self, "p_currentLabelFont"));
    objc_msgSend(v9, "lineHeight");
    v11 = v10 + v8 * 2.0;

  }
  else
  {
    -[CRLiOSInspectorTableViewCell p_currentAccessibilitySizeRatio](self, "p_currentAccessibilitySizeRatio");
    v11 = v6 * v12;
  }
  return ceil(v11);
}

- (BOOL)p_needsConstraintsUpdateForElements:(unint64_t)a3
{
  double v5;

  if (self->_activeConstrainedElements != a3 || self->_constraintConstantsNeedUpdate)
    return 1;
  -[CRLiOSInspectorTableViewCell p_currentAccessibilitySizeRatio](self, "p_currentAccessibilitySizeRatio");
  return v5 != self->_activeAccessibilitySizeMultiplier;
}

- (void)p_imageDidChange
{
  -[CRLiOSInspectorTableViewCell p_updateImageTintColor](self, "p_updateImageTintColor");
  -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)p_updateImageTintColor
{
  id WeakRetained;

  if (self->_imageUsesTitleLabelColor)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabelColor);
    -[CRLiOSInspectorTableCellImageView setTintColor:](self->_customImageView, "setTintColor:", WeakRetained);

  }
  else
  {
    -[CRLiOSInspectorTableCellImageView setTintColor:](self->_customImageView, "setTintColor:", 0);
  }
}

- (void)p_contentSizeCategoryDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_currentLabelFont](self, "p_currentLabelFont", a3));
  -[CRLiOSInspectorLabel setFont:](self->_customTextLabel, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell p_currentDetailLabelFont](self, "p_currentDetailLabelFont"));
  -[UILabel setFont:](self->_customDetailTextLabel, "setFont:", v5);

  -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)p_detailButtonTapped:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell superview](self, "superview", a3));
  do
  {
    v6 = v5;
    objc_opt_class(UITableView, v4);
    v8 = sub_100221D0C(v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    if (v9)
      v10 = 1;
    else
      v10 = v5 == 0;
  }
  while (!v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
  v18 = sub_100221DDC(v11, 1, v12, v13, v14, v15, v16, v17, (uint64_t)&OBJC_PROTOCOL___UITableViewDelegate);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathForCell:", self));
  if (v20)
  {
    objc_msgSend(v19, "tableView:accessoryButtonTappedForRowWithIndexPath:", v9, v20);
  }
  else
  {
    if (v9)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101258078);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2B2F4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101258098);
      v21 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInspectorTableViewCell p_detailButtonTapped:]"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Inspectors/CRLiOSInspectorTableViewCell.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 1749, 0, "expected nil table view if index path was also nil");

    }
    if (v19)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012580B8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2B274();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012580D8);
      v24 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInspectorTableViewCell p_detailButtonTapped:]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Inspectors/CRLiOSInspectorTableViewCell.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 1750, 0, "expected nil delegate if table view was also nil");

    }
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double MaxX;
  void *v13;
  double MinX;
  void *v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v16.receiver = self;
  v16.super_class = (Class)CRLiOSInspectorTableViewCell;
  -[CRLiOSInspectorTableViewCell layoutSubviews](&v16, "layoutSubviews");
  if (-[CRLiOSInspectorTableViewCell showsReorderControl](self, "showsReorderControl"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    if (sub_1003A9250())
    {
      -[CRLiOSInspectorTableViewCell bounds](self, "bounds");
      MaxX = CGRectGetMaxX(v17);
      v18.origin.x = v5;
      v18.origin.y = v7;
      v18.size.width = v9;
      v18.size.height = v11;
      if (MaxX - CGRectGetMaxX(v18) == 40.0)
      {
        v9 = v9 + 3.0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
        objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

      }
    }
    if (sub_1003A91F4())
    {
      v19.origin.x = v5;
      v19.origin.y = v7;
      v19.size.width = v9;
      v19.size.height = v11;
      MinX = CGRectGetMinX(v19);
      -[CRLiOSInspectorTableViewCell bounds](self, "bounds");
      if (MinX - CGRectGetMinX(v20) == 64.0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
        objc_msgSend(v15, "setFrame:", v5 + -27.0, v7, v9 + 27.0, v11);

      }
    }
  }
}

- (void)updateConstraints
{
  unint64_t v3;
  objc_super v4;

  v3 = -[CRLiOSInspectorTableViewCell p_elementsToConstrain](self, "p_elementsToConstrain");
  if (-[CRLiOSInspectorTableViewCell p_needsConstraintsUpdateForElements:](self, "p_needsConstraintsUpdateForElements:", v3))
  {
    -[CRLiOSInspectorTableViewCell p_updateConstraintsForElements:](self, "p_updateConstraintsForElements:", v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSInspectorTableViewCell;
  -[CRLiOSInspectorTableViewCell updateConstraints](&v4, "updateConstraints");
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v5 = -[CRLiOSInspectorTableViewCell disablesContentWhenNotUserInteractive](self, "disablesContentWhenNotUserInteractive") ^ 1 | a3;
  -[CRLiOSInspectorLabel setEnabled:](self->_customTextLabel, "setEnabled:", v5);
  -[CRLiOSInspectorLabel setUserInteractionEnabled:](self->_customTextLabel, "setUserInteractionEnabled:", v3);
  -[UILabel setEnabled:](self->_customDetailTextLabel, "setEnabled:", v5);
  -[UILabel setUserInteractionEnabled:](self->_customDetailTextLabel, "setUserInteractionEnabled:", v3);
  -[CRLiOSInspectorTableCellImageView setUserInteractionEnabled:](self->_customImageView, "setUserInteractionEnabled:", v3);
  -[UIView setUserInteractionEnabled:](self->_customStandardAccessoryView, "setUserInteractionEnabled:", v3);
  objc_opt_class(UIControl, v6);
  v8 = sub_100221D0C(v7, self->_customStandardAccessoryView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "setEnabled:", v5);
  -[CRLiOSInspectorCheckmark setEnabled:](self->_checkmarkView, "setEnabled:", v5);
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSInspectorTableViewCell;
  -[CRLiOSInspectorTableViewCell setUserInteractionEnabled:](&v10, "setUserInteractionEnabled:", v3);

}

- (void)setNeedsUpdateConstraints
{
  self->_constraintConstantsNeedUpdate = 1;
  -[CRLiOSInspectorTableViewCell p_setNeedsUpdateConstraints](self, "p_setNeedsUpdateConstraints");
}

- (void)p_setNeedsUpdateConstraints
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CRLiOSInspectorTableViewCell;
  -[CRLiOSInspectorTableViewCell setNeedsUpdateConstraints](&v2, "setNeedsUpdateConstraints");
}

- (id)p_safeAreaLayoutGuide
{
  return -[CRLiOSInspectorTableViewCell p_mainLayoutAnchorOwner](self, "p_mainLayoutAnchorOwner");
}

- (id)p_mainLayoutAnchorOwner
{
  _BOOL4 usesContentViewInsteadOfSafeAreaLayoutGuide;
  void *v3;
  void *v4;
  uint64_t v5;

  usesContentViewInsteadOfSafeAreaLayoutGuide = self->_usesContentViewInsteadOfSafeAreaLayoutGuide;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell contentView](self, "contentView"));
  v4 = v3;
  if (!usesContentViewInsteadOfSafeAreaLayoutGuide)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));

    v4 = (void *)v5;
  }
  return v4;
}

- (id)imageView
{
  return -[CRLiOSInspectorTableViewCell customImageView](self, "customImageView");
}

- (id)accessoryView
{
  return -[CRLiOSInspectorTableViewCell customAccessoryView](self, "customAccessoryView");
}

- (void)setAccessoryView:(id)a3
{
  -[CRLiOSInspectorTableViewCell setCustomAccessoryView:](self, "setCustomAccessoryView:", a3);
}

- (int64_t)accessoryType
{
  return -[CRLiOSInspectorTableViewCell customAccessoryType](self, "customAccessoryType");
}

- (void)setAccessoryType:(int64_t)a3
{
  -[CRLiOSInspectorTableViewCell setCustomAccessoryType:](self, "setCustomAccessoryType:", a3);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSInspectorTableViewCell;
  -[CRLiOSInspectorTableViewCell setHighlighted:animated:](&v6, "setHighlighted:animated:", a3, a4);
  -[CRLiOSInspectorTableCellImageButton setHighlighted:](self->_customImageButton, "setHighlighted:", v4);
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLiOSInspectorTableViewCell;
  v3 = -[CRLiOSInspectorTableViewCell accessibilityLabel](&v11, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell customTextLabel](self, "customTextLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell customTextLabel](self, "customTextLabel"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));

      v4 = (void *)v9;
    }
  }
  return v4;
}

- (id)accessibilityValue
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLiOSInspectorTableViewCell;
  v3 = -[CRLiOSInspectorTableViewCell accessibilityValue](&v11, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell customDetailTextLabel](self, "customDetailTextLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCell customDetailTextLabel](self, "customDetailTextLabel"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));

      v4 = (void *)v9;
    }
  }
  return v4;
}

+ (id)checkableCellWithTitle:(id)a3 checkmarkOnLeadingEdge:(BOOL)a4 checked:(BOOL)a5 reuseIdentifier:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  uint64_t v12;
  Class v13;
  id v14;
  void *v15;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  objc_opt_class(a1, v12);
  v14 = objc_msgSend([v13 alloc], "initWithStyle:reuseIdentifier:", 0, v11);

  objc_msgSend(v14, "setCheckable:", 1);
  objc_msgSend(v14, "setChecked:", v7);
  objc_msgSend(v14, "setShowsCheckmarkOnLeadingEdge:", v8);
  if (v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textLabel"));
    objc_msgSend(v15, "setText:", v10);

  }
  return v14;
}

+ (id)checkableCellWithImage:(id)a3 checkmarkOnLeadingEdge:(BOOL)a4 checked:(BOOL)a5 reuseIdentifier:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  uint64_t v12;
  Class v13;
  id v14;
  void *v15;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  objc_opt_class(a1, v12);
  v14 = objc_msgSend([v13 alloc], "initWithStyle:reuseIdentifier:", 0, v11);

  objc_msgSend(v14, "setCheckable:", 1);
  objc_msgSend(v14, "setChecked:", v7);
  objc_msgSend(v14, "setShowsCheckmarkOnLeadingEdge:", v8);
  objc_msgSend(v14, "setShowsImageOnTrailingEdge:", v8);
  if (v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageView"));
    objc_msgSend(v15, "setImage:", v10);

  }
  return v14;
}

+ (id)checkableSubtitleCellWithTitle:(id)a3 subtitle:(id)a4 checkmarkOnLeadingEdge:(BOOL)a5 checked:(BOOL)a6 reuseIdentifier:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  Class v16;
  id v17;
  void *v18;
  void *v19;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_opt_class(a1, v15);
  v17 = objc_msgSend([v16 alloc], "initWithStyle:reuseIdentifier:", 3, v14);

  objc_msgSend(v17, "setCheckable:", 1);
  objc_msgSend(v17, "setChecked:", v8);
  objc_msgSend(v17, "setShowsCheckmarkOnLeadingEdge:", v9);
  if (v12)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textLabel"));
    objc_msgSend(v18, "setText:", v12);

  }
  if (v13)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "detailTextLabel"));
    objc_msgSend(v19, "setText:", v13);

  }
  return v17;
}

+ (id)checkableCellWithTitle:(id)a3 detailText:(id)a4 checkmarkOnLeadingEdge:(BOOL)a5 checked:(BOOL)a6 reuseIdentifier:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  Class v16;
  id v17;
  void *v18;
  void *v19;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_opt_class(a1, v15);
  v17 = objc_msgSend([v16 alloc], "initWithStyle:reuseIdentifier:", 1, v14);

  objc_msgSend(v17, "setCheckable:", 1);
  objc_msgSend(v17, "setChecked:", v8);
  objc_msgSend(v17, "setShowsCheckmarkOnLeadingEdge:", v9);
  if (v12)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textLabel"));
    objc_msgSend(v18, "setText:", v12);

  }
  if (v13)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "detailTextLabel"));
    objc_msgSend(v19, "setText:", v13);

  }
  return v17;
}

- (UIView)fullSizeControl
{
  return self->_fullSizeControl;
}

- (UIEdgeInsets)fullSizeControlInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_fullSizeControlInsets.top;
  left = self->_fullSizeControlInsets.left;
  bottom = self->_fullSizeControlInsets.bottom;
  right = self->_fullSizeControlInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)fullSizeControlReplacesTextLabel
{
  return self->_fullSizeControlReplacesTextLabel;
}

- (void)setFullSizeControlReplacesTextLabel:(BOOL)a3
{
  self->_fullSizeControlReplacesTextLabel = a3;
}

- (BOOL)checkable
{
  return self->_checkable;
}

- (BOOL)checked
{
  return self->_checked;
}

- (UIImage)customCheckmarkImage
{
  return self->_customCheckmarkImage;
}

- (UIImage)customHighlightedCheckmarkImage
{
  return self->_customHighlightedCheckmarkImage;
}

- (BOOL)showsCheckmarkOnLeadingEdge
{
  return self->_showsCheckmarkOnLeadingEdge;
}

- (void)setShowsCheckmarkOnLeadingEdge:(BOOL)a3
{
  self->_showsCheckmarkOnLeadingEdge = a3;
}

- (BOOL)showsImageOnTrailingEdge
{
  return self->_showsImageOnTrailingEdge;
}

- (void)setShowsImageOnTrailingEdge:(BOOL)a3
{
  self->_showsImageOnTrailingEdge = a3;
}

- (BOOL)showsImageButtonTrailingAdjacentToLabel
{
  return self->_showsImageButtonTrailingAdjacentToLabel;
}

- (void)setShowsImageButtonTrailingAdjacentToLabel:(BOOL)a3
{
  self->_showsImageButtonTrailingAdjacentToLabel = a3;
}

- (UIEdgeInsets)imageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imageInsets.top;
  left = self->_imageInsets.left;
  bottom = self->_imageInsets.bottom;
  right = self->_imageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)imageUsesStandardMargins
{
  return self->_imageUsesStandardMargins;
}

- (CRLiOSInspectorTableViewCellBackgroundView)customBackgroundView
{
  return self->_customBackgroundView;
}

- (CRLiOSInspectorTableViewCellSelectedBackgroundView)customSelectedBackgroundView
{
  return self->_customSelectedBackgroundView;
}

- (UIColor)titleLabelColor
{
  return (UIColor *)objc_loadWeakRetained((id *)&self->_titleLabelColor);
}

- (UIColor)detailLabelColor
{
  return (UIColor *)objc_loadWeakRetained((id *)&self->_detailLabelColor);
}

- (UIColor)disclosureDetailLabelColor
{
  return (UIColor *)objc_loadWeakRetained((id *)&self->_disclosureDetailLabelColor);
}

- (UIColor)subtitleLabelColor
{
  return (UIColor *)objc_loadWeakRetained((id *)&self->_subtitleLabelColor);
}

- (UIColor)detailButtonColor
{
  return (UIColor *)objc_loadWeakRetained((id *)&self->_detailButtonColor);
}

- (BOOL)usesTitleLabelColor
{
  return self->_usesTitleLabelColor;
}

- (void)setUsesTitleLabelColor:(BOOL)a3
{
  self->_usesTitleLabelColor = a3;
}

- (BOOL)imageUsesTitleLabelColor
{
  return self->_imageUsesTitleLabelColor;
}

- (BOOL)expandTextLabelToFillCell
{
  return self->_expandTextLabelToFillCell;
}

- (void)setExpandTextLabelToFillCell:(BOOL)a3
{
  self->_expandTextLabelToFillCell = a3;
}

- (BOOL)preventTextLabelFromCompression
{
  return self->_preventTextLabelFromCompression;
}

- (BOOL)usesDisclosureDetailLabelColor
{
  return self->_usesDisclosureDetailLabelColor;
}

- (BOOL)usesSubtitleLabelColor
{
  return self->_usesSubtitleLabelColor;
}

- (BOOL)usesDetailButtonColor
{
  return self->_usesDetailButtonColor;
}

- (BOOL)disablesContentWhenNotUserInteractive
{
  return self->_disablesContentWhenNotUserInteractive;
}

- (BOOL)expandAccessoryViewToFillCellHorizontally
{
  return self->_expandAccessoryViewToFillCellHorizontally;
}

- (BOOL)automaticallyResizesForContentSizeCategory
{
  return self->_automaticallyResizesForContentSizeCategory;
}

- (double)legacyFixedRowHeight
{
  return self->_legacyFixedRowHeight;
}

- (UILayoutGuide)firstRowCenterFreeSpaceLayoutGuide
{
  return self->_firstRowCenterFreeSpaceLayoutGuide;
}

- (void)setFirstRowCenterFreeSpaceLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_firstRowCenterFreeSpaceLayoutGuide, a3);
}

- (UILayoutGuide)insetFirstRowCenterFreeSpaceLayoutGuide
{
  return self->_insetFirstRowCenterFreeSpaceLayoutGuide;
}

- (void)setInsetFirstRowCenterFreeSpaceLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_insetFirstRowCenterFreeSpaceLayoutGuide, a3);
}

- (void)setCustomTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_customTextLabel, a3);
}

- (void)setCustomDetailTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_customDetailTextLabel, a3);
}

- (void)setCustomImageView:(id)a3
{
  objc_storeStrong((id *)&self->_customImageView, a3);
}

- (void)setCustomImageButton:(id)a3
{
  objc_storeStrong((id *)&self->_customImageButton, a3);
}

- (UIView)customAccessoryView
{
  return self->_customAccessoryView;
}

- (UIView)customStandardAccessoryView
{
  return self->_customStandardAccessoryView;
}

- (void)setCustomStandardAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_customStandardAccessoryView, a3);
}

- (CRLiOSInspectorCheckmark)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkView, a3);
}

- (UIImageView)disclosureView
{
  return self->_disclosureView;
}

- (void)setDisclosureView:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureView, a3);
}

- (UILayoutGuide)titleAreaLayoutGuide
{
  return self->_titleAreaLayoutGuide;
}

- (void)setTitleAreaLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_titleAreaLayoutGuide, a3);
}

- (UILayoutGuide)firstRowLayoutGuide
{
  return self->_firstRowLayoutGuide;
}

- (void)setFirstRowLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_firstRowLayoutGuide, a3);
}

- (UILayoutGuide)secondRowLayoutGuide
{
  return self->_secondRowLayoutGuide;
}

- (void)setSecondRowLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_secondRowLayoutGuide, a3);
}

- (UILayoutGuide)thirdRowLayoutGuide
{
  return self->_thirdRowLayoutGuide;
}

- (void)setThirdRowLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_thirdRowLayoutGuide, a3);
}

- (UILayoutGuide)accessoryViewLayoutGuide
{
  return self->_accessoryViewLayoutGuide;
}

- (void)setAccessoryViewLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewLayoutGuide, a3);
}

- (UILayoutGuide)titleAndDetailLayoutGuide
{
  return self->_titleAndDetailLayoutGuide;
}

- (void)setTitleAndDetailLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_titleAndDetailLayoutGuide, a3);
}

- (unint64_t)activeConstrainedElements
{
  return self->_activeConstrainedElements;
}

- (void)setActiveConstrainedElements:(unint64_t)a3
{
  self->_activeConstrainedElements = a3;
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (double)activeAccessibilitySizeMultiplier
{
  return self->_activeAccessibilitySizeMultiplier;
}

- (void)setActiveAccessibilitySizeMultiplier:(double)a3
{
  self->_activeAccessibilitySizeMultiplier = a3;
}

- (BOOL)constraintConstantsNeedUpdate
{
  return self->_constraintConstantsNeedUpdate;
}

- (void)setConstraintConstantsNeedUpdate:(BOOL)a3
{
  self->_constraintConstantsNeedUpdate = a3;
}

- (NSLayoutXAxisAnchor)leadingContentTrailingEdgeAnchor
{
  return (NSLayoutXAxisAnchor *)objc_loadWeakRetained((id *)&self->_leadingContentTrailingEdgeAnchor);
}

- (void)setLeadingContentTrailingEdgeAnchor:(id)a3
{
  objc_storeWeak((id *)&self->_leadingContentTrailingEdgeAnchor, a3);
}

- (NSLayoutXAxisAnchor)trailingContentLeadingEdgeAnchor
{
  return (NSLayoutXAxisAnchor *)objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
}

- (void)setTrailingContentLeadingEdgeAnchor:(id)a3
{
  objc_storeWeak((id *)&self->_trailingContentLeadingEdgeAnchor, a3);
}

- (BOOL)needsPaddingOnLeadingContentAnchor
{
  return self->_needsPaddingOnLeadingContentAnchor;
}

- (void)setNeedsPaddingOnLeadingContentAnchor:(BOOL)a3
{
  self->_needsPaddingOnLeadingContentAnchor = a3;
}

- (BOOL)needsPaddingOnTrailingContentAnchor
{
  return self->_needsPaddingOnTrailingContentAnchor;
}

- (void)setNeedsPaddingOnTrailingContentAnchor:(BOOL)a3
{
  self->_needsPaddingOnTrailingContentAnchor = a3;
}

- (BOOL)titleAreaHasContent
{
  return self->_titleAreaHasContent;
}

- (void)setTitleAreaHasContent:(BOOL)a3
{
  self->_titleAreaHasContent = a3;
}

- (BOOL)firstRowHasContent
{
  return self->_firstRowHasContent;
}

- (void)setFirstRowHasContent:(BOOL)a3
{
  self->_firstRowHasContent = a3;
}

- (BOOL)secondRowHasContent
{
  return self->_secondRowHasContent;
}

- (void)setSecondRowHasContent:(BOOL)a3
{
  self->_secondRowHasContent = a3;
}

- (BOOL)thirdRowHasContent
{
  return self->_thirdRowHasContent;
}

- (void)setThirdRowHasContent:(BOOL)a3
{
  self->_thirdRowHasContent = a3;
}

- (BOOL)usesContentViewInsteadOfSafeAreaLayoutGuide
{
  return self->_usesContentViewInsteadOfSafeAreaLayoutGuide;
}

- (void)setUsesContentViewInsteadOfSafeAreaLayoutGuide:(BOOL)a3
{
  self->_usesContentViewInsteadOfSafeAreaLayoutGuide = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trailingContentLeadingEdgeAnchor);
  objc_destroyWeak((id *)&self->_leadingContentTrailingEdgeAnchor);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_titleAndDetailLayoutGuide, 0);
  objc_storeStrong((id *)&self->_accessoryViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_thirdRowLayoutGuide, 0);
  objc_storeStrong((id *)&self->_secondRowLayoutGuide, 0);
  objc_storeStrong((id *)&self->_firstRowLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_customStandardAccessoryView, 0);
  objc_storeStrong((id *)&self->_insetFirstRowCenterFreeSpaceLayoutGuide, 0);
  objc_storeStrong((id *)&self->_firstRowCenterFreeSpaceLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_detailButtonColor);
  objc_destroyWeak((id *)&self->_subtitleLabelColor);
  objc_destroyWeak((id *)&self->_disclosureDetailLabelColor);
  objc_destroyWeak((id *)&self->_detailLabelColor);
  objc_destroyWeak((id *)&self->_titleLabelColor);
  objc_storeStrong((id *)&self->_customSelectedBackgroundView, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_customHighlightedCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_customCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_fullSizeControl, 0);
  objc_storeStrong((id *)&self->_customAccessoryView, 0);
  objc_storeStrong((id *)&self->_customImageButton, 0);
  objc_storeStrong((id *)&self->_customImageView, 0);
  objc_storeStrong((id *)&self->_customDetailTextLabel, 0);
  objc_storeStrong((id *)&self->_customTextLabel, 0);
}

@end
