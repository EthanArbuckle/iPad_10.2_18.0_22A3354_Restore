@implementation ClipImageFetchOperation

- (void)executionDidBegin
{
  _TtC8VideosUI23ClipImageFetchOperation *v2;

  v2 = self;
  sub_1D9E7F5AC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)cancel
{
  _TtC8VideosUI23ClipImageFetchOperation *v2;

  v2 = self;
  sub_1D9E7F888();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI23ClipImageFetchOperation)init
{
  sub_1D9E7F900();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI23ClipImageFetchOperation_url;
  v4 = OUTLINED_FUNCTION_13_7();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1D9E7F360(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8VideosUI23ClipImageFetchOperation_result), *(_WORD *)((char *)&self->super.super._iop.__prevOp + OBJC_IVAR____TtC8VideosUI23ClipImageFetchOperation_result));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23ClipImageFetchOperation_imageProxy));
}

@end
