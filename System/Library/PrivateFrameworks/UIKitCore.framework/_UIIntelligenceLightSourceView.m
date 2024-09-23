@implementation _UIIntelligenceLightSourceView

- (_UIIntelligenceLightSourceView)initWithFrame:(CGRect)a3 preferAudioReactivity:(BOOL)a4
{
  return (_UIIntelligenceLightSourceView *)sub_1855A6C24(a4);
}

- (_UIIntelligenceLightSourceView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UIIntelligenceLightSourceView *v10;
  char v11;
  _UIIntelligenceLightSourceView *v12;
  _BYTE *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = -[_UIIntelligenceLightSourceView initWithFrame:preferAudioReactivity:](self, sel_initWithFrame_preferAudioReactivity_, objc_msgSend(v9, sel_prefersAudioReactivity), x, y, width, height);
  v11 = *((_BYTE *)v9 + OBJC_IVAR____UIIntelligenceLightSourceConfiguration_wrapped);
  v12 = v10;

  v13 = (char *)v12 + OBJC_IVAR____UIIntelligenceLightSourceView_configuration;
  swift_beginAccess();
  *v13 = v11;

  return v12;
}

- (_UIIntelligenceLightSourceView)initWithCoder:(id)a3
{
  _UIIntelligenceLightSourceView *result;

  result = (_UIIntelligenceLightSourceView *)sub_186507E04();
  __break(1u);
  return result;
}

- (_UIIntelligenceLightSourceView)initWithFrame:(CGRect)a3
{
  _UIIntelligenceLightSourceView *result;

  result = (_UIIntelligenceLightSourceView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
