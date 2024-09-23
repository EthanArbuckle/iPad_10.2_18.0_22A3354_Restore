@implementation CLPMeta

+ (BOOL)isInCountry:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(+[CLPMeta meta](CLPMeta, "meta"), "regulatoryDomainEstimates", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "countryCode"), "isEqualToString:", a3) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return (char)v5;
}

+ (BOOL)isInIndia
{
  return +[CLPMeta isInCountry:](CLPMeta, "isInCountry:", CFSTR("IN"));
}

+ (id)meta
{
  if (qword_10230E2E8 != -1)
    dispatch_once(&qword_10230E2E8, &stru_1021AED98);
  return (id)qword_10230E2E0;
}

+ (void)updateRegulatoryDomainEstimates
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = +[CLPMeta meta](CLPMeta, "meta");
  objc_msgSend(v2, "clearRegulatoryDomainEstimates");
  v3 = +[RDEstimate currentEstimates](RDEstimate, "currentEstimates");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = objc_alloc_init((Class)CLPRegulatoryDomainEstimate);
        objc_msgSend(v9, "setCountryCode:", objc_msgSend(v8, "countryCode"));
        objc_msgSend(v9, "setIsInDisputedArea:", objc_msgSend(v8, "isInDisputedArea"));
        objc_msgSend(v2, "addRegulatoryDomainEstimates:", v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
}

@end
