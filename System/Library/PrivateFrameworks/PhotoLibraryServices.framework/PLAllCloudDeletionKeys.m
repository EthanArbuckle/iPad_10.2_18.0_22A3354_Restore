@implementation PLAllCloudDeletionKeys

void __PLAllCloudDeletionKeys_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[14];

  v3[13] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("cloudAssetDeleteGUIDs");
  v3[1] = CFSTR("cloudAlbumDeleteGUIDs");
  v3[2] = CFSTR("cloudMemoryDeleteGUIDs");
  v3[3] = CFSTR("cloudPersonDeleteGUIDs");
  v3[4] = CFSTR("cloudFaceCropDeleteGUIDs");
  v3[5] = CFSTR("cloudOwnedCMMDeleteGUIDs");
  v3[6] = CFSTR("cloudSubscribedCMMDeleteGUIDs");
  v3[7] = CFSTR("cloudOwnedLibraryScopeDeleteGUIDs");
  v3[8] = CFSTR("cloudSubscribedLibraryScopeDeleteGUIDs");
  v3[9] = CFSTR("cloudSuggestionDeleteGUIDs");
  v3[10] = CFSTR("cloudUserFeedbackDeleteGUIDs");
  v3[11] = CFSTR("cloudInternalResourceUUIDToResourceTypeMappings");
  v3[12] = CFSTR("cloudSocialGroupDeleteGUIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 13);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)PLAllCloudDeletionKeys_pl_once_object_17;
  PLAllCloudDeletionKeys_pl_once_object_17 = v1;

}

@end
