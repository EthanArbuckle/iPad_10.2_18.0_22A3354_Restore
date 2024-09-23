@implementation UberScrollContainerView

- (_TtC8BookEPUB23UberScrollContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_93C48();
}

- (_TtC8BookEPUB23UberScrollContainerView)initWithFrame:(CGRect)a3
{
  _TtC8BookEPUB23UberScrollContainerView *result;

  result = (_TtC8BookEPUB23UberScrollContainerView *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.UberScrollContainerView", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_paginatingService);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_layoutController);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_viewDocumentMap));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_documentViewMap));
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_scrollDelegate);
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_locationProvider);
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_state);
  v4 = *(_QWORD *)&self->orientation[OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_state];
  v5 = *(_QWORD *)&self->paginatingService[OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_state + 7];
  swift_bridgeObjectRelease(*(_QWORD *)&self->paginatingService[OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_state
                                                              + 15]);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  sub_939E4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_pendingState), *(_QWORD *)&self->orientation[OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_pendingState], *(_QWORD *)&self->paginatingService[OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_pendingState + 7], *(_QWORD *)&self->paginatingService[OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_pendingState + 15]);
  sub_52128((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_paginationCompleteSubscription, (uint64_t *)&unk_3B8E28);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_documentSubscriptions));
  sub_52128((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_bookPaginationSubscription, (uint64_t *)&unk_3B8E28);
  sub_52128((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_updateStateCancellable, (uint64_t *)&unk_3B8E28);
  v6 = (char *)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_log;
  v7 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  id v7;
  _TtC8BookEPUB23UberScrollContainerView *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_scrollDelegate);
  if (Strong)
  {
    v6 = Strong;
    v7 = a3;
    v8 = self;
    sub_13D5F0((unsigned __int8 *)v8);

    swift_unknownObjectRelease(v6);
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC8BookEPUB23UberScrollContainerView *v5;

  v4 = a3;
  v5 = self;
  sub_93EB0();

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC8BookEPUB23UberScrollContainerView *v7;

  v6 = a3;
  v7 = self;
  sub_93F3C(a4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC8BookEPUB23UberScrollContainerView *v5;

  v4 = a3;
  v5 = self;
  sub_93FA4();

}

@end
