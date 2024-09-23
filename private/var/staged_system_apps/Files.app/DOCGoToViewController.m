@implementation DOCGoToViewController

- (void)loadView
{
  _TtC5Files21DOCGoToViewController *v2;

  v2 = self;
  sub_100257960();

}

- (void)viewDidLoad
{
  _TtC5Files21DOCGoToViewController *v2;

  v2 = self;
  sub_100257A50();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Files21DOCGoToViewController *v4;

  v4 = self;
  sub_1002588F8(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCGoToViewController(0);
  v4 = v5.receiver;
  -[DOCViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  v4[OBJC_IVAR____TtC5Files21DOCGoToViewController_initialSuggestionsToken] = 1;

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCGoToViewController(0);
  v4 = a3;
  v5 = v6.receiver;
  -[DOCGoToViewController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_100259CB8();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCGoToViewController(0);
  swift_unknownObjectRetain(a4);
  v7 = v8.receiver;
  -[DOCGoToViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  sub_100259CB8();
  swift_unknownObjectRelease(a4);

}

- (void)goToLocation
{
  _TtC5Files21DOCGoToViewController *v2;

  v2 = self;
  sub_100258B94();

}

- (void)didHitDirectionalArrow
{
  _TtC5Files21DOCGoToViewController *v2;
  __int128 v3;
  uint64_t v4;
  _QWORD v5[5];

  v2 = self;
  sub_100256630((uint64_t)&v3);
  if (v4)
  {
    sub_1000E85C4(&v3, (uint64_t)v5);
    sub_100259EF8(v5);
    sub_100068588(v5);
  }
  else
  {
    sub_10000CB4C((uint64_t)&v3, &qword_100649580);
  }

}

- (void)didTab
{
  _TtC5Files21DOCGoToViewController *v2;
  __int128 v3;
  uint64_t v4;
  _QWORD v5[5];

  v2 = self;
  sub_100256630((uint64_t)&v3);
  if (v4)
  {
    sub_1000E85C4(&v3, (uint64_t)v5);
    sub_100259EF8(v5);
    sub_100068588(v5);
  }
  else
  {
    sub_10000CB4C((uint64_t)&v3, &qword_100649580);
  }

}

- (void)didReturn
{
  _TtC5Files21DOCGoToViewController *v2;

  v2 = self;
  sub_100258D74();

}

- (_TtC5Files21DOCGoToViewController)init
{
  _TtC5Files21DOCGoToViewController *result;

  result = (_TtC5Files21DOCGoToViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCGoToViewController", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void *v5;

  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files21DOCGoToViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCGoToViewController_suggestionsTableViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCGoToViewController_contentView));
  sub_100068588((Class *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC5Files21DOCGoToViewController_initialCandidateSource));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files21DOCGoToViewController_filteringSource, &qword_1006495A8);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCGoToViewController_scrollViewDidScrollObservation));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files21DOCGoToViewController_currentGoToLocation, &qword_100649598);
  v3 = (char *)self + OBJC_IVAR____TtC5Files21DOCGoToViewController_requestID;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCGoToViewController____lazy_storage___inputField));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCGoToViewController____lazy_storage___goButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCGoToViewController____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCGoToViewController____lazy_storage___noResultsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCGoToViewController____lazy_storage___suggestionsTableViewController));
  v5 = *(void **)&self->filteringSource[OBJC_IVAR____TtC5Files21DOCGoToViewController_metrics + 7];

  sub_10008D9C4(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC5Files21DOCGoToViewController____lazy_storage___closeBox));
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  _TtC5Files21DOCGoToViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100258D74();

  return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Files21DOCGoToViewController *v11;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_10025BF28(v7, v9);

  swift_bridgeObjectRelease(v9);
  return v7 & 1;
}

- (void)inputTextFieldDidChange:(id)a3
{
  id v4;
  _TtC5Files21DOCGoToViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10025A654(v4);

}

- (void)performDismiss:(id)a3
{
  -[DOCGoToViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
