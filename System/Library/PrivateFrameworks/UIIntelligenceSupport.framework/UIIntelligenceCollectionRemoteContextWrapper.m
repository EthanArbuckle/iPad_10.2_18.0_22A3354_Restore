@implementation UIIntelligenceCollectionRemoteContextWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper *v5;

  v4 = a3;
  v5 = self;
  UIIntelligenceCollectionRemoteContextWrapper.encode(with:)((NSCoder)v4);

}

- (_TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper)initWithCoder:(id)a3
{
  return (_TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper *)UIIntelligenceCollectionRemoteContextWrapper.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  _TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper *v4;
  _TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_249676708();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = UIIntelligenceCollectionRemoteContextWrapper.isEqual(_:)((uint64_t)v8);

  sub_24963EB88((uint64_t)v8, &qword_25786B2D0);
  return v6 & 1;
}

- (_TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper)init
{
  _TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper *result;

  result = (_TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24963499C((uint64_t)self + OBJC_IVAR____TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper_remoteContext, type metadata accessor for IntelligenceFragment.RemoteContext);
}

@end
