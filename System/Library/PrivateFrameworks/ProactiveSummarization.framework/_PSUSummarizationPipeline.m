@implementation _PSUSummarizationPipeline

- (_PSUSummarizationPipeline)initWithContactStore:(id)a3
{
  SummarizationPipeline.init(contactStore:)(a3);
}

- (void)processItem:(id)a3
{
  _PSUSummarizationPipeline *v4;
  id v5;

  v5 = a3;
  v4 = self;
  SummarizationPipeline.processItem(_:)((CSSearchableItem)v5);

}

- (void)handleDeletionOfItemsWithIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  Swift::String v8;
  _PSUSummarizationPipeline *v9;

  sub_244C7E5C4();
  sub_244C7E474();
  v6 = v5;
  v9 = self;
  v7 = OUTLINED_FUNCTION_320();
  v8._object = v6;
  SummarizationPipeline.handleDeletionOfItems(withIdentifiers:bundleIdentifier:)((Swift::OpaquePointer)v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (_PSUSummarizationPipeline)init
{
  SummarizationPipeline.init()();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_106_5();
  OUTLINED_FUNCTION_106_5();
  OUTLINED_FUNCTION_187_4(OBJC_IVAR____PSUSummarizationPipeline_contactStore);
  OUTLINED_FUNCTION_187_4(OBJC_IVAR____PSUSummarizationPipeline_summarizer);
  OUTLINED_FUNCTION_187_4(OBJC_IVAR____PSUSummarizationPipeline_urgencyClassifier);
  OUTLINED_FUNCTION_106_5();
  OUTLINED_FUNCTION_106_5();
  OUTLINED_FUNCTION_106_5();

  OUTLINED_FUNCTION_106_5();
}

@end
