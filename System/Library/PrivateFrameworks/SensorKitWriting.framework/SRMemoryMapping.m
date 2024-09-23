@implementation SRMemoryMapping

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SRLogMemoryMapping = (uint64_t)os_log_create("com.apple.SensorKit", "SRMemoryMapping");
}

- (id)initWithSize:(int)a3 protection:(int)a4 advice:(uint64_t)a5 offset:
{
  objc_super v9;

  if (result)
  {
    v9.receiver = result;
    v9.super_class = (Class)SRMemoryMapping;
    result = objc_msgSendSuper2(&v9, sel_init);
    if (result)
    {
      *((_QWORD *)result + 6) = a2;
      *((_DWORD *)result + 2) = a3;
      *((_DWORD *)result + 3) = a4;
      *((_QWORD *)result + 4) = a5;
    }
  }
  return result;
}

- (void)dealloc
{
  void *mappedAddress;
  NSObject *v4;
  size_t pageAlignedSize;
  NSObject *v6;
  int v7;
  int v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  size_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    mappedAddress = self->_mappedAddress;
    if ((unint64_t)mappedAddress + 1 >= 2)
    {
      v4 = SRLogMemoryMapping;
      if (os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v11 = mappedAddress;
        _os_log_impl(&dword_245CD7000, v4, OS_LOG_TYPE_INFO, "Unmapping %{public}p", buf, 0xCu);
      }
      pageAlignedSize = self->_pageAlignedSize;
      if (munmap(mappedAddress, pageAlignedSize))
      {
        v6 = SRLogMemoryMapping;
        if (os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_INFO))
        {
          v7 = *__error();
          *(_DWORD *)buf = 134349568;
          v11 = mappedAddress;
          v12 = 2048;
          v13 = pageAlignedSize;
          v14 = 1026;
          v15 = v7;
          _os_log_impl(&dword_245CD7000, v6, OS_LOG_TYPE_INFO, "Unable to unmap %{public}p size %zu because %{public, darwin.errno}d", buf, 0x1Cu);
          v6 = SRLogMemoryMapping;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          v8 = *__error();
          *(_DWORD *)buf = 134349568;
          v11 = mappedAddress;
          v12 = 2048;
          v13 = pageAlignedSize;
          v14 = 1026;
          v15 = v8;
          _os_log_fault_impl(&dword_245CD7000, v6, OS_LOG_TYPE_FAULT, "Unable to unmap %{public}p size %zu because %{public, darwin.errno}d", buf, 0x1Cu);
        }
        abort();
      }
      self->_mappedAddress = 0;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)SRMemoryMapping;
  -[SRMemoryMapping dealloc](&v9, sel_dealloc);
}

- (uint64_t)mapWithFileHandle:(uint64_t)result
{
  uint64_t v3;
  NSUInteger v4;
  off_t v5;
  NSUInteger v6;
  size_t v7;
  char *v8;
  char *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 32);
    v5 = NSRoundDownToMultipleOfPageSize(v4);
    v6 = v4 - v5;
    v7 = NSRoundUpToMultipleOfPageSize(*(_QWORD *)(v3 + 48) + v4 - v5);
    v8 = (char *)mmap(0, v7, *(_DWORD *)(v3 + 8), 1, objc_msgSend(a2, "fileDescriptor"), v5);
    if (v8 == (char *)-1)
    {
      v12 = SRLogMemoryMapping;
      result = os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_FAULT);
      if ((_DWORD)result)
      {
        v13 = *__error();
        v15 = 138543618;
        v16 = a2;
        v17 = 1026;
        v18 = v13;
        _os_log_fault_impl(&dword_245CD7000, v12, OS_LOG_TYPE_FAULT, "Unable to mmap storage file %{public}@ because %{public, darwin.errno}d", (uint8_t *)&v15, 0x12u);
        return 0;
      }
    }
    else
    {
      *(_QWORD *)(v3 + 56) = v7;
      *(_QWORD *)(v3 + 40) = v8;
      v9 = &v8[v6];
      *(_QWORD *)(v3 + 16) = &v8[v6];
      v10 = *(_DWORD *)(v3 + 12);
      if (v10 != 2)
        v9 += *(_QWORD *)(v3 + 48);
      *(_QWORD *)(v3 + 24) = v9;
      if (madvise(v8, v7, v10) < 0)
      {
        v11 = SRLogMemoryMapping;
        if (os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_FAULT))
        {
          v14 = *__error();
          v15 = 67240192;
          LODWORD(v16) = v14;
          _os_log_fault_impl(&dword_245CD7000, v11, OS_LOG_TYPE_FAULT, "Failed to madvise() because %{public, darwin.errno}d", (uint8_t *)&v15, 8u);
        }
      }
      return 1;
    }
  }
  return result;
}

- (void)sync
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *(void **)(a1 + 40);
    if ((unint64_t)v2 + 1 >= 2)
    {
      v5 = a1 + 16;
      v3 = *(_QWORD *)(a1 + 16);
      v4 = *(_QWORD *)(v5 + 8);
      if (v4 != v3)
      {
        if (msync(v2, v4 - v3, 16))
        {
          v6 = SRLogMemoryMapping;
          if (os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_ERROR))
          {
            v7 = *__error();
            v8[0] = 67240192;
            v8[1] = v7;
            _os_log_error_impl(&dword_245CD7000, v6, OS_LOG_TYPE_ERROR, "Failed to msync because %{public, darwin.errno}d", (uint8_t *)v8, 8u);
          }
        }
      }
    }
  }
}

- (BOOL)isValidWriteToDestinationAddress:(uint64_t)a3 withLength:(uint64_t)a4 bytes:
{
  uint64_t v4;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v4 = result;
    result = 0;
    if (a4)
    {
      if ((*(_DWORD *)(v4 + 8) & 2) != 0)
      {
        if ((unint64_t)(*(_QWORD *)(v4 + 40) + 1) < 2)
          return 0;
        v6 = *(_QWORD *)(v4 + 24);
        if (__CFADD__(v6, a3))
        {
          v7 = SRLogMemoryMapping;
          result = os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_ERROR);
          if (result)
          {
            v10 = 134349056;
            v11 = a3;
            _os_log_error_impl(&dword_245CD7000, v7, OS_LOG_TYPE_ERROR, "%{public}zu is too large to write", (uint8_t *)&v10, 0xCu);
            return 0;
          }
        }
        else
        {
          v8 = *(_QWORD *)(v4 + 16);
          return v6 >= a2 && v8 <= a2;
        }
      }
    }
  }
  return result;
}

- (void)writeBytes:(uint64_t)a3 toOffset:(size_t)a4 length:
{
  void *v6;

  if (result)
  {
    v6 = (void *)(*((_QWORD *)result + 2) + a3);
    result = (void *)-[SRMemoryMapping isValidWriteToDestinationAddress:withLength:bytes:]((_BOOL8)result, (unint64_t)v6, a4, (uint64_t)a2);
    if ((_DWORD)result)
      return memcpy(v6, a2, a4);
  }
  return result;
}

- (void)appendBytes:(size_t)a3 length:
{
  char *v6;
  size_t v7;
  NSObject *v8;
  int v9;
  size_t v10;
  __int16 v11;
  size_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v6 = (char *)a1[3];
    if (-[SRMemoryMapping isValidWriteToDestinationAddress:withLength:bytes:]((_BOOL8)a1, (unint64_t)v6, a3, (uint64_t)a2))
    {
      v7 = a1[6] - a1[3] + a1[2];
      if (v7 >= a3)
      {
        a1[3] = &v6[a3];
        memcpy(v6, a2, a3);
      }
      else
      {
        v8 = SRLogMemoryMapping;
        if (os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_INFO))
        {
          v9 = 134349312;
          v10 = a3;
          v11 = 2050;
          v12 = v7;
          _os_log_impl(&dword_245CD7000, v8, OS_LOG_TYPE_INFO, "More bytes requested %{public}zu than the capacity %{public}zu. Client should call -freeSpace: to avoid this", (uint8_t *)&v9, 0x16u);
        }
      }
    }
  }
}

@end
