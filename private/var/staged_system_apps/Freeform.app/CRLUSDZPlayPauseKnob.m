@implementation CRLUSDZPlayPauseKnob

- (BOOL)isPlaying
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLUSDZPlayPauseKnob_isPlaying);
}

- (void)setIsPlaying:(BOOL)a3
{
  int v3;
  _TtC8Freeform20CRLUSDZPlayPauseKnob *v4;

  v3 = *((unsigned __int8 *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLUSDZPlayPauseKnob_isPlaying);
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLUSDZPlayPauseKnob_isPlaying) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1005CA188();

  }
}

- (CRLImage)knobImage
{
  return (CRLImage *)(id)sub_1005CA7F0();
}

- (void)updateHitRegionPath
{
  _TtC8Freeform20CRLUSDZPlayPauseKnob *v2;

  v2 = self;
  sub_1005C9ED8();

}

- (id)createKnobRenderable
{
  _TtC8Freeform20CRLUSDZPlayPauseKnob *v2;
  id v3;

  v2 = self;
  v3 = sub_1005C9FCC();

  return v3;
}

- (_TtC8Freeform20CRLUSDZPlayPauseKnob)initWithType:(unint64_t)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  id v7;
  _TtC8Freeform20CRLUSDZPlayPauseKnob *result;

  v7 = a7;
  result = (_TtC8Freeform20CRLUSDZPlayPauseKnob *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLUSDZPlayPauseKnob", 29, "init(type:position:radius:tag:on:)", 34, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
