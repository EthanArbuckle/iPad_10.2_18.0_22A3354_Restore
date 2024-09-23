@implementation DOCSpotlightCollectionObserver

- (_TtC5Files30DOCSpotlightCollectionObserver)init
{
  _TtC5Files30DOCSpotlightCollectionObserver *result;

  result = (_TtC5Files30DOCSpotlightCollectionObserver *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCSpotlightCollectionObserver", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_100087534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files30DOCSpotlightCollectionObserver_collectionUpdateBlock), *(_QWORD *)&self->oldItemCount[OBJC_IVAR____TtC5Files30DOCSpotlightCollectionObserver_collectionUpdateBlock]);
}

- (void)collectionUpdated
{
  _TtC5Files30DOCSpotlightCollectionObserver *v2;

  v2 = self;
  sub_100261E68();

}

- (void)collectionDidFinishGathering:(id)a3
{
  id v4;
  _TtC5Files30DOCSpotlightCollectionObserver *v5;

  v4 = a3;
  v5 = self;
  sub_10026206C((uint64_t)v4);

}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  _TtC5Files30DOCSpotlightCollectionObserver *v13;
  uint64_t v14;

  v7 = type metadata accessor for DispatchPredicate(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (uint64_t *)((char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = _Block_copy(a4);
  sub_10004F2F0(0, (unint64_t *)&qword_1006456D0, OS_dispatch_queue_ptr);
  v12 = a3;
  v13 = self;
  *v10 = static OS_dispatch_queue.main.getter(v13);
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for DispatchPredicate.onQueue(_:), v7);
  LOBYTE(a3) = _dispatchPreconditionTest(_:)(v10);
  (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v10, v7);
  if ((a3 & 1) != 0)
  {
    -[DOCSpotlightCollectionObserver collectionUpdated](v13, "collectionUpdated");
    _Block_release(v11);

  }
  else
  {
    __break(1u);
  }
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC5Files30DOCSpotlightCollectionObserver *v10;
  uint64_t v11;

  v5 = type metadata accessor for DispatchPredicate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (uint64_t *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10004F2F0(0, (unint64_t *)&qword_1006456D0, OS_dispatch_queue_ptr);
  v9 = a3;
  v10 = self;
  *v8 = static OS_dispatch_queue.main.getter(v10);
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  LOBYTE(self) = _dispatchPreconditionTest(_:)(v8);
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((self & 1) != 0)
  {
    -[DOCSpotlightCollectionObserver collectionUpdated](v10, "collectionUpdated");

  }
  else
  {
    __break(1u);
  }
}

@end
