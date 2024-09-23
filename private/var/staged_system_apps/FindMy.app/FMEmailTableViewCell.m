@implementation FMEmailTableViewCell

- (void)textFieldDidChangeWithSender:(id)a3
{
  char *v4;
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(id, uint64_t, uint64_t);
  id v10;
  _TtC6FindMy20FMEmailTableViewCell *v11;
  id v12;
  _TtC6FindMy20FMEmailTableViewCell *v13;

  v4 = (char *)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_delegate);
  if (Strong)
  {
    v6 = Strong;
    v7 = *((_QWORD *)v4 + 1);
    ObjectType = swift_getObjectType(Strong);
    v9 = *(void (**)(id, uint64_t, uint64_t))(v7 + 8);
    v10 = a3;
    v11 = self;
    v9(v10, ObjectType, v7);
    swift_unknownObjectRelease(v6);
  }
  else
  {
    v12 = a3;
    v13 = self;
  }
  sub_10032B5C8();

}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  char *v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  void (*v11)(id, uint64_t, uint64_t);
  id v12;
  _TtC6FindMy20FMEmailTableViewCell *v13;

  v6 = (char *)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_delegate);
  if (Strong)
  {
    v8 = Strong;
    v9 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType(Strong);
    v11 = *(void (**)(id, uint64_t, uint64_t))(v9 + 8);
    v12 = a3;
    v13 = self;
    v11(v12, ObjectType, v9);

    swift_unknownObjectRelease(v8);
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t Strong;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  id v18;
  _TtC6FindMy20FMEmailTableViewCell *v19;
  id v20;
  char v21;
  id v22;
  _TtC6FindMy20FMEmailTableViewCell *v23;
  uint64_t (*v25)(id, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t, uint64_t);

  length = a4.length;
  location = a4.location;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = (char *)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_delegate);
  if (Strong)
  {
    v14 = Strong;
    v15 = *((_QWORD *)v12 + 1);
    ObjectType = swift_getObjectType(Strong);
    v25 = *(uint64_t (**)(id, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 16);
    v17 = v11;
    v18 = a3;
    v19 = self;
    v20 = v18;
    v11 = v17;
    v21 = v25(v20, location, length, v9, v17, ObjectType, v15);
    swift_unknownObjectRelease(v14);
  }
  else
  {
    v22 = a3;
    v23 = self;
    v21 = 0;
  }
  sub_10032B5C8();

  swift_bridgeObjectRelease(v11);
  return v21 & 1;
}

- (void)textViewDidChange:(id)a3
{
  void *Strong;
  void *v5;
  unsigned __int8 v6;
  id v7;
  _TtC6FindMy20FMEmailTableViewCell *v8;
  id v9;
  _TtC6FindMy20FMEmailTableViewCell *v10;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_textViewDelegate);
  if (Strong)
  {
    v5 = Strong;
    v6 = objc_msgSend(Strong, "respondsToSelector:", "textViewDidChange:");
    v7 = a3;
    v8 = self;
    if ((v6 & 1) != 0)
      objc_msgSend(v5, "textViewDidChange:", v7);
    swift_unknownObjectRelease(v5);
  }
  else
  {
    v9 = a3;
    v10 = self;
  }
  sub_10032B5C8();

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  void *Strong;
  void *v12;
  unsigned __int8 v13;
  id v14;
  _TtC6FindMy20FMEmailTableViewCell *v15;
  NSString v16;
  unsigned __int8 v17;
  id v18;
  _TtC6FindMy20FMEmailTableViewCell *v19;

  length = a4.length;
  location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_textViewDelegate);
  if (!Strong)
  {
    v18 = a3;
    v19 = self;
LABEL_6:
    v17 = 0;
    goto LABEL_7;
  }
  v12 = Strong;
  v13 = objc_msgSend(Strong, "respondsToSelector:", "textView:shouldChangeTextInRange:replacementText:");
  v14 = a3;
  v15 = self;
  if ((v13 & 1) == 0)
  {
    swift_unknownObjectRelease(v12);
    goto LABEL_6;
  }
  v16 = String._bridgeToObjectiveC()();
  v17 = objc_msgSend(v12, "textView:shouldChangeTextInRange:replacementText:", v14, location, length, v16);
  swift_unknownObjectRelease(v12);

LABEL_7:
  sub_10032B5C8();

  swift_bridgeObjectRelease(v10);
  return v17;
}

- (_TtC6FindMy20FMEmailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC6FindMy20FMEmailTableViewCell *)sub_10032BBAC(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy20FMEmailTableViewCell)initWithCoder:(id)a3
{
  return (_TtC6FindMy20FMEmailTableViewCell *)sub_10032BD64(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_textField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_textView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_placeHolderLabel));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_delegate);
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_textViewDelegate);
  swift_bridgeObjectRelease(*(_QWORD *)&self->textField[OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_initialEmailAddress]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->textField[OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_placeHolderText]);
}

@end
