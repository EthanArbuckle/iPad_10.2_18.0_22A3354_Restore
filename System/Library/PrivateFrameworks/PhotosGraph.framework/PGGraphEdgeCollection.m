@implementation PGGraphEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (MAEdgeFilter)filter
{
  return (MAEdgeFilter *)objc_msgSend((id)objc_msgSend(a1, "edgeClass"), "filter");
}

+ (id)edgesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "edgesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)edgesOfType:(unint64_t)a3 onNodes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  objc_msgSend(a1, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PGGraphEdgeCollection;
  objc_msgSendSuper2(&v10, sel_edgesOfType_onNodes_matchingFilter_, a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)edgesOfType:(unint64_t)a3 betweenNodes:(id)a4 andNodes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "filter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___PGGraphEdgeCollection;
  objc_msgSendSuper2(&v13, sel_edgesOfType_betweenNodes_andNodes_matchingFilter_, a3, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)edgesFromNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PGGraphEdgeCollection;
  objc_msgSendSuper2(&v8, sel_edgesFromNodes_matchingFilter_, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)edgesToNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PGGraphEdgeCollection;
  objc_msgSendSuper2(&v8, sel_edgesToNodes_matchingFilter_, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)edgesFromNodes:(id)a3 toNodes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PGGraphEdgeCollection;
  objc_msgSendSuper2(&v11, sel_edgesFromNodes_toNodes_matchingFilter_, v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
