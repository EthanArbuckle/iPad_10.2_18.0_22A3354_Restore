@implementation _UIIntelligenceLightSourceConfiguration

- (BOOL)prefersAudioReactivity
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____UIIntelligenceLightSourceConfiguration_wrapped);
}

- (void)setPrefersAudioReactivity:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____UIIntelligenceLightSourceConfiguration_wrapped) = a3;
}

- (_UIIntelligenceLightSourceConfiguration)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____UIIntelligenceLightSourceConfiguration_wrapped) = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIIntelligenceLightSourceConfiguration;
  return -[_UIIntelligenceLightSourceConfiguration init](&v3, sel_init);
}

@end
