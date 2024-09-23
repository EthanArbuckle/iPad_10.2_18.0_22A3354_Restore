@implementation ICSearchAttachmentResultsCollectionViewCell

- (ICSearchAttachmentResultsCollectionViewCell)initWithFrame:(CGRect)a3
{
  ICSearchAttachmentResultsCollectionViewCell *v3;
  ICAttachmentBrickView *v4;
  ICAttachmentBrickView *attachmentBrickView;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICSearchAttachmentResultsCollectionViewCell;
  v3 = -[ICSearchAttachmentResultsCollectionViewCell initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (ICAttachmentBrickView *)objc_msgSend(objc_alloc((Class)ICAttachmentBrickView), "initWithType:", 1);
    attachmentBrickView = v3->_attachmentBrickView;
    v3->_attachmentBrickView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSearchAttachmentResultsCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v6, "addSubview:", v3->_attachmentBrickView);

    -[ICAttachmentBrickView ic_addAnchorsToFillSuperview](v3->_attachmentBrickView, "ic_addAnchorsToFillSuperview");
    -[ICSearchAttachmentResultsCollectionViewCell setAutomaticallyUpdatesBackgroundConfiguration:](v3, "setAutomaticallyUpdatesBackgroundConfiguration:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration"));
    -[ICSearchAttachmentResultsCollectionViewCell setBackgroundConfiguration:](v3, "setBackgroundConfiguration:", v7);

    -[ICSearchAttachmentResultsCollectionViewCell setFocusEffect:](v3, "setFocusEffect:", 0);
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ICSearchAttachmentResultsCollectionViewCell;
  -[ICSearchAttachmentResultsCollectionViewCell setSelected:](&v6, "setSelected:");
  if (-[ICSearchAttachmentResultsCollectionViewCell highlightSelection](self, "highlightSelection"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSearchAttachmentResultsCollectionViewCell attachmentBrickView](self, "attachmentBrickView"));
    objc_msgSend(v5, "setSelected:", v3);

  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSearchAttachmentResultsCollectionViewCell;
  -[ICSearchAttachmentResultsCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSearchAttachmentResultsCollectionViewCell attachmentBrickView](self, "attachmentBrickView"));
  objc_msgSend(v3, "prepareForReuse");

}

+ (CGSize)itemSize
{
  double v2;
  double v3;
  CGSize result;

  +[ICAttachmentBrickView defaultBrickSize](ICAttachmentBrickView, "defaultBrickSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setAttachment:(id)a3 searchResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSearchAttachmentResultsCollectionViewCell attachmentBrickView](self, "attachmentBrickView"));
  objc_msgSend(v8, "setAttachment:", v7);

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "highlightPatternRegexFinder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSearchAttachmentResultsCollectionViewCell attachmentBrickView](self, "attachmentBrickView"));
  objc_msgSend(v9, "setHighlightPatternRegexFinder:", v10);

}

- (void)updateTextAndStatus
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICSearchAttachmentResultsCollectionViewCell attachmentBrickView](self, "attachmentBrickView"));
  objc_msgSend(v2, "reloadData");

}

- (void)updateThumbnail
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICSearchAttachmentResultsCollectionViewCell attachmentBrickView](self, "attachmentBrickView"));
  objc_msgSend(v2, "reloadData");

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  int v5;
  void *v6;
  id v7;

  if (-[ICSearchAttachmentResultsCollectionViewCell isFocused](self, "isFocused", a3, a4)
    && !-[ICSearchAttachmentResultsCollectionViewCell highlightSelection](self, "highlightSelection"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
    v5 = 1;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSearchAttachmentResultsCollectionViewCell attachmentBrickView](self, "attachmentBrickView"));
  objc_msgSend(v6, "setHighlightColor:", v7);

  if (v5)
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSearchAttachmentResultsCollectionViewCell attachmentBrickView](self, "attachmentBrickView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityLabel"));

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSearchAttachmentResultsCollectionViewCell attachmentBrickView](self, "attachmentBrickView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityValue"));

  return v3;
}

- (id)accessibilityDragSourceDescriptors
{
  return 0;
}

- (id)accessibilityDropPointDescriptors
{
  return 0;
}

- (BOOL)highlightSelection
{
  return self->_highlightSelection;
}

- (void)setHighlightSelection:(BOOL)a3
{
  self->_highlightSelection = a3;
}

- (ICAttachmentBrickView)attachmentBrickView
{
  return self->_attachmentBrickView;
}

- (void)setAttachmentBrickView:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentBrickView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentBrickView, 0);
}

@end
