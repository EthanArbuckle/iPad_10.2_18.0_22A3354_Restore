@implementation _UITextFormattingViewControllerDelegateBox

- (void)textFormattingViewController:(id)a3 didChangeValue:(id)a4
{
  id v6;
  id v7;
  _TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1857A60FC((uint64_t)v6, v7);

}

- (BOOL)textFormattingViewController:(id)a3 shouldPresentFontPicker:(id)a4
{
  char *v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t (*v10)(id, id, uint64_t, uint64_t);
  id v11;
  id v12;
  _TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox *v13;
  char v14;

  v7 = (char *)self
     + OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate;
  if (MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate, a2))
  {
    v8 = *((_QWORD *)v7 + 1);
    ObjectType = swift_getObjectType();
    v10 = *(uint64_t (**)(id, id, uint64_t, uint64_t))(v8 + 16);
    v11 = a3;
    v12 = a4;
    v13 = self;
    v14 = v10(v11, v12, ObjectType, v8);

    swift_unknownObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

- (BOOL)textFormattingViewController:(id)a3 shouldPresentColorPicker:(id)a4
{
  char *v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t (*v10)(id, id, uint64_t, uint64_t);
  id v11;
  id v12;
  _TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox *v13;
  char v14;

  v7 = (char *)self
     + OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate;
  if (MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate, a2))
  {
    v8 = *((_QWORD *)v7 + 1);
    ObjectType = swift_getObjectType();
    v10 = *(uint64_t (**)(id, id, uint64_t, uint64_t))(v8 + 24);
    v11 = a3;
    v12 = a4;
    v13 = self;
    v14 = v10(v11, v12, ObjectType, v8);

    swift_unknownObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

- (void)textFormattingDidFinish:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(id, uint64_t, uint64_t);
  id v9;
  _TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox *v10;

  v5 = (char *)self
     + OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate;
  if (MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 32);
    v9 = a3;
    v10 = self;
    v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (id)_disabledComponentsForTextFormattingViewController:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(id, uint64_t, uint64_t);
  id v9;
  _TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox *v10;
  void *v11;

  v5 = (char *)self
     + OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate;
  if (MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 40);
    v9 = a3;
    v10 = self;
    v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
  type metadata accessor for ComponentKey(0);
  sub_1857A68EC();
  v11 = (void *)sub_1865077E0();
  swift_bridgeObjectRelease();
  return v11;
}

- (_TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox)init
{
  objc_super v4;

  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for _UITextFormattingViewControllerDelegateBox();
  return -[_UITextFormattingViewControllerDelegateBox init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_18563E558((uint64_t)self+ OBJC_IVAR____TtC5UIKitP33_B50EEBA0FD25BA8C617D8B9D7A7CF9F242_UITextFormattingViewControllerDelegateBox_delegate);
}

@end
