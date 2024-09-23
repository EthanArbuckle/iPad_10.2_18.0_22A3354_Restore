@implementation SASPerceptionEntityWrapper

- (SASPerceptionEntityWrapper)init
{
  uint64_t v2;
  objc_class *v3;
  char *v4;
  SASPerceptionEntityWrapper *v5;
  objc_super v7;

  type metadata accessor for PerceptionModelImpl();
  v2 = swift_allocObject();
  v3 = (objc_class *)type metadata accessor for PerceptionEntityWrapper();
  v4 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR___SASPerceptionEntityWrapper_model] = v2;
  v7.receiver = v4;
  v7.super_class = v3;
  v5 = -[SASPerceptionEntityWrapper init](&v7, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)userEngagementStatusWith:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *, _QWORD);
  SASPerceptionEntityWrapper *v6;

  v4 = _Block_copy(a3);
  v5 = (void (*)(_QWORD *, _QWORD))v4[2];
  v6 = self;
  v5(v4, 0);
  _Block_release(v4);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
