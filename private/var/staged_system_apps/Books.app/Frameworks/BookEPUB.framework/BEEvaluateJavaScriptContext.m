@implementation BEEvaluateJavaScriptContext

- (void)addScriptToEvaluate:(id)a3 key:(id)a4 transform:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *scripts;
  NSMutableArray *v12;
  NSMutableArray *scriptKeyOrdered;
  NSMutableDictionary *v14;
  NSMutableDictionary *transforms;
  id v16;
  id v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v18, "length"))
  {
    if (!self->_scripts)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      scripts = self->_scripts;
      self->_scripts = v10;

    }
    if (!self->_scriptKeyOrdered)
    {
      v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      scriptKeyOrdered = self->_scriptKeyOrdered;
      self->_scriptKeyOrdered = v12;

    }
    if (!self->_transforms)
    {
      v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      transforms = self->_transforms;
      self->_transforms = v14;

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_scripts, "setObject:forKeyedSubscript:", v18, v8);
    -[NSMutableArray addObject:](self->_scriptKeyOrdered, "addObject:", v8);
    if (v9)
    {
      v16 = objc_msgSend(v9, "copy");
      v17 = objc_retainBlock(v16);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_transforms, "setObject:forKeyedSubscript:", v17, v8);

    }
  }

}

- (id)_jsonRepresentation
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_scriptKeyOrdered;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_scripts, "objectForKeyedSubscript:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: () => { return %@ }"), v9, v10, (_QWORD)v14));
        objc_msgSend(v3, "addObject:", v11);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));
  return v12;
}

- (id)_transformResults:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  BEEvaluateJavaScriptResultContext *v8;
  id v9;
  BEEvaluateJavaScriptResultContext *v10;
  BEEvaluateJavaScriptResultContext *v11;
  _QWORD v13[5];
  id v14;
  BEEvaluateJavaScriptResultContext *v15;

  v6 = a4;
  v7 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1E6C0;
  v13[3] = &unk_3781D0;
  v13[4] = self;
  v14 = v6;
  v8 = objc_opt_new(BEEvaluateJavaScriptResultContext);
  v15 = v8;
  v9 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

- (NSMutableDictionary)scripts
{
  return self->_scripts;
}

- (void)setScripts:(id)a3
{
  objc_storeStrong((id *)&self->_scripts, a3);
}

- (NSMutableArray)scriptKeyOrdered
{
  return self->_scriptKeyOrdered;
}

- (void)setScriptKeyOrdered:(id)a3
{
  objc_storeStrong((id *)&self->_scriptKeyOrdered, a3);
}

- (NSMutableDictionary)transforms
{
  return self->_transforms;
}

- (void)setTransforms:(id)a3
{
  objc_storeStrong((id *)&self->_transforms, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_scriptKeyOrdered, 0);
  objc_storeStrong((id *)&self->_scripts, 0);
}

@end
