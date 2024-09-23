@implementation RecentDialog

+ (BOOL)supportsSecureCoding
{
  return static RecentDialog.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static RecentDialog.supportsSecureCoding.setter(a3);
}

- (_TtC11SiriKitFlow12RecentDialog)initWithCoder:(id)a3
{
  return (_TtC11SiriKitFlow12RecentDialog *)RecentDialog.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11SiriKitFlow12RecentDialog *v5;

  v4 = a3;
  v5 = self;
  RecentDialog.encode(with:)((NSCoder)v4);

}

- (_TtC11SiriKitFlow12RecentDialog)init
{
  RecentDialog.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11SiriKitFlow12RecentDialog_expiresAt;
  v4 = OUTLINED_FUNCTION_1_86();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end
