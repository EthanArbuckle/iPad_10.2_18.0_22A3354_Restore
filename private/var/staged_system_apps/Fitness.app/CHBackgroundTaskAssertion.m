@implementation CHBackgroundTaskAssertion

- (CHBackgroundTaskAssertion)init
{
  char *v2;
  objc_super v4;

  v2 = (char *)self + OBJC_IVAR___CHBackgroundTaskAssertion_identifier;
  *(_QWORD *)v2 = 0;
  v2[8] = 1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CHBackgroundTaskAssertion_state) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BackgroundTaskAssertion();
  return -[CHBackgroundTaskAssertion init](&v4, "init");
}

- (void)activate
{
  CHBackgroundTaskAssertion *v2;

  v2 = self;
  sub_10026586C();

}

- (void)invalidate
{
  CHBackgroundTaskAssertion *v2;

  v2 = self;
  sub_10000DBD0();

}

@end
