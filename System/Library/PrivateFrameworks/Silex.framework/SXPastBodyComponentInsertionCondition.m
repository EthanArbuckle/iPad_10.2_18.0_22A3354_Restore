@implementation SXPastBodyComponentInsertionCondition

- (void)prepareWithComponents:(id)a3 layoutProvider:(id)a4 DOMObjectProvider:(id)a5
{
  void *v7;
  id v8;
  CGRect v9;

  v8 = a4;
  -[SXPastBodyComponentInsertionCondition findFirstBodyComponentInComponents:](self, "findFirstBodyComponentInComponents:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v8, "frameForComponent:", v7);
    -[SXPastBodyComponentInsertionCondition setFirstBodyComponentThreshold:](self, "setFirstBodyComponentThreshold:", 0.0, CGRectGetMaxY(v9));
    -[SXPastBodyComponentInsertionCondition setFirstBodyComponent:](self, "setFirstBodyComponent:", v7);
  }

}

- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v6 = a3;
  objc_msgSend(v6, "approximateLocation");
  v8 = v7;
  -[SXPastBodyComponentInsertionCondition firstBodyComponentThreshold](self, "firstBodyComponentThreshold");
  if (v8 >= v9)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v6, "componentAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "targetComponentIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXPastBodyComponentInsertionCondition firstBodyComponent](self, "firstBodyComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqualToString:", v13);

  }
  return v14;
}

- (id)findFirstBodyComponentInComponents:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
      if (objc_msgSend(v8, "role") == 3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v8;
        objc_msgSend(v12, "components");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "NSArray");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXPastBodyComponentInsertionCondition findFirstBodyComponentInComponents:](self, "findFirstBodyComponentInComponents:", v14);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9)
        {

          goto LABEL_17;
        }
        goto LABEL_12;
      }
LABEL_13:
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_15;
      }
    }
    v9 = v8;
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11 >= 0x65)
      goto LABEL_17;
LABEL_12:

    goto LABEL_13;
  }
LABEL_15:
  v9 = 0;
LABEL_17:

  return v9;
}

- (SXComponent)firstBodyComponent
{
  return self->_firstBodyComponent;
}

- (void)setFirstBodyComponent:(id)a3
{
  objc_storeStrong((id *)&self->_firstBodyComponent, a3);
}

- (CGPoint)firstBodyComponentThreshold
{
  double x;
  double y;
  CGPoint result;

  x = self->_firstBodyComponentThreshold.x;
  y = self->_firstBodyComponentThreshold.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFirstBodyComponentThreshold:(CGPoint)a3
{
  self->_firstBodyComponentThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstBodyComponent, 0);
}

@end
