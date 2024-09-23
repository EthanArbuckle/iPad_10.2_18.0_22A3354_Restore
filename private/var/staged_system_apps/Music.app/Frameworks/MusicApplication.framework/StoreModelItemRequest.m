@implementation StoreModelItemRequest

- (_TtC16MusicApplication21StoreModelItemRequest)init
{
  objc_super v3;

  *(_QWORD *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication21StoreModelItemRequest_model] = 0;
  self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication21StoreModelItemRequest_preventStoreItemMetadataCaching] = 2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StoreModelItemRequest();
  return -[StoreModelItemRequest init](&v3, "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC16MusicApplication21StoreModelItemRequest)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication21StoreModelItemRequest *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication21StoreModelItemRequest *)sub_209EA0((uint64_t)v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  char *v5;
  id v6;
  NSString v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for StoreModelItemRequest();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[StoreModelItemRequest encodeWithCoder:](&v8, "encodeWithCoder:", v4);
  v6 = *(id *)&v5[OBJC_IVAR____TtC16MusicApplication21StoreModelItemRequest_model];
  v7 = String._bridgeToObjectiveC()();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v7, v8.receiver, v8.super_class);

}

- (id)copyWithZone:(void *)a3
{
  _TtC16MusicApplication21StoreModelItemRequest *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;

  v4 = self;
  sub_208224((uint64_t)a3, v9);

  v5 = v10;
  v6 = __swift_project_boxed_opaque_existential_1(v9, v10);
  v7 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v6, v5);
  __swift_destroy_boxed_opaque_existential_1(v9);
  return v7;
}

+ (BOOL)requiresNetwork
{
  return 1;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC16MusicApplication21StoreModelItemRequest *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(__n128);
  __n128 v10;
  id result;
  int v12;
  id v13;
  char v14;
  _QWORD *v15;
  id v16;
  id v17;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1350428, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = JSViewModelRequestCoordinator.sharedCoordinator.unsafeMutableAddressor();
  v8 = *v7;
  v9 = *(uint64_t (**)(__n128))(*(_QWORD *)*v7 + 144);
  v10 = swift_retain(*v7);
  result = (id)v9(v10);
  v12 = v6->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication21StoreModelItemRequest_preventStoreItemMetadataCaching];
  if (v12 == 2)
  {
    __break(1u);
  }
  else
  {
    v13 = result;
    v14 = v12 & 1;
    v15 = (_QWORD *)swift_allocObject(&unk_1350450, 48, 7);
    v15[2] = v8;
    v15[3] = v13;
    v15[4] = sub_5F278;
    v15[5] = v5;
    v16 = objc_allocWithZone((Class)type metadata accessor for StoreModelItemRequestOperation());
    v17 = sub_209F74(v6, v14, (uint64_t)sub_209E94, (uint64_t)v15);

    swift_release(v15);
    return v17;
  }
  return result;
}

- (void).cxx_destruct
{

}

@end
