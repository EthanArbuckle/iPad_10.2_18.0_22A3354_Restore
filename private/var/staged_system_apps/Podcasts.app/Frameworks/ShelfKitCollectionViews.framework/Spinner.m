@implementation Spinner

- (void)tintColorDidChange
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for Spinner();
  v2 = v4.receiver;
  -[Spinner tintColorDidChange](&v4, "tintColorDidChange");
  v3 = objc_msgSend(v2, "tintColor", v4.receiver, v4.super_class);
  objc_msgSend(v2, "setColor:", v3);

}

- (_TtC23ShelfKitCollectionViewsP33_BF196CED1AC8F58D44CC0C0970B139AE7Spinner)initWithActivityIndicatorStyle:(int64_t)a3
{
  return (_TtC23ShelfKitCollectionViewsP33_BF196CED1AC8F58D44CC0C0970B139AE7Spinner *)sub_13E514(self, (uint64_t)a2, a3, (SEL *)&selRef_initWithActivityIndicatorStyle_);
}

- (_TtC23ShelfKitCollectionViewsP33_BF196CED1AC8F58D44CC0C0970B139AE7Spinner)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for Spinner();
  return -[Spinner initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViewsP33_BF196CED1AC8F58D44CC0C0970B139AE7Spinner)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViewsP33_BF196CED1AC8F58D44CC0C0970B139AE7Spinner *)sub_13E514(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end
