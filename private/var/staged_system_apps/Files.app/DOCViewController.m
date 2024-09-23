@implementation DOCViewController

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Files17DOCViewController_appearStateTracker));
}

- (_TtC5Files17DOCViewController)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC5Files17DOCViewController_appearStateTracker;
  v4 = type metadata accessor for DOCAppearStateTracker();
  v5 = swift_allocObject(v4, 19, 7);
  *(_WORD *)(v5 + 16) = 0;
  *(_BYTE *)(v5 + 18) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)v5;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCViewController();
  return -[DOCViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_100011490((char *)self, (uint64_t)a2, a3, 3, (SEL *)&selRef_viewWillDisappear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_100011490((char *)self, (uint64_t)a2, a3, 0, (SEL *)&selRef_viewDidDisappear_);
}

- (void)viewIsAppearing:(BOOL)a3
{
  sub_100011490((char *)self, (uint64_t)a2, a3, 1, (SEL *)&selRef_viewIsAppearing_);
}

- (void)viewWillAppear:(BOOL)a3
{
  sub_100011490((char *)self, (uint64_t)a2, a3, 1, (SEL *)&selRef_viewWillAppear_);
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_100011490((char *)self, (uint64_t)a2, a3, 2, (SEL *)&selRef_viewDidAppear_);
}

- (_TtC5Files17DOCViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC5Files17DOCViewController *result;

  v5 = OBJC_IVAR____TtC5Files17DOCViewController_appearStateTracker;
  v6 = type metadata accessor for DOCAppearStateTracker();
  v7 = swift_allocObject(v6, 19, 7);
  *(_WORD *)(v7 + 16) = 0;
  *(_BYTE *)(v7 + 18) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v7;
  v8 = a3;

  result = (_TtC5Files17DOCViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/UIKit+DOCAdditionsCore.swift", 34, 2, 12, 0);
  __break(1u);
  return result;
}

- (_TtC5Files17DOCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC5Files17DOCViewController *result;

  v6 = OBJC_IVAR____TtC5Files17DOCViewController_appearStateTracker;
  v7 = type metadata accessor for DOCAppearStateTracker();
  v8 = swift_allocObject(v7, 19, 7);
  *(_WORD *)(v8 + 16) = 0;
  *(_BYTE *)(v8 + 18) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)v8;
  v9 = a4;

  result = (_TtC5Files17DOCViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002ELL, 0x800000010053A930, "Files/UIKit+DOCAdditionsCore.swift", 34, 2, 16, 0);
  __break(1u);
  return result;
}

@end
