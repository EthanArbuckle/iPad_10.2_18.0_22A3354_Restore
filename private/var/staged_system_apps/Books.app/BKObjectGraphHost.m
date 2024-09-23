@implementation BKObjectGraphHost

- (BKObjectGraphHost)init
{
  uint64_t v3;
  BKObjectGraphHost *v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v3 = OBJC_IVAR___BKObjectGraphHost_dependenciesPromise;
  sub_10004CFD4(&qword_1009CEEF8);
  v4 = self;
  v5 = (objc_class *)Promise.__allocating_init()();
  *(Class *)((char *)&self->super.isa + v3) = v5;
  v6 = swift_retain(v5);
  v7 = sub_100676BDC(v6);
  swift_release(v5);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___BKObjectGraphHost_objectGraph) = (Class)v7;

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for ObjectGraphHost();
  return -[BKObjectGraphHost init](&v9, "init");
}

- (void)resolveAsyncDependenciesWithLibraryItemStateProvider:(id)a3 downloadProgressCenter:(id)a4 assetActionHandler:(id)a5 figaroPageContextProvider:(id)a6 sceneManager:(id)a7 serviceCenter:(id)a8
{
  id v15;
  id v16;
  id v17;
  BKObjectGraphHost *v18;

  swift_unknownObjectRetain(a3);
  v15 = a4;
  swift_unknownObjectRetain(a5);
  swift_unknownObjectRetain(a6);
  v16 = a7;
  v17 = a8;
  v18 = self;
  ObjectGraphHost.resolveAsyncDependencies(libraryItemStateProvider:downloadProgressCenter:assetActionHandler:figaroPageContextProvider:sceneManager:serviceCenter:)((uint64_t)a3, v15, (uint64_t)a5, (uint64_t)a6, v16, v17);
  swift_unknownObjectRelease(a3);

  swift_unknownObjectRelease(a5);
  swift_unknownObjectRelease(a6);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKObjectGraphHost_objectGraph));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKObjectGraphHost_dependenciesPromise));
}

@end
