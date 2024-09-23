@implementation _TUIImageResourceUnsizedCacheSet

- (_TUIImageResourceUnsizedCacheSet)init
{
  _TUIImageResourceUnsizedCacheSet *v2;
  _TUIImageResourceUnsizedCacheSet *v3;
  NSHashTable *v4;
  NSHashTable *set;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TUIImageResourceUnsizedCacheSet;
  v2 = -[_TUIImageResourceUnsizedCacheSet init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_setLock._os_unfair_lock_opaque = 0;
    v4 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 517, 1);
    set = v3->_set;
    v3->_set = v4;

  }
  return v3;
}

- (void)addImageResource:(id)a3
{
  os_unfair_lock_s *p_setLock;
  id v5;

  if (a3)
  {
    p_setLock = &self->_setLock;
    v5 = a3;
    os_unfair_lock_lock_with_options(p_setLock, 0x10000);
    -[NSHashTable addObject:](self->_set, "addObject:", v5);

    os_unfair_lock_unlock(p_setLock);
  }
}

- (id)largestResourceWithContentAndNaturalSize:(CGSize)a3 contentsScale:(double)a4
{
  double height;
  double width;
  os_unfair_lock_s *p_setLock;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  void *i;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v31;
  id v32;
  id v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  height = a3.height;
  width = a3.width;
  p_setLock = &self->_setLock;
  os_unfair_lock_lock_with_options(&self->_setLock, 0x10000);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_set, "allObjects"));
  os_unfair_lock_unlock(p_setLock);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = width * a4;
    v15 = height * a4;
    v16 = *(_QWORD *)v36;
    v17 = 0.0;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v10);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v19, "naturalSize", (_QWORD)v35);
        v21 = v20;
        v23 = v22;
        objc_msgSend(v19, "contentsScale");
        v25 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageContentWithOptions:", 1));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "image"));

        if (v27)
        {
          v28 = v21 * v25;
          v29 = v23 * v25;
          if (v21 * v25 >= v14 && v29 >= v15)
          {
            v33 = v19;

            v13 = v33;
            goto LABEL_18;
          }
          v31 = v28 * v29;
          if (v28 * v29 > v17)
          {
            v32 = v19;

            v17 = v31;
            v13 = v32;
          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }
LABEL_18:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_set, 0);
}

@end
