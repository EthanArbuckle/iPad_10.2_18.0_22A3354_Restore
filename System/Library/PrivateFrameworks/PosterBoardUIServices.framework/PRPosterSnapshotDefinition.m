@implementation PRPosterSnapshotDefinition

void __86__PRPosterSnapshotDefinition_AmbientAdditions__defaultAmbientPosterSnapshotDefinition__block_invoke()
{
  _PRAmbientPosterSnapshotDefinition *v0;
  void *v1;

  v0 = -[_PRAmbientPosterSnapshotDefinition initWithUniqueIdentifier:ambientPresented:ambientDisplayStyle:renderingContent:renderingMode:previewContent:]([_PRAmbientPosterSnapshotDefinition alloc], "initWithUniqueIdentifier:ambientPresented:ambientDisplayStyle:renderingContent:renderingMode:previewContent:", CFSTR("SNAPSHOT_AMBIENT_DEFAULT"), 1, 0, 1, 1, 1);
  v1 = (void *)defaultAmbientPosterSnapshotDefinition_defaultAmbientPosterSnapshotDefinition;
  defaultAmbientPosterSnapshotDefinition_defaultAmbientPosterSnapshotDefinition = (uint64_t)v0;

}

void __86__PRPosterSnapshotDefinition_AmbientAdditions__redmodeAmbientPosterSnapshotDefinition__block_invoke()
{
  _PRAmbientPosterSnapshotDefinition *v0;
  void *v1;

  v0 = -[_PRAmbientPosterSnapshotDefinition initWithUniqueIdentifier:ambientPresented:ambientDisplayStyle:renderingContent:renderingMode:previewContent:]([_PRAmbientPosterSnapshotDefinition alloc], "initWithUniqueIdentifier:ambientPresented:ambientDisplayStyle:renderingContent:renderingMode:previewContent:", CFSTR("SNAPSHOT_AMBIENT_REDMODE"), 1, 1, 1, 1, 1);
  v1 = (void *)redmodeAmbientPosterSnapshotDefinition_defaultAmbientPosterSnapshotDefinition;
  redmodeAmbientPosterSnapshotDefinition_defaultAmbientPosterSnapshotDefinition = (uint64_t)v0;

}

@end
