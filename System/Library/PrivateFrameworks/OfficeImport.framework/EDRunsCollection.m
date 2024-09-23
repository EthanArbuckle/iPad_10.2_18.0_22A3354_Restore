@implementation EDRunsCollection

- (void)addRun:(id)a3 baseStyle:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = -[EDCollection count](self, "count");
  if (v8)
  {
    -[EDCollection objectAtIndex:](self, "objectAtIndex:", v8 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(v7, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_6:
      v13.receiver = self;
      v13.super_class = (Class)EDRunsCollection;
      -[EDSortedCollection addObject:](&v13, sel_addObject_, v6);
      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if ((v12 & 1) == 0)
    goto LABEL_6;
LABEL_7:

}

@end
