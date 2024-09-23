@implementation ToolbarStyleButtonBase

- (_TtC5Books22ToolbarStyleButtonBase)initWithFrame:(CGRect)a3
{
  return (_TtC5Books22ToolbarStyleButtonBase *)sub_10039E67C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Books22ToolbarStyleButtonBase)initWithCoder:(id)a3
{
  id v4;
  _TtC5Books22ToolbarStyleButtonBase *result;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books22ToolbarStyleButtonBase_isHovering) = 0;
  v4 = a3;

  result = (_TtC5Books22ToolbarStyleButtonBase *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/ToolbarStyleButton.swift", 30, 2, 25, 0);
  __break(1u);
  return result;
}

- (void)didHover:(id)a3
{
  id v4;
  char *v5;
  _TtC5Books22ToolbarStyleButtonBase *v6;

  v4 = a3;
  v6 = self;
  v5 = (char *)objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 1) <= 3)
    (*(void (**)(_QWORD))((swift_isaMask & (uint64_t)v6->super.super.super.super.super.isa) + 0x80))((3u >> (((_BYTE)v5 - 1) & 0xF)) & 1);

}

- (BOOL)isAccessibilityElement
{
  return -[ToolbarStyleButtonBase isHidden](self, "isHidden") ^ 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books22ToolbarStyleButtonBase_hoverRecognizer));
}

@end
