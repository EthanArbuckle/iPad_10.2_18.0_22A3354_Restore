@implementation MathNotesHostingViewController

- (_TtC15NotesUIServices30MathNotesHostingViewController)init
{
  char *v3;
  objc_class *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_sceneHostingController) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  v4 = (objc_class *)type metadata accessor for MathNotesHostingViewController();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[MathNotesHostingViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC15NotesUIServices30MathNotesHostingViewController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC15NotesUIServices30MathNotesHostingViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_sceneHostingController) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC15NotesUIServices30MathNotesHostingViewController *)sub_243157C84();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MathNotesHostingViewController();
  v2 = v3.receiver;
  -[MathNotesHostingViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_24314D47C();

}

- (_TtC15NotesUIServices30MathNotesHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15NotesUIServices30MathNotesHostingViewController *result;

  v4 = a4;
  result = (_TtC15NotesUIServices30MathNotesHostingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_sceneHostingController));
  sub_24314C174((uint64_t)self + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate, &qword_257287930);
}

@end
