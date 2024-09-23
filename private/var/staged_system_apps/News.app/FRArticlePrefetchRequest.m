@implementation FRArticlePrefetchRequest

- (void)addPrefetchOperationsToOrderedSet:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  FRFlintArticlePrefetchOperation *v7;
  void *v8;
  FRFlintArticlePrefetchOperation *v9;
  FRFlintArticlePrefetchOperation *v10;
  void *v11;
  FRFlintArticlePrefetchOperation *v12;
  FRFlintArticlePrefetchOperation *v13;
  void *v14;
  FRFlintArticlePrefetchOperation *v15;
  unsigned __int8 v16;
  FRFlintArticlePrefetchOperation *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  FRWebArticlePrefetchOperation *v23;
  id v24;
  id v25;

  v25 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchRequest headline](self, "headline"));
  v5 = objc_msgSend(v4, "contentType");

  if (v5 == (id)1)
  {
    v23 = [FRWebArticlePrefetchOperation alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchRequest headline](self, "headline"));
    v19 = -[FRArticlePrefetchRequest priority](self, "priority");
    v20 = v23;
    v21 = v18;
    v22 = 4;
    goto LABEL_6;
  }
  v6 = v25;
  if (v5 == (id)2)
  {
    v7 = [FRFlintArticlePrefetchOperation alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchRequest headline](self, "headline"));
    v9 = -[FRArticlePrefetchOperation initWithHeadline:component:priority:](v7, "initWithHeadline:component:priority:", v8, 0, -[FRArticlePrefetchRequest priority](self, "priority"));
    objc_msgSend(v25, "addObject:", v9);

    v10 = [FRFlintArticlePrefetchOperation alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchRequest headline](self, "headline"));
    v12 = -[FRArticlePrefetchOperation initWithHeadline:component:priority:](v10, "initWithHeadline:component:priority:", v11, 1, -[FRArticlePrefetchRequest priority](self, "priority"));
    objc_msgSend(v25, "addObject:", v12);

    v13 = [FRFlintArticlePrefetchOperation alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchRequest headline](self, "headline"));
    v15 = -[FRArticlePrefetchOperation initWithHeadline:component:priority:](v13, "initWithHeadline:component:priority:", v14, 2, -[FRArticlePrefetchRequest priority](self, "priority"));
    objc_msgSend(v25, "addObject:", v15);

    v16 = -[FRArticlePrefetchRequest options](self, "options");
    v6 = v25;
    if ((v16 & 1) != 0)
    {
      v17 = [FRFlintArticlePrefetchOperation alloc];
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchRequest headline](self, "headline"));
      v19 = -[FRArticlePrefetchRequest priority](self, "priority");
      v20 = v17;
      v21 = v18;
      v22 = 3;
LABEL_6:
      v24 = objc_msgSend(v20, "initWithHeadline:component:priority:", v21, v22, v19);
      objc_msgSend(v25, "addObject:", v24);

      v6 = v25;
    }
  }

}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (void)setHeadline:(id)a3
{
  objc_storeStrong((id *)&self->_headline, a3);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headline, 0);
}

@end
