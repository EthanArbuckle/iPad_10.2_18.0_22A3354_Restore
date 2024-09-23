@implementation DiagnosticExtensionFileFinder

- (id)getFileList
{
  uint64_t inited;
  uint64_t v4;
  _TtC28SiriPrivateLearningAnalytics29DiagnosticExtensionFileFinder *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED88E080);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CB848A60;
  v4 = qword_1ED88A670;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = *(_QWORD *)algn_1ED88A668;
  *(_QWORD *)(inited + 32) = qword_1ED88A660;
  *(_QWORD *)(inited + 40) = v6;
  v7 = qword_1ED88A6A0;
  swift_bridgeObjectRetain();
  if (v7 != -1)
    swift_once();
  v8 = *(_QWORD *)algn_1ED88A698;
  *(_QWORD *)(inited + 48) = qword_1ED88A690;
  *(_QWORD *)(inited + 56) = v8;
  swift_bridgeObjectRetain();
  v9 = sub_1CB8423E4(inited);
  swift_setDeallocating();
  swift_arrayDestroy();

  return v9;
}

- (_TtC28SiriPrivateLearningAnalytics29DiagnosticExtensionFileFinder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DiagnosticExtensionFileFinder();
  return -[DiagnosticExtensionFileFinder init](&v3, sel_init);
}

@end
