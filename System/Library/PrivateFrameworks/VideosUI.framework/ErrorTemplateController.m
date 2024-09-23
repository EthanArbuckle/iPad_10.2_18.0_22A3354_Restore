@implementation ErrorTemplateController

- (_TtC8VideosUI23ErrorTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI23ErrorTemplateController *result;

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
  sub_1D9E1E83C(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI23ErrorTemplateController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI23ErrorTemplateController *)sub_1D9E1E90C(a3);
}

@end
