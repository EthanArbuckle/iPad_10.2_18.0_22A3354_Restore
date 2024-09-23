@implementation _UISceneHostingContentSizePreferenceClientComponent

- (void)_setPreferredContentSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGSize *p_preferredContentSize;
  void *v7;
  _QWORD v8[6];

  height = a3.height;
  width = a3.width;
  p_preferredContentSize = &self->_preferredContentSize;
  if (a3.width != self->_preferredContentSize.width || a3.height != self->_preferredContentSize.height)
  {
    -[FBSSceneComponent clientScene](self, "clientScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80___UISceneHostingContentSizePreferenceClientComponent__setPreferredContentSize___block_invoke;
    v8[3] = &__block_descriptor_48_e118___FBSSceneTransitionContext_16__0__FBSMutableSceneClientSettings__UISceneHostingContentSizePreferenceClientSettings__8l;
    *(CGFloat *)&v8[4] = width;
    *(CGFloat *)&v8[5] = height;
    objc_msgSend(v7, "updateClientSettingsWithTransitionBlock:", v8);

    p_preferredContentSize->width = width;
    p_preferredContentSize->height = height;
  }
}

- (CGSize)_preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
