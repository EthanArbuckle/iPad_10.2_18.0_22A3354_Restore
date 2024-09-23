@implementation StoryAsyncPlayer.AssociatedData

- (_TtCC12PhotosUICore16StoryAsyncPlayerP33_89E403FA1DBB71A40DD90C42439721F414AssociatedData)init
{
  objc_super v4;

  type metadata accessor for PhotosCollectionPreviewPlayer(0);
  sub_1A7ADFAB0();
  v4.receiver = self;
  v4.super_class = (Class)_s14AssociatedDataCMa_0(0);
  return -[StoryAsyncPlayer.AssociatedData init](&v4, sel_init);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self
     + OBJC_IVAR____TtCC12PhotosUICore16StoryAsyncPlayerP33_89E403FA1DBB71A40DD90C42439721F414AssociatedData_previewPlayersList;
  sub_1A67ECCF8(0, &qword_1EE8C63A0, type metadata accessor for PhotosCollectionPreviewPlayer, (uint64_t (*)(uint64_t, uint64_t))off_1E50A9440);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
