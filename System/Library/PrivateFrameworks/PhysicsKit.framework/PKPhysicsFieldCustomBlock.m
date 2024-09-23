@implementation PKPhysicsFieldCustomBlock

- (PKPhysicsFieldCustomBlock)initWithCustomBlock:(id)a3
{
  id v4;
  PKPhysicsFieldCustomBlock *v5;
  PKPhysicsFieldCustomBlock *v6;
  uint64_t v7;
  id block;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  PKPhysicsFieldCustomBlock *v13;
  __int128 v14;
  uint64_t v15[3];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPhysicsFieldCustomBlock;
  v5 = -[PKPhysicsField init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    v13 = v5;
    std::allocate_shared[abi:ne180100]<PKCFieldUser,std::allocator<PKCFieldUser>,void *,void>((void **)&v13, &v14);
    *(_OWORD *)v15 = v14;
    v7 = MEMORY[0x20BD0BCF8](v4);
    block = v6->_block;
    v6->_block = (id)v7;

    std::shared_ptr<PKPath>::operator=[abi:ne180100](&v6->super._field.__ptr_, v15);
    v9 = (std::__shared_weak_count *)v15[1];
    if (v15[1])
    {
      v10 = (unint64_t *)(v15[1] + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }

  return v6;
}

+ (id)fieldWithCustomBlock:(id)a3
{
  id v3;
  PKPhysicsFieldCustomBlock *v4;

  v3 = a3;
  v4 = -[PKPhysicsFieldCustomBlock initWithCustomBlock:]([PKPhysicsFieldCustomBlock alloc], "initWithCustomBlock:", v3);

  return v4;
}

- (PKPhysicsFieldCustomBlock)initWithCustomBatchBlock:(id)a3
{
  id v4;
  PKPhysicsFieldCustomBlock *v5;
  PKPhysicsFieldCustomBlock *v6;
  uint64_t v7;
  id batchBlock;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  PKPhysicsFieldCustomBlock *v13;
  __int128 v14;
  uint64_t v15[3];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPhysicsFieldCustomBlock;
  v5 = -[PKPhysicsField init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    v13 = v5;
    std::allocate_shared[abi:ne180100]<PKCFieldUser,std::allocator<PKCFieldUser>,void *,void>((void **)&v13, &v14);
    *(_OWORD *)v15 = v14;
    v7 = MEMORY[0x20BD0BCF8](v4);
    batchBlock = v6->_batchBlock;
    v6->_batchBlock = (id)v7;

    std::shared_ptr<PKPath>::operator=[abi:ne180100](&v6->super._field.__ptr_, v15);
    v9 = (std::__shared_weak_count *)v15[1];
    if (v15[1])
    {
      v10 = (unint64_t *)(v15[1] + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }

  return v6;
}

+ (id)fieldWithCustomBatchBlock:(id)a3
{
  id v3;
  PKPhysicsFieldCustomBlock *v4;

  v3 = a3;
  v4 = -[PKPhysicsFieldCustomBlock initWithCustomBatchBlock:]([PKPhysicsFieldCustomBlock alloc], "initWithCustomBatchBlock:", v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_batchBlock, 0);
}

@end
