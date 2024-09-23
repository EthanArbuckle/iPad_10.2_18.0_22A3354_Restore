@implementation JSContainerDetailModelRequest

- (_TtC16MusicApplication29JSContainerDetailModelRequest)init
{
  objc_class *ObjectType;
  unsigned __int8 *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = &self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication29JSContainerDetailModelRequest_filterText];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication29JSContainerDetailModelRequest_sortOption] = 13;
  swift_unknownObjectWeakInit(&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication29JSContainerDetailModelRequest_previousResponse], 0);
  *(_QWORD *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication29JSContainerDetailModelRequest_containerDetailViewModel] = 0;
  self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication29JSContainerDetailModelRequest_isCancelled] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[JSContainerDetailModelRequest init](&v6, "init");
}

- (_TtC16MusicApplication29JSContainerDetailModelRequest)initWithCoder:(id)a3
{
  sub_411BB8(a3);
  return 0;
}

- (id)copyWithZone:(void *)a3
{
  _TtC16MusicApplication29JSContainerDetailModelRequest *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;

  v4 = self;
  sub_411CB0((uint64_t)a3, v9);

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
  _TtC16MusicApplication29JSContainerDetailModelRequest *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(__n128);
  __n128 v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1361E20, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = JSViewModelRequestCoordinator.sharedCoordinator.unsafeMutableAddressor();
  v8 = *v7;
  v9 = *(uint64_t (**)(__n128))(*(_QWORD *)*v7 + 144);
  v10 = swift_retain(*v7);
  v11 = v9(v10);
  v12 = (_QWORD *)swift_allocObject(&unk_1361E48, 48, 7);
  v12[2] = v8;
  v12[3] = v11;
  v12[4] = sub_5F278;
  v12[5] = v5;
  v13 = objc_allocWithZone((Class)type metadata accessor for JSContainerDetailModelRequestOperation());
  v14 = sub_41BCD4(v6, (uint64_t)sub_41CEB0, (uint64_t)v12);

  swift_release(v12);
  return v14;
}

- (id)playbackIntentWithStartItemIdentifiers:(id)a3
{
  id v5;
  _TtC16MusicApplication29JSContainerDetailModelRequest *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_411F80(a3);

  return v7;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->filterText[OBJC_IVAR____TtC16MusicApplication29JSContainerDetailModelRequest_filterText]);
  swift_unknownObjectWeakDestroy(&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication29JSContainerDetailModelRequest_previousResponse]);

}

- (id)playbackIntentFor:(id)a3 itemKind:(id)a4 itemProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16MusicApplication29JSContainerDetailModelRequest *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (uint64_t *)MPIdentifierSet.Purpose.Options.catalog.unsafeMutableAddressor();
  v13 = MPModelObject.bestIdentifier(for:)(*v12, 1u);
  if (v14)
  {
    v15 = v13;
    v16 = v14;
    v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD1E0);
    v18 = swift_allocObject(v17, 48, 7);
    *(_OWORD *)(v18 + 16) = xmmword_105B360;
    *(_QWORD *)(v18 + 32) = v15;
    *(_QWORD *)(v18 + 40) = v16;
    v19 = sub_412128(v18, 0);

    swift_bridgeObjectRelease(v18);
  }
  else
  {

    v19 = 0;
  }

  return v19;
}

- (id)requestForDetailFor:(id)a3 kind:(id)a4 requestedProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16MusicApplication29JSContainerDetailModelRequest *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_4F44A4(v8, (uint64_t)v9, (uint64_t)v10);

  return v12;
}

@end
