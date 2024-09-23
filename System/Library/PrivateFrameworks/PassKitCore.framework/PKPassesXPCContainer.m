@implementation PKPassesXPCContainer

- (PKPassesXPCContainer)init
{

  return 0;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassesXPCContainer;
  result = -[PKPassesXPCContainer init](&v3, sel_init);
  if (result)
  {
    *((_DWORD *)result + 2) = 0;
    *((_QWORD *)result + 4) = 1;
  }
  return result;
}

- (id)_initWithFileDescriptorContainer:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  PKPassesXPCContainer *v8;

  v5 = a3;
  if (v5)
  {
    v6 = -[PKPassesXPCContainer _init](self, "_init");
    v7 = v6;
    if (v6)
      objc_storeStrong(v6 + 2, a3);
    else
      objc_msgSend(v5, "invalidate");
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKPassesXPCContainer)initWithFileURL:(id)a3
{
  id v4;
  PKFileDescriptorXPCContainer *v5;
  PKPassesXPCContainer *v6;

  v4 = a3;
  v5 = -[PKFileDescriptorXPCContainer initWithFileURL:]([PKFileDescriptorXPCContainer alloc], "initWithFileURL:", v4);

  v6 = -[PKPassesXPCContainer _initWithFileDescriptorContainer:](self, "_initWithFileDescriptorContainer:", v5);
  return v6;
}

- (PKPassesXPCContainer)initWithFileDescriptor:(int)a3
{
  PKFileDescriptorXPCContainer *v4;
  PKPassesXPCContainer *v5;

  v4 = -[PKFileDescriptorXPCContainer initWithFileDescriptor:]([PKFileDescriptorXPCContainer alloc], "initWithFileDescriptor:", *(_QWORD *)&a3);
  v5 = -[PKPassesXPCContainer _initWithFileDescriptorContainer:](self, "_initWithFileDescriptorContainer:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassesXPCContainer)initWithCoder:(id)a3
{
  id v4;
  PKPassesXPCContainer *v5;
  uint64_t v6;
  PKFileDescriptorXPCContainer *fd;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *passFDs;

  v4 = a3;
  v5 = -[PKPassesXPCContainer _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fd"));
    v6 = objc_claimAutoreleasedReturnValue();
    fd = v5->_fd;
    v5->_fd = (PKFileDescriptorXPCContainer *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v8, "initWithObjects:", v9, v10, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("passFDs"));
    v12 = objc_claimAutoreleasedReturnValue();
    passFDs = v5->_passFDs;
    v5->_passFDs = (NSDictionary *)v12;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeObject:forKey:", self->_fd, CFSTR("fd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passFDs, CFSTR("passFDs"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  objc_super v3;

  -[PKPassesXPCContainer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPassesXPCContainer;
  -[PKPassesXPCContainer dealloc](&v3, sel_dealloc);
}

- (BOOL)isInvalidated
{
  PKPassesXPCContainer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  PKFileDescriptorXPCContainer *fd;
  NSDictionary *passFDs;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[PKFileDescriptorXPCContainer invalidate](self->_fd, "invalidate");
    fd = self->_fd;
    self->_fd = 0;

    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_passFDs, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_89);
    passFDs = self->_passFDs;
    self->_passFDs = 0;

    self->_status = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __34__PKPassesXPCContainer_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- ($06E035DAA80D7DA92D7AC3530BEA5F2A)unarchivePassesWithBlock:(id)a3
{
  int64_t v3;
  unint64_t v4;
  $06E035DAA80D7DA92D7AC3530BEA5F2A result;

  v3 = -[PKPassesXPCContainer unarchivePassesWithOptions:usingBlock:](self, "unarchivePassesWithOptions:usingBlock:", 0, a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- ($06E035DAA80D7DA92D7AC3530BEA5F2A)unarchivePassesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v5;
  int64_t status;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  __int128 v26;
  int64_t v27;
  NSUInteger v28;
  os_unfair_lock_t lock;
  void (**v30)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v31;
  char v32;
  id obj;
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  BOOL invalidated;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;
  $06E035DAA80D7DA92D7AC3530BEA5F2A result;

  v32 = a3;
  v55 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKPassesXPCContainer _unarchive](self, "_unarchive");
  status = self->_status;
  v28 = -[NSDictionary count](self->_passFDs, "count");
  v30 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v5;
  if (!v5 || status)
  {
    v27 = status;
    os_unfair_lock_unlock(lock);
  }
  else
  {
    v7 = (void *)-[NSDictionary copy](self->_passFDs, "copy");
    os_unfair_lock_unlock(lock);
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v28);
      v31 = v7;
      objc_msgSend(v7, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v9);

      v10 = objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_21);
      invalidated = 0;
      if (!v28)
        goto LABEL_27;
      v27 = 0;
      v12 = 0;
      v13 = v28 - 1;
      *(_QWORD *)&v11 = 138412546;
      v26 = v11;
      do
      {
        v14 = (void *)MEMORY[0x19400CFE8](v10);
        if ((v32 & 2) != 0)
          v15 = v13;
        else
          v15 = v12;
        objc_msgSend(v8, "objectAtIndexedSubscript:", v15, v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!invalidated)
        {
          v44 = 0;
          v45 = &v44;
          v46 = 0x3032000000;
          v47 = __Block_byref_object_copy__28;
          v48 = __Block_byref_object_dispose__28;
          v49 = 0;
          v38 = 0;
          v39 = &v38;
          v40 = 0x3032000000;
          v41 = __Block_byref_object_copy__28;
          v42 = __Block_byref_object_dispose__28;
          v43 = 0;
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __62__PKPassesXPCContainer_unarchivePassesWithOptions_usingBlock___block_invoke_22;
          v34[3] = &unk_1E2ACBDB8;
          v34[4] = self;
          v18 = v16;
          v35 = v18;
          v36 = &v44;
          v37 = &v38;
          objc_msgSend(v17, "accessFileDescriptorWithBlock:", v34);
          v19 = v45[5];
          if (v19
            && (v20 = (id *)(v39 + 5),
                obj = (id)v39[5],
                v21 = +[PKObject createWithFileDataAccessor:warnings:error:](PKPass, "createWithFileDataAccessor:warnings:error:", v19, 0, &obj), objc_storeStrong(v20, obj), v21))
          {
            PKLogFacilityTypeGetObject(0);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v18;
              _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKPassesXPCContainer: unarchived %@.", buf, 0xCu);
            }
          }
          else
          {
            PKLogFacilityTypeGetObject(0);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = v39[5];
              *(_DWORD *)buf = v26;
              v52 = v18;
              v53 = 2112;
              v54 = v23;
              _os_log_error_impl(&dword_18FC92000, v22, OS_LOG_TYPE_ERROR, "PKPassesXPCContainer: failed to unarchive %@ - %@.", buf, 0x16u);
            }
            v21 = 0;
          }

          ((void (**)(_QWORD, id, NSUInteger, id, BOOL *))v30)[2](v30, v21, v12, v18, &invalidated);
          if (!invalidated)
          {
            os_unfair_lock_lock(lock);
            invalidated = self->_invalidated;
            if (invalidated)
              v27 = self->_status;
            os_unfair_lock_unlock(lock);
          }

          _Block_object_dispose(&v38, 8);
          _Block_object_dispose(&v44, 8);

        }
        objc_autoreleasePoolPop(v14);
        ++v12;
        --v13;
      }
      while (v13 != -1);
      if (v27)
        v28 = 0;
      else
LABEL_27:
        v27 = 0;

    }
    else
    {
      v27 = 0;
    }
  }

  v24 = v27;
  v25 = v28;
  result.var1 = v25;
  result.var0 = v24;
  return result;
}

uint64_t __62__PKPassesXPCContainer_unarchivePassesWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:");
}

void __62__PKPassesXPCContainer_unarchivePassesWithOptions_usingBlock___block_invoke_22(_QWORD *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  PKSerializedDataAccessor *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  if ((a2 & 0x80000000) == 0)
  {
    v4 = *(void **)(a1[4] + 40);
    if (v4)
    {
      objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", a1[5], 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v12 = 0;
    v6 = -[PKSerializedDataAccessor initWithFileDescriptor:error:outputURL:]([PKSerializedDataAccessor alloc], "initWithFileDescriptor:error:outputURL:", a2, &v12, v5);
    v7 = v12;
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v6;

    v10 = *(_QWORD *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v7;

  }
}

- (void)_unarchive
{
  PKFileDescriptorXPCContainer *fd;
  PKFileDescriptorXPCContainer *v4;
  unint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  PKFileDescriptorXPCContainer *v15;
  int *v16;
  char *v17;
  NSObject *p_super;
  const char *v19;
  uint32_t v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  int *v27;
  char *v28;
  NSDictionary *v29;
  NSDictionary *passFDs;
  PKFileDescriptorXPCContainer *v31;
  __int128 v32;
  void *v33;
  void *context;
  id v35;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[6];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  char *v52;
  stat v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (self->_invalidated)
    return;
  fd = self->_fd;
  if (!fd)
    return;
  if (self->_passFDs)
    goto LABEL_45;
  context = (void *)MEMORY[0x19400CFE8]();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__28;
  v47 = __Block_byref_object_dispose__28;
  v48 = 0;
  v4 = self->_fd;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __34__PKPassesXPCContainer__unarchive__block_invoke;
  v42[3] = &unk_1E2ACBDE0;
  v42[4] = self;
  v42[5] = &v43;
  -[PKFileDescriptorXPCContainer accessFileDescriptorWithBlock:](v4, "accessFileDescriptorWithBlock:", v42);
  if (!v44[5])
    goto LABEL_44;
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v44[5], MEMORY[0x1E0C9AA60], 4, 0);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (!v6)
  {
LABEL_26:

    PKLogFacilityTypeGetObject(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v53.st_dev = 134217984;
      *(_QWORD *)&v53.st_mode = v5;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKPassesXPCContainer: unarchived with %lu passes.", (uint8_t *)&v53, 0xCu);
    }

    goto LABEL_40;
  }
  v37 = *(_QWORD *)v39;
  *(_QWORD *)&v7 = 138412290;
  v32 = v7;
LABEL_7:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v39 != v37)
      objc_enumerationMutation(obj);
    v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v8);
    objc_msgSend(v9, "lastPathComponent", v32);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("pkpass")) & 1) == 0)
      goto LABEL_24;
    if (++v5 >= 0xB)
    {
      PKLogFacilityTypeGetObject(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      LOWORD(v53.st_dev) = 0;
      v24 = "PKPassesXPCContainer: too many .pkpass files found in archive.";
      v25 = v23;
      v26 = 2;
      goto LABEL_33;
    }
    v12 = objc_retainAutorelease(v9);
    v13 = open((const char *)objc_msgSend(v12, "fileSystemRepresentation"), 2097156);
    v14 = v13;
    if ((v13 & 0x80000000) != 0)
      break;
    memset(&v53, 0, sizeof(v53));
    if (fstat(v13, &v53))
    {
      PKLogFacilityTypeGetObject(0);
      v15 = (PKFileDescriptorXPCContainer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
      {
        v16 = __error();
        v17 = strerror(*v16);
        *(_DWORD *)buf = 138412546;
        v50 = v12;
        v51 = 2082;
        v52 = v17;
        p_super = &v15->super;
        v19 = "PKPassesXPCContainer: could not fstat pass %@ - %{public}s.";
        v20 = 22;
LABEL_21:
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, v19, buf, v20);
      }
    }
    else if ((v53.st_mode & 0xF000) == 0x8000)
    {
      v15 = -[PKFileDescriptorXPCContainer initWithFileDescriptor:]([PKFileDescriptorXPCContainer alloc], "initWithFileDescriptor:", v14);
      if (v15)
      {
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v15, v10);
        v21 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      v15 = (PKFileDescriptorXPCContainer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v32;
        v50 = v12;
        p_super = &v15->super;
        v19 = "PKPassesXPCContainer: %@ is not a pkpass file.";
        v20 = 12;
        goto LABEL_21;
      }
    }
    v21 = 1;
LABEL_23:

    close(v14);
    if ((v21 & 1) != 0)
      goto LABEL_35;
LABEL_24:

    if (v6 == ++v8)
    {
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
      if (v6)
        goto LABEL_7;
      goto LABEL_26;
    }
  }
  PKLogFacilityTypeGetObject(0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    goto LABEL_34;
  v27 = __error();
  v28 = strerror(*v27);
  v53.st_dev = 138412546;
  *(_QWORD *)&v53.st_mode = v12;
  WORD2(v53.st_ino) = 2082;
  *(__darwin_ino64_t *)((char *)&v53.st_ino + 6) = (__darwin_ino64_t)v28;
  v24 = "PKPassesXPCContainer: failed to open pass at %@ - %{public}s.";
  v25 = v23;
  v26 = 22;
LABEL_33:
  _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v53, v26);
LABEL_34:

LABEL_35:
  objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_29_0);

  if (self->_status)
  {
    v35 = 0;
    goto LABEL_40;
  }
  if (v5 >= 0xB)
  {
    v35 = 0;
    self->_status = 3;
    v29 = (NSDictionary *)objc_msgSend(0, "copy");
    goto LABEL_42;
  }
  v35 = 0;
  self->_status = 1;
LABEL_40:
  if (v5)
  {
    v29 = (NSDictionary *)objc_msgSend(v35, "copy");
LABEL_42:
    passFDs = self->_passFDs;
    self->_passFDs = v29;

  }
  objc_msgSend(v33, "removeItemAtURL:error:", v44[5], 0);

LABEL_44:
  _Block_object_dispose(&v43, 8);

  objc_autoreleasePoolPop(context);
  fd = self->_fd;
LABEL_45:
  -[PKFileDescriptorXPCContainer invalidate](fd, "invalidate");
  v31 = self->_fd;
  self->_fd = 0;

}

void __34__PKPassesXPCContainer__unarchive__block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  id v5;
  NSURL *v6;
  int *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  NSURL *v11;
  void *v12;
  stat v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  if (a2 < 0)
  {
    v9 = 1;
  }
  else
  {
    memset(&v13, 0, sizeof(v13));
    if (fstat(a2, &v13))
    {
      PKLogFacilityTypeGetObject(0);
      v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
      {
        v7 = __error();
        v8 = strerror(*v7);
        *(_DWORD *)buf = 136446210;
        v15 = (uint64_t)v8;
        _os_log_impl(&dword_18FC92000, &v6->super, OS_LOG_TYPE_DEFAULT, "PKPassesXPCContainer: could not fstat - %{public}s.", buf, 0xCu);
      }
      v9 = 1;
    }
    else if (v13.st_size < 0x9600001uLL)
    {
      if (v5)
      {
        PKTemporaryItemNameWithExtension(CFSTR("pkpasses"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v10, 1);
        v6 = (NSURL *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        PKTemporaryItemURLWithExtension(CFSTR("pkpasses"), 1);
        v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
        PKTemporaryItemPrepareDirectory();
      }
      if ((PKUnarchiverZip(a2, v6, 0xF00000uLL) & 1) != 0)
      {
        v11 = v6;
        v9 = 0;
        v12 = *(void **)(v4 + 40);
        *(_QWORD *)(v4 + 40) = v11;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeItemAtURL:error:", v6, 0);
        v9 = 1;
      }

    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v15 = 157286400;
        _os_log_impl(&dword_18FC92000, &v6->super, OS_LOG_TYPE_DEFAULT, "PKPassesXPCContainer: archive exceeds the size limit of %zu.", buf, 0xCu);
      }
      v9 = 2;
    }

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v9;
}

uint64_t __34__PKPassesXPCContainer__unarchive__block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (NSURL)temporaryOutputDirectory
{
  return self->_temporaryOutputDirectory;
}

- (void)setTemporaryOutputDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryOutputDirectory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryOutputDirectory, 0);
  objc_storeStrong((id *)&self->_passFDs, 0);
  objc_storeStrong((id *)&self->_fd, 0);
}

@end
