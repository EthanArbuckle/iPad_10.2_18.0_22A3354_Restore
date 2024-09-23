@implementation ODIPointIterator

+ (id)pointsForSpecification:(id)a3 startingPoint:(id)a4 isLast:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "attributesList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  while (1)
  {

    objc_msgSend(v11, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      break;
    objc_msgSend(a1, "processAttributes:startingPoint:isLast:", v10, v9, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      objc_msgSend(v12, "addObjectsFromArray:", v13);
    else
      v12 = v13;

  }
  return v12;
}

+ (id)processAttributes:(id)a3 startingPoint:(id)a4 isLast:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  _DWORD v20[2];
  int v21;
  int v22;
  id v23;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "start");
  if (v11 <= 1)
    v12 = 1;
  else
    v12 = v11;
  v20[0] = objc_msgSend(v8, "pointType");
  v13 = (v12 - 1);
  v20[1] = objc_msgSend(v8, "count") + v13;
  v21 = objc_msgSend(v8, "step");
  v22 = 0;
  v14 = v10;
  v23 = v14;
  v15 = v14;
  if (v21 >= 1)
  {
    v16 = objc_msgSend(v8, "axis");
    switch(v16)
    {
      case 7:
        objc_msgSend(a1, "processFollowingSiblingAxisFromPoint:state:", v9, v20);
        break;
      case 1:
        objc_msgSend(a1, "processChildAxisFromPoint:state:", v9, v20);
        break;
      case 0:
        objc_msgSend(a1, "processSelfAxisFromPoint:state:", v9, v20);
        break;
    }
    if ((_DWORD)v13 && objc_msgSend(v14, "count") > (unint64_t)v13)
      objc_msgSend(v14, "removeObjectsInRange:", 0, v13);
    if (v5)
    {
      if (objc_msgSend(v8, "hideLastTransition"))
      {
        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v14, "lastObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "type");

          if (v18 == 5 || v18 == 3)
            objc_msgSend(v14, "removeLastObject");
        }
      }
    }
    v15 = v23;
  }

  return v14;
}

+ (BOOL)addPoint:(id)a3 state:(ODIPointIteratorState *)a4
{
  id v6;
  char v7;
  int var3;

  v6 = a3;
  if ((objc_msgSend(a1, "isDoneForState:", a4) & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(a1, "isPoint:ofType:", v6, a4->var0))
  {
    var3 = a4->var3;
    if (var3)
    {
      v7 = 0;
      a4->var3 = var3 - 1;
    }
    else
    {
      objc_msgSend(a4->var4, "addObject:", v6);
      a4->var3 = a4->var2 - 1;
      v7 = objc_msgSend(a1, "isDoneForState:", a4);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isPoint:(id)a3 ofType:(int)a4
{
  id v5;
  void *v6;
  int v7;
  BOOL v8;
  BOOL v9;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "type");
    switch(a4)
    {
      case 0:
        v8 = 1;
        break;
      case 1:
        v9 = v7 == 1;
        goto LABEL_19;
      case 2:
        v9 = v7 == 2;
        goto LABEL_19;
      case 3:
        v8 = v7 == 5 || (v7 - 1) < 3;
        break;
      case 4:
        v9 = (v7 & 0xFFFFFFFB) == 0;
        goto LABEL_19;
      case 5:
        v9 = v7 == 0;
        goto LABEL_19;
      case 6:
        v8 = v7 != 0;
        break;
      case 7:
        v9 = v7 == 3;
        goto LABEL_19;
      case 8:
        v9 = v7 == 4;
        goto LABEL_19;
      case 9:
        v9 = v7 == 5;
LABEL_19:
        v8 = v9;
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isDoneForState:(ODIPointIteratorState *)a3
{
  return a3->var1 && objc_msgSend(a3->var4, "count") == a3->var1;
}

+ (void)processChildAxisFromPoint:(id)a3 state:(ODIPointIteratorState *)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    v9 = 0;
    while ((v8 & 1) == 0)
    {
      objc_msgSend(v7, "nextObject");
      v10 = objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v9 = 0;
        break;
      }
      v9 = (void *)v10;
      v8 = objc_msgSend(a1, "addPoint:state:", v10, a4);
    }

  }
}

+ (void)processFollowingSiblingAxisFromPoint:(id)a3 state:(ODIPointIteratorState *)a4
{
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "siblingTransition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addPoint:state:", v6, a4);

  }
}

@end
