@implementation PBStackTile

+ (id)imageFormat
{
  return +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", 4007);
}

+ (double)borderWidth
{
  return 15.0;
}

- (void)initializeBackgroundImage
{
  -[PBStackTile setBackgroundColor:](self, "setBackgroundColor:", +[UIColor whiteColor](UIColor, "whiteColor"));
}

- (void)initializeState
{
  *((_BYTE *)&self->super + 104) &= ~2u;
  *((_BYTE *)&self->super + 104) &= ~8u;
}

@end
