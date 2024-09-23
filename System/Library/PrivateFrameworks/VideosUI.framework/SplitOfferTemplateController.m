@implementation SplitOfferTemplateController

- (_TtC8VideosUI28SplitOfferTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI28SplitOfferTemplateController *result;

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
  sub_1D9FD4AF4(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI28SplitOfferTemplateController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI28SplitOfferTemplateController *)sub_1D9FD4BD4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28SplitOfferTemplateController____lazy_storage___leftView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28SplitOfferTemplateController____lazy_storage___rightView));
  OUTLINED_FUNCTION_26_141((void **)((char *)&self->super.super.super.super.isa
                                   + OBJC_IVAR____TtC8VideosUI28SplitOfferTemplateController_leftTemplate));
  OUTLINED_FUNCTION_26_141((void **)((char *)&self->super.super.super.super.isa
                                   + OBJC_IVAR____TtC8VideosUI28SplitOfferTemplateController_rightTemplate));
  OUTLINED_FUNCTION_10_3();
}

@end
