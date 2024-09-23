@implementation SearchUIRFCardSectionRowModel

- (NSString)reuseIdentifier
{
  SearchUIRFCardSectionRowModel *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1DADE49E0();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1DAE0D530();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (SearchUIRFCardSectionRowModel)init
{
  uint64_t v3;
  id v4;
  SearchUIRFCardSectionRowModel *v5;
  objc_super v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4D46B0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DAE1E130;
  v4 = objc_allocWithZone(MEMORY[0x1E0D8C218]);
  v5 = self;
  *(_QWORD *)(v3 + 32) = objc_msgSend(v4, sel_init);
  v8 = v3;
  sub_1DAE0D5D8();
  sub_1DAE0D38C();
  swift_allocObject();
  *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR___SearchUIRFCardSectionRowModel__builderContext) = (Class)sub_1DAE0D380();

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for SearchUIRFCardSectionRowModel();
  return -[SearchUIRFCardSectionRowModel init](&v7, sel_init);
}

- (int)separatorStyle
{
  SearchUIRFCardSectionRowModel *v2;
  int v3;

  v2 = self;
  v3 = sub_1DADE4BE8();

  return v3;
}

- (BOOL)fillsBackgroundWithContent
{
  SearchUIRFCardSectionRowModel *v2;
  char v3;

  v2 = self;
  v3 = sub_1DADE4CD4();

  return v3 & 1;
}

- (BOOL)hasLeadingImage
{
  return sub_1DADE4DE4(self, (uint64_t)a2, MEMORY[0x1E0DA86B0]);
}

- (BOOL)prefersNoSeparatorAbove
{
  return sub_1DADE4DE4(self, (uint64_t)a2, MEMORY[0x1E0DA86D0]);
}

+ (BOOL)supportsConfigurationFor:(id)a3
{
  return sub_1DADE4E70((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void *))MEMORY[0x1E0DA86C8]);
}

+ (BOOL)shouldHideViewForCardSection:(id)a3
{
  return sub_1DADE4E70((uint64_t)a1, (uint64_t)a2, a3, MEMORY[0x1E0DA86C0]);
}

- (BOOL)supportsCustomHighlightBehavior
{
  SearchUIRFCardSectionRowModel *v2;
  uint64_t v3;
  __int128 v5[3];

  v2 = self;
  sub_1DADE4EC4(v5);
  v3 = LOBYTE(v5[0]);

  return v3 != 2;
}

- (NSDirectionalEdgeInsets)intrinsicContentInset
{
  SearchUIRFCardSectionRowModel *v2;
  double v3;
  double v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12[3];
  char v13[8];
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  NSDirectionalEdgeInsets result;

  v2 = self;
  sub_1DADE4EC4(v12);
  sub_1DADE55F0((uint64_t)v12, (uint64_t)v13);
  if (v13[0] == 2)
  {
    v3 = *MEMORY[0x1E0DC3298];
    v4 = *(double *)(MEMORY[0x1E0DC3298] + 8);
    v5 = (double *)(MEMORY[0x1E0DC3298] + 24);
    v6 = *(double *)(MEMORY[0x1E0DC3298] + 16);
  }
  else
  {
    v3 = v14;
    v4 = v15;
    v5 = (double *)&v17;
    v6 = v16;
  }
  v7 = *v5;

  v8 = v3;
  v9 = v4;
  v10 = v6;
  v11 = v7;
  result.trailing = v11;
  result.bottom = v10;
  result.leading = v9;
  result.top = v8;
  return result;
}

- (double)highlightReferenceFrameCornerRadius
{
  SearchUIRFCardSectionRowModel *v2;
  double result;
  __int128 v4[3];
  _BYTE v5[40];
  double v6;

  v2 = self;
  sub_1DADE4EC4(v4);

  sub_1DADE55F0((uint64_t)v4, (uint64_t)v5);
  result = v6;
  if (v5[0] == 2)
    return -1.0;
  return result;
}

- (SearchUIRFCardSectionRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  id v8;
  id v9;
  SearchUIRFCardSectionRowModel *result;

  v8 = a3;
  v9 = a4;
  result = (SearchUIRFCardSectionRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIRFCardSectionRowModel)initWithResult:(id)a3 itemIdentifier:(id)a4
{
  id v4;
  SearchUIRFCardSectionRowModel *result;

  v4 = a3;
  result = (SearchUIRFCardSectionRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIRFCardSectionRowModel)initWithResult:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6
{
  id v7;
  id v8;
  SearchUIRFCardSectionRowModel *result;

  v7 = a3;
  v8 = a4;
  result = (SearchUIRFCardSectionRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIRFCardSectionRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4
{
  SearchUIRFCardSectionRowModel *result;

  result = (SearchUIRFCardSectionRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIRFCardSectionRowModel)initWithCardSection:(id)a3 queryId:(unint64_t)a4 itemIdentifier:(id)a5
{
  id v5;
  SearchUIRFCardSectionRowModel *result;

  v5 = a3;
  result = (SearchUIRFCardSectionRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
