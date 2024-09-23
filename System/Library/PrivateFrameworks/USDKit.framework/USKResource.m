@implementation USKResource

+ (id)resourceWithURL:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  USKResource *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *__p[2];
  char v17;

  v3 = a3;
  sub_2263F8F84();
  if ((objc_msgSend_checkResourceIsReachableAndReturnError_(v3, v4, 0, v5) & 1) != 0)
  {
    v9 = objc_alloc_init(USKResource);
    if (v9)
    {
      objc_msgSend_path(v3, v6, v7, v8);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = (char *)objc_msgSend_UTF8String(v10, v11, v12, v13);
      sub_2263AE2A8(__p, v14);
      sub_2263AD96C(v9, (char *)__p);
      if (v17 < 0)
        operator delete(__p[0]);

    }
  }
  else
  {
    NSLog(CFSTR("Warning: Unable to find resource with URL: %@"), v3);
    v9 = 0;
  }

  return v9;
}

+ (id)resourceWithUSKScene:(id)a3 path:(id)a4
{
  id v5;
  id v6;
  pxrInternal__aapl__pxrReserved__ *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  pxrInternal__aapl__pxrReserved__::UsdStage *v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  USKResource *v21;
  void *__p[2];
  uint64_t v24;
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v5 = a3;
  v6 = a4;
  sub_2263F8F84();
  pxrInternal__aapl__pxrReserved__::ArGetResolver(v7);
  v29 = 0uLL;
  v30 = 0;
  v8 = objc_retainAutorelease(v6);
  v12 = (char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
  sub_2263AE2A8(&v29, v12);
  if (pxrInternal__aapl__pxrReserved__::TfIsRelativePath())
  {
    if (v5)
      objc_msgSend_usdStage(v5, v13, v14, v15);
    else
      v25 = 0;
    v16 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&v25);
    pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(v16);
    pxrInternal__aapl__pxrReserved__::SdfComputeAssetPathRelativeToLayer();
    if (SHIBYTE(v30) < 0)
      operator delete((void *)v29);
    v29 = v27;
    v30 = v28;
    HIBYTE(v28) = 0;
    LOBYTE(v27) = 0;
    v17 = v26;
    if (v26)
    {
      v18 = (unsigned int *)(v26 + 8);
      do
      {
        v19 = __ldxr(v18);
        v20 = v19 - 1;
      }
      while (__stlxr(v20, v18));
      if (!v20)
        (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
    }
    sub_2263AE450(&v25);
  }
  v21 = objc_alloc_init(USKResource);
  if (v21)
  {
    if (SHIBYTE(v30) < 0)
    {
      sub_2263AE36C(__p, (void *)v29, *((unint64_t *)&v29 + 1));
    }
    else
    {
      *(_OWORD *)__p = v29;
      v24 = v30;
    }
    sub_2263AD96C(v21, (char *)__p);
    if (SHIBYTE(v24) < 0)
      operator delete(__p[0]);
  }
  if (SHIBYTE(v30) < 0)
    operator delete((void *)v29);

  return v21;
}

+ (id)resourceWithPath:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  USKResource *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *__p[2];
  char v15;

  v3 = a3;
  sub_2263F8F84();
  if (objc_msgSend_length(v3, v4, v5, v6))
  {
    v7 = objc_alloc_init(USKResource);
    if (v7)
    {
      v8 = objc_retainAutorelease(v3);
      v12 = (char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
      sub_2263AE2A8(__p, v12);
      sub_2263AD96C(v7, (char *)__p);
      if (v15 < 0)
        operator delete(__p[0]);
    }
  }
  else
  {
    NSLog(CFSTR("Warning: Unable to get resource from empty path."));
    v7 = 0;
  }

  return v7;
}

+ (id)resourceWithResourcePath:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  USKResource *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *__p[2];
  char v19;

  v3 = a3;
  sub_2263F8F84();
  objc_msgSend_resolvedPath(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v7, v8, v9, v10))
  {
    v11 = objc_alloc_init(USKResource);
    if (v11)
    {
      v12 = objc_retainAutorelease(v7);
      v16 = (char *)objc_msgSend_UTF8String(v12, v13, v14, v15);
      sub_2263AE2A8(__p, v16);
      sub_2263AD96C(v11, (char *)__p);
      if (v19 < 0)
        operator delete(__p[0]);
    }
  }
  else
  {
    NSLog(CFSTR("Warning: Unable to get resource from empty path."));
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  shared_ptr<const char> *p_buffer;
  char *ptr;
  objc_super v5;

  ptr = self->_buffer.__ptr_;
  p_buffer = &self->_buffer;
  if (ptr)
    sub_2263AE0FC(p_buffer);
  if (self->_asset.__ptr_)
    sub_2263AE0FC(&self->_asset.__ptr_);
  v5.receiver = self;
  v5.super_class = (Class)USKResource;
  -[USKResource dealloc](&v5, sel_dealloc);
}

- (id)dataNoCopy
{
  void *ptr;
  uint64_t *p_buffer;
  const char *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 v10;

  ptr = self->_asset.__ptr_;
  if (ptr)
  {
    (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)ptr + 24))(&v10);
    p_buffer = (uint64_t *)&self->_buffer;
    sub_2263AE20C((uint64_t)&self->_buffer, &v10);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
    if (*((_QWORD *)&v10 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    if (*p_buffer)
    {
      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v5, *p_buffer, self->_length, 0);
      ptr = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      ptr = 0;
    }
  }
  return ptr;
}

- (void).cxx_destruct
{
  sub_2263AE3F8((uint64_t)&self->_buffer);
  sub_2263AE3F8((uint64_t)&self->_asset);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
