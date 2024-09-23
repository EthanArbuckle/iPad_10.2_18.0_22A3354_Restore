@implementation CRLMathCalculationController

- (NSDictionary)pkExpressions
{
  return (NSDictionary *)sub_1008401C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_pkExpressions, (unint64_t *)&unk_1013F0800, PKMathRecognitionItem_ptr);
}

- (void)setPkExpressions:(id)a3
{
  sub_1008402A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (unint64_t *)&unk_1013F0800, PKMathRecognitionItem_ptr, &OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_pkExpressions);
}

- (OS_dispatch_queue)pkExpressionsQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_pkExpressionsQueue));
}

- (NSDictionary)expressionStrokeGroups
{
  return (NSDictionary *)sub_1008401C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_expressionStrokeGroups, (unint64_t *)&qword_1013F07F0, NSNumber_ptr);
}

- (void)setExpressionStrokeGroups:(id)a3
{
  sub_1008402A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (unint64_t *)&qword_1013F07F0, NSNumber_ptr, &OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_expressionStrokeGroups);
}

- (OS_dispatch_queue)expressionStrokeGroupsQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_expressionStrokeGroupsQueue));
}

+ (NSString)mathHintsModeChangedNotificationName
{
  if (qword_1013DD250 != -1)
    swift_once(&qword_1013DD250, sub_100840384);
  return (NSString *)(id)static CRLMathCalculationController.mathHintsModeChangedNotificationName;
}

- (_TtC8Freeform28CRLMathCalculationController)init
{
  return (_TtC8Freeform28CRLMathCalculationController *)sub_100840438();
}

- (void)dealloc
{
  void *v3;
  _TtC8Freeform28CRLMathCalculationController *v4;
  id v5;
  objc_super v6;

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_mathHintsUserDefaultsObserver);
  v4 = self;
  if (v3)
  {
    v5 = v3;
    dispatch thunk of NSKeyValueObservation.invalidate()();

  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLMathCalculationController();
  -[CRLMathCalculationController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_calculateDocument));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_expressions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_pkExpressions));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_pkExpressionsQueue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_expressionStrokeGroups));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_expressionStrokeGroupsQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_mathHintsUserDefaultsObserver));
}

- (void)updateCalculateDocument
{
  _TtC8Freeform28CRLMathCalculationController *v2;

  v2 = self;
  sub_100840E9C();

}

- (void)setMathHintsMode:(int64_t)a3
{
  _s8Freeform28CRLMathCalculationControllerC13mathHintsModeAA0bfG0Ovs_0(a3);
}

- (int64_t)pkMathRecognitionViewControllerSolvingStyle
{
  _TtC8Freeform28CRLMathCalculationController *v2;
  unint64_t v3;
  int64_t v4;
  int64_t result;
  unint64_t v6;

  v2 = self;
  v3 = -[CRLMathCalculationController mathHintsMode]_0();
  if (v3 >= 3)
  {
    v6 = v3;
    result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for CRLMathHintsMode, &v6, &type metadata for CRLMathHintsMode, &type metadata for Int);
    __break(1u);
  }
  else
  {
    v4 = 2 - v3;

    return v4;
  }
  return result;
}

- (void)insertPKExpressionWithPkExpression:(id)a3
{
  _TtC8Freeform28CRLMathCalculationController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100841D9C(v5);

}

- (void)removePKExpressionWithPkExpressionId:(id)a3
{
  sub_100842CC0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100842070);
}

- (id)getPKExpressionFor:(id)a3
{
  return sub_1008424DC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1008420BC);
}

- (id)getStrokeGroupFor:(id)a3
{
  return sub_1008424DC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_100842278);
}

- (void)updateStrokeGroupFor:(id)a3 strokeGroupId:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8Freeform28CRLMathCalculationController *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = a4;
  v12 = self;
  sub_100842584((uint64_t)v10, a4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)removeStrokeGroupWithPkExpressionId:(id)a3
{
  sub_100842CC0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100842984);
}

- (uint64_t)mathHintsMode
{
  char v0;
  char v1;
  _BYTE *v2;
  uint64_t result;
  id v4;
  id v5;
  _QWORD v6[3];
  ValueMetadata *v7;
  unint64_t v8;

  v7 = &type metadata for CRLPencilAndPaperFeatureFlags;
  v8 = sub_10054E910();
  LOBYTE(v6[0]) = 0;
  v0 = isFeatureEnabled(_:)(v6);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v6);
  if ((v0 & 1) == 0)
    return 0;
  v7 = &type metadata for CRLFeatureFlags;
  v8 = sub_1004DB6DC();
  LOBYTE(v6[0]) = 14;
  v1 = isFeatureEnabled(_:)(v6);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v6);
  if ((v1 & 1) == 0)
    return 0;
  if (qword_1013DD618 != -1)
    swift_once(&qword_1013DD618, sub_1009A4410);
  v2 = (_BYTE *)(qword_1013FF120
               + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed);
  swift_beginAccess(qword_1013FF120 + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed, v6, 0, 0);
  result = 0;
  if (*v2 == 1)
  {
    v4 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
    v5 = objc_msgSend(v4, "integerForKey:", CFSTR("CRLMathRecognitionMode"));

    if (v5 == (id)2)
      return 2;
    else
      return v5 == (id)1;
  }
  return result;
}

@end
