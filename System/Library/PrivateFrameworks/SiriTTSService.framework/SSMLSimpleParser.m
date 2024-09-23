@implementation SSMLSimpleParser

- (void)parserDidStartDocument:(id)a3
{
  id v4;
  _TtC14SiriTTSService16SSMLSimpleParser *v5;

  v4 = a3;
  v5 = self;
  sub_19ADEBA50();

}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC14SiriTTSService16SSMLSimpleParser *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v11 = sub_19AE55448();
  v13 = v12;
  if (a5)
    sub_19AE55448();
  if (a6)
    sub_19AE55448();
  v14 = sub_19AE553A0();
  v15 = a3;
  v16 = self;
  sub_19ADEBAA8((uint64_t)v16, v11, v13, v17, v18, v19, v20, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC14SiriTTSService16SSMLSimpleParser)init
{
  return (_TtC14SiriTTSService16SSMLSimpleParser *)sub_19ADEBCA0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
