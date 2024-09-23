@implementation BKGenreRecommendationProvider

- (void)recommendedGenreCollectionsFor:(id)a3 :(id)a4
{
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;
  BKGenreRecommendationProvider *v15;
  id v16;
  id v17;
  BKGenreRecommendationProvider *v18;
  uint64_t v19;
  uint64_t v20;

  ObjectType = swift_getObjectType();
  v8 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_100900EE8, 64, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = self;
  v12[7] = ObjectType;
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = v13;
  v17 = v14;
  v18 = v15;
  v19 = sub_10030C02C((uint64_t)v10, (uint64_t)&unk_1009DECB8, (uint64_t)v12);

  swift_release(v19);
}

- (BKGenreRecommendationProvider)init
{
  char *v3;
  char *v4;
  objc_class *v5;
  objc_super v7;

  v3 = (char *)self + OBJC_IVAR___BKGenreRecommendationProvider____lazy_storage___recommendationManager;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;
  v4 = (char *)self + OBJC_IVAR___BKGenreRecommendationProvider____lazy_storage___collectionRecommendationService;
  v5 = (objc_class *)type metadata accessor for GenreRecommendationProvider();
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[BKGenreRecommendationProvider init](&v7, "init");
}

- (void)recommendedGenresWith:(id)a3
{
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  BKGenreRecommendationProvider *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  ObjectType = swift_getObjectType();
  v6 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject(&unk_100900F10, 56, 7);
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = ObjectType;
  v11 = a3;
  v12 = self;
  v13 = v11;
  v14 = sub_10030C02C((uint64_t)v8, (uint64_t)&unk_1009DECE8, (uint64_t)v10);

  swift_release(v14);
}

- (void).cxx_destruct
{
  sub_100010960((uint64_t)self + OBJC_IVAR___BKGenreRecommendationProvider____lazy_storage___recommendationManager, &qword_1009DECA0);
  sub_100010960((uint64_t)self + OBJC_IVAR___BKGenreRecommendationProvider____lazy_storage___collectionRecommendationService, &qword_1009DEC90);
}

@end
