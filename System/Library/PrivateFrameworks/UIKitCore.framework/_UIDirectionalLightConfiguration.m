@implementation _UIDirectionalLightConfiguration

- (_UIColorPalette)colorPalette
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_colorPalette);
  swift_beginAccess();
  return (_UIColorPalette *)*v2;
}

- (void)setColorPalette:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_colorPalette);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (unint64_t)direction
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR____UIDirectionalLightConfiguration_direction);
  swift_beginAccess();
  return *v2;
}

- (void)setDirection:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR____UIDirectionalLightConfiguration_direction);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)reverse
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____UIDirectionalLightConfiguration_reverse;
  swift_beginAccess();
  return *v2;
}

- (void)setReverse:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____UIDirectionalLightConfiguration_reverse;
  swift_beginAccess();
  *v4 = a3;
}

- (double)duration
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____UIDirectionalLightConfiguration_duration);
  swift_beginAccess();
  return *v2;
}

- (void)setDuration:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____UIDirectionalLightConfiguration_duration);
  swift_beginAccess();
  *v4 = a3;
}

- (_UIDirectionalLightConfiguration)initWithColorPalette:(id)a3
{
  id v3;
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_colorPalette) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_direction) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_reverse) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_duration) = (Class)0x4014000000000000;
  v5.receiver = self;
  v5.super_class = (Class)_UIDirectionalLightConfiguration;
  v3 = a3;
  return -[_UIDirectionalLightConfiguration init](&v5, sel_init);
}

- (_UIDirectionalLightConfiguration)initWithPalette:(id)a3
{
  objc_class *v3;
  objc_class *v4;
  objc_super v6;

  v3 = *(objc_class **)((char *)a3 + OBJC_IVAR____UIDirectionalLightPalette_colorPalette);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_colorPalette) = v3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_direction) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_reverse) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_duration) = (Class)0x4014000000000000;
  v6.receiver = self;
  v6.super_class = (Class)_UIDirectionalLightConfiguration;
  v4 = v3;
  return -[_UIDirectionalLightConfiguration init](&v6, sel_init);
}

- (_UIDirectionalLightPalette)palette
{
  _UIDirectionalLightConfiguration *v3;
  id v4;

  type metadata accessor for _UIDirectionalLightPalette((uint64_t)self);
  v3 = self;
  v4 = sub_1856A4A08(-[_UIDirectionalLightConfiguration colorPalette](v3, sel_colorPalette));

  return (_UIDirectionalLightPalette *)v4;
}

- (void)setPalette:(id)a3
{
  _UIDirectionalLightConfiguration *v4;
  _UIDirectionalLightPalette *v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = -[_UIDirectionalLightConfiguration palette](v4, sel_palette);
  v6 = *(id *)((char *)&v5->super.isa + OBJC_IVAR____UIDirectionalLightPalette_colorPalette);

  -[_UIDirectionalLightConfiguration setColorPalette:](v4, sel_setColorPalette_, v6);
}

- (_UIDirectionalLightConfiguration)init
{
  _UIDirectionalLightConfiguration *result;

  result = (_UIDirectionalLightConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
