@implementation JSSocialProfileModelRequest

- (_TtC16MusicApplication27JSSocialProfileModelRequest)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication27JSSocialProfileModelRequest_profile] = 0;
  *(_QWORD *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication27JSSocialProfileModelRequest_previousResponse] = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[JSSocialProfileModelRequest init](&v5, "init");
}

- (_TtC16MusicApplication27JSSocialProfileModelRequest)initWithCoder:(id)a3
{
  uint64_t ObjectType;

  ObjectType = swift_getObjectType();
  *(_QWORD *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication27JSSocialProfileModelRequest_profile] = 0;
  *(_QWORD *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication27JSSocialProfileModelRequest_previousResponse] = 0;
  swift_deallocPartialClassInstance(self, ObjectType, 24, 7);
  return 0;
}

- (id)copyWithZone:(void *)a3
{
  _TtC16MusicApplication27JSSocialProfileModelRequest *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;

  v4 = self;
  sub_B468F8((uint64_t)a3, v9);

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
  _TtC16MusicApplication27JSSocialProfileModelRequest *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(__n128);
  __n128 v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_13A2368, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = JSViewModelRequestCoordinator.sharedCoordinator.unsafeMutableAddressor();
  v8 = *v7;
  v9 = *(uint64_t (**)(__n128))(*(_QWORD *)*v7 + 144);
  v10 = swift_retain();
  v11 = v9(v10);
  v12 = (_QWORD *)swift_allocObject(&unk_13A2390, 48, 7);
  v12[2] = v8;
  v12[3] = v11;
  v12[4] = sub_5F278;
  v12[5] = v5;
  v13 = objc_allocWithZone((Class)type metadata accessor for JSSocialProfileModelRequestOperation());
  v14 = sub_B474FC(v6, (uint64_t)sub_B474F0, (uint64_t)v12);

  swift_release();
  return v14;
}

- (void).cxx_destruct
{

}

@end
