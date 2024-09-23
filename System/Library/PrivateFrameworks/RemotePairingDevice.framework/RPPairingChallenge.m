@implementation RPPairingChallenge

- (BOOL)lastAttemptIncorrect
{
  return sub_1CF6AE658() & 1;
}

- (NSNumber)throttledBy
{
  RPPairingChallenge *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1CF6AE69C();

  return (NSNumber *)v3;
}

- (void)answerWithPIN:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  RPPairingChallenge *v7;

  v4 = sub_1CF73EED4();
  v6 = v5;
  v7 = self;
  sub_1CF6AE6D0(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)cancel
{
  RPPairingChallenge *v2;

  v2 = self;
  sub_1CF6AE768();

}

- (RPPairingChallenge)init
{
  RPPairingChallenge.init()();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
