@implementation PLLocalVideoKeyFrameJobQueue

- (PLLocalVideoKeyFrameJobQueue)init
{
  PLLocalVideoKeyFrameJobQueue *v2;
  PLLocalVideoKeyFrameJobQueue *v3;
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *queuedJobs;
  NSMutableDictionary *v6;
  NSMutableDictionary *jobsByAssetObjectID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLLocalVideoKeyFrameJobQueue;
  v2 = -[PLLocalVideoKeyFrameJobQueue init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    queuedJobs = v3->_queuedJobs;
    v3->_queuedJobs = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    jobsByAssetObjectID = v3->_jobsByAssetObjectID;
    v3->_jobsByAssetObjectID = v6;

  }
  return v3;
}

- (BOOL)addJobWithAssetObjectID:(id)a3 networkAccessAllowed:(BOOL)a4 clientBundleID:(id)a5 libraryID:(id)a6 error:(id *)a7 completionHandler:(id)a8
{
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  os_unfair_lock_s *p_lock;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  PLLocalVideoKeyFrameGenerationJob *v27;
  NSMutableDictionary *jobsByAssetObjectID;
  void *v29;
  void *v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v12 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_jobsByAssetObjectID, "objectForKeyedSubscript:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    PLImageManagerGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v14;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "[key frame] existing job found adding new completion handler for asset: %@", buf, 0xCu);
    }

    objc_msgSend(v19, "addCompletionHandler:", v17);
    goto LABEL_10;
  }
  if ((unint64_t)-[NSMutableOrderedSet count](self->_queuedJobs, "count") < 0xC8)
  {
    v27 = objc_alloc_init(PLLocalVideoKeyFrameGenerationJob);
    -[PLLocalVideoKeyFrameGenerationJob setAssetObjectID:](v27, "setAssetObjectID:", v14);
    -[PLLocalVideoKeyFrameGenerationJob setNetworkAccessAllowed:](v27, "setNetworkAccessAllowed:", v12);
    -[PLLocalVideoKeyFrameGenerationJob setClientBundleID:](v27, "setClientBundleID:", v15);
    -[PLLocalVideoKeyFrameGenerationJob setLibraryID:](v27, "setLibraryID:", v16);
    -[PLLocalVideoKeyFrameGenerationJob addCompletionHandler:](v27, "addCompletionHandler:", v17);
    -[NSMutableOrderedSet addObject:](self->_queuedJobs, "addObject:", v27);
    jobsByAssetObjectID = self->_jobsByAssetObjectID;
    -[PLLocalVideoKeyFrameGenerationJob assetObjectID](v27, "assetObjectID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](jobsByAssetObjectID, "setObject:forKeyedSubscript:", v27, v29);

LABEL_10:
    v25 = 0;
    v26 = 1;
    goto LABEL_11;
  }
  PLImageManagerGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v14;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "[key frame] max queued jobs reached, failing request for asset: %@", buf, 0xCu);
  }

  v31 = (void *)MEMORY[0x1E0CB35C8];
  v22 = *MEMORY[0x1E0D74498];
  v32 = *MEMORY[0x1E0CB2938];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Max queued jobs reached"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "errorWithDomain:code:userInfo:", v22, 47001, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
LABEL_11:
  os_unfair_lock_unlock(p_lock);
  if (a7)
    *a7 = objc_retainAutorelease(v25);

  return v26;
}

- (id)popNextJobToRun
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_inflightCount > 1)
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableOrderedSet firstObject](self->_queuedJobs, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NSMutableOrderedSet removeObjectAtIndex:](self->_queuedJobs, "removeObjectAtIndex:", 0);
      ++self->_inflightCount;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)removeJob:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *jobsByAssetObjectID;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  jobsByAssetObjectID = self->_jobsByAssetObjectID;
  objc_msgSend(v4, "assetObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](jobsByAssetObjectID, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((-[NSMutableOrderedSet containsObject:](self->_queuedJobs, "containsObject:", v4) & 1) != 0)
      -[NSMutableOrderedSet removeObject:](self->_queuedJobs, "removeObject:", v4);
    else
      --self->_inflightCount;
    v9 = self->_jobsByAssetObjectID;
    objc_msgSend(v4, "assetObjectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", 0, v10);

  }
  os_unfair_lock_unlock(p_lock);

  return v8 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jobsByAssetObjectID, 0);
  objc_storeStrong((id *)&self->_queuedJobs, 0);
}

@end
