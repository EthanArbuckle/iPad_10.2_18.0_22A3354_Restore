@implementation BICMemoryImageSet

- (BICMemoryImageSet)init
{
  BICMemoryImageSet *v2;
  BICMemoryImageSet *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BICMemoryImageSet;
  v2 = -[BICMemoryImageSet init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    -[BICMemoryImageSet setImageColorARGBHex:](v2, "setImageColorARGBHex:", 0xFFFFFFLL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    -[BICMemoryImageSet setImageEntries:](v3, "setImageEntries:", v4);

  }
  return v3;
}

- (void)deleteEntry:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v4;
  _QWORD v5[5];
  id v6;

  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3F504;
  v5[3] = &unk_28B808;
  v5[4] = self;
  v6 = a3;
  v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_3F504((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);

}

- (void)addEntry:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v4;
  _QWORD v5[5];
  id v6;

  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3F5EC;
  v5[3] = &unk_28B808;
  v5[4] = self;
  v6 = a3;
  v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_3F5EC((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);

}

- (id)primaryEntry
{
  NSMutableArray *v3;
  os_unfair_lock_s *p_accessLock;
  _QWORD *v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSMutableArray *v12;
  id v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *j;
  void *v18;
  id v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  void (*v31)(uint64_t);
  void *v32;
  BICMemoryImageSet *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v3 = objc_opt_new(NSMutableArray);
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_3F960;
  v39 = sub_3F970;
  v40 = 0;
  p_accessLock = &self->_accessLock;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v31 = sub_3F978;
  v32 = &unk_28B700;
  v33 = self;
  v34 = &v35;
  v5 = v30;
  os_unfair_lock_lock(p_accessLock);
  v31((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = (id)v36[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "potentialPrimary"))
        {
          if (v8 == objc_msgSend(v11, "quality"))
          {
            -[NSMutableArray addObject:](v3, "addObject:", v11);
          }
          else if (v8 < objc_msgSend(v11, "quality"))
          {
            -[NSMutableArray removeAllObjects](v3, "removeAllObjects");
            -[NSMutableArray addObject:](v3, "addObject:", v11);
            v8 = objc_msgSend(v11, "quality");
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v7);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v3;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v41, 16);
  if (v13)
  {
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
        if (v14 < (int)objc_msgSend(v18, "level", (_QWORD)v22))
        {
          v19 = v18;

          v14 = (int)objc_msgSend(v19, "level");
          v15 = v19;
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v41, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 0;
  }

  v20 = v15;
  _Block_object_dispose(&v35, 8);

  return v20;
}

- (id)imageColor
{
  void *v3;

  if ((id)-[BICMemoryImageSet imageColorARGBHex](self, "imageColorARGBHex") == (id)0xFFFFFF)
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_colorWithARGBHexValue:](UIColor, "bc_colorWithARGBHexValue:", -[BICMemoryImageSet imageColorARGBHex](self, "imageColorARGBHex")));
  return v3;
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->identifier, a3);
}

- (int)requestCount
{
  return self->requestCount;
}

- (void)setRequestCount:(int)a3
{
  self->requestCount = a3;
}

- (BOOL)actualAspectRatio
{
  return self->actualAspectRatio;
}

- (void)setActualAspectRatio:(BOOL)a3
{
  self->actualAspectRatio = a3;
}

- (float)heightForAspectRatio
{
  return self->heightForAspectRatio;
}

- (void)setHeightForAspectRatio:(float)a3
{
  self->heightForAspectRatio = a3;
}

- (float)widthForAspectRatio
{
  return self->widthForAspectRatio;
}

- (void)setWidthForAspectRatio:(float)a3
{
  self->widthForAspectRatio = a3;
}

- (int64_t)imageColorARGBHex
{
  return self->imageColorARGBHex;
}

- (void)setImageColorARGBHex:(int64_t)a3
{
  self->imageColorARGBHex = a3;
}

- (NSDate)dateRequested
{
  return self->dateRequested;
}

- (void)setDateRequested:(id)a3
{
  objc_storeStrong((id *)&self->dateRequested, a3);
}

- (NSSet)imageEntries
{
  return self->imageEntries;
}

- (void)setImageEntries:(id)a3
{
  objc_storeStrong((id *)&self->imageEntries, a3);
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(os_unfair_lock_s)a3
{
  self->_accessLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->imageEntries, 0);
  objc_storeStrong((id *)&self->dateRequested, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
