@implementation JSONTextViewController

- (_TtC5TeaUI22JSONTextViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B1675F24();
}

- (void)viewDidLoad
{
  _TtC5TeaUI22JSONTextViewController *v2;

  v2 = self;
  JSONTextViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5TeaUI22JSONTextViewController *v4;

  v4 = self;
  JSONTextViewController.viewWillAppear(_:)(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC5TeaUI22JSONTextViewController *v2;

  v2 = self;
  JSONTextViewController.viewWillLayoutSubviews()();

}

- (UIView)inputAccessoryView
{
  _TtC5TeaUI22JSONTextViewController *v2;
  id v3;

  v2 = self;
  v3 = JSONTextViewController.inputAccessoryView.getter();

  return (UIView *)v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)nextToken
{
  _TtC5TeaUI22JSONTextViewController *v2;

  v2 = self;
  sub_1B16769CC(sub_1B168785C);

}

- (void)previousToken
{
  _TtC5TeaUI22JSONTextViewController *v2;

  v2 = self;
  sub_1B16769CC(sub_1B1687950);

}

- (void)done
{
  _TtC5TeaUI22JSONTextViewController *v2;

  v2 = self;
  sub_1B15FB50C();

}

- (_TtC5TeaUI22JSONTextViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  JSONTextViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)OUTLINED_FUNCTION_13_78((uint64_t)self + OBJC_IVAR____TtC5TeaUI22JSONTextViewController_textParser);
  sub_1B16772FC(v3, v5, v6, v7, v8, v9, v10, v11, *(_QWORD *)(v4 + 64), *(void **)(v4 + 72));
  swift_release();
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI22JSONTextViewController____lazy_storage___searchToolbar);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI22JSONTextViewController____lazy_storage___resultsBarButtonItem);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI22JSONTextViewController____lazy_storage___nextTokenBarButtonItem);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI22JSONTextViewController____lazy_storage___previousTokenBarButtonItem);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI22JSONTextViewController____lazy_storage___doneBarButtonItem);
  OUTLINED_FUNCTION_1_5(*(id *)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC5TeaUI22JSONTextViewController____lazy_storage___textResizeBarButtonItem));
}

- (void)willPresentSearchController:(id)a3
{
  id v4;
  _TtC5TeaUI22JSONTextViewController *v5;

  v4 = a3;
  v5 = self;
  JSONTextViewController.willPresentSearchController(_:)((UISearchController *)v5);

}

- (void)willDismissSearchController:(id)a3
{
  id v4;
  _TtC5TeaUI22JSONTextViewController *v5;

  v4 = a3;
  v5 = self;
  JSONTextViewController.willDismissSearchController(_:)((UISearchController *)v5);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  _TtC5TeaUI22JSONTextViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = JSONTextViewController.textFieldShouldReturn(_:)((UITextField *)v5);

  return self & 1;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  UISearchController *v4;
  _TtC5TeaUI22JSONTextViewController *v5;

  v4 = (UISearchController *)a3;
  v5 = self;
  JSONTextViewController.updateSearchResults(for:)(v4);

}

@end
