@implementation DiskImageParamsRaw_XPC

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void **p_lpsrc;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void **v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  void *lpsrc;
  std::__shared_weak_count *v32;
  _QWORD *v33;
  std::__shared_weak_count *v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "backend");
  }
  else
  {
    v29 = 0;
    v30 = 0;
  }
  sub_10011E808((uint64_t)&v29, &lpsrc);
  if (lpsrc
  {
    v33 = v5;
    v34 = v32;
    p_lpsrc = &lpsrc;
  }
  else
  {
    p_lpsrc = (void **)&v33;
  }
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v7 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = v30;
  if (v30)
  {
    v11 = (unint64_t *)&v30->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  if (v33)
  {
    -[DiskImageParamsXPC setBlockSize:](self, "setBlockSize:", *(_QWORD *)(v33[3] + 64));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
    if (v13)
    {
      objc_msgSend(v13, "backend");
    }
    else
    {
      lpsrc = 0;
      v32 = 0;
    }
    -[DiskImageParamsXPC blockSize](self, "blockSize", v29);
    operator new();
  }
  v14 = v34;
  if (v34)
  {
    v15 = (unint64_t *)&v34->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC", v29));
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "backend");
    if (lpsrc)
    {
      if (v19)
      {
        v33 = v19;
        v34 = v32;
        v20 = &lpsrc;
LABEL_34:
        *v20 = 0;
        v20[1] = 0;
        v21 = v32;
        if (v32)
        {
          v22 = (unint64_t *)&v32->__shared_owners_;
          do
            v23 = __ldaxr(v22);
          while (__stlxr(v23 - 1, v22));
          if (!v23)
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }

        v24 = (uint64_t)v33;
        if (v33)
        {
          sub_1000FFAE0((uint64_t)v33);
          sub_1000ED4E4((AEAContext_impl **)(*(_QWORD *)(v24 + 56) + 8));
          operator new();
        }
        v25 = v34;
        if (v34)
        {
          v26 = (unint64_t *)&v34->__shared_owners_;
          do
            v27 = __ldaxr(v26);
          while (__stlxr(v27 - 1, v26));
          if (!v27)
          {
            ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
            std::__shared_weak_count::__release_weak(v25);
          }
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
        if (v28)
        {
          objc_msgSend(v28, "backend");
        }
        else
        {
          v33 = 0;
          v34 = 0;
        }
        -[DiskImageParamsXPC blockSize](self, "blockSize");
        operator new();
      }
    }
  }
  else
  {
    lpsrc = 0;
    v32 = 0;
  }
  v20 = (void **)&v33;
  goto LABEL_34;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isWritableFormat
{
  void *v2;
  void *v3;
  void *v4;
  void **p_lpsrc;
  std::__shared_weak_count *v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  void *lpsrc;
  std::__shared_weak_count *v20;
  void *v21;
  std::__shared_weak_count *v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "backend");
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  sub_10011E808((uint64_t)&v17, &lpsrc);
  if (lpsrc
  {
    v21 = v4;
    v22 = v20;
    p_lpsrc = &lpsrc;
  }
  else
  {
    p_lpsrc = &v21;
  }
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v7 = v21;
  v6 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v10 = v20;
  if (v20)
  {
    v11 = (unint64_t *)&v20->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = v18;
  if (v18)
  {
    v14 = (unint64_t *)&v18->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  return v7 == 0;
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

@end
