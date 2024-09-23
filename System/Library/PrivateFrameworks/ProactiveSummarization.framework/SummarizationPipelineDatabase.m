@implementation SummarizationPipelineDatabase

- (void)dealloc
{
  _TtC22ProactiveSummarization29SummarizationPipelineDatabase *v2;

  v2 = self;
  sub_244C10708();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17_12(*(id *)((char *)&self->super.isa
                                + OBJC_IVAR____TtC22ProactiveSummarization29SummarizationPipelineDatabase_database));
}

- (id)migrations
{
  _TtC22ProactiveSummarization29SummarizationPipelineDatabase *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  sub_244C110E8();

  OUTLINED_FUNCTION_38_6(v3, (unint64_t *)&qword_2543FCB60);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543FCAC0);
  sub_244C12AE4();
  OUTLINED_FUNCTION_24_9();
  v4 = (void *)sub_244C7E3E4();
  OUTLINED_FUNCTION_6_1();
  return v4;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  void *v3;

  sub_244C11200(a3);
  v3 = (void *)sub_244C7E5AC();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_18_6(v3);
}

- (id)databaseHandle
{
  id v2;

  v2 = sub_244C11254();
  return OUTLINED_FUNCTION_18_6(v2);
}

- (_TtC22ProactiveSummarization29SummarizationPipelineDatabase)init
{
  sub_244C122CC();
}

@end
