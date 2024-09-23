@implementation ICDrawingCollectionViewCell

- (ICDrawingCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  ICDrawingCollectionViewCell *v10;
  ICDrawingCollectionViewCell *v11;
  id v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_msgSend(objc_alloc((Class)ICDrawingInlineView), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v9, "setAnchorPoint:", 0.5, 0.5);

  objc_msgSend(v8, "setThumbnailDisplay:", 1);
  objc_msgSend(v8, "setEditable:", 0);
  objc_msgSend(v8, "setHideLoadingProgress:", 1);
  v14.receiver = self;
  v14.super_class = (Class)ICDrawingCollectionViewCell;
  v10 = -[ICImagesAndMoviesBaseCell initWithThumbnailView:frame:](&v14, "initWithThumbnailView:frame:", v8, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[ICDrawingCollectionViewCell setClipsToBounds:](v10, "setClipsToBounds:", 1);
    v12 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", v11, "respondToLongPressGesture:");
    -[ICDrawingCollectionViewCell addGestureRecognizer:](v11, "addGestureRecognizer:", v12);

  }
  return v11;
}

- (void)setAttachment:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](self, "thumbnailView"));
  objc_msgSend(v5, "setAttachment:", v4);

  v6.receiver = self;
  v6.super_class = (Class)ICDrawingCollectionViewCell;
  -[ICImagesAndMoviesBaseCell setAttachment:](&v6, "setAttachment:", v4);

}

- (unint64_t)computedThumbnailLayout
{
  if (-[ICImagesAndMoviesBaseCell thumbnailLayout](self, "thumbnailLayout"))
    return -[ICImagesAndMoviesBaseCell thumbnailLayout](self, "thumbnailLayout");
  else
    return 1;
}

- (void)respondToLongPressGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
  if ((objc_msgSend(v4, "isMenuVisible") & 1) == 0)
  {
    -[ICDrawingCollectionViewCell becomeFirstResponder](self, "becomeFirstResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v6, "bounds");
    objc_msgSend(v4, "showMenuFromView:rect:", v5);

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("sketch"), &stru_1005704B8, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell itemNumberAccessibilityString](self, "itemNumberAccessibilityString"));
  v5 = __ICAccessibilityStringForVariables(1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v5 = objc_msgSend(v4, "length");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
  v7 = v6;
  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modificationDateForSpeaking"));
  v9 = (void *)v8;

  return v9;
}

@end
