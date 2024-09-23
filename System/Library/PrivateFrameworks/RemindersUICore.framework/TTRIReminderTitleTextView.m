@implementation TTRIReminderTitleTextView

- (_TtC15RemindersUICore25TTRIReminderTitleTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s15RemindersUICore25TTRIReminderTitleTextViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)bulletedListStyleAction:(id)a3
{
  sub_1B455DC00(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (void)dashedListStyleAction:(id)a3
{
  sub_1B455DC00(self, (uint64_t)a2, (uint64_t)a3, 2);
}

- (void)numberedListStyleAction:(id)a3
{
  sub_1B455DC00(self, (uint64_t)a2, (uint64_t)a3, 3);
}

- (UITextInputDelegate)inputDelegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRIReminderTitleTextView();
  return -[TTRIReminderTitleTextView inputDelegate](&v3, sel_inputDelegate);
}

- (void)setInputDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIReminderTitleTextView();
  swift_unknownObjectRetain();
  v4 = v5.receiver;
  -[TTRIReminderTitleTextView setInputDelegate:](&v5, sel_setInputDelegate_, a3);
  sub_1B455DE4C();

  swift_unknownObjectRelease();
}

- (void)deleteBackward
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t ObjectType;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRIReminderTitleTextView();
  v2 = v9.receiver;
  -[TTRIReminderTitleTextView deleteBackward](&v9, sel_deleteBackward);
  v3 = objc_msgSend(v2, sel_delegate, v9.receiver, v9.super_class);
  if (v3)
  {
    v4 = v3;
    swift_getObjectType();
    v5 = swift_conformsToProtocol2();
    if (v5)
      v6 = v5;
    else
      v6 = 0;
    if (v5)
      v7 = v4;
    else
      v7 = 0;
    if (v7)
    {
      ObjectType = swift_getObjectType();
      (*(void (**)(id, uint64_t, uint64_t))(v6 + 80))(v2, ObjectType, v6);
    }

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)insertTextSuggestion:(id)a3
{
  id v5;
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v6;

  v5 = a3;
  v6 = self;
  TTRIReminderTitleTextView.insert(_:)((UITextSuggestion_optional *)a3);

}

- (void)copy:(id)a3
{
  sub_1B4535360(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))TTRIReminderTitleTextView.copy(_:));
}

- (void)paste:(id)a3
{
  sub_1B4535360(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))TTRIReminderTitleTextView.paste(_:));
}

- (void)toggleBoldface:(id)a3
{
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v4;
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t ObjectType;
  __int128 v15;
  __int128 v16;

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v5 = self;
  }
  v6 = -[TTRIReminderTitleTextView selectedRange](self, sel_selectedRange, v15, v16);
  v8 = v7;
  v9 = -[TTRIReminderTitleTextView delegate](self, sel_delegate);
  if (v9)
  {
    v10 = v9;
    swift_getObjectType();
    v11 = swift_conformsToProtocol2();
    if (v11)
      v12 = v11;
    else
      v12 = 0;
    if (v11)
      v13 = v10;
    else
      v13 = 0;
    if (v13)
    {
      ObjectType = swift_getObjectType();
      (*(void (**)(_TtC15RemindersUICore25TTRIReminderTitleTextView *, id, uint64_t, uint64_t, uint64_t))(v12 + 48))(self, v6, v8, ObjectType, v12);
    }

    swift_unknownObjectRelease();
  }
  else
  {

  }
  sub_1B41EA560((uint64_t)&v15, &qword_1ED4ED170);
}

- (void)toggleItalics:(id)a3
{
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v4;
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t ObjectType;
  __int128 v15;
  __int128 v16;

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v5 = self;
  }
  v6 = -[TTRIReminderTitleTextView selectedRange](self, sel_selectedRange, v15, v16);
  v8 = v7;
  v9 = -[TTRIReminderTitleTextView delegate](self, sel_delegate);
  if (v9)
  {
    v10 = v9;
    swift_getObjectType();
    v11 = swift_conformsToProtocol2();
    if (v11)
      v12 = v11;
    else
      v12 = 0;
    if (v11)
      v13 = v10;
    else
      v13 = 0;
    if (v13)
    {
      ObjectType = swift_getObjectType();
      (*(void (**)(_TtC15RemindersUICore25TTRIReminderTitleTextView *, id, uint64_t, uint64_t, uint64_t))(v12 + 56))(self, v6, v8, ObjectType, v12);
    }

    swift_unknownObjectRelease();
  }
  else
  {

  }
  sub_1B41EA560((uint64_t)&v15, &qword_1ED4ED170);
}

- (void)toggleUnderline:(id)a3
{
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v4;
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t ObjectType;
  __int128 v15;
  __int128 v16;

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v5 = self;
  }
  v6 = -[TTRIReminderTitleTextView selectedRange](self, sel_selectedRange, v15, v16);
  v8 = v7;
  v9 = -[TTRIReminderTitleTextView delegate](self, sel_delegate);
  if (v9)
  {
    v10 = v9;
    swift_getObjectType();
    v11 = swift_conformsToProtocol2();
    if (v11)
      v12 = v11;
    else
      v12 = 0;
    if (v11)
      v13 = v10;
    else
      v13 = 0;
    if (v13)
    {
      ObjectType = swift_getObjectType();
      (*(void (**)(_TtC15RemindersUICore25TTRIReminderTitleTextView *, id, uint64_t, uint64_t, uint64_t))(v12 + 64))(self, v6, v8, ObjectType, v12);
    }

    swift_unknownObjectRelease();
  }
  else
  {

  }
  sub_1B41EA560((uint64_t)&v15, &qword_1ED4ED170);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v6;
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v7;
  unsigned __int8 v8;
  _OWORD v10[2];

  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = TTRIReminderTitleTextView.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  sub_1B41EA560((uint64_t)v10, &qword_1ED4ED170);
  return v8 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4;
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v5;

  v4 = a3;
  v5 = self;
  TTRIReminderTitleTextView.validate(_:)((UICommand)v4);

}

- (void)beginSelectionChange
{
  char *v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TTRIReminderTitleTextView();
  v2 = (char *)v4.receiver;
  -[TTRIReminderTitleTextView beginSelectionChange](&v4, sel_beginSelectionChange);
  v3 = &v2[OBJC_IVAR____TtC15RemindersUICore25TTRIReminderTitleTextView_isChangingSelection];
  swift_beginAccess();
  *v3 = 1;

}

- (void)endSelectionChange
{
  _BYTE *v2;
  _BYTE *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TTRIReminderTitleTextView();
  v2 = v4.receiver;
  -[TTRIReminderTitleTextView endSelectionChange](&v4, sel_endSelectionChange);
  v3 = &v2[OBJC_IVAR____TtC15RemindersUICore25TTRIReminderTitleTextView_isChangingSelection];
  swift_beginAccess();
  *v3 = 0;
  v2[OBJC_IVAR____TtC15RemindersUICore25TTRIReminderTitleTextView_needsAdjustSelectionToSelectToken] = 1;
  objc_msgSend(v2, sel_setNeedsLayout);
  v2[OBJC_IVAR____TtC15RemindersUICore25TTRIReminderTitleTextView_needsAdjustInternalTypingAttributes] = 1;
  objc_msgSend(v2, sel_setNeedsLayout);

}

- (void)layoutSubviews
{
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v2;

  v2 = self;
  TTRIReminderTitleTextView.layoutSubviews()();

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t ObjectType;
  char v15;
  void *v16;
  objc_super v17;

  sub_1B41DF50C(0, (unint64_t *)&unk_1EF0A7B70);
  sub_1B456074C();
  v6 = sub_1B49070AC();
  v7 = self;
  v8 = a4;
  v9 = -[TTRIReminderTitleTextView delegate](v7, sel_delegate);
  if (!v9)
    goto LABEL_12;
  v10 = v9;
  swift_getObjectType();
  v11 = swift_conformsToProtocol2();
  if (v11)
    v12 = v11;
  else
    v12 = 0;
  if (v11)
    v13 = v10;
  else
    v13 = 0;
  if (!v13)
  {
    swift_unknownObjectRelease();
    goto LABEL_12;
  }
  ObjectType = swift_getObjectType();
  v15 = (*(uint64_t (**)(_TtC15RemindersUICore25TTRIReminderTitleTextView *, uint64_t, uint64_t, uint64_t))(v12 + 88))(v7, v6, ObjectType, v12);
  swift_unknownObjectRelease();
  if ((v15 & 1) == 0)
  {
LABEL_12:
    v16 = (void *)sub_1B49070A0();
    v17.receiver = v7;
    v17.super_class = (Class)type metadata accessor for TTRIReminderTitleTextView();
    -[TTRIReminderTitleTextView pressesBegan:withEvent:](&v17, sel_pressesBegan_withEvent_, v16, v8);

    swift_bridgeObjectRelease();
    goto LABEL_13;
  }

  swift_bridgeObjectRelease();
LABEL_13:

}

- (NSString)accessibilityValue
{
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = self;
  v3 = -[TTRIReminderTitleTextView text](v2, sel_text);
  if (v3)
  {
    v4 = v3;
    sub_1B4906A64();

    v5 = (void *)sub_1B4906A34();
    swift_bridgeObjectRelease();
  }
  else
  {

    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)canBecomeFocused
{
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v2;
  int IsHardwareKeyboardAttached;

  v2 = self;
  if (-[TTRIReminderTitleTextView isEditing](v2, sel_isEditing))
  {

    return 1;
  }
  else if (_AXSFullKeyboardAccessEnabled())
  {
    IsHardwareKeyboardAttached = GSEventIsHardwareKeyboardAttached();

    return IsHardwareKeyboardAttached != 0;
  }
  else
  {

    return 0;
  }
}

- (void)removeHashtagAttribute:(id)a3
{
  sub_1B455FD20(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))TTRIReminderTitleTextView.removeHashtagAttribute(_:));
}

- (void)removeHashtagAttributedText:(id)a3
{
  sub_1B455FD20(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))TTRIReminderTitleTextView.removeHashtagAttributedText(_:));
}

- (void)adoptForeignHashtag:(id)a3
{
  sub_1B455FD20(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))TTRIReminderTitleTextView.adoptForeignHashtag(_:));
}

- (void)convertTextToHashtag:(id)a3
{
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v4;
  _TtC15RemindersUICore25TTRIReminderTitleTextView *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t ObjectType;
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v5 = self;
  }
  v6 = -[TTRIReminderTitleTextView delegate](self, sel_delegate, v14, v15);
  if (v6)
  {
    v7 = v6;
    swift_getObjectType();
    v8 = swift_conformsToProtocol2();
    if (v8)
      v9 = v8;
    else
      v9 = 0;
    if (v8)
      v10 = v7;
    else
      v10 = 0;
    if (v10)
    {
      ObjectType = swift_getObjectType();
      v12 = -[TTRIReminderTitleTextView selectedRange](self, sel_selectedRange);
      (*(void (**)(_TtC15RemindersUICore25TTRIReminderTitleTextView *, id, uint64_t, uint64_t, uint64_t))(v9 + 40))(self, v12, v13, ObjectType, v9);
    }

    swift_unknownObjectRelease();
  }
  else
  {

  }
  sub_1B41EA560((uint64_t)&v14, &qword_1ED4ED170);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore25TTRIReminderTitleTextView_reminderTextStorage));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
