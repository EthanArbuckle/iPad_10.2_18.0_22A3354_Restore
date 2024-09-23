@implementation PhoneSessionWatchDiscoveryView

- (_TtC9SeymourUI30PhoneSessionWatchDiscoveryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B16B6BC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI30PhoneSessionWatchDiscoveryView *v6;

  v5 = a3;
  v6 = self;
  sub_22B168EA8(a3);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC9SeymourUI30PhoneSessionWatchDiscoveryView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_22B168FEC((uint64_t)a4, x, y);

  return v10;
}

- (void)didTapStartStandaloneButton:(id)a3
{
  _TtC9SeymourUI30PhoneSessionWatchDiscoveryView *v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  sub_22BA812E8();
  swift_unknownObjectRelease();
  v5 = (void (*)(uint64_t))(*(_QWORD **)((char *)&v4->super.super.super.isa
                                                 + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_presenter))[2];
  if (v5)
  {
    v6 = swift_retain();
    v5(v6);
    sub_22B0FAA68((uint64_t)v5);
  }
  -[PhoneSessionWatchDiscoveryView removeFromSuperview](v4, sel_removeFromSuperview);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
}

- (_TtC9SeymourUI30PhoneSessionWatchDiscoveryView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI30PhoneSessionWatchDiscoveryView *result;

  result = (_TtC9SeymourUI30PhoneSessionWatchDiscoveryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_messageStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_spinnerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_lookingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_checkLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_startStandaloneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_connectingView));
}

@end
