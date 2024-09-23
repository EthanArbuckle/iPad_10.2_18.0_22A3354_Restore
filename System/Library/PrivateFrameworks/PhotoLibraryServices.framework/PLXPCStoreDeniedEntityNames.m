@implementation PLXPCStoreDeniedEntityNames

void __PLXPCStoreDeniedEntityNames_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("AssetAnalysisState"), CFSTR("BackgroundJobWorkItem"), CFSTR("CharacterRecognitionAttributes"), CFSTR("VisualSearchAttributes"), CFSTR("CloudFeedAssetsEntry"), CFSTR("CloudFeedCommentsEntry"), CFSTR("CloudFeedEntry"), CFSTR("CloudSharedAlbumInvitationRecord"), CFSTR("CloudSharedComment"), CFSTR("Codec"), CFSTR("ComputedAssetAttributes"), CFSTR("DeferredRebuildFace"), CFSTR("DetectedFace"), CFSTR("DetectedFaceGroup"), CFSTR("DetectedFaceprint"), CFSTR("EditedIPTCAttributes"), CFSTR("ExtendedAttributes"),
         CFSTR("FaceCrop"),
         CFSTR("DetectionTrait"),
         CFSTR("GlobalKeyValue"),
         CFSTR("ImportSession"),
         CFSTR("Conversation"),
         CFSTR("InternalResourceCloudAttributes"),
         CFSTR("LegacyFace"),
         CFSTR("LibraryScope"),
         CFSTR("LimitedLibraryFetchFilter"),
         CFSTR("MediaAnalysisAssetAttributes"),
         CFSTR("Memory"),
         CFSTR("MigrationHistory"),
         CFSTR("MomentShare"),
         CFSTR("Person"),
         CFSTR("PersonReference"),
         CFSTR("Question"),
         CFSTR("SceneClassification"),
         CFSTR("Sceneprint"),
         CFSTR("Share"),
         CFSTR("ShareParticipant"),
         CFSTR("Suggestion"),
         CFSTR("UserFeedback"),
         CFSTR("AssetContributor"),
         CFSTR("GraphNode"),
         CFSTR("GraphEdge"),
         CFSTR("GraphLabel"),
         CFSTR("GraphNodeValue"),
         CFSTR("GraphEdgeValue"),
         CFSTR("ComputeSyncAttributes"),
         0);
  v1 = (void *)PLXPCStoreDeniedEntityNames_pl_once_object_16;
  PLXPCStoreDeniedEntityNames_pl_once_object_16 = v0;

}

@end
