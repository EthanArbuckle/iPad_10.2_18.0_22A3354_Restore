@implementation AlertTemplateView

- (_TtC8VideosUI17AlertTemplateView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9C5F8CC();
}

- (_TtC8VideosUI17AlertTemplateView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI17AlertTemplateView *result;

  sub_1D9C5F96C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI17AlertTemplateView *v2;

  v2 = self;
  sub_1D9C5FCB8((uint64_t)v2);
  OUTLINED_FUNCTION_5_8(v2);
}

- (void).cxx_destruct
{

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)imageDidLoad:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8VideosUI17AlertTemplateView *v8;
  uint64_t v9;

  v4 = sub_1DA13F0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA13F080();
  v8 = self;
  sub_1D9C609CC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
