@implementation DOCSafeAreaView

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_safeAreaView));
}

- (void)dealloc
{
  _TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView *v2;
  uint64_t v3;

  v2 = self;
  sub_1002810D0((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_safeAreaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_safeBottomConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_keyboardObservations));
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_safeBottomConstraint) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_keyboardFrame;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_keyboardObservations) = (Class)_swiftEmptyArrayStorage;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_visibilityState) = 0;
  v5 = a3;

  result = (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCFilenameViewController.swift", 37, 2, 152, 0);
  __break(1u);
  return result;
}

- (void)handleKeyboardNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100280FA8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)safeAreaInsetsDidChange
{
  sub_100284428(self, (uint64_t)a2, (const char **)&selRef_safeAreaInsetsDidChange, (void (*)(id))sub_100281610);
}

- (void)layoutSubviews
{
  sub_100284428(self, (uint64_t)a2, (const char **)&selRef_layoutSubviews, (void (*)(id))sub_100281610);
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView)initWithEffect:(id)a3
{
  sub_100283014((uint64_t)self, (uint64_t)a2, a3, (uint64_t)"Files.DOCSafeAreaView", 21, (uint64_t)"init(effect:)", 13);
}

@end
