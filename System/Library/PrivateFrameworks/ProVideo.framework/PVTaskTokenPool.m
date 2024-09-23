@implementation PVTaskTokenPool

- (PVTaskTokenPool)init
{
  return -[PVTaskTokenPool initWithOffset:](self, "initWithOffset:", 0);
}

- (PVTaskTokenPool)initWithOffset:(unint64_t)a3
{
  PVTaskTokenPool *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PVTaskTokenPool;
  result = -[PVTaskTokenPool init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (id)getToken
{
  std::mutex *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PVTaskToken *v7;
  void *v8;
  void *v9;

  v3 = (std::mutex *)((char *)self + 64);
  std::mutex::lock((std::mutex *)self + 1);
  v4 = *((_QWORD *)self + 7);
  if (v4)
  {
    v5 = v4 - 1;
    v6 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)self + 3)
                               + (((unint64_t)(*((_QWORD *)self + 6) + v5) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * ((*((_QWORD *)self + 6) + v5) & 0x1FF));
    *((_QWORD *)self + 7) = v5;
    std::deque<unsigned long>::__maybe_remove_back_spare[abi:ne180100]((_QWORD *)self + 2, 1);
  }
  else
  {
    v6 = *((_QWORD *)self + 1);
    *((_QWORD *)self + 1) = v6 + 1;
  }
  v7 = -[PVTaskToken initWithPool:tokenId:]([PVTaskToken alloc], "initWithPool:tokenId:", self, v6);
  -[PVTaskTokenPool delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PVTaskTokenPool delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tokenTaken:", v7);

  }
  std::mutex::unlock(v3);
  return v7;
}

- (void)returnToken:(id)a3
{
  id v4;
  std::mutex *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if ((objc_msgSend(v4, "returned") & 1) == 0)
  {
    v5 = (std::mutex *)((char *)self + 64);
    std::mutex::lock((std::mutex *)self + 1);
    v8 = objc_msgSend(v4, "tokenId");
    std::deque<unsigned long>::push_back((_QWORD *)self + 2, &v8);
    objc_msgSend(v4, "setReturned:", 1);
    -[PVTaskTokenPool delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PVTaskTokenPool delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tokenReturned:", v4);

    }
    std::mutex::unlock(v5);
  }

}

- (PVTaskTokenPoolDelegate)delegate
{
  return (PVTaskTokenPoolDelegate *)objc_loadWeakRetained((id *)self + 16);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)self + 16, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 16);
  std::mutex::~mutex((std::mutex *)self + 1);
  std::deque<unsigned long>::~deque[abi:ne180100]((_QWORD *)self + 2);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_QWORD *)self + 8) = 850045863;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_QWORD *)self + 15) = 0;
  return self;
}

@end
