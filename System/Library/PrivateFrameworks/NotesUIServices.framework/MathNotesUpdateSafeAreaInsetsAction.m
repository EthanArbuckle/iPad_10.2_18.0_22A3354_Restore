@implementation MathNotesUpdateSafeAreaInsetsAction

- (void)performActionForSceneController:(id)a3
{
  id v4;
  _TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction *v5;

  v4 = a3;
  v5 = self;
  MathNotesUpdateSafeAreaInsetsAction.performAction(forSceneController:)(v4);

}

- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)initWithInfo:(id)a3 responder:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[MathNotesUpdateSafeAreaInsetsAction initWithInfo:responder:](&v7, sel_initWithInfo_responder_, a3, a4);
}

- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v9 = _Block_copy(a6);
  if (v9)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    v9 = sub_24314E40C;
  }
  else
  {
    v10 = 0;
  }
  v11 = a3;
  v12 = a5;
  return (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction *)MathNotesUpdateSafeAreaInsetsAction.init(info:timeout:forResponseOn:withHandler:)(a3, a5, (uint64_t)v9, v10, a4);
}

- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[MathNotesUpdateSafeAreaInsetsAction init](&v3, sel_init);
}

- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)initWithXPCDictionary:(id)a3
{
  return (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction *)sub_24314D0DC(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)initWithCoder:(id)a3
{
  return (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction *)sub_24314D0DC(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end
