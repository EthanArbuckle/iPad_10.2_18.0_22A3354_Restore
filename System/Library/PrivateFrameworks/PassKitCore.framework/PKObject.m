@implementation PKObject

- (PKObject)init
{
  return -[PKObject initWithDictionary:bundle:](self, "initWithDictionary:bundle:", 0, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  PKImageSet *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)MEMORY[0x19400CFE8]();
  -[PKObject uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v5, CFSTR("uniqueID"));

  -[PKObject manifestHash](self, "manifestHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("manifestHash"));

  -[PKObject content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("content"));

  -[PKObject webServiceURL](self, "webServiceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("webServiceURL"));

  -[PKObject authenticationToken](self, "authenticationToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("authenticationToken"));

  -[PKObject displayProfile](self, "displayProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("displayProfile"));

  objc_msgSend(v15, "encodeInteger:forKey:", -[PKObject settings](self, "settings"), CFSTR("settings"));
  objc_msgSend(v15, "encodeInteger:forKey:", -[PKObject shareCount](self, "shareCount"), CFSTR("shareCount"));
  -[PKObject signingDate](self, "signingDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("signingDate"));

  for (i = 0; i != 9; ++i)
  {
    v13 = self->_imageSets[i];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("images_%ld"), i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v13, v14);

  }
  objc_autoreleasePoolPop(v4);

}

- (PKObject)initWithCoder:(id)a3
{
  id v4;
  PKObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  PKImageSet **imageSets;
  void *v29;
  uint64_t v30;
  PKImageSet *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PKObject;
  v5 = -[PKObject init](&v38, sel_init);
  if (v5)
  {
    v37 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject setUniqueID:](v5, "setUniqueID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manifestHash"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject setManifestHash:](v5, "setManifestHash:", v7);

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("content"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject setContent:](v5, "setContent:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webServiceURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject setWebServiceURL:](v5, "setWebServiceURL:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationToken"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject setAuthenticationToken:](v5, "setAuthenticationToken:", v13);

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("displayProfile"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject setDisplayProfile:](v5, "setDisplayProfile:", v17);

    -[PKObject setShareCount:](v5, "setShareCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shareCount")));
    -[PKObject setSettingsWithoutUpdatingDataAccessor:](v5, "setSettingsWithoutUpdatingDataAccessor:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("settings")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signingDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject setSigningDate:](v5, "setSigningDate:", v18);

    v36 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    v34 = objc_opt_class();
    v33 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v35, v34, v33, v19, v20, v21, v22, v23, v24, v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    imageSets = v5->_imageSets;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("images_%ld"), v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = imageSets[v27];
      imageSets[v27] = (PKImageSet *)v30;

      ++v27;
    }
    while (v27 != 9);
    v5->_initializedViaInitWithCoder = 1;

    objc_autoreleasePoolPop(v37);
  }

  return v5;
}

- (void)setWebServiceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setDisplayProfile:(id)a3
{
  objc_storeStrong((id *)&self->_displayProfile, a3);
}

- (void)setAuthenticationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setSigningDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setShareCount:(int64_t)a3
{
  self->_shareCount = a3;
}

- (void)setSettingsWithoutUpdatingDataAccessor:(unint64_t)a3
{
  self->_settings = a3;
}

- (void)setManifestHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setContent:(id)a3
{
  PKContent *v4;
  PKContent *content;

  v4 = (PKContent *)a3;
  os_unfair_lock_lock(&self->_lock);
  content = self->_content;
  self->_content = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (PKDisplayProfile)displayProfile
{
  return self->_displayProfile;
}

- (NSURL)webServiceURL
{
  return self->_webServiceURL;
}

- (NSDate)signingDate
{
  return self->_signingDate;
}

- (int64_t)shareCount
{
  return self->_shareCount;
}

- (unint64_t)settings
{
  return self->_settings;
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_preferredImageSuffix, 0);
  objc_storeStrong((id *)&self->_signingDate, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_webServiceURL, 0);
  objc_storeStrong((id *)&self->_displayProfile, 0);
  objc_storeStrong((id *)&self->_dataAccessor, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_preferredDisplayTraits, 0);
  for (i = 88; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_content, 0);
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (id)content
{
  os_unfair_lock_s *p_lock;
  PKContent *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_content;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)contentLoadedIfNeeded
{
  -[PKObject loadContentSync](self, "loadContentSync");
  return -[PKObject content](self, "content");
}

- (void)loadContentSync
{
  void *v3;
  id v4;

  if (!-[PKObject isContentLoaded](self, "isContentLoaded"))
  {
    -[PKObject dataAccessor](self, "dataAccessor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject setContent:](self, "setContent:", v3);

  }
}

- (BOOL)isContentLoaded
{
  PKObject *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_content != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)imageSetLoadedIfNeeded:(int64_t)a3
{
  -[PKObject loadImageSetSync:preheat:](self, "loadImageSetSync:preheat:", a3, 0);
  return self->_imageSets[a3];
}

- (void)loadImageSetSync:(int64_t)a3 preheat:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  if (!-[PKObject isImageSetLoaded:](self, "isImageSetLoaded:"))
  {
    -[PKObject dataAccessor](self, "dataAccessor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject preferredImageScale](self, "preferredImageScale");
    v9 = v8;
    -[PKObject preferredImageSuffix](self, "preferredImageSuffix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject displayProfile](self, "displayProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageSetForType:screenScale:suffix:displayProfile:preheat:", a3, v10, v11, v4, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[PKObject setImageSet:forImageSetType:](self, "setImageSet:forImageSetType:", v12, a3);
  }
}

- (BOOL)isImageSetLoaded:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(a3) = self->_imageSets[a3] != 0;
  os_unfair_lock_unlock(p_lock);
  return a3;
}

- (PKDataAccessor)dataAccessor
{
  return self->_dataAccessor;
}

- (void)setImageSet:(id)a3 forImageSetType:(int64_t)a4
{
  objc_class *v6;
  Class *v7;
  Class v8;

  v6 = (objc_class *)a3;
  os_unfair_lock_lock(&self->_lock);
  v7 = &self->super.isa + a4;
  v8 = v7[3];
  v7[3] = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)preferredImageSuffix
{
  return self->_preferredImageSuffix;
}

- (double)preferredImageScale
{
  return self->_preferredImageScale;
}

- (void)dealloc
{
  uint64_t i;
  void *v4;
  objc_super v5;

  for (i = 24; i != 96; i += 8)
  {
    v4 = *(Class *)((char *)&self->super.isa + i);
    *(Class *)((char *)&self->super.isa + i) = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)PKObject;
  -[PKObject dealloc](&v5, sel_dealloc);
}

void __53__PKObject_loadImageSetAsync_preheat_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setImageSet:forImageSetType:", v6, *(_QWORD *)(a1 + 48));
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (PKObject)initWithDictionary:(id)a3 bundle:(id)a4
{
  PKObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKObject;
  v4 = -[PKObject init](&v6, sel_init, a3, a4);
  if (v4)
  {
    v4->_settings = objc_msgSend((id)objc_opt_class(), "defaultSettings");
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)setDataAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_dataAccessor, a3);
}

+ (id)createWithValidatedFileDataAccessor:(id)a3
{
  return (id)objc_msgSend(a1, "_createWithFileDataAccessor:validationOptions:warnings:error:", a3, 1, 0, 0);
}

+ (id)_createWithFileDataAccessor:(id)a3 validationOptions:(unint64_t)a4 warnings:(id *)a5 error:(id *)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  objc_class *v19;
  objc_class *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id *v45;
  id *v46;
  int v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  if (v18)
  {
    v19 = (objc_class *)objc_msgSend(a1, "resolvingClass");
    if (v19 != a1)
    {
      v20 = v19;
      PKLogFacilityTypeGetObject(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromClass((Class)a1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v67 = v22;
        v68 = 2112;
        v69 = v23;
        _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "PKObject: unable to use subclass %@ to create an automatically typed object instead of root resolving class %@.", buf, 0x16u);

      }
      if (a6)
      {
        NSStringFromClass((Class)a1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v20);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        PKValidationErrorWithReason(CFSTR("forbidden to use subclass %@ to create an automatically typed object instead of root resolving class %@."), v25, v26, v27, v28, v29, v30, v31, (uint64_t)v24);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_9;
    }
    v33 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v18, "dictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundle");
    v35 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v35;
    if (v34 && v35)
    {
      v44 = (void *)objc_msgSend(a1, "classForDictionary:bundle:", v34, v35);
      if (a5)
        v45 = &v65;
      else
        v45 = 0;
      if (a5)
        v65 = 0;
      if (a6)
        v46 = &v64;
      else
        v46 = 0;
      if (a6)
        v64 = 0;
      v63 = 0;
      v60 = v44;
      v47 = objc_msgSend(v44, "isValidObjectWithFileDataAccessor:validationOptions:warnings:error:signingDate:passDictionary:", v18, a4, v45, v46, &v63, v34);
      if (a5)
        v48 = v65;
      else
        v48 = 0;
      v62 = v33;
      if (a6)
        v49 = v64;
      else
        v49 = 0;
      v52 = v63;
      v61 = v63;
      if (v47)
      {
        objc_msgSend(v60, "dataTypeIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setExplicitDataTypeIdentifier:", v53);

        v54 = objc_msgSend(objc_alloc((Class)v60), "initWithDictionary:bundle:", v34, v43);
        v50 = v54;
        if (v54)
        {
          objc_storeStrong((id *)(v54 + 128), a3);
          objc_msgSend(v18, "manifestHash");
          v55 = objc_claimAutoreleasedReturnValue();
          v56 = *(void **)(v50 + 120);
          *(_QWORD *)(v50 + 120) = v55;

          objc_storeStrong((id *)(v50 + 160), v52);
        }
      }
      else
      {
        v50 = 0;
      }
      v51 = v61;
      v33 = v62;
    }
    else
    {
      PKValidationErrorWithReason(0, v36, v37, v38, v39, v40, v41, v42, v58);
      v49 = (id)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      v50 = 0;
      v51 = 0;
    }

    objc_autoreleasePoolPop(v33);
    if (a5 && v48)
      *a5 = objc_retainAutorelease(v48);
    if (a6 && v49)
      *a6 = objc_retainAutorelease(v49);
    v32 = (id)v50;

  }
  else
  {
    if (!a6)
    {
LABEL_9:
      v32 = 0;
      goto LABEL_41;
    }
    PKValidationErrorWithReason(0, v11, v12, v13, v14, v15, v16, v17, v58);
    v32 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_41:

  return v32;
}

- (void)loadImageSetAsync:(int64_t)a3 preheat:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD);
  _QWORD v20[4];
  void (**v21)(_QWORD);
  id v22[2];
  id block[4];
  id v24;

  v5 = a4;
  v8 = (void (**)(_QWORD))a5;
  if (-[PKObject isImageSetLoaded:](self, "isImageSetLoaded:", a3))
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__PKObject_loadImageSetAsync_preheat_withCompletion___block_invoke_2;
    v18[3] = &unk_1E2ABD9A0;
    v19 = v8;
    v11 = v18;
    block[0] = v10;
    block[1] = (id)3221225472;
    block[2] = __dispatch_async_ar_block_invoke_12;
    block[3] = &unk_1E2ABD9A0;
    v24 = v11;
    dispatch_async(v9, block);

    v12 = v19;
  }
  else
  {
    -[PKObject dataAccessor](self, "dataAccessor");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v12 = (void *)v13;
      objc_initWeak(block, self);
      -[PKObject preferredImageScale](self, "preferredImageScale");
      v15 = v14;
      -[PKObject preferredImageSuffix](self, "preferredImageSuffix");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKObject displayProfile](self, "displayProfile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __53__PKObject_loadImageSetAsync_preheat_withCompletion___block_invoke;
      v20[3] = &unk_1E2AD3848;
      objc_copyWeak(v22, block);
      v22[1] = (id)a3;
      v21 = v8;
      objc_msgSend(v12, "imageSetForType:screenScale:suffix:displayProfile:preheat:withCompletion:", a3, v16, v17, v5, v20, v15);

      objc_destroyWeak(v22);
      objc_destroyWeak(block);
    }
    else
    {
      if (v8)
        v8[2](v8);
      v12 = 0;
    }
  }

}

- (PKObject)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  PKObject *v7;

  v6 = a3;
  v7 = (PKObject *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "resolvingClass"), "createWithData:warnings:error:", v6, 0, a4);

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    return 0;
  }
  return v7;
}

- (PKObject)initWithFileURL:(id)a3 error:(id *)a4
{
  id v6;
  PKObject *v7;

  v6 = a3;
  v7 = (PKObject *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "resolvingClass"), "createWithFileURL:warnings:error:", v6, 0, a4);

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    return 0;
  }
  return v7;
}

+ (id)createWithData:(id)a3 warnings:(id *)a4 error:(id *)a5
{
  id v8;
  PKSerializedDataAccessor *v9;
  id v10;
  void *v11;
  void *v12;
  id v14;

  v8 = a3;
  v14 = 0;
  v9 = -[PKSerializedDataAccessor initWithData:error:]([PKSerializedDataAccessor alloc], "initWithData:error:", v8, &v14);

  v10 = v14;
  v11 = v10;
  if (v10)
  {
    v12 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    v12 = (void *)objc_msgSend(a1, "createWithFileDataAccessor:warnings:error:", v9, a4, a5);
  }

  return v12;
}

+ (id)createWithFileURL:(id)a3 warnings:(id *)a4 error:(id *)a5
{
  id v8;
  PKFileDataAccessor *v9;
  id v10;
  void *v11;
  void *v12;
  id v14;

  v8 = a3;
  v14 = 0;
  v9 = -[PKFileDataAccessor initWithFileURL:error:]([PKFileDataAccessor alloc], "initWithFileURL:error:", v8, &v14);

  v10 = v14;
  v11 = v10;
  if (v10)
  {
    v12 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    v12 = (void *)objc_msgSend(a1, "createWithFileDataAccessor:warnings:error:", v9, a4, a5);
  }

  return v12;
}

+ (id)createWithFileDataAccessor:(id)a3 warnings:(id *)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "_createWithFileDataAccessor:validationOptions:warnings:error:", a3, 14, a4, a5);
}

- (void)loadContentAsyncWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id block;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;

  v4 = a3;
  if (-[PKObject isContentLoaded](self, "isContentLoaded"))
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__PKObject_loadContentAsyncWithCompletion___block_invoke_4;
    v13[3] = &unk_1E2ABD9A0;
    v14 = v4;
    v7 = v13;
    block = v6;
    v21 = 3221225472;
    v22 = __dispatch_async_ar_block_invoke_12;
    v23 = &unk_1E2ABD9A0;
    v24 = v7;
    dispatch_async(v5, &block);

    v8 = v14;
  }
  else
  {
    -[PKObject dataAccessor](self, "dataAccessor");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v8 = (void *)v9;
      objc_initWeak(&block, self);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __43__PKObject_loadContentAsyncWithCompletion___block_invoke;
      v17[3] = &unk_1E2AD3820;
      objc_copyWeak(&v19, &block);
      v18 = v4;
      objc_msgSend(v8, "contentWithCompletion:", v17);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&block);
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __43__PKObject_loadContentAsyncWithCompletion___block_invoke_3;
      v15[3] = &unk_1E2ABD9A0;
      v16 = v4;
      v12 = v15;
      block = v11;
      v21 = 3221225472;
      v22 = __dispatch_async_ar_block_invoke_12;
      v23 = &unk_1E2ABD9A0;
      v24 = v12;
      dispatch_async(v10, &block);

      v8 = 0;
    }
  }

}

void __43__PKObject_loadContentAsyncWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[4];
  id v12;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setContent:", v4);

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__PKObject_loadContentAsyncWithCompletion___block_invoke_2;
  v9[3] = &unk_1E2ABD9A0;
  v10 = *(id *)(a1 + 32);
  v8 = v9;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_12;
  block[3] = &unk_1E2ABD9A0;
  v12 = v8;
  dispatch_async(v6, block);

}

uint64_t __43__PKObject_loadContentAsyncWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __43__PKObject_loadContentAsyncWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __43__PKObject_loadContentAsyncWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)flushLoadedContent
{
  -[PKObject setContent:](self, "setContent:", 0);
}

- (void)flushFormattedFieldValues
{
  id v2;

  -[PKObject content](self, "content");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushFormattedFieldValues");

}

- (PKDisplayTraitCollection)preferredDisplayTraits
{
  os_unfair_lock_s *p_lock;
  PKDisplayTraitCollection **p_preferredDisplayTraits;
  PKDisplayTraitCollection *preferredDisplayTraits;
  PKDisplayTraitCollection *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  preferredDisplayTraits = self->_preferredDisplayTraits;
  p_preferredDisplayTraits = &self->_preferredDisplayTraits;
  v6 = preferredDisplayTraits;
  if (!v6)
  {
    v6 = -[PKDisplayTraitCollection initWithDefaultTraits]([PKDisplayTraitCollection alloc], "initWithDefaultTraits");
    objc_storeStrong((id *)p_preferredDisplayTraits, v6);
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)setPreferredDisplayTraits:(id)a3
{
  PKDisplayTraitCollection *v4;
  PKDisplayTraitCollection *preferredDisplayTraits;

  v4 = (PKDisplayTraitCollection *)a3;
  os_unfair_lock_lock(&self->_lock);
  preferredDisplayTraits = self->_preferredDisplayTraits;
  self->_preferredDisplayTraits = v4;

  -[PKObject _lock_flushLoadedImageSets](self, "_lock_flushLoadedImageSets");
  os_unfair_lock_unlock(&self->_lock);
}

- (void)loadCachedImageSet:(int64_t)a3
{
  PKDataAccessor *dataAccessor;
  PKDisplayProfile *displayProfile;
  void *v7;
  void *v8;
  id v9;

  if (!-[PKObject isImageSetLoaded:](self, "isImageSetLoaded:"))
  {
    dataAccessor = self->_dataAccessor;
    displayProfile = self->_displayProfile;
    -[PKObject preferredDisplayTraits](self, "preferredDisplayTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDataAccessor cachedImageSetForType:withDisplayProfile:displayTraits:](dataAccessor, "cachedImageSetForType:withDisplayProfile:displayTraits:", a3, displayProfile, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v9;
    if (v9)
    {
      -[PKObject setImageSet:forImageSetType:](self, "setImageSet:forImageSetType:", v9, a3);
      v8 = v9;
    }

  }
}

uint64_t __53__PKObject_loadImageSetAsync_preheat_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)flushLoadedImageSets
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKObject _lock_flushLoadedImageSets](self, "_lock_flushLoadedImageSets");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_flushLoadedImageSets
{
  uint64_t i;
  void *v4;

  for (i = 24; i != 96; i += 8)
  {
    v4 = *(Class *)((char *)&self->super.isa + i);
    *(Class *)((char *)&self->super.isa + i) = 0;

  }
}

- (void)revocationStatusWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKObject dataAccessor](self, "dataAccessor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "revocationStatusWithCompletion:", v4);

}

- (void)requestUpdateWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKObject dataAccessor](self, "dataAccessor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestUpdateWithCompletion:", v4);

}

- (void)noteShared
{
  id v3;

  -[PKObject setShareCount:](self, "setShareCount:", -[PKObject shareCount](self, "shareCount") + 1);
  -[PKObject dataAccessor](self, "dataAccessor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteShared");

}

- (BOOL)remoteAssetsDownloadedForSEIDs:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PKObject dataAccessor](self, "dataAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "remoteAssetsDownloadedForSEIDs:", v4);

  return v6;
}

- (void)downloadRemoteAssetsWithCompletion:(id)a3
{
  -[PKObject downloadRemoteAssetsWithConfiguration:completion:](self, "downloadRemoteAssetsWithConfiguration:completion:", 0, a3);
}

- (void)downloadRemoteAssetsForSEIDS:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKDownloadRemoteAssetConfiguration *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  -[PKDownloadRemoteAssetConfiguration setSeids:](v8, "setSeids:", v7);

  -[PKObject downloadRemoteAssetsWithConfiguration:completion:](self, "downloadRemoteAssetsWithConfiguration:completion:", v8, v6);
}

- (void)downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:(id)a3 seids:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDownloadRemoteAssetConfiguration *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  -[PKDownloadRemoteAssetConfiguration setCloudStoreCoordinatorDelegate:](v11, "setCloudStoreCoordinatorDelegate:", v10);

  -[PKDownloadRemoteAssetConfiguration setSeids:](v11, "setSeids:", v9);
  -[PKObject downloadRemoteAssetsWithConfiguration:completion:](self, "downloadRemoteAssetsWithConfiguration:completion:", v11, v8);

}

- (void)downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PKObject dataAccessor](self, "dataAccessor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "downloadRemoteAssetsWithConfiguration:completion:", v7, v6);

}

- (id)localizedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKObject dataAccessor](self, "dataAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedPassStringForPassBundle(v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)archiveData
{
  void *v2;
  void *v3;

  -[PKObject dataAccessor](self, "dataAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "archiveData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)serializedFileWrapper
{
  void *v2;
  void *v3;

  -[PKObject dataAccessor](self, "dataAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedFileWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)modificationDate
{
  void *v2;
  void *v3;

  -[PKObject dataAccessor](self, "dataAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceValueForKey:", *MEMORY[0x1E0C998D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSettings:(unint64_t)a3
{
  id v4;

  if (self->_settings != a3)
  {
    self->_settings = a3;
    -[PKObject dataAccessor](self, "dataAccessor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateSettings:", a3);

  }
}

- (void)reloadDisplayProfileOfType:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[PKObject dataAccessor](self, "dataAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayProfileOfType:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[PKObject setDisplayProfile:](self, "setDisplayProfile:", v7);
    v6 = v7;
  }

}

- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PKObject dataAccessor](self, "dataAccessor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataForBundleResourceNamed:withExtension:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dataForBundleResources:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKObject dataAccessor](self, "dataAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataForBundleResources:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)passLocalizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKObject dataAccessor](self, "dataAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passLocalizedStringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (Class)resolvingClass
{
  return (Class)objc_opt_class();
}

+ (Class)classForDictionary:(id)a3 bundle:(id)a4
{
  return (Class)objc_opt_class();
}

+ (id)dataTypeIdentifier
{
  return 0;
}

+ (BOOL)isValidObjectWithFileDataAccessor:(id)a3 validationOptions:(unint64_t)a4 warnings:(id *)a5 error:(id *)a6 signingDate:(id *)a7 passDictionary:(id)a8
{
  return 1;
}

+ (id)fetchSigningDateForObjectWithFileDataAccessor:(id)a3 passDictionary:(id)a4
{
  return 0;
}

- (BOOL)isImageSetType:(int64_t)a3 equalToImageSetTypeFromObject:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageSetLoadedIfNeeded:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isEqual:", v8);
  return (char)v6;
}

- (void)setMissingImageSetsFromObject:(id)a3
{
  PKObject *v4;
  PKObject *v5;
  PKObject *v6;
  os_unfair_lock_s *p_lock;
  os_unfair_lock_s *v8;
  uint64_t i;
  PKObject *v10;

  v4 = (PKObject *)a3;
  if (v4 && self != v4)
  {
    if (self >= v4)
      v5 = v4;
    else
      v5 = self;
    v10 = v4;
    if (self >= v4)
      v6 = self;
    else
      v6 = v4;
    p_lock = &v5->_lock;
    os_unfair_lock_lock(&v5->_lock);
    v8 = &v6->_lock;
    os_unfair_lock_lock(v8);
    for (i = 24; i != 96; i += 8)
    {
      if (!*(Class *)((char *)&self->super.isa + i))
        objc_storeStrong((id *)((char *)&self->super.isa + i), *(id *)((char *)&v10->super.isa + i));
    }
    os_unfair_lock_unlock(v8);
    os_unfair_lock_unlock(p_lock);
    v4 = v10;
  }

}

+ (unint64_t)defaultSettings
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t i;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v6;

  v8 = -[NSData copyWithZone:](self->_manifestHash, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v8;

  -[PKObject content](self, "content");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSURL copyWithZone:](self->_webServiceURL, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v12;

  v14 = -[NSString copyWithZone:](self->_authenticationToken, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v14;

  v16 = -[PKDisplayProfile copyWithZone:](self->_displayProfile, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v16;

  v18 = -[NSString copyWithZone:](self->_preferredImageSuffix, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v18;

  *(_QWORD *)(v5 + 176) = self->_shareCount;
  *(_QWORD *)(v5 + 168) = self->_settings;
  objc_storeStrong((id *)(v5 + 160), self->_signingDate);
  for (i = 24; i != 96; i += 8)
    objc_storeStrong((id *)(v5 + i), *(id *)((char *)&self->super.isa + i));
  return (id)v5;
}

- (BOOL)initializedViaInitWithCoder
{
  return self->_initializedViaInitWithCoder;
}

- (void)setPreferredImageScale:(double)a3
{
  self->_preferredImageScale = a3;
}

- (void)setPreferredImageSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_preferredImageSuffix, a3);
}

@end
