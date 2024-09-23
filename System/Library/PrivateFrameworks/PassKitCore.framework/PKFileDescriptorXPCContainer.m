@implementation PKFileDescriptorXPCContainer

- (PKFileDescriptorXPCContainer)init
{

  return 0;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKFileDescriptorXPCContainer;
  result = -[PKFileDescriptorXPCContainer init](&v3, sel_init);
  if (result)
  {
    *((_DWORD *)result + 3) = 0;
    *((_DWORD *)result + 4) = 0;
  }
  return result;
}

- (id)_initWithXPCFileDescriptor:(id)a3
{
  id v5;
  id *v6;
  id *v7;

  v5 = a3;
  v6 = -[PKFileDescriptorXPCContainer _init](self, "_init");
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 3, a3);

  return v7;
}

- (PKFileDescriptorXPCContainer)initWithFileURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  xpc_object_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int *v13;
  char *v14;
  PKFileDescriptorXPCContainer *v15;
  int v17;
  id v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "isFileURL") & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKFileDescriptorXPCContainer: cannot handle non-file URL %@.", (uint8_t *)&v17, 0xCu);
    }

    goto LABEL_12;
  }
  v6 = objc_retainAutorelease(v5);
  v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 4);
  if (v7 < 0)
  {
    PKLogFacilityTypeGetObject(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = __error();
      v14 = strerror(*v13);
      v17 = 138412546;
      v18 = v6;
      v19 = 2082;
      v20 = v14;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKFileDescriptorXPCContainer: failed to open file %@ - %{public}s.", (uint8_t *)&v17, 0x16u);
    }

    goto LABEL_12;
  }
  v8 = v7;
  v9 = xpc_fd_create(v7);
  if (v9)
  {
    v10 = -[PKFileDescriptorXPCContainer _initWithXPCFileDescriptor:](self, "_initWithXPCFileDescriptor:", v9);
  }
  else
  {

    v10 = 0;
  }
  close(v8);
  self = (PKFileDescriptorXPCContainer *)v10;

  v15 = self;
LABEL_13:

  return v15;
}

- (PKFileDescriptorXPCContainer)initWithFileDescriptor:(int)a3
{
  xpc_object_t v4;
  PKFileDescriptorXPCContainer *v5;

  if (a3 < 0)
  {
    v5 = 0;
  }
  else
  {
    v4 = xpc_fd_create(a3);
    if (v4)
    {
      self = (PKFileDescriptorXPCContainer *)-[PKFileDescriptorXPCContainer _initWithXPCFileDescriptor:](self, "_initWithXPCFileDescriptor:", v4);
      v5 = self;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFileDescriptorXPCContainer)initWithCoder:(id)a3
{
  void *v4;
  PKFileDescriptorXPCContainer *v5;

  objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81318], CFSTR("fd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKFileDescriptorXPCContainer _initWithXPCFileDescriptor:](self, "_initWithXPCFileDescriptor:", v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_readLock;
  OS_xpc_object *v5;
  id v6;

  p_readLock = &self->_readLock;
  v6 = a3;
  os_unfair_lock_lock(p_readLock);
  v5 = self->_fd;
  os_unfair_lock_unlock(p_readLock);
  objc_msgSend(v6, "encodeXPCObject:forKey:", v5, CFSTR("fd"));

}

- (void)accessFileDescriptorWithBlock:(id)a3
{
  os_unfair_lock_s *p_writeLock;
  os_unfair_lock_s *p_readLock;
  OS_xpc_object *fd;
  uint64_t v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a3;
  if (v8)
  {
    p_writeLock = &self->_writeLock;
    os_unfair_lock_lock(&self->_writeLock);
    p_readLock = &self->_readLock;
    os_unfair_lock_lock(&self->_readLock);
    fd = self->_fd;
    if (fd)
      v7 = xpc_fd_dup(fd);
    else
      v7 = 0xFFFFFFFFLL;
    os_unfair_lock_unlock(p_readLock);
    v8[2](v8, v7);
    os_unfair_lock_unlock(p_writeLock);
    if ((v7 & 0x80000000) == 0)
      close(v7);
  }

}

- (BOOL)isInvalidated
{
  PKFileDescriptorXPCContainer *v2;
  os_unfair_lock_s *p_readLock;

  v2 = self;
  p_readLock = &self->_readLock;
  os_unfair_lock_lock(&self->_readLock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_readLock);
  return (char)v2;
}

- (void)invalidate
{
  os_unfair_lock_s *p_readLock;
  OS_xpc_object *fd;

  p_readLock = &self->_readLock;
  os_unfair_lock_lock(&self->_readLock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    fd = self->_fd;
    self->_fd = 0;

  }
  os_unfair_lock_unlock(p_readLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fd, 0);
}

@end
