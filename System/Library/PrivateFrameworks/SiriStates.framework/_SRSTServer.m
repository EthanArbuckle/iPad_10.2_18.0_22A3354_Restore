@implementation _SRSTServer

- (_SRSTState)currentState
{
  return (_SRSTState *)@objc CallServer.currentState.getter((char *)self, (uint64_t)a2, &OBJC_IVAR____SRSTServer_stateMachine);
}

- (void)dealloc
{
  _SRSTServer *v2;

  v2 = self;
  Server.__deallocating_deinit();
}

- (void).cxx_destruct
{
  @objc CallServer.__ivar_destroyer();
}

@end
