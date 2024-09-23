@implementation CRLMultipleImporterHelper

- (CRLMultipleImporterHelper)initWithImporters:(id)a3
{
  id v4;
  CRLMultipleImporterHelper *v5;
  NSArray *v6;
  NSArray *importers;
  NSMutableSet *v8;
  NSMutableSet *importersNeedingToRequestMediaCompatibilityRequirement;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLMultipleImporterHelper;
  v5 = -[CRLMultipleImporterHelper init](&v11, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    importers = v5->_importers;
    v5->_importers = v6;

    v8 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v4);
    importersNeedingToRequestMediaCompatibilityRequirement = v5->_importersNeedingToRequestMediaCompatibilityRequirement;
    v5->_importersNeedingToRequestMediaCompatibilityRequirement = v8;

  }
  return v5;
}

- (BOOL)allImportersHaveGivenCompatibilityResponse
{
  return -[NSMutableSet count](self->_importersNeedingToRequestMediaCompatibilityRequirement, "count") == 0;
}

- (unint64_t)numberOfImportersRequiringCompatibilityConversion
{
  return -[NSMapTable count](self->_mediaCompatibilityRequirementReplyBlocksForImporters, "count");
}

- (void)importer:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6
{
  id v10;
  NSMapTable *mediaCompatibilityRequirementReplyBlocksForImporters;
  NSMapTable *v12;
  NSMapTable *v13;
  id v14;
  int64_t v15;
  int64_t v16;
  id v17;

  v17 = a3;
  v10 = a6;
  mediaCompatibilityRequirementReplyBlocksForImporters = self->_mediaCompatibilityRequirementReplyBlocksForImporters;
  if (!mediaCompatibilityRequirementReplyBlocksForImporters)
  {
    v12 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 0, -[NSArray count](self->_importers, "count"));
    v13 = self->_mediaCompatibilityRequirementReplyBlocksForImporters;
    self->_mediaCompatibilityRequirementReplyBlocksForImporters = v12;

    mediaCompatibilityRequirementReplyBlocksForImporters = self->_mediaCompatibilityRequirementReplyBlocksForImporters;
  }
  v14 = objc_msgSend(v10, "copy");
  -[NSMapTable setObject:forKey:](mediaCompatibilityRequirementReplyBlocksForImporters, "setObject:forKey:", v14, v17);

  v15 = sub_100243D38(self->_mediaTypesRequestingConversion, a5);
  v16 = self->_reasonsForMediaConversion | a4;
  self->_mediaTypesRequestingConversion = v15;
  self->_reasonsForMediaConversion = v16;

}

- (void)mediaCompatibilityCheckHasBeenHandledForImporter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_importersNeedingToRequestMediaCompatibilityRequirement, "containsObject:", v4) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244660);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0C380();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244680);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultipleImporterHelper mediaCompatibilityCheckHasBeenHandledForImporter:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMultipleImporterHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 55, 0, "Importer compatibility check is being handled for an importer not in the list.");

  }
  -[NSMutableSet removeObject:](self->_importersNeedingToRequestMediaCompatibilityRequirement, "removeObject:", v4);

}

- (void)completeImportWithCompatibilityOnAllDevices:(BOOL)a3 allowHEVCContent:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  NSMapTable *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a4;
  v5 = a3;
  if (!-[CRLMultipleImporterHelper allImportersHaveGivenCompatibilityResponse](self, "allImportersHaveGivenCompatibilityResponse"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012446A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0C404();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012446C0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultipleImporterHelper completeImportWithCompatibilityOnAllDevices:allowHEVCContent:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMultipleImporterHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 61, 0, "Should not attempt to complete compatibility logic if not all importers have provided a compatibility response!");

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_mediaCompatibilityRequirementReplyBlocksForImporters;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_mediaCompatibilityRequirementReplyBlocksForImporters, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), (_QWORD)v16));
        v15[2](v15, v5, v4);

      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  -[NSMapTable removeAllObjects](self->_mediaCompatibilityRequirementReplyBlocksForImporters, "removeAllObjects");
  self->_mediaTypesRequestingConversion = 0;
  self->_reasonsForMediaConversion = 0;
}

- (NSArray)importers
{
  return self->_importers;
}

- (int64_t)mediaTypeForConversion
{
  return self->_mediaTypesRequestingConversion;
}

- (int64_t)reasonsForMediaConversion
{
  return self->_reasonsForMediaConversion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importers, 0);
  objc_storeStrong((id *)&self->_mediaCompatibilityRequirementReplyBlocksForImporters, 0);
  objc_storeStrong((id *)&self->_importersNeedingToRequestMediaCompatibilityRequirement, 0);
}

@end
