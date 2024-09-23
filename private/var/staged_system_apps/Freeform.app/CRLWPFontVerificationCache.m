@implementation CRLWPFontVerificationCache

- (CRLWPFontVerificationCache)init
{
  CRLWPFontVerificationCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *verifiedFonts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLWPFontVerificationCache;
  v2 = -[CRLWPFontVerificationCache init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    verifiedFonts = v2->_verifiedFonts;
    v2->_verifiedFonts = v3;

  }
  return v2;
}

- (int64_t)statusForFontName:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_verifiedFonts, "objectForKeyedSubscript:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return (int64_t)v5;
}

- (void)setStatus:(int64_t)a3 forFontName:(id)a4
{
  id v6;
  NSMutableDictionary *verifiedFonts;
  id v8;

  if (a3)
  {
    v6 = a4;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_verifiedFonts, "setObject:forKeyedSubscript:");

  }
  else
  {
    verifiedFonts = self->_verifiedFonts;
    v8 = a4;
    -[NSMutableDictionary removeObjectForKey:](verifiedFonts, "removeObjectForKey:");
  }

}

- (void)setStatus:(int64_t)a3 forFontNames:(id)a4
{
  id v6;
  void *v7;
  id v8;
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
  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_verifiedFonts, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), (_QWORD)v13);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
  else
  {
    -[NSMutableDictionary removeObjectsForKeys:](self->_verifiedFonts, "removeObjectsForKeys:", v6);
  }

}

- (void)resetFontNames:(id)a3 withStatus:(int64_t)a4
{
  NSMutableDictionary *verifiedFonts;
  void *v6;
  id v7;

  if (a4)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPFontVerificationCache fontNamesWithStatus:](self, "fontNamesWithStatus:", a4));
    verifiedFonts = self->_verifiedFonts;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
    -[NSMutableDictionary removeObjectsForKeys:](verifiedFonts, "removeObjectsForKeys:", v6);

  }
}

- (void)resetFontNames:(id)a3 withStatusInSet:(id)a4
{
  NSMutableDictionary *verifiedFonts;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPFontVerificationCache fontNamesWithStatusInSet:](self, "fontNamesWithStatusInSet:", a4));
  verifiedFonts = self->_verifiedFonts;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  -[NSMutableDictionary removeObjectsForKeys:](verifiedFonts, "removeObjectsForKeys:", v6);

}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_verifiedFonts, "removeAllObjects");
}

- (id)fontNamesWithStatus:(int64_t)a3
{
  NSMutableDictionary *verifiedFonts;
  void *v4;
  _QWORD v6[5];

  if (a3)
  {
    verifiedFonts = self->_verifiedFonts;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100460D6C;
    v6[3] = &unk_10125FAC8;
    v6[4] = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysOfEntriesPassingTest:](verifiedFonts, "keysOfEntriesPassingTest:", v6));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }
  return v4;
}

- (id)fontNamesWithStatusInSet:(id)a3
{
  id v4;
  NSMutableDictionary *verifiedFonts;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  verifiedFonts = self->_verifiedFonts;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100460E24;
  v9[3] = &unk_10125FAF0;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysOfEntriesPassingTest:](verifiedFonts, "keysOfEntriesPassingTest:", v9));

  return v7;
}

- (id)filterFontNames:(id)a3 withStatus:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = objc_msgSend(a3, "mutableCopy");
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontVerificationCache fontNamesWithStatus:](self, "fontNamesWithStatus:", a4));
    objc_msgSend(v6, "intersectSet:", v7);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_verifiedFonts, "allKeys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
    objc_msgSend(v6, "minusSet:", v8);

  }
  v9 = objc_msgSend(v6, "copy");

  return v9;
}

- (id)filterFontNames:(id)a3 withStatusInSet:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100460F64;
  v8[3] = &unk_10125FB18;
  v8[4] = self;
  v9 = a4;
  v5 = v9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectsPassingTest:", v8));

  return v6;
}

- (id)filterFontNames:(id)a3 withoutStatus:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", &off_1012CC8B0, &off_1012CC8C8, &off_1012CC8E0, &off_1012CC8F8, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  objc_msgSend(v7, "removeObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontVerificationCache filterFontNames:withStatusInSet:](self, "filterFontNames:withStatusInSet:", v6, v7));
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiedFonts, 0);
}

@end
