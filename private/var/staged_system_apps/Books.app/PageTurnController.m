@implementation PageTurnController

- (void)quicklyTurnedPagesTimerFired:(id)a3
{
  *(_QWORD *)self->pageTurned = 0;
}

@end
