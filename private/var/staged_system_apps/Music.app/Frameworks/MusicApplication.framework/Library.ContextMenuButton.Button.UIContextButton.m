@implementation Library.ContextMenuButton.Button.UIContextButton

- (_TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton)init
{
  return (_TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton *)sub_7EEF7C();
}

- (void)layoutSubviews
{
  _TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton *v2;

  v2 = self;
  sub_7EF5EC();

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_7F1CC8();

  return v7;
}

- (_TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton)initWithCoder:(id)a3
{
  _QWORD *v4;
  char *v5;
  id v6;
  _TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton_menuProvider);
  *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self
     + OBJC_IVAR____TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton_preferredVisualSize;
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = a3;

  result = (_TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/BilbyLibraryCells.swift", 40, 2, 711, 0);
  __break(1u);
  return result;
}

- (_TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton)initWithFrame:(CGRect)a3
{
  _TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton *result;

  result = (_TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.UIContextButton", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton_menuProvider), *(_QWORD *)&self->menuProvider[OBJC_IVAR____TtCVVE16MusicApplicationO9MusicCore7Library17ContextMenuButtonP33_B9534EE1F3193BAE9A3CAB7B10DD9C356Button15UIContextButton_menuProvider]);
}

@end
