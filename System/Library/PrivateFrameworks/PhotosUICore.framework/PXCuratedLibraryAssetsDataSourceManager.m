@implementation PXCuratedLibraryAssetsDataSourceManager

- (void)setLastVisualPositionsChangeToDataSourceIdentifier:(int64_t)a3
{
  self->_lastVisualPositionsChangeToDataSourceIdentifier = a3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  PXCuratedLibraryAssetsDataSourceManager *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  PXCuratedLibraryAssetsDataSourceManager *v21;

  v6 = a4;
  v9 = a3;
  if ((void *)PXZoomLevelDataSourceManagerObservationContext == a5)
  {
    if ((v6 & 1) != 0 && !self->_isForcingSections)
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __72__PXCuratedLibraryAssetsDataSourceManager_observable_didChange_context___block_invoke;
      v20 = &unk_1E5145EC0;
      v21 = self;
      v10 = &v17;
      goto LABEL_5;
    }
  }
  else
  {
    if ((void *)PXContentSyndicationConfigurationObservationContext_289240 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsDataSourceManager.m"), 816, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 5) != 0)
    {
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __72__PXCuratedLibraryAssetsDataSourceManager_observable_didChange_context___block_invoke_2;
      v15 = &unk_1E5145EC0;
      v16 = self;
      v10 = &v12;
LABEL_5:
      -[PXCuratedLibraryAssetsDataSourceManager performChanges:](self, "performChanges:", v10, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

}

uint64_t __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startBackgroundFetchIfNeeded");
}

- (BOOL)canLoadData
{
  return self->_canLoadData;
}

- (id)dataSourceManagerForZoomLevel:(int64_t)a3
{
  NSDictionary *dataSourceManagerByZoomLevel;
  void *v7;
  void *v8;
  void *v10;

  dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](dataSourceManagerByZoomLevel, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsDataSourceManager.m"), 233, CFSTR("missing data source manager for zoom level %li"), a3);

  }
  return v8;
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (unint64_t)libraryStateForZoomLevel:(int64_t)a3
{
  NSDictionary *dataSourceManagerByZoomLevel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](dataSourceManagerByZoomLevel, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryAssetsDataSourceManager _photosDataSourceForZoomLevel:](self, "_photosDataSourceForZoomLevel:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isBackgroundFetching");
  if (v8 && objc_msgSend(v8, "containsAnyItems"))
    v10 |= 2uLL;

  return v10;
}

- (id)_photosDataSourceForZoomLevel:(int64_t)a3
{
  NSDictionary *dataSourceManagerByZoomLevel;
  void *v4;
  void *v5;
  void *v6;

  dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](dataSourceManagerByZoomLevel, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "photosDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setBackgroundFetchOriginSection:", 0x7FFFFFFFFFFFFFFFLL);
  if (*(_QWORD *)(a1 + 40) == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "allPhotosFilterPredicate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilterPredicate:", v3);

  }
}

- (void)_updateDataSource
{
  uint64_t v4;
  uint64_t v5;
  BOOL isForcingSections;
  NSDictionary *dataSourceManagerByZoomLevel;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  uint64_t v37;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  _BOOL8 v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _BOOL8 v54;
  _BOOL8 v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  NSObject *v76;
  id v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  int64x2_t v84;
  NSObject *oslog;
  NSObject *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  _QWORD v93[5];
  id v94;
  id v95;
  id v96;
  id v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[2];
  int64x2_t v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[2];
  int64x2_t v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[4];
  id v110;
  id v111;
  _QWORD v112[2];
  int64x2_t v113;
  _QWORD v114[7];
  __int128 v115;
  __int128 v116;
  void *v117;
  __int128 v118;
  uint64_t v119;
  char v120;
  uint8_t buf[40];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  if (-[PXCuratedLibraryAssetsDataSourceManager canLoadData](self, "canLoadData"))
  {
    v4 = -[PXCuratedLibraryAssetsDataSourceManager zoomLevelForCurrentDataSourceManager](self, "zoomLevelForCurrentDataSourceManager");
    v5 = -[PXCuratedLibraryAssetsDataSourceManager currentDataSourceZoomLevel](self, "currentDataSourceZoomLevel");
    -[PXCuratedLibraryAssetsDataSourceManager setCurrentDataSourceZoomLevel:](self, "setCurrentDataSourceZoomLevel:", v4);
    if (v4 == 4 && (v5 | 4) != 4)
    {
      isForcingSections = self->_isForcingSections;
      self->_isForcingSections = 1;
      if (-[PXCuratedLibraryAssetsDataSourceManager forceAllPhotosAccurateIfNeeded](self, "forceAllPhotosAccurateIfNeeded"))
      {
        -[PXCuratedLibraryAssetsDataSourceManager signalChange:](self, "signalChange:", 4);
      }
      self->_isForcingSections = isForcingSections;
    }
    dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](dataSourceManagerByZoomLevel, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsDataSourceManager.m"), 557, CFSTR("missing data source manager for zoom level %li"), v4);

    }
    -[PXCuratedLibraryAssetsDataSourceManager currentDataSource](self, "currentDataSource");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryAssetsDataSourceManager setCurrentDataSource:](self, "setCurrentDataSource:", v11);
    v12 = v11;
    if (v10 == v12)
    {

      v13 = v10;
    }
    else
    {
      v13 = v12;
      v14 = objc_msgSend(v10, "isEqual:", v12);

      if ((v14 & 1) == 0)
      {
        if (v5 == v4)
        {
          objc_msgSend(v9, "changeHistory");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v10, "identifier"), objc_msgSend(v13, "identifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = 0;
          v18 = 0;
LABEL_133:
          v93[0] = MEMORY[0x1E0C809B0];
          v93[1] = 3221225472;
          v93[2] = __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_5;
          v93[3] = &unk_1E5146110;
          v93[4] = self;
          v94 = v16;
          v95 = v18;
          v98 = v17;
          v96 = v10;
          v13 = v13;
          v97 = v13;
          v69 = v16;
          v70 = v18;
          -[PXCuratedLibraryAssetsDataSourceManager performChanges:](self, "performChanges:", v93);

          goto LABEL_134;
        }
        v17 = 0;
        if (v4 == 4 || v5 == 4)
        {
          v18 = 0;
          v16 = 0;
          goto LABEL_133;
        }
        -[PXCuratedLibraryAssetsDataSourceManager delegate](self, "delegate");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_delegateRespondsTo.willTransitionFromZoomLevelToZoomLevel)
          objc_msgSend(v89, "curatedLibraryAssetsDataSourceManager:willTransitionFromZoomLevel:toZoomLevel:", self, v5, v4);
        if (!self->_delegateRespondsTo.dominantAssetCollectionReferenceForZoomLevel
          || (objc_msgSend(v89, "curatedLibraryAssetsDataSourceManager:dominantAssetCollectionReferenceForZoomLevel:", self, v5), (v86 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v87 = 0;
          v18 = 0;
          v16 = 0;
LABEL_130:
          if (self->_delegateRespondsTo.didTransitionFromZoomLevelToZoomLevel)
            objc_msgSend(v89, "curatedLibraryAssetsDataSourceManager:didTransitionFromZoomLevel:toZoomLevel:", self, v5, v4);

          v17 = v87;
          goto LABEL_133;
        }
        if (!self->_delegateRespondsTo.dominantAssetCollectionReferenceForZoomLevel
          || (objc_msgSend(v89, "curatedLibraryAssetsDataSourceManager:dominantAssetCollectionReferenceForZoomLevel:", self, v4), (oslog = objc_claimAutoreleasedReturnValue()) == 0))
        {
          -[PXCuratedLibraryAssetsDataSourceManager configuration](self, "configuration");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "keyAssetCollectionReferenceInDataSource:zoomLevel:matchingAssetCollectionReference:fromDataSource:zoomLevel:", v13, v4, v86, v10, v5);
          oslog = objc_claimAutoreleasedReturnValue();

          if (!oslog)
          {
            PLCuratedLibraryGetLog();
            oslog = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v86;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v4;
              _os_log_impl(&dword_1A6789000, oslog, OS_LOG_TYPE_DEFAULT, "Couldn't find a match for %@ in zoom level %li. Transitions might not work as expected.", buf, 0x16u);
            }
            v87 = 0;
            v18 = 0;
            v16 = 0;
            goto LABEL_129;
          }
        }
        memset(buf, 0, 32);
        if (v10)
          objc_msgSend(v10, "indexPathForAssetCollectionReference:", v86);
        v115 = 0u;
        v116 = 0u;
        if (v13)
        {
          objc_msgSend(v13, "indexPathForAssetCollectionReference:", oslog);
          v20 = v115;
        }
        else
        {
          v20 = 0;
        }
        v87 = 0;
        if (*(_QWORD *)buf == *(_QWORD *)off_1E50B7E98
          || (v82 = *(_QWORD *)off_1E50B7E98, v20 == *(_QWORD *)off_1E50B7E98))
        {
          v16 = 0;
          v18 = 0;
LABEL_129:

          goto LABEL_130;
        }
        v80 = objc_msgSend(v10, "numberOfSections");
        v83 = objc_msgSend(v13, "numberOfSections");
        v90 = *((_QWORD *)&v115 + 1);
        v91 = *(_QWORD *)&buf[8];
        if (!self->_delegateRespondsTo.transitionTypeFromZoomLevelToZoomLevel
          || (v87 = objc_msgSend(v89, "curatedLibraryAssetsDataSourceManager:transitionTypeFromZoomLevel:toZoomLevel:", self, v5, v4)) == 0)
        {
          PXAssertGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v118) = 138412290;
            *(_QWORD *)((char *)&v118 + 4) = v89;
            _os_log_error_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "no transition type defined by delegate %@", (uint8_t *)&v118, 0xCu);
          }

          v87 = 2;
        }
        v22 = self->_isForcingSections;
        self->_isForcingSections = 1;
        if (v5)
          v23 = 5;
        else
          v23 = 0;
        *(_QWORD *)&v118 = 0;
        *((_QWORD *)&v118 + 1) = &v118;
        v119 = 0x2020000000;
        v120 = 0;
        v114[0] = MEMORY[0x1E0C809B0];
        v114[1] = 3221225472;
        v114[2] = __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke;
        v114[3] = &unk_1E5145EE8;
        v114[4] = &v118;
        v114[5] = v90;
        v114[6] = v23;
        objc_msgSend(v9, "performChanges:", v114);
        if (*(_BYTE *)(*((_QWORD *)&v118 + 1) + 24))
        {
          objc_msgSend(v9, "dataSource");
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          -[PXCuratedLibraryAssetsDataSourceManager setCurrentDataSource:](self, "setCurrentDataSource:", v88);
          if (objc_msgSend(v88, "numberOfSections") != v83)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsDataSourceManager.m"), 616, CFSTR("Faulting in section:%ld +- %ld should not change the number of sections:%ld != %ld"), v90, v23, v83, objc_msgSend(v88, "numberOfSections"));

          }
        }
        else
        {
          v88 = v13;
        }
        self->_isForcingSections = v22;
        __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_2(v10, v5, v91);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_2(v88, v4, v90);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5 >= v4)
          v25 = v4;
        else
          v25 = v5;
        if (v5 <= v4)
          v26 = v4;
        else
          v26 = v5;
        if (v25 != 2 || v26 != 3)
        {
          if (v5 == 1 && v4 == 2)
          {
            v37 = 1;
          }
          else
          {
            v39 = v5 == 2 && v4 == 1;
            v37 = v39 << 63 >> 63;
          }
          goto LABEL_105;
        }
        if (v5 == 2)
          v27 = v86;
        else
          v27 = oslog;
        if (v5 == 2)
          v28 = oslog;
        else
          v28 = v86;
        v29 = v27;
        v30 = v28;
        -[NSObject assetCollection](v29, "assetCollection");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v30;
        -[NSObject keyAssetReference](v30, "keyAssetReference");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "asset");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "creationDate");
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        if (PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v31, 2))
        {
          if (v5 != 2 || *(_QWORD *)&buf[8] + 1 >= v80)
            goto LABEL_78;
          v112[0] = *(_QWORD *)buf;
          v112[1] = *(_QWORD *)&buf[8] + 1;
          v113 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
          objc_msgSend(v10, "assetCollectionAtSectionIndexPath:", v112);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject assetCollection](oslog, "assetCollection");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v34, "isEqual:", v35);

        }
        else
        {
          objc_msgSend(v31, "startDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "endDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v78, "px_isBetweenDate:andDate:", v40, v41);

        }
        if ((v36 & 1) == 0)
        {
          objc_msgSend(v31, "startDate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "timeIntervalSinceDate:", v42);
          v44 = v43;
          v45 = v43 >= 0.0;

          if (v5 == 2)
          {
            v46 = objc_msgSend(v75, "containsIndex:", v91);
            v47 = -1;
            if (v44 >= 0.0)
              v47 = 1;
            if (!v46)
              v47 = 0;
            v48 = v47 + v91;
            if (v87 == 1)
            {
              if (v46)
                v54 = v44 < 0.0;
              else
                v54 = v45;
              +[PXVisualPositionsChangeDetails changeDetailsWithCountBeforeChanges:anchorInserted:indexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:](PXVisualPositionsChangeDetails, "changeDetailsWithCountBeforeChanges:anchorInserted:indexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:", v80, v54, v48, v75, v83, v90, v74);
              v49 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v18 = 0;
              if (v87 != 2)
                goto LABEL_103;
              LOBYTE(v71) = 1;
              +[PXVisualPositionsChangeDetails changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:reloadAllIncludingAnchor:](PXVisualPositionsChangeDetails, "changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:reloadAllIncludingAnchor:", v80, v48, v75, v83, v90, v74, v71);
              v49 = objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v50 = objc_msgSend(v74, "containsIndex:", v90);
            v51 = -1;
            if (v44 >= 0.0)
              v51 = 1;
            if (!v50)
              v51 = 0;
            v52 = v51 + v90;
            if (v87 == 1)
            {
              if (v50)
                v55 = v44 < 0.0;
              else
                v55 = v45;
              +[PXVisualPositionsChangeDetails changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorRemoved:indexAfterChanges:headerIndexesAfterChanges:](PXVisualPositionsChangeDetails, "changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorRemoved:indexAfterChanges:headerIndexesAfterChanges:", v80, v91, v75, v83, v55, v52, v74);
              v49 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v18 = 0;
              if (v87 != 2)
                goto LABEL_103;
              LOBYTE(v71) = 1;
              +[PXVisualPositionsChangeDetails changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:reloadAllIncludingAnchor:](PXVisualPositionsChangeDetails, "changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:reloadAllIncludingAnchor:", v80, v91, v75, v83, v52, v74, v71);
              v49 = objc_claimAutoreleasedReturnValue();
            }
          }
          v18 = (void *)v49;
          goto LABEL_103;
        }
LABEL_78:
        v18 = 0;
LABEL_103:

        if (v18)
          goto LABEL_111;
        v37 = 0;
LABEL_105:
        if (v87 == 1)
        {
          +[PXVisualPositionsChangeDetails changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorFan:anchorReload:](PXVisualPositionsChangeDetails, "changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorFan:anchorReload:", v80, v91, v75, v83, v90, v74, v37, 0);
          v56 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v87 != 2)
          {
            v18 = 0;
LABEL_111:
            objc_msgSend(v18, "arrayChangeDetailsWithItemsChanged:", 1);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "changedIndexes");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v109[0] = MEMORY[0x1E0C809B0];
            v109[1] = 3221225472;
            v109[2] = __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_4;
            v109[3] = &unk_1E51460E8;
            v77 = v57;
            v110 = v77;
            v73 = v58;
            v111 = v73;
            objc_msgSend(v59, "enumerateIndexesUsingBlock:", v109);

            v60 = -1;
            v84 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
            do
            {
              v61 = v90 + v60;
              v62 = objc_msgSend(v92, "indexAfterRevertingChangesFromIndex:", v90 + v60);
              if ((unint64_t)v62 <= 0x7FFFFFFFFFFFFFFELL)
              {
                v63 = objc_msgSend(v10, "numberOfSections");
                if ((v61 & 0x8000000000000000) == 0 && v62 < v63 && v61 < objc_msgSend(v88, "numberOfSections"))
                {
                  v107 = 0u;
                  v108 = 0u;
                  v105[0] = objc_msgSend(v10, "identifier");
                  v105[1] = v62;
                  v106 = v84;
                  if (v10)
                  {
                    objc_msgSend(v10, "keyAssetIndexPathForSectionIndexPath:", v105);
                  }
                  else
                  {
                    v107 = 0u;
                    v108 = 0u;
                  }
                  v103 = 0u;
                  v104 = 0u;
                  v101[0] = objc_msgSend(v88, "identifier");
                  v101[1] = v90 + v60;
                  v102 = v84;
                  if (v88)
                  {
                    objc_msgSend(v88, "keyAssetIndexPathForSectionIndexPath:", v101);
                    v64 = v103;
                  }
                  else
                  {
                    v64 = 0;
                    v103 = 0u;
                    v104 = 0u;
                  }
                  if ((_QWORD)v107 != v82 && v64 != v82)
                  {
                    v99 = v107;
                    v100 = v108;
                    objc_msgSend(v10, "assetAtItemIndexPath:", &v99);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    v99 = v103;
                    v100 = v104;
                    objc_msgSend(v88, "assetAtItemIndexPath:", &v99);
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v81, "isEqual:", v79))
                    {
                      v72 = v108;
                      v65 = objc_msgSend(v10, "numberOfItemsInSection:", *((_QWORD *)&v107 + 1));
                      objc_msgSend(off_1E50B1608, "changeDetailsWithOldKeyItemIndex:oldCount:newKeyItemIndex:newCount:", v72, v65, (_QWORD)v104, objc_msgSend(v88, "numberOfItemsInSection:", *((_QWORD *)&v103 + 1)));
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v61);
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v77, "setObject:forKeyedSubscript:", v66, v67);

                    }
                  }
                }
              }
              ++v60;
            }
            while (v60 != 2);
            v68 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A18), "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v10, "identifier"), objc_msgSend(v88, "identifier"), v92, v77, 0);
            v117 = v68;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            _Block_object_dispose(&v118, 8);
            v13 = v88;
            goto LABEL_129;
          }
          LOBYTE(v71) = 0;
          +[PXVisualPositionsChangeDetails changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:reloadAllIncludingAnchor:](PXVisualPositionsChangeDetails, "changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:reloadAllIncludingAnchor:", v80, v91, v75, v83, v90, v74, v71);
          v56 = objc_claimAutoreleasedReturnValue();
        }
        v18 = (void *)v56;
        goto LABEL_111;
      }
    }
LABEL_134:

  }
}

- (PXAssetsDataSource)currentDataSource
{
  return self->_currentDataSource;
}

- (PXPhotoKitAssetsDataSourceManager)currentPhotoKitAssetsDataSourceManager
{
  NSDictionary *dataSourceManagerByZoomLevel;
  void *v3;
  void *v4;
  void *v5;
  PXPhotoKitAssetsDataSourceManager *v6;

  dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PXCuratedLibraryAssetsDataSourceManager zoomLevelForCurrentDataSourceManager](self, "zoomLevelForCurrentDataSourceManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](dataSourceManagerByZoomLevel, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (int64_t)zoomLevelForCurrentDataSourceManager
{
  return self->_zoomLevelForCurrentDataSourceManager;
}

- (void)setCurrentDataSourceZoomLevel:(int64_t)a3
{
  self->_currentDataSourceZoomLevel = a3;
}

- (void)setCurrentDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_currentDataSource, a3);
}

- (int64_t)currentDataSourceZoomLevel
{
  return self->_currentDataSourceZoomLevel;
}

- (id)createInitialDataSource
{
  return (id)objc_msgSend(off_1E50B16D8, "emptyDataSource");
}

- (NSPredicate)allPhotosFilterPredicate
{
  return self->_allPhotosFilterPredicate;
}

uint64_t __55__PXCuratedLibraryAssetsDataSourceManager_loadIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCanLoadData:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePropertiesDerivedFromZoomLevel");
}

- (void)setCanLoadData:(BOOL)a3
{
  if (self->_canLoadData != a3)
  {
    self->_canLoadData = a3;
    -[PXCuratedLibraryAssetsDataSourceManager _invalidateDataSourceManagers](self, "_invalidateDataSourceManagers");
    -[PXCuratedLibraryAssetsDataSourceManager signalChange:](self, "signalChange:", 8);
  }
}

- (void)_invalidateDataSourceManagers
{
  id v2;

  -[PXCuratedLibraryAssetsDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDataSourceManagers);

}

- (void)setWantsCuration:(BOOL)a3
{
  if (self->_wantsCuration != a3)
  {
    self->_wantsCuration = a3;
    -[PXCuratedLibraryAssetsDataSourceManager _invalidateCuration](self, "_invalidateCuration");
    -[PXCuratedLibraryAssetsDataSourceManager _invalidateDataSource](self, "_invalidateDataSource");
  }
}

- (void)_invalidateCuration
{
  id v2;

  -[PXCuratedLibraryAssetsDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCuration);

}

- (void)_updateDataSourceManagers
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PXContentSyndicationConfigurationProvider *contentSyndicationConfigurationProvider;
  NSDictionary *v16;
  NSDictionary *dataSourceManagerByZoomLevel;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  PXContentSyndicationConfigurationProvider *v24;
  PXContentSyndicationConfigurationProvider *v25;
  void *v26;
  id v27;
  int64_t v28;
  _QWORD v29[5];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[6];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (-[PXCuratedLibraryAssetsDataSourceManager canLoadData](self, "canLoadData"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = -[PXCuratedLibraryAssetsDataSourceManager libraryFilter](self, "libraryFilter");
    v4 = 1;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      -[PXCuratedLibraryAssetsDataSourceManager configuration](self, "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configurationForZoomLevel:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "assetsDataSourceManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);

      v40[0] = v5;
      v40[1] = 3221225472;
      v40[2] = __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke;
      v40[3] = &unk_1E5145FB0;
      v40[4] = self;
      v40[5] = v4;
      objc_msgSend(v8, "performChanges:", v40);

      ++v4;
    }
    while (v4 != 5);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[NSDictionary objectEnumerator](self->_dataSourceManagerByZoomLevel, "objectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v37;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v14++), "unregisterChangeObserver:context:", self, PXZoomLevelDataSourceManagerObservationContext);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v12);
    }

    -[PXContentSyndicationConfigurationProvider unregisterChangeObserver:context:](self->_contentSyndicationConfigurationProvider, "unregisterChangeObserver:context:", self, PXContentSyndicationConfigurationObservationContext_289240);
    contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
    self->_contentSyndicationConfigurationProvider = 0;

    v16 = (NSDictionary *)objc_msgSend(v3, "copy");
    dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
    self->_dataSourceManagerByZoomLevel = v16;

    v35[0] = v5;
    v35[1] = 3221225472;
    v35[2] = __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_2;
    v35[3] = &__block_descriptor_40_e46_v24__0q8__PXPhotoKitAssetsDataSourceManager_16l;
    v35[4] = v28;
    -[PXCuratedLibraryAssetsDataSourceManager _enumeratePhotoKitDataDataSourceManagers:](self, "_enumeratePhotoKitDataDataSourceManagers:", v35);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[NSDictionary objectEnumerator](self->_dataSourceManagerByZoomLevel, "objectEnumerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v22++), "registerChangeObserver:context:", self, PXZoomLevelDataSourceManagerObservationContext);
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v20);
    }

    -[PXCuratedLibraryAssetsDataSourceManagerConfiguration photoLibrary](self->_configuration, "photoLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", v23);
    v24 = (PXContentSyndicationConfigurationProvider *)objc_claimAutoreleasedReturnValue();
    v25 = self->_contentSyndicationConfigurationProvider;
    self->_contentSyndicationConfigurationProvider = v24;

    -[PXContentSyndicationConfigurationProvider registerChangeObserver:context:](self->_contentSyndicationConfigurationProvider, "registerChangeObserver:context:", self, PXContentSyndicationConfigurationObservationContext_289240);
    +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v5;
    v29[1] = 3221225472;
    v29[2] = __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_3;
    v29[3] = &unk_1E5148D08;
    v29[4] = self;
    v30 = v3;
    v27 = v3;
    objc_msgSend(v26, "scheduleTaskAfterCATransactionCommits:", v29);

    -[PXCuratedLibraryAssetsDataSourceManager _invalidateDataSource](self, "_invalidateDataSource");
  }
}

- (PXCuratedLibraryAssetsDataSourceManagerConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)libraryFilter
{
  return self->_libraryFilter;
}

- (void)_updatePropertiesDerivedFromZoomLevel
{
  -[PXCuratedLibraryAssetsDataSourceManager setZoomLevelForCurrentDataSourceManager:](self, "setZoomLevelForCurrentDataSourceManager:", -[PXCuratedLibraryAssetsDataSourceManager zoomLevel](self, "zoomLevel"));
  -[PXCuratedLibraryAssetsDataSourceManager setWantsCuration:](self, "setWantsCuration:", 1);
}

- (void)_invalidatePropertiesDerivedFromZoomLevel
{
  id v2;

  -[PXCuratedLibraryAssetsDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePropertiesDerivedFromZoomLevel);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryAssetsDataSourceManager;
  -[PXCuratedLibraryAssetsDataSourceManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXCuratedLibraryAssetsDataSourceManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

uint64_t __72__PXCuratedLibraryAssetsDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateDataSource");
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 4);
}

- (void)_invalidateDataSource
{
  id v2;

  -[PXCuratedLibraryAssetsDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDataSource);

}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setZoomLevelForCurrentDataSourceManager:(int64_t)a3
{
  if (self->_zoomLevelForCurrentDataSourceManager != a3)
  {
    self->_zoomLevelForCurrentDataSourceManager = a3;
    -[PXCuratedLibraryAssetsDataSourceManager _invalidateDataSource](self, "_invalidateDataSource");
  }
}

- (void)setNeedsUpdate
{
  -[PXCuratedLibraryAssetsDataSourceManager signalChange:](self, "signalChange:", 0);
}

- (id)dataSourceForZoomLevel:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PXCuratedLibraryAssetsDataSourceManager dataSourceManagerForZoomLevel:](self, "dataSourceManagerForZoomLevel:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "currentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDataSource:changeDetailsArray:", v3, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "setLastVisualPositionsChangeDetails:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setLastTransitionType:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setLastVisualPositionsChangeFromDataSourceIdentifier:", objc_msgSend(*(id *)(a1 + 56), "identifier"));
  return objc_msgSend(*(id *)(a1 + 32), "setLastVisualPositionsChangeToDataSourceIdentifier:", objc_msgSend(*(id *)(a1 + 64), "identifier"));
}

- (void)setLastVisualPositionsChangeFromDataSourceIdentifier:(int64_t)a3
{
  self->_lastVisualPositionsChangeFromDataSourceIdentifier = a3;
}

- (void)setLastVisualPositionsChangeDetails:(id)a3
{
  objc_storeStrong((id *)&self->_lastVisualPositionsChangeDetails, a3);
}

- (void)setLastTransitionType:(int64_t)a3
{
  self->_lastTransitionType = a3;
}

- (void)_enumeratePhotoKitDataDataSourceManagers:(id)a3
{
  uint64_t i;
  NSDictionary *dataSourceManagerByZoomLevel;
  void *v6;
  void *v7;
  void (**v8)(id, uint64_t, void *);

  v8 = (void (**)(id, uint64_t, void *))a3;
  for (i = 1; i != 5; ++i)
  {
    dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](dataSourceManagerByZoomLevel, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8[2](v8, i, v7);

  }
}

uint64_t __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setLibraryFilter:", *(_QWORD *)(a1 + 32));
}

- (void)setZoomLevel:(int64_t)a3
{
  if (self->_zoomLevel != a3)
  {
    self->_zoomLevel = a3;
    -[PXCuratedLibraryAssetsDataSourceManager signalChange:](self, "signalChange:", 2);
    -[PXCuratedLibraryAssetsDataSourceManager _invalidatePropertiesDerivedFromZoomLevel](self, "_invalidatePropertiesDerivedFromZoomLevel");
  }
}

- (void)setLibraryFilter:(int64_t)a3
{
  if (self->_libraryFilter != a3)
  {
    self->_libraryFilter = a3;
    -[PXCuratedLibraryAssetsDataSourceManager _invalidateDataSourceProperties](self, "_invalidateDataSourceProperties");
  }
}

- (void)setCanIncludeUnsavedSyndicatedAssets:(BOOL)a3
{
  void *v4;
  int v5;
  uint64_t i;
  void *v7;
  id v8;

  if (self->_canIncludeUnsavedSyndicatedAssets != a3)
  {
    self->_canIncludeUnsavedSyndicatedAssets = a3;
    -[PXCuratedLibraryAssetsDataSourceManager _photosDataSourceForZoomLevel:](self, "_photosDataSourceForZoomLevel:", 4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCanIncludeUnsavedSyndicatedAssets:", self->_canIncludeUnsavedSyndicatedAssets);
    +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "enableFilteringCuratedGridsForContentSyndication");

    if (v5)
    {
      for (i = 1; i != 4; ++i)
      {
        -[PXCuratedLibraryAssetsDataSourceManager _photosDataSourceForZoomLevel:](self, "_photosDataSourceForZoomLevel:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCanIncludeUnsavedSyndicatedAssets:", self->_canIncludeUnsavedSyndicatedAssets);

      }
    }
    -[PXCuratedLibraryAssetsDataSourceManager signalChange:](self, "signalChange:", 64);

  }
}

- (void)setAllPhotosFilterPredicate:(id)a3
{
  NSPredicate *v4;
  char v5;
  NSPredicate *v6;
  NSPredicate *allPhotosFilterPredicate;
  NSPredicate *v8;

  v8 = (NSPredicate *)a3;
  v4 = self->_allPhotosFilterPredicate;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSPredicate isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSPredicate *)-[NSPredicate copy](v8, "copy");
      allPhotosFilterPredicate = self->_allPhotosFilterPredicate;
      self->_allPhotosFilterPredicate = v6;

      -[PXCuratedLibraryAssetsDataSourceManager _invalidateDataSourceProperties](self, "_invalidateDataSourceProperties");
      -[PXCuratedLibraryAssetsDataSourceManager signalChange:](self, "signalChange:", 16);
    }
  }

}

- (void)loadIfNeeded
{
  _QWORD v3[5];

  if (!-[PXCuratedLibraryAssetsDataSourceManager canLoadData](self, "canLoadData"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __55__PXCuratedLibraryAssetsDataSourceManager_loadIfNeeded__block_invoke;
    v3[3] = &unk_1E5145EC0;
    v3[4] = self;
    -[PXCuratedLibraryAssetsDataSourceManager performChanges:](self, "performChanges:", v3);
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $05F47BB36353277DD660C96D212AC621 *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->isSelectingAssets = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->visibleAssetCollections = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->willTransitionFromZoomLevelToZoomLevel = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didTransitionFromZoomLevelToZoomLevel = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->dominantAssetCollectionReferenceForZoomLevel = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->transitionTypeFromZoomLevelToZoomLevel = objc_opt_respondsToSelector() & 1;
  }

}

- (PXCuratedLibraryAssetsDataSourceManager)initWithConfiguration:(id)a3
{
  id v5;
  PXCuratedLibraryAssetsDataSourceManager *v6;
  PXCuratedLibraryAssetsDataSourceManager *v7;
  uint64_t v8;
  PXUpdater *updater;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryAssetsDataSourceManager;
  v6 = -[PXSectionedDataSourceManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_enableDays = objc_msgSend(v5, "enableDays");
    v7->_libraryFilter = 0;
    v8 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v7, sel_setNeedsUpdate);
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v8;

    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateDataSourceManagers);
    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateDataSourceProperties);
    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updatePropertiesDerivedFromZoomLevel);
    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateCuration);
    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateDataSource);
  }

  return v7;
}

void __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_6;
  v6[3] = &unk_1E5149198;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "scheduleMainQueueTask:", v6);

}

- (void)_updateCuration
{
  $05F47BB36353277DD660C96D212AC621 *p_delegateRespondsTo;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  p_delegateRespondsTo = &self->_delegateRespondsTo;
  if (self->_delegateRespondsTo.isSelectingAssets
    && (-[PXCuratedLibraryAssetsDataSourceManager delegate](self, "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isSelectingAssetsFromCuratedLibraryAssetsDataSourceManager:", self),
        v4,
        (v5 & 1) != 0)
    || !p_delegateRespondsTo->visibleAssetCollections)
  {
    v8 = 0;
  }
  else
  {
    -[PXCuratedLibraryAssetsDataSourceManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visibleAssetCollectionsFromCuratedLibraryAssetsDataSourceManager:", self);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PXCuratedLibraryAssetsDataSourceManager _photosDataSourceForZoomLevel:](self, "_photosDataSourceForZoomLevel:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWantsCurationForAllCollections:collectionsToDiff:", -[PXCuratedLibraryAssetsDataSourceManager wantsCuration](self, "wantsCuration"), v8);

}

- (PXCuratedLibraryAssetsDataSourceManagerDelegate)delegate
{
  return (PXCuratedLibraryAssetsDataSourceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

uint64_t __90__PXCuratedLibraryAssetsDataSourceManager_forceAccurateSection_andSectionsBeforeAndAfter___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "forceAccurateSection:andSectionsBeforeAndAfter:", a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

- (BOOL)wantsCuration
{
  return self->_wantsCuration;
}

- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4
{
  void *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[PXCuratedLibraryAssetsDataSourceManager currentAssetsDataSourceManager](self, "currentAssetsDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__PXCuratedLibraryAssetsDataSourceManager_forceAccurateSection_andSectionsBeforeAndAfter___block_invoke;
  v8[3] = &unk_1E5145EE8;
  v8[4] = &v9;
  v8[5] = a3;
  v8[6] = a4;
  objc_msgSend(v6, "performChanges:", v8);
  LOBYTE(a4) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return a4;
}

- (PXAssetsDataSourceManager)currentAssetsDataSourceManager
{
  NSDictionary *dataSourceManagerByZoomLevel;
  void *v3;
  void *v4;

  dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PXCuratedLibraryAssetsDataSourceManager zoomLevelForCurrentDataSourceManager](self, "zoomLevelForCurrentDataSourceManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](dataSourceManagerByZoomLevel, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAssetsDataSourceManager *)v4;
}

uint64_t __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "zoomLevel");
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performChanges:", &__block_literal_global_289268);

  return objc_msgSend(*(id *)(a1 + 40), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_176_289269);
}

- (PXCuratedLibraryAssetsDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsDataSourceManager.m"), 77, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryAssetsDataSourceManager init]");

  abort();
}

- (void)setCurationEnabled:(BOOL)a3 forAssetCollection:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[PXCuratedLibraryAssetsDataSourceManager _photosDataSourceForZoomLevel:](self, "_photosDataSourceForZoomLevel:", 3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWantsCuration:forAssetCollection:", v4, v6);

}

- (id)assetsInAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  void *v9;
  void *v10;
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;

  v4 = a3;
  -[PXCuratedLibraryAssetsDataSourceManager dataSourceManagerForZoomLevel:](self, "dataSourceManagerForZoomLevel:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = objc_alloc((Class)off_1E50B1668);
    v8 = *((_OWORD *)off_1E50B8778 + 1);
    v13 = *(_OWORD *)off_1E50B8778;
    v14 = v8;
    v9 = (void *)objc_msgSend(v7, "initWithAssetCollection:keyAssetReference:indexPath:", v4, 0, &v13);
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v6, "indexPathForAssetCollectionReference:", v9);
    v10 = 0;
    if ((_QWORD)v13 != *(_QWORD *)off_1E50B7E98)
    {
      v12[0] = v13;
      v12[1] = v14;
      objc_msgSend(v6, "assetsInSectionIndexPath:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)visualPositionsChangeDetailsFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4
{
  void *v6;

  if (-[PXCuratedLibraryAssetsDataSourceManager lastVisualPositionsChangeFromDataSourceIdentifier](self, "lastVisualPositionsChangeFromDataSourceIdentifier") == a3&& -[PXCuratedLibraryAssetsDataSourceManager lastVisualPositionsChangeToDataSourceIdentifier](self, "lastVisualPositionsChangeToDataSourceIdentifier") == a4)
  {
    -[PXCuratedLibraryAssetsDataSourceManager lastVisualPositionsChangeDetails](self, "lastVisualPositionsChangeDetails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int64_t)transitionTypeFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4
{
  if (-[PXCuratedLibraryAssetsDataSourceManager lastVisualPositionsChangeFromDataSourceIdentifier](self, "lastVisualPositionsChangeFromDataSourceIdentifier") == a3&& -[PXCuratedLibraryAssetsDataSourceManager lastVisualPositionsChangeToDataSourceIdentifier](self, "lastVisualPositionsChangeToDataSourceIdentifier") == a4)
  {
    return -[PXCuratedLibraryAssetsDataSourceManager lastTransitionType](self, "lastTransitionType");
  }
  else
  {
    return 0;
  }
}

- (void)setAllPhotosSortDescriptors:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *allPhotosSortDescriptors;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_allPhotosSortDescriptors;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      allPhotosSortDescriptors = self->_allPhotosSortDescriptors;
      self->_allPhotosSortDescriptors = v6;

      -[PXCuratedLibraryAssetsDataSourceManager _invalidateDataSourceProperties](self, "_invalidateDataSourceProperties");
      -[PXCuratedLibraryAssetsDataSourceManager signalChange:](self, "signalChange:", 32);
    }
  }

}

- (BOOL)forceAllPhotosAccurateIfNeeded
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  char v6;
  _QWORD v8[5];
  uint8_t buf[16];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[PXCuratedLibraryAssetsDataSourceManager dataSourceManagerForZoomLevel:](self, "dataSourceManagerForZoomLevel:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "areAllSectionsConsideredAccurate");

  if ((v4 & 1) == 0)
  {
    PLCuratedLibraryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Forcing all photos to be accurate.", buf, 2u);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__PXCuratedLibraryAssetsDataSourceManager_forceAllPhotosAccurateIfNeeded__block_invoke;
    v8[3] = &unk_1E5145E98;
    v8[4] = &v10;
    objc_msgSend(v2, "performChanges:", v8);
  }
  v6 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)assetCollectionReferencesInDataSourceForZoomLevel:(int64_t)a3 withParentAssetCollectionReference:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[PXCuratedLibraryAssetsDataSourceManager dataSourceForZoomLevel:](self, "dataSourceForZoomLevel:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollectionReferencesWithParentAssetCollectionReference:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)assetCollectionReferencesInDataSourceForZoomLevel:(int64_t)a3 withParentAssetCollectionReference:(id)a4 assetCollectionReferenceWithSameKeyAssetAsParent:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  -[PXCuratedLibraryAssetsDataSourceManager dataSourceForZoomLevel:](self, "dataSourceForZoomLevel:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetCollectionReferencesWithParentAssetCollectionReference:assetCollectionReferenceWithSameKeyAssetAsParent:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)firstAssetCollectionReferenceInDataSourceForZoomLevel:(int64_t)a3 withParent:(id)a4
{
  void *v4;
  void *v5;

  -[PXCuratedLibraryAssetsDataSourceManager assetCollectionReferencesInDataSourceForZoomLevel:withParentAssetCollectionReference:](self, "assetCollectionReferencesInDataSourceForZoomLevel:withParentAssetCollectionReference:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTransientKeyAsset:(id)a3 forAssetCollection:(id)a4 zoomLevel:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    -[PXCuratedLibraryAssetsDataSourceManager _photosDataSourceForZoomLevel:](self, "_photosDataSourceForZoomLevel:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setKeyAsset:forAssetCollection:", v11, v9);

  }
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[PXCuratedLibraryAssetsDataSourceManager forceAccurateSectionsIfNeeded:inZoomLevel:](self, "forceAccurateSectionsIfNeeded:inZoomLevel:", v4, -[PXCuratedLibraryAssetsDataSourceManager currentDataSourceZoomLevel](self, "currentDataSourceZoomLevel"));

  return (char)self;
}

- (BOOL)forceAccurateAllSectionsIfNeeded
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSDictionary objectEnumerator](self->_dataSourceManagerByZoomLevel, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v10[0] = v5;
        v10[1] = 3221225472;
        v10[2] = __75__PXCuratedLibraryAssetsDataSourceManager_forceAccurateAllSectionsIfNeeded__block_invoke;
        v10[3] = &unk_1E5145E98;
        v10[4] = &v15;
        objc_msgSend(v7, "performChanges:", v10);
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v3);
  }

  v8 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3 inZoomLevel:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[PXCuratedLibraryAssetsDataSourceManager dataSourceManagerForZoomLevel:](self, "dataSourceManagerForZoomLevel:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PXCuratedLibraryAssetsDataSourceManager_forceAccurateSectionsIfNeeded_inZoomLevel___block_invoke;
  v10[3] = &unk_1E5145F10;
  v12 = &v13;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "performChanges:", v10);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6;
  id v7;
  NSDictionary *dataSourceManagerByZoomLevel;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  double v17;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__PXCuratedLibraryAssetsDataSourceManager_pauseChangeDeliveryWithTimeout_identifier___block_invoke;
  v14[3] = &unk_1E5145F60;
  v17 = a3;
  v15 = v6;
  v9 = v7;
  v16 = v9;
  v10 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](dataSourceManagerByZoomLevel, "enumerateKeysAndObjectsUsingBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

- (void)resumeChangeDelivery:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__PXCuratedLibraryAssetsDataSourceManager_resumeChangeDelivery___block_invoke;
    v5[3] = &unk_1E51489F0;
    v5[4] = self;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  }

}

- (void)_invalidateDataSourceProperties
{
  id v2;

  -[PXCuratedLibraryAssetsDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDataSourceProperties);

}

- (void)_updateDataSourceProperties
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __70__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceProperties__block_invoke;
  v2[3] = &unk_1E51460C0;
  v2[4] = self;
  -[PXCuratedLibraryAssetsDataSourceManager _enumeratePhotoKitDataDataSourceManagers:](self, "_enumeratePhotoKitDataDataSourceManagers:", v2);
}

- (NSArray)allPhotosSortDescriptors
{
  return self->_allPhotosSortDescriptors;
}

- (BOOL)canIncludeUnsavedSyndicatedAssets
{
  return self->_canIncludeUnsavedSyndicatedAssets;
}

- (BOOL)enableDays
{
  return self->_enableDays;
}

- (PXVisualPositionsChangeDetails)lastVisualPositionsChangeDetails
{
  return self->_lastVisualPositionsChangeDetails;
}

- (int64_t)lastTransitionType
{
  return self->_lastTransitionType;
}

- (int64_t)lastVisualPositionsChangeFromDataSourceIdentifier
{
  return self->_lastVisualPositionsChangeFromDataSourceIdentifier;
}

- (int64_t)lastVisualPositionsChangeToDataSourceIdentifier
{
  return self->_lastVisualPositionsChangeToDataSourceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastVisualPositionsChangeDetails, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_allPhotosSortDescriptors, 0);
  objc_storeStrong((id *)&self->_allPhotosFilterPredicate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentSyndicationConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManagerByZoomLevel, 0);
}

void __72__PXCuratedLibraryAssetsDataSourceManager_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
  v3 = a2;
  objc_msgSend(v3, "setCanIncludeUnsavedSyndicatedAssets:", objc_msgSend(v2, "showUnsavedSyndicatedContentInPhotosGrids"));

}

uint64_t __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "forceAccurateSection:andSectionsBeforeAndAfter:", a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

id __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64x2_t v13;
  _QWORD v14[2];
  int64x2_t v15;

  v5 = a1;
  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v7 = objc_msgSend(v5, "numberOfSections");
  v8 = objc_msgSend(v5, "identifier");
  v9 = a3 - 6;
  v13 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  do
  {
    if (v9 + 1 >= 0 && v9 + 1 < v7)
    {
      v14[0] = v8;
      v14[1] = v9 + 1;
      v15 = v13;
      objc_msgSend(v5, "assetCollectionAtSectionIndexPath:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v10, a2))
        objc_msgSend(v6, "addIndex:", v9 + 1);

    }
    ++v9;
  }
  while (v9 < a3 + 5);
  v11 = (void *)objc_msgSend(v6, "copy");

  return v11;
}

void __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

}

void __70__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceProperties__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a3;
  objc_msgSend(v5, "photosDataSourceIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __70__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceProperties__block_invoke_2;
  v14 = &unk_1E5146098;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v5;
  v18 = a2;
  v7 = v6;
  v17 = v7;
  v8 = v5;
  v9 = _Block_copy(&v11);
  v10 = v9;
  if (v7)
    objc_msgSend(v7, "performChanges:", v9, v11, v12, v13, v14, v15, v16, v17, v18);
  else
    (*((void (**)(void *))v9 + 2))(v9);

}

void __70__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceProperties__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "libraryFilter");
  if (v2 != objc_msgSend(*(id *)(a1 + 40), "libraryFilter"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setLibraryFilter:", v2);
    v3 = *(_QWORD *)(a1 + 56);
    if (v3 != 4)
    {
      v4 = *(void **)(a1 + 48);
      if (v4)
      {
        objc_msgSend(v4, "photoLibrary");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        PXCuratedLibraryFetchHighlights(v3, v5, v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "setCollectionListFetchResult:", v6);
      }
    }
  }
  if (*(_QWORD *)(a1 + 56) == 4)
  {
    objc_msgSend(*(id *)(a1 + 40), "setFilterPredicate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
    objc_msgSend(*(id *)(a1 + 40), "setSortDescriptors:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
  }
}

uint64_t __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_177);
}

uint64_t __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startBackgroundFetchIfNeeded");
}

void __64__PXCuratedLibraryAssetsDataSourceManager_resumeChangeDelivery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "dataSourceManagerForZoomLevel:", objc_msgSend(a2, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PXCuratedLibraryAssetsDataSourceManager_resumeChangeDelivery___block_invoke_2;
  v8[3] = &unk_1E5145F88;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performChanges:", v8);

}

uint64_t __64__PXCuratedLibraryAssetsDataSourceManager_resumeChangeDelivery___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resumeChangeDeliveryAndBackgroundLoading:", *(_QWORD *)(a1 + 32));
}

void __85__PXCuratedLibraryAssetsDataSourceManager_pauseChangeDeliveryWithTimeout_identifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PXCuratedLibraryAssetsDataSourceManager_pauseChangeDeliveryWithTimeout_identifier___block_invoke_2;
  v7[3] = &unk_1E5145F38;
  v11 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "performChanges:", v7);

}

void __85__PXCuratedLibraryAssetsDataSourceManager_pauseChangeDeliveryWithTimeout_identifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "pauseChangeDeliveryWithTimeout:identifier:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 48));

}

uint64_t __85__PXCuratedLibraryAssetsDataSourceManager_forceAccurateSectionsIfNeeded_inZoomLevel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "forceAccurateSectionsIfNeeded:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __75__PXCuratedLibraryAssetsDataSourceManager_forceAccurateAllSectionsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "forceAccurateAllSectionsIfNeeded");
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __73__PXCuratedLibraryAssetsDataSourceManager_forceAllPhotosAccurateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "forceAccurateAllSectionsIfNeeded");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
