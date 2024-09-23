@implementation FMEditableMessageTableViewCell

- (void)textViewDidChange:(id)a3
{
  void *Strong;
  void *v6;
  id v7;
  _TtC6FindMy30FMEditableMessageTableViewCell *v8;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy30FMEditableMessageTableViewCell_delegate);
  if (Strong)
  {
    v6 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "textViewDidChange:") & 1) != 0)
    {
      v7 = a3;
      v8 = self;
      objc_msgSend(v6, "textViewDidChange:", v7);

    }
    swift_unknownObjectRelease(v6);
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  void *Strong;
  void *v12;
  id v13;
  _TtC6FindMy30FMEditableMessageTableViewCell *v14;
  NSString v15;
  unsigned __int8 v16;

  length = a4.length;
  location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy30FMEditableMessageTableViewCell_delegate);
  if (Strong)
  {
    v12 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "textView:shouldChangeTextInRange:replacementText:") & 1) != 0)
    {
      v13 = a3;
      v14 = self;
      v15 = String._bridgeToObjectiveC()();
      v16 = objc_msgSend(v12, "textView:shouldChangeTextInRange:replacementText:", v13, location, length, v15);

      swift_bridgeObjectRelease(v10);
      swift_unknownObjectRelease(v12);

      return v16;
    }
    swift_bridgeObjectRelease(v10);
    swift_unknownObjectRelease(v12);
  }
  else
  {
    swift_bridgeObjectRelease(v10);
  }
  return 0;
}

- (_TtC6FindMy30FMEditableMessageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC6FindMy30FMEditableMessageTableViewCell *)sub_1002FFB60(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy30FMEditableMessageTableViewCell)initWithCoder:(id)a3
{
  return (_TtC6FindMy30FMEditableMessageTableViewCell *)sub_1002FFCA4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMEditableMessageTableViewCell_textView));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy30FMEditableMessageTableViewCell_delegate);
}

@end
