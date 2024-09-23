@implementation PPEvictingMaxTokenCountPriorityQueue

- (PPEvictingMaxTokenCountPriorityQueue)initWithCapacity:(unint64_t)a3
{
  PPEvictingMaxTokenCountPriorityQueue *v4;
  PPEvictingMaxTokenCountPriorityQueue *v5;
  _QWORD *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPEvictingMaxTokenCountPriorityQueue;
  v4 = -[PPEvictingMaxTokenCountPriorityQueue init](&v8, sel_init);
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
  void **queue;
  char *v4;
  char *v5;
  void *v6;
  void *v7;
  objc_super v8;

  queue = (void **)self->_queue;
  if (queue)
  {
    v4 = (char *)*queue;
    if (*queue)
    {
      v5 = (char *)queue[1];
      v6 = *queue;
      if (v5 != v4)
      {
        do
        {
          v7 = (void *)*((_QWORD *)v5 - 1);
          v5 -= 8;

        }
        while (v5 != v4);
        v6 = *queue;
      }
      queue[1] = v4;
      operator delete(v6);
    }
    MEMORY[0x1C3BD627C](queue, 0x80C402512154ALL);
  }
  v8.receiver = self;
  v8.super_class = (Class)PPEvictingMaxTokenCountPriorityQueue;
  -[PPEvictingMaxTokenCountPriorityQueue dealloc](&v8, sel_dealloc);
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
  unsigned int v7;
  BOOL v8;
  id v9;
  id v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  int64x2_t v22;
  char *v23;
  char *v24;
  void *v25;
  id v26;

  v4 = a3;
  capacity = self->_capacity;
  if (capacity)
  {
    queue = (uint64_t *)self->_queue;
    v26 = v4;
    if (capacity <= (queue[1] - *queue) >> 3)
    {
      v7 = objc_msgSend(v4, "count");
      v8 = v7 > objc_msgSend(**(id **)self->_queue, "count");
      v4 = v26;
      if (v8)
        goto LABEL_27;
      std::priority_queue<PPTokenCount * {__strong},std::vector<PPTokenCount * {__strong}>,PPTokenCountCompareLess>::pop((uint64_t)self->_queue);
      queue = (uint64_t *)self->_queue;
      v4 = v26;
    }
    v9 = v4;
    v10 = v9;
    v11 = (_QWORD *)queue[1];
    v12 = queue[2];
    if ((unint64_t)v11 >= v12)
    {
      v14 = (_QWORD *)*queue;
      v15 = ((uint64_t)v11 - *queue) >> 3;
      v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 61)
        std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
      v17 = v12 - (_QWORD)v14;
      if (v17 >> 2 > v16)
        v16 = v17 >> 2;
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
        v18 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v18 = v16;
      if (v18)
      {
        if (v18 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v19 = (char *)operator new(8 * v18);
        v11 = (_QWORD *)queue[1];
      }
      else
      {
        v19 = 0;
      }
      v20 = &v19[8 * v15];
      *(_QWORD *)v20 = v10;
      v13 = (uint64_t)(v20 + 8);
      if (v11 == v14)
      {
        v22 = vdupq_n_s64((unint64_t)v11);
      }
      else
      {
        do
        {
          v21 = *--v11;
          *v11 = 0;
          *((_QWORD *)v20 - 1) = v21;
          v20 -= 8;
        }
        while (v11 != v14);
        v22 = *(int64x2_t *)queue;
      }
      *queue = (uint64_t)v20;
      queue[1] = v13;
      queue[2] = (uint64_t)&v19[8 * v18];
      v24 = (char *)v22.i64[1];
      v23 = (char *)v22.i64[0];
      while (v24 != v23)
      {
        v25 = (void *)*((_QWORD *)v24 - 1);
        v24 -= 8;

      }
      if (v23)
        operator delete(v23);
    }
    else
    {
      *v11 = v9;
      v13 = (uint64_t)(v11 + 1);
    }
    queue[1] = v13;
    std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,PPTokenCountCompareLess &,std::__wrap_iter<PPTokenCount * {__strong}*>>(*queue, v13, (v13 - *queue) >> 3);
    v4 = v26;
  }
LABEL_27:

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
    std::priority_queue<PPTokenCount * {__strong},std::vector<PPTokenCount * {__strong}>,PPTokenCountCompareLess>::pop((uint64_t)self->_queue);
  }
  return v4;
}

- (id)getMaxItemWithoutPopping
{
  id **queue;

  queue = (id **)self->_queue;
  if (*queue == queue[1])
    return 0;
  else
    return **queue;
}

- (void)enumerateTokenCountsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  uint64_t v5;
  uint64_t v6;
  BOOL v8;
  char v9;

  v4 = (void (**)(id, _QWORD, char *))a3;
  v9 = 0;
  v5 = *((_QWORD *)self->_queue + 1) - *(_QWORD *)self->_queue;
  if (v5)
  {
    v6 = (v5 >> 3) - 1;
    do
    {
      v4[2](v4, **(_QWORD **)self->_queue, &v9);
      std::priority_queue<PPTokenCount * {__strong},std::vector<PPTokenCount * {__strong}>,PPTokenCountCompareLess>::pop((uint64_t)self->_queue);
      v8 = v6-- != 0;
    }
    while (!v9 && v8);
  }

}

@end
