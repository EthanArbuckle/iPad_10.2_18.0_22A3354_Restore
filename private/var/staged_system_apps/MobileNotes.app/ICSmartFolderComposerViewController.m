@implementation ICSmartFolderComposerViewController

- (ICSmartFolderComposerViewController)initWithCoder:(id)a3
{
  sub_1003C6A2C(a3);
}

- (ICSmartFolderComposerViewController)initWithAccount:(id)a3 smartFolder:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject(&unk_10056E2C8, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v9 = a3;
  v10 = a4;
  return (ICSmartFolderComposerViewController *)sub_1003C6B38(v9, a4, (uint64_t)sub_1003C9988, v8);
}

- (void)viewDidLoad
{
  char *v2;
  id v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  -[ICSmartFolderComposerViewController viewDidLoad](&v6, "viewDidLoad");
  sub_1003C6E38();
  v3 = objc_allocWithZone((Class)ICScrollViewKeyboardResizer);
  v4 = objc_msgSend(v3, "initWithDelegate:", v2, v6.receiver, v6.super_class);
  v5 = *(void **)&v2[OBJC_IVAR___ICSmartFolderComposerViewController_scrollViewKeyboardResizer];
  *(_QWORD *)&v2[OBJC_IVAR___ICSmartFolderComposerViewController_scrollViewKeyboardResizer] = v4;

}

- (void)viewWillAppear:(BOOL)a3
{
  ICSmartFolderComposerViewController *v4;

  v4 = self;
  sub_1003C71BC(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  ICSmartFolderComposerViewController *v4;

  v4 = self;
  sub_1003C7AD4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  void *v6;
  ICSmartFolderComposerViewController *v7;
  objc_super v8;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICSmartFolderComposerViewController_scrollViewKeyboardResizer);
  v7 = self;
  if (v6)
    objc_msgSend(v6, "stopAutoResizing");
  v8.receiver = self;
  v8.super_class = ObjectType;
  -[ICSmartFolderComposerViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);

}

- (void)cancelActionWithSender:(id)a3
{
  uint64_t v5;
  id v6;
  ICSmartFolderComposerViewController *v7;

  v5 = swift_allocObject(&unk_10056DF80, 24, 7);
  swift_unknownObjectWeakInit(v5 + 16, self);
  v6 = a3;
  v7 = self;
  sub_1003C8F8C((uint64_t)v6, v7, v5);

  swift_release(v5);
}

- (void)doneActionWithSender:(id)a3
{
  id v4;
  ICSmartFolderComposerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003C9724();

}

- (ICSmartFolderComposerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  ICSmartFolderComposerViewController *result;

  v4 = a4;
  result = (ICSmartFolderComposerViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.SmartFolderComposerViewController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSmartFolderComposerViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSmartFolderComposerViewController____lazy_storage___cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSmartFolderComposerViewController____lazy_storage___doneBarButtonItem));

  swift_bridgeObjectRelease(*(_QWORD *)&self->$__lazy_storage_$_collectionView[OBJC_IVAR___ICSmartFolderComposerViewController_createTagText]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___ICSmartFolderComposerViewController_discardableTagIdentifiers));
  swift_bridgeObjectRelease(*(_QWORD *)&self->$__lazy_storage_$_collectionView[OBJC_IVAR___ICSmartFolderComposerViewController_folderTitle]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSmartFolderComposerViewController_scrollViewKeyboardResizer));
  swift_release(*(_QWORD *)&self->$__lazy_storage_$_collectionView[OBJC_IVAR___ICSmartFolderComposerViewController_completion]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSmartFolderComposerViewController_tagSelection));

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v3;
  ICSmartFolderComposerViewController *v5;
  char *v6;
  ICSmartFolderComposerViewController *v7;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICSmartFolderComposerViewController_scrollViewKeyboardResizer);
  if (v3)
  {
    v5 = (ICSmartFolderComposerViewController *)a3;
    v7 = self;
    if ((objc_msgSend(v3, "fullyShowingKeyboard") & 1) != 0)
    {
      v6 = sub_1003C5D08();
      objc_msgSend(v6, "endEditing:", 1);

      v5 = v7;
      v7 = (ICSmartFolderComposerViewController *)v6;
    }

  }
}

- (double)consumedBottomAreaForResizer:(id)a3
{
  id v4;
  ICSmartFolderComposerViewController *v5;
  id v6;
  double result;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  v5 = self;
  v6 = -[ICSmartFolderComposerViewController view](v5, "view");
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v6, "safeAreaInsets");
    v10 = v9;

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)keyboardResizerScrollView
{
  ICSmartFolderComposerViewController *v2;
  char *v3;

  v2 = self;
  v3 = sub_1003C5D08();

  return v3;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4;
  ICSmartFolderComposerViewController *v5;
  id v6;
  uint64_t v7;

  v4 = a3;
  v5 = self;
  v6 = sub_1001EC434(&OBJC_IVAR___ICSmartFolderComposerViewController____lazy_storage___cancelBarButtonItem, &selRef_cancelActionWithSender_, 1);
  v7 = swift_allocObject(&unk_10056DF80, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16, v5);
  sub_1003C8F8C((uint64_t)v6, v5, v7);

  swift_release(v7);
}

@end
