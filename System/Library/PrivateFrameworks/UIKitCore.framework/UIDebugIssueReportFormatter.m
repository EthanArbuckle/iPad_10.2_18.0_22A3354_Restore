@implementation UIDebugIssueReportFormatter

void __54___UIDebugIssueReportFormatter__componentsFromReport___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _UIDebugIssueReportFormatter *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a2;
  objc_msgSend(v5, "prefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultIssuePrefix");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v8;

  v9 = *(void **)(a1 + 40);
  objc_msgSend(v5, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("%@%@"), v19, v10);

  objc_msgSend(v5, "_subissueReport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "issues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v14)
      {
        v15 = objc_alloc_init(_UIDebugIssueReportFormatter);
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setIndentLevel:", 1);
        v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      objc_msgSend(v14, "stringFromReport:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\n%@"), v18);

    }
  }
  if (*(_QWORD *)(a1 + 56) - 1 > a3)
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\n"));

}

@end
