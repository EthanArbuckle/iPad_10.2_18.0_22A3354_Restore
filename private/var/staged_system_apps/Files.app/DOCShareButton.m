@implementation DOCShareButton

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[DOCShareButton tintColorDidChange](&v3, "tintColorDidChange");
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (void)updateConfiguration
{
  _TtC5FilesP33_5854F2584B6BB42CC0BFB2F44FFF0F2914DOCShareButton *v2;

  v2 = self;
  sub_1002231EC();

}

- (void)layoutSubviews
{
  id v2;
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v4.receiver;
  -[DOCShareButton layoutSubviews](&v4, "layoutSubviews");
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v2, "_setContinuousCornerRadius:", v3 * 0.5);

}

- (_TtC5FilesP33_5854F2584B6BB42CC0BFB2F44FFF0F2914DOCShareButton)initWithFrame:(CGRect)a3
{
  sub_100226BB0((uint64_t)self, (uint64_t)a2, (uint64_t)"Files.DOCShareButton", 20);
}

@end
