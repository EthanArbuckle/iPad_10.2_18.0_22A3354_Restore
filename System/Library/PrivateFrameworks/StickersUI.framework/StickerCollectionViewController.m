@implementation StickerCollectionViewController

- (_TtP10StickersUI38StickerProvidingViewControllerDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_delegate;
  swift_beginAccess();
  return (_TtP10StickersUI38StickerProvidingViewControllerDelegate_ *)(id)MEMORY[0x2495899B8](v2);
}

- (void)setDelegate:(id)a3
{
  _TtC10StickersUI31StickerCollectionViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_247A5B54C();

  swift_unknownObjectRelease();
}

- (_TtC10StickersUI31StickerCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC10StickersUI31StickerCollectionViewController *)sub_247A4815C(a3);
}

- (void)viewDidLoad
{
  _QWORD *v2;
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for StickerCollectionViewController(0);
  v2 = v11.receiver;
  v3 = -[StickerCollectionViewController viewDidLoad](&v11, sel_viewDidLoad);
  v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v5 = (*(uint64_t (**)(id))((*MEMORY[0x24BEE4EA0] & *v2) + 0x428))(v3);
  (*(void (**)(uint64_t))((*v4 & *v2) + 0x448))(v5);
  sub_247A4942C();
  (*(void (**)(uint64_t, uint64_t))((*v4 & *v2) + 0x430))(v6, v7);
  v8 = objc_msgSend(v2, sel_view, v11.receiver, v11.super_class);
  if (v8)
  {
    v9 = v8;
    type metadata accessor for KeylineView();
    v10 = sub_247A6C484(v9);
    (*(void (**)(_QWORD *))((*v4 & *v2) + 0x3F0))(v10);

  }
  else
  {
    __break(1u);
  }
}

- (void)dealloc
{
  void (*v2)(void);
  _TtC10StickersUI31StickerCollectionViewController *v3;
  objc_super v4;

  v2 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.super.super.isa) + 0x438);
  v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for StickerCollectionViewController(0);
  -[StickerCollectionViewController dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_247A343F8((uint64_t)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_lastAddedStickerIdentifier, &qword_2576D6D40);
  swift_release();
  sub_247A314B0((uint64_t)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_storeType;
  v4 = sub_247A80B18();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_editMenuInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_placeholderImageView));
  sub_247A343F8((uint64_t)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addingStickerIdentifier, &qword_2576D6D40);
  sub_247A343F8((uint64_t)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addingRecentStickerIdentifier, &qword_2576D6D40);
  sub_247A343F8((uint64_t)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_hiddenStickerViewIdentifier, &qword_2576D6D40);
  sub_247A35000(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_completionHandlerWaitingForStickerBound));
  sub_247A35000(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_completionHandlerWaitingForStickerDisplay));
  sub_247A343F8((uint64_t)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_needsMenuPresentationStickerIdentifier, &qword_2576D6D40);
  sub_247A5B6B4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addContextToRun), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addContextToRun), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addContextToRun), *(uint64_t *)((char *)&self->super.super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addContextToRun), *(void **)((char *)&self->super.super._view+ OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addContextToRun), *(void **)((char *)&self->super.super._tabBarItem+ OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addContextToRun));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_animationContextImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_dataSource));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_insertLocationMarker));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_collectionLayout));
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_keyline));
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for StickerCollectionViewController(0);
  v4 = v10.receiver;
  v5 = -[StickerCollectionViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  v6 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v7 = (*(uint64_t (**)(id))((*MEMORY[0x24BEE4EA0] & *v4) + 0x350))(v5);
  (*(void (**)(_QWORD *, _UNKNOWN **))(*(_QWORD *)v7 + 416))(v4, &off_2519198B0);
  swift_release();
  v8 = objc_msgSend(v4, sel_collectionView, v10.receiver, v10.super_class);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, sel_reloadData);

    (*(void (**)(uint64_t))((*v6 & *v4) + 0x1D8))(1);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC10StickersUI31StickerCollectionViewController *v4;

  v4 = self;
  sub_247A49D00(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StickerCollectionViewController(0);
  -[StickerCollectionViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, v3);
}

- (void)viewDidLayoutSubviews
{
  _TtC10StickersUI31StickerCollectionViewController *v2;

  v2 = self;
  sub_247A49F70();

}

- (void)photoPickerDidDismiss
{
  _TtC10StickersUI31StickerCollectionViewController *v2;

  v2 = self;
  sub_247A4A890();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10StickersUI31StickerCollectionViewController *v11;
  uint64_t v12;

  v6 = sub_247A80698();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247A8065C();
  v10 = a3;
  v11 = self;
  sub_247A4E574(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10StickersUI31StickerCollectionViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_247A80698();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247A8065C();
  v10 = a3;
  v11 = self;
  v12 = sub_247A4EAE8(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t (*v23)(_TtC10StickersUI31StickerCollectionViewController *);
  _TtC10StickersUI31StickerCollectionViewController *v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  char *v28;
  void *v29;
  id v31;
  id v32;

  v31 = a6;
  v32 = a3;
  v7 = sub_247A80698();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v31 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v31 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v31 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v31 - v21;
  sub_247A8065C();
  sub_247A8065C();
  sub_247A8065C();
  v23 = *(uint64_t (**)(_TtC10StickersUI31StickerCollectionViewController *))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.super.super.isa)
                                                                                      + 0x388);
  v32 = v32;
  v24 = self;
  LOBYTE(self) = v23(v24);
  v25 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v25(v11, v14, v7);
  if ((self & 1) != 0)
  {
    v26 = sub_247A80674();
    v27 = *(void (**)(char *, uint64_t))(v8 + 8);
    v27(v11, v7);
    if (v26)
      v28 = v14;
    else
      v28 = v17;
  }
  else
  {
    v27 = *(void (**)(char *, uint64_t))(v8 + 8);
    v27(v11, v7);
    v28 = v14;
  }
  v25(v22, v28, v7);

  v27(v14, v7);
  v27(v17, v7);
  v27(v20, v7);
  v29 = (void *)sub_247A80650();
  v27(v22, v7);
  return v29;
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  sub_247A550F0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))MEMORY[0x24BEBCB40], (void (*)(uint64_t))MEMORY[0x24BEBCB30], (void (*)(char *))sub_247A4F72C);
}

- (void)makeStickerFromPhotoPicker
{
  _TtC10StickersUI31StickerCollectionViewController *v2;

  v2 = self;
  sub_247A4FF6C();

}

- (void)handleStickerCreationProgressUpdateNotification:(id)a3
{
  sub_247A550F0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB930], (void (*)(uint64_t))MEMORY[0x24BDCB8E8], (void (*)(char *))sub_247A54A68);
}

- (_TtC10StickersUI31StickerCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC10StickersUI31StickerCollectionViewController *result;

  v3 = a3;
  result = (_TtC10StickersUI31StickerCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10StickersUI31StickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10StickersUI31StickerCollectionViewController *result;

  v4 = a4;
  result = (_TtC10StickersUI31StickerCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)avtStickerRecentRenderedWithIdentifier:(id)a3 localizedDescription:(id)a4 image:(id)a5 url:(id)a6 avatarRecordIdentifier:(id)a7 stickerConfigurationIdentifier:(id)a8
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  _TtC10StickersUI31StickerCollectionViewController *v19;
  uint64_t v20;

  v10 = sub_247A80590();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_247A805FC();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247A805E4();
  sub_247A80554();
  v18 = a5;
  v19 = self;
  sub_247A5CB84((uint64_t)v17);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

- (void)avtStickerRecentStoreDidChange
{
  _TtC10StickersUI31StickerCollectionViewController *v2;

  v2 = self;
  StickerCollectionViewController.avtStickerRecentStoreDidChange()();

}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v6;
  uint64_t (*v7)(void);
  id v8;
  _TtC10StickersUI31StickerCollectionViewController *v9;
  uint64_t v10;

  sub_247A80698();
  v6 = sub_247A80DF4();
  v7 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.super.super.isa) + 0x350);
  v8 = a3;
  v9 = self;
  v10 = v7();
  (*(void (**)(uint64_t))(*(_QWORD *)v10 + 504))(v6);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)handleLongPress:(id)a3
{
  id v4;
  _TtC10StickersUI31StickerCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_247A59BF4(v4);

}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7;
  id v8;
  _TtC10StickersUI31StickerCollectionViewController *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_247A5D46C(v8);

  return v10;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC10StickersUI31StickerCollectionViewController *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_247A5E9E4(v7);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_isPresentingEditMenu) = 1;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  _TtC10StickersUI31StickerCollectionViewController *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  _s10StickersUI31StickerCollectionViewControllerC19editMenuInteraction_011willDismissH3For8animatorySo06UIEdithI0C_So0nH13ConfigurationCSo0nhI9Animating_ptF_0();

  swift_unknownObjectRelease();
}

- (void)handleTap:(id)a3
{
  id v4;
  _TtC10StickersUI31StickerCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_247A5A350(v4);

}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)(char *);
  id v11;
  _TtC10StickersUI31StickerCollectionViewController *v12;
  uint64_t v14;

  v6 = sub_247A80698();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247A8065C();
  v10 = *(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.super.super.isa) + 0x460);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = v10(v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (self & 1) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC10StickersUI31StickerCollectionViewController *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = _s10StickersUI31StickerCollectionViewControllerC17gestureRecognizer_13shouldReceiveSbSo09UIGestureH0C_So7UITouchCtF_0(v6);

  return v9 & 1;
}

@end
