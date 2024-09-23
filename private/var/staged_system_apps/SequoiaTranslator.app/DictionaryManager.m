@implementation DictionaryManager

- (_TtC17SequoiaTranslator17DictionaryManager)init
{
  return (_TtC17SequoiaTranslator17DictionaryManager *)sub_1000A38A8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator17DictionaryManager_availableDictionaries));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator17DictionaryManager_pairAvailability));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator17DictionaryManager_dictionaryManager));

}

@end
