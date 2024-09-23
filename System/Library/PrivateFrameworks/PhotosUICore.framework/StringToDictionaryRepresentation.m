@implementation StringToDictionaryRepresentation

void ___StringToDictionaryRepresentation_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v6 = objc_msgSend(v16, "isEqualToString:", &stru_1E5149688);
  v7 = v16;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("="));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 2)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSString *,id> * _Nullable _StringToDictionaryRepresentation(NSString *__strong)_block_invoke");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXCPLStatus_Serialization.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionaryRepresentation[key] == nil"));

      }
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v11, v9);

    }
    else
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = 0;

      *a4 = 1;
    }

    v7 = v16;
  }

}

@end
