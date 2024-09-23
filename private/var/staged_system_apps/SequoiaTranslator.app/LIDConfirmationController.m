@implementation LIDConfirmationController

- (_TtC17SequoiaTranslator25LIDConfirmationController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC17SequoiaTranslator25LIDConfirmationController *)sub_100100640(v5, v7, a4);
}

- (_TtC17SequoiaTranslator25LIDConfirmationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100101CEC();
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LIDConfirmationController(0);
  v2 = v3.receiver;
  -[LIDConfirmationController viewDidLoad](&v3, "viewDidLoad");
  sub_100100940();
  sub_100101280();

}

- (void)optionButtonPressedWithSender:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator25LIDConfirmationController *v5;

  v4 = a3;
  v5 = self;
  sub_1001015C0((uint64_t)v4);

}

- (void)backgroundTappedWithRecognizer:(id)a3
{
  uint64_t Strong;
  void *v6;
  id v7;
  _TtC17SequoiaTranslator25LIDConfirmationController *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_delegate);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = a3;
    v8 = self;
    objc_msgSend(v6, "cancelConfirmation");

    swift_unknownObjectRelease(v6);
  }
}

- (void)hintTapped
{
  _TtC17SequoiaTranslator25LIDConfirmationController *v2;

  v2 = self;
  sub_100101998();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_confirmationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_hintButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_layoutContainer));
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_delegate);
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_languageDownloadPresenter);
  sub_1000A8C7C((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_sourceLocale);
  sub_1000A8C7C((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_targetLocale);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC17SequoiaTranslator25LIDConfirmationController *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  char v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v7, "view");
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, "isDescendantOfView:", *(Class *)((char *)&v8->super.super.super.isa+ OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_layoutContainer));

    v12 = v11 ^ 1;
  }
  else
  {

    v12 = 1;
  }

  return v12;
}

@end
