@implementation RemoteBarItem

- (BOOL)isEqual:(id)a3
{
  _TtC8VideosUI13RemoteBarItem *v4;
  _TtC8VideosUI13RemoteBarItem *v5;
  BOOL result;
  _OWORD v7[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DA144B7C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v5 = self;
  }
  sub_1D9DE9214((uint64_t)v7);

  sub_1D970F43C((uint64_t)v7, &qword_1EDA95080);
  OUTLINED_FUNCTION_6();
  return result;
}

- (_TtC8VideosUI13RemoteBarItem)init
{
  sub_1D9DE95F8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_43_6();
  OUTLINED_FUNCTION_43_6();
  OUTLINED_FUNCTION_43_6();
  swift_release();
  OUTLINED_FUNCTION_43_6();
  OUTLINED_FUNCTION_43_6();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_43_6();

  OUTLINED_FUNCTION_10_3();
}

@end
