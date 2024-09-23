@implementation PFAIImage

- (void)mapEndElementWithState:(id)a3
{
  unsigned int v5;

  v5 = -[PFXDrawablePlacement mode](self->super.super.mPlacement, "mode");
  if (v5 != 5 || (objc_msgSend(a3, "paginatedIsCurrent") & 1) == 0)
    -[PFXImage mapEndElementWithState:forceBoundsComputation:](self, "mapEndElementWithState:forceBoundsComputation:", a3, v5 == 5);
}

@end
