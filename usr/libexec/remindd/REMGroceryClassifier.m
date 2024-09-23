@implementation REMGroceryClassifier

- (_TtC7remindd20REMGroceryClassifier)init
{
  _TtC7remindd20REMGroceryClassifier *result;

  result = (_TtC7remindd20REMGroceryClassifier *)_swift_stdlib_reportUnimplementedInitializer("remindd.REMGroceryClassifier", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->modelLocale[OBJC_IVAR____TtC7remindd20REMGroceryClassifier_modelLocale]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd20REMGroceryClassifier_models));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7remindd20REMGroceryClassifier_modelTypes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd20REMGroceryClassifier_labels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7remindd20REMGroceryClassifier_thresholds));
  swift_bridgeObjectRelease(*(_QWORD *)&self->modelLocale[OBJC_IVAR____TtC7remindd20REMGroceryClassifier_corrections + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->modelLocale[OBJC_IVAR____TtC7remindd20REMGroceryClassifier_trialDeploymentID]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7remindd20REMGroceryClassifier_groceryListScoreExcludedCategories));
}

@end
