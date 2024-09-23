@implementation PXStoryExceptionThrowingSongsProducer

- (id)requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  void *v5;
  PXStoryExceptionThrowingSongsProducer *v6;
  id result;

  v5 = _Block_copy(a4);
  v6 = self;
  _Block_release(v5);
  sub_1A7AE48EC();
  swift_bridgeObjectRelease();
  result = (id)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (unint64_t)logContext
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___PXStoryExceptionThrowingSongsProducer_logContext);
  swift_beginAccess();
  return *v2;
}

- (void)setLogContext:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___PXStoryExceptionThrowingSongsProducer_logContext);
  swift_beginAccess();
  *v4 = a3;
}

- (PXStoryExceptionThrowingSongsProducer)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXStoryExceptionThrowingSongsProducer_logContext) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StoryExceptionThrowingSongsProducer();
  return -[PXStoryExceptionThrowingSongsProducer init](&v3, sel_init);
}

@end
