@implementation TURecentsResults

- (id)allSearchItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;

  if (-[TUSearchResults numberOfSections](self, "numberOfSections") < 1)
  {
    v5 = 0;
  }
  else
  {
    -[TUSearchResults resultGroups](self, "resultGroups");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {

      v5 = 0;
    }

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  objc_super v8;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v8.receiver = self;
  v8.super_class = (Class)TURecentsResults;
  v6 = -[TUSearchResults copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v6)
    objc_msgSend(v5, "addSearchResults:", v6);

  return v5;
}

@end
