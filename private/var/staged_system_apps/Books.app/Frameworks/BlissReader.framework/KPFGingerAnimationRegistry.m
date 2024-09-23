@implementation KPFGingerAnimationRegistry

+ (id)supportedAnimations
{
  return &off_4699A0;
}

- (KPFGingerAnimationRegistry)init
{
  KPFGingerAnimationRegistry *v2;
  KPFGingerAnimationRegistry *v3;
  NSBundle *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  objc_class *v12;
  id v13;
  void *j;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *k;
  uint64_t v21;
  id v22;
  id obj;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];

  v39.receiver = self;
  v39.super_class = (Class)KPFGingerAnimationRegistry;
  v2 = -[KPFGingerAnimationRegistry init](&v39, "init");
  v3 = v2;
  if (v2)
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v2));
    v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v6 = objc_msgSend((id)objc_opt_class(v3), "supportedAnimations");
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          v12 = -[NSBundle classNamed:](v4, "classNamed:", v11);
          if (v12)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v8);
    }
    v13 = objc_msgSend(v5, "allValues");
    v3->mClassesForTypeAndName = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v13;
    v26 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v26)
    {
      v25 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j);
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v16 = objc_msgSend(v15, "supportedTypes");
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v28;
            do
            {
              for (k = 0; k != v18; k = (char *)k + 1)
              {
                if (*(_QWORD *)v28 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)k);
                v22 = -[NSMutableDictionary objectForKeyedSubscript:](v3->mClassesForTypeAndName, "objectForKeyedSubscript:", v21);
                if (!v22)
                {
                  v22 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v3->mClassesForTypeAndName, "setObject:forKeyedSubscript:", v22, v21);
                }
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, objc_msgSend(v15, "animationName"));
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
            }
            while (v18);
          }
        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v26);
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KPFGingerAnimationRegistry;
  -[KPFGingerAnimationRegistry dealloc](&v3, "dealloc");
}

- (id)p_animationTypeNumberFromString:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = KNAnimationTypeFromKPFAnimationType(a3);
  v4 = (void *)KNAnimationTypeAsNumber(v3);
  objc_msgSend(v4, "intValue");
  return v4;
}

- (Class)effectClassWithName:(id)a3 andType:(id)a4
{
  return (Class)objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->mClassesForTypeAndName, "objectForKeyedSubscript:", -[KPFGingerAnimationRegistry p_animationTypeNumberFromString:](self, "p_animationTypeNumberFromString:", a4)), "objectForKeyedSubscript:", a3);
}

- (BOOL)containsEffect:(id)a3 ofType:(id)a4
{
  return objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->mClassesForTypeAndName, "objectForKeyedSubscript:", -[KPFGingerAnimationRegistry p_animationTypeNumberFromString:](self, "p_animationTypeNumberFromString:", a4)), "objectForKeyedSubscript:", a3) != 0;
}

@end
