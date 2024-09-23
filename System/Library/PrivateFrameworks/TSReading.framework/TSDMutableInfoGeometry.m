@implementation TSDMutableInfoGeometry

- (id)copyWithZone:(_NSZone *)a3
{
  TSDInfoGeometry *v4;
  $CB6DE01367A4C750E2FF2F6D92039807 mFlags;

  v4 = [TSDInfoGeometry alloc];
  mFlags = self->super.mFlags;
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v4, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", *(_BYTE *)&mFlags & 1, (*(unsigned int *)&mFlags >> 1) & 1, (*(unsigned int *)&mFlags >> 2) & 1, (*(unsigned int *)&mFlags >> 3) & 1, self->super.mPosition.x, self->super.mPosition.y, self->super.mSize.width, self->super.mSize.height, self->super.mAngle);
}

- (void)setPosition:(CGPoint)a3
{
  self->super.mPosition = a3;
}

- (void)setSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  uint64_t v7;

  height = a3.height;
  width = a3.width;
  if (a3.width < 0.0 || a3.height < 0.0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMutableInfoGeometry setSize:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInfoGeometry.m"), 539, CFSTR("Attempted to set the size of a TSDInfoGeometry with a negative width or height"));
  }
  self->super.mSize.width = width;
  self->super.mSize.height = height;
}

- (void)setAngle:(double)a3
{
  double v4;

  TSDNormalizeAngleInDegrees(a3);
  self->super.mAngle = v4;
}

- (void)setWidthValid:(BOOL)a3
{
  *(_BYTE *)&self->super.mFlags = *(_BYTE *)&self->super.mFlags & 0xFE | a3;
}

- (void)setHeightValid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->super.mFlags = *(_BYTE *)&self->super.mFlags & 0xFD | v3;
}

- (void)setHorizontalFlip:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->super.mFlags = *(_BYTE *)&self->super.mFlags & 0xFB | v3;
}

- (void)setVerticalFlip:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->super.mFlags = *(_BYTE *)&self->super.mFlags & 0xF7 | v3;
}

- (void)setCenter:(CGPoint)a3
{
  CGFloat y;

  __asm { FMOV            V3.2D, #-0.5 }
  y = a3.y;
  self->super.mPosition = (CGPoint)vaddq_f64((float64x2_t)a3, vmulq_f64((float64x2_t)self->super.mSize, _Q3));
}

- (void)setTransformedBoundsOrigin:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  CGFloat v8;

  y = a3.y;
  x = a3.x;
  -[TSDInfoGeometry transformedBoundsOrigin](self, "transformedBoundsOrigin");
  v7 = TSDSubtractPoints(self->super.mPosition.x, self->super.mPosition.y, v6);
  self->super.mPosition.x = TSDAddPoints(x, y, v7);
  self->super.mPosition.y = v8;
}

@end
