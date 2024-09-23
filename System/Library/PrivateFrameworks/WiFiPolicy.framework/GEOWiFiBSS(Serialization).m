@implementation GEOWiFiBSS(Serialization)

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
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", objc_msgSend(a1, "isEdge"), CFSTR("edge"));
  objc_msgSend(a1, "BSSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("bssid"));

  objc_msgSend(a1, "latitude");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("latitude"));
  objc_msgSend(a1, "longitude");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("longitude"));
  objc_msgSend(a1, "popularityScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "popularityScore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeInt64:forKey:", objc_msgSend(v6, "score"), CFSTR("popularityScoreValue"));

  }
  else
  {
    objc_msgSend(v9, "encodeInt64:forKey:", 0, CFSTR("popularityScoreValue"));
  }
  objc_msgSend(a1, "qualityScore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "qualityScore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeInt64:forKey:", objc_msgSend(v8, "score"), CFSTR("qualityScoreValue"));

  }
  else
  {
    objc_msgSend(v9, "encodeInt64:forKey:", 0, CFSTR("qualityScoreValue"));
  }

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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isEdge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("edge"));

  objc_msgSend(a1, "BSSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "BSSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("bssid"));

  }
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "latitude");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("latitude"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "longitude");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("longitude"));

  objc_msgSend(a1, "popularityScore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "popularityScore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "score"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v13, CFSTR("popularityScoreValue"));

  }
  objc_msgSend(a1, "qualityScore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "qualityScore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "score"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v17, CFSTR("qualityScoreValue"));

  }
  return v2;
}

- (double)latitude
{
  void *v2;
  double v3;
  double v4;

  if (objc_msgSend(a1, "hasLatLngE7"))
  {
    objc_msgSend(a1, "latLngE7");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (double)(int)objc_msgSend(v2, "latE7") / 10000000.0;
  }
  else
  {
    objc_msgSend(a1, "location");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lat");
    v3 = v4;
  }

  return v3;
}

- (double)longitude
{
  void *v2;
  double v3;
  double v4;

  if (objc_msgSend(a1, "hasLatLngE7"))
  {
    objc_msgSend(a1, "latLngE7");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (double)(int)objc_msgSend(v2, "lngE7") / 10000000.0;
  }
  else
  {
    objc_msgSend(a1, "location");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lng");
    v3 = v4;
  }

  return v3;
}

- (id)BSSID
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "hasUniqueIdentifier"))
  {
    TBMacAdressFromLong(objc_msgSend(a1, "uniqueIdentifier"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowercaseString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
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
    NSLog(CFSTR("%s: mulitple qualities returned, only handling first"), "-[GEOWiFiBSS(Serialization) popularityScore]");
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
    NSLog(CFSTR("%s: mulitple qualities returned, only handling first"), "-[GEOWiFiBSS(Serialization) qualityScore]");
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

- (uint64_t)isEdge
{
  return objc_msgSend(a1, "_hasAttribute:", 1);
}

- (uint64_t)isTCPGood
{
  return 0;
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

@end
