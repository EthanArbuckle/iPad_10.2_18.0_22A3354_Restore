@implementation ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3

unint64_t *___ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3__18functionIFbRK16SLAMScriptDERObjEEE_block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  unint64_t *v5;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int v15;
  void *__p[2];
  char v18;
  std::vector<std::string> v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  std::vector<std::string> *v27;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  v5 = DERParseSequenceContent((unint64_t *)(a2 + 8), (unsigned __int16)slamScriptItemSpecLen, (uint64_t)&slamScriptItemSpec, (unint64_t)&v20, 0x70uLL);
  if (!(_DWORD)v5)
  {
    if (*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) >= 2u && *((_QWORD *)&v25 + 1) != 4)
    {
      std::string::basic_string[abi:ne180100](__p, (void *)v21, *((size_t *)&v21 + 1));
      if (v18 >= 0)
        v7 = __p;
      else
        v7 = (void **)__p[0];
      SLAM::Error::Error(&v19, "Platform Category absent for a script with name %s", (const char *)v7);
      std::optional<SLAM::Error>::operator=[abi:ne180100]<SLAM::Error,void>((std::vector<std::string> *)(*(_QWORD *)(a1[5] + 8) + 48), &v19);
      v27 = &v19;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);
      if (v18 < 0)
        operator delete(__p[0]);
      *a3 = 1;
    }
    v8 = a1[10];
    if (!v8)
      std::__throw_bad_function_call[abi:ne180100]();
    if ((*(unsigned int (**)(uint64_t, __int128 *))(*(_QWORD *)v8 + 48))(v8, &v20))
    {
      v9 = *(_QWORD *)(a1[6] + 8);
      v11 = v25;
      v10 = v26;
      *(_OWORD *)(v9 + 112) = v24;
      *(_OWORD *)(v9 + 128) = v11;
      *(_OWORD *)(v9 + 144) = v10;
      v12 = v21;
      v14 = v22;
      v13 = v23;
      *(_OWORD *)(v9 + 48) = v20;
      *(_OWORD *)(v9 + 64) = v12;
      v15 = *(unsigned __int8 *)(v9 + 160);
      *(_OWORD *)(v9 + 80) = v14;
      *(_OWORD *)(v9 + 96) = v13;
      if (!v15)
        *(_BYTE *)(v9 + 160) = 1;
      *a3 = 1;
    }
  }
  return v5;
}

@end
