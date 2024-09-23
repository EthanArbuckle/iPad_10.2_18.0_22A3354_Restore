@implementation PPEvictingMinPriorityQueue

- (PPEvictingMinPriorityQueue)initWithCapacity:(unint64_t)a3
{
  PPEvictingMinPriorityQueue *v4;
  PPEvictingMinPriorityQueue *v5;
  _QWORD *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPEvictingMinPriorityQueue;
  v4 = -[PPEvictingMinPriorityQueue init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    v6 = (_QWORD *)operator new();
    *v6 = 0;
    v6[1] = 0;
    v6[2] = 0;
    v5->_queue = v6;
  }
  return v5;
}

- (void)dealloc
{
  void *queue;
  objc_super v4;
  void **v5;

  queue = self->_queue;
  if (queue)
  {
    v5 = (void **)self->_queue;
    std::vector<PPScoredItem * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1C3BD627C](queue, 0x80C402512154ALL);
  }
  v4.receiver = self;
  v4.super_class = (Class)PPEvictingMinPriorityQueue;
  -[PPEvictingMinPriorityQueue dealloc](&v4, sel_dealloc);
}

- (double)count
{
  return (double)(unint64_t)((uint64_t)(*((_QWORD *)self->_queue + 1) - *(_QWORD *)self->_queue) >> 3);
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)addObject:(id)a3
{
  id v4;
  unint64_t capacity;
  uint64_t *queue;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  int64x2_t v24;
  char *v25;
  char *v26;
  void *v27;
  id v28;

  v4 = a3;
  capacity = self->_capacity;
  if (capacity)
  {
    queue = (uint64_t *)self->_queue;
    v28 = v4;
    if (capacity <= (queue[1] - *queue) >> 3)
    {
      objc_msgSend(v4, "score");
      v8 = v7;
      objc_msgSend(**(id **)self->_queue, "score");
      v4 = v28;
      if (v8 < v9)
        goto LABEL_26;
      std::priority_queue<PPScoredItem * {__strong},std::vector<PPScoredItem * {__strong}>,PPScoredItemCompareGreater>::pop((uint64_t)self->_queue);
      queue = (uint64_t *)self->_queue;
      v4 = v28;
    }
    v10 = v4;
    v11 = v10;
    v13 = (_QWORD *)queue[1];
    v12 = queue[2];
    if ((unint64_t)v13 >= v12)
    {
      v15 = ((uint64_t)v13 - *queue) >> 3;
      if ((unint64_t)(v15 + 1) >> 61)
        std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
      v16 = v12 - *queue;
      v17 = v16 >> 2;
      if (v16 >> 2 <= (unint64_t)(v15 + 1))
        v17 = v15 + 1;
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
        v18 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v18 = v17;
      if (v18)
        v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<PPScoredItem * {__strong}>>(v18);
      else
        v19 = 0;
      v20 = (_QWORD *)(v18 + 8 * v15);
      *v20 = v11;
      v14 = (uint64_t)(v20 + 1);
      v22 = (_QWORD *)*queue;
      v21 = (_QWORD *)queue[1];
      if (v21 == (_QWORD *)*queue)
      {
        v24 = vdupq_n_s64((unint64_t)v21);
      }
      else
      {
        do
        {
          v23 = *--v21;
          *v21 = 0;
          *--v20 = v23;
        }
        while (v21 != v22);
        v24 = *(int64x2_t *)queue;
      }
      *queue = (uint64_t)v20;
      queue[1] = v14;
      queue[2] = v18 + 8 * v19;
      v26 = (char *)v24.i64[1];
      v25 = (char *)v24.i64[0];
      while (v26 != v25)
      {
        v27 = (void *)*((_QWORD *)v26 - 1);
        v26 -= 8;

      }
      if (v25)
        operator delete(v25);
    }
    else
    {
      *v13 = v10;
      v14 = (uint64_t)(v13 + 1);
    }
    queue[1] = v14;
    std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,PPScoredItemCompareGreater &,std::__wrap_iter<PPScoredItem * {__strong}*>>(*queue, v14, (v14 - *queue) >> 3);
    v4 = v28;
  }
LABEL_26:

}

- (id)popItem
{
  id **queue;
  id v4;

  queue = (id **)self->_queue;
  if (*queue == queue[1])
  {
    v4 = 0;
  }
  else
  {
    v4 = **queue;
    std::priority_queue<PPScoredItem * {__strong},std::vector<PPScoredItem * {__strong}>,PPScoredItemCompareGreater>::pop((uint64_t)self->_queue);
  }
  return v4;
}

- (id)getMinItemWithoutPopping
{
  id **queue;

  queue = (id **)self->_queue;
  if (*queue == queue[1])
    return 0;
  else
    return **queue;
}

- (id)extractSortedMutableArray
{
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char *v13;
  char *v14;
  char *v15;
  void **v16[2];

  v2 = *(_QWORD *)self->_queue;
  v3 = *((_QWORD *)self->_queue + 1);
  v4 = v3 - v2;
  if (v3 == v2)
  {
    v11 = (void *)objc_opt_new();
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16[0] = (void **)&v13;
    v16[1] = 0;
    if (v3 - v2 < 0)
      std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PPScoredItem * {__strong}>>(v4 >> 3);
    v13 = v6;
    v15 = &v6[8 * v7];
    bzero(v6, v4);
    v14 = &v6[v4];
    v8 = 8 * (v4 >> 3) - 8;
    v9 = (v4 >> 3) + 1;
    while (--v9)
    {
      v10 = v8 - 8;
      objc_storeStrong((id *)&v13[v8], **(id **)self->_queue);
      std::priority_queue<PPScoredItem * {__strong},std::vector<PPScoredItem * {__strong}>,PPScoredItemCompareGreater>::pop((uint64_t)self->_queue);
      v8 = v10;
    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:");
    v16[0] = (void **)&v13;
    std::vector<PPScoredItem * {__strong}>::__destroy_vector::operator()[abi:ne180100](v16);
  }
  return v11;
}

@end
