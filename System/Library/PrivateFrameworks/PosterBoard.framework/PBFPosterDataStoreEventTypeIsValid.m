@implementation PBFPosterDataStoreEventTypeIsValid

void __PBFPosterDataStoreEventTypeIsValid_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[13];

  v4[12] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("PBFPosterDataStoreEventTypeUnknown");
  v4[1] = CFSTR("PBFPosterDataStoreEventTypeStaticDescriptorsUpdated");
  v4[2] = CFSTR("PBFPosterDataStoreEventTypeDescriptorsUpdated");
  v4[3] = CFSTR("PBFPosterDataStoreEventTypeExtensionsUpdated");
  v4[4] = CFSTR("PBFPosterDataStoreEventTypePosterActivated");
  v4[5] = CFSTR("PBFPosterDataStoreEventTypePosterDeleted");
  v4[6] = CFSTR("PBFPosterDataStoreEventTypePosterAdded");
  v4[7] = CFSTR("PBFPosterDataStoreEventTypePosterUpdated");
  v4[8] = CFSTR("PBFPosterDataStoreEventTypePostersReordered");
  v4[9] = CFSTR("PBFPosterDataStoreEventTypePosterSelected");
  v4[10] = CFSTR("PBFPosterDataStoreEventTypeActiveChargerIdentifierUpdated");
  v4[11] = CFSTR("PBFPosterDataStoreEventTypeRoleCoordinatorReset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)PBFPosterDataStoreEventTypeIsValid_validEventTypes;
  PBFPosterDataStoreEventTypeIsValid_validEventTypes = v2;

}

@end
