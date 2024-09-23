@implementation SearchUIArchivedRowModel

- (SearchUIArchivedRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  _BOOL4 v8;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v8 = a5;
  if (a7)
  {
    v11 = sub_1DAE0D53C();
    v13 = v12;
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v14 = a3;
  v15 = a4;
  return (SearchUIArchivedRowModel *)sub_1DADDB38C(a3, a4, v8, a6, v11, v13);
}

- (BOOL)hasView
{
  char *v2;
  _BYTE v4[24];
  uint64_t v5;

  v2 = (char *)self + OBJC_IVAR___SearchUIArchivedRowModel_swiftUIView;
  swift_beginAccess();
  sub_1DADDC45C((uint64_t)v2, (uint64_t)v4);
  LOBYTE(v2) = v5 != 0;
  sub_1DADDCC3C((uint64_t)v4, &qword_1F029B6B8);
  return (char)v2;
}

- (SFColor)backgroundColor
{
  return (SFColor *)0;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)(id)sub_1DAE0D530();
}

- (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1DAE0D530();
}

- (SearchUIArchivedRowModel)initWithResult:(id)a3 itemIdentifier:(id)a4
{
  id v4;
  SearchUIArchivedRowModel *result;

  v4 = a3;
  result = (SearchUIArchivedRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIArchivedRowModel)initWithResult:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6
{
  id v7;
  id v8;
  SearchUIArchivedRowModel *result;

  v7 = a3;
  v8 = a4;
  result = (SearchUIArchivedRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIArchivedRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4
{
  SearchUIArchivedRowModel *result;

  result = (SearchUIArchivedRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIArchivedRowModel)initWithCardSection:(id)a3 queryId:(unint64_t)a4 itemIdentifier:(id)a5
{
  id v5;
  SearchUIArchivedRowModel *result;

  v5 = a3;
  result = (SearchUIArchivedRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIArchivedRowModel)init
{
  SearchUIArchivedRowModel *result;

  result = (SearchUIArchivedRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DADDCC3C((uint64_t)self + OBJC_IVAR___SearchUIArchivedRowModel_swiftUIView, &qword_1F029B6B8);
}

@end
