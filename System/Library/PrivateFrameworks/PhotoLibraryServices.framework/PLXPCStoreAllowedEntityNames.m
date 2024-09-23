@implementation PLXPCStoreAllowedEntityNames

void __PLXPCStoreAllowedEntityNames_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithObjects:", CFSTR("AdditionalAssetAttributes"), CFSTR("Album"), CFSTR("AlbumList"), CFSTR("Asset"), CFSTR("AssetDescription"), CFSTR("CloudMaster"), CFSTR("CloudMasterMediaMetadata"), CFSTR("CloudResource"), CFSTR("CloudSharedAlbum"), CFSTR("FetchingAlbum"), CFSTR("FileSystemBookmark"), CFSTR("FileSystemVolume"), CFSTR("Folder"), v3, CFSTR("InternalResource"), CFSTR("Keyword"), CFSTR("LegacyFaceAlbum"),
         CFSTR("Moment"),
         CFSTR("MomentList"),
         CFSTR("PhotoStreamAlbum"),
         CFSTR("PhotosHighlight"),
         CFSTR("ProjectAlbum"),
         CFSTR("DuplicateAlbum"),
         CFSTR("UnmanagedAdjustment"),
         CFSTR("UniformTypeIdentifier"),
         CFSTR("PhotoAnalysisAssetAttributes"),
         0);
  v2 = (void *)PLXPCStoreAllowedEntityNames_pl_once_object_15;
  PLXPCStoreAllowedEntityNames_pl_once_object_15 = v1;

}

@end
