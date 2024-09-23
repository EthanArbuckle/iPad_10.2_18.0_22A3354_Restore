@implementation FMRecipientsViewController

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  void *v4;
  double height;
  void *v8;
  id v9;
  _TtC6FindMy26FMRecipientsViewController *v10;
  double v11;
  id v12;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_recipientTextViewHeightConstraint);
  if (v4)
  {
    height = a4.height;
    v8 = (void *)objc_opt_self(MFComposeHeaderView);
    v9 = a3;
    v10 = self;
    v12 = v4;
    objc_msgSend(v8, "preferredHeight");
    if (height > v11)
      v11 = height;
    objc_msgSend(v12, "setConstant:", v11);

  }
  else
  {
    __break(1u);
  }
}

- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3
{
  void *v3;
  _TtC6FindMy26FMRecipientsViewController *v5;
  _TtC6FindMy26FMRecipientsViewController *v6;
  _TtC6FindMy26FMRecipientsViewController *v7;
  _TtC6FindMy26FMRecipientsViewController *v8;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_recipientTextView);
  if (v3)
  {
    v8 = self;
    v5 = (_TtC6FindMy26FMRecipientsViewController *)a3;
    v6 = (_TtC6FindMy26FMRecipientsViewController *)objc_msgSend(v3, "addButton");
    if (v6)
    {
      v7 = v6;
      -[FMRecipientsViewController setAlpha:](v6, "setAlpha:", 1.0);

      v5 = v8;
      v8 = v7;
    }

  }
  else
  {
    __break(1u);
  }
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4;
  _TtC6FindMy26FMRecipientsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10015728C();

}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  id v4;
  _TtC6FindMy26FMRecipientsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100121DE8();

}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC6FindMy26FMRecipientsViewController *v10;

  if (a4)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  sub_1001214D0(a3, v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy26FMRecipientsViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100156ADC();

}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _TtC6FindMy26FMRecipientsViewController *v10;
  char v11;
  uint64_t v12;

  if (a4)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  if ((sub_1003C1200(v6, v8) & 1) == 0)
  {
    v11 = sub_1003C06A0(v6, (unint64_t)v8, 0);
    swift_bridgeObjectRelease(v12);
    if ((v11 & 1) == 0)
      goto LABEL_8;
  }
  if (v8)
  {
    sub_1001566B4(v6, (unint64_t)v8, 0, 0);
LABEL_8:

    swift_bridgeObjectRelease(v8);
    return;
  }
  __break(1u);
}

- (BOOL)recipientViewShouldIgnoreFirstResponderChanges:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC6FindMy26FMRecipientsViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1001474D8(v5);

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  _TtC6FindMy26FMRecipientsViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (char *)a3;
  v12 = self;
  v13 = (void *)sub_100146EA4(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy26FMRecipientsViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10014714C((unint64_t)v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC6FindMy26FMRecipientsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10015B7A0();
}

- (NSArray)keyCommands
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC6FindMy26FMRecipientsViewController *v7;
  NSString v8;
  id v9;
  uint64_t v10;
  Class isa;

  v3 = sub_100053F2C(&qword_1005D2F10);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100481B00;
  static String._unconditionallyBridgeFromObjectiveC(_:)(UIKeyInputEscape);
  v6 = v5;
  v7 = self;
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  v9 = objc_msgSend((id)objc_opt_self(UIKeyCommand), "keyCommandWithInput:modifierFlags:action:", v8, 0, "cancelActionWithSender:");

  *(_QWORD *)(v4 + 32) = v9;
  specialized Array._endMutation()(v10);

  sub_100006C5C(0, (unint64_t *)&unk_1005D8180, UIKeyCommand_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (void)viewDidLoad
{
  _TtC6FindMy26FMRecipientsViewController *v2;

  v2 = self;
  sub_100157628();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMRecipientsViewController(0);
  v4 = v5.receiver;
  -[FMRecipientsViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_100156910();
  sub_100156ADC();

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v3;
  _BOOL8 v4;
  _TtC6FindMy26FMRecipientsViewController *v5;
  id v6;
  void *v7;
  objc_super v8;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_recipientTextView);
  if (v3)
  {
    v4 = a3;
    v5 = self;
    v6 = objc_msgSend(v3, "textView");
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "resignFirstResponder");

      v8.receiver = v5;
      v8.super_class = (Class)type metadata accessor for FMRecipientsViewController(0);
      -[FMRecipientsViewController viewWillDisappear:](&v8, "viewWillDisappear:", v4);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC6FindMy26FMRecipientsViewController *v4;

  v4 = self;
  sub_10015780C(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMRecipientsViewController(0);
  v4 = (char *)v6.receiver;
  -[FMRecipientsViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_peopleSuggester];
  *(_QWORD *)&v4[OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_peopleSuggester] = 0;

}

- (void)showSelectedRecipientContactDetails
{
  _TtC6FindMy26FMRecipientsViewController *v2;

  v2 = self;
  sub_100156D30();

}

- (void)cancelActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy26FMRecipientsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10015B6D8();

}

- (void)actionWithSender:(id)a3
{
  uint64_t v4;
  _TtC6FindMy26FMRecipientsViewController *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;

  v4 = qword_1005D1DE8;
  v11 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_1005D1DE8, sub_100005ADC);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100056D88(v6, (uint64_t)qword_1005F5748);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter(v8);
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "FMRecipientsViewController: Send button pressed - override in subclass", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  _TtC6FindMy26FMRecipientsViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_10015A508((uint64_t)a3);

}

- (_TtC6FindMy26FMRecipientsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy26FMRecipientsViewController *result;

  v4 = a4;
  result = (_TtC6FindMy26FMRecipientsViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMRecipientsViewController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_mediator));
  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_recipientText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_action]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_recipientTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_recipientTextViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_searchedContactsTableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_suggestedContactsTableView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_excludedSuggestedContactHandles));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_rightActionButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_horizontalRuleView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_contactStore));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_operationQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_peopleSuggester));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_alertedOfferOutOfNetworkHandles));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_reachabilityOperation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_searchOperation));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_requiredCapability, &qword_1005D6938);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_searchedContacts));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_suggestedContacts));
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy26FMRecipientsViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1002A6924(v7);

}

@end
