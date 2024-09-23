@implementation CanonicalTemplateController

- (void)vui_viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI27CanonicalTemplateController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9F7D718();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  _TtC8VideosUI27CanonicalTemplateController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9F7D7B0();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vuiScrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC8VideosUI27CanonicalTemplateController *v7;

  v6 = a3;
  v7 = self;
  sub_1D9F7E510((uint64_t)v6, a4);

  OUTLINED_FUNCTION_4_3(v7);
}

- (void)vuiScrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC8VideosUI27CanonicalTemplateController *v5;

  v4 = a3;
  v5 = self;
  sub_1D9F7E684((uint64_t)v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (_TtC8VideosUI27CanonicalTemplateController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI27CanonicalTemplateController *)sub_1D9F7E70C(a3);
}

- (BOOL)shouldRubberbandElementWithCategory:(unint64_t)a3 in:(id)a4 at:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC8VideosUI27CanonicalTemplateController *v13;
  uint64_t v15;

  v8 = sub_1DA13F710();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA13F6BC();
  v12 = a4;
  v13 = self;
  LOBYTE(a3) = sub_1D9F7E7AC(a3, v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return a3 & 1;
}

@end
