@implementation SUIAShockwaveIntelligenceSystemLightView

- (void)didAddSubview:(id)a3
{
  id v4;
  SUIAShockwaveIntelligenceSystemLightView *v5;

  v4 = a3;
  v5 = self;
  sub_247C89B7C((uint64_t)v4);

}

- (UIView)circleMaskView
{
  return (UIView *)sub_247C89F08((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView);
}

- (void)setCircleMaskView:(id)a3
{
  sub_247C89FCC((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView, (void (*)(void *))sub_247C89D24);
}

- (UIView)sideLightMaskView
{
  return (UIView *)sub_247C89F08((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView);
}

- (void)setSideLightMaskView:(id)a3
{
  sub_247C89FCC((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView, (void (*)(void *))sub_247C8A158);
}

- (SUIAShockwaveIntelligenceSystemLightView)initWithFrame:(CGRect)a3 preferringAudioReactivity:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ShockwaveIntelligenceSystemLightView();
  return -[_UIIntelligenceSystemLightView initWithFrame:preferringAudioReactivity:](&v10, sel_initWithFrame_preferringAudioReactivity_, v4, x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView));
}

@end
