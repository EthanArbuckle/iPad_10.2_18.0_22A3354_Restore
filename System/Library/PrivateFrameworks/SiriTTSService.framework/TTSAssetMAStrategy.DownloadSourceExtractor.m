@implementation TTSAssetMAStrategy.DownloadSourceExtractor

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtCC14SiriTTSService18TTSAssetMAStrategy23DownloadSourceExtractor *v15;

  v11 = sub_19AE55448();
  v13 = v12;
  if (a5)
    sub_19AE55448();
  if (a6)
    sub_19AE55448();
  sub_19AE553A0();
  v14 = a3;
  v15 = self;
  sub_19ADA4D44((uint64_t)v15, v11, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v10;
  _TtCC14SiriTTSService18TTSAssetMAStrategy23DownloadSourceExtractor *v11;

  sub_19AE55448();
  if (a5)
    sub_19AE55448();
  if (a6)
    sub_19AE55448();
  v10 = a3;
  v11 = self;
  sub_19ADA4E90();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v6;
  _TtCC14SiriTTSService18TTSAssetMAStrategy23DownloadSourceExtractor *v7;

  sub_19AE55448();
  v6 = a3;
  v7 = self;
  sub_19ADA502C();

  swift_bridgeObjectRelease();
}

- (_TtCC14SiriTTSService18TTSAssetMAStrategy23DownloadSourceExtractor)init
{
  return (_TtCC14SiriTTSService18TTSAssetMAStrategy23DownloadSourceExtractor *)sub_19ADA5148();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
