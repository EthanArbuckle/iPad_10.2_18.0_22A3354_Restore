@implementation SearchUIAnimator

+ (void)animateWithLayer:(id)a3 with:(id)a4 key:(id)a5 animations:(id)a6 delegate:(id)a7
{
  uint64_t v10;
  objc_class *v11;
  char *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v17;

  sub_1DAE0D53C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E878);
  v10 = sub_1DAE0D5CC();
  v11 = (objc_class *)type metadata accessor for SearchUIGroupedLayerAnimation();
  v12 = (char *)objc_allocWithZone(v11);
  *(_QWORD *)&v12[OBJC_IVAR____TtC8SearchUI29SearchUIGroupedLayerAnimation_animations] = v10;
  v17.receiver = v12;
  v17.super_class = v11;
  v13 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v14 = objc_msgSendSuper2(&v17, sel_init);
  v15 = (void *)sub_1DAE08CB4((uint64_t)a4);
  objc_msgSend(v15, sel_setDelegate_, a7, v17.receiver, v17.super_class);
  v16 = (void *)sub_1DAE0D530();
  objc_msgSend(v13, sel_addAnimation_forKey_, v15, v16);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

+ (id)animateWith:(id)a3 animations:(id)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = _Block_copy(a4);
  v7 = _Block_copy(a5);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  if (v7)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    v7 = sub_1DAE09FC4;
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)swift_unknownObjectRetain();
  v11 = _s8SearchUI0A10UIAnimatorC7animate4with10animations10completionSo22UIViewPropertyAnimatorCAA0A19UIAnimationSettings_p_yycySbcSgtFZ_0(v10, (uint64_t (*)(uint64_t))sub_1DAE09FA8, v8, (uint64_t)v7, v9);
  sub_1DAE09FB4((uint64_t)v7);
  swift_unknownObjectRelease();
  swift_release();
  return v11;
}

- (_TtC8SearchUI16SearchUIAnimator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchUIAnimator();
  return -[SearchUIAnimator init](&v3, sel_init);
}

@end
