@implementation _SSBDatabaseUpdateFetchDataSessionHandler

- (_SSBDatabaseUpdateFetchDataSessionHandler)initWithCompletionHandler:(void *)a3 provider:(int)a4
{
  id v6;
  char *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  id *v14;
  id *v15;
  id *v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  id v27;
  __int128 v29;
  id location;
  objc_super v31;
  __int128 v32;
  id to;
  _QWORD v34[3];
  id *v35;
  id from[4];
  id *v37;
  _BYTE v38[24];
  id *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)_SSBDatabaseUpdateFetchDataSessionHandler;
  v6 = -[_SSBDatabaseUpdateFetchDataSessionHandler init](&v31, sel_init);
  if (!v6)
    goto LABEL_52;
  v7 = (char *)operator new(0x68uLL);
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = 0;
  *(_QWORD *)v7 = off_1EA3EB878;
  *(_OWORD *)(v7 + 40) = 0u;
  *(_OWORD *)(v7 + 56) = 0u;
  *(_OWORD *)(v7 + 72) = 0u;
  *(_OWORD *)(v7 + 88) = 0u;
  *(_OWORD *)(v7 + 24) = 0u;
  from[0] = v7 + 24;
  from[1] = v7;
  std::shared_ptr<ByteProvider>::__enable_weak_this[abi:sn180100]<ByteProvider,ByteProvider,void>((uint64_t)from, (_QWORD *)from[0], (uint64_t)from[0]);
  std::shared_ptr<ByteProvider>::operator=[abi:sn180100]((uint64_t)v6 + 16, (__int128 *)from);
  v8 = (std::__shared_weak_count *)from[1];
  if (from[1])
  {
    v9 = (unint64_t *)((char *)from[1] + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  objc_initWeak(&location, v6);
  std::allocate_shared[abi:sn180100]<ReadStream,std::allocator<ReadStream>,std::shared_ptr<ByteProvider> &,void>((uint64_t *)v6 + 2, &v29);
  objc_copyWeak(&to, &location);
  v11 = (id *)v34;
  v12 = (void *)*((_QWORD *)a3 + 3);
  if (v12)
  {
    if (v12 == a3)
    {
      v35 = (id *)v34;
      (*(void (**)(void *, _QWORD *))(*(_QWORD *)a3 + 24))(a3, v34);
    }
    else
    {
      v35 = (id *)*((_QWORD *)a3 + 3);
      *((_QWORD *)a3 + 3) = 0;
    }
  }
  else
  {
    v35 = 0;
  }
  v13 = operator new(8uLL);
  v32 = v29;
  v29 = 0uLL;
  objc_moveWeak(from, &to);
  v14 = &from[1];
  if (v35)
  {
    if (v35 == v34)
    {
      v37 = &from[1];
      (*(void (**)(_QWORD *, id *))(v34[0] + 24))(v34, &from[1]);
    }
    else
    {
      v37 = v35;
      v35 = 0;
    }
  }
  else
  {
    v37 = 0;
  }
  v39 = 0;
  v15 = (id *)operator new(0x30uLL);
  *v15 = off_1EA3EB4A8;
  objc_moveWeak(v15 + 1, from);
  if (v37)
  {
    if (v37 == &from[1])
    {
      v15[5] = v15 + 2;
      (*((void (**)(id *))from[1] + 3))(&from[1]);
    }
    else
    {
      v15[5] = v37;
      v37 = 0;
    }
  }
  else
  {
    v15[5] = 0;
  }
  v39 = v15;
  Backend::Google::FetchThreatListUpdatesResponseParser::FetchThreatListUpdatesResponseParser(v13, &v32, v38);
  v16 = v39;
  if (v39 == (id *)v38)
  {
    v17 = 4;
    v16 = (id *)v38;
  }
  else
  {
    if (!v39)
      goto LABEL_27;
    v17 = 5;
  }
  (*((void (**)(void))*v16 + v17))();
LABEL_27:
  if (v37 == &from[1])
  {
    v18 = 4;
    goto LABEL_31;
  }
  if (v37)
  {
    v18 = 5;
    v14 = v37;
LABEL_31:
    (*((void (**)(id *))*v14 + v18))(v14);
  }
  objc_destroyWeak(from);
  v19 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
  if (*((_QWORD *)&v32 + 1))
  {
    v20 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = (void *)*((_QWORD *)v6 + 1);
  *((_QWORD *)v6 + 1) = v13;
  if (v22)
  {
    if (*(_QWORD *)v22)
      (*(void (**)(void))(*(_QWORD *)v22 + 8))();
    operator delete(v22);
  }
  if (v35 == v34)
  {
    v23 = 4;
  }
  else
  {
    if (!v35)
      goto LABEL_46;
    v23 = 5;
    v11 = v35;
  }
  (*((void (**)(id *))*v11 + v23))(v11);
LABEL_46:
  objc_destroyWeak(&to);
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
  if (*((_QWORD *)&v29 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  *((_DWORD *)v6 + 12) = a4;
  v27 = v6;
  objc_destroyWeak(&location);
LABEL_52:

  return (_SSBDatabaseUpdateFetchDataSessionHandler *)v6;
}

- (id)initWithCompletionHandler:(id *)location provider:
{
  id *v2;
  id *v3;
  uint64_t v4;

  v2 = location + 1;
  v3 = (id *)location[4];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*((void (**)(void))*v3 + v4))();
  }
  objc_destroyWeak(location);
  return location;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  void (**v7)(id, BOOL);
  id v8;

  v8 = a5;
  v7 = (void (**)(id, BOOL))a6;
  v7[2](v7, objc_msgSend(v8, "statusCode") == 200);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];

  v8 = a5;
  v6 = objc_msgSend(v8, "length");
  v7 = MEMORY[0x1E0C809B0];
  self->_receivedBytes += v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __80___SSBDatabaseUpdateFetchDataSessionHandler_URLSession_dataTask_didReceiveData___block_invoke;
  v9[3] = &unk_1EA3EC180;
  v9[4] = self;
  objc_msgSend(v8, "enumerateByteRangesUsingBlock:", v9);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;

  v7 = a5;
  logDataLength(self->_receivedBytes, self->_provider);
  if (v7)
  {
    objc_storeStrong((id *)&self->_error, a5);
    ByteProvider::readFailedWithError(self->_byteProvider.__ptr_);
  }
  else
  {
    ByteProvider::finishedReadingSuccessfully(self->_byteProvider.__ptr_);
  }

}

- (void).cxx_destruct
{
  FetchThreatListUpdatesResponseParser *value;

  objc_storeStrong((id *)&self->_error, 0);
  std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:sn180100]((uint64_t)&self->_byteProvider);
  value = self->_parser.__ptr_.__value_;
  self->_parser.__ptr_.__value_ = 0;
  if (value)
  {
    if (*(_QWORD *)value)
      (*(void (**)(void))(*(_QWORD *)value + 8))();
    operator delete(value);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (uint64_t)initWithCompletionHandler:provider:
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *(_QWORD *)a1 = off_1EA3EB4A8;
  v2 = (_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)(a1 + 40);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (void)initWithCompletionHandler:provider:
{
  id WeakRetained;
  void *v5;
  void *v6;
  _BYTE v7[40];
  char v8;
  void **v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v5 = WeakRetained;
  if (WeakRetained && (v6 = (void *)*((_QWORD *)WeakRetained + 5)) != 0)
  {
    v7[0] = 0;
    v8 = 0;
    std::function<void ()(std::optional<Backend::Google::FetchThreatListUpdatesResponse> &&,NSError *)>::operator()(a1 + 16, (uint64_t)v7, v6);
    if (v8)
    {
      v9 = (void **)v7;
      std::vector<Backend::Google::ListUpdateResponse>::__destroy_vector::operator()[abi:sn180100](&v9);
    }
  }
  else
  {
    std::function<void ()(std::optional<Backend::Google::FetchThreatListUpdatesResponse> &&,NSError *)>::operator()(a1 + 16, a2, 0);
  }

}

- (id)initWithCompletionHandler:provider:
{
  *(_QWORD *)a2 = off_1EA3EB4A8;
  return std::__compressed_pair_elem<-[_SSBDatabaseUpdateFetchDataSessionHandler initWithCompletionHandler:provider:]::$_0,0,false>::__compressed_pair_elem[abi:sn180100]<-[_SSBDatabaseUpdateFetchDataSessionHandler initWithCompletionHandler:provider:]::$_0 const&,0ul>((id *)(a2 + 8), (id *)(a1 + 8));
}

- (id)initWithCompletionHandler:(id *)a1 provider:(id *)a2
{
  objc_copyWeak(a1, a2);
  std::__function::__value_func<void ()(std::optional<Backend::Google::FetchThreatListUpdatesResponse> &&,NSError *)>::__value_func[abi:sn180100]((uint64_t)(a1 + 1), (uint64_t)(a2 + 1));
  return a1;
}

@end
