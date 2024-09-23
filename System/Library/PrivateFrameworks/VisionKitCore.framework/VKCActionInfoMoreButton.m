@implementation VKCActionInfoMoreButton

- (void)_moreButtonAction:(id)a3
{
  void *v4;
  double v5;

  -[VKCActionInfoMoreButton setIsShowingSingleTapMenu:](self, "setIsShowingSingleTapMenu:", 1);
  -[VKCActionInfoMoreButton contextMenuInteraction](self, "contextMenuInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCActionInfoMoreButton bounds](self, "bounds");
  objc_msgSend(v4, "_presentMenuAtLocation:", v5 * 0.5, 0.0);

  -[VKCActionInfoMoreButton setIsShowingSingleTapMenu:](self, "setIsShowingSingleTapMenu:", 0);
}

- (BOOL)isShowingSingleTapMenu
{
  return self->_isShowingSingleTapMenu;
}

- (void)setIsShowingSingleTapMenu:(BOOL)a3
{
  self->_isShowingSingleTapMenu = a3;
}

@end
