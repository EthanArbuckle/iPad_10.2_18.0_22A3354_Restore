@implementation _UGCAddPhotoViewModel

- (NSString)symbolName
{
  return (NSString *)CFSTR("camera.fill");
}

- (NSString)titleString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[UGC Contribution Card] Add Your Photos button"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (int64_t)actionStyle
{
  return 0;
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)accessibilityIdentifierForAction
{
  return CFSTR("UGCAddPhoto");
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

@end
