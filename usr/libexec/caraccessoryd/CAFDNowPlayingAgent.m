@implementation CAFDNowPlayingAgent

- (_TtC13caraccessoryd19CAFDNowPlayingAgent)initWithCarManager:(id)a3
{
  id v3;
  _TtC13caraccessoryd19CAFDNowPlayingAgent *v4;

  v3 = a3;
  v4 = (_TtC13caraccessoryd19CAFDNowPlayingAgent *)specialized CAFDNowPlayingAgent.init(carManager:)(v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_carManager, a2);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.listener[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier]);
}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4;
  _TtC13caraccessoryd19CAFDNowPlayingAgent *v5;

  v4 = a3;
  v5 = self;
  CAFDNowPlayingAgent.carDidUpdateAccessories(_:)(v4);

}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC13caraccessoryd19CAFDNowPlayingAgent *v7;

  v6 = a3;
  v7 = self;
  CAFDNowPlayingAgent.accessoryDidUpdate(_:receivedAllValues:)(v6, a4);

}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6;
  id v7;
  _TtC13caraccessoryd19CAFDNowPlayingAgent *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  specialized CAFDNowPlayingAgent.carManager(_:didUpdateCurrentCar:)(a4);

}

- (void)nowPlayingService:(id)a3 didUpdateCurrentMediaSourceIdentifier:(id)a4
{
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class **v8;
  BOOL v9;
  objc_class *v10;
  id v11;
  objc_class *v12;
  id v13;
  _TtC13caraccessoryd19CAFDNowPlayingAgent *v14;

  v5 = (objc_class *)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v7 = v6;
  v8 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier);
  v9 = v5 == *(objc_class **)((char *)&self->super.super.isa
                            + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier)
    && v6 == *(objc_class **)&self->super.listener[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier];
  if (v9 || (v10 = v5, (_stringCompareWithSmolCheck(_:_:expecting:)(v5, v6) & 1) != 0))
  {
    v11 = a3;
  }
  else
  {
    v12 = v8[1];
    *v8 = v10;
    v8[1] = v7;
    v13 = a3;
    v14 = self;
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRelease(v12);
    CAFDNowPlayingAgent.lastMediaSourceIdentifier.didset();

  }
  swift_bridgeObjectRelease(v7);

}

- (void)nowPlayingService:(id)a3 didUpdateAlbum:(id)a4
{
  id v5;
  _TtC13caraccessoryd19CAFDNowPlayingAgent *v6;

  v5 = a3;
  v6 = self;
  CAFDNowPlayingAgent.updateNowPlaying()();

}

- (void)nowPlayingService:(id)a3 didUpdateArtwork:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC13caraccessoryd19CAFDNowPlayingAgent *v11;

  v6 = a3;
  v7 = a4;
  v11 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;

  CAFDNowPlayingAgent.updateNowPlaying()();
  outlined consume of Data._Representation(v8, v10);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC13caraccessoryd19CAFDNowPlayingAgent *v7;

  v6 = a3;
  v7 = self;
  CAFDNowPlayingAgent.serviceDidUpdate(_:receivedAllValues:)(v6, a4);

}

- (void)mediaSourceService:(id)a3 didUpdateCurrentFrequency:(unsigned int)a4
{
  id v5;
  _TtC13caraccessoryd19CAFDNowPlayingAgent *v6;

  v5 = a3;
  v6 = self;
  CAFDNowPlayingAgent.updateNowPlaying()();

}

@end
