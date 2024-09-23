@implementation PDPlaceholder

- (PDPlaceholder)init
{
  PDPlaceholder *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDPlaceholder;
  result = -[PDPlaceholder init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->mType = xmmword_22A4D2D80;
  return result;
}

- (void)setIndex:(unsigned int)a3
{
  self->mIndex = a3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setSize:(int)a3
{
  self->mSize = a3;
}

- (void)setOrientation:(int)a3
{
  self->mOrientation = a3;
}

- (int)type
{
  return self->mType;
}

- (unsigned)index
{
  return self->mIndex;
}

- (int)size
{
  return self->mSize;
}

- (void)setBoundsTrack:(int)a3
{
  self->mBoundsTrack = a3;
}

- (int)orientation
{
  return self->mOrientation;
}

- (int)boundsTrack
{
  return self->mBoundsTrack;
}

+ (BOOL)isTextType:(int)a3
{
  return a3 < 8;
}

+ (BOOL)isNonTextType:(int)a3
{
  return (a3 < 0x10) & (0xBE00u >> a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDPlaceholder;
  -[PDPlaceholder description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
