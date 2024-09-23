@implementation BKBookReaderInteractionCoordinator

- (void)setWindow:(id)a3
{
  uint64_t v4;
  void *v5;
  BKBookReaderInteractionCoordinator *v6;
  id v7;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKBookReaderInteractionCoordinator_assetViewControllerTracker);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = a3;
  v7 = a3;
  v6 = self;
  sub_10001D394(v5);

}

- (BKBookReaderInteractionCoordinator)initWithWindow:(id)a3
{
  id v4;

  v4 = a3;
  return (BKBookReaderInteractionCoordinator *)BookReaderInteractionCoordinator.init(window:)(a3);
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue((*(id **)((char *)&self->super.isa
                                                               + OBJC_IVAR___BKBookReaderInteractionCoordinator_assetViewControllerTracker))[2]);
}

- (BKBookReaderInteractionCoordinator)init
{
  BKBookReaderInteractionCoordinator *result;

  result = (BKBookReaderInteractionCoordinator *)_swift_stdlib_reportUnimplementedInitializer("Books.BookReaderInteractionCoordinator", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___BKBookReaderInteractionCoordinator_assetViewControllerTracker));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___BKBookReaderInteractionCoordinator_appIntentsInfoTracker));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKBookReaderInteractionCoordinator_interactionManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___BKBookReaderInteractionCoordinator_assetViewControllerTask));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKBookReaderInteractionCoordinator_appIntentsInfoTask));
}

@end
