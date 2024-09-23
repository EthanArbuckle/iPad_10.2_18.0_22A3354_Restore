@implementation WLSettings

- (WLSettings)init
{
  WLSettings *v2;
  _BOOL8 enableDisplayZoom;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLSettings;
  v2 = -[WLSettings init](&v5, sel_init);
  if (v2)
  {
    -[WLSettings setEnableDisplayZoom:](v2, "setEnableDisplayZoom:", objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", CFSTR("enable_display_zoom")) == 1);
    enableDisplayZoom = v2->_enableDisplayZoom;
    _WLLog();
    objc_msgSend(MEMORY[0x24BEC2830], "removeForKey:", CFSTR("enable_display_zoom"), enableDisplayZoom);
  }
  return v2;
}

- (BOOL)enableDisplayZoom
{
  return self->_enableDisplayZoom;
}

- (void)setEnableDisplayZoom:(BOOL)a3
{
  self->_enableDisplayZoom = a3;
}

@end
