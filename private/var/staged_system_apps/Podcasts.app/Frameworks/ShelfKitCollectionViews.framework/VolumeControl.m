@implementation VolumeControl

- (_TtC23ShelfKitCollectionViews13VolumeControl)init
{
  _TtC23ShelfKitCollectionViews13VolumeControl *result;

  sub_2DBD68();
  return result;
}

- (void)dealloc
{
  _TtC23ShelfKitCollectionViews13VolumeControl *v2;

  v2 = self;
  sub_2DC5E4();
}

- (void).cxx_destruct
{
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_volumeObserver, &qword_3D1A70);
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_delegate, &qword_3E2090);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_currentVolumeGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_backdrop));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_volumeBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_volumeBarFill));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_volumeKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_volumeTimer));
}

- (_TtC23ShelfKitCollectionViews13VolumeControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2DE274();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews13VolumeControl *v2;

  v2 = self;
  sub_2DC7F8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3;
  _TtC23ShelfKitCollectionViews13VolumeControl *v4;
  unsigned __int128 v5;
  double v6;
  double v7;
  CGSize result;

  v3 = qword_3CFF68;
  v4 = self;
  if (v3 != -1)
    swift_once(&qword_3CFF68, sub_2DBA94);
  v5 = xmmword_3E1FD8;

  *(_QWORD *)&v7 = v5 >> 64;
  *(_QWORD *)&v6 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)didSlideWithGestureRecognizer:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews13VolumeControl *v5;

  v4 = a3;
  v5 = self;
  sub_2DD334(v4);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews13VolumeControl *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_2DD4EC(v4);

  return self & 1;
}

- (void)didTap
{
  char v2;
  _TtC23ShelfKitCollectionViews13VolumeControl *v3;

  v2 = *((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_isExpanded);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_isExpanded) = v2 ^ 1;
  v3 = self;
  sub_2DBAAC(v2);

}

- (void)volumeChangedWithNotification:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews13VolumeControl *v5;

  v4 = a3;
  v5 = self;
  sub_2DDD28(v4);

}

- (_TtC23ShelfKitCollectionViews13VolumeControl)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews13VolumeControl *result;

  result = (_TtC23ShelfKitCollectionViews13VolumeControl *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.VolumeControl", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
