@implementation _BasicTwoLinesContentViewModel

- (_BasicTwoLinesContentViewModel)initWithTitleText:(id)a3 subtitleText:(id)a4 cancelableImageCreationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BasicTwoLinesContentViewModel *v11;
  NSString *v12;
  NSString *titleText;
  NSString *v14;
  NSString *subtitleText;
  id v16;
  id imageCreationBlock;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_BasicTwoLinesContentViewModel;
  v11 = -[_BasicTwoLinesContentViewModel init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    titleText = v11->_titleText;
    v11->_titleText = v12;

    v14 = (NSString *)objc_msgSend(v9, "copy");
    subtitleText = v11->_subtitleText;
    v11->_subtitleText = v14;

    v16 = objc_msgSend(v10, "copy");
    imageCreationBlock = v11->_imageCreationBlock;
    v11->_imageCreationBlock = v16;

  }
  return v11;
}

- (_BasicTwoLinesContentViewModel)initWithTitleText:(id)a3 subtitleText:(id)a4 imageCreationBlock:(id)a5
{
  id v8;
  _BasicTwoLinesContentViewModel *v9;
  _QWORD v11[4];
  id v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008CAD00;
  v11[3] = &unk_1011DAEC8;
  v12 = a5;
  v8 = v12;
  v9 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:cancelableImageCreationBlock:](self, "initWithTitleText:subtitleText:cancelableImageCreationBlock:", a3, a4, v11);

  return v9;
}

- (void)dealloc
{
  id cancelImageCreation;
  void (**v4)(_QWORD);
  id v5;
  id pendingImageCreationCompletionBlock;
  objc_super v7;

  cancelImageCreation = self->_cancelImageCreation;
  if (cancelImageCreation)
  {
    v4 = (void (**)(_QWORD))objc_retainBlock(cancelImageCreation);
    v5 = self->_cancelImageCreation;
    self->_cancelImageCreation = 0;

    pendingImageCreationCompletionBlock = self->_pendingImageCreationCompletionBlock;
    self->_pendingImageCreationCompletionBlock = 0;

    v4[2](v4);
  }
  v7.receiver = self;
  v7.super_class = (Class)_BasicTwoLinesContentViewModel;
  -[_BasicTwoLinesContentViewModel dealloc](&v7, "dealloc");
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___TwoLinesContentViewModelObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)updateObservers
{
  -[GEOObserverHashTable twoLinesTableViewCellModelDidUpdate:](self->_observers, "twoLinesTableViewCellModelDidUpdate:", self);
}

- (void)setImageCreationCanBeCached:(BOOL)a3
{
  if (self->_imageCreationCanBeCached != a3)
  {
    self->_imageCreationCanBeCached = a3;
    if (!a3)
      -[_BasicTwoLinesContentViewModel invalidateCachedImage](self, "invalidateCachedImage");
  }
}

- (void)invalidateCachedImage
{
  UIImage *cachedImage;

  cachedImage = self->_cachedImage;
  if (cachedImage)
  {
    self->_cachedImage = 0;

    self->_cachedImageAllowsClipping = 0;
    -[_BasicTwoLinesContentViewModel updateObservers](self, "updateObservers");
  }
}

- (void)fetchImageForScreenScale:(double)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, UIImage *, BOOL);
  UIImage *cachedImage;
  void *v8;
  id v9;
  id v10;
  id v11;
  id pendingImageCreationCompletionBlock;
  id cancelImageCreation;
  void (**v14)(_QWORD);
  id v15;
  id v16;
  id v17;
  uint64_t (**v18)(_QWORD, _QWORD, double);
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  void (**v23)(id, UIImage *, BOOL);
  id v24;
  id location;

  v6 = (void (**)(id, UIImage *, BOOL))a4;
  if (v6)
  {
    if (-[_BasicTwoLinesContentViewModel imageCreationCanBeCached](self, "imageCreationCanBeCached")
      && (cachedImage = self->_cachedImage) != 0)
    {
      v6[2](v6, cachedImage, self->_cachedImageAllowsClipping);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_BasicTwoLinesContentViewModel imageCreationBlock](self, "imageCreationBlock"));

      if (v8)
      {
        if (-[_BasicTwoLinesContentViewModel imageCreationCanBeCached](self, "imageCreationCanBeCached")
          && (v9 = self->_pendingImageCreationCompletionBlock) != 0)
        {
          v10 = objc_retainBlock(v9);
          v11 = objc_msgSend(v6, "copy");
          pendingImageCreationCompletionBlock = self->_pendingImageCreationCompletionBlock;
          self->_pendingImageCreationCompletionBlock = v11;

          (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
        }
        else
        {
          cancelImageCreation = self->_cancelImageCreation;
          if (cancelImageCreation)
          {
            v14 = (void (**)(_QWORD))objc_retainBlock(cancelImageCreation);
            v15 = self->_cancelImageCreation;
            self->_cancelImageCreation = 0;

            v14[2](v14);
          }
          if (-[_BasicTwoLinesContentViewModel imageCreationCanBeCached](self, "imageCreationCanBeCached"))
          {
            v16 = objc_msgSend(v6, "copy");
            v17 = self->_pendingImageCreationCompletionBlock;
            self->_pendingImageCreationCompletionBlock = v16;

          }
          objc_initWeak(&location, self);
          v18 = (uint64_t (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue(-[_BasicTwoLinesContentViewModel imageCreationBlock](self, "imageCreationBlock"));
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_1008CB03C;
          v22[3] = &unk_1011DAEF0;
          objc_copyWeak(&v24, &location);
          v22[4] = self;
          v23 = v6;
          v19 = ((uint64_t (**)(_QWORD, _QWORD *, double))v18)[2](v18, v22, a3);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = self->_cancelImageCreation;
          self->_cancelImageCreation = v20;

          objc_destroyWeak(&v24);
          objc_destroyWeak(&location);
        }
      }
    }
  }

}

- (UIView)customAccessoryView
{
  return self->_customAccessoryView;
}

- (void)setCustomAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_customAccessoryView, a3);
}

- (PlaceContextViewModel)placeContextViewModel
{
  return self->_placeContextViewModel;
}

- (void)setPlaceContextViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_placeContextViewModel, a3);
}

- (BOOL)hasVibrantBackground
{
  return self->_vibrantBackground;
}

- (void)setVibrantBackground:(BOOL)a3
{
  self->_vibrantBackground = a3;
}

- (GEOPublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (NSAttributedString)attributedSubtitleText
{
  return self->_attributedSubtitleText;
}

- (void)setAttributedSubtitleText:(id)a3
{
  objc_storeStrong((id *)&self->_attributedSubtitleText, a3);
}

- (UIColor)leadingImageBackgroundColor
{
  return self->_leadingImageBackgroundColor;
}

- (void)setLeadingImageBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_leadingImageBackgroundColor, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextColor, a3);
}

- (NSArray)titleHighlightRanges
{
  return self->_titleHighlightRanges;
}

- (void)setTitleHighlightRanges:(id)a3
{
  objc_storeStrong((id *)&self->_titleHighlightRanges, a3);
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleText, a3);
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (void)setSubtitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTextColor, a3);
}

- (NSArray)subtitleHighlightRanges
{
  return self->_subtitleHighlightRanges;
}

- (void)setSubtitleHighlightRanges:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleHighlightRanges, a3);
}

- (BOOL)showBadgeView
{
  return self->_showBadgeView;
}

- (void)setShowBadgeView:(BOOL)a3
{
  self->_showBadgeView = a3;
}

- (BOOL)allowsSubtitleWrapping
{
  return self->_allowsSubtitleWrapping;
}

- (void)setAllowsSubtitleWrapping:(BOOL)a3
{
  self->_allowsSubtitleWrapping = a3;
}

- (BOOL)subtitleUsesMonospacedNumbers
{
  return self->_subtitleUsesMonospacedNumbers;
}

- (void)setSubtitleUsesMonospacedNumbers:(BOOL)a3
{
  self->_subtitleUsesMonospacedNumbers = a3;
}

- (id)personalizedItemForQuickActionMenuCreator
{
  return self->_personalizedItemForQuickActionMenuCreator;
}

- (void)setPersonalizedItemForQuickActionMenuCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)debugString
{
  return self->_debugString;
}

- (void)setDebugString:(id)a3
{
  objc_storeStrong((id *)&self->_debugString, a3);
}

- (unint64_t)imageStyle
{
  return self->_imageStyle;
}

- (void)setImageStyle:(unint64_t)a3
{
  self->_imageStyle = a3;
}

- (unint64_t)imageShadowStyle
{
  return self->_imageShadowStyle;
}

- (void)setImageShadowStyle:(unint64_t)a3
{
  self->_imageShadowStyle = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (BOOL)shouldCenterImage
{
  return self->_shouldCenterImage;
}

- (void)setShouldCenterImage:(BOOL)a3
{
  self->_shouldCenterImage = a3;
}

- (id)imageCreationBlock
{
  return self->_imageCreationBlock;
}

- (void)setImageCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)imageCreationCanBeCached
{
  return self->_imageCreationCanBeCached;
}

- (UIColor)leftImageTintColor
{
  return self->_leftImageTintColor;
}

- (void)setLeftImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_leftImageTintColor, a3);
}

- (NSArray)cellAccessories
{
  return self->_cellAccessories;
}

- (void)setCellAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_cellAccessories, a3);
}

- (BOOL)shouldEnableGrayscaleHighlighting
{
  return self->_shouldEnableGrayscaleHighlighting;
}

- (void)setShouldEnableGrayscaleHighlighting:(BOOL)a3
{
  self->_shouldEnableGrayscaleHighlighting = a3;
}

- (UIFont)titleTextFont
{
  return self->_titleTextFont;
}

- (void)setTitleTextFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextFont, a3);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (NSString)axIdentifier
{
  return self->_axIdentifier;
}

- (void)setAxIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_axIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axIdentifier, 0);
  objc_storeStrong((id *)&self->_titleTextFont, 0);
  objc_storeStrong((id *)&self->_cellAccessories, 0);
  objc_storeStrong((id *)&self->_leftImageTintColor, 0);
  objc_storeStrong(&self->_imageCreationBlock, 0);
  objc_storeStrong((id *)&self->_debugString, 0);
  objc_storeStrong(&self->_personalizedItemForQuickActionMenuCreator, 0);
  objc_storeStrong((id *)&self->_subtitleHighlightRanges, 0);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleHighlightRanges, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_leadingImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_attributedSubtitleText, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_placeContextViewModel, 0);
  objc_storeStrong((id *)&self->_customAccessoryView, 0);
  objc_storeStrong(&self->_pendingImageCreationCompletionBlock, 0);
  objc_storeStrong(&self->_cancelImageCreation, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
