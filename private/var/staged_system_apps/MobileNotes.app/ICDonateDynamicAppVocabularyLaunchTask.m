@implementation ICDonateDynamicAppVocabularyLaunchTask

- (BOOL)shouldAttemptLaunchTask
{
  ICDonateDynamicAppVocabularyLaunchTask *v2;
  char v3;
  _QWORD v5[2];
  char v6;
  ValueMetadata *v7;
  unint64_t v8;

  v2 = self;
  if ((static SiriVocabulary.dynamicVocabularyEnabled.getter() & 1) != 0)
  {
    v7 = &type metadata for NotesFeature;
    v8 = sub_1000199D4();
    v5[0] = "SiriDynamicVocabulary";
    v5[1] = 21;
    v6 = 2;
    v3 = isFeatureEnabled(_:)(v5);
    sub_1000153C0(v5);

  }
  else
  {

    v3 = 0;
  }
  return v3 & 1;
}

- (void)runLaunchTaskWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ICDonateDynamicAppVocabularyLaunchTask *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100012E18(&qword_1005D4680);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10056A160, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10056A188, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1005D9E18;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10056A1B0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1005D72B0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1003439E8((uint64_t)v7, (uint64_t)&unk_1005D72B8, (uint64_t)v12);
  swift_release(v14);
}

- (ICDonateDynamicAppVocabularyLaunchTask)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[ICDonateDynamicAppVocabularyLaunchTask init](&v3, "init");
}

@end
