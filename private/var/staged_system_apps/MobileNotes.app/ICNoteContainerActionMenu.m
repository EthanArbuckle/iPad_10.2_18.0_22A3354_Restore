@implementation ICNoteContainerActionMenu

- (ICAccount)account
{
  return (ICAccount *)sub_1002E1548((uint64_t)self, (uint64_t)a2, ICAccount_ptr);
}

- (NSManagedObjectContext)context
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICNoteContainerActionMenu_context));
}

- (void)setContext:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_context);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_context) = (Class)a3;
  v3 = a3;

}

- (ICNAEventReporter)eventReporter
{
  uint64_t Strong;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  ICNoteContainerActionMenu *v8;
  id v9;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR___ICNoteContainerActionMenu_presentingViewController);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = objc_opt_self(ICNAViewController);
    v6 = swift_dynamicCastObjCClass(v4, v5);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = self;
      v9 = objc_msgSend(v7, "eventReporter");

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return (ICNAEventReporter *)v9;
}

- (ICFolder)folder
{
  return (ICFolder *)sub_1002E1548((uint64_t)self, (uint64_t)a2, ICFolder_ptr);
}

- (ICVirtualSmartFolderItemIdentifier)recentlyDeletedMathNotesFolder
{
  return (ICVirtualSmartFolderItemIdentifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR___ICNoteContainerActionMenu_recentlyDeletedMathNotesFolder));
}

- (void)setRecentlyDeletedMathNotesFolder:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_recentlyDeletedMathNotesFolder);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_recentlyDeletedMathNotesFolder) = (Class)a3;
  v3 = a3;

}

- (ICNoteContainer)noteContainer
{
  return (ICNoteContainer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___ICNoteContainerActionMenu_noteContainer));
}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___ICNoteContainerActionMenu_viewControllerManager));
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  return (ICVirtualSmartFolderItemIdentifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR___ICNoteContainerActionMenu_virtualSmartFolder));
}

- (ICNoteContainerActionMenu)initWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ICNoteContainerActionMenu *v17;

  v11 = _Block_copy(a7);
  if (v11)
  {
    v12 = swift_allocObject(&unk_100566308, 24, 7);
    *(_QWORD *)(v12 + 16) = v11;
    v11 = sub_10023B9A0;
  }
  else
  {
    v12 = 0;
  }
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (ICNoteContainerActionMenu *)sub_1002E2464(v13, (uint64_t)v14, a5, v16, (uint64_t)v11, v12);
  sub_100012C50((uint64_t)v11, v12);

  return v17;
}

+ (id)menuWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  void *v12;
  uint64_t v13;
  uint64_t (*v14)(id, id, id, id, void *, uint64_t);
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  Class isa;

  v12 = _Block_copy(a7);
  if (v12)
  {
    v13 = swift_allocObject(&unk_1005663A8, 24, 7);
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_10023B9A0;
  }
  else
  {
    v13 = 0;
  }
  v14 = *(uint64_t (**)(id, id, id, id, void *, uint64_t))(swift_getObjCClassMetadata(a1) + 216);
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  sub_100166B74((uint64_t)v12, v13);
  v23 = (void *)v14(v19, v20, a5, v22, v12, v13);
  type metadata accessor for NoteContainerActionMenu();
  sub_1002E27A8();
  isa = ActionMenuProvider.makeMenu(deferredChildren:)(1).super.super.isa;

  sub_100012C50((uint64_t)v12, v13);
  return isa;
}

+ (id)menuWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 deferredChildren:(BOOL)a7 completion:(id)a8
{
  void *v13;
  uint64_t v14;
  uint64_t (*v15)(id, id, id, id, void *, uint64_t);
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  Class isa;

  v13 = _Block_copy(a8);
  if (v13)
  {
    v14 = swift_allocObject(&unk_100566380, 24, 7);
    *(_QWORD *)(v14 + 16) = v13;
    v13 = sub_10023B9A0;
  }
  else
  {
    v14 = 0;
  }
  v15 = *(uint64_t (**)(id, id, id, id, void *, uint64_t))(swift_getObjCClassMetadata(a1) + 216);
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  sub_100166B74((uint64_t)v13, v14);
  v24 = (void *)v15(v20, v21, a5, v23, v13, v14);
  type metadata accessor for NoteContainerActionMenu();
  sub_1002E27A8();
  isa = ActionMenuProvider.makeMenu(deferredChildren:)(a7).super.super.isa;

  sub_100012C50((uint64_t)v13, v14);
  return isa;
}

- (ICNoteContainerActionMenu)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ICNoteContainerActionMenu *v17;

  v11 = _Block_copy(a7);
  if (v11)
  {
    v12 = swift_allocObject(&unk_1005662E0, 24, 7);
    *(_QWORD *)(v12 + 16) = v11;
    v11 = sub_10023B9A0;
  }
  else
  {
    v12 = 0;
  }
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (ICNoteContainerActionMenu *)sub_1002E25F4(v13, (uint64_t)v14, a5, v16, (uint64_t)v11, v12);
  sub_100012C50((uint64_t)v11, v12);

  return v17;
}

+ (id)menuWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  void *v12;
  uint64_t v13;
  uint64_t (*v14)(id, id, id, id, void *, uint64_t);
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  Class isa;

  v12 = _Block_copy(a7);
  if (v12)
  {
    v13 = swift_allocObject(&unk_100566358, 24, 7);
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_10023B9A0;
  }
  else
  {
    v13 = 0;
  }
  v14 = *(uint64_t (**)(id, id, id, id, void *, uint64_t))(swift_getObjCClassMetadata(a1) + 224);
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  sub_100166B74((uint64_t)v12, v13);
  v23 = (void *)v14(v19, v20, a5, v22, v12, v13);
  type metadata accessor for NoteContainerActionMenu();
  sub_1002E27A8();
  isa = ActionMenuProvider.makeMenu(deferredChildren:)(1).super.super.isa;

  sub_100012C50((uint64_t)v12, v13);
  return isa;
}

+ (id)menuWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 deferredChildren:(BOOL)a7 completion:(id)a8
{
  void *v13;
  uint64_t v14;
  uint64_t (*v15)(id, id, id, id, void *, uint64_t);
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  Class isa;

  v13 = _Block_copy(a8);
  if (v13)
  {
    v14 = swift_allocObject(&unk_100566330, 24, 7);
    *(_QWORD *)(v14 + 16) = v13;
    v13 = sub_10023B9A0;
  }
  else
  {
    v14 = 0;
  }
  v15 = *(uint64_t (**)(id, id, id, id, void *, uint64_t))(swift_getObjCClassMetadata(a1) + 224);
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  sub_100166B74((uint64_t)v13, v14);
  v24 = (void *)v15(v20, v21, a5, v23, v13, v14);
  type metadata accessor for NoteContainerActionMenu();
  sub_1002E27A8();
  isa = ActionMenuProvider.makeMenu(deferredChildren:)(a7).super.super.isa;

  sub_100012C50((uint64_t)v13, v14);
  return isa;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICNoteContainerActionMenu_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICNoteContainerActionMenu_presentingViewController, a3);
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return (UIBarButtonItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___ICNoteContainerActionMenu_presentingBarButtonItem));
}

- (id)completion
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_completion))
    return 0;
  v2 = *(_QWORD *)&self->context[OBJC_IVAR___ICNoteContainerActionMenu_completion];
  v6[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_completion);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10023ABC8;
  v6[3] = &unk_1005662A8;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setCompletion:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void (*v6)(char, uint64_t, uint64_t);
  void (**v7)(char, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_100566290, 24, 7);
    v4[2] = v5;
    v6 = sub_100206398;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)(char, uint64_t, uint64_t))((char *)self + OBJC_IVAR___ICNoteContainerActionMenu_completion);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_completion);
  v8 = *(_QWORD *)&self->context[OBJC_IVAR___ICNoteContainerActionMenu_completion];
  *v7 = v6;
  v7[1] = (void (*)(char, uint64_t, uint64_t))v4;
  sub_100012C50(v9, v8);
}

- (id)menuSections
{
  ICNoteContainerActionMenu *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_1002DED28();

  sub_1000163BC(0, (unint64_t *)&qword_1005D8A30, UIMenuElement_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (id)mainSectionMenu
{
  ICNoteContainerActionMenu *v2;
  id v3;

  v2 = self;
  v3 = sub_1002DEFC0();

  return v3;
}

- (id)smartFolderSectionMenu
{
  ICNoteContainerActionMenu *v2;
  id v3;

  v2 = self;
  v3 = sub_1002DEEF4();

  return v3;
}

- (id)debugSectionMenu
{
  ICNoteContainerActionMenu *v2;
  Class isa;

  v2 = self;
  isa = sub_1002DF1B4().super.super.isa;

  return isa;
}

- (ICNoteContainerActionMenu)init
{
  ICNoteContainerActionMenu *result;

  result = (ICNoteContainerActionMenu *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.NoteContainerActionMenu", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICNoteContainerActionMenu_presentingViewController);
  sub_100012C50(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_completion), *(_QWORD *)&self->context[OBJC_IVAR___ICNoteContainerActionMenu_completion]);
}

@end
