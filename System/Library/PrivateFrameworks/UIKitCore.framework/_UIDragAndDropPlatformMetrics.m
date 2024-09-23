@implementation _UIDragAndDropPlatformMetrics

- (_UIDragAndDropPlatformMetrics)init
{
  _UIDragAndDropPlatformMetrics *v2;
  _UIDragAndDropPlatformMetrics *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDragAndDropPlatformMetrics;
  v2 = -[_UIDragAndDropPlatformMetrics init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIDragAndDropPlatformMetrics setDefaultPreviewOutlineProvider:](v2, "setDefaultPreviewOutlineProvider:", &__block_literal_global_257);
    -[_UIDragAndDropPlatformMetrics setPreviewMinimumSize:](v3, "setPreviewMinimumSize:", 16.0, 16.0);
  }
  return v3;
}

- (id)defaultPreviewOutlineProvider
{
  return self->_defaultPreviewOutlineProvider;
}

- (void)setDefaultPreviewOutlineProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)playDropFeedback
{
  return self->_playDropFeedback;
}

- (void)setPlayDropFeedback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGSize)previewMinimumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previewMinimumSize.width;
  height = self->_previewMinimumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviewMinimumSize:(CGSize)a3
{
  self->_previewMinimumSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playDropFeedback, 0);
  objc_storeStrong(&self->_defaultPreviewOutlineProvider, 0);
}

@end
