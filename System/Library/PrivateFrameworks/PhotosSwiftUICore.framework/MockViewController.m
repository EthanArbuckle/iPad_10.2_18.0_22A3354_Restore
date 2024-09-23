@implementation MockViewController

- (void)viewDidLoad
{
  _TtC17PhotosSwiftUICore18MockViewController *v2;

  v2 = self;
  sub_2441EBA60();

}

- (_TtC17PhotosSwiftUICore18MockViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_2442876D0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC17PhotosSwiftUICore18MockViewController *)MockViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC17PhotosSwiftUICore18MockViewController)initWithCoder:(id)a3
{
  return (_TtC17PhotosSwiftUICore18MockViewController *)MockViewController.init(coder:)(a3);
}

@end
