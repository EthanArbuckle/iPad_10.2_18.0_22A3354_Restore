@implementation PKAppIntentDependencyManager

+ (void)setCoordinator:(id)a3
{
  _OWORD v4[2];
  uint64_t v5;

  sub_1903CFE54();
  swift_unknownObjectRetain();
  sub_1903CFE48();
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  *(_QWORD *)(swift_allocObject() + 16) = a3;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1BF9B0);
  sub_1903CFE3C();
  swift_release();
  swift_release();
  sub_18FDA4878((uint64_t)v4);
  swift_unknownObjectRelease();
}

- (PKAppIntentDependencyManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAppIntentDependencyManager;
  return -[PKAppIntentDependencyManager init](&v3, sel_init);
}

@end
