@implementation LineProgressGradientView.GradientView

+ (Class)layerClass
{
  sub_100294DA8();
  return (Class)objc_msgSend((id)swift_getObjCClassFromMetadata(), "classForCoder");
}

- (_TtCC11MusicCoreUI24LineProgressGradientViewP33_CAA5E92EB35A39E050897B33043EE84412GradientView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for LineProgressGradientView.GradientView();
  return -[LineProgressGradientView.GradientView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC11MusicCoreUI24LineProgressGradientViewP33_CAA5E92EB35A39E050897B33043EE84412GradientView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LineProgressGradientView.GradientView();
  return -[LineProgressGradientView.GradientView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
