id psg_default_log_handle()
{
  if (psg_default_log_handle__pasOnceToken2 != -1)
    dispatch_once(&psg_default_log_handle__pasOnceToken2, &__block_literal_global_274);
  return (id)psg_default_log_handle__pasExprOnceResult;
}

void sub_1DBD28F5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DBD2902C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DBD291C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DBD29434(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DBD29578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PSGLMWrapper;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1DBD29758(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DBD298D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;
  void *v25;

  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1DBD29A50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DBD29C18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DBD2A524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *__p,uint64_t a37)
{
  void *v37;
  void *v38;

  operator delete(v38);

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__54(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__55(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

_QWORD *std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v4;
  _QWORD *v7;
  uint64_t v8;
  size_t v9;

  if (a4)
  {
    v4 = result;
    if (a4 >> 62)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    result = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(a4);
    v7 = result;
    *v4 = result;
    v4[1] = result;
    v4[2] = (char *)result + 4 * v8;
    v9 = a3 - (_QWORD)a2;
    if (v9)
      result = memmove(result, a2, v9);
    v4[1] = (char *)v7 + v9;
  }
  return result;
}

void sub_1DBD2A708(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void ___ZL12tokenizeTextPvS_P8NSStringS1__block_invoke(uint64_t a1, const UInt8 *a2, CFIndex a3, int a4)
{
  _QWORD *v6;
  unint64_t v7;
  char *v8;
  _DWORD *v9;
  __CFString *v10;
  NSString *v11;
  int TokenIDForLemmaString;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  uint64_t CursorByAdvancingWithCharacters;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _DWORD *v26;
  unint64_t v27;
  int v28;
  int ClassForTokenID;
  void *v30;
  int TokenIDForString;
  int v32;
  NSString *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD *v38;
  unint64_t v39;
  char *v40;
  _DWORD *v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _DWORD *v48;
  unint64_t v49;
  int v50;
  uint64_t v51;
  NSString *v52;
  void *v53;
  NSString *v54;
  id v55;
  __int16 v56[8];

  if (a4)
  {
    v6 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v8 = (char *)v6[7];
    v7 = v6[8];
    if ((unint64_t)v8 < v7)
    {
      *(_DWORD *)v8 = a4;
      v9 = v8 + 4;
LABEL_39:
      v6[7] = v9;
      return;
    }
    v18 = (char *)v6[6];
    v19 = (v8 - v18) >> 2;
    v20 = v19 + 1;
    if (!((unint64_t)(v19 + 1) >> 62))
    {
      v21 = v7 - (_QWORD)v18;
      if (v21 >> 1 > v20)
        v20 = v21 >> 1;
      v22 = (unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL;
      v23 = 0x3FFFFFFFFFFFFFFFLL;
      if (!v22)
        v23 = v20;
      if (v23)
      {
        v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v23);
        v18 = (char *)v6[6];
        v8 = (char *)v6[7];
      }
      else
      {
        v24 = 0;
      }
      v26 = (_DWORD *)(v23 + 4 * v19);
      v27 = v23 + 4 * v24;
      *v26 = a4;
      v9 = v26 + 1;
      while (v8 != v18)
      {
        v28 = *((_DWORD *)v8 - 1);
        v8 -= 4;
        *--v26 = v28;
      }
      v6[6] = v26;
      v6[7] = v9;
      v6[8] = v27;
      if (v18)
        operator delete(v18);
      goto LABEL_39;
    }
LABEL_80:
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  }
  if (!a3)
  {
    psg_default_log_handle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v56[0] = 0;
      _os_log_error_impl(&dword_1DBD27000, v25, OS_LOG_TYPE_ERROR, "Encountered empty token with non-special token id.", (uint8_t *)v56, 2u);
    }

    return;
  }
  v10 = (__CFString *)CFStringCreateWithBytes(0, a2, a3, 0x8000100u, 0);
  if (v10)
  {
    v11 = v10;
    TokenIDForLemmaString = getTokenIDForLemmaString(v11, *(void **)(a1 + 56), *(void **)(a1 + 64));
    if (!TokenIDForLemmaString)
    {
      if (-[NSString length](v11, "length") >= 3)
      {
        -[NSString substringWithRange:](v11, "substringWithRange:", -[NSString length](v11, "length") - 2, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(CFSTR("’s"), "isEqualToString:", v13) & 1) != 0
          || (objc_msgSend(CFSTR("'s"), "isEqualToString:", v13) & 1) != 0
          || (objc_msgSend(CFSTR("’S"), "isEqualToString:", v13) & 1) != 0
          || (objc_msgSend(CFSTR("'S"), "isEqualToString:", v13) & 1) != 0)
        {
          -[NSString substringToIndex:](v11, "substringToIndex:", -[NSString length](v11, "length") - 2);
          v14 = (NSString *)objc_claimAutoreleasedReturnValue();
          TokenIDForLemmaString = getTokenIDForLemmaString(v14, *(void **)(a1 + 56), *(void **)(a1 + 64));

          if (TokenIDForLemmaString)
            goto LABEL_45;
        }
        else
        {

        }
      }
      TokenIDForLemmaString = LMLanguageModelGetTokenIDForString();
      if (!TokenIDForLemmaString)
      {
        -[NSString lowercaseString](v11, "lowercaseString");
        TokenIDForLemmaString = LMLanguageModelGetTokenIDForString();
        if (!TokenIDForLemmaString)
        {
          -[NSString stringByReplacingOccurrencesOfString:withString:](v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
          TokenIDForLemmaString = LMLanguageModelGetTokenIDForString();
          if (!TokenIDForLemmaString)
          {
            -[NSString lowercaseString](v11, "lowercaseString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));

            TokenIDForLemmaString = LMLanguageModelGetTokenIDForString();
            if (!TokenIDForLemmaString)
            {
              if (*(_QWORD *)(a1 + 72) && *(_BYTE *)(a1 + 80))
              {
                v16 = malloc_type_malloc(2 * -[NSString length](v11, "length"), 0x1000040BDFB0063uLL);
                if (!v16)
                {
                  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
                  v55 = (id)objc_claimAutoreleasedReturnValue();
                  objc_exception_throw(v55);
                }
                -[NSString getCharacters:range:](v11, "getCharacters:range:", v16, 0, -[NSString length](v11, "length"));
                LMLexiconGetRootCursor();
                -[NSString length](v11, "length");
                CursorByAdvancingWithCharacters = LMLexiconGetCursorByAdvancingWithCharacters();
                TokenIDForLemmaString = CursorByAdvancingWithCharacters;
                if (CursorByAdvancingWithCharacters)
                {
                  if (LMLexiconCursorHasEntries())
                    TokenIDForLemmaString = LMLexiconCursorFirstTokenID();
                  else
                    TokenIDForLemmaString = 0;
                }
                free(v16);
              }
              else
              {
                TokenIDForLemmaString = 0;
              }
            }
          }
        }
      }
    }
LABEL_45:
    if (!*(_BYTE *)(a1 + 80)
      || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
      || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 56))
    {
      v34 = v11;
LABEL_55:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v35 = -[NSString copy](v34, "copy");
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v37 = *(void **)(v36 + 40);
      *(_QWORD *)(v36 + 40) = v35;

      CFRelease(v11);
      goto LABEL_56;
    }
    ClassForTokenID = LMVocabularyGetClassForTokenID();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingString:", v11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    TokenIDForString = LMLanguageModelGetTokenIDForString();
    v32 = LMVocabularyGetClassForTokenID();
    if ((v32 - 68) > 0x15 || ((1 << (v32 - 68)) & 0x200003) == 0)
    {
      v34 = v11;
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) -= 4;
      v34 = v30;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 56))
      {
        v51 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v52 = *(NSString **)(v51 + 40);
        *(_QWORD *)(v51 + 40) = 0;
        goto LABEL_78;
      }
      ClassForTokenID = LMVocabularyGetClassForTokenID();
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      TokenIDForLemmaString = TokenIDForString;
    }

    if (ClassForTokenID != 69 || LMVocabularyGetClassForTokenID() != 68)
      goto LABEL_55;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingString:", v34);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    TokenIDForString = LMLanguageModelGetTokenIDForString();
    if (LMVocabularyGetClassForTokenID() != 89)
      goto LABEL_79;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) -= 4;
    v54 = v53;
    v52 = v34;
    v34 = v54;
LABEL_78:

    v53 = v34;
    TokenIDForLemmaString = TokenIDForString;
LABEL_79:

    goto LABEL_55;
  }
  TokenIDForLemmaString = 0;
LABEL_56:
  v38 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v40 = (char *)v38[7];
  v39 = v38[8];
  if ((unint64_t)v40 >= v39)
  {
    v42 = (char *)v38[6];
    v43 = (v40 - v42) >> 2;
    v44 = v43 + 1;
    if ((unint64_t)(v43 + 1) >> 62)
      goto LABEL_80;
    v45 = v39 - (_QWORD)v42;
    if (v45 >> 1 > v44)
      v44 = v45 >> 1;
    v22 = (unint64_t)v45 >= 0x7FFFFFFFFFFFFFFCLL;
    v46 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v22)
      v46 = v44;
    if (v46)
    {
      v46 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v46);
      v42 = (char *)v38[6];
      v40 = (char *)v38[7];
    }
    else
    {
      v47 = 0;
    }
    v48 = (_DWORD *)(v46 + 4 * v43);
    v49 = v46 + 4 * v47;
    *v48 = TokenIDForLemmaString;
    v41 = v48 + 1;
    while (v40 != v42)
    {
      v50 = *((_DWORD *)v40 - 1);
      v40 -= 4;
      *--v48 = v50;
    }
    v38[6] = v48;
    v38[7] = v41;
    v38[8] = v49;
    if (v42)
      operator delete(v42);
  }
  else
  {
    *(_DWORD *)v40 = TokenIDForLemmaString;
    v41 = v40 + 4;
  }
  v38[7] = v41;
}

void sub_1DBD2ADC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<unsigned int>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]();
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a1);
}

uint64_t getTokenIDForLemmaString(NSString *a1, void *a2, void *a3)
{
  NSString *v3;
  uint64_t TokenIDForString;
  const void *v5;

  v3 = a1;
  if (-[NSString length](v3, "length"))
  {
    if (LMVocabularyContainsLemma())
    {
      TokenIDForString = LMLanguageModelGetTokenIDForString();
    }
    else
    {
      -[NSString localizedCapitalizedString](v3, "localizedCapitalizedString");
      v5 = (const void *)objc_claimAutoreleasedReturnValue();
      if (LMVocabularyContainsLemma())
        TokenIDForString = LMLanguageModelGetTokenIDForString();
      else
        TokenIDForString = 0;
      CFRelease(v5);
    }
  }
  else
  {
    TokenIDForString = 0;
  }

  return TokenIDForString;
}

void sub_1DBD2AF58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::__throw_length_error[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1EA3F0688, MEMORY[0x1E0DE42D0]);
}

void sub_1DBD2AFCC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void sub_1DBD2BF14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void sub_1DBD2C50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__56(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__57(uint64_t a1)
{

}

void sub_1DBD2EE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBD2EED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBD2EF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBD2F01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __psg_default_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1DF0B9950]();
  v1 = os_log_create("com.apple.proactive.ProactiveInputPredictions", "Default");
  v2 = (void *)psg_default_log_handle__pasExprOnceResult;
  psg_default_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void sub_1DBD3149C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__292(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__293(uint64_t a1)
{

}

id _PASValidatedFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v18[2];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v18[1] = &a9;
  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a1;
  v18[0] = 0;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", v10, CFSTR("%@"), 0, &a9, v18);

  v12 = v18[0];
  if (!v11)
  {
    v13 = objc_alloc(MEMORY[0x1E0C99DA0]);
    v14 = *MEMORY[0x1E0C99778];
    v19 = *MEMORY[0x1E0CB3388];
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithName:reason:userInfo:", v14, CFSTR("An error occurred while formatting the string."), v15);

    objc_msgSend(v16, "raise");
  }

  return v11;
}

void sub_1DBD34DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1DBD35850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__635(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__636(uint64_t a1)
{

}

void sub_1DBD3999C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__914(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__915(uint64_t a1)
{

}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x1E0D43820]();
}

uint64_t LMLanguageModelAddTransientVocabulary()
{
  return MEMORY[0x1E0D42C50]();
}

uint64_t LMLanguageModelCopyTokenAttributes()
{
  return MEMORY[0x1E0D42C70]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x1E0D42C78]();
}

uint64_t LMLanguageModelCreatePredictionEnumerator()
{
  return MEMORY[0x1E0D42C80]();
}

uint64_t LMLanguageModelCreateStringForTokenID()
{
  return MEMORY[0x1E0D42C90]();
}

uint64_t LMLanguageModelGetTokenIDForString()
{
  return MEMORY[0x1E0D42CC0]();
}

uint64_t LMLanguageModelRelease()
{
  return MEMORY[0x1E0D42D00]();
}

uint64_t LMLanguageModelTokenHasAttributes()
{
  return MEMORY[0x1E0D42D38]();
}

uint64_t LMLexiconCreate()
{
  return MEMORY[0x1E0D42D50]();
}

uint64_t LMLexiconCursorFirstTokenID()
{
  return MEMORY[0x1E0D42D58]();
}

uint64_t LMLexiconCursorHasEntries()
{
  return MEMORY[0x1E0D42D70]();
}

uint64_t LMLexiconGetCursorByAdvancingWithCharacters()
{
  return MEMORY[0x1E0D42D88]();
}

uint64_t LMLexiconGetRootCursor()
{
  return MEMORY[0x1E0D42D98]();
}

uint64_t LMLexiconRelease()
{
  return MEMORY[0x1E0D42DC8]();
}

uint64_t LMPredictionEnumeratorAdvance()
{
  return MEMORY[0x1E0D42DD8]();
}

uint64_t LMPredictionEnumeratorGetPrediction()
{
  return MEMORY[0x1E0D42DE0]();
}

uint64_t LMPredictionEnumeratorRelease()
{
  return MEMORY[0x1E0D42DE8]();
}

uint64_t LMStreamTokenizerCreate()
{
  return MEMORY[0x1E0D42DF8]();
}

uint64_t LMStreamTokenizerPushBytes()
{
  return MEMORY[0x1E0D42E08]();
}

uint64_t LMStreamTokenizerRelease()
{
  return MEMORY[0x1E0D42E10]();
}

uint64_t LMVocabularyContainsLemma()
{
  return MEMORY[0x1E0D42E28]();
}

uint64_t LMVocabularyGetClassForTokenID()
{
  return MEMORY[0x1E0D42E40]();
}

uint64_t LMVocabularyGetSharedVocabulary()
{
  return MEMORY[0x1E0D42E48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _PASInsensitiveStringContainsString()
{
  return MEMORY[0x1E0D816D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1EA3F06A0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA3F06A8(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

