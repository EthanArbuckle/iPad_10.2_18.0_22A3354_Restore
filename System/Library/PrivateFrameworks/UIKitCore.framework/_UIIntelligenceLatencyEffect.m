@implementation _UIIntelligenceLatencyEffect

- (_UIIntelligenceLatencyEffect)initWithMode:(unint64_t)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceLatencyEffect_mode) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)_UIIntelligenceLatencyEffect;
  return -[_UIIntelligenceLatencyEffect init](&v4, sel_init);
}

- (_UIIntelligenceLatencyEffect)initWithCoder:(id)a3
{
  type metadata accessor for _UIIntelligenceLatencyEffect();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  _UIIntelligenceLatencyEffect *v11;
  id v12;

  if (a5 == 1)
  {
    if (a3)
    {
      v8 = objc_allocWithZone((Class)_s14LatencyEmitterCMa());
      v9 = a3;
      v10 = a4;
      v11 = self;
      v12 = objc_msgSend(v8, sel_init);
      objc_msgSend(v9, sel_addOverlay_, v12);

    }
    else
    {
      __break(1u);
    }
  }
}

- (_UIIntelligenceLatencyEffect)init
{
  _UIIntelligenceLatencyEffect *result;

  result = (_UIIntelligenceLatencyEffect *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
