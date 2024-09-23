@implementation JSSocialProfileCollectionModelResponse

- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4
{
  void (*v6)(id);
  uint64_t v7;
  id v8;
  _TtC16MusicApplication38JSSocialProfileCollectionModelResponse *v9;

  v6 = (void (*)(id))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1352E80, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(id))sub_1D6A9C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_257264(a3, v6);
  sub_5C198((uint64_t)v6, v7);

}

- (_TtC16MusicApplication38JSSocialProfileCollectionModelResponse)initWithRequest:(id)a3
{
  id v3;
  _TtC16MusicApplication38JSSocialProfileCollectionModelResponse *result;

  v3 = a3;
  result = (_TtC16MusicApplication38JSSocialProfileCollectionModelResponse *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSSocialProfileCollectionModelResponse", 55, "init(request:)", 14, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication38JSSocialProfileCollectionModelResponse_appendedModelResults]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication38JSSocialProfileCollectionModelResponse_pendingAppendedItems]);
  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication38JSSocialProfileCollectionModelResponse_profileCollectionItemsDidChangeNotificationObserver]);
  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication38JSSocialProfileCollectionModelResponse_profileCollectionDidAppendItemsNotificationObserver]);
  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication38JSSocialProfileCollectionModelResponse_pendingRequestStateUpdateNotificationObserver]);
  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication38JSSocialProfileCollectionModelResponse_didRemoveFollowerNotificationObserver]);
}

@end
