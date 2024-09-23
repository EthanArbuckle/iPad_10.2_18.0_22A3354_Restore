@implementation ICNoteEditorActionMenu

- (ICNote)note
{
  return (ICNote *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___ICNoteEditorActionMenu_note));
}

- (void)setNote:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_note);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_note) = (Class)a3;
  v3 = a3;

}

- (ICInvitation)invitation
{
  return (ICInvitation *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___ICNoteEditorActionMenu_invitation));
}

- (void)setInvitation:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_invitation);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_invitation) = (Class)a3;
  v3 = a3;

}

- (BOOL)isMathEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_isMathEnabled);
}

- (void)setIsMathEnabled:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_isMathEnabled) = a3;
}

- (ICNoteEditorActionMenuDelegate)delegate
{
  return (ICNoteEditorActionMenuDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICNoteEditorActionMenu_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICNoteEditorActionMenu_delegate, a3);
}

- (ICNAEventReporter)eventReporter
{
  uint64_t Strong;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  ICNoteEditorActionMenu *v8;
  id v9;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR___ICNoteEditorActionMenu_presentingViewController);
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

- (ICNoteEditorActionMenu)initWithNote:(id)a3 invitation:(id)a4 presentingViewController:(id)a5 presentingBarButtonItem:(id)a6 viewControllerManager:(id)a7 delegate:(id)a8 completion:(id)aBlock
{
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  ICNoteEditorActionMenu *v20;
  uint64_t v21;
  id v23;
  id v24;

  v15 = _Block_copy(aBlock);
  if (v15)
  {
    v16 = swift_allocObject(&unk_10056CC28, 24, 7);
    *(_QWORD *)(v16 + 16) = v15;
    v15 = sub_10023B9A0;
  }
  else
  {
    v16 = 0;
  }
  v24 = a3;
  v23 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  swift_unknownObjectRetain(a8);
  v20 = (ICNoteEditorActionMenu *)sub_1003A8EF8(a3, a4, (uint64_t)v17, a6, v19, (uint64_t)a8, (uint64_t)v15, v16);
  sub_100012C50((uint64_t)v15, v16);

  swift_unknownObjectRelease(a8, v21);
  return v20;
}

+ (id)menuWithNote:(id)a3 invitation:(id)a4 presentingViewController:(id)a5 presentingBarButtonItem:(id)a6 viewControllerManager:(id)a7 delegate:(id)a8 completion:(id)aBlock
{
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  Class isa;
  uint64_t v21;
  id v23;
  id v24;
  id v25;

  v14 = _Block_copy(aBlock);
  if (v14)
  {
    v15 = swift_allocObject(&unk_10056CCA0, 24, 7);
    *(_QWORD *)(v15 + 16) = v14;
    v14 = sub_10023B9A0;
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_allocWithZone((Class)type metadata accessor for NoteEditorActionMenu());
  v25 = a3;
  v24 = a4;
  v17 = a5;
  v23 = a6;
  v18 = a7;
  swift_unknownObjectRetain(a8);
  sub_100166B74((uint64_t)v14, v15);
  v19 = sub_1003A8EF8(a3, a4, (uint64_t)v17, a6, v18, (uint64_t)a8, (uint64_t)v14, v15);
  sub_100012C50((uint64_t)v14, v15);
  sub_1003A9088();
  isa = ActionMenuProvider.makeMenu(deferredChildren:)(1).super.super.isa;

  sub_100012C50((uint64_t)v14, v15);
  swift_unknownObjectRelease(a8, v21);
  return isa;
}

+ (id)menuWithNote:(id)a3 invitation:(id)a4 presentingViewController:(id)a5 presentingBarButtonItem:(id)a6 viewControllerManager:(id)a7 deferredChildren:(BOOL)a8 delegate:(id)a9 completion:(id)a10
{
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  Class isa;
  uint64_t v22;
  id v24;
  id v25;
  id v26;

  v15 = _Block_copy(a10);
  if (v15)
  {
    v16 = swift_allocObject(&unk_10056CC78, 24, 7);
    *(_QWORD *)(v16 + 16) = v15;
    v15 = sub_10023B9A0;
  }
  else
  {
    v16 = 0;
  }
  v17 = objc_allocWithZone((Class)type metadata accessor for NoteEditorActionMenu());
  v26 = a3;
  v25 = a4;
  v18 = a5;
  v24 = a6;
  v19 = a7;
  swift_unknownObjectRetain(a9);
  sub_100166B74((uint64_t)v15, v16);
  v20 = sub_1003A8EF8(a3, a4, (uint64_t)v18, a6, v19, (uint64_t)a9, (uint64_t)v15, v16);
  sub_100012C50((uint64_t)v15, v16);
  sub_1003A9088();
  isa = ActionMenuProvider.makeMenu(deferredChildren:)(a8).super.super.isa;

  sub_100012C50((uint64_t)v15, v16);
  swift_unknownObjectRelease(a9, v22);
  return isa;
}

+ (id)deferredActionMenuElementWithNote:(id)a3 invitation:(id)a4 presentingViewController:(id)a5 viewControllerManager:(id)a6 delegate:(id)a7 completion:(id)a8
{
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  Class isa;
  uint64_t v21;
  id v23;

  v13 = _Block_copy(a8);
  if (v13)
  {
    v14 = swift_allocObject(&unk_10056CC50, 24, 7);
    *(_QWORD *)(v14 + 16) = v13;
    v13 = sub_10023B9A0;
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_allocWithZone((Class)type metadata accessor for NoteEditorActionMenu());
  v23 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  swift_unknownObjectRetain(a7);
  sub_100166B74((uint64_t)v13, v14);
  v19 = sub_1003A8EF8(a3, a4, (uint64_t)v17, 0, v18, (uint64_t)a7, (uint64_t)v13, v14);
  sub_100012C50((uint64_t)v13, v14);
  sub_1003A9088();
  isa = ActionMenuProvider.makeDeferredMenuElement()().super.super.isa;

  sub_100012C50((uint64_t)v13, v14);
  swift_unknownObjectRelease(a7, v21);
  return isa;
}

- (id)completion
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_completion))
    return 0;
  v2 = *(_QWORD *)&self->note[OBJC_IVAR___ICNoteEditorActionMenu_completion];
  v6[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_completion);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10023ABC8;
  v6[3] = &unk_10056CBF0;
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
    v4 = (_QWORD *)swift_allocObject(&unk_10056CBD8, 24, 7);
    v4[2] = v5;
    v6 = sub_100206398;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)(char, uint64_t, uint64_t))((char *)self + OBJC_IVAR___ICNoteEditorActionMenu_completion);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_completion);
  v8 = *(_QWORD *)&self->note[OBJC_IVAR___ICNoteEditorActionMenu_completion];
  *v7 = v6;
  v7[1] = (void (*)(char, uint64_t, uint64_t))v4;
  sub_100012C50(v9, v8);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICNoteEditorActionMenu_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICNoteEditorActionMenu_presentingViewController, a3);
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return (UIBarButtonItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___ICNoteEditorActionMenu_presentingBarButtonItem));
}

- (void)setPresentingBarButtonItem:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_presentingBarButtonItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_presentingBarButtonItem) = (Class)a3;
  v3 = a3;

}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___ICNoteEditorActionMenu_viewControllerManager));
}

- (void)setViewControllerManager:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_viewControllerManager);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_viewControllerManager) = (Class)a3;
  v3 = a3;

}

- (void)willShowMenu
{
  ICNoteEditorActionMenu *v2;

  v2 = self;
  sub_1003A5758();

}

- (id)menuSections
{
  ICNoteEditorActionMenu *v2;
  id v3;
  Class isa;

  v2 = self;
  v3 = sub_1003A58D4();

  sub_1000163BC(0, (unint64_t *)&qword_1005D8A30, UIMenuElement_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (ICNoteEditorActionMenu)init
{
  ICNoteEditorActionMenu *result;

  result = (ICNoteEditorActionMenu *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.NoteEditorActionMenu", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1001FDCAC((uint64_t)self + OBJC_IVAR___ICNoteEditorActionMenu_delegate);
  sub_100012C50(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICNoteEditorActionMenu_completion), *(_QWORD *)&self->note[OBJC_IVAR___ICNoteEditorActionMenu_completion]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICNoteEditorActionMenu_presentingViewController);

}

@end
