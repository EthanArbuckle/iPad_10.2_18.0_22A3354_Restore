@implementation ICTagsActionMenu

- (ICNAEventReporter)eventReporter
{
  uint64_t Strong;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  ICTagsActionMenu *v8;
  id v9;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR___ICTagsActionMenu_presentingViewController);
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

- (ICTagSelection)tagSelection
{
  return (ICTagSelection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___ICTagsActionMenu_tagSelection));
}

- (ICTagsActionMenuDelegate)delegate
{
  return (ICTagsActionMenuDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICTagsActionMenu_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICTagsActionMenu_delegate, a3);
}

- (ICTagsActionMenu)initWithTagSelection:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 delegate:(id)a7 completion:(id)a8
{
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  ICTagsActionMenu *v19;
  uint64_t v20;

  v13 = _Block_copy(a8);
  if (v13)
  {
    v14 = swift_allocObject(&unk_100560610, 24, 7);
    *(_QWORD *)(v14 + 16) = v13;
    v13 = sub_10023B9A0;
  }
  else
  {
    v14 = 0;
  }
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  swift_unknownObjectRetain(a7);
  v19 = (ICTagsActionMenu *)sub_10023B7D4(v15, (uint64_t)v16, a5, v18, (uint64_t)a7, (uint64_t)v13, v14);
  sub_100012C50((uint64_t)v13, v14);

  swift_unknownObjectRelease(a7, v20);
  return v19;
}

+ (id)menuWithTagSelection:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 delegate:(id)a7 completion:(id)a8
{
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  Class isa;
  uint64_t v23;

  v14 = _Block_copy(a8);
  if (v14)
  {
    v15 = swift_allocObject(&unk_100560660, 24, 7);
    *(_QWORD *)(v15 + 16) = v14;
    v14 = sub_10023B9A0;
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_allocWithZone((Class)swift_getObjCClassMetadata(a1));
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  swift_unknownObjectRetain(a7);
  sub_100166B74((uint64_t)v14, v15);
  v21 = sub_10023B7D4(v17, (uint64_t)v18, a5, v20, (uint64_t)a7, (uint64_t)v14, v15);
  sub_100012C50((uint64_t)v14, v15);
  sub_10023B910();
  isa = ActionMenuProvider.makeMenu(deferredChildren:)(1).super.super.isa;

  sub_100012C50((uint64_t)v14, v15);
  swift_unknownObjectRelease(a7, v23);
  return isa;
}

+ (id)menuWithTagSelection:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 deferredChildren:(BOOL)a7 delegate:(id)a8 completion:(id)aBlock
{
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  Class isa;
  uint64_t v24;

  v15 = _Block_copy(aBlock);
  if (v15)
  {
    v16 = swift_allocObject(&unk_100560638, 24, 7);
    *(_QWORD *)(v16 + 16) = v15;
    v15 = sub_10023B9A0;
  }
  else
  {
    v16 = 0;
  }
  v17 = objc_allocWithZone((Class)swift_getObjCClassMetadata(a1));
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  swift_unknownObjectRetain(a8);
  sub_100166B74((uint64_t)v15, v16);
  v22 = sub_10023B7D4(v18, (uint64_t)v19, a5, v21, (uint64_t)a8, (uint64_t)v15, v16);
  sub_100012C50((uint64_t)v15, v16);
  sub_10023B910();
  isa = ActionMenuProvider.makeMenu(deferredChildren:)(a7).super.super.isa;

  sub_100012C50((uint64_t)v15, v16);
  swift_unknownObjectRelease(a8, v24);
  return isa;
}

- (id)completion
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_completion))
    return 0;
  v2 = *(_QWORD *)&self->tagSelection[OBJC_IVAR___ICTagsActionMenu_completion];
  v6[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_completion);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10023ABC8;
  v6[3] = &unk_1005605D8;
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
    v4 = (_QWORD *)swift_allocObject(&unk_1005605C0, 24, 7);
    v4[2] = v5;
    v6 = sub_100206398;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)(char, uint64_t, uint64_t))((char *)self + OBJC_IVAR___ICTagsActionMenu_completion);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_completion);
  v8 = *(_QWORD *)&self->tagSelection[OBJC_IVAR___ICTagsActionMenu_completion];
  *v7 = v6;
  v7[1] = (void (*)(char, uint64_t, uint64_t))v4;
  sub_100012C50(v9, v8);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICTagsActionMenu_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICTagsActionMenu_presentingViewController, a3);
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return (UIBarButtonItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___ICTagsActionMenu_presentingBarButtonItem));
}

- (void)setPresentingBarButtonItem:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_presentingBarButtonItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_presentingBarButtonItem) = (Class)a3;
  v3 = a3;

}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___ICTagsActionMenu_viewControllerManager));
}

- (id)menuSections
{
  ICTagsActionMenu *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_1002393A8();

  sub_1000163BC(0, (unint64_t *)&qword_1005D8A30, UIMenuElement_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (ICTagsActionMenu)init
{
  ICTagsActionMenu *result;

  result = (ICTagsActionMenu *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.TagsActionMenu", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1001FDCAC((uint64_t)self + OBJC_IVAR___ICTagsActionMenu_delegate);
  sub_100012C50(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_completion), *(_QWORD *)&self->tagSelection[OBJC_IVAR___ICTagsActionMenu_completion]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICTagsActionMenu_presentingViewController);

}

@end
