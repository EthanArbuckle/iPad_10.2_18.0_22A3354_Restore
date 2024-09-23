@implementation CoreDataLibrary

- (PKSubscriptionController)subscriptionController
{
  _TtC11PodcastsKit15CoreDataLibrary *v2;
  id v3;

  v2 = self;
  v3 = sub_22FB288E4();

  return (PKSubscriptionController *)v3;
}

- (void)setSubscriptionController:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11PodcastsKit15CoreDataLibrary____lazy_storage___subscriptionController) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)fetchMatchesFor:(id)a3 limit:(int64_t)a4 resultsHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC11PodcastsKit15CoreDataLibrary *v11;

  v7 = _Block_copy(a5);
  v8 = sub_22FB37B18();
  v10 = v9;
  _Block_copy(v7);
  v11 = self;
  sub_22FB2946C(v8, v10, a4, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (_TtC11PodcastsKit15CoreDataLibrary)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11PodcastsKit15CoreDataLibrary____lazy_storage___subscriptionController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CoreDataLibrary();
  return -[CoreDataLibrary init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
