@implementation _SRSTCallServer

- (_SRSTCallState)currentState
{
  return (_SRSTCallState *)@objc CallServer.currentState.getter((char *)self, (uint64_t)a2, &OBJC_IVAR____SRSTCallServer_stateMachine);
}

- (void)dealloc
{
  _SRSTCallServer *v2;

  v2 = self;
  CallServer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  @objc CallServer.__ivar_destroyer();
}

@end
