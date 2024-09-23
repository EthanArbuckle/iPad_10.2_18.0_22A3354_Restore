@implementation Library.ContextMenuButton.Button.UIContextButton

- (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton)init
{
  return (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton *)sub_10061E8DC();
}

- (void)layoutSubviews
{
  _TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton *v2;

  v2 = self;
  sub_10061EF4C();

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1006218E8();

  return v7;
}

- (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton)initWithCoder:(id)a3
{
  _QWORD *v4;
  char *v5;
  id v6;
  _TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton_menuProvider);
  *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self
     + OBJC_IVAR____TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton_preferredVisualSize;
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = a3;

  result = (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/BilbyLibraryCells.swift", 29, 2, 711, 0);
  __break(1u);
  return result;
}

- (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton)initWithFrame:(CGRect)a3
{
  _TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton *result;

  result = (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton *)_swift_stdlib_reportUnimplementedInitializer("Music.UIContextButton", 21, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton_menuProvider), *(_QWORD *)&self->menuProvider[OBJC_IVAR____TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton_menuProvider]);
}

@end
