@implementation SXGalleryItemImageView

- (SXGalleryItemImageView)initWithGalleryItem:(id)a3 imageResource:(id)a4 resourceDataSource:(id)a5 reachabilityProvider:(id)a6
{
  id v11;
  SXGalleryItemImageView *v12;
  SXGalleryItemImageView *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SXGalleryItemImageView;
  v12 = -[SXImageView initWithImageResource:resourceDataSource:reachabilityProvider:](&v15, sel_initWithImageResource_resourceDataSource_reachabilityProvider_, a4, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_galleryItem, a3);

  return v13;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  _BOOL4 v4;

  -[SXGalleryItemImageView accessibilityLabel](self, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = !-[NSObject sxax_shouldBeOccluded](self, "sxax_shouldBeOccluded");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[SXGalleryItemImageView galleryItem](self, "galleryItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityCaption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    -[SXGalleryItemImageView galleryItem](self, "galleryItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "caption");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (SXGalleryItem)galleryItem
{
  return self->_galleryItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryItem, 0);
}

@end
