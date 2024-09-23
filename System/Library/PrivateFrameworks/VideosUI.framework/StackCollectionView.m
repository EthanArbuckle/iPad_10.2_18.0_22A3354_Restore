@implementation StackCollectionView

- (_TtC8VideosUI19StackCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  _TtC8VideosUI19StackCollectionView *result;

  OUTLINED_FUNCTION_2_0();
  v5 = v4;
  OUTLINED_FUNCTION_11();
  sub_1D97EFDB4(v6);
  OUTLINED_FUNCTION_6_20();
  return result;
}

- (void)vui_registerClass:(Class)a3 forCellWithReuseIdentifier:(id)a4
{
  uint64_t ObjCClassMetadata;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8VideosUI19StackCollectionView *v9;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  v6 = sub_1DA143E80();
  v8 = v7;
  v9 = self;
  sub_1D97EFF70(ObjCClassMetadata, v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtC8VideosUI19StackCollectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9B63FD8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
