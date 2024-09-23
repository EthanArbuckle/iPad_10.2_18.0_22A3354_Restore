@implementation CRLSimpleProgressViewController

- (NSProgress)progress
{
  return (NSProgress *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                               + OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_progress));
}

- (_TtC8Freeform31CRLSimpleProgressViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC8Freeform31CRLSimpleProgressViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_progressObservation) = 0;
  *(_QWORD *)&self->progress[OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_isPresented) = 0;
  v5 = a3;

  result = (_TtC8Freeform31CRLSimpleProgressViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/UIAlertController_CRLAdditions.swift", 45, 2, 59, 0);
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLSimpleProgressViewController();
  v4 = v5.receiver;
  -[CRLSimpleProgressViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  v4[OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_isPresented] = 1;

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLSimpleProgressViewController();
  v4 = v5.receiver;
  -[CRLSimpleProgressViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  v4[OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_isPresented] = 0;

}

- (void)loadView
{
  _TtC8Freeform31CRLSimpleProgressViewController *v2;

  v2 = self;
  sub_1005A76F4();

}

- (_TtC8Freeform31CRLSimpleProgressViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform31CRLSimpleProgressViewController *result;

  v4 = a4;
  result = (_TtC8Freeform31CRLSimpleProgressViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLSimpleProgressViewController", 40, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_progress));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_progressObservation));
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_delegate);
}

@end
