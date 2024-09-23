@implementation BookActionMediator

- (_TtC5Books18BookActionMediator)init
{
  _TtC5Books18BookActionMediator *result;

  result = (_TtC5Books18BookActionMediator *)_swift_stdlib_reportUnimplementedInitializer("Books.BookActionMediator", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18BookActionMediator_actionMenuState));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books18BookActionMediator_paginationService));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books18BookActionMediator_currentLocationProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books18BookActionMediator_currentLocationController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books18BookActionMediator_orientationLockHandler));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books18BookActionMediator_readingLoupeProvider));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC5Books18BookActionMediator_pageTurnController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18BookActionMediator_cancellables));
}

@end
