@implementation UITableViewDropPlaceholder

- (void)previewParametersProvider
{
  return self->_previewParametersProvider;
}

- (void)setPreviewParametersProvider:(void *)previewParametersProvider
{
  objc_setProperty_nonatomic_copy(self, a2, previewParametersProvider, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previewParametersProvider, 0);
}

@end
