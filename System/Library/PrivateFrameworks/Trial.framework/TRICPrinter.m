@implementation TRICPrinter

+ (void)_printAndLogString:(id)a3 error:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v4)
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardError");
    else
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardOutput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);

  }
  objc_autoreleasePoolPop(v6);
  TRILogCategory_InternalTool();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4)
    v11 = OS_LOG_TYPE_ERROR;
  else
    v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v9, v11))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_19B89C000, v10, v11, "%@", (uint8_t *)&v12, 0xCu);
  }

}

+ (void)printNewlineUsingStderr:(BOOL)a3 format:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, &v11);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\n"), v7);
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a3)
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardError");
    else
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardOutput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);

  }
}

+ (void)printAndLogDefaultWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  objc_msgSend(a1, "_printAndLogString:error:", v6, 0);
}

+ (void)printAndLogErrorWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  objc_msgSend(a1, "_printAndLogString:error:", v6, 1);
}

+ (void)printNewlineAndLogDefaultWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v8);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\n"), v6);
  objc_msgSend(a1, "_printAndLogString:error:", v7, 0);

}

+ (void)printNewlineAndLogErrorWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v8);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\n"), v6);
  objc_msgSend(a1, "_printAndLogString:error:", v7, 1);

}

+ (void)printTabularWithLogDefaultForLines:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v17 = a1;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
    if (v6)
    {
      v8 = v6;
      do
      {
        objc_msgSend(v7, "addObject:", &unk_1E3C194D8);
        --v8;
      }
      while (v8);
    }
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v4;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    v10 = MEMORY[0x1E0C809B0];
    if (v9)
    {
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v13, "count") != v6)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[TRICPrinter printTabularWithLogDefaultForLines:]");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("TRICPrinter.m"), 97, CFSTR("Tabular data has mismatched column counts"));

          }
          v23[0] = v10;
          v23[1] = 3221225472;
          v23[2] = __50__TRICPrinter_printTabularWithLogDefaultForLines___block_invoke;
          v23[3] = &unk_1E3BFE9A0;
          v24 = v7;
          v25 = v30;
          objc_msgSend(v13, "enumerateObjectsUsingBlock:", v23);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v9);
    }

    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __50__TRICPrinter_printTabularWithLogDefaultForLines___block_invoke_2;
    v19[3] = &unk_1E3BFE9F0;
    v21 = v6;
    v22 = v17;
    v14 = v7;
    v20 = v14;
    objc_msgSend(obj, "enumerateObjectsUsingBlock:", v19);

    _Block_object_dispose(v30, 8);
  }

}

void __50__TRICPrinter_printTabularWithLogDefaultForLines___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v5 = (objc_class *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  v7 = [v5 alloc];
  v8 = objc_msgSend(v6, "length");
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (v8 <= v10)
    v11 = v10;
  else
    v11 = v8;
  v12 = (void *)objc_msgSend(v7, "initWithUnsignedInteger:", v11);
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v12, a3);

  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v14 = objc_msgSend(v6, "length");

  if (v13 <= v14)
    v15 = v14;
  else
    v15 = v13;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15;
}

void __50__TRICPrinter_printTabularWithLogDefaultForLines___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", *(_QWORD *)(a1 + 40));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__TRICPrinter_printTabularWithLogDefaultForLines___block_invoke_3;
  v12[3] = &unk_1E3BFE9C8;
  v15 = *(_QWORD *)(a1 + 48);
  v13 = *(id *)(a1 + 32);
  v11 = v7;
  v14 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("|"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "printNewlineAndLogDefaultWithFormat:", CFSTR("%@"), v8);
  if (!a3)
  {
    v9 = *(void **)(a1 + 48);
    objc_msgSend(v9, "_repeatString:length:", CFSTR("-"), objc_msgSend(v8, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "printNewlineAndLogDefaultWithFormat:", CFSTR("%@"), v10);

  }
}

void __50__TRICPrinter_printTabularWithLogDefaultForLines___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)a1[6];
  v6 = (void *)a1[4];
  v7 = a2;
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_repeatString:length:", CFSTR(" "), objc_msgSend(v8, "unsignedIntegerValue") - objc_msgSend(v7, "length"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)a1[5];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" %@%@ "), v7, v11);

  objc_msgSend(v9, "addObject:", v10);
}

+ (id)_repeatString:(id)a3 length:(unint64_t)a4
{
  id v5;
  void *i;

  v5 = a3;
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", objc_msgSend(v5, "length") * a4);
        a4;
        --a4)
  {
    objc_msgSend(i, "appendString:", v5);
  }

  return i;
}

@end
