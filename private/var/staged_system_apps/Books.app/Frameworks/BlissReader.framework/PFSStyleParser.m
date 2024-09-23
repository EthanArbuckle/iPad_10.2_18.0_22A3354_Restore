@implementation PFSStyleParser

+ (BOOL)parseCSSFrom:(const char *)a3 intoDict:(id)a4 fontDict:(id)a5 sourceUrl:(id)a6 pageCache:(id)a7
{
  _BYTE v8[32];

  if (a3)
    PFSStyleParserHandler::PFSStyleParserHandler((PFSStyleParserHandler *)v8, a3, (NSURL *)a6, (PFSPageCache *)a7);
  return 1;
}

+ (void)mergeCSSDict:(id)a3 intoCSSDict:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (a4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(a3);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v11 = objc_msgSend(a3, "objectForKey:", v10);
          v12 = objc_msgSend(a4, "objectForKey:", v10);
          if (v12)
            objc_msgSend(v12, "addEntriesFromDictionary:", v11);
          else
            objc_msgSend(a4, "setObject:forKey:", v11, v10);
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
  }
}

+ (void)mergeFontDict:(id)a3 intoFontDict:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (a4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(a3);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v11 = objc_msgSend(a3, "objectForKey:", v10);
          v12 = objc_msgSend(a4, "objectForKey:", v10);
          if (v12)
            objc_msgSend(v12, "addEntriesFromDictionary:", v11);
          else
            objc_msgSend(a4, "setObject:forKey:", v11, v10);
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
  }
}

+ (BOOL)mediaListIncludesScreen:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = objc_msgSend(a3, "count");
  if (v4)
  {
    v5 = 0;
    while (1)
    {
      v6 = objc_msgSend(a3, "objectAtIndex:", v5);
      if ((objc_msgSend(v6, "isEqualToString:", PFXStrAll) & 1) != 0
        || objc_msgSend(v6, "isEqualToString:", PFXStrScreen))
      {
        break;
      }
      if (++v5 >= (unint64_t)objc_msgSend(a3, "count"))
      {
        LOBYTE(v4) = 0;
        return (char)v4;
      }
    }
    LOBYTE(v4) = 1;
  }
  return (char)v4;
}

+ (id)newFullUri:(id)a3 sourceUrl:(id)a4
{
  NSString *v5;

  v5 = (NSString *)a3;
  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("#")) & 1) == 0)
    v5 = -[NSString substringFromIndex:](-[NSURL path](-[NSURL absoluteURL](+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v5, a4), "absoluteURL"), "path"), "substringFromIndex:", 1);
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("url(%@)"), v5);
}

@end
