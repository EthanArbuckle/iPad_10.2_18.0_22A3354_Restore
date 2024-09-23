@implementation FMCopyableLabel

- (_TtC6FindMy15FMCopyableLabel)initWithFrame:(CGRect)a3
{
  return (_TtC6FindMy15FMCopyableLabel *)sub_10016C1FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6FindMy15FMCopyableLabel)initWithCoder:(id)a3
{
  return (_TtC6FindMy15FMCopyableLabel *)sub_10016C33C(a3);
}

- (void)showMenuWithSender:(id)a3
{
  _TtC6FindMy15FMCopyableLabel *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10016C6A0();
  swift_unknownObjectRelease(a3);

}

- (void)copy:(id)a3
{
  _TtC6FindMy15FMCopyableLabel *v5;
  uint64_t v6;
  _TtC6FindMy15FMCopyableLabel *v7;
  id v8;
  id v9;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = objc_msgSend((id)objc_opt_self(UIPasteboard), "generalPasteboard");
  v9 = -[FMCopyableLabel text](self, "text");
  objc_msgSend(v8, "setString:", v9);

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC6FindMy15FMCopyableLabel_menuController), "hideMenuFromView:", self);
  sub_10005D03C((uint64_t)v10);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC6FindMy15FMCopyableLabel *v7;
  uint64_t v8;
  _TtC6FindMy15FMCopyableLabel *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = static Selector.== infix(_:_:)(a3, "copy:");

  sub_10005D03C((uint64_t)v12);
  return v10 & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy15FMCopyableLabel_menuController));
}

@end
