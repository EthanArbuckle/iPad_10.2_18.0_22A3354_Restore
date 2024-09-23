@implementation NCAvatarImageRenderer

+ (id)sharedInstanceForPointSize:(double)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  if (sharedInstanceForPointSize__onceToken != -1)
    dispatch_once(&sharedInstanceForPointSize__onceToken, &__block_literal_global_9);
  v5 = a1;
  objc_sync_enter(v5);
  v6 = (void *)sharedInstanceForPointSize____pointSizesToRenderers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = -[NCAvatarImageRenderer _initWithPointSize:]([NCAvatarImageRenderer alloc], "_initWithPointSize:", a3);
    v9 = (void *)sharedInstanceForPointSize____pointSizesToRenderers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v10);

  }
  objc_sync_exit(v5);

  return v8;
}

void __52__NCAvatarImageRenderer_sharedInstanceForPointSize___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)sharedInstanceForPointSize____pointSizesToRenderers;
  sharedInstanceForPointSize____pointSizesToRenderers = (uint64_t)v0;

}

- (void)renderAvatarForRequest:(id)a3 compatibleWithTraitCollection:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  NCAvatarImageRenderer *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NCAvatarImageRenderer _getAvatarImageGenerationQueueAndIncrementUsageCount](self, "_getAvatarImageGenerationQueueAndIncrementUsageCount");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__NCAvatarImageRenderer_renderAvatarForRequest_compatibleWithTraitCollection_completion___block_invoke;
  v15[3] = &unk_1E8D1D348;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __89__NCAvatarImageRenderer_renderAvatarForRequest_compatibleWithTraitCollection_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  char v7;
  int v8;
  id v9;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  char v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  objc_msgSend(*(id *)(a1 + 32), "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "communicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "topLevelSectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = objc_msgSend(v3, "isSystemImage");
  else
    v6 = 0;
  v7 = v6 ^ 1;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  if (v5)
    v8 = v6 ^ 1;
  else
    v8 = 0;
  v55 = __Block_byref_object_copy__4;
  v56 = __Block_byref_object_dispose__4;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__4;
  v50 = __Block_byref_object_dispose__4;
  v51 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__NCAvatarImageRenderer_renderAvatarForRequest_compatibleWithTraitCollection_completion___block_invoke_3;
  aBlock[3] = &unk_1E8D1D320;
  v40 = *(id *)(a1 + 56);
  v41 = &v52;
  v43 = 0;
  v9 = v4;
  v36 = v9;
  v10 = v3;
  v44 = v6;
  v45 = v8;
  v37 = v10;
  v38 = 0;
  v11 = *(_QWORD *)(a1 + 40);
  v42 = &v46;
  v39 = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((v7 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_systemImageNamed:traitCollection:", v5, *(_QWORD *)(a1 + 48));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v53[5];
    v53[5] = v13;

  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "_imageNamed:inBundleIdentifier:traitCollection:", v5, v9, *(_QWORD *)(a1 + 48));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v53[5];
    v53[5] = v15;

  }
  if (v53[5])
  {
    v12[2](v12);
    v17 = 0;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0DC6030];
    objc_msgSend(*(id *)(a1 + 32), "content");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "communicationContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "topLevelSectionIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97450], "descriptorForRequiredKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:", v20, v21, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_queue_imageForContacts:compatibleWithTraitCollection:circular:", v17, *(_QWORD *)(a1 + 48), objc_msgSend(v10, "isBusinessCorrespondence") ^ 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v53;
      v26 = v23;
      v27 = (void *)v25[5];
      v25[5] = (uint64_t)v26;
    }
    else
    {
      v34 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "content");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "communicationContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "allContacts");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_silhouetteFallbackImageNameForContacts:", v30);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v47[5];
      v47[5] = v31;

      objc_msgSend(*(id *)(a1 + 40), "_systemImageNamed:traitCollection:", v47[5], *(_QWORD *)(a1 + 48));
      v33 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v53[5];
      v53[5] = v33;
    }

    v12[2](v12);
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

}

uint64_t __89__NCAvatarImageRenderer_renderAvatarForRequest_compatibleWithTraitCollection_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(unsigned __int8 *)(a1 + 88));
  v3 = (id)*MEMORY[0x1E0DC5F78];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "un_logDigest");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    if (*(_BYTE *)(a1 + 89))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    if (*(_BYTE *)(a1 + 90))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("YES with count of '%lu'"), objc_msgSend(*(id *)(a1 + 48), "count"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("NO");
    }
    v11 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (!v11)
      v11 = CFSTR("NO");
    *(_DWORD *)buf = 138544898;
    v15 = v13;
    v16 = 2114;
    v17 = v5;
    v18 = 2114;
    v19 = v6;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v8;
    v24 = 2114;
    v25 = v10;
    v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_1CFC3D000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Context identifier:%{public}@ - Rendered avatar image: %{public}@. Tried System Image: %{public}@, Tried Bundle Image: %{public}@, Tried Ephemeral Contacts: %{public}@, Tried Silhouette Fallback of Name: %{public}@", buf, 0x48u);
    if (v9)

  }
  return objc_msgSend(*(id *)(a1 + 56), "_decrementAvatarImageGenerationQueueUsageCountAndInvalidateIfNeeded");
}

- (id)_initWithPointSize:(double)a3
{
  NCAvatarImageRenderer *v4;
  id v5;
  void *v6;
  uint64_t v7;
  CNAvatarImageRenderer *avatarRenderer;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NCAvatarImageRenderer;
  v4 = -[NCAvatarImageRenderer init](&v11, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C97450]);
    objc_msgSend(MEMORY[0x1E0C97458], "offMainThreadSynchronousRenderingOnlySettingsWithCacheSize:", 100);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithSettings:", v6);
    avatarRenderer = v4->_avatarRenderer;
    v4->_avatarRenderer = (CNAvatarImageRenderer *)v7;

    v4->_avatarImageGenerationQueueUsageCount = 0;
    v9 = 44.0;
    if (a3 > 0.0)
      v9 = a3;
    v4->_pointSize = v9;
  }
  return v4;
}

- (id)_getAvatarImageGenerationQueueAndIncrementUsageCount
{
  NCAvatarImageRenderer *v2;
  OS_dispatch_queue *avatarImageGenerationQueue;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t SerialWithQoS;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *v11;

  v2 = self;
  objc_sync_enter(v2);
  avatarImageGenerationQueue = v2->_avatarImageGenerationQueue;
  if (avatarImageGenerationQueue)
  {
    ++v2->_avatarImageGenerationQueueUsageCount;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(".%@.avatarGeneration"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    v10 = v2->_avatarImageGenerationQueue;
    v2->_avatarImageGenerationQueue = (OS_dispatch_queue *)SerialWithQoS;

    v2->_avatarImageGenerationQueueUsageCount = 1;
    avatarImageGenerationQueue = v2->_avatarImageGenerationQueue;
  }
  v11 = avatarImageGenerationQueue;
  objc_sync_exit(v2);

  return v11;
}

- (void)_decrementAvatarImageGenerationQueueUsageCountAndInvalidateIfNeeded
{
  unint64_t avatarImageGenerationQueueUsageCount;
  OS_dispatch_queue *avatarImageGenerationQueue;
  NCAvatarImageRenderer *obj;

  obj = self;
  objc_sync_enter(obj);
  avatarImageGenerationQueueUsageCount = obj->_avatarImageGenerationQueueUsageCount;
  if (avatarImageGenerationQueueUsageCount < 2)
  {
    avatarImageGenerationQueue = obj->_avatarImageGenerationQueue;
    obj->_avatarImageGenerationQueue = 0;

  }
  else
  {
    obj->_avatarImageGenerationQueueUsageCount = avatarImageGenerationQueueUsageCount - 1;
  }
  objc_sync_exit(obj);

}

- (id)_imageNamed:(id)a3 inBundleIdentifier:(id)a4 traitCollection:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CA5870], "unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  if (!v12
    || (objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v12), (v13 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v14 = (void *)v13,
        objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v13, v9),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        !v15))
  {
    v16 = (void *)*MEMORY[0x1E0DC5F78];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F78], OS_LOG_TYPE_ERROR))
      -[NCAvatarImageRenderer _imageNamed:inBundleIdentifier:traitCollection:].cold.1(v16, v7, (uint64_t)v8);
    v15 = 0;
  }

  return v15;
}

- (id)_systemImageNamed:(id)a3 traitCollection:(id)a4
{
  void *v5;
  double pointSize;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0DC3888];
  pointSize = self->_pointSize;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v5, "configurationWithPointSize:", pointSize);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationWithTraitCollection:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_queue_imageForContacts:(id)a3 compatibleWithTraitCollection:(id)a4 circular:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "displayScale");
    v11 = v10;
    if (objc_msgSend(v9, "userInterfaceStyle") == 2)
      v12 = 3;
    else
      v12 = 2;
    objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:backgroundStyle:", 0, !v5, v12, self->_pointSize, self->_pointSize, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarImageRenderer avatarImageForContacts:scope:](self->_avatarRenderer, "avatarImageForContacts:scope:", v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_silhouetteFallbackImageNameForContacts:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "count");
  if (v3 > 2)
    return CFSTR("person.3.fill");
  else
    return off_1E8D1D368[v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarImageGenerationQueue, 0);
  objc_storeStrong((id *)&self->_avatarRenderer, 0);
}

- (void)_imageNamed:(void *)a1 inBundleIdentifier:(void *)a2 traitCollection:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "un_logDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = v6;
  v9 = 2114;
  v10 = a3;
  v11 = 2112;
  v12 = CFSTR("<NULL>");
  _os_log_error_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_ERROR, "Error loading image named '%{public}@' in bundle '%{public}@'. Error: %@", (uint8_t *)&v7, 0x20u);

}

@end
