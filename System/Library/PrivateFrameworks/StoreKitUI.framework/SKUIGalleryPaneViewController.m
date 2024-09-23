@implementation SKUIGalleryPaneViewController

- (SKUIGalleryPaneViewController)initWithMediaComponent:(id)a3 galleryIndex:(int64_t)a4
{
  id v7;
  SKUIGalleryPaneViewController *v8;
  SKUIGalleryPaneViewController *v9;
  objc_super v11;

  v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGalleryPaneViewController initWithMediaComponent:galleryIndex:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIGalleryPaneViewController;
  v8 = -[SKUIGalleryPaneViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_component, a3);
    v9->_galleryIndex = a4;
  }

  return v9;
}

- (SKUIMediaComponent)component
{
  return self->_component;
}

- (int64_t)galleryIndex
{
  return self->_galleryIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
}

- (void)initWithMediaComponent:galleryIndex:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGalleryPaneViewController initWithMediaComponent:galleryIndex:]";
}

@end
