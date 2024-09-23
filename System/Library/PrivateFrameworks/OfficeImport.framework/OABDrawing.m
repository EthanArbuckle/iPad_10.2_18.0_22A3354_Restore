@implementation OABDrawing

+ (id)readDrawablesFromDrawing:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "eshObject");
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8) == 61442
    && (unint64_t)objc_msgSend(v6, "childCount") >= 2)
  {
    objc_msgSend(v6, "childAt:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "eshObject");
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11) == 61443
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      +[OABDrawable readDrawablesFromContainer:state:](OABDrawable, "readDrawablesFromContainer:state:", v10, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstChildOfType:", 61445);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(a1, "applyRulesFromSolverContainer:state:", v12, v7);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)readBackgroundPropertiesFromDrawing:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  OABFillPropertiesManager *v7;
  const void *v8;
  OADBackgroundProperties *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v5, "childCount") < 3)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "childAt:", 2);
    v7 = (OABFillPropertiesManager *)objc_claimAutoreleasedReturnValue();
    v8 = (const void *)-[OABFillPropertiesManager eshObject](v7, "eshObject");
    if (!v8)
    {
      v9 = 0;
      goto LABEL_7;
    }

    if (v9)
    {
      v7 = -[OABFillPropertiesManager initWithFill:shapeType:masterShape:]([OABFillPropertiesManager alloc], "initWithFill:shapeType:masterShape:", &v9[12].mEffects, 1, 0);
      +[OABFill readFillFromFillPropertiesManager:state:](OABFill, "readFillFromFillPropertiesManager:state:", v7, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(OADBackgroundProperties);
      -[OADBackgroundProperties setFill:](v9, "setFill:", v10);

LABEL_7:
    }
  }

  return v9;
}

+ (void)applyRulesFromSolverContainer:(id)a3 state:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  if (v14)
  {
    v6 = objc_msgSend(v14, "childCount");
    if (v6)
    {
      v7 = 0;
      do
      {
        objc_msgSend(v14, "childAt:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (unsigned int *)objc_msgSend(v8, "eshObject");
        if ((*(unsigned int (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9) == 61458)
        {
          objc_msgSend(v5, "drawableForShapeId:", v9[10]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "connectorProperties");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "from");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setDrawableId:", v9[8]);
            objc_msgSend(v12, "setLocationIndex:", v9[11]);
            objc_msgSend(v11, "to");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setDrawableId:", v9[9]);
            objc_msgSend(v13, "setLocationIndex:", v9[12]);

          }
        }

        ++v7;
      }
      while (v6 != v7);
    }
  }

}

+ (unsigned)addShapeIdForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  _DWORD *v10;
  unsigned int v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    do
    {
      v6 = objc_msgSend(v5, "eshObject");
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6) == 61442)
        break;
      objc_msgSend(v5, "parent");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "childAt:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const void *)objc_msgSend(v8, "eshObject");
  if (!v9)
  {

    goto LABEL_11;
  }

  if (!v10)
  {
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v11 = v10[8] + 1;
  ++v10[7];
  v10[8] = v11;
LABEL_12:

  return v11;
}

@end
