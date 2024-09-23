@implementation SearchUIContentConfigurator

+ (BOOL)supportsConfigurationFor:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = objc_msgSend(v3, sel_cardSection);

  if (v4)
  {
    v5 = objc_msgSend(v3, sel_cardSection);
    if (!v5)
    {
      __break(1u);
      return (char)v5;
    }
    v6 = v5;
    v7 = objc_msgSend(v5, sel_supportsConfiguration);

    if ((v7 & 1) != 0)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      type metadata accessor for SearchUIArchivedRowModel();
      LOBYTE(v4) = swift_dynamicCastClass() != 0;
    }
  }

  LOBYTE(v5) = (_BYTE)v4;
  return (char)v5;
}

+ (void)applyConfigurationTo:(id)a3 rowModel:(id)a4 cardSections:(id)a5 interactionDelegate:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;

  sub_1DADF5F84(0, (unint64_t *)&qword_1ED4D4610);
  v8 = sub_1DAE0D5CC();
  v9 = a3;
  v10 = a4;
  swift_unknownObjectRetain();
  sub_1DAE00F88(v9, v10, v8);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)hostedSnippetUIViewFor:(id)a3 rowModel:(id)a4 interactionDelegate:(id)a5
{
  return 0;
}

+ (id)hostedSnippetUIViewFor:(id)a3 rowModel:(id)a4 cardSections:(id)a5 interactionDelegate:(id)a6
{
  return 0;
}

+ (void)applyConfigurationTo:(id)a3 rowModel:(id)a4 interactionDelegate:(id)a5
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  sub_1DAE015CC(v7, v8, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (SearchUIContentConfigurator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchUIContentConfigurator();
  return -[SearchUIContentConfigurator init](&v3, sel_init);
}

@end
