@implementation CRLMediaItem

- (BOOL)canResetMediaSize
{
  _TtC8Freeform12CRLMediaItem *v2;
  char v3;

  v2 = self;
  v3 = sub_10088AFEC();

  return v3 & 1;
}

- (CGSize)mediaRawPixelSize
{
  double v2;
  double v3;
  CGSize result;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000024, 0x8000000100FAFEC0, "Freeform/CRLMediaItem.swift", 27, 2, 18, 0);
  __break(1u);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBeReplaced
{
  return 1;
}

- (BOOL)isSpatial
{
  return 0;
}

- (void)takePropertiesFromReplacedBoardItem:(id)a3
{
  id v4;
  _TtC8Freeform12CRLMediaItem *v5;

  v4 = a3;
  v5 = self;
  sub_10088B13C(v4);

}

- (BOOL)supportsTogglingShadowAndRoundedCorners
{
  return 1;
}

- (BOOL)supportsTogglingLooping
{
  return 0;
}

+ (float)defaultRoundedCornerAmount
{
  return 10.0;
}

- (BOOL)hasRoundedCorners
{
  float (*v2)(void);
  _TtC8Freeform12CRLMediaItem *v3;
  float v4;

  v2 = *(float (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x4A8);
  v3 = self;
  v4 = v2();

  return v4 != 0.0;
}

- (float)roundedCornerAmount
{
  return 0.0;
}

- (BOOL)isLooping
{
  return *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform12CRLMediaItem_isLooping);
}

- (void)setIsLooping:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform12CRLMediaItem_isLooping) = a3;
}

- (BOOL)isAnimatedImage
{
  return 0;
}

- (id)commandToSetRoundedCornersEnabled:(BOOL)a3
{
  return 0;
}

- (id)commandToSetLoopingEnabled:(BOOL)a3
{
  return 0;
}

- (void)scaleDownSizeToFitWithinSize:(CGSize)a3 board:(id)a4
{
  double height;
  double width;
  id v7;
  _TtC8Freeform12CRLMediaItem *v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = self;
  sub_10088B4F0(width, height);

}

@end
