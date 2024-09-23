@implementation WFWorkflowChangeset

- (WFWorkflowChangeset)initWithModifiedWorkflows:(id)a3 insertedWorkflows:(id)a4 removedWorkflows:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFWorkflowChangeset *v12;
  WFWorkflowChangeset *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFWorkflowChangeset;
  v12 = -[WFWorkflowChangeset init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modified, a3);
    objc_storeStrong((id *)&v13->_inserted, a4);
    objc_storeStrong((id *)&v13->_removed, a5);
  }

  return v13;
}

- (id)changesetForVisibleWorkflows
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFWorkflowChangeset *v13;

  -[WFWorkflowChangeset inserted](self, "inserted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[WFWorkflowChangeset modified](self, "modified");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[WFWorkflowChangeset removed](self, "removed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[WFWorkflowChangeset modified](self, "modified");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "if_compactMap:", &__block_literal_global_389);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "unionSet:", v10);
  objc_msgSend(v6, "minusSet:", v10);
  -[WFWorkflowChangeset inserted](self, "inserted");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_compactMap:", &__block_literal_global_104);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "minusSet:", v12);
  v13 = -[WFWorkflowChangeset initWithModifiedWorkflows:insertedWorkflows:removedWorkflows:]([WFWorkflowChangeset alloc], "initWithModifiedWorkflows:insertedWorkflows:removedWorkflows:", v6, v4, v8);

  return v13;
}

- (BOOL)isEmpty
{
  return !-[NSSet count](self->_modified, "count")
      && !-[NSSet count](self->_inserted, "count")
      && -[NSSet count](self->_removed, "count") == 0;
}

- (BOOL)isEqual:(id)a3
{
  WFWorkflowChangeset *v4;
  WFWorkflowChangeset *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (WFWorkflowChangeset *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WFWorkflowChangeset modified](self, "modified");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowChangeset modified](v5, "modified");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[WFWorkflowChangeset inserted](self, "inserted");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowChangeset inserted](v5, "inserted");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          -[WFWorkflowChangeset removed](self, "removed");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWorkflowChangeset removed](v5, "removed");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSSet)modified
{
  return self->_modified;
}

- (NSSet)inserted
{
  return self->_inserted;
}

- (NSSet)removed
{
  return self->_removed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removed, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
  objc_storeStrong((id *)&self->_modified, 0);
}

id __51__WFWorkflowChangeset_changesetForVisibleWorkflows__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if ((objc_msgSend(v2, "isDeleted") & 1) != 0 || objc_msgSend(v2, "hiddenFromLibraryAndSync"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id __51__WFWorkflowChangeset_changesetForVisibleWorkflows__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if ((objc_msgSend(v2, "isDeleted") & 1) != 0 || objc_msgSend(v2, "hiddenFromLibraryAndSync"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

@end
