@implementation AddToHomeScreenViewController

- (void)cancel
{
  _TtC10WorkflowUI29AddToHomeScreenViewController *v2;

  v2 = self;
  sub_2200D9020();

}

- (void)addHomeScreenShortcut
{
  _TtC10WorkflowUI29AddToHomeScreenViewController *v2;

  v2 = self;
  sub_2200D906C();

}

- (_TtC10WorkflowUI29AddToHomeScreenViewController)initWithCoder:(id)a3
{
  sub_2200D90E0();
}

- (_TtC10WorkflowUI29AddToHomeScreenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v5 = a4;
  AddToHomeScreenViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI29AddToHomeScreenViewController_collectionViewController));
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC10WorkflowUI29AddToHomeScreenViewController *v8;

  type metadata accessor for InfoKey(0);
  sub_22008B5F4(&qword_2555A6370, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_220323174);
  v6 = sub_220306F9C();
  v7 = a3;
  v8 = self;
  AddToHomeScreenViewController.imagePickerController(_:didFinishPickingMediaWithInfo:)((UIImagePickerController *)v8, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC10WorkflowUI29AddToHomeScreenViewController *v8;

  sub_22030459C();
  v6 = sub_220307164();
  v7 = a3;
  v8 = self;
  AddToHomeScreenViewController.documentPicker(_:didPickDocumentsAt:)((UIDocumentPickerViewController *)v8, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

@end
