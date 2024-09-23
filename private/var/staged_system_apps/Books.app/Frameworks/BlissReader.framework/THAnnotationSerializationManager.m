@implementation THAnnotationSerializationManager

- (void)handleAnnotationProvider:(id)a3 willMergeVersionMismatchedAnnotationsWithIncomingAnnotationAssetVersion:(id)a4 assetAssetVersion:(id)a5 assetID:(id)a6 assetURL:(id)a7
{
  -[THAnnotationSerializationManager wentOfflineAfterHandleAnnotationProvider:willEncounterAnnotationAssetVersion:assetAssetVersion:assetID:assetURL:copyIfGoingOffline:](self, "wentOfflineAfterHandleAnnotationProvider:willEncounterAnnotationAssetVersion:assetAssetVersion:assetID:assetURL:copyIfGoingOffline:", a3, a4, a5, a6, a7, 1);
}

- (BOOL)wentOfflineAfterHandleAnnotationProvider:(id)a3 willEncounterAnnotationAssetVersion:(id)a4 assetAssetVersion:(id)a5 assetID:(id)a6 assetURL:(id)a7 copyIfGoingOffline:(BOOL)a8
{
  _BOOL8 v8;
  unsigned int v12;
  unsigned __int8 v13;

  v8 = a8;
  v12 = objc_msgSend(a4, "isStrictlyNewerThanBookVersion:", a5);
  if (v12)
  {
    v13 = -[THAnnotationSerializationManager isAssetOfflineWithAssetID:](self, "isAssetOfflineWithAssetID:", a6);
    if ((v13 & 1) == 0)
      -[THAnnotationSerializationManager protected_takeAssetOfflineWithProvider:assetID:copyData:](self, "protected_takeAssetOfflineWithProvider:assetID:copyData:", a3, a6, v8);
    LOBYTE(v12) = v13 ^ 1;
  }
  return v12;
}

@end
