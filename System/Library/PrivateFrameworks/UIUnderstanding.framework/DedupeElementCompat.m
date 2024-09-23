@implementation DedupeElementCompat

- (UIObjectCompat)uiObject
{
  return (UIObjectCompat *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___DedupeElementCompat_uiObject));
}

- (BOOL)isDuplicate
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___DedupeElementCompat_isDuplicate;
  swift_beginAccess();
  return *v2;
}

- (void)setIsDuplicate:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___DedupeElementCompat_isDuplicate;
  swift_beginAccess();
  *v4 = a3;
}

- (DedupeElementCompat)initWithUiObject:(id)a3 isDuplicate:(BOOL)a4 screenID:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  id v11;
  DedupeElementCompat *v12;
  objc_super v14;

  if (a5)
  {
    v8 = sub_24972CBB8();
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___DedupeElementCompat_screenID);
  *v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DedupeElementCompat_uiObject) = (Class)a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___DedupeElementCompat_isDuplicate) = a4;
  *v10 = v8;
  v10[1] = v9;
  v11 = a3;
  swift_bridgeObjectRelease();
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for DedupeElement();
  v12 = -[DedupeElementCompat init](&v14, sel_init);

  return v12;
}

- (DedupeElementCompat)init
{
  DedupeElementCompat *result;

  result = (DedupeElementCompat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
