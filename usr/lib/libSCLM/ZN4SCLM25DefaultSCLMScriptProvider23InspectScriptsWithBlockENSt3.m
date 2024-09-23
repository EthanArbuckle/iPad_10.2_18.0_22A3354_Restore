@implementation ZN4SCLM25DefaultSCLMScriptProvider23InspectScriptsWithBlockENSt3

unint64_t *___ZN4SCLM25DefaultSCLMScriptProvider23InspectScriptsWithBlockENSt3__18functionIFbP10ScriptInfoEEE_block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  unint64_t *v5;
  void **v7;
  id v8;
  std::vector<std::string>::pointer begin;
  void *v10;
  uint64_t v11;
  ScriptInfo *v12;
  ScriptInfo *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  int v20;
  void *__p[2];
  char v23;
  std::vector<std::string> __dst;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  std::vector<std::string> *p_dst;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  v5 = DERParseSequenceContent((unint64_t *)(a2 + 8), (unsigned __int16)slamScriptItemSpecLen, (uint64_t)&slamScriptItemSpec, (unint64_t)&v25, 0x70uLL);
  if (!(_DWORD)v5)
  {
    if (*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) >= 2u && *((_QWORD *)&v30 + 1) != 4)
    {
      std::string::basic_string[abi:ne180100](__p, (void *)v26, *((size_t *)&v26 + 1));
      if (v23 >= 0)
        v7 = __p;
      else
        v7 = (void **)__p[0];
      SLAM::Error::Error(&__dst, "Platform Category absent for a script with name %s", (const char *)v7);
      std::optional<SLAM::Error>::operator=[abi:ne180100]<SLAM::Error,void>((std::vector<std::string> *)(*(_QWORD *)(a1[5] + 8) + 48), &__dst);
      p_dst = &__dst;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_dst);
      if (v23 < 0)
        operator delete(__p[0]);
      *a3 = 1;
    }
    v8 = objc_alloc(MEMORY[0x24BDD17C8]);
    std::string::basic_string[abi:ne180100](&__dst, (void *)v26, *((size_t *)&v26 + 1));
    if (SHIBYTE(__dst.__end_cap_.__value_) >= 0)
      begin = (std::vector<std::string>::pointer)&__dst;
    else
      begin = __dst.__begin_;
    v10 = (void *)objc_msgSend(v8, "initWithUTF8String:", begin);
    if (SHIBYTE(__dst.__end_cap_.__value_) < 0)
      operator delete(__dst.__begin_);
    if ((_QWORD)v31)
      v11 = bswap32(*(_DWORD *)v31);
    else
      v11 = 0;
    v12 = [ScriptInfo alloc];
    v13 = -[ScriptInfo initWithScriptID:scriptName:apduCount:scriptType:](v12, "initWithScriptID:scriptName:apduCount:scriptType:", bswap64(*(_QWORD *)v25), v10, bswap32(*(_DWORD *)v28), v11);
    if (std::function<BOOL ()(ScriptInfo *)>::operator()((uint64_t)(a1 + 7), v13))
    {
      v14 = *(_QWORD *)(a1[6] + 8);
      v16 = v30;
      v15 = v31;
      *(_OWORD *)(v14 + 112) = v29;
      *(_OWORD *)(v14 + 128) = v16;
      *(_OWORD *)(v14 + 144) = v15;
      v17 = v26;
      v19 = v27;
      v18 = v28;
      *(_OWORD *)(v14 + 48) = v25;
      *(_OWORD *)(v14 + 64) = v17;
      v20 = *(unsigned __int8 *)(v14 + 160);
      *(_OWORD *)(v14 + 80) = v19;
      *(_OWORD *)(v14 + 96) = v18;
      if (!v20)
        *(_BYTE *)(v14 + 160) = 1;
      *a3 = 1;
    }

  }
  return v5;
}

@end
