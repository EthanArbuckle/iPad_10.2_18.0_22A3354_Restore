@implementation PLXPCShMemData

- (PLXPCShMemData)initWithXPCShmem:(id)a3
{
  id v4;
  PLXPCShMemData *v5;
  PLXPCShMemData *v6;
  size_t v7;
  PLXPCShMemData *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLXPCShMemData;
  v5 = -[PLXPCShMemData init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    if (!v4 || (v7 = xpc_shmem_map(v4, &v5->_buffer), (v6->_bufferLength = v7) == 0))
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6->_dataLength = v7;
  }
  v8 = v6;
LABEL_7:

  return v8;
}

- (PLXPCShMemData)initWithXPCShmem:(id)a3 length:(int64_t)a4
{
  PLXPCShMemData *result;

  result = -[PLXPCShMemData initWithXPCShmem:](self, "initWithXPCShmem:", a3);
  if (result)
    result->_dataLength = a4;
  return result;
}

- (void)dealloc
{
  size_t bufferLength;
  NSObject *v4;
  int *v5;
  char *v6;
  objc_super v7;
  uint8_t buf[4];
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  bufferLength = self->_bufferLength;
  if (bufferLength && munmap(self->_buffer, bufferLength))
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = __error();
      v6 = strerror(*v5);
      *(_DWORD *)buf = 136315138;
      v9 = v6;
      _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "munmap(2) failed. (%s)", buf, 0xCu);
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)PLXPCShMemData;
  -[PLXPCShMemData dealloc](&v7, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> bufferLength=%lu dataLength=%lu"), objc_opt_class(), self, self->_bufferLength, self->_dataLength);
}

- (const)bytes
{
  return self->_buffer;
}

- (unint64_t)length
{
  return self->_dataLength;
}

@end
