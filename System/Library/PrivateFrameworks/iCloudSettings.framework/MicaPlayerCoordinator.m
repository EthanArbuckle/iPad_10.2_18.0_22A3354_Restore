@implementation MicaPlayerCoordinator

- (void)micaPlayerDidChangePlaybackTime:(id)a3
{
  id v4;
  _TtC14iCloudSettings21MicaPlayerCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_24B4F2ACC(v4);

}

- (void)micaPlayerDidStartPlaying:(id)a3
{
  id v4;
  _TtC14iCloudSettings21MicaPlayerCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_24B4F33E4((uint64_t)&unk_251C63580, (uint64_t)sub_24B4F3614, (uint64_t)&block_descriptor_17);

}

- (void)micaPlayerDidStopPlaying:(id)a3
{
  id v4;
  _TtC14iCloudSettings21MicaPlayerCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_24B4F33E4((uint64_t)&unk_251C63530, (uint64_t)sub_24B4F35C4, (uint64_t)&block_descriptor_7);

}

- (_TtC14iCloudSettings21MicaPlayerCoordinator)init
{
  _TtC14iCloudSettings21MicaPlayerCoordinator *result;

  result = (_TtC14iCloudSettings21MicaPlayerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
