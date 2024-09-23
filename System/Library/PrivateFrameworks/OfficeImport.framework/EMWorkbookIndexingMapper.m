@implementation EMWorkbookIndexingMapper

- (void)finishMappingWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EMWorkbookIndexingMapper;
  -[CMIndexingMapper finishMappingWithState:](&v14, sel_finishMappingWithState_, v4);
  -[CMMapper document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "strings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v7, "count"); ++i)
  {
    objc_msgSend(v7, "objectAtIndex:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

  }
  objc_msgSend(v4, "textContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:", v13);

}

- (void)mapElement:(id)a3 atIndex:(unint64_t)a4 withState:(id)a5 isLastElement:(BOOL)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v14;
    if ((objc_msgSend(v8, "isHidden") & 1) == 0)
    {
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v7, "textContent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendString:", v12);

        objc_msgSend(v7, "textContent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendString:", CFSTR("\n"));

      }
    }

  }
}

@end
