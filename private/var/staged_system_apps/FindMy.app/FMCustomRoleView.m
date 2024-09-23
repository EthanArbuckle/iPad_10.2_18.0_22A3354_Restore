@implementation FMCustomRoleView

- (_TtC6FindMy16FMCustomRoleView)init
{
  return (_TtC6FindMy16FMCustomRoleView *)sub_100288BA0();
}

- (_TtC6FindMy16FMCustomRoleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10028B484();
}

- (void)customizeEmoji
{
  _TtC6FindMy16FMCustomRoleView *v2;

  v2 = self;
  sub_10028A49C();

}

- (void)clearTextView
{
  _TtC6FindMy16FMCustomRoleView *v2;

  v2 = self;
  sub_10028A5B4();

}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC6FindMy16FMCustomRoleView *v5;

  v4 = a3;
  v5 = self;
  sub_10028A6E0(v4);

}

- (void)textViewDidBeginEditing:(id)a3
{
  uint64_t v5;
  _TtC6FindMy16FMCustomRoleView *v6;
  _TtC6FindMy16FMCustomRoleView *v7;
  _TtC6FindMy16FMCustomRoleView *v8;

  sub_100006C5C(0, (unint64_t *)&qword_1005D7A60, NSObject_ptr);
  v5 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy16FMCustomRoleView_emojiInput);
  v6 = (_TtC6FindMy16FMCustomRoleView *)a3;
  v8 = self;
  if ((static NSObject.== infix(_:_:)(v6, v5) & 1) != 0)
  {
    v7 = (_TtC6FindMy16FMCustomRoleView *)objc_msgSend(*(id *)((char *)&v8->super.super.super.isa+ OBJC_IVAR____TtC6FindMy16FMCustomRoleView_emojiBackground), "layer");
    -[FMCustomRoleView setBorderWidth:](v7, "setBorderWidth:", 3.0);

    v6 = v8;
    v8 = v7;
  }

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  _TtC6FindMy16FMCustomRoleView *v5;

  v4 = a3;
  v5 = self;
  sub_10028ABB0(v4);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC6FindMy16FMCustomRoleView *v12;
  uint64_t v13;

  length = a4.length;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  v11 = a3;
  v12 = self;
  LOBYTE(length) = sub_10028AE24(v11, v13, length, v8, v10);

  swift_bridgeObjectRelease(v10);
  return length & 1;
}

- (_TtC6FindMy16FMCustomRoleView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy16FMCustomRoleView *result;

  result = (_TtC6FindMy16FMCustomRoleView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMCustomRoleView", 23, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy16FMCustomRoleView_delegate);

  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC6FindMy16FMCustomRoleView__roleName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC6FindMy16FMCustomRoleView__emoji]);
}

@end
