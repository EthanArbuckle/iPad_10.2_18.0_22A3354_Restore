@implementation FMDevicePasscodeViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMDevicePasscodeViewController(0);
  v2 = v3.receiver;
  -[FMDevicePasscodeViewController viewDidLoad](&v3, "viewDidLoad");
  sub_10025A000();
  sub_10025A3C0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMDevicePasscodeViewController(0);
  v4 = v5.receiver;
  -[FMDevicePasscodeViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_10025BE7C();
  sub_10025C168();
  sub_10025A868();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMDevicePasscodeViewController(0);
  v4 = (char *)v5.receiver;
  -[FMDevicePasscodeViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_hiddenPasscodeTextField], "becomeFirstResponder", v5.receiver, v5.super_class);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  _TtC6FindMy30FMDevicePasscodeViewController *v5;
  objc_super v6;

  v3 = a3;
  v4 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_hiddenPasscodeTextField];
  v5 = self;
  objc_msgSend(v4, "resignFirstResponder");
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for FMDevicePasscodeViewController(0);
  -[FMDevicePasscodeViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  sub_10025AB48();

}

- (void)viewWillLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMDevicePasscodeViewController(0);
  v2 = v3.receiver;
  -[FMDevicePasscodeViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  sub_10025B808();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy30FMDevicePasscodeViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10025AD18((uint64_t)a3);

}

- (void)textChangedWithSender:(id)a3
{
  id v4;
  _TtC6FindMy30FMDevicePasscodeViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10025E7F4();

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC6FindMy30FMDevicePasscodeViewController *v13;

  length = a4.length;
  location = a4.location;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_10025EA24(location, length, v9, v11);

  swift_bridgeObjectRelease(v11);
  return length & 1;
}

- (void)passcodeEntryViewTapped
{
  objc_msgSend(*(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_hiddenPasscodeTextField], "becomeFirstResponder");
}

- (void)nextActionWithSender:(id)a3
{
  uint64_t v3;
  id v6;
  _TtC6FindMy30FMDevicePasscodeViewController *v7;

  v3 = *(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_firstPasscode];
  if (v3)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_firstPasscode]);
    v6 = a3;
    v7 = self;
    sub_10025E2F4();

    swift_bridgeObjectRelease(v3);
  }
}

- (void)cancelActionWithSender:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _TtC6FindMy30FMDevicePasscodeViewController *v8;
  _QWORD aBlock[6];

  v4 = a3;
  v8 = self;
  v5 = -[FMDevicePasscodeViewController navigationController](v8, "navigationController");
  if (v5)
  {
    v6 = v5;
    aBlock[4] = State.rawValue.getter;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100037DF8;
    aBlock[3] = &unk_1005534B8;
    v7 = _Block_copy(aBlock);
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v7);
    _Block_release(v7);

  }
  else
  {

  }
}

- (_TtC6FindMy30FMDevicePasscodeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (!a4)
  {
    v13 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    v16 = 0;
    return (_TtC6FindMy30FMDevicePasscodeViewController *)sub_10025D480(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  return (_TtC6FindMy30FMDevicePasscodeViewController *)sub_10025D480(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy30FMDevicePasscodeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v14 = a5;
  return (_TtC6FindMy30FMDevicePasscodeViewController *)sub_10025D938(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_mediator]);
  sub_1000051EC((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_device], &qword_1005D6710);
  sub_1000051EC((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_primaryItemPart], (uint64_t *)&unk_1005D3AA0);

  v3 = &self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_numbersCharacterSet];
  v4 = type metadata accessor for CharacterSet(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_firstPasscode]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_secondPasscode]);
  swift_unknownObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_keyboardWillShowObserver]);
  swift_unknownObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_keyboardWillHideObserver]);
}

@end
