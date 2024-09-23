@implementation PKPaymentTransactionArchive

- (void)updateArchiveLocationsWithType:(unint64_t)a3 isArchived:(BOOL)a4
{
  _BOOL8 v4;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_locations;
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "type", (_QWORD)v12) == a3)
          objc_msgSend(v11, "setArchived:", v4);
      }
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (BOOL)allArchiveLocationsWithType:(unint64_t)a3 areArchived:(BOOL)a4
{
  int v4;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_locations;
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "isArchived", (_QWORD)v14) != v4 || objc_msgSend(v11, "type") != a3)
        {
          v12 = 0;
          goto LABEL_13;
        }
      }
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v12 = 1;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v12 = 1;
  }
LABEL_13:

  return v12;
}

- (id)archiveLocationMatchingLocation:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_locations;
  v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "type", (_QWORD)v17);
        if (v10 == objc_msgSend(v4, "type"))
        {
          objc_msgSend(v9, "cloudStoreZone");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "cloudStoreZone");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v11)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (v14)
          {

            if (v11 == v13)
              goto LABEL_18;
          }
          else
          {
            v15 = objc_msgSend(v11, "isEqual:", v12);

            if ((v15 & 1) != 0)
            {
LABEL_18:
              v6 = v9;
              goto LABEL_19;
            }
          }
        }
      }
      v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_19:

  return v6;
}

- (id)archiveLocationsWithType:(unint64_t)a3 isArchived:(BOOL)a4
{
  int v4;
  id v7;
  NSSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_locations;
  v9 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "type", (_QWORD)v16) == a3 && objc_msgSend(v13, "isArchived") == v4)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

- (id)archiveLocationsWithCloudStoreZone:(id)a3 isArchived:(BOOL)a4
{
  int v4;
  id v6;
  id v7;
  NSSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_locations;
  v9 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "cloudStoreZone", (_QWORD)v19);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v6 && v14)
        {
          if ((objc_msgSend(v6, "isEqual:", v14) & 1) == 0)
            goto LABEL_12;
        }
        else if ((id)v14 != v6)
        {
LABEL_12:

          continue;
        }
        v16 = objc_msgSend(v13, "isArchived");

        if (v16 == v4)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v17 = (void *)objc_msgSend(v7, "copy");
  return v17;
}

- (void)insertOrUpdateArchiveLocationWithCloudStoreZone:(id)a3 isArchived:(BOOL)a4 insertionMode:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  NSSet *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  PKPaymentTransactionArchiveLocation *v18;
  NSSet *v19;
  NSSet *locations;
  unsigned int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = self->_locations;
    v10 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v21 = v6;
      v11 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "cloudStoreZone");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = v14;
            v16 = objc_msgSend(v14, "isEqual:", v8);

            if ((v16 & 1) != 0)
            {
              v10 = v13;
              goto LABEL_13;
            }
          }
        }
        v10 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v10)
          continue;
        break;
      }
LABEL_13:
      v6 = v21;
    }

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", self->_locations);
    if (a5 == 1)
    {
      if (v10)
        goto LABEL_20;
    }
    else
    {
      if (a5)
      {
LABEL_20:
        v19 = (NSSet *)objc_msgSend(v17, "copy");
        locations = self->_locations;
        self->_locations = v19;

        goto LABEL_21;
      }
      if (v10)
      {
        objc_msgSend(v10, "setArchived:", v6);
        goto LABEL_20;
      }
    }
    v18 = -[PKPaymentTransactionArchiveLocation initWithType:archived:cloudStoreZone:]([PKPaymentTransactionArchiveLocation alloc], "initWithType:archived:cloudStoreZone:", 0, v6, v8);
    objc_msgSend(v17, "addObject:", v18);

    goto LABEL_20;
  }
LABEL_21:

}

- (void)updateTransactionArchiveLocationsWithArchive:(id)a3 type:(unint64_t)a4 archived:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a3, "locations", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "type") == a4)
        {
          -[PKPaymentTransactionArchive archiveLocationMatchingLocation:](self, "archiveLocationMatchingLocation:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
            objc_msgSend(v14, "setArchived:", v5);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (BOOL)isEqual:(id)a3
{
  PKPaymentTransactionArchive *v4;
  PKPaymentTransactionArchive *v5;
  BOOL v6;

  v4 = (PKPaymentTransactionArchive *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentTransactionArchive isEqualToArchive:](self, "isEqualToArchive:", v5);

  return v6;
}

- (BOOL)isEqualToArchive:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSSet *locations;
  NSSet *v12;
  char v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_13;
  v6 = (void *)v4[2];
  v7 = self->_identifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_13;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_13;
  }
  if (self->_type != v5[1])
  {
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  locations = self->_locations;
  v12 = (NSSet *)v5[3];
  if (locations && v12)
    v13 = -[NSSet isEqual:](locations, "isEqual:");
  else
    v13 = locations == v12;
LABEL_14:

  return v13;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_locations);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%lu'; "), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("locations: '%@'; "), self->_locations);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
