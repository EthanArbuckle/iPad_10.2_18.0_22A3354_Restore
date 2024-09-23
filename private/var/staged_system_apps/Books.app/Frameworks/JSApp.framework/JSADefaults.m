@implementation JSADefaults

+ (BOOL)showDebugMenu
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;
  _BOOL8 v9;

  v2 = sub_29EF0(&qword_B8438);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_B80C8 != -1)
    swift_once(&qword_B80C8, sub_446A0);
  v6 = sub_2D6E0(v2, (uint64_t)qword_B89B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  UserDefault.wrappedValue.getter(&v9, v2);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v9;
}

+ (void)setShowDebugMenu:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  v4 = sub_29EF0(&qword_B8438);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_B80C8 != -1)
    swift_once(&qword_B80C8, sub_446A0);
  v8 = sub_2D6E0(v4, (uint64_t)qword_B89B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v10 = a3;
  UserDefault.wrappedValue.setter(&v10, v4);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (JSADefaults)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Defaults();
  return -[JSADefaults init](&v3, "init");
}

@end
