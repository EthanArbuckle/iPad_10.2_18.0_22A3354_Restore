@implementation PKPassFaceViewCategoryVisualizationRendererState

- (char)initWithCurrentRendererState:(void *)a1
{
  char *v3;
  _BYTE v5[10192];
  _BYTE v6[10192];
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)PKPassFaceViewCategoryVisualizationRendererState;
  v3 = (char *)objc_msgSendSuper2(&v7, sel_init);
  if (v3)
  {
    memcpy(v5, a2, sizeof(v5));
    PKCategoryVisualizationRendererStateCopy((uint64_t)v5, (uint64_t)v6);
    memcpy(v3 + 16, v6, 0x27D0uLL);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  PKCategoryVisualizationRendererStateDestroy((uint64_t)&self->_state);
  v3.receiver = self;
  v3.super_class = (Class)PKPassFaceViewCategoryVisualizationRendererState;
  -[PKPassFaceViewCategoryVisualizationRendererState dealloc](&v3, sel_dealloc);
}

@end
