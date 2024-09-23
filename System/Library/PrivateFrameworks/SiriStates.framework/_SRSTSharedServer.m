@implementation _SRSTSharedServer

- (_SRSTSharedState)currentState
{
  return (_SRSTSharedState *)@objc CallServer.currentState.getter((char *)self, (uint64_t)a2, &OBJC_IVAR____SRSTSharedServer_stateMachine);
}

- (void)dealloc
{
  _SRSTSharedServer *v2;

  v2 = self;
  SharedServer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  @objc CallServer.__ivar_destroyer();
}

@end
