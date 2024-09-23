@implementation CRLBoardRenameAlertTextFieldDelegate

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC8FreeformP33_1F7AC1847BE2554B067346642BF3ED1536CRLBoardRenameAlertTextFieldDelegate *v13;

  length = a4.length;
  location = a4.location;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_100557A1C(v12, location, length, v9, v11);

  swift_bridgeObjectRelease(v11);
  return length & 1;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  uint64_t Strong;
  void *v6;
  id v7;
  _TtC8FreeformP33_1F7AC1847BE2554B067346642BF3ED1536CRLBoardRenameAlertTextFieldDelegate *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8FreeformP33_1F7AC1847BE2554B067346642BF3ED1536CRLBoardRenameAlertTextFieldDelegate_editAction);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = a3;
    v8 = self;
    objc_msgSend(v6, "setEnabled:", 0);

  }
  return 1;
}

- (_TtC8FreeformP33_1F7AC1847BE2554B067346642BF3ED1536CRLBoardRenameAlertTextFieldDelegate)init
{
  objc_super v4;

  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtC8FreeformP33_1F7AC1847BE2554B067346642BF3ED1536CRLBoardRenameAlertTextFieldDelegate_editAction);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CRLBoardRenameAlertTextFieldDelegate();
  return -[CRLBoardRenameAlertTextFieldDelegate init](&v4, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC8FreeformP33_1F7AC1847BE2554B067346642BF3ED1536CRLBoardRenameAlertTextFieldDelegate_editAction);
}

@end
