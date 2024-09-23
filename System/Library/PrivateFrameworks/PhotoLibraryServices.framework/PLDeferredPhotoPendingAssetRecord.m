@implementation PLDeferredPhotoPendingAssetRecord

- (PLDeferredPhotoPendingAssetRecord)initWithAssetObjectID:(id)a3 lsm:(id)a4 requestReason:(id)a5 isBackgroundPriority:(BOOL)a6 signpostId:(unint64_t)a7 expectsSecondProcessingCallback:(BOOL)a8 needsSemanticDevelopment:(BOOL)a9 fileURLForFullsizeRenderImage:(id)a10 mainFileURL:(id)a11 logDescription:(id)a12 startTimestamp:(double)a13 deferredmediadQos:(id)a14 completionHandler:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  PLDeferredPhotoPendingAssetRecord *v25;
  uint64_t v26;
  NSManagedObjectID *assetObjectID;
  uint64_t v28;
  NSString *requestReason;
  uint64_t v30;
  NSURL *fileURLForFullsizeRenderImage;
  uint64_t v32;
  NSURL *mainFileURL;
  uint64_t v34;
  NSString *logDescription;
  uint64_t v36;
  id completionHandler;
  PLDeferredPhotoPendingAssetRecord *v38;
  id v43;
  id v44;
  objc_super v45;

  v44 = a3;
  v19 = a4;
  v43 = a5;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v23 = a14;
  v24 = a15;
  v45.receiver = self;
  v45.super_class = (Class)PLDeferredPhotoPendingAssetRecord;
  v25 = -[PLDeferredPhotoPendingAssetRecord init](&v45, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v44, "copy");
    assetObjectID = v25->_assetObjectID;
    v25->_assetObjectID = (NSManagedObjectID *)v26;

    objc_storeStrong((id *)&v25->_lsm, a4);
    v28 = objc_msgSend(v43, "copy");
    requestReason = v25->_requestReason;
    v25->_requestReason = (NSString *)v28;

    v25->_isBackgroundPriority = a6;
    v25->_signpostId = a7;
    v25->_expectsSecondProcessingCallback = a8;
    v25->_needsSemanticDevelopment = a9;
    v30 = objc_msgSend(v20, "copy");
    fileURLForFullsizeRenderImage = v25->_fileURLForFullsizeRenderImage;
    v25->_fileURLForFullsizeRenderImage = (NSURL *)v30;

    v32 = objc_msgSend(v21, "copy");
    mainFileURL = v25->_mainFileURL;
    v25->_mainFileURL = (NSURL *)v32;

    v34 = objc_msgSend(v22, "copy");
    logDescription = v25->_logDescription;
    v25->_logDescription = (NSString *)v34;

    v25->_startTimestamp = a13;
    objc_storeStrong((id *)&v25->_qosToProcess, a14);
    v36 = objc_msgSend(v24, "copy");
    completionHandler = v25->_completionHandler;
    v25->_completionHandler = (id)v36;

    v38 = v25;
  }

  return v25;
}

- (NSManagedObjectID)assetObjectID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 16, 1);
}

- (PLLibraryServicesManager)lsm
{
  return (PLLibraryServicesManager *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)requestReason
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isBackgroundPriority
{
  return self->_isBackgroundPriority;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (BOOL)expectsSecondProcessingCallback
{
  return self->_expectsSecondProcessingCallback;
}

- (BOOL)needsSemanticDevelopment
{
  return self->_needsSemanticDevelopment;
}

- (NSURL)fileURLForFullsizeRenderImage
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (NSURL)mainFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)logDescription
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (NSString)qosToProcess
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_qosToProcess, 0);
  objc_storeStrong((id *)&self->_logDescription, 0);
  objc_storeStrong((id *)&self->_mainFileURL, 0);
  objc_storeStrong((id *)&self->_fileURLForFullsizeRenderImage, 0);
  objc_storeStrong((id *)&self->_requestReason, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
  objc_storeStrong((id *)&self->_assetObjectID, 0);
}

@end
