@implementation AddressEditorView.Coordinator

- (void)addressEditorViewControllerDidCancel:(id)a3
{
  void (*v4)(_QWORD);
  id v5;
  _TtCV9PassKitUI17AddressEditorView11Coordinator *v6;

  v4 = *(void (**)(_QWORD))((char *)&self->super.isa
                                     + OBJC_IVAR____TtCV9PassKitUI17AddressEditorView11Coordinator_dismiss);
  v5 = a3;
  v6 = self;
  v4(0);

}

- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4
{
  void (*v6)(id);
  id v7;
  id v8;
  _TtCV9PassKitUI17AddressEditorView11Coordinator *v9;

  v6 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCV9PassKitUI17AddressEditorView11Coordinator_dismiss);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v6(a4);

}

- (_TtCV9PassKitUI17AddressEditorView11Coordinator)init
{
  _TtCV9PassKitUI17AddressEditorView11Coordinator *result;

  result = (_TtCV9PassKitUI17AddressEditorView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
