@implementation DiskImageParamsASIF_XPC

- (DiskImageParamsASIF_XPC)initWithBackendXPC:(id)a3 header:()unique_ptr<di_asif:(std::default_delete<di_asif::header>>)a4 :header
{
  DiskImageParamsASIF_XPC *v5;
  DiskImageParamsASIF_XPC *v6;
  header *v7;
  header *value;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DiskImageParamsASIF_XPC;
  v5 = -[DiskImageParamsXPC initWithBackendXPC:](&v10, "initWithBackendXPC:", a3);
  v6 = v5;
  if (v5)
  {
    v7 = *(header **)a4.__ptr_.__value_;
    *(_QWORD *)a4.__ptr_.__value_ = 0;
    value = v5->_header.__ptr_.__value_;
    v6->_header.__ptr_.__value_ = v7;
    if (value)
      operator delete();
  }
  return v6;
}

- (BOOL)isSparseFormat
{
  return 1;
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  void *v3;
  void *v4;
  unint64_t *v5;
  unint64_t v6;
  _DWORD *v7;
  __int128 v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  void *v12;
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  _DWORD *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  uint64_t *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  _QWORD v47[2];
  void *lpsrc[2];
  __int128 v49;
  uint64_t v50;
  std::__shared_weak_count *v51;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "backend");
  }
  else
  {
    lpsrc[0] = 0;
    lpsrc[1] = 0;
  }

  v47[0] = lpsrc[0];
  v47[1] = lpsrc[1];
  if (lpsrc[1])
  {
    v5 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  while (1)
  {
    if (lpsrc[0])
    {
      if (v7)
        break;
    }
    sub_100027CB4(v47, (uint64_t *)lpsrc);
    sub_10011EB40((uint64_t)lpsrc, &v49);
    v8 = v49;
    v49 = 0uLL;
    v9 = (std::__shared_weak_count *)lpsrc[1];
    *(_OWORD *)lpsrc = v8;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v12 = lpsrc[0];
    v13 = (void *)v47[0];
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v49 + 1);
    if (*((_QWORD *)&v49 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v49 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    if (v12 == v13)
      goto LABEL_20;
  }
  v19 = v7;
  v20 = (std::__shared_weak_count *)lpsrc[1];
  *(_QWORD *)&v49 = v7;
  *((void **)&v49 + 1) = lpsrc[1];
  if (lpsrc[1])
  {
    v21 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  v50 = 0x200000001;
  sub_100092A58((uint64_t)"header_ignore_fields_t", 2, (int *)&v50, 2);
  v19[48] = 2;
  if (v20)
  {
    v23 = (unint64_t *)&v20->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
LABEL_20:
  if (self->_header.__ptr_.__value_)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "backend");
    }
    else
    {
      v45 = 0;
      v46 = 0;
    }
    sub_10011E808((uint64_t)&v45, &v50);
    if (v50
    {
      *(_QWORD *)&v49 = v26;
      *((_QWORD *)&v49 + 1) = v51;
      v27 = &v50;
    }
    else
    {
      v27 = (uint64_t *)&v49;
    }
    *v27 = 0;
    v27[1] = 0;
    v28 = v51;
    if (v51)
    {
      v29 = (unint64_t *)&v51->__shared_owners_;
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    v31 = v46;
    if (v46)
    {
      v32 = (unint64_t *)&v46->__shared_owners_;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }

    v34 = v49;
    if ((_QWORD)v49)
    {
      sub_1001022CC(*(_QWORD *)(v49 + 40));
      atomic_store(*(_QWORD *)(*(_QWORD *)(v34 + 40) + 16), (unint64_t *)(*(_QWORD *)(v34 + 40) + 64));
    }
    v35 = (std::__shared_weak_count *)*((_QWORD *)&v49 + 1);
    if (*((_QWORD *)&v49 + 1))
    {
      v36 = (unint64_t *)(*((_QWORD *)&v49 + 1) + 8);
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
    objc_msgSend(v38, "backend");
    v39 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v49 + 40))(v49);
    v40 = (std::__shared_weak_count *)*((_QWORD *)&v49 + 1);
    if (*((_QWORD *)&v49 + 1))
    {
      v41 = (unint64_t *)(*((_QWORD *)&v49 + 1) + 8);
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }

    if (v39)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
      if (v43)
        objc_msgSend(v43, "backend");
      else
        v49 = 0uLL;
      operator new();
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
    if (v44)
      objc_msgSend(v44, "backend");
    else
      v49 = 0uLL;
    operator new();
  }
  -[DiskImageParamsXPC blockSize](self, "blockSize");
  -[DiskImageParamsXPC blockSize](self, "blockSize");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  if (v25)
  {
    objc_msgSend(v25, "backend");
  }
  else
  {
    v45 = 0;
    v46 = 0;
  }
  operator new();
}

- (int)setSizeWithDiskImage:(const void *)a3 newSize:(unint64_t)a4
{
  int v5;
  objc_super *v6;
  objc_super v7;
  objc_super v9[3];
  _BYTE v10[22];

  v9[0].receiver = self;
  v9[0].super_class = (Class)DiskImageParamsASIF_XPC;
  v5 = -[objc_super setSizeWithDiskImage:newSize:](v9, "setSizeWithDiskImage:newSize:", a3, a4);
  if (!v5)
  {
    v6 = *(objc_super **)a3;
    v7 = *(objc_super *)(*(_QWORD *)a3 + 64);
    v9[1] = *(objc_super *)(*(_QWORD *)a3 + 48);
    v9[2] = v7;
    *(objc_super *)v10 = v6[5];
    *(_QWORD *)&v10[14] = *(Class *)((char *)&v6[5].super_class + 6);
    operator new();
  }
  return v5;
}

- (unint64_t)numBlocks
{
  return *((_QWORD *)self->_header.__ptr_.__value_ + 6);
}

- (BOOL)isWritableFormat
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsASIF_XPC)initWithCoder:(id)a3
{
  id v4;
  DiskImageParamsASIF_XPC *v5;
  void *exception;
  _QWORD v8[33];
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DiskImageParamsASIF_XPC;
  v5 = -[DiskImageParamsXPC initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5 && objc_msgSend(v4, "containsValueForKey:", CFSTR("sparseHeader")))
  {
    v9 = 0;
    if (objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("sparseHeader"), &v9))
    {
      if (v9 == 80)
        operator new();
    }
    exception = __cxa_allocate_exception(0x40uLL);
    sub_100005920((uint64_t)v8);
    sub_100005A0C(v8, (uint64_t)"Unexpected ASIF header length (", 31);
    std::ostream::operator<<(v8, v9);
    sub_100005A0C(v8, (uint64_t)")", 1);
    sub_100012294((uint64_t)exception, (uint64_t)v8, 0x9Au);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  header *value;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DiskImageParamsASIF_XPC;
  -[DiskImageParamsXPC encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  value = self->_header.__ptr_.__value_;
  if (value)
    objc_msgSend(v4, "encodeBytes:length:forKey:", value, 80, CFSTR("sparseHeader"));

}

- (id)instanceID
{
  NSUUID *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  NSUUID *v9;
  objc_super v10;
  objc_super v11;
  _QWORD v12[2];
  char v13[528];

  if (self->_header.__ptr_.__value_)
  {
    bzero(v13, 0x210uLL);
    v10.receiver = self;
    v10.super_class = (Class)DiskImageParamsASIF_XPC;
    v3 = -[DiskImageParamsXPC instanceID](&v10, "instanceID");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v4, "getUUIDBytes:", v13);
    v5 = objc_alloc((Class)NSUUID);
    v12[0] = sub_100120674(v13, 528);
    v12[1] = v6;
    v7 = objc_msgSend(v5, "initWithUUIDBytes:", v12);

    return v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)DiskImageParamsASIF_XPC;
    v9 = -[DiskImageParamsXPC instanceID](&v11, "instanceID");
    return (id)objc_claimAutoreleasedReturnValue(v9);
  }
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
