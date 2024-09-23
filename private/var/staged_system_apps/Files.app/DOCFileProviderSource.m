@implementation DOCFileProviderSource

- (unint64_t)status
{
  int v2;

  v2 = self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_isProviderDomainEnabled];
  if (v2 == 2)
    return 2;
  else
    return (v2 & 1) == 0;
}

- (BOOL)isiCloudBased
{
  void *v2;

  v2 = *(void **)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_providerDomain];
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "isiCloudDriveProvider");
  return (char)v2;
}

- (_TtC5Files16DOCActionManager)actionManager
{
  _TtC5Files21DOCFileProviderSource *v2;
  id v3;

  v2 = self;
  v3 = sub_10005B700();

  return (_TtC5Files16DOCActionManager *)v3;
}

- (BOOL)isValidForConfiguration:(id)a3
{
  id v4;
  _TtC5Files21DOCFileProviderSource *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = DOCFileProviderSource.isValid(for:)(v4);

  return self & 1;
}

- (BOOL)isAvailableSystemWide
{
  void *v2;

  if ((self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource_type] & 1) != 0)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = *(void **)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_providerDomain];
    if (v2)
      LOBYTE(v2) = objc_msgSend(v2, "isAvailableSystemWide");
    else
      __break(1u);
  }
  return (char)v2;
}

+ (id)createSpotlightSources
{
  uint64_t v2;
  uint64_t v3;
  Class isa;

  sub_100032268();
  v3 = v2;
  type metadata accessor for DOCFileProviderSource();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (NSString)providerName
{
  return (NSString *)sub_10003C32C(self, (uint64_t)a2, (void (*)(void))_s5Files21DOCFileProviderSourceC12providerNameSSvg_0);
}

- (NSString)displayName
{
  return (NSString *)sub_10003C32C(self, (uint64_t)a2, (void (*)(void))_s5Files21DOCFileProviderSourceC11displayNameSSvg_0);
}

+ (id)createSourceFrom:(id)a3 with:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  char *v9;
  uint64_t v10;
  void (**v11)(void *, uint64_t, void *);
  uint64_t v12;
  uint64_t v13;
  id v14;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v7 = v6;
  v8 = a3;
  v9 = sub_1002ADAD4(v8, v5, v7);
  v10 = swift_allocObject(&unk_1005D8ED0, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = (void (**)(void *, uint64_t, void *))&v9[OBJC_IVAR____TtC5Files21DOCFileProviderSource_dropAction];
  v12 = *(_QWORD *)&v9[OBJC_IVAR____TtC5Files21DOCFileProviderSource_dropAction];
  v13 = *(_QWORD *)&v9[OBJC_IVAR____TtC5Files21DOCFileProviderSource_dropAction + 8];
  *v11 = sub_1002ADD44;
  v11[1] = (void (*)(void *, uint64_t, void *))v10;
  v14 = v8;
  sub_100087534(v12, v13);

  swift_bridgeObjectRelease(v7);
  return v9;
}

- (FPProviderDomain)providerDomain
{
  return (FPProviderDomain *)*(id *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_providerDomain];
}

- (void)setActionManager:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage___actionManager];
  *(_QWORD *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage___actionManager] = a3;
  v3 = a3;

}

- (void)setDisplayName:(id)a3
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000038, 0x8000000100521EB0, "Files/DOCFileProviderSource.swift", 33, 2, 156, 0);
  __break(1u);
}

- (void)setProviderName:(id)a3
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000039, 0x8000000100521EF0, "Files/DOCFileProviderSource.swift", 33, 2, 174, 0);
  __break(1u);
}

- (NSString)domainName
{
  _TtC5Files21DOCFileProviderSource *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  _s5Files21DOCFileProviderSourceC10domainNameSSSgvg_0();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setDomainName:(id)a3
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000037, 0x8000000100521F30, "Files/DOCFileProviderSource.swift", 33, 2, 192, 0);
  __break(1u);
}

- (id)loadIconForSize:(int64_t)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_providerDomain];
  if (v3)
    v4 = objc_msgSend((id)objc_opt_self(DOCDocumentSource), "iconForFileProvider:size:", v3, a3);
  else
    v4 = 0;
  return v4;
}

- (BOOL)isEjectable
{
  return self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_isEjectable];
}

- (void)setIsEjectable:(BOOL)a3
{
  self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_isEjectable] = a3;
}

- (BOOL)isSpotlightBacked
{
  return self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource_type];
}

- (NSArray)supportedSearchFilters
{
  void *v2;
  _TtC5Files21DOCFileProviderSource *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray v8;

  v2 = *(void **)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_providerDomain];
  if (!v2)
    goto LABEL_5;
  v3 = self;
  v4 = objc_msgSend(v2, "supportedSearchFilters");
  if (!v4)
  {

LABEL_5:
    v8.super.isa = 0;
    return (NSArray *)v8.super.isa;
  }
  v5 = v4;
  type metadata accessor for NSFileProviderSearchFilter(0);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return (NSArray *)v8.super.isa;
}

- (BOOL)appearsInMoveUI
{
  return (self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource_type] & 1) == 0
      && (-[DOCFileProviderSource status](self, "status") & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (NSString)description
{
  _TtC5Files21DOCFileProviderSource *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  DOCFileProviderSource.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC5Files21DOCFileProviderSource *v5;
  uint64_t v6;
  _TtC5Files21DOCFileProviderSource *v7;
  char v8;
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
  v8 = DOCFileProviderSource.isEqual(_:)((uint64_t)v10);

  sub_10000CB4C((uint64_t)v10, &qword_100642730);
  return v8 & 1;
}

- (_TtC5Files21DOCFileProviderSource)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002ADBD8();
}

- (_TtC5Files21DOCFileProviderSource)init
{
  _TtC5Files21DOCFileProviderSource *result;

  result = (_TtC5Files21DOCFileProviderSource *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCFileProviderSource", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_100087534(*(_QWORD *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_dropAction], *(_QWORD *)&self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource_dropAction]);
  sub_10008A644(*(_QWORD *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage___containingApplicationIdentifier], *(_QWORD *)&self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage___containingApplicationIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage____displayName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage____providerName]);
  sub_10008A644(*(_QWORD *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage____domainName], *(_QWORD *)&self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage____domainName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_sortingModes]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_availableDisplayModes]);

}

- (BOOL)iconPreferingSymbolImagesRequiresHierarchicalColors
{
  _TtC5Files21DOCFileProviderSource *v2;
  char v3;

  v2 = self;
  v3 = sub_100467828();

  return v3 & 1;
}

- (UIImage)iconPreferingSymbolImages
{
  _TtC5Files21DOCFileProviderSource *v2;
  id v3;

  v2 = self;
  v3 = sub_100467988();

  return (UIImage *)v3;
}

@end
