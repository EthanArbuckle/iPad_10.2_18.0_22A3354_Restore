@implementation BKMediaTypeRecommendationProvider

- (BKMediaTypeRecommendationProvider)init
{
  char *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (char *)self + OBJC_IVAR___BKMediaTypeRecommendationProvider____lazy_storage___recommendationService;
  v4 = (objc_class *)type metadata accessor for MediaTypeRecommendationProvider();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[BKMediaTypeRecommendationProvider init](&v6, "init");
}

- (void)recommendedMediaTypeWith:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  BKMediaTypeRecommendationProvider *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject(&unk_10090EB90, 48, 7);
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v9[5] = a3;
  v10 = a3;
  v11 = self;
  v12 = v10;
  v13 = sub_10053DC20((uint64_t)v7, (uint64_t)&unk_1009EA788, (uint64_t)v9);
  swift_release(v13);
  sub_100010960((uint64_t)v7, &qword_1009D3150);

}

- (void).cxx_destruct
{
  sub_100010960((uint64_t)self + OBJC_IVAR___BKMediaTypeRecommendationProvider____lazy_storage___recommendationService, &qword_1009EA770);
}

@end
