@implementation ICSelectionStateUtilities

+ (id)selectedNoteObjectIDFromArchive:(id)a3 modernManagedObjectContext:(id)a4 legacyManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)sub_100192FE8(a3, a4, a5);

  return v11;
}

+ (void)updateArchive:(id)a3 forNewViewMode:(int64_t)a4 requiresContainerSelection:(BOOL)a5 requiresObjectSelection:(BOOL)a6 validateContainerSelection:(BOOL)a7 defaultObjectID:(id)a8 modernManagedObjectContext:(id)a9 legacyManagedObjectContext:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  _BOOL4 v18;

  v18 = a6;
  swift_getObjCClassMetadata(a1);
  v14 = a3;
  v15 = a8;
  v16 = a9;
  v17 = a10;
  sub_10018C074(a3, (uint64_t (*)())a4, a5, v18, a7, a8, a9, a10);

}

- (_TtC11MobileNotes25ICSelectionStateUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[ICSelectionStateUtilities init](&v3, "init");
}

@end
