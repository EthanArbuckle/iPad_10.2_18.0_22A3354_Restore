@implementation StackCollectionViewLayoutAttributes

- (_TtC8VideosUI35StackCollectionViewLayoutAttributes)init
{
  _TtC8VideosUI35StackCollectionViewLayoutAttributes *result;

  sub_1D97435C8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8VideosUI35StackCollectionViewLayoutAttributes *v4;
  _TtC8VideosUI35StackCollectionViewLayoutAttributes *v5;
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
  sub_1D97BCD2C((uint64_t)v7);

  sub_1D975077C((uint64_t)v7);
  OUTLINED_FUNCTION_6();
  return result;
}

- (id)copyWithZone:(void *)a3
{
  _TtC8VideosUI35StackCollectionViewLayoutAttributes *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self;
  sub_1D97BCE7C((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_1DA1450EC();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (BOOL)forcedSize
{
  char v2;

  sub_1D97BCF90();
  return v2 & 1;
}

- (void)setForcedSize:(BOOL)a3
{
  sub_1D9A8F640(a3);
}

@end
