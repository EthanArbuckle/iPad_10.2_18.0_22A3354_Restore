@implementation SCMLTextModerationLM

- (SCMLTextModerationLM)initWithError:(id *)a3
{
  id v3;
  char **v4;
  SCMLTextModerationLM *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCMLTextModerationLM;
  v3 = -[SCMLTextModerationLM init](&v7, sel_init);
  if (v3)
  {
    v4 = (char **)operator new();
    scml::TextModerationLM::TextModerationLM(v4);
    std::unique_ptr<scml::TextModerationLM>::reset[abi:ne180100]((scml::TextModerationLM::Impl ***)v3 + 1, (scml::TextModerationLM::Impl **)v4);
  }
  v5 = (SCMLTextModerationLM *)v3;

  return v5;
}

- (id)predict:(id)a3 error:(id *)a4
{
  scml *v5;
  uint64_t *value;
  void **v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  SCMLTextModerationLMPrediction *v17;
  double v18;
  SCMLTextModerationLMPrediction *v19;
  SCMLTextModerationLMResult *v20;
  void *__p[2];
  unsigned __int8 v23;
  _BYTE v24[8];
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;

  v5 = (scml *)a3;
  value = (uint64_t *)self->_moderationLM.__ptr_.__value_;
  scml::strFromNSString(v5, __p);
  if ((v23 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v23 & 0x80u) == 0)
    v8 = v23;
  else
    v8 = (uint64_t)__p[1];
  scml::TextModerationLM::predict(value, (uint64_t)v7, v8, 0, (uint64_t)v24);
  if ((char)v23 < 0)
    operator delete(__p[0]);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v10 = v25;
  if (v26 != v25)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      v13 = v10 + v11;
      if (*(char *)(v13 + 23) < 0)
      {
        v15 = *(_QWORD *)v13;
        v14 = *(_QWORD *)(v13 + 8);
      }
      else
      {
        v14 = *(unsigned __int8 *)(v13 + 23);
        v15 = v13;
      }
      scml::strToNSString(v15, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = [SCMLTextModerationLMPrediction alloc];
      LODWORD(v18) = *((_DWORD *)v28 + v12);
      v19 = -[SCMLTextModerationLMPrediction initWithNameP1:safe:probability:](v17, "initWithNameP1:safe:probability:", v16, (*(_QWORD *)((char *)v27 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v12) & 1, v18);
      objc_msgSend(v9, "addObject:", v19);

      ++v12;
      v10 = v25;
      v11 += 24;
    }
    while (v12 < 0xAAAAAAAAAAAAAAABLL * ((v26 - v25) >> 3));
  }
  v20 = objc_alloc_init(SCMLTextModerationLMResult);
  -[SCMLTextModerationLMResult setSafe:](v20, "setSafe:", v24[0]);
  -[SCMLTextModerationLMResult setPredictions:](v20, "setPredictions:", v9);

  if (v28)
  {
    v29 = v28;
    operator delete(v28);
  }
  if (v27)
    operator delete(v27);
  __p[0] = &v25;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

  return v20;
}

- (void).cxx_destruct
{
  std::unique_ptr<scml::TextModerationLM>::reset[abi:ne180100]((scml::TextModerationLM::Impl ***)&self->_moderationLM, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
