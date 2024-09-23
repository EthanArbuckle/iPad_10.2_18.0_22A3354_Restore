@implementation TSDSimpleTileProvider

- (BOOL)isTargetOpaque
{
  return 0;
}

- (BOOL)canTargetDrawInParallel
{
  return 1;
}

- (void)drawTargetInLayer:(id)a3 context:(CGContext *)a4
{
  objc_msgSend(self->super.mTarget, -[TSDSimpleTileProvider action](self, "action", a3), a4);
}

- (SEL)action
{
  return self->mAction;
}

- (void)setAction:(SEL)a3
{
  self->mAction = a3;
}

@end
