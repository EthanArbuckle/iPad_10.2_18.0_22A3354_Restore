@implementation UpsellOfferTemplateViewController

- (void)vui_viewDidLoad
{
  _TtC8VideosUI33UpsellOfferTemplateViewController *v2;

  v2 = self;
  sub_1D9B3A200();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI33UpsellOfferTemplateViewController *v2;

  v2 = self;
  sub_1D9B3A9FC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI33UpsellOfferTemplateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI33UpsellOfferTemplateViewController *result;

  if (a3)
  {
    v5 = sub_1DA143E80();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  sub_1D9B3AB7C(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI33UpsellOfferTemplateViewController)initWithCoder:(id)a3
{
  _TtC8VideosUI33UpsellOfferTemplateViewController *result;

  sub_1D9B3AC88((uint64_t)a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI33UpsellOfferTemplateViewController_upsellView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI33UpsellOfferTemplateViewController_scrollView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI33UpsellOfferTemplateViewController_transactionView);
  swift_release();
}

@end
