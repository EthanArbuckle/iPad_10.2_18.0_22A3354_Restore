@implementation RAPTransitLine

- (id)_initWithTransitLine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "system"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artwork"));
  v9 = objc_msgSend(v4, "muid");

  v10 = -[RAPTransitLine _initWithName:systemName:artworkData:lineFeatureID:](self, "_initWithName:systemName:artworkData:lineFeatureID:", v5, v7, v8, v9);
  return v10;
}

- (id)_initWithName:(id)a3 systemName:(id)a4 artworkData:(id)a5 lineFeatureID:(unint64_t)a6
{
  id v6;

  if (a3)
    v6 = a3;
  else
    v6 = a4;
  return -[RAPTransitLine _initWithName:systemName:artworkData:lineFeatureID:primaryDescriptionText:secondaryDescriptionText:](self, "_initWithName:systemName:artworkData:lineFeatureID:primaryDescriptionText:secondaryDescriptionText:", a3, a4, a5, a6, v6, 0);
}

- (id)_initWithName:(id)a3 systemName:(id)a4 artworkData:(id)a5 lineFeatureID:(unint64_t)a6 primaryDescriptionText:(id)a7 secondaryDescriptionText:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  RAPTransitLine *v19;
  NSString *v20;
  NSString *name;
  NSString *v22;
  NSString *systemName;
  NSString *v24;
  NSString *primaryDescriptionText;
  NSString *v26;
  NSString *secondaryDescriptionText;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v29.receiver = self;
  v29.super_class = (Class)RAPTransitLine;
  v19 = -[RAPTransitLine init](&v29, "init");
  if (v19)
  {
    v20 = (NSString *)objc_msgSend(v14, "copy");
    name = v19->_name;
    v19->_name = v20;

    v22 = (NSString *)objc_msgSend(v15, "copy");
    systemName = v19->_systemName;
    v19->_systemName = v22;

    objc_storeStrong((id *)&v19->_artwork, a5);
    v19->_lineFeatureID = a6;
    v24 = (NSString *)objc_msgSend(v17, "copy");
    primaryDescriptionText = v19->_primaryDescriptionText;
    v19->_primaryDescriptionText = v24;

    v26 = (NSString *)objc_msgSend(v18, "copy");
    secondaryDescriptionText = v19->_secondaryDescriptionText;
    v19->_secondaryDescriptionText = v26;

  }
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  RAPTransitLine *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  void *v13;

  v4 = (RAPTransitLine *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v5 = objc_opt_class(RAPTransitLine);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = -[RAPTransitLine lineFeatureID](self, "lineFeatureID");
      v7 = -[RAPTransitLine lineFeatureID](v4, "lineFeatureID");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLine name](self, "name"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLine name](v4, "name"));
      if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLine name](self, "name"));
        if (v12)
        {
          v10 = 0;
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLine name](v4, "name"));
          v10 = v13 == 0;

        }
      }

      v11 = (id)v6 == v7 && v10;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[RAPTransitLine lineFeatureID](self, "lineFeatureID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLine name](self, "name"));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v6;

  objc_storeStrong((id *)v5 + 2, self->_artwork);
  v8 = -[NSString copyWithZone:](self->_primaryDescriptionText, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v8;

  v10 = -[NSString copyWithZone:](self->_secondaryDescriptionText, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v10;

  *((_QWORD *)v5 + 5) = self->_lineFeatureID;
  v12 = -[NSString copyWithZone:](self->_systemName, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = v12;

  return v5;
}

+ (id)transitLinesOnRoutes:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableSet);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v8);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transitLinesOnRoute"));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = -[RAPTransitLine _initWithTransitLine:]([RAPTransitLine alloc], "_initWithTransitLine:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v14));
              objc_msgSend(v4, "addObject:", v15);

              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v12);
        }

        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  return v16;
}

- (NSString)displayName
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLine name](self, "name"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLine name](self, "name"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLine systemName](self, "systemName"));
  return (NSString *)v5;
}

- (NSString)name
{
  return self->_name;
}

- (GEOTransitArtworkDataSource)artwork
{
  return self->_artwork;
}

- (NSString)primaryDescriptionText
{
  return self->_primaryDescriptionText;
}

- (NSString)secondaryDescriptionText
{
  return self->_secondaryDescriptionText;
}

- (unint64_t)lineFeatureID
{
  return self->_lineFeatureID;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_secondaryDescriptionText, 0);
  objc_storeStrong((id *)&self->_primaryDescriptionText, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
