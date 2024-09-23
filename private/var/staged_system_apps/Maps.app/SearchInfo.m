@implementation SearchInfo

+ (BOOL)supportClientMapRegionCorrection
{
  if (qword_1014D2360 != -1)
    dispatch_once(&qword_1014D2360, &stru_1011B4398);
  return byte_1014A87F0;
}

- (SearchInfo)initWithSearchResults:(id)a3 boundingMapRegion:(id)a4
{
  id v7;
  id v8;
  SearchInfo *v9;
  SearchInfo *v10;
  GEOMapRegion **p_mapRegion;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  MKMapPoint v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  GEOMapRegion *v29;
  GEOMapRegion *v30;
  SearchInfo *v31;
  objc_super v33;
  CLLocationCoordinate2D v34;

  v7 = a3;
  v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)SearchInfo;
  v9 = -[SearchInfo init](&v33, "init");
  v10 = v9;
  if (v9)
  {
    v9->_searchResultType = 1;
    objc_storeStrong((id *)&v9->_results, a3);
    p_mapRegion = &v10->_mapRegion;
    objc_storeStrong((id *)&v10->_mapRegion, a4);
    v10->_chainResults = 0;
    v10->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (objc_msgSend(v7, "count") == (id)1 && *p_mapRegion)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItem"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_styleAttributes"));
      if (objc_msgSend(v14, "isLabelPOI")
        && +[SearchInfo supportClientMapRegionCorrection](SearchInfo, "supportClientMapRegionCorrection"))
      {
        v16 = GEOMapRectForMapRegion(*p_mapRegion, v15);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        objc_msgSend(v13, "_coordinate");
        v23 = MKMapPointForCoordinate(v34);
        v24 = vabdd_f64(v16 + v20, v23.x);
        v25 = vabdd_f64(v16, v23.x);
        v26 = vabdd_f64(v18 + v22, v23.y);
        v27 = vabdd_f64(v18, v23.y);
        if (v24 <= v25)
          v24 = v25;
        if (v26 <= v27)
          v28 = v27;
        else
          v28 = v26;
        v29 = (GEOMapRegion *)objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v23.x - v24, v23.y - v28, v24 + v24, v28 + v28);
        v30 = *p_mapRegion;
        *p_mapRegion = v29;

      }
    }
    v31 = v10;
  }

  return v10;
}

- (BOOL)shouldInjectSearchResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo searchFieldItem](self, "searchFieldItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venueCategoryItem"));

  if (!v4)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo searchFieldItem](self, "searchFieldItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "venueCategoryItem"));
  v7 = objc_msgSend(v6, "displayMode") != 2;

  return v7;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  if (-[NSArray count](self->_results, "count") > a3)
    self->_selectedIndex = a3;
}

- (SearchResult)selectedResult
{
  unint64_t selectedIndex;
  void *v4;

  selectedIndex = self->_selectedIndex;
  if (selectedIndex >= -[NSArray count](self->_results, "count"))
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_results, "objectAtIndexedSubscript:", self->_selectedIndex));
  return (SearchResult *)v4;
}

+ (SearchInfo)searchInfoWithResults:(id)a3
{
  id v3;
  SearchInfo *v4;

  v3 = a3;
  v4 = -[SearchInfo initWithSearchResults:boundingMapRegion:]([SearchInfo alloc], "initWithSearchResults:boundingMapRegion:", v3, 0);

  return v4;
}

+ (SearchInfo)searchInfoWithResults:(id)a3 ticket:(id)a4
{
  id v5;
  id v6;
  SearchInfo *v7;
  uint64_t v8;
  GEOSearchAutoRedoThreshold *searchAutoRedoThreshold;
  uint64_t v10;
  GEOSearchRedoButtonThreshold *searchRedoButtonThreshold;
  uint64_t v12;
  GEOResultRefinementGroup *resultRefinementGroup;
  uint64_t v14;
  GEOSearchSessionData *searchSessionData;

  v5 = a4;
  v6 = a3;
  v7 = -[SearchInfo initWithSearchResults:boundingMapRegion:]([SearchInfo alloc], "initWithSearchResults:boundingMapRegion:", v6, 0);

  if (v5)
  {
    v7->_canRedoSearch = objc_msgSend(v5, "shouldEnableRedoSearch");
    v7->_shouldAllowManualRedoButton = objc_msgSend(v5, "shouldAllowManualRedoButton");
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchAutoRedoThreshold"));
    searchAutoRedoThreshold = v7->_searchAutoRedoThreshold;
    v7->_searchAutoRedoThreshold = (GEOSearchAutoRedoThreshold *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchRedoButtonThreshold"));
    searchRedoButtonThreshold = v7->_searchRedoButtonThreshold;
    v7->_searchRedoButtonThreshold = (GEOSearchRedoButtonThreshold *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultRefinementGroup"));
    resultRefinementGroup = v7->_resultRefinementGroup;
    v7->_resultRefinementGroup = (GEOResultRefinementGroup *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchSessionData"));
    searchSessionData = v7->_searchSessionData;
    v7->_searchSessionData = (GEOSearchSessionData *)v14;

  }
  return v7;
}

+ (SearchInfo)searchInfoWithResults:(id)a3 mapRegion:(id *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  SearchInfo *v14;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _mapkit_mapRegionForCoordinateRegion:](GEOMapRegion, "_mapkit_mapRegionForCoordinateRegion:", v11, v10, v9, v8));
  v14 = -[SearchInfo initWithSearchResults:boundingMapRegion:]([SearchInfo alloc], "initWithSearchResults:boundingMapRegion:", v12, v13);

  return v14;
}

+ (SearchInfo)searchInfoWithResults:(id)a3 boundingMapRegion:(id)a4
{
  id v5;
  id v6;
  SearchInfo *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SearchInfo initWithSearchResults:boundingMapRegion:]([SearchInfo alloc], "initWithSearchResults:boundingMapRegion:", v6, v5);

  return v7;
}

+ (SearchInfo)searchInfoWithResults:(id)a3 boundingMapRegion:(id)a4 autocompleterPerson:(id)a5
{
  _TtC4Maps22MapsAutocompletePerson *v7;
  id v8;
  id v9;
  SearchInfo *v10;
  _TtC4Maps22MapsAutocompletePerson *autocompletePerson;

  v7 = (_TtC4Maps22MapsAutocompletePerson *)a5;
  v8 = a4;
  v9 = a3;
  v10 = -[SearchInfo initWithSearchResults:boundingMapRegion:]([SearchInfo alloc], "initWithSearchResults:boundingMapRegion:", v9, v8);

  autocompletePerson = v10->_autocompletePerson;
  v10->_autocompletePerson = v7;

  return v10;
}

+ (SearchInfo)searchInfoWithMapItems:(id)a3 traits:(id)a4 placeInfo:(id)a5 boundingRegion:(id)a6 addressBookAddress:(id)a7 searchType:(unsigned int)a8 retainedSearchMetadata:(id)a9 relatedSections:(id)a10 searchSectionList:(id)a11
{
  uint64_t v11;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  SearchResult *v21;
  void *v22;
  void *v23;
  SearchResult *v24;
  void *v25;
  SearchInfo *v26;
  void *v27;
  SearchInfo *v28;
  void *v29;
  SearchInfo *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SearchResult *v36;
  void *v37;
  unsigned __int8 v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *i;
  void *v44;
  unsigned int v45;
  void *v46;
  id v47;
  SearchResult *v48;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  SearchResult *v63;

  v11 = *(_QWORD *)&a8;
  v16 = a3;
  v54 = a4;
  v57 = a5;
  v53 = a6;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  v20 = v16;
  v55 = v18;
  v56 = a11;
  v52 = v17;
  if (v17 && objc_msgSend(v16, "count") == (id)1)
  {
    v21 = [SearchResult alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
    v24 = -[SearchResult initWithMapItem:searchResultType:addressBookAddress:retainedSearchMetadata:resultIndex:](v21, "initWithMapItem:searchResultType:addressBookAddress:retainedSearchMetadata:resultIndex:", v22, v11, v17, v23, 0);

    -[SearchResult setPlaceInfo:](v24, "setPlaceInfo:", v57);
    v25 = v54;
    -[SearchResult setGeoMapServiceTraitSource:](v24, "setGeoMapServiceTraitSource:", objc_msgSend(v54, "source"));
    v26 = [SearchInfo alloc];
    v63 = v24;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));
    v28 = v26;
    v29 = v53;
    v30 = -[SearchInfo initWithSearchResults:boundingMapRegion:](v28, "initWithSearchResults:boundingMapRegion:", v27, v53);

    v18 = v55;
  }
  else
  {
    v51 = v19;
    v24 = (SearchResult *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v16, "count"));
    v25 = v54;
    if (objc_msgSend(v16, "count"))
    {
      v31 = 0;
      do
      {
        if (v31 >= (unint64_t)objc_msgSend(v18, "count"))
          v32 = 0;
        else
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v31));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v31));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_identifier"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "geoMapItemIdentifier"));

        v36 = -[SearchResult initWithMapItem:searchResultType:addressBookAddress:retainedSearchMetadata:resultIndex:]([SearchResult alloc], "initWithMapItem:searchResultType:addressBookAddress:retainedSearchMetadata:resultIndex:", v33, v11, 0, v32, objc_msgSend(v56, "indexOfItemWithIdentifier:", v35));
        -[SearchResult setPlaceInfo:](v36, "setPlaceInfo:", v57);
        -[SearchResult setGeoMapServiceTraitSource:](v36, "setGeoMapServiceTraitSource:", objc_msgSend(v54, "source"));
        -[SearchResult addObject:](v24, "addObject:", v36);

        ++v31;
        v18 = v55;
      }
      while (v31 < (unint64_t)objc_msgSend(v16, "count"));
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v38 = objc_msgSend(v37, "isCurrentlyConnectedToAnyCarScene");

    if ((v38 & 1) == 0)
    {
      v50 = v16;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v39 = v51;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(_QWORD *)v59 != v42)
              objc_enumerationMutation(v39);
            v44 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
            v45 = objc_msgSend(v44, "index", v50);
            if ((unint64_t)-[SearchResult count](v24, "count") >= v45)
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "relatedPlaceCollections"));
              v47 = objc_msgSend(v46, "count");

              if (v47)
              {
                v48 = -[SearchResult initWithRelatedSection:]([SearchResult alloc], "initWithRelatedSection:", v44);
                -[SearchResult insertObject:atIndex:](v24, "insertObject:atIndex:", v48, v45);

              }
            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        }
        while (v41);
      }

      v20 = v50;
      v25 = v54;
      v18 = v55;
    }
    v29 = v53;
    v30 = -[SearchInfo initWithSearchResults:boundingMapRegion:]([SearchInfo alloc], "initWithSearchResults:boundingMapRegion:", v24, v53);
    v19 = v51;
  }

  return v30;
}

+ (SearchInfo)searchInfoWithTicket:(id)a3 searchType:(unsigned int)a4
{
  return (SearchInfo *)objc_msgSend(a1, "searchInfoWithTicket:addressBookAddress:searchType:", a3, 0, *(_QWORD *)&a4);
}

+ (SearchInfo)searchInfoWithTicket:(id)a3 addressBookAddress:(id)a4 searchType:(unsigned int)a5
{
  return (SearchInfo *)objc_msgSend(a1, "searchInfoWithTicket:addressBookAddress:searchType:forRefinementSearchForBookmark:", a3, a4, *(_QWORD *)&a5, 0);
}

+ (SearchInfo)searchInfoWithTicket:(id)a3 addressBookAddress:(id)a4 searchType:(unsigned int)a5 forRefinementSearchForBookmark:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  unsigned int v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  GEORPPlaceInfo *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  _TtC4Maps20PlaceSummaryMetadata *v70;
  void *v71;
  _TtC4Maps20PlaceSummaryMetadata *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  BOOL v78;
  uint64_t v79;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  unsigned int v88;
  id v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];

  v10 = a3;
  v95 = a4;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "exactMapItems"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "refinedMapItems"));
  v13 = objc_msgSend(v93, "count");
  v14 = v13;
  v94 = v12;
  if (v11)
  {
    v92 = v13;
    v15 = a5;
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v97;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v97 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
          objc_msgSend(v21, "setName:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
      }
      while (v18);
    }

    v12 = v94;
    a5 = v15;
    v14 = v92;
  }
  v90 = a1;
  if (objc_msgSend(v12, "count"))
  {
    v23 = v12;
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "retainedSearchMetadata"));
  }
  else
  {
    v23 = v93;
    v24 = 0;
  }
  if (v14)
    v25 = 5;
  else
    v25 = a5;
  v26 = objc_opt_new(GEORPPlaceInfo);
  objc_msgSend(v10, "applyToPlaceInfo:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traits"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boundingRegion"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relatedEntitySections"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchSectionList"));
  v91 = (void *)v24;
  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "searchInfoWithMapItems:traits:placeInfo:boundingRegion:addressBookAddress:searchType:retainedSearchMetadata:relatedSections:searchSectionList:", v23, v27, v26, v28, v95, v25, v24, v29, v30));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31, "results"));
  *(_BYTE *)(v31 + 12) = objc_msgSend(v90, "isChainResultWithTicket:searchResults:", v10, v32);

  *(_BYTE *)(v31 + 14) = objc_msgSend(v10, "isChainResultSet");
  v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relatedSearchSuggestions"));
  v34 = *(void **)(v31 + 64);
  *(_QWORD *)(v31 + 64) = v33;

  v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "browseCategories"));
  v36 = *(void **)(v31 + 72);
  *(_QWORD *)(v31 + 72) = v35;

  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultRelatedSuggestion"));
  v38 = *(void **)(v31 + 88);
  *(_QWORD *)(v31 + 88) = v37;

  *(_DWORD *)(v31 + 20) = objc_msgSend(v10, "searchResultType");
  v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientResolvedResult"));
  v40 = *(void **)(v31 + 112);
  *(_QWORD *)(v31 + 112) = v39;

  v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "directionIntent"));
  v42 = *(void **)(v31 + 120);
  *(_QWORD *)(v31 + 120) = v41;

  if (!*(_DWORD *)(v31 + 20))
    *(_DWORD *)(v31 + 20) = 1;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resultDisplayHeader"));
  v44 = v43;
  if (v43)
    v45 = v43;
  else
    v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionHeader"));
  v46 = *(void **)(v31 + 96);
  *(_QWORD *)(v31 + 96) = v45;

  v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayHeaderSubstitutes"));
  v48 = *(void **)(v31 + 104);
  *(_QWORD *)(v31 + 104) = v47;

  *(double *)(v31 + 128) = (double)objc_msgSend(v10, "dymSuggestionVisibleTime");
  *(_BYTE *)(v31 + 13) = objc_msgSend(v10, "showDymSuggestionCloseButton");
  *(_BYTE *)(v31 + 10) = objc_msgSend(v10, "shouldEnableRedoSearch");
  *(_BYTE *)(v31 + 11) = objc_msgSend(v10, "shouldAllowManualRedoButton");
  v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "headerDisplayNameWithTicket:", v10));
  v50 = *(void **)(v31 + 144);
  *(_QWORD *)(v31 + 144) = v49;

  v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "subHeaderDisplayNameWithTicket:", v10));
  v52 = *(void **)(v31 + 152);
  *(_QWORD *)(v31 + 152) = v51;

  v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "placeCollectionsWithTicket:", v10));
  v54 = *(void **)(v31 + 168);
  *(_QWORD *)(v31 + 168) = v53;

  v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relatedEntitySections"));
  v56 = *(void **)(v31 + 160);
  *(_QWORD *)(v31 + 160) = v55;

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "publisherResults"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "firstObject"));
  v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "publisher"));
  v60 = *(void **)(v31 + 176);
  *(_QWORD *)(v31 + 176) = v59;

  v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "styleAttributesWithTicket:", v10));
  v62 = *(void **)(v31 + 184);
  *(_QWORD *)(v31 + 184) = v61;

  v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "searchDotPlacesWithTicket:", v10));
  v64 = *(void **)(v31 + 192);
  *(_QWORD *)(v31 + 192) = v63;

  v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchAutoRedoThreshold"));
  v66 = *(void **)(v31 + 200);
  *(_QWORD *)(v31 + 200) = v65;

  v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchRedoButtonThreshold"));
  v68 = *(void **)(v31 + 208);
  *(_QWORD *)(v31 + 208) = v67;

  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeSummaryLayoutMetadata"));
  if (v69)
  {
    v70 = [_TtC4Maps20PlaceSummaryMetadata alloc];
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeSummaryLayoutMetadata"));
    v72 = -[PlaceSummaryMetadata initWithMetadata:](v70, "initWithMetadata:", v71);
    v73 = *(void **)(v31 + 216);
    *(_QWORD *)(v31 + 216) = v72;

  }
  v74 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resultRefinementGroup"));
  v75 = *(void **)(v31 + 232);
  *(_QWORD *)(v31 + 232) = v74;

  v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchSectionList"));
  v77 = *(void **)(v31 + 224);
  *(_QWORD *)(v31 + 224) = v76;

  if (objc_msgSend(v10, "disableAdditionalViewportPadding"))
    v78 = (unint64_t)objc_msgSend(v23, "count") > 1;
  else
    v78 = 0;
  *(_BYTE *)(v31 + 15) = v78;
  *(_DWORD *)(v31 + 24) = objc_msgSend(v10, "searchResultViewType");
  v79 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItemIdentifierForSpotlight"));
  v80 = *(void **)(v31 + 248);
  *(_QWORD *)(v31 + 248) = v79;

  v81 = objc_msgSend(v90, "shouldShowRAPWithTicket:", v10);
  *(_BYTE *)(v31 + 16) = (_BYTE)v81;
  if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v81, v82) & 1) != 0
    || (MapsFeature_IsEnabled_Maps420() & 1) != 0
    || MapsFeature_IsEnabled_Maps182())
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traits"));
    *(_BYTE *)(v31 + 9) = objc_msgSend(v83, "navigating");

  }
  v84 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "guideSummaryLayoutMetadata"));
  v85 = *(void **)(v31 + 264);
  *(_QWORD *)(v31 + 264) = v84;

  v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchSessionData"));
  v87 = *(void **)(v31 + 256);
  *(_QWORD *)(v31 + 256) = v86;

  if ((GEOConfigGetBOOL(MapsConfig_SearchInfoForceTopographicFeaturesEnabled, off_1014B5468) & 1) != 0)
    v88 = 1;
  else
    v88 = objc_msgSend(v10, "mapDisplayType");
  *(_DWORD *)(v31 + 28) = v88;

  return (SearchInfo *)(id)v31;
}

+ (SearchInfo)searchInfoWithSearchInfo:(id)a3 refinedIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SearchInfo *v9;
  void *v10;
  void *v11;
  void *v12;
  SearchInfo *v13;
  void *v15;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  if ((unint64_t)objc_msgSend(v6, "count") < a4)
  {

LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a4));

  if (!v8)
    goto LABEL_5;
  v9 = [SearchInfo alloc];
  v15 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "place"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapRegion"));
  v13 = -[SearchInfo initWithSearchResults:boundingMapRegion:](v9, "initWithSearchResults:boundingMapRegion:", v10, v12);

LABEL_6:
  return v13;
}

- (void)addDotPlacesFromSearchInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *searchDotPlaces;
  id v10;

  v4 = a3;
  v5 = objc_alloc((Class)NSMutableSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo searchDotPlaces](self, "searchDotPlaces"));
  v10 = objc_msgSend(v5, "initWithArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchDotPlaces"));
  objc_msgSend(v10, "addObjectsFromArray:", v7);

  v8 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
  searchDotPlaces = self->_searchDotPlaces;
  self->_searchDotPlaces = v8;

}

- (BOOL)singlePlaceCollection
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo results](self, "results"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo placeCollections](self, "placeCollections"));
    v4 = objc_msgSend(v5, "count") == (id)1;

  }
  return v4;
}

- (BOOL)singleResultMode
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo suggestions](self, "suggestions"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo defaultSuggestion](self, "defaultSuggestion"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo relatedEntitySections](self, "relatedEntitySections"));
  v7 = objc_msgSend(v6, "count");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo resultRefinementGroup](self, "resultRefinementGroup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo results](self, "results"));
  if (objc_msgSend(v9, "count") != (id)1 || v5 || v7)
  {

  }
  else
  {

    if (!v8)
      return 1;
  }
  return 0;
}

- (GEOResultRefinementTime)openAt
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (!MapsFeature_IsEnabled_SearchAndDiscovery(self))
    return (GEOResultRefinementTime *)0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo resultRefinementGroup](self, "resultRefinementGroup", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resultRefinementBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resultRefinements"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "type") == (id)4)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "openOptions"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "openAt"));

          if (objc_msgSend(v14, "isSelected") && (objc_msgSend(v14, "timeStamp"), v15 > 0.0))
            v16 = v14;
          else
            v16 = 0;
          v11 = v16;

          goto LABEL_17;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_17:

  return (GEOResultRefinementTime *)v11;
}

- (int64_t)sortOrder
{
  uint64_t v3;
  void *v4;
  NSUInteger v5;
  int64_t result;

  v3 = objc_claimAutoreleasedReturnValue(-[SearchFieldItem placeCategoryItem](self->_searchFieldItem, "placeCategoryItem"));
  result = 0;
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[NSArray count](self->_results, "count");

    if (v5 > 0x13)
      return 1;
  }
  return result;
}

- (BOOL)hasRelatedSearchSuggestion
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo resultDisplayHeader](self, "resultDisplayHeader"));
  v4 = objc_msgSend(v3, "length");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo substitutes](self, "substitutes"));
  if (objc_msgSend(v5, "count"))
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = !v6;

  return v7;
}

+ (id)headerDisplayNameWithTicket:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResultSections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "headerDisplayName"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResultSections"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "headerDisplayName"));

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "categorySearchResultSection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headerDisplayName"));
    v13 = objc_msgSend(v12, "length");

    if (!v13)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "categorySearchResultSection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "headerDisplayName"));
  }

LABEL_6:
  return v10;
}

+ (id)subHeaderDisplayNameWithTicket:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResultSections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subHeaderDisplayName"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResultSections"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subHeaderDisplayName"));

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "categorySearchResultSection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subHeaderDisplayName"));
    v13 = objc_msgSend(v12, "length");

    if (!v13)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "categorySearchResultSection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subHeaderDisplayName"));
  }

LABEL_6:
  return v10;
}

+ (id)styleAttributesWithTicket:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResultSections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "styleAttributes"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResultSections"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "styleAttributes"));

LABEL_5:
    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "categorySearchResultSection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "styleAttributes"));

  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "categorySearchResultSection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "styleAttributes"));
    goto LABEL_5;
  }
LABEL_6:

  return v9;
}

+ (BOOL)isChainResultWithTicket:(id)a3 searchResults:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  unsigned int v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchResultSections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = objc_msgSend(v7, "cellType");

  if (v8 == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "name", (_QWORD)v20));
          v17 = objc_msgSend(v10, "isEqualToString:", v16);

          if (!v17)
          {

            v18 = 0;
            goto LABEL_13;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v13)
          continue;
        break;
      }
    }

    v18 = objc_msgSend(v10, "length") != 0;
LABEL_13:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)placeCollectionsWithTicket:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "collectionResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v18;
    *(_QWORD *)&v7 = 138412290;
    v16 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10), "collection", v16, (_QWORD)v17));
        if (v11 && (objc_msgSend(v4, "containsObject:", v11) & 1) == 0)
        {
          objc_msgSend(v4, "addObject:", v11);
        }
        else
        {
          v12 = sub_1004316CC();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "SearcInfo contains a nil or duplicate collection: %@", buf, 0xCu);
          }

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v4, "count"))
    v14 = objc_msgSend(v4, "copy");
  else
    v14 = 0;

  return v14;
}

+ (id)searchDotPlacesWithTicket:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  v4 = objc_alloc((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dotPlaces"));
  v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dotPlaces"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003C5140;
  v11[3] = &unk_1011B43C0;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  v9 = objc_msgSend(v8, "copy");
  return v9;
}

+ (BOOL)shouldShowRAPWithTicket:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if (_MKRAPIsAvailable(v3) && MapsFeature_IsEnabled_RAPSydney())
    v4 = objc_msgSend(v3, "enableStructuredRAPAffordance");
  else
    v4 = 0;

  return v4;
}

- (void)updateSearchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray debugDescription](self->_results, "debugDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> Search Results:%@"), v3, self, v4));

  return v5;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (BOOL)shouldPreserveResults
{
  return self->_shouldPreserveResults;
}

- (void)setShouldPreserveResults:(BOOL)a3
{
  self->_shouldPreserveResults = a3;
}

- (BOOL)isSearchAlongRoute
{
  return self->_searchAlongRoute;
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  self->_searchAlongRoute = a3;
}

- (BOOL)canRedoSearch
{
  return self->_canRedoSearch;
}

- (void)setCanRedoSearch:(BOOL)a3
{
  self->_canRedoSearch = a3;
}

- (BOOL)shouldAllowManualRedoButton
{
  return self->_shouldAllowManualRedoButton;
}

- (void)setShouldAllowManualRedoButton:(BOOL)a3
{
  self->_shouldAllowManualRedoButton = a3;
}

- (GEOMapRegion)requestedMapRegion
{
  return self->_requestedMapRegion;
}

- (void)setRequestedMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_requestedMapRegion, a3);
}

- (SearchFieldItem)searchFieldItem
{
  return self->_searchFieldItem;
}

- (void)setSearchFieldItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSArray)browseCategories
{
  return self->_browseCategories;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (int)searchResultType
{
  return self->_searchResultType;
}

- (GEORelatedSearchSuggestion)defaultSuggestion
{
  return self->_defaultSuggestion;
}

- (NSString)resultDisplayHeader
{
  return self->_resultDisplayHeader;
}

- (NSArray)substitutes
{
  return self->_substitutes;
}

- (BOOL)isChainResults
{
  return self->_chainResults;
}

- (GEOResolvedItem)clientResolvedResult
{
  return self->_clientResolvedResult;
}

- (void)setClientResolvedResult:(id)a3
{
  objc_storeStrong((id *)&self->_clientResolvedResult, a3);
}

- (GEODirectionIntent)directionIntent
{
  return self->_directionIntent;
}

- (void)setDirectionIntent:(id)a3
{
  objc_storeStrong((id *)&self->_directionIntent, a3);
}

- (double)dymSuggestionVisibleTime
{
  return self->_dymSuggestionVisibleTime;
}

- (BOOL)showDymSuggestionCloseButton
{
  return self->_showDymSuggestionCloseButton;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)headerDisplayName
{
  return self->_headerDisplayName;
}

- (NSString)subHeaderDisplayName
{
  return self->_subHeaderDisplayName;
}

- (NSArray)relatedEntitySections
{
  return self->_relatedEntitySections;
}

- (BOOL)prefersAddressOverCategory
{
  return self->_prefersAddressOverCategory;
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (GEOPublisher)publisher
{
  return self->_publisher;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (NSArray)searchDotPlaces
{
  return self->_searchDotPlaces;
}

- (GEOSearchAutoRedoThreshold)searchAutoRedoThreshold
{
  return self->_searchAutoRedoThreshold;
}

- (GEOSearchRedoButtonThreshold)searchRedoButtonThreshold
{
  return self->_searchRedoButtonThreshold;
}

- (_TtC4Maps20PlaceSummaryMetadata)placeSummaryMetadata
{
  return self->_placeSummaryMetadata;
}

- (GEOSearchSectionList)searchSectionList
{
  return self->_searchSectionList;
}

- (GEOResultRefinementGroup)resultRefinementGroup
{
  return self->_resultRefinementGroup;
}

- (void)setResultRefinementGroup:(id)a3
{
  objc_storeStrong((id *)&self->_resultRefinementGroup, a3);
}

- (BOOL)disableAdditionalViewportPadding
{
  return self->_disableAdditionalViewportPadding;
}

- (int)searchResultViewType
{
  return self->_searchResultViewType;
}

- (BOOL)enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (void)setEnableStructuredRAPAffordance:(BOOL)a3
{
  self->_enableStructuredRAPAffordance = a3;
}

- (GEOSpotlightSearchPunchIn)punchInDetails
{
  return self->_punchInDetails;
}

- (void)setPunchInDetails:(id)a3
{
  objc_storeStrong((id *)&self->_punchInDetails, a3);
}

- (MKMapItemIdentifier)spotlightMapsIdentifier
{
  return self->_spotlightMapsIdentifier;
}

- (void)setSpotlightMapsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightMapsIdentifier, a3);
}

- (GEOSearchSessionData)searchSessionData
{
  return self->_searchSessionData;
}

- (GEOGuideSummaryLayoutMetadata)guideSummaryLayoutMetadata
{
  return self->_guideSummaryLayoutMetadata;
}

- (void)setGuideSummaryLayoutMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, a3);
}

- (_TtC4Maps22MapsAutocompletePerson)autocompletePerson
{
  return self->_autocompletePerson;
}

- (int)mapDisplayType
{
  return self->_mapDisplayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocompletePerson, 0);
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_spotlightMapsIdentifier, 0);
  objc_storeStrong((id *)&self->_punchInDetails, 0);
  objc_storeStrong((id *)&self->_resultRefinementGroup, 0);
  objc_storeStrong((id *)&self->_searchSectionList, 0);
  objc_storeStrong((id *)&self->_placeSummaryMetadata, 0);
  objc_storeStrong((id *)&self->_searchRedoButtonThreshold, 0);
  objc_storeStrong((id *)&self->_searchAutoRedoThreshold, 0);
  objc_storeStrong((id *)&self->_searchDotPlaces, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_relatedEntitySections, 0);
  objc_storeStrong((id *)&self->_subHeaderDisplayName, 0);
  objc_storeStrong((id *)&self->_headerDisplayName, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_directionIntent, 0);
  objc_storeStrong((id *)&self->_clientResolvedResult, 0);
  objc_storeStrong((id *)&self->_substitutes, 0);
  objc_storeStrong((id *)&self->_resultDisplayHeader, 0);
  objc_storeStrong((id *)&self->_defaultSuggestion, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_browseCategories, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_searchFieldItem, 0);
  objc_storeStrong((id *)&self->_requestedMapRegion, 0);
}

@end
