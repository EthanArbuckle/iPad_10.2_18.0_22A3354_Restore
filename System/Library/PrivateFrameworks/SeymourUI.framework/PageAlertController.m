@implementation PageAlertController

- (unint64_t)supportedInterfaceOrientations
{
  objc_class *ObjectType;
  _TtC9SeymourUI19PageAlertController *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = -[PageAlertController presentingViewController](v4, sel_presentingViewController);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_supportedInterfaceOrientations);

  }
  else
  {
    v9.receiver = v4;
    v9.super_class = ObjectType;
    v7 = -[PageAlertController supportedInterfaceOrientations](&v9, sel_supportedInterfaceOrientations);

  }
  return (unint64_t)v7;
}

- (_TtC9SeymourUI19PageAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  _QWORD *v8;
  id v9;
  _QWORD *v10;
  id v11;
  _TtC9SeymourUI19PageAlertController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_22BA8067C();
    v8 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
    *v8 = 0;
    v8[1] = 0;
    v9 = a4;
    a3 = (id)sub_22BA8064C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
    *v10 = 0;
    v10[1] = 0;
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[PageAlertController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, a3, a4);

  return v12;
}

- (_TtC9SeymourUI19PageAlertController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
  *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[PageAlertController initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (void)textFieldDidBeginEditing:(id)a3
{
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(id, _UNKNOWN **, uint64_t, uint64_t);
  id v8;
  _TtC9SeymourUI19PageAlertController *v9;

  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter))
  {
    v5 = *(_QWORD *)((char *)&self->super.super.super._responderFlags
                   + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
    ObjectType = swift_getObjectType();
    v7 = *(void (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v5 + 56);
    v8 = a3;
    v9 = self;
    swift_unknownObjectRetain();
    v7(v8, &off_24F5B1380, ObjectType, v5);

    swift_unknownObjectRelease();
  }
}

- (void)textFieldDidChangeSelection:(id)a3
{
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(id, _UNKNOWN **, uint64_t, uint64_t);
  id v8;
  _TtC9SeymourUI19PageAlertController *v9;

  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter))
  {
    v5 = *(_QWORD *)((char *)&self->super.super.super._responderFlags
                   + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
    ObjectType = swift_getObjectType();
    v7 = *(void (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v5 + 64);
    v8 = a3;
    v9 = self;
    swift_unknownObjectRetain();
    v7(v8, &off_24F5B1380, ObjectType, v5);

    swift_unknownObjectRelease();
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t (*v15)(id, _UNKNOWN **, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t, uint64_t);
  id v16;
  _TtC9SeymourUI19PageAlertController *v17;
  char v18;

  length = a4.length;
  location = a4.location;
  v9 = sub_22BA8067C();
  v11 = v10;
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter))
  {
    v12 = v9;
    v13 = *(_QWORD *)((char *)&self->super.super.super._responderFlags
                    + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
    ObjectType = swift_getObjectType();
    v15 = *(uint64_t (**)(id, _UNKNOWN **, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 72);
    v16 = a3;
    v17 = self;
    swift_unknownObjectRetain();
    v18 = v15(v16, &off_24F5B1380, location, length, v12, v11, ObjectType, v13);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = 1;
  }
  return v18 & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  uint64_t v5;
  uint64_t ObjectType;
  uint64_t (*v7)(id, _UNKNOWN **, uint64_t, uint64_t);
  id v8;
  _TtC9SeymourUI19PageAlertController *v9;
  char v10;

  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter))
  {
    v5 = *(_QWORD *)((char *)&self->super.super.super._responderFlags
                   + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
    ObjectType = swift_getObjectType();
    v7 = *(uint64_t (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v5 + 80);
    v8 = a3;
    v9 = self;
    swift_unknownObjectRetain();
    v10 = v7(v8, &off_24F5B1380, ObjectType, v5);

    swift_unknownObjectRelease();
  }
  else
  {
    v10 = 1;
  }
  return v10 & 1;
}

@end
