@implementation QLCacheIndexDatabaseQueryEnumerator

- (QLCacheFileIdentifier)fileIdentifier
{
  return self->_fileIdentifier;
}

- (float)size
{
  return self->_size;
}

- (QLCacheBlobInfo)metadataBlobInfo
{
  return self->_plistBufferBlobInfo;
}

- (int)interpolationQuality
{
  return self->_interpolationQuality;
}

- (int64_t)iconVariant
{
  return self->_iconVariant;
}

- (unsigned)iconMode
{
  return self->_iconMode;
}

- (unint64_t)externalGeneratorDataHash
{
  return self->_externalGeneratorDataHash;
}

- (unint64_t)cacheId
{
  return self->_cacheId;
}

- (QLTBitmapFormat)bitmapFormat
{
  return self->_bitmapFormat;
}

- (QLCacheBlobInfo)bitmapDataBlobInfo
{
  return self->_bitmapDataBlobInfo;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (BOOL)nextThumbnailInfo
{
  QLCacheIndexDatabaseQueryEnumerator *v2;
  sqlite3_stmt **p_stmt;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  float v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  QLCacheFileIdentifier *fileIdentifier;
  unint64_t v32;
  unint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD, _QWORD);
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  QLCacheIndexDatabaseQueryEnumerator *v40;
  void *v41;
  uint64_t v42;
  BOOL v43;
  BOOL v44;
  void *v45;
  uint64_t v46;
  QLCacheFileIdentifier *v47;
  float v48;
  id v49;
  uint64_t v50;
  id v51;
  QLTBitmapFormat *bitmapFormat;
  uint64_t v53;
  NSObject *v54;
  QLCacheBlobInfo *v55;
  QLCacheBlobInfo *bitmapDataBlobInfo;
  QLCacheBlobInfo *v57;
  QLCacheBlobInfo *plistBufferBlobInfo;
  void *v59;
  uint64_t v60;
  NSDate *lastHitDate;
  QLCacheIndexDatabaseQueryEnumerator *v63;
  sqlite3_stmt **v64;
  NSArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  id v70;
  char v71;
  _QWORD v72[4];
  float v73;
  _QWORD v74[4];
  float v75;
  _QWORD v76[4];
  float v77;
  _QWORD v78[4];
  float v79;
  _QWORD v80[6];
  _QWORD v81[6];
  _QWORD v82[6];
  _QWORD v83[6];
  _QWORD v84[6];
  _QWORD v85[4];
  float v86;
  _QWORD aBlock[5];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  uint64_t v93;

  v2 = self;
  v93 = *MEMORY[0x1E0C80C00];
  p_stmt = &self->super._stmt;
  v64 = &self->super._stmt;
  if (self->super._stmt)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT file_id, size, icon_mode, bitmapFormat, bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length, flavor, content_rect, hit_count, last_hit_date, badge_type, icon_variant, interpolation, externalGeneratorDataHash FROM thumbnails WHERE "));
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v6 = v2->_allFileRequests;
    v68 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
    if (v68)
    {
      v63 = v2;
      v69 = 0;
      v7 = 0;
      v67 = *(_QWORD *)v89;
      v8 = MEMORY[0x1E0C809B0];
      v65 = v6;
      do
      {
        for (i = 0; i != v68; ++i)
        {
          if (*(_QWORD *)v89 != v67)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
          if (objc_msgSend(v10, "cacheId"))
          {
            if (v7 >= 1)
              objc_msgSend(v5, "appendString:", CFSTR(" OR "));
            v11 = objc_msgSend(v10, "cacheId");
            objc_msgSend(v5, "appendFormat:", CFSTR("(file_id=?"));
            aBlock[0] = v8;
            aBlock[1] = 3221225472;
            aBlock[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke;
            aBlock[3] = &__block_descriptor_40_e47_v28__0i8__sqlite3_stmt__12__QLSqliteDatabase_20l;
            aBlock[4] = v11;
            v12 = _Block_copy(aBlock);
            objc_msgSend(v4, "addObject:", v12);

            if ((v69 & 1) != 0)
              v69 = 1;
            else
              v69 = objc_msgSend(v10, "hasAtLeastOneLowQuality");
            if ((objc_msgSend(v10, "allSizes") & 1) == 0 && (objc_msgSend(v10, "hasAtLeastOneLowQuality") & 1) == 0)
            {
              v66 = v7;
              objc_msgSend(v5, "appendFormat:", CFSTR(" AND ("));
              v13 = objc_msgSend(v10, "sizeAndIconModeCount");
              if (v13 >= 1)
              {
                v14 = v13;
                for (j = 0; j != v14; ++j)
                {
                  if (j)
                    objc_msgSend(v5, "appendString:", CFSTR(" OR "));
                  objc_msgSend(v10, "minimumSizeAtIndex:", j);
                  v17 = v16;
                  if (v16 > 0.0)
                    objc_msgSend(v5, "appendFormat:", CFSTR("("));
                  objc_msgSend(v10, "sizeAtIndex:", j);
                  v19 = v18;
                  objc_msgSend(v5, "appendFormat:", CFSTR("(size=? AND icon_mode=? AND badge_type=? AND icon_variant=? AND interpolation=? AND externalGeneratorDataHash=?)"));
                  v85[0] = v8;
                  v85[1] = 3221225472;
                  v85[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_2;
                  v85[3] = &__block_descriptor_36_e47_v28__0i8__sqlite3_stmt__12__QLSqliteDatabase_20l;
                  v86 = v19;
                  v20 = _Block_copy(v85);
                  objc_msgSend(v4, "addObject:", v20);

                  v84[0] = v8;
                  v84[1] = 3221225472;
                  v84[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_3;
                  v84[3] = &unk_1E99D3150;
                  v84[4] = v10;
                  v84[5] = j;
                  v21 = _Block_copy(v84);
                  objc_msgSend(v4, "addObject:", v21);

                  v83[0] = v8;
                  v83[1] = 3221225472;
                  v83[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_4;
                  v83[3] = &unk_1E99D3150;
                  v83[4] = v10;
                  v83[5] = j;
                  v22 = _Block_copy(v83);
                  objc_msgSend(v4, "addObject:", v22);

                  v82[0] = v8;
                  v82[1] = 3221225472;
                  v82[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_5;
                  v82[3] = &unk_1E99D3150;
                  v82[4] = v10;
                  v82[5] = j;
                  v23 = _Block_copy(v82);
                  objc_msgSend(v4, "addObject:", v23);

                  v81[0] = v8;
                  v81[1] = 3221225472;
                  v81[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_6;
                  v81[3] = &unk_1E99D3150;
                  v81[4] = v10;
                  v81[5] = j;
                  v24 = _Block_copy(v81);
                  objc_msgSend(v4, "addObject:", v24);

                  v80[0] = v8;
                  v80[1] = 3221225472;
                  v80[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_7;
                  v80[3] = &unk_1E99D3150;
                  v80[4] = v10;
                  v80[5] = j;
                  v25 = _Block_copy(v80);
                  objc_msgSend(v4, "addObject:", v25);

                  v26 = fmaxf(v19 + v19, 1024.0);
                  objc_msgSend(v5, "appendFormat:", CFSTR(" AND (width<=? OR height<=?)"));
                  v78[0] = v8;
                  v78[1] = 3221225472;
                  v78[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_8;
                  v78[3] = &__block_descriptor_36_e47_v28__0i8__sqlite3_stmt__12__QLSqliteDatabase_20l;
                  v79 = v26;
                  v27 = _Block_copy(v78);
                  objc_msgSend(v4, "addObject:", v27);

                  v76[0] = v8;
                  v76[1] = 3221225472;
                  v76[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_9;
                  v76[3] = &__block_descriptor_36_e47_v28__0i8__sqlite3_stmt__12__QLSqliteDatabase_20l;
                  v77 = v26;
                  v28 = _Block_copy(v76);
                  objc_msgSend(v4, "addObject:", v28);

                  if (v17 > 0.0)
                  {
                    objc_msgSend(v5, "appendFormat:", CFSTR(" AND width>=? AND height>=?)"));
                    v74[0] = v8;
                    v74[1] = 3221225472;
                    v74[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_10;
                    v74[3] = &__block_descriptor_36_e47_v28__0i8__sqlite3_stmt__12__QLSqliteDatabase_20l;
                    v75 = v17;
                    v29 = _Block_copy(v74);
                    objc_msgSend(v4, "addObject:", v29);

                    v72[0] = v8;
                    v72[1] = 3221225472;
                    v72[2] = __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_11;
                    v72[3] = &__block_descriptor_36_e47_v28__0i8__sqlite3_stmt__12__QLSqliteDatabase_20l;
                    v73 = v17;
                    v30 = _Block_copy(v72);
                    objc_msgSend(v4, "addObject:", v30);

                  }
                }
              }
              objc_msgSend(v5, "appendString:", CFSTR(")"));
              v6 = v65;
              v7 = v66;
            }
            ++v7;
            objc_msgSend(v5, "appendString:", CFSTR(")"));
          }
        }
        v68 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
      }
      while (v68);

      p_stmt = v64;
      if ((v69 & 1) != 0)
        objc_msgSend(v5, "appendString:", CFSTR(" ORDER BY file_id, icon_mode ASC, size ASC"));
      v2 = v63;
      if (v7 >= 1)
        v63->super._stmt = -[QLSqliteDatabase prepareStatement:](v63->super._sqliteDatabase, "prepareStatement:", objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    }
    else
    {

    }
    if (!*p_stmt)
      goto LABEL_52;
  }
  fileIdentifier = v2->_fileIdentifier;
  if (fileIdentifier)
  {
    v2->_fileIdentifier = 0;

  }
  if (objc_msgSend(v4, "count"))
  {
    v32 = 0;
    do
    {
      v33 = v32 + 1;
      objc_msgSend(v4, "objectAtIndexedSubscript:");
      v34 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, unint64_t, sqlite3_stmt *, QLSqliteDatabase *))v34)[2](v34, v33, v2->super._stmt, v2->super._sqliteDatabase);

      v35 = objc_msgSend(v4, "count");
      v32 = v33;
    }
    while (v33 < v35);
  }
  v71 = 0;
  if (!-[QLSqliteDatabase stepStatement:didReturnData:](v2->super._sqliteDatabase, "stepStatement:didReturnData:", v2->super._stmt, &v71)|| !v71)
  {
LABEL_51:
    -[QLSqliteDatabase finalizeStatement:](v2->super._sqliteDatabase, "finalizeStatement:", v64);
LABEL_52:
    v44 = 0;
    goto LABEL_59;
  }
  while (1)
  {
    v36 = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](v2->super._sqliteDatabase, "unsignedLongLongFromColumn:inStatement:", 0, v2->super._stmt);
    v37 = -[NSDictionary count](v2->_fileRequests, "count");
    if (v37)
      break;
LABEL_46:
    if (-[QLSqliteDatabase stepStatement:didReturnData:](v2->super._sqliteDatabase, "stepStatement:didReturnData:", v2->super._stmt, &v71))
    {
      v43 = v71 == 0;
    }
    else
    {
      v43 = 1;
    }
    if (v43)
      goto LABEL_51;
  }
  v38 = v37;
  v39 = 0;
  while (1)
  {
    v40 = v2;
    -[NSArray objectAtIndexedSubscript:](v2->_allFileRequests, "objectAtIndexedSubscript:", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "cacheId");

    if (v36 == v42)
      break;
    ++v39;
    v2 = v40;
    if (v38 == v39)
      goto LABEL_46;
  }
  -[NSArray objectAtIndexedSubscript:](v40->_allFileRequests, "objectAtIndexedSubscript:", v39);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "fileIdentifier");
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = v40->_fileIdentifier;
  v40->_fileIdentifier = (QLCacheFileIdentifier *)v46;

  v40->_cacheId = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](v40->super._sqliteDatabase, "unsignedLongLongFromColumn:inStatement:", 0, v40->super._stmt);
  -[QLSqliteDatabase floatFromColumn:inStatement:](v40->super._sqliteDatabase, "floatFromColumn:inStatement:", 1, v40->super._stmt);
  v40->_size = v48;
  v40->_iconMode = -[QLSqliteDatabase intFromColumn:inStatement:](v40->super._sqliteDatabase, "intFromColumn:inStatement:", 2, v40->super._stmt);
  v49 = -[QLSqliteDatabase newDataFromColumn:inStatement:copyBytes:](v40->super._sqliteDatabase, "newDataFromColumn:inStatement:copyBytes:", 3, v40->super._stmt, 0);
  v70 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v49, &v70);
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = v70;
  bitmapFormat = v40->_bitmapFormat;
  v40->_bitmapFormat = (QLTBitmapFormat *)v50;

  if (!v40->_bitmapFormat)
  {
    v53 = MEMORY[0x1E0CD3398];
    v54 = *(NSObject **)(MEMORY[0x1E0CD3398] + 56);
    if (!v54)
    {
      QLTInitLogging();
      v54 = *(NSObject **)(v53 + 56);
    }
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      -[QLCacheIndexDatabaseQueryEnumerator nextThumbnailInfo].cold.1((uint64_t)v49, (uint64_t)v51, v54);
  }
  v55 = objc_alloc_init(QLCacheBlobInfo);
  bitmapDataBlobInfo = v40->_bitmapDataBlobInfo;
  v40->_bitmapDataBlobInfo = v55;

  -[QLCacheBlobInfo setLocation:](v40->_bitmapDataBlobInfo, "setLocation:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](v40->super._sqliteDatabase, "unsignedLongLongFromColumn:inStatement:", 4, v40->super._stmt));
  -[QLCacheBlobInfo setLength:](v40->_bitmapDataBlobInfo, "setLength:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](v40->super._sqliteDatabase, "unsignedLongLongFromColumn:inStatement:", 5, v40->super._stmt));
  v57 = objc_alloc_init(QLCacheBlobInfo);
  plistBufferBlobInfo = v40->_plistBufferBlobInfo;
  v40->_plistBufferBlobInfo = v57;

  -[QLCacheBlobInfo setLocation:](v40->_plistBufferBlobInfo, "setLocation:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](v40->super._sqliteDatabase, "unsignedLongLongFromColumn:inStatement:", 6, v40->super._stmt));
  -[QLCacheBlobInfo setLength:](v40->_plistBufferBlobInfo, "setLength:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](v40->super._sqliteDatabase, "unsignedLongLongFromColumn:inStatement:", 7, v40->super._stmt));
  v40->_hitCount = -[QLSqliteDatabase intFromColumn:inStatement:](v40->super._sqliteDatabase, "intFromColumn:inStatement:", 10, v40->super._stmt);
  v59 = (void *)MEMORY[0x1E0C99D68];
  -[QLSqliteDatabase doubleFromColumn:inStatement:](v40->super._sqliteDatabase, "doubleFromColumn:inStatement:", 11, v40->super._stmt);
  objc_msgSend(v59, "dateWithTimeIntervalSinceReferenceDate:");
  v60 = objc_claimAutoreleasedReturnValue();
  lastHitDate = v40->_lastHitDate;
  v40->_lastHitDate = (NSDate *)v60;

  v40->_badgeType = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](v40->super._sqliteDatabase, "unsignedLongLongFromColumn:inStatement:", 12, v40->super._stmt);
  v40->_iconVariant = -[QLSqliteDatabase intFromColumn:inStatement:](v40->super._sqliteDatabase, "intFromColumn:inStatement:", 13, v40->super._stmt);
  v40->_interpolationQuality = -[QLSqliteDatabase intFromColumn:inStatement:](v40->super._sqliteDatabase, "intFromColumn:inStatement:", 14, v40->super._stmt);
  v40->_externalGeneratorDataHash = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](v40->super._sqliteDatabase, "unsignedLongLongFromColumn:inStatement:", 15, v40->super._stmt);

  v44 = 1;
LABEL_59:

  return v44;
}

uint64_t __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "bindUnsignedLongLong:atIndex:inStatement:", vcvtms_u32_f32(*(float *)(a1 + 32)), a2, a3);
}

uint64_t __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "bindUnsignedLongLong:atIndex:inStatement:", vcvtms_u32_f32(*(float *)(a1 + 32)), a2, a3);
}

void __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = a4;
  objc_msgSend(v8, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v6, "externalGeneratorDataHashAtIndex:", v7), a2, a3);

}

void __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = a4;
  objc_msgSend(v8, "bindUnsignedLongLong:atIndex:inStatement:", (int)objc_msgSend(v6, "interpolationQualityAtIndex:", v7), a2, a3);

}

void __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = a4;
  objc_msgSend(v8, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v6, "iconVariantAtIndex:", v7), a2, a3);

}

void __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = a4;
  objc_msgSend(v8, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v6, "badgeTypeAtIndex:", v7), a2, a3);

}

void __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = a4;
  objc_msgSend(v8, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v6, "iconModeAtIndex:", v7), a2, a3);

}

uint64_t __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "bindUnsignedLongLong:atIndex:inStatement:", (unint64_t)*(float *)(a1 + 32), a2, a3);
}

uint64_t __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "bindUnsignedLongLong:atIndex:inStatement:", vcvtps_u32_f32(*(float *)(a1 + 32)), a2, a3);
}

uint64_t __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "bindUnsignedLongLong:atIndex:inStatement:", vcvtps_u32_f32(*(float *)(a1 + 32)), a2, a3);
}

uint64_t __56__QLCacheIndexDatabaseQueryEnumerator_nextThumbnailInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "bindUnsignedLongLong:atIndex:inStatement:", *(_QWORD *)(a1 + 32), a2, a3);
}

- (QLCacheIndexDatabaseQueryEnumerator)initWithSqliteDatabase:(id)a3 fileRequests:(id)a4
{
  id v7;
  QLCacheIndexDatabaseQueryEnumerator *v8;
  QLCacheIndexDatabaseQueryEnumerator *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)QLCacheIndexDatabaseQueryEnumerator;
  v8 = -[QLCacheIndexDatabaseGenericEnumerator initWithSqliteDatabase:](&v11, sel_initWithSqliteDatabase_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fileRequests, a4);
    -[QLCacheIndexDatabaseQueryEnumerator _getCacheIds](v9, "_getCacheIds");
  }

  return v9;
}

- (void)_getCacheIds
{
  NSArray *v3;
  NSArray *allFileRequests;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[NSDictionary allValues](self->_fileRequests, "allValues");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  allFileRequests = self->_allFileRequests;
  self->_allFileRequests = v3;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = self->_allFileRequests;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "fileIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", objc_opt_class());
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v11, "fileIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v13, objc_opt_class());

        }
        objc_msgSend(v13, "addObject:", v11);

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "objectEnumerator", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[QLCacheIndexDatabaseQueryEnumerator _getCacheIdsForHomogeneousArrayOfRequests:](self, "_getCacheIdsForHomogeneousArrayOfRequests:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (void)_getCacheIdsForHomogeneousArrayOfRequests:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  QLSqliteDatabase *sqliteDatabase;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  uint64_t v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  unsigned int v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v50 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if (v8)
        {
          objc_msgSend(v8, "appendString:", CFSTR(" OR "));
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "fileIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)objc_opt_class();

          objc_msgSend(v7, "queryStringToFindCacheIds");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)objc_msgSend(v13, "mutableCopy");

        }
        objc_msgSend(v11, "fileIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "whereClauseToFindCacheId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendString:", v15);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v48 = 0;
  sqliteDatabase = self->super._sqliteDatabase;
  v17 = objc_retainAutorelease(v8);
  v18 = -[QLSqliteDatabase prepareStatement:](sqliteDatabase, "prepareStatement:", objc_msgSend(v17, "UTF8String"));
  v48 = v18;
  if (v18)
  {
    v19 = v18;
    v38 = v17;
    v47 = 1;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v20 = v4;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v44 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "fileIdentifier", v38);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "bindInFindCacheIdStatement:database:startingAtIndex:gettingNextIndex:", v19, self->super._sqliteDatabase, v47, &v47);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v22);
    }

    v42 = 0;
    if (-[QLSqliteDatabase stepStatement:didReturnData:](self->super._sqliteDatabase, "stepStatement:didReturnData:", v19, &v42)&& v42)
    {
      v26 = 0x1EFF38000uLL;
      do
      {
        v27 = objc_msgSend(v7, "cacheIdFromRowId:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->super._sqliteDatabase, "unsignedLongLongFromColumn:inStatement:", 0, v19, v38));
        v28 = objc_alloc((Class)objc_msgSend(v7, "versionedFileIdentifierClass"));
        v19 = v48;
        v29 = (void *)objc_msgSend(v28, "initWithSteppedStatement:database:", v48, self->super._sqliteDatabase);
        objc_msgSend(v29, "fileIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(*(id *)((char *)&self->super.super.isa + *(int *)(v26 + 3004)), "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v31)
          {
            objc_msgSend(v31, "version");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
              goto LABEL_29;
            objc_msgSend(v29, "version");
            v34 = objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              v35 = (void *)v34;
              objc_msgSend(v29, "version");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "version");
              v41 = v27;
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v36, "isEqual:", v37);

              v27 = v41;
              v26 = 0x1EFF38000;

              if (v40)
LABEL_29:
                objc_msgSend(v32, "_setCacheId:", v27);
            }
          }
        }
        else
        {
          v32 = 0;
        }

      }
      while (-[QLSqliteDatabase stepStatement:didReturnData:](self->super._sqliteDatabase, "stepStatement:didReturnData:", v19, &v42)&& v42);
    }
    -[QLSqliteDatabase finalizeStatement:](self->super._sqliteDatabase, "finalizeStatement:", &v48, v38);
    v17 = v39;
  }

}

- (void)dealloc
{
  sqlite3_stmt **p_stmt;
  objc_super v4;

  p_stmt = &self->super._stmt;
  if (self->super._stmt)
    -[QLSqliteDatabase finalizeStatement:](self->super._sqliteDatabase, "finalizeStatement:", p_stmt);
  v4.receiver = self;
  v4.super_class = (Class)QLCacheIndexDatabaseQueryEnumerator;
  -[QLCacheIndexDatabaseGenericEnumerator dealloc](&v4, sel_dealloc, p_stmt);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitmapFormat, 0);
  objc_storeStrong((id *)&self->_plistBufferBlobInfo, 0);
  objc_storeStrong((id *)&self->_bitmapDataBlobInfo, 0);
  objc_storeStrong((id *)&self->_lastHitDate, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_allFileRequests, 0);
  objc_storeStrong((id *)&self->_fileRequests, 0);
}

- (unsigned)hitCount
{
  return self->_hitCount;
}

- (NSDate)lastHitDate
{
  return self->_lastHitDate;
}

- (int)flavor
{
  return self->_flavor;
}

- (CGRect)contentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentRect.origin.x;
  y = self->_contentRect.origin.y;
  width = self->_contentRect.size.width;
  height = self->_contentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)nextThumbnailInfo
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1D54AE000, log, OS_LOG_TYPE_ERROR, "cannot create the bitmap format based on data %@ : %@", (uint8_t *)&v3, 0x16u);
}

@end
