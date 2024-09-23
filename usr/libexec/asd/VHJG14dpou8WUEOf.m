@implementation VHJG14dpou8WUEOf

- (VHJG14dpou8WUEOf)initWithZKQesNL3BCNYUjZw:(id)a3
{
  id v4;
  VHJG14dpou8WUEOf *v5;
  VHJG14dpou8WUEOf *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VHJG14dpou8WUEOf;
  v5 = -[VHJG14dpou8WUEOf init](&v22, "init");
  v6 = v5;
  if (v5)
  {
    -[VHJG14dpou8WUEOf setZKQesNL3BCNYUjZw:](v5, "setZKQesNL3BCNYUjZw:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[VHJG14dpou8WUEOf setExpressionDictionary:](v6, "setExpressionDictionary:", v7);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13, (_QWORD)v18));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionWithFormat:](NSExpression, "expressionWithFormat:", v14));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[VHJG14dpou8WUEOf expressionDictionary](v6, "expressionDictionary"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
  }

  return v6;
}

- (int64_t)Dp2N5iuaONVuK1T4:(id)a3 JMJGqFLtbMZn4EGN:(int64_t)a4 QsX3tfdMvsGwvY0F:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void (**v34)(id, void *);
  void *v35;
  id obj;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  void *v53;

  v10 = a3;
  v34 = (void (**)(id, void *))a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a5));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "passesOfStyles:", a4));

  v35 = v10;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("anyDate"), 0));
  v53 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sortedArrayUsingDescriptors:", v16));

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v17;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v40)
  {
    v37 = *(_QWORD *)v48;
    v38 = a5;
    v39 = v11;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v48 != v37)
          objc_enumerationMutation(obj);
        v41 = v18;
        v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[VHJG14dpou8WUEOf zKQesNL3BCNYUjZw](self, "zKQesNL3BCNYUjZw"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v20, "count")));

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[VHJG14dpou8WUEOf zKQesNL3BCNYUjZw](self, "zKQesNL3BCNYUjZw"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allKeys"));

        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(_QWORD *)v44 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_zKQesNL3BCNYUjZw, "objectForKeyedSubscript:", v27));
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_expressionDictionary, "objectForKeyedSubscript:", v27));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "evaluateWithAttribute:expression:", v28, v29));

              if (v30)
                objc_msgSend(v42, "setObject:forKeyedSubscript:", v30, v27);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          }
          while (v24);
        }

        v11 = v39;
        objc_msgSend(v39, "addObject:", v42);
        if (v38 && (unint64_t)objc_msgSend(v39, "count") >= v38)
        {

          goto LABEL_21;
        }

        v18 = v41 + 1;
      }
      while ((id)(v41 + 1) != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v40)
        continue;
      break;
    }
  }
LABEL_21:

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v11));
  v34[2](v34, v31);

  return 0;
}

- (NSMutableDictionary)zKQesNL3BCNYUjZw
{
  return self->_zKQesNL3BCNYUjZw;
}

- (void)setZKQesNL3BCNYUjZw:(id)a3
{
  objc_storeStrong((id *)&self->_zKQesNL3BCNYUjZw, a3);
}

- (NSMutableDictionary)expressionDictionary
{
  return self->_expressionDictionary;
}

- (void)setExpressionDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_expressionDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressionDictionary, 0);
  objc_storeStrong((id *)&self->_zKQesNL3BCNYUjZw, 0);
}

@end
