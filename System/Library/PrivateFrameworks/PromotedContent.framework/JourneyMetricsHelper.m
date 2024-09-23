@implementation JourneyMetricsHelper

- (void)setImpressionThresholdDuration:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_impressionThresholdDuration);
  swift_beginAccess();
  *v4 = a3;
}

- (void)setPromotedContent:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (id)registerForPCUsedEventWithAction:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC15PromotedContent20JourneyMetricsHelper *v6;
  void *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  JourneyMetricsHelper.registerForPCUsedEvent(action:)((uint64_t)sub_1B120D624, v5);

  swift_release();
  v7 = (void *)sub_1B1289878();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)delivered
{
  _TtC15PromotedContent20JourneyMetricsHelper *v2;

  v2 = self;
  sub_1B1206DE4();

}

- (void)onScreenWithCollapsed:(BOOL)a3
{
  _TtC15PromotedContent20JourneyMetricsHelper *v4;

  v4 = self;
  sub_1B11E9668(a3);

}

- (void)placedWithPlacementType:(int64_t)a3 placement:(int64_t)a4 position:(int64_t)a5
{
  _TtC15PromotedContent20JourneyMetricsHelper *v8;

  v8 = self;
  sub_1B11E7F40(a3, a4, a5, 0, 200, 0);

}

- (void)notifyListenersPCUsed
{
  _TtC15PromotedContent20JourneyMetricsHelper *v2;

  v2 = self;
  JourneyMetricsHelper.notifyListenersPCUsed()();

}

- (void)addUnfilledReason:(int64_t)a3
{
  _TtC15PromotedContent20JourneyMetricsHelper *v4;

  v4 = self;
  sub_1B11E2150(a3);

}

- (void)unregisterForPCUsedEventWithListenerID:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC15PromotedContent20JourneyMetricsHelper *v7;
  Swift::String v8;

  v4 = sub_1B1289884();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  JourneyMetricsHelper.unregisterForPCUsedEvent(listenerID:)(v8);

  swift_bridgeObjectRelease();
}

- (APPCPromotableContent)promotedContent
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_promotedContent;
  swift_beginAccess();
  return (APPCPromotableContent *)(id)MEMORY[0x1B5E19218](v2);
}

- (NSString)promotedContentIdentifier
{
  return (NSString *)sub_1B120925C();
}

- (void)setPromotedContentIdentifier:(id)a3
{
  sub_1B1271FC0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_promotedContentIdentifier);
}

- (NSString)journeyIdentifier
{
  return (NSString *)sub_1B120925C();
}

- (void)setJourneyIdentifier:(id)a3
{
  sub_1B1271FC0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_journeyIdentifier);
}

- (APMetricPrimitiveCreating)primitiveCreator
{
  swift_beginAccess();
  return (APMetricPrimitiveCreating *)(id)swift_unknownObjectRetain();
}

- (void)setPrimitiveCreator:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_primitiveCreator);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)hasBeenOnScreen
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_hasBeenOnScreen;
  swift_beginAccess();
  return *v2;
}

- (void)setHasBeenOnScreen:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_hasBeenOnScreen;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isCurrentlyOnScreen
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_isCurrentlyOnScreen;
  swift_beginAccess();
  return *v2;
}

- (void)setIsCurrentlyOnScreen:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_isCurrentlyOnScreen;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)didUnload
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_didUnload;
  swift_beginAccess();
  return *v2;
}

- (void)setDidUnload:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_didUnload;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)didImpress
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_didImpress;
  swift_beginAccess();
  return *v2;
}

- (void)setDidImpress:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_didImpress;
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC15PromotedContent31JourneyMetricsHelperDiagnostics)diagnostics
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_diagnostics);
  swift_beginAccess();
  return (_TtC15PromotedContent31JourneyMetricsHelperDiagnostics *)*v2;
}

- (void)setDiagnostics:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_diagnostics);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (double)impressionThresholdDuration
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_impressionThresholdDuration);
  swift_beginAccess();
  return *v2;
}

- (void)dealloc
{
  _TtC15PromotedContent20JourneyMetricsHelper *v2;
  objc_super v3;

  v2 = self;
  sub_1B11E6124();
  sub_1B127AEAC(9102);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for JourneyMetricsHelper();
  -[JourneyMetricsHelper dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1B121CA90((uint64_t)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_promotedContent);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_newsSupplementalContext));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)registerHandlerForAllMetricsWithClosure:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC15PromotedContent20JourneyMetricsHelper *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1B1279F4C((uint64_t)sub_1B1221FA4, v5);

  swift_release();
}

- (void)removeHandler
{
  _TtC15PromotedContent20JourneyMetricsHelper *v2;

  v2 = self;
  sub_1B127A108();

}

- (void)discardedWithCode:(int64_t)a3
{
  _TtC15PromotedContent20JourneyMetricsHelper *v4;

  v4 = self;
  sub_1B127A23C(a3);

}

- (void)notConsumedWithCode:(int64_t)a3 placeholder:(BOOL)a4
{
  _TtC15PromotedContent20JourneyMetricsHelper *v5;

  v5 = self;
  sub_1B1281010(a3);

}

- (void)createdWithAdType:(int64_t)a3
{
  _TtC15PromotedContent20JourneyMetricsHelper *v4;

  v4 = self;
  sub_1B127A3F4(a3);

}

- (void)createdWithAdType:(int64_t)a3 container:(int64_t)a4
{
  _TtC15PromotedContent20JourneyMetricsHelper *v6;

  v6 = self;
  sub_1B127A52C(a3, a4);

}

- (void)createdWithAdType:(int64_t)a3 container:(int64_t)a4 format:(int64_t)a5
{
  _TtC15PromotedContent20JourneyMetricsHelper *v7;

  v7 = self;
  sub_1B127A52C(a3, a4);

}

- (void)replacedWithHelper:(id)a3
{
  _TtC15PromotedContent20JourneyMetricsHelper *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1B127A6BC(a3);
  swift_unknownObjectRelease();

}

- (void)loaded
{
  _TtC15PromotedContent20JourneyMetricsHelper *v2;

  v2 = self;
  sub_1B127AD38();

}

- (void)webAdRemoved
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_unloadReason;
  *(_QWORD *)v2 = 9101;
  v2[8] = 0;
}

- (void)unloadedWithReason:(int64_t)a3
{
  _TtC15PromotedContent20JourneyMetricsHelper *v4;

  v4 = self;
  sub_1B127AEAC(a3);

}

- (void)placedWithPlacementType:(int64_t)a3 placement:(int64_t)a4 wasNativeSlot:(BOOL)a5
{
  _TtC15PromotedContent20JourneyMetricsHelper *v7;

  v7 = self;
  sub_1B11E7F40(a3, a4, 0, 1, 200, 0);

}

- (void)placedWithPlacementType:(int64_t)a3 placement:(int64_t)a4
{
  _TtC15PromotedContent20JourneyMetricsHelper *v6;

  v6 = self;
  sub_1B11E7F40(a3, a4, 0, 0, 200, 0);

}

- (void)placedWithPlacementType:(int64_t)a3 placement:(int64_t)a4 unfilledReason:(int64_t)a5
{
  _TtC15PromotedContent20JourneyMetricsHelper *v8;

  v8 = self;
  sub_1B11E7F40(a3, a4, 0, 0, a5, 0);

}

- (void)ready
{
  _TtC15PromotedContent20JourneyMetricsHelper *v2;

  v2 = self;
  sub_1B127B228();

}

- (void)interstitialOnScreenWithCollapsed:(BOOL)a3
{
  _TtC15PromotedContent20JourneyMetricsHelper *v4;

  v4 = self;
  sub_1B127B37C(a3);

}

- (void)visibleWithPercent:(int64_t)a3 starting:(id)a4 duration:(double)a5 collapsed:(BOOL)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _TtC15PromotedContent20JourneyMetricsHelper *v14;
  _BYTE v15[16];

  v10 = sub_1B1289620();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = &v15[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B12895FC();
  v14 = self;
  v15[12] = 1;
  sub_1B127B9D4(a3, a5, (uint64_t)v13, 0x100000000, a6);

  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)visibleWithPercent:(int64_t)a3 starting:(id)a4 duration:(double)a5 scrollVelocity:(float)a6 collapsed:(BOOL)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _TtC15PromotedContent20JourneyMetricsHelper *v16;
  _BYTE v17[16];

  v12 = sub_1B1289620();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = &v17[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B12895FC();
  v16 = self;
  v17[12] = 0;
  sub_1B127B9D4(a3, a5, (uint64_t)v15, LODWORD(a6), a7);

  (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)offScreenWithCollapsed:(BOOL)a3
{
  _TtC15PromotedContent20JourneyMetricsHelper *v4;

  v4 = self;
  sub_1B127C47C(a3);

}

- (void)interacted
{
  _TtC15PromotedContent20JourneyMetricsHelper *v2;

  v2 = self;
  sub_1B127C94C(256, 0x100000000, 0x100000000, 7300, 0);

}

- (void)interactedAtXPos:(float)a3 yPos:(float)a4
{
  uint64_t v4;
  uint64_t v5;
  _TtC15PromotedContent20JourneyMetricsHelper *v6;

  v4 = LODWORD(a3);
  v5 = LODWORD(a4);
  v6 = self;
  sub_1B127C94C(256, v4, v5, 7300, 0);

}

- (void)interactedWithElementID:(unsigned __int8)a3 atXPos:(float)a4 yPos:(float)a5
{
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  _TtC15PromotedContent20JourneyMetricsHelper *v8;

  v5 = a3;
  v6 = LODWORD(a4);
  v7 = LODWORD(a5);
  v8 = self;
  sub_1B127C94C(v5, v6, v7, 7300, 0);

}

- (void)interactedWithType:(int64_t)a3
{
  _TtC15PromotedContent20JourneyMetricsHelper *v4;

  v4 = self;
  sub_1B127C94C(256, 0x100000000, 0x100000000, a3, 0);

}

- (void)userReturnedFromInteractionWithIsVoiceOverEnabled:(BOOL)a3
{
  _TtC15PromotedContent20JourneyMetricsHelper *v4;

  v4 = self;
  sub_1B127CF4C(a3, 0);

}

- (void)userReturnedFromInteractionWithIsVoiceOverEnabled:(BOOL)a3 ignoreVisibilityState:(BOOL)a4
{
  _TtC15PromotedContent20JourneyMetricsHelper *v6;

  v6 = self;
  sub_1B127CF4C(a3, a4);

}

- (void)adMarkerInteracted
{
  _TtC15PromotedContent20JourneyMetricsHelper *v2;

  v2 = self;
  sub_1B127C94C(256, 0x100000000, 0x100000000, 7302, 0);

}

- (void)getAppWithButtonState:(int64_t)a3 timeToPreviousInstall:(int64_t)a4
{
  _TtC15PromotedContent20JourneyMetricsHelper *v5;

  v5 = self;
  sub_1B1281340(a3);

}

- (void)exceededContainer
{
  _TtC15PromotedContent20JourneyMetricsHelper *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1B1208904();
  sub_1B12071AC(77004, -1, 0, v3);

  swift_bridgeObjectRelease();
}

- (void)contentLoadFailure
{
  _TtC15PromotedContent20JourneyMetricsHelper *v2;

  v2 = self;
  sub_1B127D730();

}

- (_TtC15PromotedContent20JourneyMetricsHelper)init
{
  _TtC15PromotedContent20JourneyMetricsHelper *result;

  result = (_TtC15PromotedContent20JourneyMetricsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)updateElementsShownWithShown:(id)a3 partiallyShown:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  _TtC15PromotedContent20JourneyMetricsHelper *v7;

  v5 = sub_1B1289944();
  v6 = sub_1B1289944();
  v7 = self;
  JourneyMetricsHelper.updateElementsShown(shown:partiallyShown:)((Swift::OpaquePointer)v5, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)debugging
{
  _TtC15PromotedContent20JourneyMetricsHelper *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = -[JourneyMetricsHelper debugDescription](v2, sel_debugDescription);
  sub_1B1289884();

  v4 = (void *)sub_1B1289878();
  swift_bridgeObjectRelease();
  return v4;
}

@end
