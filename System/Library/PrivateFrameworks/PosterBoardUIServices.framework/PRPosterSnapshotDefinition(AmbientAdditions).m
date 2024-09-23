@implementation PRPosterSnapshotDefinition(AmbientAdditions)

+ (id)defaultAmbientPosterSnapshotDefinition
{
  if (defaultAmbientPosterSnapshotDefinition_onceToken != -1)
    dispatch_once(&defaultAmbientPosterSnapshotDefinition_onceToken, &__block_literal_global_2);
  return (id)defaultAmbientPosterSnapshotDefinition_defaultAmbientPosterSnapshotDefinition;
}

+ (id)redmodeAmbientPosterSnapshotDefinition
{
  if (redmodeAmbientPosterSnapshotDefinition_onceToken != -1)
    dispatch_once(&redmodeAmbientPosterSnapshotDefinition_onceToken, &__block_literal_global_2);
  return (id)redmodeAmbientPosterSnapshotDefinition_defaultAmbientPosterSnapshotDefinition;
}

+ (_PRAmbientPosterSnapshotDefinition)ambientPosterSnapshotDefinitionWithIdentifier:()AmbientAdditions ambientPresentationSettings:
{
  id v5;
  id v6;
  _PRAmbientPosterSnapshotDefinition *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_PRAmbientPosterSnapshotDefinition initWithUniqueIdentifier:ambientPresentationSettings:renderingContent:renderingMode:previewContent:]([_PRAmbientPosterSnapshotDefinition alloc], "initWithUniqueIdentifier:ambientPresentationSettings:renderingContent:renderingMode:previewContent:", v6, v5, 1, 1, 1);

  return v7;
}

+ (id)ambientPosterSnapshotDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "defaultAmbientPosterSnapshotDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(a1, "redmodeAmbientPosterSnapshotDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
