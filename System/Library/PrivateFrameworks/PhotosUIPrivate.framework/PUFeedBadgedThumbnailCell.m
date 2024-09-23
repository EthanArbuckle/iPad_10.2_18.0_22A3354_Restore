@implementation PUFeedBadgedThumbnailCell

- (PUFeedBadgedThumbnailCell)initWithFrame:(CGRect)a3
{
  PUFeedBadgedThumbnailCell *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PXBadgedThumbnailView *badgedThumbnailView;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUFeedBadgedThumbnailCell;
  v3 = -[PUFeedBadgedThumbnailCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0D7B548], "placeholderEmptyImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v5);

    -[PUFeedBadgedThumbnailCell tintColor](v3, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7B548], "thumbnailBadgeImageForTintColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7B220]), "initWithplaceholderImageView:", v4);
    badgedThumbnailView = v3->_badgedThumbnailView;
    v3->_badgedThumbnailView = (PXBadgedThumbnailView *)v8;

    -[PUFeedBadgedThumbnailCell bounds](v3, "bounds");
    -[PXBadgedThumbnailView setFrame:](v3->_badgedThumbnailView, "setFrame:");
    -[PXBadgedThumbnailView setBadgeImage:](v3->_badgedThumbnailView, "setBadgeImage:", v7);
    -[PUFeedBadgedThumbnailCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v3->_badgedThumbnailView);

  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUFeedBadgedThumbnailCell;
  -[PUFeedBadgedThumbnailCell prepareForReuse](&v7, sel_prepareForReuse);
  -[PUFeedBadgedThumbnailCell badgedThumbnailView](self, "badgedThumbnailView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItems");
  if (v4 >= 1)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v3, "setImageHidden:forItemAtIndex:", 0, i);
      objc_msgSend(v3, "setImage:forItemAtIndex:", 0, i);
    }
  }

}

- (PXBadgedThumbnailView)badgedThumbnailView
{
  return self->_badgedThumbnailView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgedThumbnailView, 0);
}

@end
