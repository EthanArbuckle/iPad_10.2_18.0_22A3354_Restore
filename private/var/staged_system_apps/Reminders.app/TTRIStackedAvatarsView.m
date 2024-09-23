@implementation TTRIStackedAvatarsView

- (_TtC9Reminders22TTRIStackedAvatarsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  _TtC9Reminders22TTRIStackedAvatarsView *v10;
  uint64_t v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_contacts) = (Class)_swiftEmptyArrayStorage;
  v9 = (char *)self + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_unscaledAvatarSize;
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_avatarsNeedUpdate) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_avatarViewControllers) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_avatarBorderViews) = (Class)_swiftEmptyArrayStorage;
  v13.receiver = self;
  v13.super_class = ObjectType;
  v10 = -[TTRIStackedAvatarsView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  sub_1004AB318((uint64_t)v10, v11);

  return v10;
}

- (_TtC9Reminders22TTRIStackedAvatarsView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders22TTRIStackedAvatarsView *)sub_1004AB40C(v3, v4);
}

- (CGSize)intrinsicContentSize
{
  _TtC9Reminders22TTRIStackedAvatarsView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1004AB52C();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[TTRIStackedAvatarsView layoutSubviews](&v3, "layoutSubviews");
  if (v2[OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_avatarsNeedUpdate] == 1)
  {
    v2[OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_avatarsNeedUpdate] = 0;
    sub_1004AB63C();
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC9Reminders22TTRIStackedAvatarsView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1004AB52C();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_contacts));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_avatarViewControllers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_avatarBorderViews));
}

@end
