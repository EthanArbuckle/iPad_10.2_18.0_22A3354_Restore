@implementation _SRSTState

+ (_SRSTState)resting
{
  if (one-time initialization token for resting != -1)
    swift_once();
  return (_SRSTState *)(id)static State.resting;
}

+ (_SRSTState)responding
{
  if (one-time initialization token for responding != -1)
    swift_once();
  return (_SRSTState *)(id)static State.responding;
}

+ (_SRSTState)available
{
  if (one-time initialization token for available != -1)
    swift_once();
  return (_SRSTState *)(id)static State.available;
}

+ (_SRSTState)postResponse
{
  if (one-time initialization token for postResponse != -1)
    swift_once();
  return (_SRSTState *)(id)static State.postResponse;
}

- (NSString)name
{
  return (NSString *)@objc CallState.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SRSTState_name);
}

- (NSString)description
{
  return (NSString *)@objc CallState.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SRSTState_name);
}

- (BOOL)isEqual:(id)a3
{
  return @objc CallState.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))State.isEqual(_:));
}

- (int64_t)hash
{
  return @objc CallState.hash.getter();
}

- (id)makeProxy
{
  return @objc CallState.makeProxy()(self, (uint64_t)a2, type metadata accessor for StateProxy, &OBJC_IVAR____SRSTStateProxy_state);
}

- (_SRSTState)init
{
  _SRSTState *result;

  result = (_SRSTState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  @objc CallState.__ivar_destroyer();
}

+ (_SRSTState)disabled
{
  if (one-time initialization token for disabled != -1)
    swift_once();
  return (_SRSTState *)(id)static State.disabled;
}

+ (_SRSTState)analyzing
{
  if (one-time initialization token for analyzing != -1)
    swift_once();
  return (_SRSTState *)(id)static State.analyzing;
}

+ (_SRSTState)understanding
{
  if (one-time initialization token for understanding != -1)
    swift_once();
  return (_SRSTState *)(id)static State.understanding;
}

+ (_SRSTState)processing
{
  if (one-time initialization token for processing != -1)
    swift_once();
  return (_SRSTState *)(id)static State.processing;
}

@end
