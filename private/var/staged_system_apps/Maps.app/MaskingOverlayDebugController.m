@implementation MaskingOverlayDebugController

- (MaskingOverlayDebugController)init
{
  MaskingOverlayDebugController *v2;
  MaskingOverlayDebugController *v3;
  MaskingOverlayDebugController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MaskingOverlayDebugController;
  v2 = -[MapsDebugValuesViewController init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (id)navigationDestinationTitle
{
  return CFSTR("Masking Overlay");
}

- (void)prepareContent
{
  id v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100BBF010;
  v4[3] = &unk_1011AEAC8;
  objc_copyWeak(&v5, &location);
  v3 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Masking Overlay Debug"), v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

@end
