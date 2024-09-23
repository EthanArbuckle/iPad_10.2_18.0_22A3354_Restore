@implementation TSKModalShieldView

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[TSKModalShieldDelegate shieldViewReceivedTap](self->mDelegate, "shieldViewReceivedTap", a3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[TSKModalShieldDelegate shieldViewReceivedTap](self->mDelegate, "shieldViewReceivedTap", a3, a4);
}

- (TSKModalShieldDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (TSKModalShieldDelegate *)a3;
}

@end
