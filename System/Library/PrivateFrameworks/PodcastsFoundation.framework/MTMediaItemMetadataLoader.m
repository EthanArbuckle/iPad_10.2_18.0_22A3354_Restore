@implementation MTMediaItemMetadataLoader

- (MTMediaItemMetadataLoader)init
{
  return (MTMediaItemMetadataLoader *)MediaItemMetadataLoader.init()();
}

- (void).cxx_destruct
{

}

- (void)keyIdentifiersFrom:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  MTMediaItemMetadataLoader *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1A9182F04(v8, (uint64_t)sub_1A9183F90, v7);

  swift_release();
}

@end
