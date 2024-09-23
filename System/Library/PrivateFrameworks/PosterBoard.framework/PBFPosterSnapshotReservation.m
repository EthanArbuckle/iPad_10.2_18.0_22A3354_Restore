@implementation PBFPosterSnapshotReservation

+ (id)globalCache
{
  if (globalCache_onceToken != -1)
    dispatch_once(&globalCache_onceToken, &__block_literal_global_37);
  return (id)globalCache_cache;
}

void __43__PBFPosterSnapshotReservation_globalCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01930]), "initWithUniqueIdentifier:", CFSTR("PBFPosterSnapshotReservation global cache"));
  v1 = (void *)globalCache_cache;
  globalCache_cache = v0;

}

+ (void)noteSnapshotWasReaped:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "globalCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeImageForKey:", v4);
}

+ (void)noteAllSnapshotsWereReaped
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "globalCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllImagesWithCompletion:", &__block_literal_global_2);

  objc_msgSend(MEMORY[0x1E0CB35B0], "notificationCenterForType:", CFSTR("POSTERBOARD"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("POSTERBOARD_CLEAR_ALL_CACHED_SNAPSHOTS"), 0, 0, 1);

}

- (PBFPosterSnapshotReservation)initWithURL:(id)a3 displayContext:(id)a4 image:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  PBFPosterSnapshotReservation *v19;
  uint64_t v20;
  NSURL *URL;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  NSClassFromString(CFSTR("NSURL"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:].cold.1();
LABEL_32:
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAC4E60);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAC4EC4);
  }

  v15 = v12;
  if (v15)
  {
    NSClassFromString(CFSTR("UIImage"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:UIImageClass]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:].cold.5();
      objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAC4FF0);
    }
  }

  v16 = v13;
  if (v16)
  {
    NSClassFromString(CFSTR("NSError"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSErrorClass]"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:].cold.4();
      goto LABEL_32;
    }
  }

  v17 = v11;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAC4F28);
  }
  v18 = v17;
  if ((objc_msgSend(v17, "conformsToProtocol:", &unk_1EF9EE588) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAC4F8CLL);
  }

  v30.receiver = self;
  v30.super_class = (Class)PBFPosterSnapshotReservation;
  v19 = -[PBFPosterSnapshotReservation init](&v30, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    URL = v19->_URL;
    v19->_URL = (NSURL *)v20;

    objc_storeStrong((id *)&v19->_error, a6);
    objc_storeStrong((id *)&v19->_displayContext, a4);
    objc_msgSend((id)objc_opt_class(), "globalCache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v22, "setImage:forKey:", v15, v23);
    else
      objc_msgSend(v22, "removeImageForKey:", v23);

  }
  return v19;
}

- (void)cancel
{
  NSError *error;
  PBFPosterSnapshotReservation *obj;

  obj = self;
  objc_sync_enter(obj);
  error = obj->_error;
  obj->_error = 0;

  objc_sync_exit(obj);
}

- (id)fetchImageWithError:(id *)a3
{
  NSURL *v5;
  PBFDisplayContext *v6;
  NSObject *v7;
  void *v8;
  PBFPosterSnapshotReservation *v9;
  void *v10;
  void *v11;
  NSURL *v12;
  PBFDisplayContext *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  NSURL *URL;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v25;
  PBFDisplayContext *displayContext;
  uint64_t v27;
  _QWORD v28[4];
  NSURL *v29;
  PBFDisplayContext *v30;
  _BYTE *v31;
  uint8_t v32[4];
  void *v33;
  __int16 v34;
  PBFDisplayContext *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;
  NSURL *v39;
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = self->_URL;
  v6 = self->_displayContext;
  PBFLogSnapshotter();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[NSURL lastPathComponent](v5, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin fetch for image of displayContext %{public}@", buf, 0x16u);

  }
  v9 = self;
  objc_sync_enter(v9);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v41 = __Block_byref_object_copy__14;
  v42 = __Block_byref_object_dispose__14;
  v43 = 0;
  objc_msgSend((id)objc_opt_class(), "globalCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](v5, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __52__PBFPosterSnapshotReservation_fetchImageWithError___block_invoke;
  v28[3] = &unk_1E86F7058;
  v12 = v5;
  v29 = v12;
  v31 = buf;
  v13 = v6;
  v30 = v13;
  objc_msgSend(v10, "imageForKey:generatingIfNecessaryWithBlock:", v11, v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    PBFLogSnapshotter();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[NSURL lastPathComponent](v12, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v32 = 138543618;
      v33 = v16;
      v34 = 2114;
      v35 = v13;
      _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Image for displayContext %{public}@ was fetched; returning",
        v32,
        0x16u);

    }
    v17 = v14;
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      goto LABEL_11;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    URL = (NSURL *)CFSTR("(nil URL");
    if (self->_URL)
      URL = self->_URL;
    v38 = *MEMORY[0x1E0CB3308];
    v39 = URL;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pbf_generalErrorWithCode:userInfo:", 7, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v21;

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
LABEL_11:
      PBFLogSnapshotter();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        -[NSURL lastPathComponent](v12, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        displayContext = self->_displayContext;
        v27 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v32 = 138543874;
        v33 = v25;
        v34 = 2114;
        v35 = displayContext;
        v36 = 2114;
        v37 = v27;
        _os_log_error_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Error fetching image for displayContext %{public}@: %{public}@", v32, 0x20u);

      }
      objc_storeStrong((id *)&v9->_error, *(id *)(*(_QWORD *)&buf[8] + 40));
      if (a3)
        *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    }
  }

  _Block_object_dispose(buf, 8);
  objc_sync_exit(v9);

  return v14;
}

id __52__PBFPosterSnapshotReservation_fetchImageWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id obj;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "checkResourceIsReachableAndReturnError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  PBFLogSnapshotter();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v21 = v7;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Loading image of displayContext %{public}@", buf, 0x16u);

    }
    v9 = objc_alloc(MEMORY[0x1E0D7FCD8]);
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D7FCE0], "defaultFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "initWithURL:format:", v10, v11);

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(id *)(v12 + 40);
    -[NSObject createUIImageWithError:](v6, "createUIImageWithError:", &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v12 + 40), v18);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v21 = v15;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v17;
      _os_log_error_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Failed fetch for image of displayContext %{public}@: %{public}@", buf, 0x20u);

    }
    v13 = 0;
  }

  return v13;
}

- (UIImage)image
{
  return (UIImage *)-[PBFPosterSnapshotReservation fetchImageWithError:](self, "fetchImageWithError:", 0);
}

- (BOOL)isValid
{
  PBFPosterSnapshotReservation *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend((id)objc_opt_class(), "globalCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](v2->_URL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = 1;
  else
    v6 = -[NSURL checkResourceIsReachableAndReturnError:](v2->_URL, "checkResourceIsReachableAndReturnError:", 0);
  objc_sync_exit(v2);

  return v6;
}

- (NSError)error
{
  return self->_error;
}

- (NSURL)URL
{
  return self->_URL;
}

- (PBFDisplayContext)displayContext
{
  return self->_displayContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)initWithURL:displayContext:image:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithURL:displayContext:image:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithURL:displayContext:image:error:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithURL:displayContext:image:error:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
