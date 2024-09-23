@implementation ZN5xojit8XOJITXPC5startEv

_QWORD *___ZN5xojit8XOJITXPC5startEv_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  char *v4;
  _QWORD *result;
  void *v6;
  uint64_t uint64;
  unint64_t v8;
  size_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  const void *data;
  uint64_t v14;
  size_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void **v20;
  void **v21;
  _QWORD *v22;
  uint64_t v23;
  size_t length;
  size_t v25;
  char v26;
  void *v27;
  __int128 v28;
  _BYTE v29[128];
  void *__dst;
  __int128 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (MEMORY[0x24BD1BBD8](a2) == MEMORY[0x24BDACFA0])
  {
    uint64 = xpc_dictionary_get_uint64(a2, "opc");
    v23 = uint64;
    if (uint64 < 2)
    {
      if (uint64)
      {
        std::mutex::lock((std::mutex *)(v3 + 8));
        v8 = *(_QWORD *)(v3 + 112);
        std::mutex::unlock((std::mutex *)(v3 + 8));
        if (v8 > 7)
        {
          v16 = (_QWORD *)(v3 + 88);
          v17 = *(_QWORD *)(v3 + 112);
          if ((v17 & 2) == 0)
            v16 = (_QWORD *)*v16;
          (*(void (**)(size_t *__return_ptr, _QWORD *, void *))(v17 & 0xFFFFFFFFFFFFFFF8))(&length, v16, a2);
        }
        else
        {
          __dst = "No handler for opcode ";
          *((_QWORD *)&v31 + 1) = &v23;
          v33 = 3075;
          getErrorErrorCat();
          v9 = operator new();
          *(_QWORD *)v9 = off_251C127D0;
          llvm::Twine::str((llvm::formatv_object_base **)&__dst, (std::string *)(v9 + 8));
          *(_QWORD *)(v9 + 32) = 3;
          *(_QWORD *)(v9 + 40) = &getErrorErrorCat(void)::ErrorErrorCat;
          *(_BYTE *)(v9 + 48) = 1;
          length = v9;
        }
      }
      else
      {
        v10 = xpc_dictionary_get_uint64(a2, "opd");
        v11 = xpc_dictionary_get_uint64(a2, "seq");
        v12 = xpc_dictionary_get_uint64(a2, "tag");
        length = 0;
        data = xpc_dictionary_get_data(a2, "buf", &length);
        __dst = &v32;
        v31 = xmmword_24AA2AC90;
        llvm::SmallVectorImpl<char>::resizeImpl<false>(&__dst, length);
        if (data && length)
          memcpy(__dst, data, length);
        v14 = *(_QWORD *)(v3 + 80);
        v27 = v29;
        v28 = xmmword_24AA2AC90;
        if ((_QWORD)v31)
          llvm::SmallVectorImpl<char>::operator=((uint64_t)&v27, (const void **)&__dst);
        (*(void (**)(size_t *__return_ptr, uint64_t, _QWORD, uint64_t, uint64_t, void **))(*(_QWORD *)v14 + 16))(&v25, v14, v10, v11, v12, &v27);
        if (v27 != v29)
          free(v27);
        if (__dst != &v32)
          free(__dst);
        if ((v26 & 1) != 0)
        {
          length = v25;
        }
        else if ((_DWORD)v25 == 1)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v3 + 32))(v3);
          length = 0;
          if ((v26 & 1) != 0)
          {
            v15 = v25;
            v25 = 0;
            if (v15)
              (*(void (**)(size_t))(*(_QWORD *)v15 + 8))(v15);
          }
        }
        else
        {
          length = 0;
        }
      }
    }
    else
    {
      getErrorErrorCat();
      __dst = (void *)3;
      *(_QWORD *)&v31 = &getErrorErrorCat(void)::ErrorErrorCat;
      llvm::make_error<llvm::StringError,char const(&)[38],std::error_code>((uint64_t *)&length, (llvm::formatv_object_base *)"XOJIT XPC message opcode unrecognized", (uint64_t *)&__dst);
    }
    __dst = 0;
    v27 = (void *)length;
    length = 0;
    llvm::ErrorList::join((uint64_t *)&__dst, (uint64_t *)&v27, (uint64_t *)&v25);
    if (v27)
      (*(void (**)(void *))(*(_QWORD *)v27 + 8))(v27);
    if (__dst)
      (*(void (**)(void *))(*(_QWORD *)__dst + 8))(__dst);
    result = (_QWORD *)length;
    v6 = (void *)v25;
    v25 = 0;
    if (length)
      result = (_QWORD *)(*(uint64_t (**)(size_t))(*(_QWORD *)length + 8))(length);
LABEL_39:
    if (!v6)
      return result;
    goto LABEL_40;
  }
  if (a2 != (void *)MEMORY[0x24BDACF38])
  {
    getErrorErrorCat();
    v4 = (char *)operator new();
    __dst = "Unexpected message type";
    v33 = 259;
    *(_QWORD *)v4 = off_251C127D0;
    llvm::Twine::str((llvm::formatv_object_base **)&__dst, (std::string *)(v4 + 8));
    *((_QWORD *)v4 + 4) = 3;
    *((_QWORD *)v4 + 5) = &getErrorErrorCat(void)::ErrorErrorCat;
    v4[48] = 1;
    __dst = 0;
    v27 = v4;
    llvm::ErrorList::join((uint64_t *)&__dst, (uint64_t *)&v27, (uint64_t *)&v25);
    if (v27)
      (*(void (**)(void *))(*(_QWORD *)v27 + 8))(v27);
    result = __dst;
    if (__dst)
      result = (_QWORD *)(*(uint64_t (**)(void *))(*(_QWORD *)__dst + 8))(__dst);
    v6 = (void *)v25;
    goto LABEL_39;
  }
  v6 = 0;
LABEL_40:
  std::mutex::lock((std::mutex *)(v3 + 8));
  xpc_release(*(xpc_object_t *)(v3 + 72));
  *(_QWORD *)(v3 + 72) = 0;
  std::mutex::unlock((std::mutex *)(v3 + 8));
  v18 = *(_QWORD *)(v3 + 80);
  v27 = v6;
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v18 + 24))(v18, &v27);
  result = v27;
  if (v27)
    result = (_QWORD *)(*(uint64_t (**)(void *))(*(_QWORD *)v27 + 8))(v27);
  v19 = *(_QWORD *)(v3 + 112);
  if (v19 >= 8)
  {
    v20 = (void **)(v3 + 88);
    v21 = v20;
    if ((v19 & 2) == 0)
      v21 = (void **)*v20;
    (*(void (**)(size_t *__return_ptr, void **, _QWORD))(v19 & 0xFFFFFFFFFFFFFFF8))(&v25, v21, 0);
    v32 = 0;
    if (v20 != &__dst)
    {
      v22 = llvm::detail::UniqueFunctionBase<void,llvm::Error>::~UniqueFunctionBase(v20);
      llvm::detail::UniqueFunctionBase<llvm::Error,llvm::jitlink::LinkGraph &>::UniqueFunctionBase((uint64_t)v22, (__int128 *)&__dst);
    }
    return llvm::detail::UniqueFunctionBase<void,llvm::Error>::~UniqueFunctionBase(&__dst);
  }
  return result;
}

@end
