@implementation PPScoreInterpreterCtx

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscores, 0);
  objc_storeStrong((id *)&self->_previousSubscores, 0);
  objc_storeStrong((id *)&self->_scoreInputs, 0);
  std::unique_ptr<std::vector<PPScoreInterpreterValue>>::reset[abi:ne180100]((void ***)&self->_stack, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (id)initWithScoreInputs:(void *)a3 previousSubscores:(uint64_t)a4 scalarSubscoreCount:(uint64_t)a5 arraySubscoreCount:(uint64_t)a6 objectSubscoreCount:
{
  id v12;
  id v13;
  id *v14;
  PPScoreDict *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;
  void **v23;
  char *v24;
  char *v25;
  void **v26;
  uint64_t *v27;

  v12 = a2;
  v13 = a3;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)PPScoreInterpreterCtx;
    v14 = (id *)objc_msgSendSuper2(&v22, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      v15 = -[PPScoreDict initWithScalarValueCount:arrayValueCount:objectCount:]([PPScoreDict alloc], "initWithScalarValueCount:arrayValueCount:objectCount:", a4, a5, a6);
      v16 = a1[4];
      a1[4] = v15;

      v17 = operator new();
      *(_QWORD *)v17 = 0;
      *(_QWORD *)(v17 + 8) = 0;
      *(_QWORD *)(v17 + 16) = 0;
      v23 = 0;
      std::unique_ptr<std::vector<PPScoreInterpreterValue>>::reset[abi:ne180100]((void ***)a1 + 1, (void **)v17);
      std::unique_ptr<std::vector<PPScoreInterpreterValue>>::reset[abi:ne180100](&v23, 0);
      v18 = (uint64_t *)a1[1];
      v19 = *v18;
      if (0xAAAAAAAAAAAAAAABLL * ((v18[2] - *v18) >> 3) <= 0x3F)
      {
        v20 = v18[1];
        v27 = v18 + 2;
        v23 = (void **)operator new(0x600uLL);
        v24 = (char *)v23 + v20 - v19;
        v25 = v24;
        v26 = v23 + 192;
        std::vector<PPScoreInterpreterValue>::__swap_out_circular_buffer(v18, &v23);
        std::__split_buffer<PPScoreInterpreterValue>::~__split_buffer((uint64_t)&v23);
      }
    }
  }

  return a1;
}

@end
