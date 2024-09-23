@implementation TUIElementExpandable

+ (id)supportedAttributes
{
  if (qword_2CB360 != -1)
    dispatch_once(&qword_2CB360, &stru_23EC60);
  return (id)qword_2CB358;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIExpandableBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementExpandableBuilder, a2);
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB370 != -1)
    dispatch_once(&qword_2CB370, &stru_23EC80);
  return (id)qword_2CB368;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7;
  _TUIElementExpandableBuilder *v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = objc_alloc_init(_TUIElementExpandableBuilder);
  -[_TUIElementExpandableBuilder setBinding:](v8, "setBinding:", objc_msgSend(v7, "bindingNameForAttribute:node:", 36, a3.var0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForAttribute:node:", 152, a3.var0));
  -[_TUIElementExpandableBuilder setPointerRefId:](v8, "setPointerRefId:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pointerStyleForNode:", a3.var0));
  -[_TUIElementExpandableBuilder setPointerStyle:](v8, "setPointerStyle:", v10);

  return v8;
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  unsigned __int8 v17;
  int v18;
  int v19;
  uint64_t v20;
  void *i;
  void *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "finalizeModelsWithParent:box:context:", v7, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pointerRefId"));
  objc_msgSend(v7, "setPointerRefId:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pointerStyle"));
  objc_msgSend(v7, "setPointerStyle:", v12);

  v13 = objc_opt_new(NSMutableArray);
  v29 = v7;
  objc_msgSend(v7, "appendLayoutChildrenToArray:", v13);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v13;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = *(_QWORD *)v31;
    v27 = v9;
    v28 = v8;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v23 = objc_msgSend(v22, "role") == 0;
        if ((v23 & v19 & 1) != 0)
        {
          v26 = 1021;
          goto LABEL_14;
        }
        v24 = objc_msgSend(v22, "role") == (char *)&dword_0 + 2;
        if ((v24 & v18 & 1) != 0
          || (v25 = (char *)objc_msgSend(v22, "role"), ((v25 == (_BYTE *)&dword_4 + 1) & v17) != 0))
        {
          v26 = 1019;
LABEL_14:
          v9 = v27;
          objc_msgSend(v27, "reportError:", v26);
          v8 = v28;
          goto LABEL_15;
        }
        v19 |= v23;
        v18 |= v24;
        v17 |= v25 == (_BYTE *)&dword_4 + 1;
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v9 = v27;
      v8 = v28;
      if (v16)
        continue;
      break;
    }
  }
LABEL_15:

}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 builder:(id)a5 context:(id)a6 block:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  unsigned int v14;
  uint64_t v15;
  uint64_t var0;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(id, _QWORD))a7;
  v14 = objc_msgSend(v11, "binding");
  v15 = v14;
  if (TUINameIsValid(v14))
  {
    var0 = a3.var0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewStateForNode:binding:", a3.var0, v15));
    objc_msgSend(v19, "setViewState:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "instantiateBinding:withDynamicProvider:childrenOfNode:", v15, v17, var0));
    if (v18)
      objc_msgSend(v11, "addModel:", v18);

  }
  else
  {
    v13[2](v13, 0);
  }

}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)binding
{
  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)self->_binding;
}

@end
