@implementation BSUIContextActionDataModel

- (id)originatingLocation
{
  char *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _BYTE v12[24];
  _QWORD v13[3];
  uint64_t v14;

  v2 = (char *)self + OBJC_IVAR___BSUIContextActionDataModel_originatingLocation;
  swift_beginAccess((char *)self + OBJC_IVAR___BSUIContextActionDataModel_originatingLocation, v12, 0, 0);
  sub_6EF28((uint64_t)v2, (uint64_t)v13);
  v3 = v14;
  if (!v14)
    return 0;
  v4 = sub_66898(v13, v14);
  v5 = *(_QWORD *)(v3 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
  v9 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v8, v3);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  _s11BookStoreUI5ShelfV20HeaderComponentModelVwxx_0(v13);
  return v9;
}

- (void)setOriginatingLocation:(id)a3
{
  BSUIContextActionDataModel *v5;
  uint64_t v6;
  BSUIContextActionDataModel *v7;
  char *v8;
  _BYTE v9[24];
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = (char *)self + OBJC_IVAR___BSUIContextActionDataModel_originatingLocation;
  swift_beginAccess((char *)self + OBJC_IVAR___BSUIContextActionDataModel_originatingLocation, v9, 33, 0);
  sub_AC6F8((uint64_t)v10, (uint64_t)v8);
  swift_endAccess(v9);

}

- (NSString)presentationRefID
{
  return (NSString *)sub_14AF64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIContextActionDataModel_presentationRefID);
}

- (void)setPresentationRefID:(id)a3
{
  sub_14B040((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BSUIContextActionDataModel_presentationRefID);
}

- (NSString)presentationRefInstance
{
  return (NSString *)sub_14AF64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIContextActionDataModel_presentationRefInstance);
}

- (void)setPresentationRefInstance:(id)a3
{
  sub_14B040((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BSUIContextActionDataModel_presentationRefInstance);
}

- (NSString)presentationUID
{
  return (NSString *)sub_14AF64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIContextActionDataModel_presentationUID);
}

- (void)setPresentationUID:(id)a3
{
  sub_14B040((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BSUIContextActionDataModel_presentationUID);
}

- (BOOL)shouldReportFigaro
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR___BSUIContextActionDataModel_shouldReportFigaro;
  swift_beginAccess((char *)self + OBJC_IVAR___BSUIContextActionDataModel_shouldReportFigaro, v4, 0, 0);
  return *v2;
}

- (void)setShouldReportFigaro:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR___BSUIContextActionDataModel_shouldReportFigaro;
  swift_beginAccess((char *)self + OBJC_IVAR___BSUIContextActionDataModel_shouldReportFigaro, v5, 1, 0);
  *v4 = a3;
}

- (BOOL)isAnODPRecommendation
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR___BSUIContextActionDataModel_isAnODPRecommendation;
  swift_beginAccess((char *)self + OBJC_IVAR___BSUIContextActionDataModel_isAnODPRecommendation, v4, 0, 0);
  return *v2;
}

- (void)setIsAnODPRecommendation:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR___BSUIContextActionDataModel_isAnODPRecommendation;
  swift_beginAccess((char *)self + OBJC_IVAR___BSUIContextActionDataModel_isAnODPRecommendation, v5, 1, 0);
  *v4 = a3;
}

- (BOOL)supportsSuggestionContextMenu
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR___BSUIContextActionDataModel_supportsSuggestionContextMenu;
  swift_beginAccess((char *)self + OBJC_IVAR___BSUIContextActionDataModel_supportsSuggestionContextMenu, v4, 0, 0);
  return *v2;
}

- (void)setSupportsSuggestionContextMenu:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR___BSUIContextActionDataModel_supportsSuggestionContextMenu;
  swift_beginAccess((char *)self + OBJC_IVAR___BSUIContextActionDataModel_supportsSuggestionContextMenu, v5, 1, 0);
  *v4 = a3;
}

- (UIBarButtonItem)sourceBarButtonItem
{
  return (UIBarButtonItem *)sub_14B698((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIContextActionDataModel_sourceBarButtonItem);
}

- (void)setSourceBarButtonItem:(id)a3
{
  sub_14B734((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___BSUIContextActionDataModel_sourceBarButtonItem);
}

- (NSValue)sourcePoint
{
  return (NSValue *)sub_14B698((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIContextActionDataModel_sourcePoint);
}

- (void)setSourcePoint:(id)a3
{
  sub_14B734((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___BSUIContextActionDataModel_sourcePoint);
}

- (BCTransaction)transaction
{
  return (BCTransaction *)sub_14B904((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIContextActionDataModel_transaction);
}

- (void)setTransaction:(id)a3
{
  sub_14B9A4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BSUIContextActionDataModel_transaction);
}

- (BCTransactionProviding)transactionProvider
{
  return (BCTransactionProviding *)sub_14B904((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIContextActionDataModel_transactionProvider);
}

- (void)setTransactionProvider:(id)a3
{
  sub_14B9A4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BSUIContextActionDataModel_transactionProvider);
}

- (BSUIContextActionDataModel)initWithAssetModels:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for ContextActionDataModel.Asset();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  return (BSUIContextActionDataModel *)ContextActionDataModel.init(assets:)(v5);
}

- (BSUIContextActionDataModel)initWithAssetModel:(id)a3 sourceView:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (BSUIContextActionDataModel *)ContextActionDataModel.init(asset:sourceView:)((uint64_t)v5, (uint64_t)a4);
}

- (void)setODPAnalyticsWithAttributes:(id)a3
{
  uint64_t v4;
  BSUIContextActionDataModel *v5;

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v5 = self;
  sub_14C074(v4);

  swift_bridgeObjectRelease(v4);
}

- (BSUIContextActionDataModel)init
{
  BSUIContextActionDataModel *result;

  result = (BSUIContextActionDataModel *)_swift_stdlib_reportUnimplementedInitializer("BookStoreUI.ContextActionDataModel", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_14D544(*(void **)((char *)&self->super.isa + OBJC_IVAR___BSUIContextActionDataModel_initType), *(void **)&self->initType[OBJC_IVAR___BSUIContextActionDataModel_initType], self->initType[OBJC_IVAR___BSUIContextActionDataModel_initType + 8]);
  sub_5E09C((uint64_t)self + OBJC_IVAR___BSUIContextActionDataModel_originatingLocation, &qword_31F8B0);
  swift_bridgeObjectRelease(*(_QWORD *)&self->initType[OBJC_IVAR___BSUIContextActionDataModel_presentationRefID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->initType[OBJC_IVAR___BSUIContextActionDataModel_presentationRefInstance]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->initType[OBJC_IVAR___BSUIContextActionDataModel_presentationUID]);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BSUIContextActionDataModel_transaction));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___BSUIContextActionDataModel_transactionProvider));
  sub_14DB48((uint64_t)self + OBJC_IVAR___BSUIContextActionDataModel_analyticsAttributes);
}

@end
