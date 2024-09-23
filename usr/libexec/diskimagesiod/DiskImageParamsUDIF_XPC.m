@implementation DiskImageParamsUDIF_XPC

- (DiskImageParamsUDIF_XPC)initWithBackendXPC:(id)a3 header:()unique_ptr<udif:(std::default_delete<udif::header>>)a4 :header
{
  DiskImageParamsUDIF_XPC *v5;
  DiskImageParamsUDIF_XPC *v6;
  uint64_t v7;
  header *value;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DiskImageParamsUDIF_XPC;
  v5 = -[DiskImageParamsXPC initWithBackendXPC:](&v11, "initWithBackendXPC:", a3);
  v6 = v5;
  if (v5)
  {
    v7 = *(_QWORD *)a4.__ptr_.__value_;
    *(_QWORD *)a4.__ptr_.__value_ = 0;
    value = v5->_header.__ptr_.__value_;
    v6->_header.__ptr_.__value_ = (header *)v7;
    if (value)
      operator delete();
    if (!*(_QWORD *)(v7 + 492))
    {
      -[DiskImageParamsUDIF_XPC createSinkDiskImage](v6, "createSinkDiskImage");
      *(_QWORD *)((char *)v6->_header.__ptr_.__value_ + 492) = (*(uint64_t (**)())(*(_QWORD *)v10 + 32))();
      if (v10)
        (*(void (**)())(*(_QWORD *)v10 + 16))();
    }
  }
  return v6;
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  __int128 v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  __int128 v14;
  unint64_t v15;
  __int128 v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "backend");
  else
    v16 = 0uLL;

  if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)v16 + 48))(v16))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
    v6 = objc_msgSend(v5, "isUnlocked");

    if (v6)
    {
      v15 = -[DiskImageParamsUDIF_XPC blockSize](self, "blockSize");
      sub_100093BF4((uint64_t)&v16, &v15, &v14);
      v7 = v14;
      v14 = 0uLL;
      v8 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
      v16 = v7;
      if (v8)
      {
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v10 = __ldaxr(p_shared_owners);
        while (__stlxr(v10 - 1, p_shared_owners));
        if (!v10)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
      v11 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
      if (*((_QWORD *)&v14 + 1))
      {
        v12 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
    }
  }
  operator new();
}

- (unint64_t)numBlocks
{
  return *(_QWORD *)((char *)self->_header.__ptr_.__value_ + 492);
}

- (unint64_t)blockSize
{
  return 512;
}

- (BOOL)isWritableFormat
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsUDIF_XPC)initWithCoder:(id)a3
{
  id v4;
  void *exception;
  _QWORD v7[33];
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DiskImageParamsUDIF_XPC;
  if (-[DiskImageParamsXPC initWithCoder:](&v9, "initWithCoder:", v4))
  {
    v8 = 0;
    if (objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("udifHeader"), &v8))
    {
      if (v8 == 500)
        operator new();
    }
    exception = __cxa_allocate_exception(0x40uLL);
    sub_100005920((uint64_t)v7);
    sub_100005A0C(v7, (uint64_t)"Unexpected UDIF header length (", 31);
    std::ostream::operator<<(v7, v8);
    sub_100005A0C(v7, (uint64_t)")", 1);
    sub_100012294((uint64_t)exception, (uint64_t)v7, 0x9Au);
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DiskImageParamsUDIF_XPC;
  -[DiskImageParamsXPC encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_header.__ptr_.__value_, 500, CFSTR("udifHeader"));

}

- (id)instanceID
{
  NSUUID *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  objc_super v9;
  _QWORD v10[2];
  char v11[16];
  uint64_t v12;

  bzero(v11, 0x210uLL);
  v9.receiver = self;
  v9.super_class = (Class)DiskImageParamsUDIF_XPC;
  v3 = -[DiskImageParamsXPC instanceID](&v9, "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "getUUIDBytes:", v11);
  sub_1000F2114((uint64_t)self->_header.__ptr_.__value_, (uint64_t)&v12);
  v5 = objc_alloc((Class)NSUUID);
  v10[0] = sub_100120674(v11, 528);
  v10[1] = v6;
  v7 = objc_msgSend(v5, "initWithUUIDBytes:", v10);

  return v7;
}

- (void).cxx_destruct
{
  header *value;

  value = self->_header.__ptr_.__value_;
  self->_header.__ptr_.__value_ = 0;
  if (value)
    operator delete();
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
