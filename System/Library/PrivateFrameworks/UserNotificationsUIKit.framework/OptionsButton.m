@implementation OptionsButton

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _BYTE *v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for OptionsButton();
  v8 = a3;
  v9 = a4;
  v10 = v13.receiver;
  swift_unknownObjectRetain();
  -[OptionsButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v13, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, v8, v9, a5);
  v11 = *(void (**)(uint64_t))&v10[OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onShowMenu];
  if (v11)
  {
    v12 = swift_retain();
    v11(v12);
    sub_1CFD40A14((uint64_t)v11);
  }
  v10[OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_isPresentingMenu] = 1;

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _BYTE *v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for OptionsButton();
  v8 = a3;
  v9 = a4;
  v10 = v13.receiver;
  swift_unknownObjectRetain();
  -[OptionsButton contextMenuInteraction:willEndForConfiguration:animator:](&v13, sel_contextMenuInteraction_willEndForConfiguration_animator_, v8, v9, a5);
  v11 = *(void (**)(uint64_t))&v10[OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onDismissMenu];
  if (v11)
  {
    v12 = swift_retain();
    v11(v12);
    sub_1CFD40A14((uint64_t)v11);
  }
  v10[OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_isPresentingMenu] = 0;

  swift_unknownObjectRelease();
}

- (_TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v7;
  _QWORD *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onShowMenu);
  *v7 = 0;
  v7[1] = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onDismissMenu);
  *v8 = 0;
  v8[1] = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_isPresentingMenu) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for OptionsButton();
  return -[OptionsButton initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onShowMenu);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onDismissMenu);
  *v5 = 0;
  v5[1] = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_isPresentingMenu) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for OptionsButton();
  return -[OptionsButton initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1CFD40A14(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onShowMenu));
  sub_1CFD40A14(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22UserNotificationsUIKitP33_31F77A0F2E2B97FF4D299720B6240BE113OptionsButton_onDismissMenu));
}

@end
