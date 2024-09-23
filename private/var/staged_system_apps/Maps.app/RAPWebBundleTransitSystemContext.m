@implementation RAPWebBundleTransitSystemContext

- (NSDictionary)context
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleTransitSystemContext system](self, "system"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleTransitSystemContext system](self, "system"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("system"));

  }
  v6 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleTransitSystemContext lines](self, "lines", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11), "context"));
        objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    v13 = objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("lines"));

  }
  v14 = objc_msgSend(v3, "copy");

  return (NSDictionary *)v14;
}

- (NSString)system
{
  return self->_system;
}

- (void)setSystem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
  objc_storeStrong((id *)&self->_lines, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_system, 0);
}

@end
