@implementation ICCollaborationButtonsController

- (ICCloudSyncingObject)cloudObject
{
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  ICCollaborationButtonsController *v6;
  id v8;

  KeyPath = swift_getKeyPath(&unk_100461E40, a2);
  v5 = swift_getKeyPath(&unk_100461E68, v4);
  v6 = self;
  static Published.subscript.getter(&v8);

  swift_release(KeyPath);
  swift_release(v5);
  return (ICCloudSyncingObject *)v8;
}

- (void)setCloudObject:(id)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  id v8;
  ICCollaborationButtonsController *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  KeyPath = swift_getKeyPath(&unk_100461E40, a2);
  v7 = swift_getKeyPath(&unk_100461E68, v6);
  v13 = a3;
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = static Published.subscript.setter(&v13, v9, KeyPath, v7);
  sub_1002E70DC(v11, v12);

}

- (BOOL)accountSupportsDeviceToDeviceEncryption
{
  return sub_1002E7440(self, (uint64_t)a2, (uint64_t)&unk_100462040, (uint64_t)&unk_100462068);
}

- (void)setAccountSupportsDeviceToDeviceEncryption:(BOOL)a3
{
  sub_1002E74E0(self, (uint64_t)a2, a3, (uint64_t)&unk_100462040, (uint64_t)&unk_100462068);
}

- (BOOL)accountHasKeychainEnabled
{
  return sub_1002E7440(self, (uint64_t)a2, (uint64_t)&unk_100461FF8, (uint64_t)&unk_100462020);
}

- (void)setAccountHasKeychainEnabled:(BOOL)a3
{
  sub_1002E74E0(self, (uint64_t)a2, a3, (uint64_t)&unk_100461FF8, (uint64_t)&unk_100462020);
}

- (BOOL)showsActivityStream
{
  return sub_1002E7440(self, (uint64_t)a2, (uint64_t)&unk_100461F60, (uint64_t)&unk_100461F88);
}

- (void)setShowsActivityStream:(BOOL)a3
{
  sub_1002E74E0(self, (uint64_t)a2, a3, (uint64_t)&unk_100461F60, (uint64_t)&unk_100461F88);
}

- (BOOL)showsAttributionSidebar
{
  return sub_1002E7440(self, (uint64_t)a2, (uint64_t)&unk_100461F18, (uint64_t)&unk_100461F40);
}

- (void)setShowsAttributionSidebar:(BOOL)a3
{
  sub_1002E74E0(self, (uint64_t)a2, a3, (uint64_t)&unk_100461F18, (uint64_t)&unk_100461F40);
}

- (BOOL)showsCollaboratorCursors
{
  return sub_1002E7440(self, (uint64_t)a2, (uint64_t)&unk_100461FA8, (uint64_t)&unk_100461FD0);
}

- (void)setShowsCollaboratorCursors:(BOOL)a3
{
  sub_1002E74E0(self, (uint64_t)a2, a3, (uint64_t)&unk_100461FA8, (uint64_t)&unk_100461FD0);
}

- (NSArray)activeParticipants
{
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  ICCollaborationButtonsController *v6;
  uint64_t v7;
  Class isa;
  uint64_t v10;

  KeyPath = swift_getKeyPath(&unk_100461ED0, a2);
  v5 = swift_getKeyPath(&unk_100461EF8, v4);
  v6 = self;
  static Published.subscript.getter(&v10);

  swift_release(KeyPath);
  swift_release(v5);
  v7 = v10;
  sub_1000163BC(0, &qword_1005D8540, CKShareParticipant_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return (NSArray *)isa;
}

- (void)setActiveParticipants:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = sub_1000163BC(0, &qword_1005D8540, CKShareParticipant_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  KeyPath = swift_getKeyPath(&unk_100461ED0, v7);
  v10 = swift_getKeyPath(&unk_100461EF8, v9);
  v11 = v6;
  static Published.subscript.setter(&v11, self, KeyPath, v10);
}

- (ICCollaborationButtonsController)initWithCloudObject:(id)a3 coordinator:(id)a4
{
  id v6;

  v6 = a3;
  return (ICCollaborationButtonsController *)sub_1002E7940(a3, a4);
}

- (void)dealloc
{
  objc_class *ObjectType;
  ICCollaborationButtonsController *v4;
  uint64_t v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = self;
  sub_1002E7F98();
  v5 = *(uint64_t *)((char *)&v4->super.isa
                  + OBJC_IVAR___ICCollaborationButtonsController_collaboratorDataSourceObservation);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___ICCollaborationButtonsController_collaboratorDataSourceObservation) = 0;
  swift_release(v5);
  v6.receiver = v4;
  v6.super_class = ObjectType;
  -[ICCollaborationButtonsController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  v3 = (char *)self + OBJC_IVAR___ICCollaborationButtonsController__cloudObject;
  v4 = sub_100012E18(&qword_1005D8558);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___ICCollaborationButtonsController__accountSupportsDeviceToDeviceEncryption;
  v6 = sub_100012E18(&qword_1005D0DE0);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR___ICCollaborationButtonsController__accountHasKeychainEnabled, v6);
  v7((char *)self + OBJC_IVAR___ICCollaborationButtonsController__showsActivityStream, v6);
  v7((char *)self + OBJC_IVAR___ICCollaborationButtonsController__showsAttributionSidebar, v6);
  v7((char *)self + OBJC_IVAR___ICCollaborationButtonsController__showsCollaboratorCursors, v6);
  v8 = (char *)self + OBJC_IVAR___ICCollaborationButtonsController__activeParticipants;
  v9 = sub_100012E18(&qword_1005D84C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR___ICCollaborationButtonsController__participantDataSource;
  v11 = sub_100012E18(&qword_1005D8550);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR___ICCollaborationButtonsController_coordinator, v12);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController_activityStreamUpdater));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___ICCollaborationButtonsController_activityDigestSummaryObservation));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___ICCollaborationButtonsController_showsCollaboratorCursorsObservation));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___ICCollaborationButtonsController_collaboratorDataSourceObservation));
  v13 = (char *)self + OBJC_IVAR___ICCollaborationButtonsController__activityDigestSummary;
  v14 = sub_100012E18(&qword_1005D8548);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCollaborationButtonsController____lazy_storage___buttonItem));
  sub_100012C50(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton), *(_QWORD *)&self->coordinator[OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton]);
}

- (UIBarButtonItem)buttonItem
{
  ICCollaborationButtonsController *v2;
  id v3;

  v2 = self;
  v3 = sub_1002E8FAC();

  return (UIBarButtonItem *)v3;
}

- (void)setButtonItem:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController____lazy_storage___buttonItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController____lazy_storage___buttonItem) = (Class)a3;
  v3 = a3;

}

- (id)didPressManageShareButton
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton))
    return 0;
  v2 = *(_QWORD *)&self->coordinator[OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton];
  v6[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100206734;
  v6[3] = &unk_100566DF0;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setDidPressManageShareButton:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_100566DD8, 24, 7);
    v4[2] = v5;
    v6 = sub_100166BA8;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton);
  v8 = *(_QWORD *)&self->coordinator[OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_100012C50(v9, v8);
}

- (ICCollaborationButtonsController)init
{
  ICCollaborationButtonsController *result;

  result = (ICCollaborationButtonsController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.CollaborationButtonsController", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)updateState
{
  ICCollaborationButtonsController *v2;

  v2 = self;
  sub_1002E953C();

}

- (NSArray)activityDigestSummaryParticipants
{
  ICCollaborationButtonsController *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_1002E99E8();

  sub_1000163BC(0, &qword_1005D8540, CKShareParticipant_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)showRecentUpdates
{
  uint64_t v2;
  ICCollaborationButtonsController *v3;

  v3 = self;
  sub_1002E9BD0((uint64_t)v3, v2);

}

- (void)showAccountDeviceToDeviceEncryptionAlert
{
  uint64_t v2;
  ICCollaborationButtonsController *v3;

  v3 = self;
  sub_1002EA160((uint64_t)v3, v2);

}

- (void)showEnableKeychainAlert
{
  ICCollaborationButtonsController *v2;

  v2 = self;
  sub_1002EA510();

}

- (void)showSelectionFor:(id)a3
{
  id v4;
  ICCollaborationButtonsController *v5;

  v4 = a3;
  v5 = self;
  sub_1002EAE1C(v4);

}

- (void)showContactCardFor:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  ICCollaborationButtonsController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1002EBD08((uint64_t)v6);

}

- (void)hideContactCard
{
  void *Strong;
  id v4;
  ICCollaborationButtonsController *v5;
  ICCollaborationButtonsController *v6;
  ICCollaborationButtonsController *v7;

  Strong = (void *)swift_unknownObjectUnownedLoadStrong((char *)self + OBJC_IVAR___ICCollaborationButtonsController_coordinator);
  v7 = self;
  v4 = objc_msgSend(Strong, "activeEditorController");

  v5 = (ICCollaborationButtonsController *)objc_msgSend(v4, "presentedViewController");
  if (v5)
  {
    -[ICCollaborationButtonsController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }

}

- (void)setShowsCollaboratorCursorsWithVisible:(BOOL)a3
{
  ICCollaborationButtonsController *v4;

  v4 = self;
  sub_1002E8B30(a3, (uint64_t)v4);

}

- (void)setActivityStreamWithVisible:(BOOL)a3
{
  ICCollaborationButtonsController *v4;

  v4 = self;
  sub_1002EB1C0(a3);

}

- (void)setAttributionSidebarWithVisible:(BOOL)a3
{
  ICCollaborationButtonsController *v4;

  v4 = self;
  sub_1002EB3F8(a3);

}

- (void)showShare
{
  ICCollaborationButtonsController *v2;

  v2 = self;
  sub_1002EB61C();

}

@end
