@implementation UPPreprocessorOutput

- (UPPreprocessorOutput)initWithEmbeddingsTensor:(UPGenericTensor *)a3 spanLabelsTensor:(UPGenericTensor *)a4 outputTokens:()vector<nl_featurization:(std::allocator<nl_featurization::Token>> *)a5 :Token
{
  UPPreprocessorOutput *v8;
  UPPreprocessorOutput *v9;
  unint64_t *begin;
  UPGenericTensor *p_embeddingsTensor;
  float *v12;
  unint64_t *v13;
  float *v14;
  void **p_begin;
  __int128 *end;
  __int128 *v17;
  uint64_t value;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  Token *v25;
  __int128 *v26;
  __int128 *v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  __int128 *v31;
  __int128 v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)UPPreprocessorOutput;
  v8 = -[UPPreprocessorOutput init](&v34, sel_init);
  v9 = v8;
  if (v8)
  {
    p_embeddingsTensor = &v8->_embeddingsTensor;
    begin = v8->_embeddingsTensor.shape.__begin_;
    if (begin)
    {
      v9->_embeddingsTensor.shape.__end_ = begin;
      operator delete(begin);
      p_embeddingsTensor->shape.__begin_ = 0;
      v9->_embeddingsTensor.shape.__end_ = 0;
      v9->_embeddingsTensor.shape.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v9->_embeddingsTensor.shape.__begin_ = *(_OWORD *)&a3->shape.__begin_;
    v9->_embeddingsTensor.shape.__end_cap_.__value_ = a3->shape.__end_cap_.__value_;
    a3->shape.__begin_ = 0;
    a3->shape.__end_ = 0;
    a3->shape.__end_cap_.__value_ = 0;
    v12 = v9->_embeddingsTensor.data.__begin_;
    if (v12)
    {
      v9->_embeddingsTensor.data.__end_ = v12;
      operator delete(v12);
      v9->_embeddingsTensor.data.__begin_ = 0;
      v9->_embeddingsTensor.data.__end_ = 0;
      v9->_embeddingsTensor.data.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v9->_embeddingsTensor.data.__begin_ = *(_OWORD *)&a3->data.__begin_;
    v9->_embeddingsTensor.data.__end_cap_.__value_ = a3->data.__end_cap_.__value_;
    a3->data.__begin_ = 0;
    a3->data.__end_ = 0;
    a3->data.__end_cap_.__value_ = 0;
    v13 = v9->_spanLabelsTensor.shape.__begin_;
    if (v13)
    {
      v9->_spanLabelsTensor.shape.__end_ = v13;
      operator delete(v13);
      v9->_spanLabelsTensor.shape.__begin_ = 0;
      v9->_spanLabelsTensor.shape.__end_ = 0;
      v9->_spanLabelsTensor.shape.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v9->_spanLabelsTensor.shape.__begin_ = *(_OWORD *)&a4->shape.__begin_;
    v9->_spanLabelsTensor.shape.__end_cap_.__value_ = a4->shape.__end_cap_.__value_;
    a4->shape.__begin_ = 0;
    a4->shape.__end_ = 0;
    a4->shape.__end_cap_.__value_ = 0;
    v14 = v9->_spanLabelsTensor.data.__begin_;
    if (v14)
    {
      v9->_spanLabelsTensor.data.__end_ = v14;
      operator delete(v14);
      v9->_spanLabelsTensor.data.__begin_ = 0;
      v9->_spanLabelsTensor.data.__end_ = 0;
      v9->_spanLabelsTensor.data.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v9->_spanLabelsTensor.data.__begin_ = *(_OWORD *)&a4->data.__begin_;
    v9->_spanLabelsTensor.data.__end_cap_.__value_ = a4->data.__end_cap_.__value_;
    a4->data.__begin_ = 0;
    a4->data.__end_ = 0;
    a4->data.__end_cap_.__value_ = 0;
    p_begin = (void **)&v9->_outputTokens.__begin_;
    if (&v9->_outputTokens != a5)
    {
      v17 = (__int128 *)a5->__begin_;
      end = (__int128 *)a5->__end_;
      value = (uint64_t)v9->_outputTokens.__end_cap_.__value_;
      v19 = 0xAAAAAAAAAAAAAAABLL * (end - v17);
      v20 = (uint64_t)v9->_outputTokens.__begin_;
      if (0xAAAAAAAAAAAAAAABLL * ((value - v20) >> 4) < v19)
      {
        if (v20)
        {
          std::vector<nl_featurization::Token>::__clear[abi:ne180100]((uint64_t *)&v9->_outputTokens);
          operator delete(*p_begin);
          value = 0;
          *p_begin = 0;
          v9->_outputTokens.__end_ = 0;
          v9->_outputTokens.__end_cap_.__value_ = 0;
        }
        if (v19 > 0x555555555555555)
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        v21 = 0xAAAAAAAAAAAAAAABLL * (value >> 4);
        v22 = 2 * v21;
        if (2 * v21 <= v19)
          v22 = 0xAAAAAAAAAAAAAAABLL * (end - v17);
        if (v21 >= 0x2AAAAAAAAAAAAAALL)
          v23 = 0x555555555555555;
        else
          v23 = v22;
        std::vector<nl_featurization::Token>::__vallocate[abi:ne180100](&v9->_outputTokens.__begin_, v23);
        v24 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nl_featurization::Token>,nl_featurization::Token*,nl_featurization::Token*,nl_featurization::Token*>((uint64_t)&v9->_outputTokens.__end_cap_, v17, end, (uint64_t)v9->_outputTokens.__end_);
LABEL_26:
        v9->_outputTokens.__end_ = (Token *)v24;
        return v9;
      }
      v25 = v9->_outputTokens.__end_;
      if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v25 - v20) >> 4) < v19)
      {
        v26 = &v17[((uint64_t)v25 - v20) >> 4];
        if (v25 != (Token *)v20)
        {
          do
          {
            v28 = *v17;
            v27 = v17 + 1;
            *(_OWORD *)v20 = v28;
            v29 = v20 + 16;
            std::basic_string<char16_t>::operator=((std::basic_string<char16_t> *)v29, (const std::basic_string<char16_t> *)v27);
            *(_BYTE *)(v29 + 24) = *((_BYTE *)v27 + 24);
            v17 = v27 + 2;
            v20 = v29 + 32;
          }
          while (v17 != v26);
          v20 = (uint64_t)v9->_outputTokens.__end_;
        }
        v24 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nl_featurization::Token>,nl_featurization::Token*,nl_featurization::Token*,nl_featurization::Token*>((uint64_t)&v9->_outputTokens.__end_cap_, v26, end, v20);
        goto LABEL_26;
      }
      if (v17 != end)
      {
        do
        {
          v30 = v20;
          v32 = *v17;
          v31 = v17 + 1;
          *(_OWORD *)v20 = v32;
          std::basic_string<char16_t>::operator=((std::basic_string<char16_t> *)(v20 + 16), (const std::basic_string<char16_t> *)v31);
          *(_BYTE *)(v20 + 40) = *((_BYTE *)v31 + 24);
          v17 = v31 + 2;
          v20 += 48;
        }
        while (v17 != end);
        v20 = v30 + 48;
        v25 = v9->_outputTokens.__end_;
      }
      while (v25 != (Token *)v20)
      {
        if (*((char *)v25 - 9) < 0)
          operator delete(*((void **)v25 - 4));
        v25 = (Token *)((char *)v25 - 48);
      }
      v9->_outputTokens.__end_ = (Token *)v20;
    }
  }
  return v9;
}

- (void)embeddingsTensor
{
  return &self->_embeddingsTensor;
}

- (void)spanLabelsTensor
{
  return &self->_spanLabelsTensor;
}

- (void)outputTokens
{
  return &self->_outputTokens;
}

- (void).cxx_destruct
{
  float *begin;
  unint64_t *v4;
  float *v5;
  unint64_t *v6;
  vector<nl_featurization::Token, std::allocator<nl_featurization::Token>> *p_outputTokens;

  p_outputTokens = &self->_outputTokens;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_outputTokens);
  begin = self->_spanLabelsTensor.data.__begin_;
  if (begin)
  {
    self->_spanLabelsTensor.data.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_spanLabelsTensor.shape.__begin_;
  if (v4)
  {
    self->_spanLabelsTensor.shape.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_embeddingsTensor.data.__begin_;
  if (v5)
  {
    self->_embeddingsTensor.data.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_embeddingsTensor.shape.__begin_;
  if (v6)
  {
    self->_embeddingsTensor.shape.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
