@implementation MetricsEventDetailListViewController

- (_TtC8VideosUI36MetricsEventDetailListViewController)initWithCoder:(id)a3
{
  sub_1D9FDB2AC();
}

- (void)viewDidLoad
{
  _TtC8VideosUI36MetricsEventDetailListViewController *v2;

  v2 = self;
  sub_1D9FDB310();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8VideosUI36MetricsEventDetailListViewController *v4;

  v4 = self;
  sub_1D9FDB428(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (_TtC8VideosUI36MetricsEventDetailListViewController)initWithStyle:(int64_t)a3
{
  sub_1D9FDB4D0();
}

- (_TtC8VideosUI36MetricsEventDetailListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9FDB508();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI36MetricsEventDetailListViewController_event));
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC8VideosUI36MetricsEventDetailListViewController *v6;
  int64_t result;

  v5 = a3;
  v6 = self;
  sub_1D9FDB598();

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
  v7 = v4;
  v8 = v5;
  v9 = sub_1D9FDB5FC();

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
  void *v9;

  OUTLINED_FUNCTION_8_13();
  OUTLINED_FUNCTION_107_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_1_7();
  v7 = v4;
  v8 = v5;
  v9 = (void *)sub_1D9FDB688(v7);

  OUTLINED_FUNCTION_13_13();
  return v9;
}

@end
