@implementation UIView.HybridPropertyAnimator

- (UIViewFloatAnimatableProperty)progressValue
{
  return (UIViewFloatAnimatableProperty *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator_progressValue));
}

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator__state);
}

- (BOOL)isRunning
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator__isRunning);
}

- (BOOL)isReversed
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator__isReversed);
}

- (void)setReversed:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator__isReversed) = a3;
}

- (double)fractionComplete
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator__fractionComplete);
}

- (void)setFractionComplete:(double)a3
{
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v4;

  v4 = self;
  sub_185777C34(a3);

}

- (void)startAnimation
{
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v2;

  v2 = self;
  sub_185777ABC();

}

- (void)startAnimationAfterDelay:(double)a3
{
  sub_186507E04();
  __break(1u);
}

- (void)pauseAnimation
{
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v2;

  v2 = self;
  sub_185777778();

}

- (void)stopAnimation:(BOOL)a3
{
  _BOOL8 v3;
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v4;

  v3 = a3;
  v4 = self;
  sub_185777CCC((id)v3);

}

- (void)finishAnimationAtPosition:(int64_t)a3
{
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v4;

  v4 = self;
  sub_185777DB4(a3);

}

- (void)addAnimations:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v10;
  _QWORD v11[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator_propertyAnimator);
  v7 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v7;
  v8[3] = sub_1855E0294;
  v8[4] = v5;
  v11[4] = sub_18577A1EC;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_18530A69C;
  v11[3] = &block_descriptor_79_0;
  v9 = _Block_copy(v11);
  v10 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_addAnimations_delayFactor_, v9, 0.0);
  _Block_release(v9);

  swift_release();
}

- (void)addAnimations:(id)a3 delayFactor:(double)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v12;
  _QWORD v13[6];

  v6 = _Block_copy(a3);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator_propertyAnimator);
  v9 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v9;
  v10[3] = sub_1855A956C;
  v10[4] = v7;
  v13[4] = sub_1855A6900;
  v13[5] = v10;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_18530A69C;
  v13[3] = &block_descriptor_60;
  v11 = _Block_copy(v13);
  v12 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_addAnimations_delayFactor_, v11, a4);
  _Block_release(v11);

  swift_release();
}

- (void)addCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1855B1090;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = (_QWORD **)((char *)self + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator_completionHandlers);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_185647E24(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v12 = v8[2];
  v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_185647E24((_QWORD *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1856DC45C;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (void)continueAnimationWithTimingParameters:(id)a3 durationFactor:(double)a4
{
  void *v5;
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v6;
  id v7;
  void *v8;
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v9;
  id v10;

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator_springBehavior);
  if (v5)
  {
    swift_unknownObjectRetain();
    v6 = self;
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_opt_self();
    swift_unknownObjectRetain();
    v9 = self;
    v10 = objc_msgSend(v8, sel_parallaxSettings);
    v7 = objc_msgSend(v10, sel_interactiveSpring);

  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  sub_185779C98((uint64_t)v7, self);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)addInProcessProgressAnimations:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1857787A8((uint64_t)sub_1857152BC, v5);

  swift_release();
}

- (void)addInProcessProgressKeyframeWithRelativeStartTime:(double)a3 relativeDuration:(double)a4 animations:(id)a5
{
  void *v8;
  uint64_t v9;
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v10;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = self;
  sub_18577982C((uint64_t)sub_185714B58, v9, a3, a4);

  swift_release();
}

- (void)continueAnimationWithSpring:(id)a3
{
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *v5;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v5 = self;
  sub_185779C98((uint64_t)a3, v5);
  swift_unknownObjectRelease();

}

- (_TtCE5UIKitCSo6UIView22HybridPropertyAnimator)init
{
  _TtCE5UIKitCSo6UIView22HybridPropertyAnimator *result;

  result = (_TtCE5UIKitCSo6UIView22HybridPropertyAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator_propertyAnimator));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
