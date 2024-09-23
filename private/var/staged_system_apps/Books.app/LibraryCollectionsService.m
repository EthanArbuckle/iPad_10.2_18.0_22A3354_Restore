@implementation LibraryCollectionsService

- (_TtC5Books25LibraryCollectionsService)init
{
  return (_TtC5Books25LibraryCollectionsService *)sub_10001EC4C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;

  v3 = (char *)self + OBJC_IVAR____TtC5Books25LibraryCollectionsService__defaultCollections;
  v4 = sub_10004CFD4((uint64_t *)&unk_1009DCC90);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC5Books25LibraryCollectionsService__userCollections, v4);
  v6 = (char *)self + OBJC_IVAR____TtC5Books25LibraryCollectionsService__state;
  v7 = sub_10004CFD4(&qword_1009E2848);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  _TtC5Books25LibraryCollectionsService *v5;

  v4 = a3;
  v5 = self;
  sub_10041BF68(v4);

}

@end
