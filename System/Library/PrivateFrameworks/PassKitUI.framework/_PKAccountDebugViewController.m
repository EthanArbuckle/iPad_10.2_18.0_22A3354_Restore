@implementation _PKAccountDebugViewController

- (_PKAccountDebugViewController)initWithConfiguration:(id)a3
{
  return (_PKAccountDebugViewController *)AccountDebugViewController.init(withConfiguration:)(a3);
}

- (_PKAccountDebugViewController)initWithCoder:(id)a3
{
  _PKAccountDebugViewController *result;

  result = (_PKAccountDebugViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  _PKAccountDebugViewController *v2;

  v2 = self;
  sub_19D299AF0(type metadata accessor for AccountDebugViewController, &OBJC_IVAR____PKAccountDebugViewController_hostingVC);

}

- (void)viewWillLayoutSubviews
{
  sub_19D299C74(self, (uint64_t)a2, type metadata accessor for AccountDebugViewController, &OBJC_IVAR____PKAccountDebugViewController_hostingVC);
}

- (id)dictionaryRepresentation
{
  void *v2;
  _PKAccountDebugViewController *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____PKAccountDebugViewController_debugModel);
  v3 = self;
  v4 = v2;
  v5 = sub_19D6CFA44();

  sub_19D299E14((uint64_t)v5);
  swift_bridgeObjectRelease();
  v6 = objc_allocWithZone(MEMORY[0x1E0C99D80]);
  v7 = (void *)sub_19DE87ABC();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_initWithDictionary_copyItems_, v7, 0);

  return v8;
}

- (_PKAccountDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_19D29AA78((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{

}

@end
