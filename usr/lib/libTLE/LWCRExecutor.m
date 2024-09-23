@implementation LWCRExecutor

- (BOOL)evaluateRequirements:(id)a3 withFacts:(id)a4
{
  char *v5;
  id v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  CEQueryContext *v10;
  BOOL v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *exception;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  void (**v27)(TLE::CallbackEncyclopedia *__hidden);
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v5 = (char *)a3;
  v6 = a4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global);
  v7 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_2;
  v25[3] = &unk_24E06EC88;
  v26 = v6;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_3;
  v23[3] = &unk_24E06ECB0;
  v24 = v26;
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_4;
  v21[3] = &unk_24E06ECD8;
  v8 = v24;
  v22 = v8;
  v27 = &off_24E06EAA0;
  v28 = (id)MEMORY[0x22078095C](v25);
  v29 = (id)MEMORY[0x22078095C](v23);
  v30 = (id)MEMORY[0x22078095C](v21);
  v20[0] = &v27;
  v20[1] = 0;
  v18 = 0u;
  v19 = 0u;
  v9 = *(_OWORD *)(v5 + 72);
  v31 = *(_OWORD *)(v5 + 56);
  v32 = v9;
  v33 = *(_OWORD *)(v5 + 88);
  v34 = *((_QWORD *)v5 + 13);
  if (der_vm_context_is_valid())
    v10 = (CEQueryContext *)(v5 + 56);
  else
    v10 = 0;
  TLE::Executor::getOperationsFromCE((TLE::Executor *)v20, v10, (uint64_t)&v18);
  if ((_DWORD)v18)
  {
    v11 = 0;
    v12 = (_QWORD *)*((_QWORD *)&v19 + 1);
    if (!*((_QWORD *)&v19 + 1))
      goto LABEL_16;
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v12 = (_QWORD *)*((_QWORD *)&v19 + 1);
    (*(void (**)(__int128 *__return_ptr, _QWORD, void (***)(TLE::CallbackEncyclopedia *__hidden)))(**((_QWORD **)&v19 + 1) + 16))(&v31, *((_QWORD *)&v19 + 1), &v27);
    if ((_DWORD)v31)
      v13 = 1;
    else
      v13 = BYTE8(v32) == 0;
    v11 = !v13;
  }
  v14 = v12[1];
  if (v14 <= 0)
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "Over-release of an object";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  v15 = v14 - 1;
  v12[1] = v15;
  if (!v15)
    (*(void (**)(_QWORD *))(*v12 + 8))(v12);
LABEL_16:

  return v11;
}

void __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_2(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void *v5;
  void *v6;
  char *v7;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, a3, 4);
  objc_msgSend(v5, "valueForKey:", v6);
  v7 = (char *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_OWORD *)a4 = *(_OWORD *)(v7 + 8);
    *(_QWORD *)(a4 + 16) = *((_QWORD *)v7 + 3);
  }
  else
  {
    *(_DWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
  }

}

void __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_3(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void *v5;
  void *v6;
  __int128 v7;
  char *v8;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, a3, 4);
  objc_msgSend(v5, "valueForKey:", v6);
  v8 = (char *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v7 = *(_OWORD *)(v8 + 24);
    *(_OWORD *)a4 = *(_OWORD *)(v8 + 8);
    *(_OWORD *)(a4 + 16) = v7;
    *(_QWORD *)(a4 + 32) = *((_QWORD *)v8 + 5);
  }
  else
  {
    *(_DWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
  }

}

BOOL __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, a3, 4);
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

uint64_t __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "bindName:", a2);
}

+ (id)executor
{
  return objc_alloc_init(LWCRExecutor);
}

@end
