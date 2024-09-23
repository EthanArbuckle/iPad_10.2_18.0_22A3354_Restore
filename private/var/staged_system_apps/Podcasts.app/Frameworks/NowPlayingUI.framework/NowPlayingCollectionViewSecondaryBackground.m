@implementation NowPlayingCollectionViewSecondaryBackground

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType(self);
  v4 = a3;
  v5 = v10.receiver;
  -[NowPlayingCollectionViewSecondaryBackground applyLayoutAttributes:](&v10, "applyLayoutAttributes:", v4);
  v6 = type metadata accessor for NowPlayingSecondaryBackgroundAttributes();
  v7 = swift_dynamicCastClass(v4, v6);
  if (v7)
  {
    objc_msgSend(v5, "setBackgroundColor:", *(_QWORD *)(v7 + OBJC_IVAR____TtC12NowPlayingUI39NowPlayingSecondaryBackgroundAttributes_backgroundColor), v10.receiver, v10.super_class);
  }
  else
  {
    v8 = (void *)objc_opt_self(UIColor);
    v9 = objc_msgSend(v8, "clearColor", v10.receiver, v10.super_class);
    objc_msgSend(v5, "setBackgroundColor:", v9);

    v4 = v5;
    v5 = v9;
  }

}

- (_TtC12NowPlayingUI43NowPlayingCollectionViewSecondaryBackground)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)swift_getObjectType(self);
  return -[NowPlayingCollectionViewSecondaryBackground initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI43NowPlayingCollectionViewSecondaryBackground)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[NowPlayingCollectionViewSecondaryBackground initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
