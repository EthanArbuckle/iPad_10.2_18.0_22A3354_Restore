@implementation SocialProfileCollectionViewTableLayout

- (id)contextualActionForDeletingRowAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout *v10;
  id v11;
  uint64_t v13;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = a3;
  v10 = self;
  v11 = sub_42B530((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
}

- (_TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout)init
{
  unsigned __int8 *v3;
  objc_super v5;

  v3 = &self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout_delegate];
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakInit(v3);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SocialProfileCollectionViewTableLayout();
  return -[SocialProfileCollectionViewTableLayout init](&v5, "init");
}

- (_TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout)initWithCoder:(id)a3
{
  unsigned __int8 *v5;
  id v6;
  _TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout *v7;
  objc_super v9;

  v5 = &self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout_delegate];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SocialProfileCollectionViewTableLayout();
  v6 = a3;
  v7 = -[SocialProfileCollectionViewTableLayout initWithCoder:](&v9, "initWithCoder:", v6);

  return v7;
}

- (void).cxx_destruct
{
  sub_64880((uint64_t)&self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout_delegate]);
}

@end
