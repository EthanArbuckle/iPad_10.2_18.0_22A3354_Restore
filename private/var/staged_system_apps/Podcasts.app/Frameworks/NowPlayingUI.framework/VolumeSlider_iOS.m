@implementation VolumeSlider_iOS

- (_TtC12NowPlayingUI16VolumeSlider_iOS)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for VolumeSlider_iOS();
  return -[VolumeSlider_iOS initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC12NowPlayingUI16VolumeSlider_iOS)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for VolumeSlider_iOS();
  return -[VolumeSlider_iOS initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI16VolumeSlider_iOS)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VolumeSlider_iOS();
  return -[VolumeSlider_iOS initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC12NowPlayingUI16VolumeSlider_iOS)initWithFrame:(CGRect)a3 style:(int64_t)a4 endpointRoute:(id)a5 outputDeviceRoute:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for VolumeSlider_iOS();
  return -[VolumeSlider_iOS initWithFrame:style:endpointRoute:outputDeviceRoute:](&v14, "initWithFrame:style:endpointRoute:outputDeviceRoute:", a4, a5, a6, x, y, width, height);
}

@end
