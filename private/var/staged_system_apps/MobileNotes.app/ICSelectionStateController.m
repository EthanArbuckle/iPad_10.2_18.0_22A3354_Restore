@implementation ICSelectionStateController

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_delegate, a3);
}

- (_TtC11MobileNotes26ICSelectionStateController)initWithPersistenceConfiguration:(id)a3
{
  return (_TtC11MobileNotes26ICSelectionStateController *)sub_100009C80(a3);
}

- (NSManagedObjectID)selectedNoteBrowseContainerObjectID
{
  return (NSManagedObjectID *)sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D1230, (uint64_t)sub_100017560);
}

- (ICItemIdentifier)selectedNoteBrowseContainerItemID
{
  return (ICItemIdentifier *)sub_100012C60((char *)self, (uint64_t)a2, (uint64_t *)&unk_1005D2510, (uint64_t)sub_10001759C);
}

- (ICVirtualSmartFolderItemIdentifier)selectedVirtualSmartFolderItemID
{
  return (ICVirtualSmartFolderItemIdentifier *)sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D67C0, (uint64_t)sub_1000175D8);
}

- (NSManagedObjectID)selectedInvitationObjectID
{
  return (NSManagedObjectID *)sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D1230, (uint64_t)sub_100017614);
}

- (ICActivityStreamSelection)activityStreamSelection
{
  return (ICActivityStreamSelection *)sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D67B0, (uint64_t)sub_100017650);
}

- (NSManagedObjectID)selectedNoteObjectID
{
  return (NSManagedObjectID *)sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D1230, (uint64_t)sub_10001768C);
}

- (void)adoptCurrentModelWithArchive:(id)a3 systemPaperAccountAlert:(BOOL)a4 completion:(id)a5
{
  uint64_t (*v8)();
  uint64_t v9;
  id v10;
  _TtC11MobileNotes26ICSelectionStateController *v11;

  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1005637F8, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_10022AAC0;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_100004F84((uint64_t)v10, a4, v8, v9);
  sub_100012C50((uint64_t)v8, v9);

}

- (ICTagSelection)tagSelection
{
  return (ICTagSelection *)sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D67C8, (uint64_t)sub_100017788);
}

- (NSDictionary)currentFirstVisibleObjectIDURLForContainerObjectIDURL
{
  void *v2;
  _TtC11MobileNotes26ICSelectionStateController *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;
  _QWORD v9[5];
  uint64_t v10;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateAccessQueue);
  v9[2] = self;
  v3 = self;
  v4 = v2;
  v5 = sub_100012E18((uint64_t *)&unk_1005D67A0);
  OS_dispatch_queue.sync<A>(execute:)(&v10, sub_100017874, v9, v5);

  v6 = v10;
  if (!v10)
    return (NSDictionary *)0;
  type metadata accessor for URL(0);
  sub_100019C6C((unint64_t *)&unk_1005CF700, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSDictionary *)isa;
}

- (_TtP11MobileNotes34ICSelectionStateControllerDelegate_)delegate
{
  return (_TtP11MobileNotes34ICSelectionStateControllerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_delegate);
}

- (void)dealloc
{
  _TtC11MobileNotes26ICSelectionStateController *v2;

  v2 = self;
  sub_100277D94();
}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  sub_1001FDCAC((uint64_t)self + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateAccessQueue));
  v4 = *(void **)&self->selectionStateAccessQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateQueue];
  v3 = *(_QWORD *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateQueue];
  v5 = *(_QWORD *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateQueue
                                           + 8];
  v6 = *(_QWORD *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateQueue
                                           + 16];
  v7 = *(_QWORD *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateQueue
                                           + 24];
  v8 = *(_QWORD *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateQueue
                                           + 32];
  v9 = *(_QWORD *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateQueue
                                           + 56];
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateQueue));

  sub_100012C50(v3, v5);
  sub_100012C50(v6, v7);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_observers));
  v10 = (char *)self + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_logger;
  v11 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_persistenceConfiguration));
  sub_100016678(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration], *(_QWORD *)&self->selectionStateAccessQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration], *(_QWORD *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration], *(void **)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration+ 8], *(void **)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration+ 16], *(_QWORD *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration+ 24], *(_QWORD *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration+ 32], *(_QWORD *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration+ 40], *(_QWORD *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration+ 48]);
}

- (void)setup
{
  _TtC11MobileNotes26ICSelectionStateController *v2;

  v2 = self;
  sub_100278008(0);

}

- (void)setupWithArchive:(id)a3
{
  id v5;
  _TtC11MobileNotes26ICSelectionStateController *v6;

  v5 = a3;
  v6 = self;
  sub_100278008(a3);

}

- (void)adoptModel:(id)a3 withArchive:(id)a4 systemPaperAccountAlert:(BOOL)a5 completion:(id)a6
{
  uint64_t (*v10)();
  uint64_t v11;
  id v12;
  id v13;
  _TtC11MobileNotes26ICSelectionStateController *v14;

  v10 = (uint64_t (*)())_Block_copy(a6);
  if (v10)
  {
    v11 = swift_allocObject(&unk_100563730, 24, 7);
    *(_QWORD *)(v11 + 16) = v10;
    v10 = sub_100166BA8;
  }
  else
  {
    v11 = 0;
  }
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_100279BB8(v12, (uint64_t)v13, a5, v10, v11);
  sub_100012C50((uint64_t)v10, v11);

}

- (void)adoptDeferredAnimated:(BOOL)a3 startEditing:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _TtC11MobileNotes26ICSelectionStateController *v6;

  v4 = a4;
  v5 = a3;
  v6 = self;
  sub_100279EB8(v5, v4);

}

- (void)adoptInstantNoteModel:(id)a3 archive:(id)a4
{
  id v6;
  id v7;
  _TtC11MobileNotes26ICSelectionStateController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10027A930(v6, (uint64_t)v7);

}

- (id)dataRepresentationWithEditorModel:(id)a3
{
  _TtC11MobileNotes26ICSelectionStateController *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  Class isa;

  v4 = self;
  v5 = a3;
  v6 = sub_10027AB74(a3);
  v8 = v7;

  if (v8 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1001672D8(v6, v8);
  }
  return isa;
}

- (void)clear
{
  _TtC11MobileNotes26ICSelectionStateController *v2;

  v2 = self;
  sub_10027B168();

}

- (void)pushTagSelection:(id)a3
{
  id v5;
  _TtC11MobileNotes26ICSelectionStateController *v6;

  v5 = a3;
  v6 = self;
  sub_10027B41C(a3);

}

- (void)pushContainerSelectionWithObjectID:(id)a3
{
  uint64_t v5;
  _TtC11MobileNotes26ICSelectionStateController *v6;

  swift_unknownObjectRetain(a3);
  v6 = self;
  sub_10027C470((uint64_t)a3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  swift_unknownObjectRelease(a3, v5);

}

- (void)pushContainerSelectionWithObjectID:(id)a3 noteBrowseViewController:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 dismissOverlayContent:(id)a7 animated:(BOOL)a8 ensurePresented:(BOOL)a9 ensureSelectedNote:(id)a10 keepEditorShowing:(id)a11 containerSelectionCompletionBlocks:(id)a12
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _TtC11MobileNotes26ICSelectionStateController *v20;
  id v21;
  id v22;
  _BOOL4 v25;

  v25 = a8;
  swift_unknownObjectRetain(a3);
  v22 = a4;
  v21 = a7;
  v16 = a10;
  v17 = a11;
  v18 = a12;
  v20 = self;
  sub_10027C470((uint64_t)a3, 0, (uint64_t)a4, a5, a6, a7, v25, a9, a10, a11, a12);
  swift_unknownObjectRelease(a3, v19);

}

- (void)pushContainerSelectionWithObjectID:(id)a3 forceApply:(BOOL)a4 noteBrowseViewController:(id)a5 usingRootViewController:(BOOL)a6 deferUntilDataLoaded:(BOOL)a7 dismissOverlayContent:(id)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 ensureSelectedNote:(id)a11 keepEditorShowing:(id)a12 containerSelectionCompletionBlocks:(id)a13
{
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _TtC11MobileNotes26ICSelectionStateController *v21;
  id v22;
  id v23;
  _BOOL4 v24;

  v24 = a4;
  swift_unknownObjectRetain(a3);
  v23 = a5;
  v22 = a8;
  v17 = a11;
  v18 = a12;
  v19 = a13;
  v21 = self;
  sub_10027C470((uint64_t)a3, v24, (uint64_t)a5, a6, a7, a8, a9, a10, a11, a12, a13);
  swift_unknownObjectRelease(a3, v20);

}

- (void)pushAutoselectedObjectWithObjectID:(id)a3
{
  id v5;
  _TtC11MobileNotes26ICSelectionStateController *v6;

  v5 = a3;
  v6 = self;
  sub_10027C9C0(a3);

}

- (void)pushNoteSelectionWithObjectID:(id)a3
{
  id v5;
  _TtC11MobileNotes26ICSelectionStateController *v6;

  v5 = a3;
  v6 = self;
  sub_10027CDFC(a3, 0, 0, 0, 0, 0, 0, 0, 0);

}

- (void)pushNoteSelectionWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10
{
  sub_10027D7FC(self, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9, a10, (void (*)(void *, void *, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10027CDFC);
}

- (void)pushNoteSelectionWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 searchResult:(id)a11
{
  sub_10027DA0C(self, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (void (*)(void *, void *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))sub_10027CDFC);
}

- (void)pushAttachmentSelectionWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10
{
  sub_10027D7FC(self, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9, a10, (void (*)(void *, void *, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10027D298);
}

- (void)pushAttachmentSelectionWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 searchResult:(id)a11
{
  sub_10027DA0C(self, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (void (*)(void *, void *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))sub_10027D298);
}

- (void)pushInvitationWithObjectID:(id)a3 animated:(BOOL)a4
{
  id v7;
  _TtC11MobileNotes26ICSelectionStateController *v8;

  v7 = a3;
  v8 = self;
  sub_10027CAC0(a3, a4);

}

- (void)pushObjectWithObjectID:(id)a3
{
  id v5;
  _TtC11MobileNotes26ICSelectionStateController *v6;

  v5 = a3;
  v6 = self;
  sub_10027DB38(a3);

}

- (void)navigationControllerDidTransitionWithNewContainerItemID:(id)a3 newTagSelection:(id)a4 forgetObjectSelection:(BOOL)a5
{
  id v9;
  uint64_t v10;
  _TtC11MobileNotes26ICSelectionStateController *v11;

  swift_unknownObjectRetain(a3);
  v9 = a4;
  v11 = self;
  sub_10027E154((uint64_t)a3, a4, a5);
  swift_unknownObjectRelease(a3, v10);

}

- (void)pushSearchResult:(id)a3 animated:(BOOL)a4
{
  id v6;
  _TtC11MobileNotes26ICSelectionStateController *v7;

  v6 = a3;
  v7 = self;
  sub_10027E73C(v6, a4);

}

- (void)pushModel:(id)a3 navigating:(BOOL)a4
{
  char *v6;
  _TtC11MobileNotes26ICSelectionStateController *v7;

  if (a3)
  {
    v7 = self;
    v6 = (char *)a3;
    sub_10027980C(v6, 1, 0, 0, a4);

  }
}

- (void)willDismissSearch
{
  _TtC11MobileNotes26ICSelectionStateController *v2;

  v2 = self;
  sub_10027EAEC();

}

- (void)openURL:(id)a3 rootNoteBrowseViewController:(id)a4 currentNoteContainerViewMode:(int64_t)a5 completion:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _TtC11MobileNotes26ICSelectionStateController *v18;
  uint64_t v19;

  v10 = sub_100012E18(&qword_1005CEFD0);
  __chkstk_darwin(v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (void (*)(uint64_t))_Block_copy(a6);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v14 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 0, 1, v14);
  }
  else
  {
    v15 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  }
  if (v13)
  {
    v16 = swift_allocObject(&unk_100563190, 24, 7);
    *(_QWORD *)(v16 + 16) = v13;
    v13 = (void (*)(uint64_t))sub_100166BB0;
  }
  else
  {
    v16 = 0;
  }
  v17 = a4;
  v18 = self;
  sub_100284DA4((uint64_t)v12, a4, v13, v16);
  sub_100012C50((uint64_t)v13, v16);

  sub_100012DDC((uint64_t)v12, &qword_1005CEFD0);
}

- (void)navigateBackwards
{
  _TtC11MobileNotes26ICSelectionStateController *v2;

  v2 = self;
  sub_10027F49C();

}

- (void)navigateForwards
{
  _TtC11MobileNotes26ICSelectionStateController *v2;

  v2 = self;
  sub_10027FC68();

}

- (ICSelectionStateModelContainerSelectionOptions)containerSelectionOptions
{
  return (ICSelectionStateModelContainerSelectionOptions *)sub_100280A00((char *)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for ICSelectionStateModel.ContainerSelectionOptions, (uint64_t)sub_100284980);
}

- (NSManagedObjectID)selectedObjectID
{
  return (NSManagedObjectID *)sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D1230, (uint64_t)sub_100284968);
}

- (NSManagedObjectID)previousSelectedNoteObjectID
{
  return (NSManagedObjectID *)sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D1230, (uint64_t)sub_100284950);
}

- (ICSelectionStateModelObjectSelectionOptions)objectSelectionOptions
{
  return (ICSelectionStateModelObjectSelectionOptions *)sub_100280A00((char *)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for ICSelectionStateModel.ObjectSelectionOptions, (uint64_t)sub_100284928);
}

- (ICTextViewScrollState)scrollState
{
  return (ICTextViewScrollState *)sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D67B8, (uint64_t)sub_100284910);
}

- (NSManagedObjectID)focusedNoteObjectID
{
  return (NSManagedObjectID *)sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D1230, (uint64_t)sub_1002848E8);
}

- (void)setActivityStreamSelection:(id)a3
{
  id v5;
  _TtC11MobileNotes26ICSelectionStateController *v6;

  v5 = a3;
  v6 = self;
  sub_100280C1C(a3);

}

- (int64_t)activityStreamViewMode
{
  void *v2;
  _TtC11MobileNotes26ICSelectionStateController *v3;
  id v4;
  _QWORD v6[5];
  int64_t v7;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateAccessQueue);
  v6[2] = self;
  v3 = self;
  v4 = v2;
  OS_dispatch_queue.sync<A>(execute:)(&v7, sub_100284898, v6, &type metadata for ActivityStreamNavigationController.ViewModes);

  return v7;
}

- (void)setActivityStreamViewMode:(int64_t)a3
{
  _TtC11MobileNotes26ICSelectionStateController *v4;

  v4 = self;
  sub_100280F88(a3);

}

- (ICSearchResult)currentSelectedSearchResult
{
  return (ICSearchResult *)sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D16C0, (uint64_t)sub_100284834);
}

- (void)setCurrentSelectedSearchResult:(id)a3
{
  id v5;
  _TtC11MobileNotes26ICSelectionStateController *v6;

  v5 = a3;
  v6 = self;
  sub_100281260(a3);

}

- (ICItemIdentifier)mostRecentNonSearchContainerItemID
{
  return (ICItemIdentifier *)sub_100012C60((char *)self, (uint64_t)a2, (uint64_t *)&unk_1005D2510, (uint64_t)sub_1002847B8);
}

- (id)mostRecentSelectedContainer
{
  return sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D6798, (uint64_t)sub_1002847A0);
}

- (NSManagedObjectID)mostRecentSelectedObjectID
{
  return (NSManagedObjectID *)sub_100012C60((char *)self, (uint64_t)a2, &qword_1005D1230, (uint64_t)sub_100284754);
}

- (BOOL)canNavigateBackwards
{
  return sub_100282134((char *)self, (uint64_t)a2, (uint64_t)sub_10028465C);
}

- (BOOL)canNavigateForwards
{
  return sub_100282134((char *)self, (uint64_t)a2, (uint64_t)sub_10028461C);
}

- (BOOL)hasDeferredItem
{
  return sub_100282134((char *)self, (uint64_t)a2, (uint64_t)sub_1002845EC);
}

- (BOOL)objectSelectionHasChangedComparedToModel:(id)a3
{
  void *v4;
  id v5;
  _TtC11MobileNotes26ICSelectionStateController *v6;
  id v7;
  _QWORD v9[5];
  _BOOL8 v10;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateAccessQueue);
  v9[2] = self;
  v9[3] = a3;
  v5 = a3;
  v6 = self;
  v7 = v4;
  OS_dispatch_queue.sync<A>(execute:)(&v10, sub_1002845D4, v9, &type metadata for Bool);

  return v10;
}

- (BOOL)selectedContainerEqualTo:(id)a3
{
  void *v5;
  _TtC11MobileNotes26ICSelectionStateController *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[5];
  _BOOL8 v11;

  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateAccessQueue);
  v10[2] = self;
  v10[3] = a3;
  swift_unknownObjectRetain(a3);
  v6 = self;
  v7 = v5;
  OS_dispatch_queue.sync<A>(execute:)(&v11, sub_1002845BC, v10, &type metadata for Bool);
  swift_unknownObjectRelease(a3, v8);

  return v11;
}

- (NSArray)mostRecentSelections
{
  _TtC11MobileNotes26ICSelectionStateController *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_100282A18();

  type metadata accessor for ICSelectionStateModel(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (_TtC11MobileNotes26ICSelectionStateController)init
{
  _TtC11MobileNotes26ICSelectionStateController *result;

  result = (_TtC11MobileNotes26ICSelectionStateController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ICSelectionStateController", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
