@implementation PGMusicCuratorConfigurationWrapper

+ (PGMusicCuratorConfigurationWrapper)defaultConfiguration
{
  return (PGMusicCuratorConfigurationWrapper *)sub_1CA450760((uint64_t)a1, (uint64_t)a2, (void (*)(_QWORD *__return_ptr))static MusicCuratorConfiguration.defaultConfiguration());
}

+ (PGMusicCuratorConfigurationWrapper)memoryCreationConfiguration
{
  return (PGMusicCuratorConfigurationWrapper *)sub_1CA450760((uint64_t)a1, (uint64_t)a2, (void (*)(_QWORD *__return_ptr))static MusicCuratorConfiguration.memoryCreationConfiguration());
}

- (int64_t)metadataPrefetchThresholdInDays
{
  return *(_QWORD *)&self->configuration[OBJC_IVAR___PGMusicCuratorConfigurationWrapper_configuration + 64];
}

- (int64_t)audioFilePrefetchThresholdInDays
{
  return *(_QWORD *)&self->configuration[OBJC_IVAR___PGMusicCuratorConfigurationWrapper_configuration + 72];
}

- (PGMusicCuratorConfigurationWrapper)init
{
  PGMusicCuratorConfigurationWrapper *result;

  result = (PGMusicCuratorConfigurationWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
