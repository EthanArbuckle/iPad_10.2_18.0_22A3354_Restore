@implementation ODILayoutNode

- (ODILayoutNode)initWithLayoutNode:(id)a3 point:(id)a4
{
  id v6;
  ODILayoutNode *v7;
  id v9;
  char v10;

  v9 = a4;
  v10 = 1;
  v6 = v9;
  v7 = -[ODILayoutNode initWithLayoutNode:state:](self, "initWithLayoutNode:state:", a3, &v9);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChildren, 0);
  objc_storeStrong((id *)&self->mShape, 0);
  objc_storeStrong((id *)&self->mAlgorithm, 0);
  objc_storeStrong((id *)&self->mPoint, 0);
}

- (ODILayoutNode)initWithLayoutNode:(id)a3 state:(ODILayoutNodeState *)a4
{
  id v6;
  ODILayoutNode *v7;
  ODILayoutNode *v8;
  NSMutableArray *v9;
  NSMutableArray *mChildren;
  void *v11;
  ODILayoutNode *v12;

  v6 = a3;
  v7 = -[ODILayoutNode init](self, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->mPoint, a4->var0);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mChildren = v8->mChildren;
    v8->mChildren = v9;

    objc_msgSend(v6, "children");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ODILayoutNode processLayoutObjects:state:](v8, "processLayoutObjects:state:", v11, a4);

    v12 = v8;
  }

  return v8;
}

- (void)processLayoutObjects:(id)a3 state:(ODILayoutNodeState *)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v6, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ODILayoutNode processLayoutNode:state:](self, "processLayoutNode:state:", v7, a4);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[ODILayoutNode processChoose:state:](self, "processChoose:state:", v7, a4);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[ODILayoutNode processForEach:state:](self, "processForEach:state:", v7, a4);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[ODILayoutNode processAlgorithm:state:](self, "processAlgorithm:state:", v7, a4);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ODILayoutNode processShape:state:](self, "processShape:state:", v7, a4);
          }
        }
      }
    }

  }
}

- (void)processLayoutNode:(id)a3 state:(ODILayoutNodeState *)a4
{
  ODILayoutNode *v6;
  id v7;

  v7 = a3;
  v6 = -[ODILayoutNode initWithLayoutNode:state:]([ODILayoutNode alloc], "initWithLayoutNode:state:", v7, a4);
  -[NSMutableArray addObject:](self->mChildren, "addObject:", v6);

}

- (void)processChoose:(id)a3 state:(ODILayoutNodeState *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "whens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v11 = v6;
    v8 = objc_msgSend(v6, "count");
    v7 = v11;
    if (v8)
    {
      objc_msgSend(v11, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "children");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ODILayoutNode processLayoutObjects:state:](self, "processLayoutObjects:state:", v10, a4);

      v7 = v11;
    }
  }

}

- (void)processForEach:(id)a3 state:(ODILayoutNodeState *)a4
{
  id v6;
  _BOOL4 var1;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  id var0;
  id v15;
  id v16;
  id v17;

  v17 = a3;
  v6 = a4->var0;
  var1 = a4->var1;
  objc_msgSend(v17, "iteratorSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ODIPointIterator pointsForSpecification:startingPoint:isLast:](ODIPointIterator, "pointsForSpecification:startingPoint:isLast:", v8, v6, var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  objc_msgSend(v17, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    for (i = 0; i != v10; ++i)
    {
      objc_msgSend(v9, "objectAtIndex:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      var0 = a4->var0;
      a4->var0 = v13;

      a4->var1 = v10 - 1 == i;
      -[ODILayoutNode processLayoutObjects:state:](self, "processLayoutObjects:state:", v11, a4);
    }
  }
  v15 = a4->var0;
  a4->var0 = v6;
  v16 = v6;

  a4->var1 = var1;
}

- (void)processAlgorithm:(id)a3 state:(ODILayoutNodeState *)a4
{
  objc_storeStrong((id *)&self->mAlgorithm, a3);
}

- (void)processShape:(id)a3 state:(ODILayoutNodeState *)a4
{
  objc_storeStrong((id *)&self->mShape, a3);
}

@end
