@implementation TTSVBDataStore

- (void)handleManagedObjectContextDidChange:(id)a3
{
  id v4;
  _TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore *v5;

  v4 = a3;
  v5 = self;
  sub_24877B27C(v4);

}

- (void)handleManagedObjectContextDidMergeChangesObjectIDs:(id)a3
{
  id v4;
  _TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore *v5;

  v4 = a3;
  v5 = self;
  sub_248774B50(v4);

}

- (void)handlePersistentCloudKitContainerEventChanged:(id)a3
{
  id v4;
  _TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore *v5;

  v4 = a3;
  v5 = self;
  sub_248774DC0();

}

- (void)handleWillResetCloudSync:(id)a3
{
  id v4;
  _TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore *v5;

  v4 = a3;
  v5 = self;
  sub_24877B804(v4, " *** Will reset Cloud sync. Reason=%s");

}

- (void)handleDidResetCloudSync:(id)a3
{
  id v4;
  _TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore *v5;

  v4 = a3;
  v5 = self;
  sub_24877B804(v4, " *** Did finish reset Cloud sync. Reason=%s");

}

- (void)handlePersistentStoreRemoteChange:(id)a3
{
  id v4;
  _TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore *v5;

  v4 = a3;
  v5 = self;
  sub_248775620();

}

- (_TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore)init
{
  _TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore *result;

  result = (_TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore_voiceBankingRootURL;
  v4 = sub_2487B50CC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore_calloutQueue));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2486F5008((uint64_t)self+ OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore____lazy_storage___cloudDatastoreURL, &qword_25445ED28);
  sub_2486F5008((uint64_t)self+ OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore____lazy_storage___localDatastoreURL, &qword_25445ED28);
  sub_2486F5008((uint64_t)self+ OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore____lazy_storage___managedObjectModelURL, &qword_25445ED28);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore____lazy_storage___container));
  sub_2486F5008((uint64_t)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport14TTSVBDataStore_queue_loadError, &qword_25445ED50);
  swift_bridgeObjectRelease();
}

@end
