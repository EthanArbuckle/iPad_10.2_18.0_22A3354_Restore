@implementation TomatometerTableView.ItemViewModel

- (_TtCC8VideosUI20TomatometerTableView13ItemViewModel)initWithFrame:(CGRect)a3
{
  _TtCC8VideosUI20TomatometerTableView13ItemViewModel *result;

  sub_1D9BC1A30();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtCC8VideosUI20TomatometerTableView13ItemViewModel)initWithCoder:(id)a3
{
  id v3;
  _TtCC8VideosUI20TomatometerTableView13ItemViewModel *result;

  v3 = a3;
  sub_1D9BC1AC0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI20TomatometerTableView13ItemViewModel_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI20TomatometerTableView13ItemViewModel_textLabel));
}

@end
