@implementation ICFolderListActionMenu

- (id)menuSections
{
  ICFolderListActionMenu *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_1002747D0();

  sub_1000163BC(0, (unint64_t *)&qword_1005D8A30, UIMenuElement_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (id)smartFolderSectionMenu
{
  ICFolderListActionMenu *v2;
  id v3;

  v2 = self;
  v3 = sub_1002748F4();

  return v3;
}

- (id)mainSectionMenu
{
  ICFolderListActionMenu *v2;
  id v3;

  v2 = self;
  v3 = sub_100274AA0();

  return v3;
}

- (ICFolderListActionMenu)initWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ICFolderListActionMenu *v17;

  v11 = _Block_copy(a7);
  if (v11)
  {
    v12 = swift_allocObject(&unk_100562C60, 24, 7);
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
  v17 = (ICFolderListActionMenu *)sub_1002E2464(v13, (uint64_t)v14, a5, v16, (uint64_t)v11, v12);
  sub_100012C50((uint64_t)v11, v12);

  return v17;
}

- (ICFolderListActionMenu)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ICFolderListActionMenu *v17;

  v11 = _Block_copy(a7);
  if (v11)
  {
    v12 = swift_allocObject(&unk_100562C38, 24, 7);
    *(_QWORD *)(v12 + 16) = v11;
    v11 = sub_100206398;
  }
  else
  {
    v12 = 0;
  }
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (ICFolderListActionMenu *)sub_1002E25F4(v13, (uint64_t)v14, a5, v16, (uint64_t)v11, v12);
  sub_100012C50((uint64_t)v11, v12);

  return v17;
}

@end
