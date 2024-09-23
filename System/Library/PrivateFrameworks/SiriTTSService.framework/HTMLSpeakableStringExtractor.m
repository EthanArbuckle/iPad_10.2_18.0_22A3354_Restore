@implementation HTMLSpeakableStringExtractor

- (void)parser:(id)a3 didStartElement:(id)a4 attributes:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC14SiriTTSService28HTMLSpeakableStringExtractor *v11;

  v7 = sub_19AE55448();
  v9 = v8;
  sub_19AE553A0();
  v10 = a3;
  v11 = self;
  sub_19AD814DC((uint64_t)v11, v7, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(id)a4
{
  id v6;
  _TtC14SiriTTSService28HTMLSpeakableStringExtractor *v7;

  sub_19AE55448();
  v6 = a3;
  v7 = self;
  sub_19AD815E0();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v6;
  _TtC14SiriTTSService28HTMLSpeakableStringExtractor *v7;

  sub_19AE55448();
  v6 = a3;
  v7 = self;
  sub_19AD816E4();

  swift_bridgeObjectRelease();
}

- (_TtC14SiriTTSService28HTMLSpeakableStringExtractor)init
{
  sub_19AD81790();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_76();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
