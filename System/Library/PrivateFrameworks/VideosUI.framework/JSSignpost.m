@implementation JSSignpost

- (_TtC8VideosUI10JSSignpost)initWithAppContext:(id)a3
{
  id v4;
  _TtC8VideosUI10JSSignpost *result;

  v4 = a3;
  sub_1D97B9968(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)markSignpostBegin:(id)a3
{
  sub_1D9AFA7CC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(__n128))MEMORY[0x1E0DF22A0]);
}

- (void)markSignpostEnd:(id)a3
{
  sub_1D9AFA7CC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(__n128))MEMORY[0x1E0DF2298]);
}

- (_TtC8VideosUI10JSSignpost)init
{
  _TtC8VideosUI10JSSignpost *result;

  sub_1D9AFA824();
  OUTLINED_FUNCTION_2_1();
  return result;
}

@end
