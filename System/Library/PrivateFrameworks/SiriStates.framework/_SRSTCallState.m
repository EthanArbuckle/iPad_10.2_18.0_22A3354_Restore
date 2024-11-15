@implementation _SRSTCallState

+ (_SRSTCallState)ongoingCall
{
  if (one-time initialization token for ongoingCall != -1)
    swift_once();
  return (_SRSTCallState *)(id)static CallState.ongoingCall;
}

+ (_SRSTCallState)micMutedCall
{
  if (one-time initialization token for micMutedCall != -1)
    swift_once();
  return (_SRSTCallState *)(id)static CallState.micMutedCall;
}

+ (_SRSTCallState)noCall
{
  if (one-time initialization token for noCall != -1)
    swift_once();
  return (_SRSTCallState *)(id)static CallState.noCall;
}

+ (_SRSTCallState)onHoldCall
{
  if (one-time initialization token for onHoldCall != -1)
    swift_once();
  return (_SRSTCallState *)(id)static CallState.onHoldCall;
}

- (NSString)name
{
  return (NSString *)@objc CallState.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SRSTCallState_name);
}

- (NSString)description
{
  return (NSString *)@objc CallState.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SRSTCallState_name);
}

- (BOOL)isEqual:(id)a3
{
  return @objc CallState.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CallState.isEqual(_:));
}

- (int64_t)hash
{
  return @objc CallState.hash.getter();
}

- (id)makeProxy
{
  return @objc CallState.makeProxy()(self, (uint64_t)a2, type metadata accessor for CallStateProxy, &OBJC_IVAR____SRSTCallStateProxy_state);
}

- (_SRSTCallState)init
{
  _SRSTCallState *result;

  result = (_SRSTCallState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  @objc CallState.__ivar_destroyer();
}

@end
