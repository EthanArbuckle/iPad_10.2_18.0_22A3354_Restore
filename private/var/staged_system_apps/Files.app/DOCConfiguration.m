@implementation DOCConfiguration

- (void)updateStateAndSceneIdentifiersWithWindow:(id)a3
{
  id v5;
  DOCConfiguration *v6;

  v5 = a3;
  v6 = self;
  sub_10000D28C(a3);

}

- (BOOL)allowsDisplaying:(id)a3
{
  id v4;
  DOCConfiguration *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100087074(v4);

  return self & 1;
}

- (void)configureContextForDisplayingTab:(unint64_t)a3
{
  if (a3 > 2)
    __break(1u);
  else
    -[DOCConfiguration setDefaultEffectiveTabIdentifierForLocationRestore:](self, "setDefaultEffectiveTabIdentifierForLocationRestore:", *(_QWORD *)*(&off_1005CAA68 + a3));
}

- (BOOL)canPresentContentForTab:(unint64_t)a3
{
  DOCConfiguration *v4;
  BOOL v5;
  BOOL result;
  uint64_t v7;
  unint64_t v8;

  v4 = self;
  if (!-[DOCConfiguration forSavingDocuments](v4, "forSavingDocuments"))
  {
    v5 = 1;
    goto LABEL_5;
  }
  if (a3 < 3)
  {
    v5 = (a3 & 7) == 2;
LABEL_5:

    return v5;
  }
  type metadata accessor for DOCTab(0);
  v8 = a3;
  result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(v7, &v8, v7, &type metadata for UInt);
  __break(1u);
  return result;
}

- (_TtP5Files31DOCSourceListInterfaceProviding_)sourceListUI
{
  uint64_t v3;
  DOCConfiguration *v4;
  void *inited;

  v3 = type metadata accessor for DOCSourceListInterface_Default();
  v4 = self;
  inited = (void *)swift_initStaticObject(v3, &unk_100641248);

  return (_TtP5Files31DOCSourceListInterfaceProviding_ *)inited;
}

@end
