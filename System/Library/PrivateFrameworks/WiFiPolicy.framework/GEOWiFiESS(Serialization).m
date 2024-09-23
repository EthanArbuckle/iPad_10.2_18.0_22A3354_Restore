@implementation GEOWiFiESS(Serialization)

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:()Serialization
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "encodeBool:forKey:", objc_msgSend(a1, "isMoving"), CFSTR("moving"));
  objc_msgSend(v13, "encodeBool:forKey:", objc_msgSend(a1, "isCaptive"), CFSTR("captive"));
  objc_msgSend(v13, "encodeBool:forKey:", objc_msgSend(a1, "isSuspicious"), CFSTR("suspicious"));
  objc_msgSend(v13, "encodeBool:forKey:", objc_msgSend(a1, "isPublic"), CFSTR("public"));
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("name"));

  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v13, "encodeInt64:forKey:", objc_msgSend(a1, "authMask"), CFSTR("authMask"));
  objc_msgSend(v13, "encodeInt64:forKey:", objc_msgSend(a1, "tileKey"), CFSTR("tileKey"));
  objc_msgSend(a1, "popularityScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "popularityScore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeInt64:forKey:", objc_msgSend(v7, "score"), CFSTR("popularityScoreValue"));

  }
  else
  {
    objc_msgSend(v13, "encodeInt64:forKey:", 0, CFSTR("popularityScoreValue"));
  }
  objc_msgSend(a1, "qualityScore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "qualityScore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeInt64:forKey:", objc_msgSend(v9, "score"), CFSTR("qualityScoreValue"));

  }
  else
  {
    objc_msgSend(v13, "encodeInt64:forKey:", 0, CFSTR("qualityScoreValue"));
  }
  objc_msgSend(a1, "accessPoints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("accessPoints"));

  objc_msgSend(a1, "ownerIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "ownerIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("ownerIdentifiers"));

  }
  objc_msgSend(v13, "encodeInt32:forKey:", objc_msgSend(a1, "venueType"), CFSTR("venueType"));
  objc_msgSend(v13, "encodeInteger:forKey:", (int)objc_msgSend(a1, "venueGroup"), CFSTR("venueGroup"));
  objc_msgSend(v13, "encodeInteger:forKey:", objc_msgSend(a1, "type"), CFSTR("type"));

}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isMoving"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("moving"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isCaptive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("captive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isSuspicious"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("suspicious"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isPublic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("public"));

  objc_msgSend(a1, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("name"));

  }
  objc_msgSend(a1, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("identifier"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "authMask"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("authMask"));

  objc_msgSend(a1, "popularityScore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "popularityScore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "score"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v15, CFSTR("popularityScoreValue"));

  }
  objc_msgSend(a1, "qualityScore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "qualityScore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "score"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v19, CFSTR("qualityScoreValue"));

  }
  objc_msgSend(a1, "accessPoints");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(a1, "accessPoints", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v35;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v26), "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v24);
    }

    objc_msgSend(v2, "setObject:forKey:", v21, CFSTR("accessPoints"));
  }
  objc_msgSend(a1, "ownerIdentifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(a1, "ownerIdentifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v29, CFSTR("ownerIdentifiers"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "venueType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v30, CFSTR("venueType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "venueGroup"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v31, CFSTR("venueGroup"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "type"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v32, CFSTR("type"));

  return v2;
}

- (uint64_t)authMask
{
  unint64_t v2;
  uint64_t v3;

  if (!objc_msgSend(a1, "authTraitsCount") || !objc_msgSend(a1, "authTraitsCount"))
    return 0;
  v2 = 0;
  v3 = 0;
  do
  {
    switch(objc_msgSend(a1, "authTraitsAtIndex:", v2))
    {
      case 1u:
        v3 |= 1uLL;
        break;
      case 2u:
        v3 |= 2uLL;
        break;
      case 3u:
        v3 |= 4uLL;
        break;
      case 4u:
        v3 |= 8uLL;
        break;
      default:
        break;
    }
    ++v2;
  }
  while (v2 < objc_msgSend(a1, "authTraitsCount"));
  return v3;
}

- (id)authDescription
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a1, "authTraitsCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "authTraitsCount"))
    {
      v3 = 0;
      do
      {
        v4 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(a1, "authTraitsAsString:", objc_msgSend(a1, "authTraitsAtIndex:", v3));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "appendString:", v6);

        if (v3 < objc_msgSend(a1, "authTraitsCount") - 1)
          objc_msgSend(v2, "appendString:", CFSTR(", "));
        ++v3;
      }
      while (v3 < objc_msgSend(a1, "authTraitsCount"));
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)attributesDescription
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a1, "attributesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "attributesCount"))
    {
      v3 = 0;
      do
      {
        v4 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(a1, "attributesAsString:", objc_msgSend(a1, "attributesAtIndex:", v3));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "appendString:", v6);

        if (v3 < objc_msgSend(a1, "attributesCount") - 1)
          objc_msgSend(v2, "appendString:", CFSTR(", "));
        ++v3;
      }
      while (v3 < objc_msgSend(a1, "attributesCount"));
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)remoteIdentifier
{
  if (objc_msgSend(a1, "hasUniqueIdentifier"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(a1, "uniqueIdentifier"));
  else
    objc_msgSend(a1, "identifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessPoints
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "bss");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(a1, "bss");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)popularityScore
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "qualities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    goto LABEL_17;
  objc_msgSend(a1, "qualities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "qualities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
    NSLog(CFSTR("%s: mulitple qualities returned, only handling first"), "-[GEOWiFiESS(Serialization) popularityScore]");
  if (objc_msgSend(v2, "qualitiesCount"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v2, "qualities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v10, "type") == 1)
          {
            +[TBPopularityScore popularityScoreWithValue:](TBPopularityScore, "popularityScoreWithValue:", objc_msgSend(v10, "score"));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }
        }
        v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
LABEL_17:
    v7 = 0;
  }

  return v7;
}

- (id)qualityScore
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "qualities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    goto LABEL_17;
  objc_msgSend(a1, "qualities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "qualities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
    NSLog(CFSTR("%s: mulitple qualities returned, only handling first"), "-[GEOWiFiESS(Serialization) qualityScore]");
  if (objc_msgSend(v2, "qualitiesCount"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v2, "qualities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v10, "type") == 2)
          {
            +[TBQualityScore qualityScoreWithValue:](TBQualityScore, "qualityScoreWithValue:", objc_msgSend(v10, "score"));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }
        }
        v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
LABEL_17:
    v7 = 0;
  }

  return v7;
}

- (uint64_t)isCaptive
{
  return objc_msgSend(a1, "_hasAttribute:", 1);
}

- (uint64_t)isMoving
{
  return objc_msgSend(a1, "_hasAttribute:", 2);
}

- (uint64_t)isSuspicious
{
  return objc_msgSend(a1, "_hasAttribute:", 4);
}

- (uint64_t)isPublic
{
  return objc_msgSend(a1, "_hasAttribute:", 3);
}

- (uint64_t)isLowQuality
{
  return objc_msgSend(a1, "_hasAttribute:", 5);
}

- (uint64_t)type
{
  return (int)objc_msgSend(a1, "networkType");
}

- (BOOL)_hasAttribute:()Serialization
{
  unint64_t v5;
  int v6;
  _BOOL8 v7;

  if (!objc_msgSend(a1, "attributes") || !objc_msgSend(a1, "attributesCount"))
    return 0;
  v5 = 0;
  do
  {
    v6 = objc_msgSend(a1, "attributesAtIndex:", v5);
    v7 = v6 == a3;
    if (v6 == a3)
      break;
    ++v5;
  }
  while (objc_msgSend(a1, "attributesCount") > v5);
  return v7;
}

- (uint64_t)accessPointCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessPoints");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");

  return v2;
}

@end
