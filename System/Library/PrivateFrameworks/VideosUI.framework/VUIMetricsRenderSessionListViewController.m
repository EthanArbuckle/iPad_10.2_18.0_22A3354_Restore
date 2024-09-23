@implementation VUIMetricsRenderSessionListViewController

- (VUIMetricsRenderSessionListViewController)initWithStorageDataSource:(id)a3
{
  VUIMetricsRenderSessionListViewController *result;

  swift_unknownObjectRetain();
  MetricsRenderSessionListViewController.init(storageDataSource:)((uint64_t)a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (VUIMetricsRenderSessionListViewController)initWithCoder:(id)a3
{
  sub_1D9DC11FC();
}

- (void)viewDidLoad
{
  VUIMetricsRenderSessionListViewController *v2;

  v2 = self;
  MetricsRenderSessionListViewController.viewDidLoad()();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)viewWillAppear:(BOOL)a3
{
  VUIMetricsRenderSessionListViewController *v4;

  v4 = self;
  MetricsRenderSessionListViewController.viewWillAppear(_:)(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (VUIMetricsRenderSessionListViewController)initWithStyle:(int64_t)a3
{
  MetricsRenderSessionListViewController.init(style:)();
}

- (VUIMetricsRenderSessionListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  MetricsRenderSessionListViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  VUIMetricsRenderSessionListViewController *v6;
  Swift::Int v7;
  int64_t result;

  v5 = a3;
  v6 = self;
  MetricsRenderSessionListViewController.tableView(_:numberOfRowsInSection:)((UITableView *)v6, v7);

  OUTLINED_FUNCTION_9();
  return result;
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
  v9 = MetricsRenderSessionListViewController.tableView(_:heightForRowAt:)();

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
  v9 = MetricsRenderSessionListViewController.tableView(_:cellForRowAt:)(v4);

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
  MetricsRenderSessionListViewController.tableView(_:didSelectRowAt:)();

  OUTLINED_FUNCTION_13_13();
}

- (void)didTapClearAllSessions
{
  VUIMetricsRenderSessionListViewController *v2;

  v2 = self;
  sub_1D9DC1A84();
  OUTLINED_FUNCTION_5_8(v2);
}

@end
