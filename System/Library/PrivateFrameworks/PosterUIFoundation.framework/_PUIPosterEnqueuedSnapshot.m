@implementation _PUIPosterEnqueuedSnapshot

- (_PUIPosterEnqueuedSnapshot)initWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  _PUIPosterEnqueuedSnapshot *v9;
  _PUIPosterEnqueuedSnapshot *v10;
  uint64_t v11;
  NSNumber *priority;
  uint64_t v13;
  NSDate *date;
  uint64_t v15;
  PFPosterPath *path;
  void *v17;
  uint64_t v18;
  PFPosterPath *extendedPath;
  void *v20;
  uint64_t v21;
  BSInvalidatable *pathValidityToken;
  void *v23;
  void *v24;
  uint64_t v25;
  FBSSceneSettings *posterSettings;
  uint64_t v27;
  id completion;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSString *logIdentifier;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;

  v7 = a3;
  v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)_PUIPosterEnqueuedSnapshot;
  v9 = -[_PUIPosterEnqueuedSnapshot init](&v43, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "priority"));
    v11 = objc_claimAutoreleasedReturnValue();
    priority = v10->_priority;
    v10->_priority = (NSNumber *)v11;

    objc_msgSend(v7, "date");
    v13 = objc_claimAutoreleasedReturnValue();
    date = v10->_date;
    v10->_date = (NSDate *)v13;

    objc_msgSend(v7, "path");
    v15 = objc_claimAutoreleasedReturnValue();
    path = v10->_path;
    v10->_path = (PFPosterPath *)v15;

    objc_msgSend(v7, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "extendContentsReadAccessToAuditToken:error:", 0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    extendedPath = v10->_extendedPath;
    v10->_extendedPath = (PFPosterPath *)v18;

    objc_msgSend(v7, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "extendValidityForReason:", CFSTR("SNAPSHOTTIN!!!!"));
    v21 = objc_claimAutoreleasedReturnValue();
    pathValidityToken = v10->_pathValidityToken;
    v10->_pathValidityToken = (BSInvalidatable *)v21;

    objc_msgSend(v7, "settings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    v42 = v24;
    objc_msgSend(v24, "pui_setPosterContents:", v10->_extendedPath);
    v25 = objc_msgSend(v24, "copy");
    posterSettings = v10->_posterSettings;
    v10->_posterSettings = (FBSSceneSettings *)v25;

    v27 = objc_msgSend(v8, "copy");
    completion = v10->_completion;
    v10->_completion = (id)v27;

    v40 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "uniqueIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "substringToIndex:", 8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFPosterPath serverIdentity](v10->_path, "serverIdentity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "posterUUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "UUIDString");
    v33 = v8;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "substringToIndex:", 8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneSettings pui_provider](v10->_posterSettings, "pui_provider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringWithFormat:", CFSTR("%@:%@:%@"), v30, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v10->_logIdentifier;
    v10->_logIdentifier = (NSString *)v37;

    v8 = v33;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[_PUIPosterEnqueuedSnapshot invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_PUIPosterEnqueuedSnapshot;
  -[_PUIPosterEnqueuedSnapshot dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  PUIPosterSnapshotRequest *request;
  id completion;
  PFPosterPath *path;
  PFPosterPath *extendedPath;
  PFPosterPath *v7;
  NSDate *date;

  request = self->_request;
  self->_request = 0;

  completion = self->_completion;
  self->_completion = 0;

  path = self->_path;
  self->_path = 0;

  extendedPath = self->_extendedPath;
  self->_extendedPath = 0;

  -[BSInvalidatable invalidate](self->_pathValidityToken, "invalidate");
  v7 = self->_path;
  self->_path = 0;

  date = self->_date;
  self->_date = 0;

}

- (PUIPosterSnapshotRequest)request
{
  return self->_request;
}

- (id)completion
{
  return self->_completion;
}

- (FBSSceneSettings)posterSettings
{
  return self->_posterSettings;
}

- (PFPosterPath)path
{
  return self->_path;
}

- (NSNumber)priority
{
  return self->_priority;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (int)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_posterSettings, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_pathValidityToken, 0);
  objc_storeStrong((id *)&self->_extendedPath, 0);
}

@end
