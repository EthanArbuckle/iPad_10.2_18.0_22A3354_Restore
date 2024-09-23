@implementation VUIMetricsRenderEventListViewController

- (VUIMetricsRenderEventListViewController)initWithEvents:(id)a3
{
  uint64_t v3;
  VUIMetricsRenderEventListViewController *result;

  type metadata accessor for MetricsRenderEvent();
  v3 = sub_1DA1440FC();
  MetricsRenderEventListViewController.init(events:)(v3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (VUIMetricsRenderEventListViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F1F590();
}

- (void)viewDidLoad
{
  VUIMetricsRenderEventListViewController *v2;

  v2 = self;
  MetricsRenderEventListViewController.viewDidLoad()();

}

- (VUIMetricsRenderEventListViewController)initWithStyle:(int64_t)a3
{
  MetricsRenderEventListViewController.init(style:)();
}

- (VUIMetricsRenderEventListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  MetricsRenderEventListViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  VUIMetricsRenderEventListViewController *v5;
  int64_t result;

  v4 = a3;
  v5 = self;
  MetricsRenderEventListViewController.numberOfSections(in:)((UITableView *)v5);

  OUTLINED_FUNCTION_9();
  return result;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v8;
  UIView *v9;
  VUIMetricsRenderEventListViewController *v10;

  v8 = a3;
  v9 = (UIView *)a4;
  v10 = self;
  MetricsRenderEventListViewController.tableView(_:willDisplayHeaderView:forSection:)((UITableView *)v10, v9, a5);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  VUIMetricsRenderEventListViewController *v7;
  void *object;
  void *v9;

  v6 = a3;
  v7 = self;
  object = MetricsRenderEventListViewController.tableView(_:titleForHeaderInSection:)((UITableView *)v7, a4).value._object;

  if (object)
  {
    v9 = (void *)sub_1DA143E50();
    OUTLINED_FUNCTION_79();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  double v9;

  OUTLINED_FUNCTION_8_13();
  OUTLINED_FUNCTION_107_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_1_7();
  v7 = v5;
  v8 = OUTLINED_FUNCTION_54_8();
  v9 = MetricsRenderEventListViewController.tableView(_:heightForRowAt:)();

  OUTLINED_FUNCTION_13_13();
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;

  OUTLINED_FUNCTION_8_13();
  OUTLINED_FUNCTION_107_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_1_7();
  v7 = v5;
  v8 = OUTLINED_FUNCTION_54_8();
  v9 = MetricsRenderEventListViewController.tableView(_:cellForRowAt:)(v4);

  OUTLINED_FUNCTION_13_13();
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  OUTLINED_FUNCTION_8_13();
  OUTLINED_FUNCTION_107_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_1_7();
  v7 = v5;
  v8 = OUTLINED_FUNCTION_54_8();
  MetricsRenderEventListViewController.tableView(_:didSelectRowAt:)();

  OUTLINED_FUNCTION_13_13();
}

@end
