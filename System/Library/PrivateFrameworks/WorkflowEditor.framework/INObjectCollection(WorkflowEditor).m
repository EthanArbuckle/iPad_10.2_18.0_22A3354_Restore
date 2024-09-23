@implementation INObjectCollection(WorkflowEditor)

- (uint64_t)wf_objectCount
{
  void *v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  objc_msgSend(a1, "sections");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__INObjectCollection_WorkflowEditor__wf_objectCount__block_invoke;
  v4[3] = &unk_24EE24F10;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v4);

  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)wf_itemAtIndexPath:()WorkflowEditor
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  objc_msgSend(a1, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    getWFEditorLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "-[INObjectCollection(WorkflowEditor) wf_itemAtIndexPath:]";
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_226666000, v9, OS_LOG_TYPE_ERROR, "%s Illegal indexPath (section): %{public}@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_9;
  }
  objc_msgSend(a1, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "item");
  -[NSObject items](v9, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v10 >= v12)
  {
    getWFEditorLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "-[INObjectCollection(WorkflowEditor) wf_itemAtIndexPath:]";
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_226666000, v15, OS_LOG_TYPE_ERROR, "%s Illegal indexPath (item): %{public}@", (uint8_t *)&v17, 0x16u);
    }

LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  -[NSObject items](v9, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v14;
}

- (id)wf_filteredCollectionUsingBlock:()WorkflowEditor
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__INObjectCollection_WorkflowEditor__wf_filteredCollectionUsingBlock___block_invoke;
  v10[3] = &unk_24EE24F38;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_compactMap:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSections:", v7);
  objc_msgSend(v8, "setUsesIndexedCollation:", objc_msgSend(a1, "usesIndexedCollation"));

  return v8;
}

@end
