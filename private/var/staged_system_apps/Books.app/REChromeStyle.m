@implementation REChromeStyle

- (REChromeStyle)init
{
  return (REChromeStyle *)ChromeStyle.init()();
}

- (double)menuBottomInset
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t KeyPath;
  uint64_t v11;
  REChromeStyle *v12;
  void (*v13)(char *, uint64_t);
  double result;
  uint64_t v15;

  v3 = type metadata accessor for UserInterfaceSizeClass(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v15 - v8;
  KeyPath = swift_getKeyPath(&unk_1007215C8);
  v11 = swift_getKeyPath(&unk_1007215F0);
  v12 = self;
  static Published.subscript.getter(v9, v12, KeyPath, v11);
  swift_release(KeyPath);
  swift_release(v11);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, enum case for UserInterfaceSizeClass.compact(_:), v3);
  LOBYTE(KeyPath) = static UserInterfaceSizeClass.== infix(_:_:)(v9, v7);
  v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v7, v3);
  v13(v9, v3);

  result = 20.0;
  if ((KeyPath & 1) != 0)
    return 17.0;
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___REChromeStyle__colorScheme;
  v4 = sub_10004CFD4(&qword_1009E0ED0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___REChromeStyle__verticalSizeClass;
  v6 = sub_10004CFD4(&qword_1009E0EC8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR___REChromeStyle__statusBarHeight;
  v8 = sub_10004CFD4(&qword_1009E0EC0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR___REChromeStyle__pageBackgroundColor;
  v10 = sub_10004CFD4(&qword_1009E0EB8);
  v11 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR___REChromeStyle__pageTextColor, v10);
  v11((char *)self + OBJC_IVAR___REChromeStyle__themeSeparatorColor, v10);
  v11((char *)self + OBJC_IVAR___REChromeStyle__themeSecondaryLabel, v10);
  v11((char *)self + OBJC_IVAR___REChromeStyle__secondaryButtonLabelColor, v10);
  v11((char *)self + OBJC_IVAR___REChromeStyle__secondaryButtonFillColor, v10);
  v12 = (char *)self + OBJC_IVAR___REChromeStyle__buttonStyle;
  v13 = sub_10004CFD4(&qword_1009E0EB0);
  v14 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8);
  v14(v12, v13);
  v14((char *)self + OBJC_IVAR___REChromeStyle__buttonDisabledStyle, v13);
  v14((char *)self + OBJC_IVAR___REChromeStyle__secondaryButtonStyle, v13);
  v15 = (char *)self + OBJC_IVAR___REChromeStyle__downloadProgressStyle;
  v16 = sub_10004CFD4(&qword_1009E0EA8);
  v17 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8);
  v17(v15, v16);
  v17((char *)self + OBJC_IVAR___REChromeStyle__downloadSpinnerStyle, v16);
  v18 = (char *)self + OBJC_IVAR___REChromeStyle__isLeftMenu;
  v19 = sub_10004CFD4((uint64_t *)&unk_1009D4E70);
  v20 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8);
  v20(v18, v19);
  v20((char *)self + OBJC_IVAR___REChromeStyle__isDarkTheme, v19);
  v20((char *)self + OBJC_IVAR___REChromeStyle__themeHasDarkBackground, v19);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___REChromeStyle_controlFont));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___REChromeStyle_controlSubtitleFont));
}

@end
