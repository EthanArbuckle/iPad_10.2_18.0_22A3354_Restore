@implementation JSShelfModelRequest

- (_TtC16MusicApplication19JSShelfModelRequest)init
{
  objc_super v3;

  *(_QWORD *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication19JSShelfModelRequest_shelfViewModel] = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JSShelfModelRequest();
  return -[JSShelfModelRequest init](&v3, "init");
}

- (_TtC16MusicApplication19JSShelfModelRequest)initWithCoder:(id)a3
{
  uint64_t v4;

  *(_QWORD *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication19JSShelfModelRequest_shelfViewModel] = 0;
  v4 = type metadata accessor for JSShelfModelRequest();
  swift_deallocPartialClassInstance(self, v4, 16, 7);
  return 0;
}

- (id)copyWithZone:(void *)a3
{
  _TtC16MusicApplication19JSShelfModelRequest *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;

  v4 = self;
  sub_670A60((uint64_t)a3, v9);

  v5 = v10;
  v6 = __swift_project_boxed_opaque_existential_1(v9, v10);
  v7 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v6, v5);
  __swift_destroy_boxed_opaque_existential_1(v9);
  return v7;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC16MusicApplication19JSShelfModelRequest *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(__n128);
  __n128 v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_13775E0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = JSViewModelRequestCoordinator.sharedCoordinator.unsafeMutableAddressor();
  v8 = *v7;
  v9 = *(uint64_t (**)(__n128))(*(_QWORD *)*v7 + 144);
  v10 = swift_retain(*v7);
  v11 = v9(v10);
  v12 = (_QWORD *)swift_allocObject(&unk_1377608, 48, 7);
  v12[2] = v8;
  v12[3] = v11;
  v12[4] = sub_5F278;
  v12[5] = v5;
  v13 = objc_allocWithZone((Class)type metadata accessor for JSShelfModelRequestOperation());
  v14 = sub_672A78(v6, (uint64_t)sub_672A6C, (uint64_t)v12);

  swift_release(v12);
  return v14;
}

- (void).cxx_destruct
{

}

@end
