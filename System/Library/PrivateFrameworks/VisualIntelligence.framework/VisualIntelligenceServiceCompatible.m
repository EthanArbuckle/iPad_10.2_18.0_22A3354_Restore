@implementation VisualIntelligenceServiceCompatible

+ (NSArray)encryptedVisualSearchDomains
{
  return (NSArray *)sub_1D487CC64((uint64_t)a1, (uint64_t)a2, &qword_1EFEAA048);
}

+ (NSArray)richLabelEligibleVisualSearchDomains
{
  return (NSArray *)sub_1D487CC64((uint64_t)a1, (uint64_t)a2, &qword_1EFEAA050);
}

- (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible)init
{
  return (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *)VisualIntelligenceServiceCompatible.init()();
}

- (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible)initWithTimeoutInterval:(int64_t)a3
{
  return (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *)VisualIntelligenceServiceCompatible.init(timeoutInterval:)(a3);
}

- (_TtC18VisualIntelligence23OntologyGraphCompatible)ontologyGraph
{
  uint64_t v2;
  objc_class *v3;
  char *v4;
  objc_super v6;

  v2 = (*(_QWORD **)((char *)&self->super.isa
                   + OBJC_IVAR____TtC18VisualIntelligence35VisualIntelligenceServiceCompatible_service))[3];
  v3 = (objc_class *)type metadata accessor for OntologyGraphCompatible();
  v4 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR____TtC18VisualIntelligence23OntologyGraphCompatible_ontologyGraph] = v2;
  v6.receiver = v4;
  v6.super_class = v3;
  swift_bridgeObjectRetain();
  return (_TtC18VisualIntelligence23OntologyGraphCompatible *)-[VisualIntelligenceServiceCompatible init](&v6, sel_init);
}

- (CGSize)targetImageSizeWithInputImageSize:(CGSize)a3
{
  double height;
  double width;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v5;
  uint64_t v6;
  double v7;
  double v8;
  char v9;
  char v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  swift_retain();
  *(double *)&v6 = COERCE_DOUBLE(sub_1D48C9198(width, height));
  v8 = v7;
  v10 = v9;

  swift_release();
  v11 = *(double *)&v6;
  v12 = v8;
  if ((v10 & 1) != 0)
  {
    v12 = 0.0;
    v11 = 0.0;
  }
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)parseWithVisualQuery:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v10;
  id v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1D4886048;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = a3;
  v10 = self;
  swift_retain();
  swift_retain();
  v11 = VisualIntelligenceService.parse(query:cachedResults:completion:)(v9, 0, (uint64_t)sub_1D488636C, v8);

  swift_release();
  swift_release();
  swift_release();
  return v11;
}

- (id)parseCachedWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v13;
  id v14;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_1D4886040;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = a3;
  v12 = a4;
  v13 = self;
  swift_retain();
  swift_retain();
  v14 = VisualIntelligenceService.parse(query:cachedResults:completion:)(v11, a4, (uint64_t)sub_1D4886368, v10);

  swift_release();
  swift_release();
  swift_release();
  return v14;
}

- (id)searchWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v15;
  id v16;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  v16 = sub_1D487D9D8(v12, (uint64_t)v13, a5, (uint64_t)sub_1D48862E0, v11);

  swift_release();
  return v16;
}

- (id)experimentalSearchWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 completion:(id)a6
{
  return sub_1D487F578(self, (int)a2, a3, a4, a5, a6, (uint64_t (*)(id, id, void *, id, void *))sub_1D4883578);
}

- (id)encryptedSearchWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 completion:(id)a6
{
  return sub_1D487F578(self, (int)a2, a3, a4, a5, a6, (uint64_t (*)(id, id, void *, id, void *))sub_1D4883EE8);
}

- (id)encryptedSearchWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 domain:(id)a6 completion:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v17;
  void *v18;

  v12 = _Block_copy(a7);
  _Block_copy(v12);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = self;
  v18 = sub_1D4884BE4((uint64_t)v13, v14, a5, v16, (uint8_t *)v17, v12);
  _Block_release(v12);
  _Block_release(v12);

  return v18;
}

- (BOOL)isEligibleForEncryptedSearchWithCachedResults:(id)a3
{
  id v5;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v6;
  char v7;

  v5 = a3;
  v6 = self;
  swift_retain();
  v7 = sub_1D47DAEA8(a3);

  swift_release();
  return v7 & 1;
}

- (id)getEncryptedSearchDomainsWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v13;
  id v14;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_1D4886038;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = a3;
  v12 = a4;
  v13 = self;
  swift_retain();
  swift_retain();
  v14 = VisualIntelligenceService.parse(query:cachedResults:completion:)(v11, a4, (uint64_t)sub_1D4886364, v10);

  swift_release();
  swift_release();
  swift_release();
  return v14;
}

- (id)submitUserFeedbackWithUserFeedback:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v8;
  id v9;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  v9 = sub_1D4880E00(v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);

  return v9;
}

- (id)searchWithVisualQuery:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v9;
  id v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_1D48813B0(v8, (uint64_t)sub_1D48862E0, v7);

  swift_release();
  return v10;
}

- (id)pegasusPayloadDataWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = self;
  v15 = sub_1D4881734(v11, (uint64_t)v12, a5, a6);
  v17 = v16;

  v18 = (void *)sub_1D4920F60();
  sub_1D4696F10(v15, v17);
  return v18;
}

- (id)detectWithImage:(id)a3 regionOfInterest:(CGRect)a4 error:(id *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v10;
  void *v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  swift_unknownObjectRetain();
  v10 = self;
  sub_1D4881B80(x, y, width, height);

  swift_unknownObjectRelease();
  sub_1D46F2DB4(0, &qword_1EFEAC2B0);
  v11 = (void *)sub_1D4922814();
  swift_bridgeObjectRelease();
  return v11;
}

- (void)clearCacheWithCacheOption:(int64_t)a3
{
  sub_1D4836A10(a3);
}

- (id)refineRegionsWithRequest:(id)a3 error:(id *)a4
{
  id v5;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  swift_retain();
  v7 = (void *)sub_1D47C219C(v5);

  swift_release();
  return v7;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end
