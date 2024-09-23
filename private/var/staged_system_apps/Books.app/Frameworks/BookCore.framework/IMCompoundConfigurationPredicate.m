@implementation IMCompoundConfigurationPredicate

+ (id)andPredicateWithSubpredicates:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithType:subpredicates:", 1, v4);

  return v5;
}

+ (id)orPredicateWithSubpredicates:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithType:subpredicates:", 0, v4);

  return v5;
}

- (IMCompoundConfigurationPredicate)initWithType:(unint64_t)a3 subpredicates:(id)a4
{
  id v7;
  IMCompoundConfigurationPredicate *v8;
  IMCompoundConfigurationPredicate *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IMCompoundConfigurationPredicate;
  v8 = -[IMConfigurationPredicate init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_subpredicates, a4);
  }

  return v9;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[IMCompoundConfigurationPredicate type](self, "type");
  v4 = CFSTR(" || ");
  if (v3 == 1)
    v4 = CFSTR(" && ");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMCompoundConfigurationPredicate subpredicates](self, "subpredicates"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@)"), v7));
  return v8;
}

- (BOOL)evaluateWithContext:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v4 = a3;
  v5 = -[IMCompoundConfigurationPredicate type](self, "type");
  if (!v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMCompoundConfigurationPredicate subpredicates](self, "subpredicates", 0));
    v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (!v12)
    {
LABEL_20:
      v11 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v13 = v12;
    v14 = *(_QWORD *)v18;
LABEL_14:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v14)
        objc_enumerationMutation(v6);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "evaluateWithContext:", v4) & 1) != 0)
        break;
      if (v13 == (id)++v15)
      {
        v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v13)
          goto LABEL_14;
        goto LABEL_20;
      }
    }
LABEL_22:
    v11 = 1;
    goto LABEL_23;
  }
  if (v5 == 1)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMCompoundConfigurationPredicate subpredicates](self, "subpredicates"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10), "evaluateWithContext:", v4))
          goto LABEL_20;
        if (v8 == (id)++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          v11 = 1;
          if (v8)
            goto LABEL_5;
          goto LABEL_23;
        }
      }
    }
    goto LABEL_22;
  }
  v11 = 0;
LABEL_24:

  return v11;
}

- (int64_t)score
{
  unint64_t v3;

  v3 = -[IMCompoundConfigurationPredicate type](self, "type");
  if (!v3)
    return -[IMCompoundConfigurationPredicate _orScore](self, "_orScore");
  if (v3 == 1)
    return -[IMCompoundConfigurationPredicate _andScore](self, "_andScore");
  return 0;
}

- (void)setScore:(int64_t)a3
{
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Can't set score on compound configurations"));
}

- (int64_t)_andScore
{
  void *v2;
  id v3;
  id v4;
  char *v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  char *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMCompoundConfigurationPredicate subpredicates](self, "subpredicates", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(v8, "score");
        v10 = (char *)objc_msgSend(v8, "score");
        if ((uint64_t)v9 < 1)
        {
          if ((uint64_t)v10 > (uint64_t)v5)
            v5 = (char *)objc_msgSend(v8, "score");
        }
        else
        {
          v5 = &v5[(_QWORD)v10];
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (int64_t)v5;
}

- (int64_t)_orScore
{
  void *v2;
  id v3;
  id v4;
  int64_t v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMCompoundConfigurationPredicate subpredicates](self, "subpredicates", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        if ((uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "score") > v5)
          v5 = 1;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)subpredicates
{
  return self->_subpredicates;
}

- (void)setSubpredicates:(id)a3
{
  objc_storeStrong((id *)&self->_subpredicates, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subpredicates, 0);
}

@end
