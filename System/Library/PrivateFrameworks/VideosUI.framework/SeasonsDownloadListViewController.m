@implementation SeasonsDownloadListViewController

- (_TtC8VideosUI33SeasonsDownloadListViewController)initWith:(id)a3
{
  uint64_t v3;
  _TtC8VideosUI33SeasonsDownloadListViewController *result;

  sub_1D9EDCFDC();
  v3 = sub_1DA1440FC();
  SeasonsDownloadListViewController.init(with:)(v3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI33SeasonsDownloadListViewController)initWithCoder:(id)a3
{
  sub_1D9EDCC04();
}

- (void)viewDidLoad
{
  _TtC8VideosUI33SeasonsDownloadListViewController *v2;

  v2 = self;
  SeasonsDownloadListViewController.viewDidLoad()();

}

- (CGSize)estimatedSize
{
  _TtC8VideosUI33SeasonsDownloadListViewController *v2;
  CGFloat height;
  double v4;
  double v5;
  CGSize result;

  v2 = self;
  height = SeasonsDownloadListViewController.estimatedSize()().height;

  v4 = 250.0;
  v5 = height;
  result.height = v5;
  result.width = v4;
  return result;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (_TtC8VideosUI33SeasonsDownloadListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  SeasonsDownloadListViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
