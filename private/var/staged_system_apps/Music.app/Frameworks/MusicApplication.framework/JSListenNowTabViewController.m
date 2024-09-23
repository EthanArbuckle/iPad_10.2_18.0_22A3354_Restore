@implementation JSListenNowTabViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[JSDrivenViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  if (qword_14ABC98 != -1)
    swift_once(&qword_14ABC98, sub_9A8488);
  *(_BYTE *)(qword_15813F8
           + OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_automaticallyFetchObjectsForHighlights) = 1;
  sub_9A5920(1, (uint64_t)UIScreen.Dimensions.size.getter, 0);

}

- (_TtC16MusicApplication28JSListenNowTabViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication28JSListenNowTabViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = -[JSTabViewController initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

@end
