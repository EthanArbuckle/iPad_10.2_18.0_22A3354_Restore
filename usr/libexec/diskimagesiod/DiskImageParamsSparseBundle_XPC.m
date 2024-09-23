@implementation DiskImageParamsSparseBundle_XPC

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  void *v3;
  __int128 v4;
  __int128 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  if (v3)
  {
    objc_msgSend(v3, "backend");
    v4 = v5;
  }
  else
  {
    v4 = 0uLL;
  }
  -[DiskImageParamsXPC blockSize](self, "blockSize", 0, 0, v4);
  operator new();
}

- (BOOL)isWritableFormat
{
  return 1;
}

- (unint64_t)numBlocks
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  objc_msgSend(v3, "backend");
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 40))(v10);
  v5 = -[DiskImageParamsXPC blockSize](self, "blockSize");
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  return v4 / v5;
}

- (BOOL)isSparseFormat
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
