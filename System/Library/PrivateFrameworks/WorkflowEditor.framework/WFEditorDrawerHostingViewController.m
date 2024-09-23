@implementation WFEditorDrawerHostingViewController

- (WFEditorDrawerHostingViewController)initWithHome:(id)a3 workflow:(id)a4 actionSuggester:(id)a5
{
  id v8;

  v8 = a3;
  return (WFEditorDrawerHostingViewController *)EditorDrawerHostingViewController.init(home:workflow:actionSuggester:)(a3, a4, a5);
}

- (WFEditorDrawerHostingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_226840318();
}

- (void)loadView
{
  WFEditorDrawerHostingViewController *v2;

  v2 = self;
  sub_2268403F8();

}

- (void)viewDidLoad
{
  WFEditorDrawerHostingViewController *v2;

  v2 = self;
  sub_226840948();

}

- (WFActionDrawerDelegate)delegate
{
  sub_2268409D0();
}

- (void)setDelegate:(id)a3
{
  WFEditorDrawerHostingViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_226840A28();

}

- (unint64_t)navigationStyle
{
  unint64_t result;

  sub_226840AD8();
  return result;
}

- (void)setNavigationStyle:(unint64_t)a3
{
  WFEditorDrawerHostingViewController *v4;

  v4 = self;
  sub_226840B50(a3);

}

- (WFActionDrawerScrollViewObserver)scrollViewObserver
{
  sub_226840C1C();
}

- (void)setScrollViewObserver:(id)a3
{
  WFEditorDrawerHostingViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_226840CA8();

}

- (double)headerHeight
{
  return sub_226840E18();
}

- (void)setHeaderHeight:(double)a3
{
  WFEditorDrawerHostingViewController *v4;

  v4 = self;
  sub_226840E9C(a3);

}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  WFEditorDrawerHostingViewController *v4;
  id v5;

  v4 = self;
  v5 = sub_226841008(a3);

  return v5;
}

- (void)focusSearchBar
{
  WFEditorDrawerHostingViewController *v2;

  v2 = self;
  sub_226841078();

}

- (void)clearSearchBar
{
  WFEditorDrawerHostingViewController *v2;

  v2 = self;
  sub_226841118();

}

- (void)didTransitionToVisibility:(unint64_t)a3
{
  WFEditorDrawerHostingViewController *v3;

  v3 = self;
  sub_226841178();

}

- (void)performScrollingTest:(id)a3
{
  WFEditorDrawerHostingViewController *v4;

  sub_22688E220();
  v4 = self;
  sub_2268411DC();

  swift_bridgeObjectRelease();
}

- (WFEditorDrawerHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_22688E220();
  v5 = a4;
  EditorDrawerHostingViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFEditorDrawerHostingViewController_hostingViewController));
  swift_release();

  swift_release();
  sub_22669DFD4((uint64_t)self + OBJC_IVAR___WFEditorDrawerHostingViewController_delegate);
  sub_22669DFD4((uint64_t)self + OBJC_IVAR___WFEditorDrawerHostingViewController_scrollViewObserver);
}

@end
