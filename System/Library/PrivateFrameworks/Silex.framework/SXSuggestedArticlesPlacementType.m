@implementation SXSuggestedArticlesPlacementType

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("conditional")) & 1) != 0)
  {
    v5 = &__block_literal_global_14;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXSuggestedArticlesPlacementType;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __71__SXSuggestedArticlesPlacementType_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("layout")))
  {
    objc_opt_class();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXSuggestedArticlesPlacementType;
    objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return (Class)v9;
}

- (unint64_t)themeWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = v5;
  if (a4 != 3)
    goto LABEL_8;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("dark")) & 1) == 0)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("light")) & 1) != 0)
    {
      v7 = 2;
      goto LABEL_9;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("white")) & 1) != 0)
    {
      v7 = 3;
      goto LABEL_9;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v7 = 1;
LABEL_9:

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; enabled: %d"),
    -[SXSuggestedArticlesPlacementType enabled](self, "enabled"));
  -[SXSuggestedArticlesPlacementType layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; layout: %@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("; theme: %lu"), -[SXSuggestedArticlesPlacementType theme](self, "theme"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

@end
