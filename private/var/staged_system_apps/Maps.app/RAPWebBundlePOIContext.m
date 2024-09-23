@implementation RAPWebBundlePOIContext

- (id)context
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *k;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *m;
  void *v51;
  id v52;
  id v53;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  objc_super v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];

  v72.receiver = self;
  v72.super_class = (Class)RAPWebBundlePOIContext;
  v3 = -[RAPWebBundleAddToMapContext context](&v72, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = objc_alloc_init((Class)NSMutableArray);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePOIContext businessHours](self, "businessHours"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i), "context"));
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place")));
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = objc_alloc_init((Class)NSMutableDictionary);
  v16 = v15;

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, CFSTR("businessHoursNormal"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePOIContext name](self, "name"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePOIContext name](self, "name"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("entityName"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePOIContext phoneNumber](self, "phoneNumber"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePOIContext phoneNumber](self, "phoneNumber"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("entityTelephone"));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePOIContext url](self, "url"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePOIContext url](self, "url"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("entityURL"));

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePOIContext categories](self, "categories"));
  v24 = objc_msgSend(v23, "count");

  if ((unint64_t)v24 >= 2)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePOIContext categories](self, "categories"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("entityCategories"));

  }
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[RAPWebBundlePOIContext permanentClosed](self, "permanentClosed")));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("businessHoursPermanentClosure"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[RAPWebBundlePOIContext temporaryClosed](self, "temporaryClosed")));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v27, CFSTR("businessHoursTemporaryClosureEnd"));

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[RAPWebBundlePOIContext acceptsApplePay](self, "acceptsApplePay")));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v28, CFSTR("acceptsApplePay"));

  v29 = objc_alloc_init((Class)NSMutableArray);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePOIContext transitInfos](self, "transitInfos"));
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(_QWORD *)v65 != v33)
          objc_enumerationMutation(v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)j), "context"));
        objc_msgSend(v29, "addObject:", v35);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    }
    while (v32);
  }

  if (objc_msgSend(v29, "count"))
  {
    v36 = objc_msgSend(v29, "copy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v36, CFSTR("transitInfo"));

  }
  v55 = v5;
  v37 = objc_alloc_init((Class)NSMutableArray);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePOIContext containsPlaces](self, "containsPlaces"));
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v40; k = (char *)k + 1)
      {
        if (*(_QWORD *)v61 != v41)
          objc_enumerationMutation(v38);
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)k), "context"));
        objc_msgSend(v37, "addObject:", v43);

      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    }
    while (v40);
  }

  if (objc_msgSend(v37, "count"))
  {
    v44 = objc_msgSend(v37, "copy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v44, CFSTR("contains"));

  }
  v45 = objc_alloc_init((Class)NSMutableArray);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePOIContext containedInPlaces](self, "containedInPlaces"));
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v57;
    do
    {
      for (m = 0; m != v48; m = (char *)m + 1)
      {
        if (*(_QWORD *)v57 != v49)
          objc_enumerationMutation(v46);
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)m), "context"));
        objc_msgSend(v45, "addObject:", v51);

      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
    }
    while (v48);
  }

  if (objc_msgSend(v45, "count"))
  {
    v52 = objc_msgSend(v45, "copy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v52, CFSTR("containedIn"));

  }
  v53 = objc_msgSend(v55, "copy");

  return v53;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)businessHours
{
  return self->_businessHours;
}

- (void)setBusinessHours:(id)a3
{
  objc_storeStrong((id *)&self->_businessHours, a3);
}

- (BOOL)permanentClosed
{
  return self->_permanentClosed;
}

- (void)setPermanentClosed:(BOOL)a3
{
  self->_permanentClosed = a3;
}

- (BOOL)temporaryClosed
{
  return self->_temporaryClosed;
}

- (void)setTemporaryClosed:(BOOL)a3
{
  self->_temporaryClosed = a3;
}

- (BOOL)acceptsApplePay
{
  return self->_acceptsApplePay;
}

- (void)setAcceptsApplePay:(BOOL)a3
{
  self->_acceptsApplePay = a3;
}

- (NSArray)transitInfos
{
  return self->_transitInfos;
}

- (void)setTransitInfos:(id)a3
{
  objc_storeStrong((id *)&self->_transitInfos, a3);
}

- (NSArray)containedInPlaces
{
  return self->_containedInPlaces;
}

- (void)setContainedInPlaces:(id)a3
{
  objc_storeStrong((id *)&self->_containedInPlaces, a3);
}

- (NSArray)containsPlaces
{
  return self->_containsPlaces;
}

- (void)setContainsPlaces:(id)a3
{
  objc_storeStrong((id *)&self->_containsPlaces, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containsPlaces, 0);
  objc_storeStrong((id *)&self->_containedInPlaces, 0);
  objc_storeStrong((id *)&self->_transitInfos, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
