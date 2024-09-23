@implementation WebViewController

- (_TtC8VideosUI17WebViewController)initWithCoder:(id)a3
{
  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9CF5400();
}

- (void)viewDidLoad
{
  _TtC8VideosUI17WebViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9CF5488();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewDidLayoutSubviews
{
  _TtC8VideosUI17WebViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9CF59AC();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  v6 = OUTLINED_FUNCTION_4_11();
  v7 = v4;
  OUTLINED_FUNCTION_115_2();
  sub_1D9CF5AEC();

  OUTLINED_FUNCTION_4_3(v8);
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  v6 = OUTLINED_FUNCTION_4_11();
  v7 = v4;
  OUTLINED_FUNCTION_115_2();
  sub_1D9CF5B5C();

  OUTLINED_FUNCTION_4_3(v8);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  _TtC8VideosUI17WebViewController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_1D9CF5AEC();

}

- (_TtC8VideosUI17WebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9CF5C28();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17WebViewController_activityIndicator));

  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI17WebViewController_url;
  v4 = OUTLINED_FUNCTION_13_7();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)doneTapped
{
  _TtC8VideosUI17WebViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9CF5DD8();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)backTapped
{
  _TtC8VideosUI17WebViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9CF5E18();
  OUTLINED_FUNCTION_5_8(v3);
}

@end
