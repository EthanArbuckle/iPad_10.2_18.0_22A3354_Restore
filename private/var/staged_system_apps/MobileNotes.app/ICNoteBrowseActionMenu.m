@implementation ICNoteBrowseActionMenu

- (void)willShowMenu
{
  ICNoteBrowseActionMenu *v2;

  v2 = self;
  sub_100342BF4();

}

- (id)menuSections
{
  ICNoteBrowseActionMenu *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_100342D40();

  sub_100343460();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (id)mainSectionMenu
{
  ICNoteBrowseActionMenu *v2;
  id v3;

  v2 = self;
  v3 = sub_100342FA0();

  return v3;
}

- (ICNoteBrowseActionMenu)initWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ICNoteBrowseActionMenu *v17;

  v11 = _Block_copy(a7);
  if (v11)
  {
    v12 = swift_allocObject(&unk_10056A108, 24, 7);
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
  v17 = (ICNoteBrowseActionMenu *)sub_1002E2464(v13, (uint64_t)v14, a5, v16, (uint64_t)v11, v12);
  sub_100012C50((uint64_t)v11, v12);

  return v17;
}

- (ICNoteBrowseActionMenu)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ICNoteBrowseActionMenu *v17;

  v11 = _Block_copy(a7);
  if (v11)
  {
    v12 = swift_allocObject(&unk_10056A0E0, 24, 7);
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
  v17 = (ICNoteBrowseActionMenu *)sub_1002E25F4(v13, (uint64_t)v14, a5, v16, (uint64_t)v11, v12);
  sub_100012C50((uint64_t)v11, v12);

  return v17;
}

@end
