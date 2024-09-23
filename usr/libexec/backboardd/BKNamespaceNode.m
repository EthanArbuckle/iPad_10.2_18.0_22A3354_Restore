@implementation BKNamespaceNode

- (BKNamespaceNode)init
{
  BKNamespaceNode *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *subnodes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKNamespaceNode;
  v2 = -[BKNamespaceNode init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    subnodes = v2->_subnodes;
    v2->_subnodes = v3;

  }
  return v2;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "build"));

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  NSObject *object;
  char v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3));
  v5 = objc_msgSend(v4, "appendObject:withName:", self->_name, CFSTR("name"));
  object = self->_object;
  if (object)
  {
    v7 = objc_opt_respondsToSelector(object, "succinctDescription");
    v8 = self->_object;
    if ((v7 & 1) != 0)
      v9 = objc_claimAutoreleasedReturnValue(-[NSObject succinctDescription](v8, "succinctDescription"));
    else
      v9 = objc_claimAutoreleasedReturnValue(-[NSObject description](v8, "description"));
    v10 = (void *)v9;
    v11 = objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("object"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_subnodes, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeMultilinePrefix"));
  objc_msgSend(v4, "appendArraySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", v12, CFSTR("subnodes"), v13, 1, &stru_1000ECFA8);

  return v4;
}

- (id)description
{
  return -[BKNamespaceNode descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSString *name;
  void *v11;
  NSObject *object;
  void *v13;

  v4 = a3;
  v6 = objc_opt_class(NSString, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && (-[NSString isEqual:](self->_name, "isEqual:", v4) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = objc_opt_class(self, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0
      && (name = self->_name,
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name")),
          LODWORD(name) = -[NSString isEqual:](name, "isEqual:", v11),
          v11,
          (_DWORD)name))
    {
      object = self->_object;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
      v8 = -[NSObject isEqual:](object, "isEqual:", v13);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)removeNodeAtKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1000956C8;
  v13 = sub_1000956D8;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000956E0;
  v8[3] = &unk_1000ECFD0;
  v8[4] = &v9;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode enumerateKeyPathNodes:options:ifFound:ifMissing:](self, "enumerateKeyPathNodes:options:ifFound:ifMissing:", v4, 0, v8, 0));
  if (v5)
  {
    v6 = (void *)v10[5];
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subnodes"));
      objc_msgSend(v7, "removeObject:", v5);

    }
  }

  _Block_object_dispose(&v9, 8);
}

- (id)nodeAtKeyPath:(id)a3
{
  return -[BKNamespaceNode enumerateKeyPathNodes:options:ifFound:ifMissing:](self, "enumerateKeyPathNodes:options:ifFound:ifMissing:", a3, 0, 0, 0);
}

- (id)objectAtKeyPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode nodeAtKeyPath:](self, "nodeAtKeyPath:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));

  return v4;
}

- (id)setObject:(id)a3 atKeyPath:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode enumerateKeyPathNodes:options:ifFound:ifMissing:](self, "enumerateKeyPathNodes:options:ifFound:ifMissing:", a4, 0, 0, &stru_1000ED010));
  objc_msgSend(v7, "setObject:", v6);

  return v7;
}

- (id)enumerateKeyPathNodes:(id)a3 options:(int64_t)a4 ifFound:(id)a5 ifMissing:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(".")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode _enumerateKeyPathNodesByComponent:options:ifFound:ifMissing:](self, "_enumerateKeyPathNodesByComponent:options:ifFound:ifMissing:", v12, a4, v11, v10));

  return v13;
}

- (void)dumpNodeTree
{
  -[BKNamespaceNode _dumpNodeTree:level:](self, "_dumpNodeTree:level:", self->_subnodes, 0);
}

- (void)_enumerateNodesWithOptions:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  NSMutableOrderedSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a4;
  v7 = v6;
  if ((a3 & 2) != 0)
  {
    if (((a3 & 1) == 0 || self->_object) && (*((uint64_t (**)(id, BKNamespaceNode *))v6 + 2))(v6, self))
      goto LABEL_14;
  }
  else
  {
    a3 |= 2uLL;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_subnodes;
  v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "_enumerateNodesWithOptions:usingBlock:", a3, v7, (_QWORD)v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

LABEL_14:
}

- (id)_enumerateKeyPathNodesByComponent:(id)a3 options:(int64_t)a4 ifFound:(id)a5 ifMissing:(id)a6
{
  id v9;
  NSMutableOrderedSet *v10;
  BKNamespaceNode *v11;
  id v12;
  id v13;
  BKNamespaceNode *v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  BKNamespaceNode *v18;
  NSMutableOrderedSet *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  BKNamespaceNode *v29;
  char v31;
  uint64_t (**v32)(id, _QWORD, void *, BOOL);
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v31 = a4;
  v9 = a3;
  v33 = a5;
  v32 = (uint64_t (**)(id, _QWORD, void *, BOOL))a6;
  v10 = self->_subnodes;
  v11 = self;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v36;
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))v33;
    while (2)
    {
      v17 = 0;
      v18 = v11;
      v11 = v14;
      v19 = v10;
      do
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v17);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet set](v19, "set"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "member:", v20));
        v23 = v22;
        if (v22)
        {
          if (v16)
          {
            if ((v31 & 1) == 0
              || (v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "object")), v24, v24))
            {
              ((void (**)(_QWORD, void *, BKNamespaceNode *))v16)[2](v16, v23, v18);
            }
          }
          v25 = v23;
        }
        else
        {
          if (!v32
            || (v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet lastObject](v19, "lastObject")),
                v27 = ((uint64_t (**)(id, void *, void *, BOOL))v32)[2](v32, v20, v18, v20 == v26),
                v25 = (id)objc_claimAutoreleasedReturnValue(v27),
                v26,
                !v25))
          {

            v29 = 0;
            v11 = v18;
            v10 = v19;
            goto LABEL_20;
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode subnodes](v18, "subnodes"));
          objc_msgSend(v28, "addObject:", v25);

          v16 = (void (**)(_QWORD, _QWORD, _QWORD))v33;
        }
        v11 = (BKNamespaceNode *)v25;

        v10 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode subnodes](v11, "subnodes"));
        v17 = (char *)v17 + 1;
        v18 = v11;
        v19 = v10;
      }
      while (v13 != v17);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      v14 = v11;
      v29 = v11;
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v29 = 0;
LABEL_20:
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))v33;
  }

  return v29;
}

- (void)_dumpNodeTree:(id)a3 level:(int64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  int64_t v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  BKNamespaceNode *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  v6 = a3;
  v7 = sub_1000598B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((int)a4 <= 16)
      v9 = 2 * a4;
    else
      v9 = 32;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode name](self, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKNamespaceNode object](self, "object"));
    *(_DWORD *)buf = 68158722;
    v26 = v9;
    v27 = 2080;
    v28 = "                                ";
    v29 = 2048;
    v30 = self;
    v31 = 2114;
    v32 = v10;
    v33 = 2114;
    v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%.*s%p %{public}@ %{public}@", buf, 0x30u);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = a4 + 1;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subnodes", (_QWORD)v20));
        objc_msgSend(v18, "_dumpNodeTree:level:", v19, v15);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (NSMutableOrderedSet)subnodes
{
  return self->_subnodes;
}

- (void)setSubnodes:(id)a3
{
  objc_storeStrong((id *)&self->_subnodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subnodes, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
