@implementation MTMAPIResponseDatabaseObjectProvider

- (_TtP18PodcastsFoundation42MAPIResponseDatabaseObjectProviderDelegate_)delegate
{
  swift_beginAccess();
  return (_TtP18PodcastsFoundation42MAPIResponseDatabaseObjectProviderDelegate_ *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___MTMAPIResponseDatabaseObjectProvider_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (MTMAPIResponseDatabaseObjectProvider)initWithResponse:(id)a3
{
  MTMAPIResponseDatabaseObjectProvider *v4;

  swift_unknownObjectRetain();
  v4 = (MTMAPIResponseDatabaseObjectProvider *)sub_1A91DB748((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (id)databaseObjectWithStoreID:(int64_t)a3 contentType:(int64_t)a4
{
  MTMAPIResponseDatabaseObjectProvider *v6;
  void *v7;

  v6 = self;
  v7 = sub_1A91DA1B8(a3, a4);

  return v7;
}

- (void)controllerDidChangeContent:(id)a3
{
  id *v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___MTMAPIResponseDatabaseObjectProvider_needsParsing) = 1;
  v3 = (id *)((char *)&self->super.isa + OBJC_IVAR___MTMAPIResponseDatabaseObjectProvider_delegate);
  swift_beginAccess();
  if (*v3)
    objc_msgSend(*v3, sel_mapiResponseDatabaseObjectsDidChange);
}

- (MTMAPIResponseDatabaseObjectProvider)init
{
  MTMAPIResponseDatabaseObjectProvider *result;

  result = (MTMAPIResponseDatabaseObjectProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end
