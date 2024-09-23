@implementation FRArticleNotificationFeedPersonalizerFactory

- (FRArticleNotificationFeedPersonalizerFactory)initWithTranslationProvider:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FRArticleNotificationFeedPersonalizerFactory_translationProvider) = (Class)a3;
  v7.receiver = self;
  v7.super_class = ObjectType;
  swift_unknownObjectRetain(a3);
  return -[FRArticleNotificationFeedPersonalizerFactory init](&v7, "init");
}

- (id)newFeedPersonalizerWithAggregateStore:(id)a3 appConfigurationManager:(id)a4 todayPrivateData:(id)a5
{
  id v8;
  FRArticleNotificationFeedPersonalizerFactory *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a3;
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  v9 = self;
  v10 = (void *)sub_100007C44(v8, (uint64_t)a4, (uint64_t)a5);

  swift_unknownObjectRelease(a4, v11);
  swift_unknownObjectRelease(a5, v12);

  return v10;
}

- (FRArticleNotificationFeedPersonalizerFactory)init
{
  FRArticleNotificationFeedPersonalizerFactory *result;

  result = (FRArticleNotificationFeedPersonalizerFactory *)_swift_stdlib_reportUnimplementedInitializer("NewsNotificationServiceExtension.ArticleNotificationFeedPersonalizerFactory", 75, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___FRArticleNotificationFeedPersonalizerFactory_translationProvider), a2);
}

@end
