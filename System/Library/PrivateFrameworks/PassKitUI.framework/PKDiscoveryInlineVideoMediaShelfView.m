@implementation PKDiscoveryInlineVideoMediaShelfView

- (PKDiscoveryInlineVideoMediaShelfView)initWithShelf:(id)a3
{
  id v4;
  PKPlayerView *v5;
  PKPlayerView *v6;
  PKDiscoveryInlineVideoMediaShelfView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v5 = [PKPlayerView alloc];
  v6 = -[PKPlayerView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v14.receiver = self;
  v14.super_class = (Class)PKDiscoveryInlineVideoMediaShelfView;
  v7 = -[PKDiscoveryInlineCaptionedMediaShelfView initWithShelf:mediaView:](&v14, sel_initWithShelf_mediaView_, v4, v6);

  if (v7)
  {
    -[PKDiscoveryMedia urls](v7->super._media, "urls");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKDiscoveryInlineVideoMediaShelfView playerMediaView](v7, "playerMediaView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playItemAtURL:", v12);

  }
  return v7;
}

- (id)playerMediaView
{
  return self->super._mediaView;
}

@end
