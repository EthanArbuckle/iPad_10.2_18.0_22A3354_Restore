@implementation BKRootBarItem

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR___BKRootBarItem_identifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR___BKRootBarItem_url]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR___BKRootBarItem_iconNameOverride]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR___BKRootBarItem_selectedIconNameOverride]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR___BKRootBarItem_titleOverride]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR___BKRootBarItem_countryCode]);
}

- (NSString)description
{
  return (NSString *)sub_1000455D8(self, (uint64_t)a2, (void (*)(void))RootBarItem.description.getter);
}

- (id)toTabBarItem
{
  BKRootBarItem *v2;
  char *v3;

  v2 = self;
  v3 = RootBarItem.toTabBarItem()();

  return v3;
}

- (NSString)identifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->identifier[OBJC_IVAR___BKRootBarItem_identifier];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (NSString)suggestedTrackerName
{
  BKRootBarItem *v2;
  unint64_t v3;
  NSString v4;

  v2 = self;
  if (-[BKRootBarItem isLibraryCollection](v2, "isLibraryCollection"))
  {
    v3 = 0xE700000000000000;
  }
  else
  {
    v3 = *(_QWORD *)&v2->identifier[OBJC_IVAR___BKRootBarItem_identifier];
    swift_bridgeObjectRetain(v3);
  }

  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (BOOL)isLibraryCollection
{
  uint64_t v2;
  void *v3;
  BKRootBarItem *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarItem_identifier);
  v3 = *(void **)&self->identifier[OBJC_IVAR___BKRootBarItem_identifier];
  v4 = self;
  LOBYTE(v2) = _s5Books20RootBarItemsProviderC19isLibraryCollection3forSbSS_tFZ_0(v2, v3);

  return v2 & 1;
}

- (NSString)automationID
{
  void *v2;
  uint64_t v3;
  BKRootBarItem *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  Swift::String v12;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarItem_identifier);
  v2 = *(void **)&self->identifier[OBJC_IVAR___BKRootBarItem_identifier];
  v4 = self;
  swift_bridgeObjectRetain(v2);
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v2);
  v6 = v5;
  swift_bridgeObjectRelease(v5);
  if (v6)
  {
    swift_bridgeObjectRelease(v2);
    v7 = 14;
  }
  else
  {
    v12._countAndFlagsBits = v3;
    v12._object = v2;
    v7 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v12);
    if (v7 == 16)
      v7 = 15;
  }
  sub_100048A4C(v7);
  v9 = v8;

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  BKRootBarItem *v5;
  uint64_t v6;
  BKRootBarItem *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = RootBarItem.isEqual(_:)((uint64_t)v10);

  sub_10004A7B8((uint64_t)v10);
  return v8 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)requiresURL
{
  void *v2;
  uint64_t v3;
  BKRootBarItem *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  char v9;
  char v10;
  Swift::String v12;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarItem_identifier);
  v2 = *(void **)&self->identifier[OBJC_IVAR___BKRootBarItem_identifier];
  v4 = self;
  swift_bridgeObjectRetain(v2);
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v2);
  v6 = v5;
  swift_bridgeObjectRelease(v5);
  if (v6)
  {
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v12._countAndFlagsBits = v3;
    v12._object = v2;
    v7 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v12);
    if (v7 > 0x10u || ((1 << v7) & 0x1E01F) == 0)
    {

      v10 = 0;
      return v10 & 1;
    }
  }
  v9 = *((_BYTE *)&v4->super.isa + OBJC_IVAR___BKRootBarItem_isPlaceholder);

  v10 = v9 ^ 1;
  return v10 & 1;
}

- (BKRootBarItem)initWithCoder:(id)a3
{
  return (BKRootBarItem *)RootBarItem.init(coder:)(a3);
}

- (BKRootBarItem)initWithIdentifier:(id)a3 isPlaceholder:(BOOL)a4 url:(id)a5 titleOverride:(id)a6 iconNameOverride:(id)a7 selectedIconNameOverride:(id)a8 countryCode:(id)a9 editNameOnSelect:(BOOL)a10
{
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v34 = v15;
  v35 = v14;
  if (a5)
  {
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v32 = v17;
    v33 = v16;
    if (a6)
      goto LABEL_3;
  }
  else
  {
    v32 = 0;
    v33 = 0;
    if (a6)
    {
LABEL_3:
      v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
      v20 = v19;
      v21 = a9;
      if (a7)
        goto LABEL_4;
LABEL_8:
      v22 = 0;
      if (a8)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  v18 = 0;
  v20 = 0;
  v21 = a9;
  if (!a7)
    goto LABEL_8;
LABEL_4:
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  a7 = v23;
  if (a8)
  {
LABEL_5:
    a8 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
    v25 = v24;
    goto LABEL_10;
  }
LABEL_9:
  v25 = 0;
LABEL_10:
  v26 = v21;
  if (v26)
  {
    v27 = v26;
    v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    v30 = v29;

  }
  else
  {
    v28 = 0;
    v30 = 0;
  }
  return (BKRootBarItem *)RootBarItem.init(identifier:isPlaceholder:url:titleOverride:iconNameOverride:selectedIconNameOverride:countryCode:editNameOnSelect:)(v35, v34, a4, v33, v32, v18, v20, v22, (uint64_t)a7, (uint64_t)a8, v25, v28, v30, a10);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  BKRootBarItem *v5;

  v4 = a3;
  v5 = self;
  RootBarItem.encode(with:)((NSCoder)v4);

}

- (NSString)url
{
  return (NSString *)sub_1001FE0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKRootBarItem_url);
}

- (NSString)tabBarTitle
{
  return (NSString *)sub_1000455D8(self, (uint64_t)a2, (void (*)(void))RootBarItem.tabBarTitle.getter);
}

- (BOOL)isPlaceholder
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BKRootBarItem_isPlaceholder);
}

- (NSString)iconNameOverride
{
  return (NSString *)sub_1001FE0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKRootBarItem_iconNameOverride);
}

- (NSString)selectedIconNameOverride
{
  return (NSString *)sub_1001FE0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKRootBarItem_selectedIconNameOverride);
}

- (NSString)titleOverride
{
  return (NSString *)sub_1001FE0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKRootBarItem_titleOverride);
}

- (NSString)countryCode
{
  return (NSString *)sub_1001FE0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKRootBarItem_countryCode);
}

- (BOOL)editNameOnSelect
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BKRootBarItem_editNameOnSelect);
}

- (BKRootBarItem)init
{
  BKRootBarItem *result;

  result = (BKRootBarItem *)_swift_stdlib_reportUnimplementedInitializer("Books.RootBarItem", 17, "init()", 6, 0);
  __break(1u);
  return result;
}

- (BOOL)isSearch
{
  BKRootBarItem *v2;
  char v3;

  v2 = self;
  v3 = RootBarItem.isSearch.getter();

  return v3 & 1;
}

- (BOOL)isStoreOnly
{
  return sub_100505B80((char *)self, (uint64_t)a2, (uint64_t (*)(uint64_t, __n128))sub_100415C94);
}

- (BOOL)isDefaultCollection
{
  void *v2;
  uint64_t v3;
  BKRootBarItem *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  Swift::String v9;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarItem_identifier);
  v2 = *(void **)&self->identifier[OBJC_IVAR___BKRootBarItem_identifier];
  v4 = self;
  swift_bridgeObjectRetain(v2);
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v2);
  v6 = v5;
  swift_bridgeObjectRelease(v5);
  if (v6)
  {
    swift_bridgeObjectRelease(v2);
    LOBYTE(v2) = 0;
  }
  else
  {
    v9._countAndFlagsBits = v3;
    v9._object = v2;
    v7 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v9);
    if (v7 > 0x10u)
      LOBYTE(v2) = 1;
    else
      LODWORD(v2) = (0x1FE0u >> v7) & 1;
  }

  return (char)v2;
}

- (BOOL)isCustomCollection
{
  BKRootBarItem *v2;
  char v3;

  v2 = self;
  v3 = RootBarItem.isCustomCollection.getter();

  return v3 & 1;
}

- (BOOL)isStandardItem
{
  return sub_100505B80((char *)self, (uint64_t)a2, (uint64_t (*)(uint64_t, __n128))sub_100415E40);
}

- (id)toTabBarElement
{
  BKRootBarItem *v2;
  char *v3;

  v2 = self;
  v3 = RootBarItem.toTabBarElement()();

  return v3;
}

- (NSString)sidebarTitle
{
  return (NSString *)sub_1000455D8(self, (uint64_t)a2, (void (*)(void))RootBarItem.sidebarTitle.getter);
}

@end
