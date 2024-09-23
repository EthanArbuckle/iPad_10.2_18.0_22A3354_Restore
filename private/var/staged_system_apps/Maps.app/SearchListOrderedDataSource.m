@implementation SearchListOrderedDataSource

- (SearchListOrderedDataSource)initWithObjects:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchListOrderedDataSource;
  return -[SearchListOrderedDataSource init](&v4, "init", a3);
}

- (SearchListOrderedDataSource)initWithObjects:(id)a3 searchSectionList:(id)a4
{
  id v6;
  id v7;
  SearchListOrderedDataSource *v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SearchListOrderedDataSource;
  v8 = -[SearchListOrderedDataSource init](&v10, "init");
  if (v8 && objc_msgSend(v6, "count"))
    -[SearchListOrderedDataSource _createSectionsWithObjects:searchSectionList:](v8, "_createSectionsWithObjects:searchSectionList:", v6, v7);

  return v8;
}

- (int64_t)numberOfSections
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchListOrderedDataSource sections](self, "sections"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchListOrderedDataSource sections](self, "sections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchResults"));
  v7 = objc_msgSend(v6, "count");

  return (int64_t)v7;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchListOrderedDataSource sections](self, "sections"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 >= a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchListOrderedDataSource sections](self, "sections"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a3));

    if (objc_msgSend(v9, "type") == (id)1)
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)viewForHeaderInSection:(int64_t)a3 isFirstNonEmptySection:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  ResultsSectionHeaderView *v10;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchListOrderedDataSource sections](self, "sections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

  if (objc_msgSend(v7, "type") == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    v9 = objc_msgSend(v8, "length");
    if (v9)
      v10 = -[ResultsSectionHeaderView initWithTitle:isFirstNonEmptySection:showHairline:]([ResultsSectionHeaderView alloc], "initWithTitle:isFirstNonEmptySection:showHairline:", v8, v4, MapsFeature_IsEnabled_SearchAndDiscovery(v9) ^ 1);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 >= (id)-[NSArray count](self->_sections, "count"))
  {
    v11 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));
    v7 = objc_msgSend(v4, "row");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchResults"));
    v9 = objc_msgSend(v8, "count");

    if (v7 >= v9)
    {
      v11 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchResults"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v7));

    }
  }

  return v11;
}

- (void)_createSectionsWithObjects:(id)a3 searchSectionList:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  SearchResult *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSArray *v35;
  void *v36;
  void *v37;
  SearchResultSection *v38;
  void *v39;
  SearchResultSection *v40;
  id v41;
  NSObject *v42;
  NSArray *orderedObjects;
  NSArray *v44;
  NSArray *v45;
  NSArray *v46;
  NSArray *sections;
  id v48;
  id v49;
  SearchListOrderedDataSource *v50;
  void *v51;
  id v52;
  id obj;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
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
  uint8_t buf[4];
  NSArray *v73;
  __int16 v74;
  id v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];

  v6 = a3;
  v48 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapItem", v48));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "_muid")));
        objc_msgSend(v8, "setObject:forKey:", v13, v15);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    }
    while (v10);
  }

  v16 = objc_alloc((Class)NSMutableArray);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "searchSections"));
  v55 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "searchSections"));
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v52 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "searchSections"));
    v56 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    if (!v56)
      goto LABEL_35;
    v54 = *(_QWORD *)v65;
    v49 = v7;
    v50 = self;
    while (1)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v65 != v54)
          objc_enumerationMutation(v52);
        v21 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v20);
        v22 = objc_alloc_init((Class)NSMutableArray);
        v23 = objc_msgSend(v21, "sectionType");
        v57 = v20;
        if (v23 == (id)2)
        {
          if (MapsFeature_IsEnabled_SearchAndDiscovery(2))
          {
            v25 = v21;
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult sectionGuide](v25, "sectionGuide"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "placeCollections"));
            v58[0] = _NSConcreteStackBlock;
            v58[1] = 3221225472;
            v58[2] = sub_100B9BC78;
            v58[3] = &unk_1011E77C0;
            v59 = v22;
            objc_msgSend(v37, "enumerateObjectsUsingBlock:", v58);

          }
          else
          {
            v25 = -[SearchResult initWithSearchSection:]([SearchResult alloc], "initWithSearchSection:", v21);
            objc_msgSend(v22, "insertObject:atIndex:", v25, 0);
          }
        }
        else
        {
          if (v23 != (id)1)
            goto LABEL_33;
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sectionPlace"));
          v25 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mapItemIds"));

          v26 = -[SearchResult countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
          if (v26)
          {
            v27 = v26;
            v51 = v21;
            v28 = *(_QWORD *)v61;
            do
            {
              for (j = 0; j != v27; j = (char *)j + 1)
              {
                if (*(_QWORD *)v61 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j);
                v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v30, "muid", v48)));
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v31));

                if (v32)
                {
                  objc_msgSend(v22, "addObject:", v32);
                }
                else
                {
                  v33 = sub_10043222C();
                  v34 = objc_claimAutoreleasedReturnValue(v33);
                  if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
                  {
                    v35 = (NSArray *)objc_msgSend(v30, "muid");
                    *(_DWORD *)buf = 134217984;
                    v73 = v35;
                    _os_log_impl((void *)&_mh_execute_header, v34, (os_log_type_t)0x90u, "SearchSectionList has a place section containing a place_id that does not exist among the list of map items in the maps_result. Identifier muid: %llu", buf, 0xCu);
                  }

                }
              }
              v27 = -[SearchResult countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
            }
            while (v27);
            v7 = v49;
            self = v50;
            v21 = v51;
          }
        }

LABEL_33:
        objc_msgSend(v7, "addObjectsFromArray:", v22, v48);
        v38 = [SearchResultSection alloc];
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
        v40 = -[SearchResultSection initWithTitle:type:searchResults:](v38, "initWithTitle:type:searchResults:", v39, objc_msgSend((id)objc_opt_class(self), "searchResultTypeWithGEOType:", objc_msgSend(v21, "sectionType")), v22);

        objc_msgSend(v55, "addObject:", v40);
        v20 = v57 + 1;
      }
      while ((id)(v57 + 1) != v56);
      v56 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
      if (!v56)
      {
LABEL_35:

        break;
      }
    }
  }
  v41 = sub_10043222C();
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    orderedObjects = self->_orderedObjects;
    *(_DWORD *)buf = 138412546;
    v73 = orderedObjects;
    v74 = 2112;
    v75 = v55;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "SearchListOrderedDataSource. _orderedObjects: %@, sections = %@", buf, 0x16u);
  }

  v44 = (NSArray *)objc_msgSend(v7, "copy");
  v45 = self->_orderedObjects;
  self->_orderedObjects = v44;

  v46 = (NSArray *)objc_msgSend(v55, "copy");
  sections = self->_sections;
  self->_sections = v46;

}

+ (int64_t)searchResultTypeWithGEOType:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (NSArray)orderedObjects
{
  return self->_orderedObjects;
}

- (void)setOrderedObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_orderedObjects, 0);
}

@end
