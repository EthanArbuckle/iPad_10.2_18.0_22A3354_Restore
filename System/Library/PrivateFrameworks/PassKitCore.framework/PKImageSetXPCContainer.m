@implementation PKImageSetXPCContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSetHash, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t length;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  length = self->_length;
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("length"));

  objc_msgSend(v8, "encodeBool:forKey:", self->_isShmem, CFSTR("isShmem"));
  objc_msgSend(v8, "encodeXPCObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_offset);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("offset"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_imageSetHash, CFSTR("imageSetHash"));
}

- (NSData)imageSetHash
{
  return self->_imageSetHash;
}

- (void)invalidate
{
  OS_xpc_object *data;
  NSData *imageSetHash;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    data = self->_data;
    if (data)
    {
      self->_length = 0;
      self->_offset = 0;
      self->_data = 0;

    }
    imageSetHash = self->_imageSetHash;
    if (imageSetHash)
    {
      self->_imageSetHash = 0;

    }
    self->_isShmem = 0;
  }
}

- (id)consumeImageSet
{
  OS_xpc_object *v3;
  _BOOL4 isShmem;
  unint64_t length;
  OS_xpc_object *data;
  unint64_t offset;
  void *v8;
  unint64_t v9;
  void *bytes_ptr;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  id v22;
  id v23;
  _QWORD v24[6];
  BOOL v25;
  void *region;
  uint8_t buf[4];
  PKImageSetXPCContainer *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = self->_data;
  if (!v3)
    goto LABEL_25;
  isShmem = self->_isShmem;
  length = self->_length;
  self->_length = 0;
  offset = self->_offset;
  data = self->_data;
  self->_offset = 0;
  self->_data = 0;

  v8 = 0;
  if (length >= offset)
  {
    region = 0;
    if (isShmem)
    {
      v9 = xpc_shmem_map(v3, &region);
      bytes_ptr = region;
      if (!region)
        goto LABEL_25;
    }
    else
    {
      bytes_ptr = (void *)xpc_data_get_bytes_ptr(v3);
      region = bytes_ptr;
      v9 = xpc_data_get_length(v3);
      if (!bytes_ptr)
      {
LABEL_25:
        v8 = 0;
        goto LABEL_26;
      }
    }
    if (length - 1 >= v9 || length <= offset)
    {
      if (isShmem && munmap(bytes_ptr, v9))
      {
        PKLogFacilityTypeGetObject(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_18FC92000, v20, OS_LOG_TYPE_FAULT, "Failed to unmap file! Leaking mapping...", buf, 2u);
        }

        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Failed to unmap file! Leaking mapping...", buf, 2u);
        }

      }
      goto LABEL_25;
    }
    v11 = (void *)MEMORY[0x19400CFE8]();
    v12 = objc_alloc(MEMORY[0x1E0C99D50]);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __41__PKImageSetXPCContainer_consumeImageSet__block_invoke;
    v24[3] = &__block_descriptor_49_e12_v24__0_v8Q16l;
    v25 = isShmem;
    v24[4] = region;
    v24[5] = v9;
    v13 = (void *)objc_msgSend(v12, "initWithBytesNoCopy:length:deallocator:", (char *)region + offset, length - offset, v24);
    v23 = 0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v13, &v23);
    v15 = v23;
    v16 = v15;
    v8 = 0;
    if (v14 && !v15)
    {
      v17 = objc_opt_class();
      v18 = *MEMORY[0x1E0CB2CD0];
      v22 = 0;
      objc_msgSend(v14, "decodeTopLevelObjectOfClass:forKey:error:", v17, v18, &v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v22;
    }
    objc_msgSend(v14, "finishDecoding");
    if (!v8 || v16)
    {
      PKLogFacilityTypeGetObject(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v28 = self;
        v29 = 2112;
        v30 = v16;
        _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "PKImageSetXPCContainer (%p): failed to extract wrapped image set. %@.", buf, 0x16u);
      }

    }
    objc_autoreleasePoolPop(v11);
  }
LABEL_26:

  return v8;
}

- (PKImageSetXPCContainer)initWithWithXPCObject:(id)a3 hash:(id)a4
{
  id v6;
  id v7;
  size_t length;
  PKImageSetXPCContainer *v9;

  v6 = a3;
  v7 = a4;
  if (v6)
    length = xpc_data_get_length(v6);
  else
    length = 0;
  v9 = -[PKImageSetXPCContainer initWithWithXPCObject:length:isSharedMemory:offset:hash:](self, "initWithWithXPCObject:length:isSharedMemory:offset:hash:", v6, length, 0, 0, v7);

  return v9;
}

- (PKImageSetXPCContainer)initWithWithXPCObject:(id)a3 length:(unint64_t)a4 isSharedMemory:(BOOL)a5 offset:(unint64_t)a6 hash:(id)a7
{
  id v13;
  id v14;
  PKImageSetXPCContainer *v15;
  PKImageSetXPCContainer *v16;
  uint64_t v17;
  NSData *imageSetHash;
  objc_super v20;

  v13 = a3;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PKImageSetXPCContainer;
  v15 = -[PKImageSetXPCContainer init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_length = a4;
    v15->_isShmem = a5;
    if (v13)
      objc_storeStrong((id *)&v15->_data, a3);
    v16->_offset = a6;
    v17 = objc_msgSend(v14, "copy");
    imageSetHash = v16->_imageSetHash;
    v16->_imageSetHash = (NSData *)v17;

  }
  return v16;
}

- (PKImageSetXPCContainer)initWithCoder:(id)a3
{
  id v4;
  PKImageSetXPCContainer *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  OS_xpc_object *data;
  void *v12;
  uint64_t v13;
  NSData *imageSetHash;
  OS_xpc_object *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKImageSetXPCContainer;
  v5 = -[PKImageSetXPCContainer init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_length = objc_msgSend(v7, "unsignedIntegerValue");

    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isShmem"));
    v5->_isShmem = v8;
    if (v8)
      v9 = MEMORY[0x1E0C81388];
    else
      v9 = MEMORY[0x1E0C812E8];
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", v9, CFSTR("data"));
    v10 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (OS_xpc_object *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_offset = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageSetHash"));
    v13 = objc_claimAutoreleasedReturnValue();
    imageSetHash = v5->_imageSetHash;
    v5->_imageSetHash = (NSData *)v13;

    if (v5->_offset > v5->_length)
    {
      v15 = v5->_data;
      v5->_offset = 0;
      v5->_data = 0;
      v5->_length = 0;

    }
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

void __41__PKImageSetXPCContainer_consumeImageSet__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];
  uint8_t buf[16];

  if (*(_BYTE *)(a1 + 48) && munmap(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40)))
  {
    PKLogFacilityTypeGetObject(0);
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18FC92000, v1, OS_LOG_TYPE_FAULT, "Failed to unmap file! Leaking mapping...", buf, 2u);
    }

    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_18FC92000, v1, OS_LOG_TYPE_DEFAULT, "Failed to unmap file! Leaking mapping...", v2, 2u);
    }

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKImageSetXPCContainer)init
{
  return -[PKImageSetXPCContainer initWithWithXPCObject:hash:](self, "initWithWithXPCObject:hash:", 0, 0);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

@end
