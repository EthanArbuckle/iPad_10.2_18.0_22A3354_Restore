@implementation WFLibraryQuery

+ (id)sortedWorkflowsWithQuery:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;

  swift_getObjCClassMetadata();
  v4 = a3;
  static AnyLibraryQuery.sortedWorkflows(query:)(v4, v5, v6, v7, v8, v9, v10, v11);
  v13 = v12;

  return v13;
}

+ (id)sortedWorkflowsWithQuery:(id)a3 sortByName:(BOOL)a4 limit:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  void *v15;

  v6 = a4;
  swift_getObjCClassMetadata();
  v8 = a3;
  static AnyLibraryQuery.sortedWorkflows(query:sortByName:limit:)(v8, v6, a5, v9, v10, v11, v12, v13);
  v15 = v14;

  return v15;
}

+ (id)sortedWorkflowsWithQuery:(id)a3 sortByName:(BOOL)a4 associatedAppBundleIdentifier:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  sub_1C1B0F224();
  swift_getObjCClassMetadata();
  v6 = a3;
  static AnyLibraryQuery.sortedWorkflows(query:sortByName:associatedAppBundleIdentifier:)(v6);
  v8 = v7;

  swift_bridgeObjectRelease();
  return v8;
}

+ (id)sortedWorkflowsWithQuery:(id)a3 sortByName:(BOOL)a4 nameContaining:(id)a5 limit:(int64_t)a6
{
  _BOOL4 v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  void *v17;

  v7 = a4;
  v9 = sub_1C1B0F224();
  v11 = v10;
  swift_getObjCClassMetadata();
  v12 = a3;
  static AnyLibraryQuery.sortedWorkflows(query:sortByName:nameContaining:limit:)(v12, v7, v9, v11, a6, v13, v14, v15);
  v17 = v16;

  swift_bridgeObjectRelease();
  return v17;
}

+ (id)sortedWorkflowsWithQuery:(id)a3 sortByName:(BOOL)a4 nameEqualing:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  sub_1C1B0F224();
  swift_getObjCClassMetadata();
  v6 = a3;
  static AnyLibraryQuery.sortedWorkflows(query:sortByName:nameEqualing:)(v6);
  v8 = v7;

  swift_bridgeObjectRelease();
  return v8;
}

+ (id)sortedWorkflowsWithQuery:(id)a3 hasTombstonedConflicts:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;

  swift_getObjCClassMetadata();
  v5 = a3;
  static AnyLibraryQuery.sortedWorkflows(query:hasTombstonedConflicts:)(v5);
  v7 = v6;

  return v7;
}

+ (id)sortedGroupings
{
  id v2;

  swift_getObjCClassMetadata();
  static AnyLibraryQuery.sortedGroupings()();
  return v2;
}

+ (id)sortedVisibleFolders
{
  id v2;

  swift_getObjCClassMetadata();
  static AnyLibraryQuery.sortedVisibleFolders()();
  return v2;
}

+ (id)deletedFolders
{
  id v2;

  swift_getObjCClassMetadata();
  static AnyLibraryQuery.deletedFolders()();
  return v2;
}

- (int64_t)type
{
  return AnyLibraryQuery.type.getter();
}

- (id)performReturningCollectionsIn:(id)a3 database:(id)a4 error:(id *)a5
{
  return sub_1C185CE64(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id))sub_1C185CD34, (unint64_t *)&qword_1EF6FD9C0);
}

- (id)performReturningShortcutsIn:(id)a3 database:(id)a4 error:(id *)a5
{
  return sub_1C185CE64(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id))sub_1C185CDC8, &qword_1ED1E7380);
}

- (BOOL)isEqual:(id)a3
{
  WFLibraryQuery *v4;
  WFLibraryQuery *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1C1B0F944();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = AnyLibraryQuery.isEqual(_:)((uint64_t)v8);

  sub_1C1606A10((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  WFLibraryQuery *v2;
  int64_t v3;

  v2 = self;
  v3 = AnyLibraryQuery.hash.getter();

  return v3;
}

- (id)copyWithZone:(void *)a3
{
  void *v3;
  _QWORD v5[4];

  AnyLibraryQuery.copy(with:)(v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_1C1B0FC2C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

- (NSString)description
{
  WFLibraryQuery *v2;
  void *v3;

  v2 = self;
  AnyLibraryQuery.description.getter();

  v3 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (WFLibraryQuery)init
{
  AnyLibraryQuery.init()();
}

- (void).cxx_destruct
{
  sub_1C185D48C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___WFLibraryQuery_identity);
  swift_bridgeObjectRelease();
}

@end
