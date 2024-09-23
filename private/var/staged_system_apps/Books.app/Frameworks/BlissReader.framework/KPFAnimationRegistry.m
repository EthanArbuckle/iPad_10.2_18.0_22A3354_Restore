@implementation KPFAnimationRegistry

+ (id)supportedAnimations
{
  return &off_469880;
}

- (KPFAnimationRegistry)init
{
  KPFAnimationRegistry *v2;
  uint64_t v3;
  KPFAnimationRegistry *v4;
  NSBundle *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v29.receiver = self;
  v29.super_class = (Class)KPFAnimationRegistry;
  v2 = -[KPFAnimationRegistry init](&v29, "init");
  v4 = v2;
  if (v2)
  {
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v2, v3));
    v6 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v8 = objc_msgSend((id)objc_opt_class(v4, v7), "supportedAnimations");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v14 = -[NSBundle classNamed:](v5, "classNamed:", v13);
          if (v14)
            objc_msgSend(v6, "setObject:forKey:", v14, v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v10);
    }
    v15 = objc_msgSend(v6, "allValues");
    v4->mClassesForAnimationName = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          -[NSMutableDictionary setObject:forKey:](v4->mClassesForAnimationName, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j), objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j), "animationName"));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      }
      while (v17);
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KPFAnimationRegistry;
  -[KPFAnimationRegistry dealloc](&v3, "dealloc");
}

- (Class)effectClassWithName:(id)a3
{
  return (Class)-[NSMutableDictionary objectForKeyedSubscript:](self->mClassesForAnimationName, "objectForKeyedSubscript:", a3);
}

- (BOOL)containsEffect:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->mClassesForAnimationName, "objectForKeyedSubscript:", a3) != 0;
}

@end
