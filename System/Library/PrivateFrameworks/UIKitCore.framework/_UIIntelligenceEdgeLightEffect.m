@implementation _UIIntelligenceEdgeLightEffect

- (unint64_t)activationTransitionDirection
{
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_transitionInfo);
}

- (void)setActivationTransitionDirection:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_transitionInfo) = (Class)a3;
}

- (unint64_t)deactivationTransitionDirection
{
  return *(_QWORD *)&self->transitionInfo[OBJC_IVAR____UIIntelligenceEdgeLightEffect_transitionInfo];
}

- (void)setDeactivationTransitionDirection:(unint64_t)a3
{
  *(_QWORD *)&self->transitionInfo[OBJC_IVAR____UIIntelligenceEdgeLightEffect_transitionInfo] = a3;
}

- (_UIIntelligenceEdgeLightEffect)initWithLightSource:(id)a3 radius:(double)a4 region:(unint64_t)a5
{
  id v8;
  _UIIntelligenceEdgeLightEffect *v9;
  objc_class *v10;
  _QWORD *v11;
  _UIIntelligenceEdgeLightEffect *v12;
  objc_super v14;

  v8 = a3;
  v9 = self;
  v10 = (objc_class *)objc_msgSend(v8, sel_descriptorWithDefaultUsageHint_, 2);
  *(Class *)((char *)&v9->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_lightSource) = v10;
  *(Class *)((char *)&v9->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_region) = (Class)a5;
  *(double *)((char *)&v9->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_radius) = a4;
  v11 = (Class *)((char *)&v9->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_transitionInfo);
  *v11 = 0;
  v11[1] = 0;

  v14.receiver = v9;
  v14.super_class = (Class)_UIIntelligenceEdgeLightEffect;
  v12 = -[_UIIntelligenceEdgeLightEffect init](&v14, sel_init);

  return v12;
}

- (_UIIntelligenceEdgeLightEffect)initWithCoder:(id)a3
{
  type metadata accessor for _UIIntelligenceEdgeLightEffect((uint64_t)self);
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8;
  id v9;
  _UIIntelligenceEdgeLightEffect *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1855D0894(v8, a5);

}

- (int64_t)_expectedUsage
{
  return 2;
}

- (void).cxx_destruct
{

}

- (_UIIntelligenceEdgeLightEffect)init
{
  _UIIntelligenceEdgeLightEffect *result;

  result = (_UIIntelligenceEdgeLightEffect *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
