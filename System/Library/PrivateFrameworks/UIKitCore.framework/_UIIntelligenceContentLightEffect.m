@implementation _UIIntelligenceContentLightEffect

- (unint64_t)activationTransitionDirection
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____UIIntelligenceContentLightEffect_transitionInfo);
}

- (void)setActivationTransitionDirection:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceContentLightEffect_transitionInfo) = (Class)a3;
}

- (unint64_t)deactivationTransitionDirection
{
  return *(_QWORD *)&self->lightSource[OBJC_IVAR____UIIntelligenceContentLightEffect_transitionInfo];
}

- (void)setDeactivationTransitionDirection:(unint64_t)a3
{
  *(_QWORD *)&self->lightSource[OBJC_IVAR____UIIntelligenceContentLightEffect_transitionInfo] = a3;
}

- (_UIIntelligenceContentLightEffect)initWithLightSource:(id)a3
{
  id v4;
  _UIIntelligenceContentLightEffect *v5;
  objc_class *v6;
  _QWORD *v7;
  _UIIntelligenceContentLightEffect *v8;
  objc_super v10;

  v4 = a3;
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, sel_descriptorWithDefaultUsageHint_, 1);
  *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____UIIntelligenceContentLightEffect_lightSource) = v6;
  v7 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR____UIIntelligenceContentLightEffect_transitionInfo);
  *v7 = 0;
  v7[1] = 0;

  v10.receiver = v5;
  v10.super_class = (Class)_UIIntelligenceContentLightEffect;
  v8 = -[_UIIntelligenceContentLightEffect init](&v10, sel_init);

  return v8;
}

- (_UIIntelligenceContentLightEffect)initWithCoder:(id)a3
{
  type metadata accessor for _UIIntelligenceContentLightEffect((uint64_t)self);
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8;
  id v9;
  _UIIntelligenceContentLightEffect *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_185703F78(v8, a5);

}

- (int64_t)_expectedUsage
{
  return 2;
}

- (void).cxx_destruct
{

}

- (_UIIntelligenceContentLightEffect)init
{
  _UIIntelligenceContentLightEffect *result;

  result = (_UIIntelligenceContentLightEffect *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
