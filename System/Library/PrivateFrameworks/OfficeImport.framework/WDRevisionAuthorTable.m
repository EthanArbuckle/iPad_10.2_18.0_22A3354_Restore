@implementation WDRevisionAuthorTable

- (WDRevisionAuthorTable)initWithDocument:(id)a3
{
  id v4;
  WDRevisionAuthorTable *v5;
  WDRevisionAuthorTable *v6;
  NSMutableArray *v7;
  NSMutableArray *mAuthors;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDRevisionAuthorTable;
  v5 = -[WDRevisionAuthorTable init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mAuthors = v6->mAuthors;
    v6->mAuthors = v7;

  }
  return v6;
}

- (id)authors
{
  return self->mAuthors;
}

- (unint64_t)authorCount
{
  return -[NSMutableArray count](self->mAuthors, "count");
}

- (id)authorAt:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[NSMutableArray count](self->mAuthors, "count") <= a3)
  {
    TCBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->mAuthors, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)addAuthor:(id)a3
{
  -[NSMutableArray addObject:](self->mAuthors, "addObject:", a3);
}

- (unint64_t)authorAddLookup:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if (v4 && (-[NSMutableArray containsObject:](self->mAuthors, "containsObject:", v4) & 1) == 0)
    -[WDRevisionAuthorTable addAuthor:](self, "addAuthor:", v4);
  v5 = -[NSMutableArray indexOfObject:](self->mAuthors, "indexOfObject:", v4);

  return v5;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDRevisionAuthorTable;
  -[WDRevisionAuthorTable description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mAuthors, 0);
}

@end
