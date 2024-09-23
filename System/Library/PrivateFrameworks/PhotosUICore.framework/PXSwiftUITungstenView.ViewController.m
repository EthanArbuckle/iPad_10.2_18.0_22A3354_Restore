@implementation PXSwiftUITungstenView.ViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtCV12PhotosUICore21PXSwiftUITungstenViewP33_056D1FF7FB10D0432A5593ADA99729F214ViewController *v4;

  v4 = self;
  sub_1A70A8614(a3);

}

- (_TtCV12PhotosUICore21PXSwiftUITungstenViewP33_056D1FF7FB10D0432A5593ADA99729F214ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtCV12PhotosUICore21PXSwiftUITungstenViewP33_056D1FF7FB10D0432A5593ADA99729F214ViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_1A7AE3764();
    v6 = a4;
    v7 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PXSwiftUITungstenView.ViewController();
  v9 = -[PXSwiftUITungstenView.ViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtCV12PhotosUICore21PXSwiftUITungstenViewP33_056D1FF7FB10D0432A5593ADA99729F214ViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PXSwiftUITungstenView.ViewController();
  return -[PXSwiftUITungstenView.ViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
