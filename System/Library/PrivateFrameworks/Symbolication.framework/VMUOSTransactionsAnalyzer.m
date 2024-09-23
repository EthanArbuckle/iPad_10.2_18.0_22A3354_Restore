@implementation VMUOSTransactionsAnalyzer

- (const)analyzerName
{
  return "LONG-LIVED XPC TRANSACTIONS";
}

- (id)analysisSummaryWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  VMUProcessObjectGraph *graph;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  const char *v16;
  void *v17;
  VMUAnalyzerSummaryField *v18;
  VMUAnalyzerSummaryField *v19;
  void *v20;
  VMUAnalyzerSummaryField *v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  VMUAnalyzerSummaryField *v26;
  VMUAnalyzerSummaryField *v27;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  if (a3)
    *a3 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__5;
  v55 = __Block_byref_object_dispose__5;
  v56 = 0;
  -[VMUProcessObjectGraph realizedClasses](self->super._graph, "realizedClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke;
  v50[3] = &unk_1E4E01E98;
  v50[4] = &v51;
  objc_msgSend(v4, "enumerateInfosWithBlock:", v50);
  if (v52[5])
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invertedSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    graph = self->super._graph;
    v31[0] = v5;
    v31[1] = 3221225472;
    v31[2] = __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke_2;
    v31[3] = &unk_1E4E01EC0;
    v34 = &v51;
    v35 = &v42;
    v31[4] = self;
    v36 = &v46;
    v10 = v6;
    v32 = v10;
    v11 = v8;
    v33 = v11;
    v37 = &v38;
    -[VMUObjectGraph enumerateObjectsWithBlock:](graph, "enumerateObjectsWithBlock:", v31);
    v12 = (void *)objc_opt_new();
    if (objc_msgSend(v10, "count"))
    {
      if (*((_DWORD *)v39 + 6)
        && -[VMUProcessObjectGraph objectContentLevelForNodeLabels](self->super._graph, "objectContentLevelForNodeLabels") != 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Memory graph was not recorded with -fullContent so no transaction descriptions are available"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = [VMUAnalyzerSummaryField alloc];
        v13 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v21, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisDataKey[0], 0, v20, 0);
        objc_msgSend(v12, "addObject:", v13);

      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v10, "sortUsingComparator:", &__block_literal_global_7);
      v29 = (void *)v13;
      v30 = v12;
      v17 = (void *)objc_opt_new();
      v22 = 0;
      v23 = 0;
      while (objc_msgSend(v10, "count") > (unint64_t)v22)
      {
        if (v22 >= 5 && objc_msgSend(v10, "count") - 5 >= (unint64_t)v22)
        {
          if (v22 == 6)
            objc_msgSend(v17, "appendFormat:", CFSTR("%.*s...\n"), v23, "                ");
        }
        else
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "rangeOfString:", CFSTR("]"));
          if ((unint64_t)(v47[3] - v25) >= 7)
            v23 = 7;
          else
            v23 = v47[3] - v25;
          objc_msgSend(v17, "appendFormat:", CFSTR("%.*s%@\n"), v23, "                ", v24, v29);

        }
        ++v22;
      }
      v12 = v30;
      v26 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]([VMUAnalyzerSummaryField alloc], "initWithKey:numericalValue:objectValue:fieldType:", CFSTR("Count"), objc_msgSend(v10, "count"), 0, 1);

      objc_msgSend(v30, "addObject:", v26);
      v27 = [VMUAnalyzerSummaryField alloc];
      v19 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v27, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisDataKey[0], 0, v17, 0);

      objc_msgSend(v30, "addObject:", v19);
    }
    else
    {
      v15 = *((_DWORD *)v43 + 6);
      if (!v15)
      {
        v14 = 0;
        goto LABEL_27;
      }
      v16 = "transactions exist";
      if (v15 == 1)
        v16 = "transaction exists";
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u %s but no object content labels are available to determine the duration or description."), *((unsigned int *)v43 + 6), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = [VMUAnalyzerSummaryField alloc];
      v19 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v18, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisDataKey[0], 0, v17, 0);
      objc_msgSend(v12, "addObject:", v19);
    }
    v14 = v12;

LABEL_27:
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);
    goto LABEL_28;
  }
  v14 = 0;
LABEL_28:

  _Block_object_dispose(&v51, 8);
  return v14;
}

void __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "infoType") == 1)
  {
    objc_msgSend(v11, "className");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("OS_os_transaction")) & 1) != 0)
    {
      objc_msgSend(v11, "binaryName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("libxpc.dylib"));

      if (v10)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
        *a5 = 1;
      }
    }
    else
    {

    }
  }

}

void __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  _DWORD *v16;
  int v17;
  id v18;

  if (a3[1] >> 60 == 1 && a3[2] == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "labelForNode:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@  %#llx"), v6, *a3);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v18, "rangeOfString:", CFSTR("]"));
    v8 = v18;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v18, "substringFromIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      v11 = v10;

      if (v11 < 10.0)
      {
        v16 = (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        v17 = -1;
        v8 = v18;
      }
      else
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v13 = *(_QWORD *)(v12 + 24);
        if (v7 > v13)
          v13 = v7;
        *(_QWORD *)(v12 + 24) = v13;
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v18);
        objc_msgSend(v18, "substringFromIndex:", v7 + 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "rangeOfCharacterFromSet:", *(_QWORD *)(a1 + 48));

        v8 = v18;
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_12;
        v16 = (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        v17 = 1;
      }
      *v16 += v17;
    }
LABEL_12:

  }
}

uint64_t __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;

  v4 = a3;
  objc_msgSend(a2, "substringFromIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(v4, "substringFromIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "floatValue");
  v10 = v9;

  if (v7 > v10)
    return -1;
  else
    return v7 < v10;
}

@end
