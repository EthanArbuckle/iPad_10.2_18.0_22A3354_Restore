@implementation PASUIMicaView

- (_TtC23ProximityAppleIDSetupUI13PASUIMicaView)initWithCoder:(id)a3
{
  id v4;
  _TtC23ProximityAppleIDSetupUI13PASUIMicaView *v5;
  _TtC23ProximityAppleIDSetupUI13PASUIMicaView *v6;
  _TtC23ProximityAppleIDSetupUI13PASUIMicaView *v7;
  objc_super v9;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PASUIMicaView();
  v4 = a3;
  v5 = -[PASUIMicaView initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_220D7767C();

  }
  return v6;
}

- (_TtC23ProximityAppleIDSetupUI13PASUIMicaView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC23ProximityAppleIDSetupUI13PASUIMicaView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PASUIMicaView();
  v7 = -[PASUIMicaView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_220D7767C();

  return v7;
}

- (void)layoutSubviews
{
  _TtC23ProximityAppleIDSetupUI13PASUIMicaView *v2;

  v2 = self;
  sub_220D77874();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer));
}

@end
