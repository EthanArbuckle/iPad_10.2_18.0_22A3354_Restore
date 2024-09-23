@implementation PXVideoOverlayButtonConfiguration

- (PXVideoOverlayButtonConfiguration)init
{
  PXVideoOverlayButtonConfiguration *v2;
  PXVideoOverlayButtonConfiguration *v3;
  NSString *localizedTitle;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXVideoOverlayButtonConfiguration;
  v2 = -[PXVideoOverlayButtonConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    localizedTitle = v2->_localizedTitle;
    v2->_style = 0;
    v2->_localizedTitle = 0;
    v2->_allowBackdropStatisticsSupression = 1;

  }
  return v3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)allowBackdropStatisticsSupression
{
  return self->_allowBackdropStatisticsSupression;
}

- (void)setAllowBackdropStatisticsSupression:(BOOL)a3
{
  self->_allowBackdropStatisticsSupression = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
