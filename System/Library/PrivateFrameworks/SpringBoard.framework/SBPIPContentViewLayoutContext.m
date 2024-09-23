@implementation SBPIPContentViewLayoutContext

- (SBPIPContentViewLayoutContext)initWithPlatformMetrics:(id)a3 contentSize:(CGSize)a4 defaults:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  SBPIPContentViewLayoutContext *v11;
  SBPIPContentViewLayoutContext *v12;
  void *v13;
  uint64_t v14;
  NSString *contentTypeIdentifier;
  double v16;
  objc_super v18;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBPIPContentViewLayoutContext;
  v11 = -[SBPIPContentViewLayoutContext init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_sizeChanged = 0;
    v11->_minimumSizeSpanBetweenPreferredSizes = 0.0;
    v11->_maximumSizeSpanForPreferredSizeTuning = 0.0;
    objc_storeStrong((id *)&v11->_defaults, a5);
    objc_msgSend(v9, "contentTypeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    contentTypeIdentifier = v12->_contentTypeIdentifier;
    v12->_contentTypeIdentifier = (NSString *)v14;

    v16 = 1.0;
    if (width != 0.0)
      v16 = width;
    v12->_currentAspectRatio = height / v16;
    -[SBPIPContentViewLayoutContext updatePlatformMetrics:](v12, "updatePlatformMetrics:", v9);
  }

  return v12;
}

- (void)setCurrentSize:(double)a3 forAspectRatio:(double)a4
{
  if (self->_currentSize != a3)
  {
    self->_currentAspectRatio = a4;
    self->_currentSize = a3;
    self->_sizeChanged = 1;
    -[SBPIPDefaults setLastKnownSize:contentType:](self->_defaults, "setLastKnownSize:contentType:", self->_contentTypeIdentifier);
  }
}

- (void)updatePlatformMetrics:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  NSString *v7;
  NSString *contentTypeIdentifier;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "contentTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", self->_contentTypeIdentifier);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v15, "contentTypeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSString *)objc_msgSend(v6, "copy");
    contentTypeIdentifier = self->_contentTypeIdentifier;
    self->_contentTypeIdentifier = v7;

  }
  objc_msgSend(v15, "sizePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizePreferencesForAspectRatio:", self->_currentAspectRatio);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPIPDefaults lastKnownSizeForContentType:](self->_defaults, "lastKnownSizeForContentType:", self->_contentTypeIdentifier);
  v12 = v11;
  if (SBFloatEqualsFloat())
  {
    objc_msgSend(v10, "longSideDefaultSize");
    v12 = v13;
  }
  self->_currentSize = v12;
  self->_minimumSizePreference = v12;
  objc_msgSend(v10, "longSideMaximumSize");
  self->_maximumSizePreference = v14;

}

- (double)currentAspectRatio
{
  return self->_currentAspectRatio;
}

- (void)setCurrentAspectRatio:(double)a3
{
  self->_currentAspectRatio = a3;
}

- (double)currentSize
{
  return self->_currentSize;
}

- (void)setCurrentSize:(double)a3
{
  self->_currentSize = a3;
}

- (BOOL)hasSizeChanged
{
  return self->_sizeChanged;
}

- (double)minimumSizePreference
{
  return self->_minimumSizePreference;
}

- (void)setMinimumSizePreference:(double)a3
{
  self->_minimumSizePreference = a3;
}

- (double)maximumSizePreference
{
  return self->_maximumSizePreference;
}

- (void)setMaximumSizePreference:(double)a3
{
  self->_maximumSizePreference = a3;
}

- (double)minimumSizeSpanBetweenPreferredSizes
{
  return self->_minimumSizeSpanBetweenPreferredSizes;
}

- (void)setMinimumSizeSpanBetweenPreferredSizes:(double)a3
{
  self->_minimumSizeSpanBetweenPreferredSizes = a3;
}

- (double)maximumSizeSpanForPreferredSizeTuning
{
  return self->_maximumSizeSpanForPreferredSizeTuning;
}

- (void)setMaximumSizeSpanForPreferredSizeTuning:(double)a3
{
  self->_maximumSizeSpanForPreferredSizeTuning = a3;
}

- (SBPIPDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSString)contentTypeIdentifier
{
  return self->_contentTypeIdentifier;
}

- (void)setContentTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
