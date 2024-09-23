@implementation StorePurchaseTask

- (_TtC18PodcastsFoundation17StorePurchaseTask)init
{
  char *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation17StorePurchaseTask_uiDelegate;
  v4 = (objc_class *)type metadata accessor for StorePurchaseTask();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[StorePurchaseTask init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_1A905FD54((uint64_t)self + OBJC_IVAR____TtC18PodcastsFoundation17StorePurchaseTask_uiDelegate, &qword_1ED2A2EB8);
}

@end
