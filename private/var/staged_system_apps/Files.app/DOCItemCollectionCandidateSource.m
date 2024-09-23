@implementation DOCItemCollectionCandidateSource

- (void)dealloc
{
  void *v3;
  _TtC5Files32DOCItemCollectionCandidateSource *v4;
  id v5;
  objc_super v6;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_nodeCollection);
  v4 = self;
  if (v3)
  {
    v5 = v3;
    sub_1001626AC();

  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemCollectionCandidateSource(0);
  -[DOCItemCollectionCandidateSource dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_itemCollectionConfiguration);
  v4 = *(void **)&self->itemCollectionConfiguration[OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_itemCollectionConfiguration
                                                  + 16];
  v5 = *(_QWORD *)&self->itemCollectionConfiguration[OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_itemCollectionConfiguration
                                                   + 40];
  v6 = *(void **)&self->itemCollectionConfiguration[OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_itemCollectionConfiguration
                                                  + 48];
  v7 = *(_QWORD *)&self->itemCollectionConfiguration[OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_itemCollectionConfiguration
                                                   + 56];
  v8 = *(void **)&self->itemCollectionConfiguration[OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_itemCollectionConfiguration
                                                  + 64];

  swift_bridgeObjectRelease(v5);
  swift_unknownObjectRelease(v7);

  sub_100087534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_updateHandler), *(_QWORD *)&self->itemCollectionConfiguration[OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_updateHandler]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->itemCollectionConfiguration[OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_prefix]);
  v9 = (char *)self + OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_requestID;
  v10 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_sortingDescriptor;
  v12 = *(_QWORD *)&self->itemCollectionConfiguration[OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_sortingDescriptor];
  swift_bridgeObjectRelease(*((_QWORD *)v11 + 2));
  swift_bridgeObjectRelease(v12);
}

- (_TtC5Files32DOCItemCollectionCandidateSource)init
{
  _TtC5Files32DOCItemCollectionCandidateSource *result;

  result = (_TtC5Files32DOCItemCollectionCandidateSource *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCItemCollectionCandidateSource", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
