@implementation SearchUIRFCardSectionRowModelProvider

- (SearchUIRFCardSectionRowModelProvider)initWithCardSections:(id)a3
{
  SearchUIRFCardSectionRowModelProvider *v4;
  objc_super v6;

  if (a3)
  {
    sub_1DADE5574();
    sub_1DAE0D5CC();
  }
  sub_1DAE0D38C();
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___SearchUIRFCardSectionRowModelProvider_builderContext) = (Class)sub_1DAE0D380();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SearchUIRFCardSectionRowModelProvider();
  return -[SearchUIRFCardSectionRowModelProvider init](&v6, sel_init);
}

- (id)rowModelFor:(id)a3 result:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];

  sub_1DAE0D53C();
  v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SearchUIRFCardSectionRowModelProvider_builderContext);
  v18[3] = sub_1DAE0D38C();
  v18[0] = v12;
  objc_allocWithZone((Class)type metadata accessor for SearchUIRFCardSectionRowModel());
  v13 = a3;
  v14 = a4;
  sub_1DAE0C564();
  sub_1DADE5450((uint64_t)v18, v14, v13, a5, a6);
  v16 = v15;

  return v16;
}

- (SearchUIRFCardSectionRowModelProvider)init
{
  SearchUIRFCardSectionRowModelProvider *result;

  result = (SearchUIRFCardSectionRowModelProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
