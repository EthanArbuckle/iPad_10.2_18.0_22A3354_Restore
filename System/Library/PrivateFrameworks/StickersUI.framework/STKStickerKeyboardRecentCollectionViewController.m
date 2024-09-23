@implementation STKStickerKeyboardRecentCollectionViewController

- (STKStickerKeyboardRecentCollectionViewController)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t ObjectType;
  STKStickerKeyboardRecentCollectionViewController *v7;
  uint64_t v9;

  v2 = sub_247A80B18();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjectType = swift_getObjectType();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEB1200], v2);
  v7 = (STKStickerKeyboardRecentCollectionViewController *)(*(uint64_t (**)(char *, double, double, double, double))(ObjectType + 1024))(v5, 0.0, 0.0, 0.0, 0.0);
  swift_deallocPartialClassInstance();
  return v7;
}

- (STKStickerKeyboardRecentCollectionViewController)initWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  _QWORD *v6;
  STKStickerKeyboardRecentCollectionViewController *result;

  v4 = a3;
  sub_247A805F0();
  v5 = (objc_class *)MEMORY[0x24BEE4B08];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___STKStickerKeyboardRecentCollectionViewController_blankCellUUIDs) = (Class)MEMORY[0x24BEE4B08];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___STKStickerKeyboardRecentCollectionViewController_blankCellIndexPaths) = v5;
  v6 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___STKStickerKeyboardRecentCollectionViewController_previousContainerSize);
  *v6 = 0;
  v6[1] = 0;

  result = (STKStickerKeyboardRecentCollectionViewController *)sub_247A81250();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for StickerKeyboardRecentCollectionViewController();
  v2 = v6.receiver;
  -[StickerCollectionViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  STKStickerKeyboardRecentCollectionViewController *v2;

  v2 = self;
  sub_247A70F30();

}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_247A80698();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247A8065C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___STKStickerKeyboardRecentCollectionViewController_moreButtonIdentifier;
  v3 = sub_247A805FC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
