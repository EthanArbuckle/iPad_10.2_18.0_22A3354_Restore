@implementation PMCredentialPickerViewController

- (void)viewDidLoad
{
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v2;

  v2 = self;
  sub_2437E2D28();

}

- (_TtC17PasswordManagerUI32PMCredentialPickerViewController)initWithPresentationContext:(id)a3 shouldExpandOtherLoginChoices:(BOOL)a4 activity:(id)a5
{
  _BOOL4 v6;
  id v7;

  v6 = a4;
  v7 = a3;
  swift_unknownObjectRetain();
  return (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)PMCredentialPickerViewController.init(presentationContext:shouldExpandOtherLoginChoices:activity:)(v7, v6, (uint64_t)a5);
}

- (id)initRequiringTableView:(BOOL)a3
{
  id result;

  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_presentationContext));
  v3 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_uiContext;
  v4 = sub_24384DD38();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_confirmButtonSubpane));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_authKitAuthorizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_alertQueue));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_externalPasswordCredentialForSelectedLoginChoice));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_credentialAuthenticationViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_credentialListViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_secondaryButton));
  v5 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController__selectedLoginChoiceIndex;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572BE848);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_2437ED9E0();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_2437EDB64(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_24384D9C0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24384D99C();
  v10 = a3;
  v11 = self;
  v12 = PMCredentialPickerViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v13;
  uint64_t v15;

  v7 = sub_24384DA08();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = 0;
  if (a4 == 1)
  {
    v12 = a3;
    v13 = self;
    sub_24384D9FC();
    sub_24384D9F0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

    v11 = (void *)sub_243850234();
    swift_bridgeObjectRelease();
  }
  return v11;
}

- (int64_t)numberOfTableRows
{
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v2;
  int64_t v3;

  v2 = self;
  v3 = PMCredentialPickerViewController.numberOfTableRows.getter();

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v11;
  uint64_t v12;

  v6 = sub_24384D9C0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24384D99C();
  v10 = a3;
  v11 = self;
  PMCredentialPickerViewController.tableView(_:didSelectRowAt:)((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)confirmButtonSubPaneDidEnterProcessingState:(id)a3 withAuthenticatedContext:(id)a4
{
  id v6;
  id v7;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PMCredentialPickerViewController.confirmButtonSubPaneDidEnterProcessingState(_:withAuthenticatedContext:)(v6, (uint64_t)a4);

}

- (void)confirmButtonSubPaneDidFailBiometry:(id)a3 allowingPasscodeFallback:(BOOL)a4
{
  id v6;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v7;

  v6 = a3;
  v7 = self;
  sub_2437EDE4C(a4);

}

- (void)userTappedContinueButton
{
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v2;

  v2 = self;
  PMCredentialPickerViewController.userTappedContinueButton()();

}

- (void)performPasswordAuthentication:(id)a3
{
  id v4;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v5;

  v4 = a3;
  v5 = self;
  _s17PasswordManagerUI32PMCredentialPickerViewControllerC07performA14AuthenticationyySo39ASCredentialRequestConfirmButtonSubPaneCF_0();

}

- (void)performAuthorization:(id)a3 withAuthenticatedLAContext:(id)a4
{
  uint64_t v7;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v8;
  id v9;
  id v10;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = self;
  v8 = self;
  v9 = a3;
  v10 = a4;
  sub_2437E5F44((uint64_t)a4, (uint64_t)sub_2437F0DDC, v7);

  swift_release();
}

- (BOOL)validateReadyForAuthorization:(id)a3
{
  unint64_t v3;
  uint64_t v4;
  id v7;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v8;

  v3 = *(unint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_loginChoicesToShow);
  if (v3 >> 62)
  {
    v7 = a3;
    v8 = self;
    swift_bridgeObjectRetain();
    v4 = sub_243850990();

    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v4 != 0;
}

- (void)expandLoginChoicesButtonPressed
{
  void *v2;
  ASCredentialRequestPaneViewControllerDelegate *v3;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_confirmButtonSubpane);
  v4 = self;
  objc_msgSend(v2, sel_disableBiometricView);
  v3 = -[ASCredentialRequestPaneViewController delegate](v4, sel_delegate);
  if (v3)
  {
    -[ASCredentialRequestPaneViewControllerDelegate requestPaneViewControllerPresentExpandedLoginChoiceInterface:](v3, sel_requestPaneViewControllerPresentExpandedLoginChoiceInterface_, v4);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)useCABLEButtonPressed
{
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v2;

  v2 = self;
  sub_2437E9B90();

}

- (void)manualPasswordEntryButtonPressed
{
  ASCredentialRequestPaneViewControllerDelegate *v2;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v3;

  v3 = self;
  v2 = -[ASCredentialRequestPaneViewController delegate](v3, sel_delegate);
  if (v2)
  {
    -[ASCredentialRequestPaneViewControllerDelegate requestPaneViewControllerPresentManualPasswordEntryInterface:](v2, sel_requestPaneViewControllerPresentManualPasswordEntryInterface_, v3);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3
{
  -[PMCredentialPickerViewController presentViewController:animated:completion:](self, sel_presentViewController_animated_completion_, a3, 1, 0);
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v13;
  id v14;

  v10 = _Block_copy(a6);
  _Block_copy(v10);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = a5;
  sub_2437EE2DC(v11, a4, a5, (char *)v13, (void (**)(_QWORD))v10);
  _Block_release(v10);
  _Block_release(v10);

}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  sub_2437EB804(self, (int)a2, a3, a4, a5, a6, (void (*)(void *, void *, id, void *))sub_2437EF0DC);
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyRegistrationCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  sub_2437EB804(self, (int)a2, a3, a4, a5, a6, (void (*)(void *, void *, id, void *))sub_2437EF228);
}

- (void)credentialListViewController:(id)a3 didFinishWithCredential:(id)a4 completion:(id)a5
{
  sub_2437EBDE0(self, (int)a2, a3, a4, a5, (void (*)(void *, id, void *))sub_2437EF838);
}

- (void)credentialListViewControllerDidPrepareInterface:(id)a3
{
  id v4;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v5;

  v4 = a3;
  v5 = self;
  PMCredentialPickerViewController.credentialListViewControllerDidPrepareInterface(_:)(v4);

}

- (void)credentialListViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 completion:(id)a5
{
  sub_2437EBDE0(self, (int)a2, a3, a4, a5, (void (*)(void *, id, void *))sub_2437EFB94);
}

- (void)performConditionalRegistrationIfPossible
{
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v2;

  v2 = self;
  PMCredentialPickerViewController.performConditionalRegistrationIfPossible()();

}

- (void)authenticationProvider:(id)a3 showViewController:(id)a4
{
  id v6;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_2437EFCE8(v6, (uint64_t)&unk_2513FC798, (uint64_t)sub_2437F0B30, (uint64_t)&block_descriptor_98);
  swift_unknownObjectRelease();

}

- (void)authenticationProvider:(id)a3 hideViewController:(id)a4
{
  id v6;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_2437EFEF8(v6);
  swift_unknownObjectRelease();

}

- (void)authenticationProvider:(id)a3 presentAlert:(id)a4 primaryAction:(id)a5 alternateAction:(id)a6
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v13;

  v8 = _Block_copy(a5);
  v9 = _Block_copy(a6);
  v10 = sub_243850180();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v9;
  swift_unknownObjectRetain();
  v13 = self;
  sub_2437F0114(v10, (uint64_t)sub_2437F09C4, v11, (uint64_t)sub_2437F0DE4, v12);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (UIWindow)presentationAnchor
{
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v2;
  UIWindow *result;
  UIWindow *v4;
  id v5;

  v2 = self;
  result = (UIWindow *)-[PMCredentialPickerViewController view](v2, sel_view);
  if (result)
  {
    v4 = result;
    v5 = -[UIWindow window](result, sel_window);

    if (v5)
    {

      return (UIWindow *)v5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (void)keychainSyncStatusMayHaveChangedWithNotificaiton:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v8;
  uint64_t v9;

  v4 = sub_24384D45C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24384D450();
  v8 = self;
  sub_2437ECD6C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
