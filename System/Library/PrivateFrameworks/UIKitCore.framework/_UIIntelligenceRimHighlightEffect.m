@implementation _UIIntelligenceRimHighlightEffect

- (unint64_t)activationTransitionDirection
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____UIIntelligenceRimHighlightEffect_transitionInfo);
}

- (void)setActivationTransitionDirection:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceRimHighlightEffect_transitionInfo) = (Class)a3;
}

- (unint64_t)deactivationTransitionDirection
{
  return *(_QWORD *)&self->config[OBJC_IVAR____UIIntelligenceRimHighlightEffect_transitionInfo];
}

- (void)setDeactivationTransitionDirection:(unint64_t)a3
{
  *(_QWORD *)&self->config[OBJC_IVAR____UIIntelligenceRimHighlightEffect_transitionInfo] = a3;
}

- (_UIIntelligenceRimHighlightEffect)initWithThickness:(double)a3 color:(id)a4 softRadius:(double)a5 region:(unint64_t)a6 activationDirection:(unint64_t)a7
{
  return (_UIIntelligenceRimHighlightEffect *)sub_18569B588(a4, a6, a7, a3, a5);
}

- (_UIIntelligenceRimHighlightEffect)initWithThickness:(double)a3 activationDirection:(unint64_t)a4
{
  id v7;
  _UIIntelligenceRimHighlightEffect *v8;

  v7 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  v8 = -[_UIIntelligenceRimHighlightEffect initWithThickness:color:softRadius:region:activationDirection:](self, sel_initWithThickness_color_softRadius_region_activationDirection_, v7, 0, a4, a3, 0.0);

  return v8;
}

- (_UIIntelligenceRimHighlightEffect)initWithCoder:(id)a3
{
  type metadata accessor for _UIIntelligenceRimHighlightEffect();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v9;
  id v10;
  _UIIntelligenceRimHighlightEffect *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_18569B9E0(a3, a5);

}

- (void).cxx_destruct
{
  id v2;

  v2 = *(id *)&self->config[OBJC_IVAR____UIIntelligenceRimHighlightEffect_config];

}

- (_UIIntelligenceRimHighlightEffect)init
{
  _UIIntelligenceRimHighlightEffect *result;

  result = (_UIIntelligenceRimHighlightEffect *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
