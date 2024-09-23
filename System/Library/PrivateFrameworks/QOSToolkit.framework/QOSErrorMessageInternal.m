@implementation QOSErrorMessageInternal

- (QOSErrorMessageInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[QOSErrorMessageInternal init](&v3, sel_init);
}

+ (id)getObjcInstanceWithConfig:(id)a3 error:(id *)a4 logger:(id)a5 metricsRecorder:(id)a6 defaultAlert:(id)a7
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;

  v10 = _Block_copy(a5);
  v11 = _Block_copy(a6);
  v12 = _Block_copy(a7);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v10;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v11;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v12;
  v16 = (char *)a3;
  v17 = (void *)sub_244E910E4(v16, (uint64_t)sub_244E9150C, v13, (uint64_t)sub_244E9155C, v14, (uint64_t)sub_244E915B0, v15);
  swift_release();
  swift_release();
  swift_release();

  return v17;
}

@end
