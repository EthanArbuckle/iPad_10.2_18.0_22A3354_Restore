@implementation NANDInfo_GeomErrorPayloadManager

- (NANDInfo_GeomErrorPayloadManager)initWithPayloadBuf:(char *)a3 bufSize:(unint64_t)a4 prevNumErrors:(unsigned int)a5
{
  NANDInfo_GeomErrorPayloadManager *v8;
  NANDInfo_GeomErrorPayloadManager *v9;
  NANDInfo_GeomErrorPayloadManager *v10;
  NSMutableArray *v11;
  NSMutableArray *error_payload_array;
  NSMutableArray *v13;
  NSMutableArray *error_pages_array;
  NSMutableDictionary *other_stats_dict;
  int v16;
  unsigned int v17;
  char *v18;
  unsigned int v19;
  uint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)NANDInfo_GeomErrorPayloadManager;
  v8 = -[NANDInfo_GeomErrorPayloadManager init](&v22, "init");
  v9 = v8;
  v10 = 0;
  if (a4 >= 4 && v8)
  {
    v8->_invalid_error_payload = 0;
    v8->_num_errors_in_payload_prev = a5;
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    error_payload_array = v9->_error_payload_array;
    v9->_error_payload_array = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    error_pages_array = v9->_error_pages_array;
    v9->_error_pages_array = v13;

    other_stats_dict = v9->_other_stats_dict;
    v9->_other_stats_dict = 0;

    v16 = *(_DWORD *)a3;
    if (*(_DWORD *)a3)
    {
      v17 = 0;
      v18 = a3 + 4;
      v19 = 4;
      do
      {
        v20 = *((unsigned __int16 *)v18 + 1) + 4;
        v19 += v20;
        if (a4 < v19)
          break;
        v17 += *((unsigned __int16 *)v18 + 11) + ((v18[12] >> 1) & 1);
        v18 += v20;
        --v16;
      }
      while (v16);
    }
    else
    {
      v17 = 0;
    }
    v9->_num_errors_in_payload_cur = v17;
    syslog(5, "total %u geom error entries. Previous %u", -[NANDInfo_GeomErrorPayloadManager num_errors_in_payload_cur](v9, "num_errors_in_payload_cur"), -[NANDInfo_GeomErrorPayloadManager num_errors_in_payload_prev](v9, "num_errors_in_payload_prev"));
    v10 = v9;
  }

  return v10;
}

- (void)parseErrorPayloadBuf:(char *)a3 bufSize:(unint64_t)a4
{
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  _WORD *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NANDInfo_GeomErrorPayloadManager *v50;
  int v51;
  char *v52;
  uint64_t v53;
  int v54;
  _QWORD v55[2];
  _QWORD v56[2];

  if (!a3 || a4 <= 3)
  {
    syslog(3, "Error: invalid geom error payload buffer");
    -[NANDInfo_GeomErrorPayloadManager setInvalid_error_payload:](self, "setInvalid_error_payload:", 1);
    return;
  }
  v7 = *(_DWORD *)a3;
  syslog(5, "total %u geom error entries", *(_DWORD *)a3);
  v51 = v7;
  if (!v7)
    return;
  v8 = 0;
  v9 = 0;
  v52 = &a3[a4];
  v10 = 0;
  v11 = a3 + 4;
  v50 = self;
  while (v52 >= v11 || v52 >= &v11[*((unsigned __int16 *)v11 + 1) + 4])
  {
    syslog(5, "Geom error idx %d", v10);
    if (*(_WORD *)v11)
    {
      syslog(3, "Error: entry %u mismatch in expected block tlv type");
      goto LABEL_32;
    }
    if (*((_WORD *)v11 + 2) != 1)
    {
      syslog(3, "Error: entry %u mismatch in expected err header tlv type");
      goto LABEL_32;
    }
    v12 = &v11[*((unsigned __int16 *)v11 + 3) + 8];
    if (*(_WORD *)v12 != 2)
    {
      syslog(3, "Error: entry %u mismatch in expected payload header tlv type");
      goto LABEL_32;
    }
    v13 = *(unsigned __int16 *)(v11 + 15);
    v14 = v12 + 4;
    v15 = (unint64_t)&v11[*((unsigned __int16 *)v11 + 1) + 4];
    if (v15 < (unint64_t)&v12[((unint64_t)(v13 + 3) >> 2) + 4])
    {
      syslog(3, "Error: entry %u end of geom error page status exceeds entry end");
      goto LABEL_32;
    }
    if (v15 > (unint64_t)v52)
    {
      syslog(3, "Error: entry %u end of geom error entry exceeds buffer end");
      goto LABEL_32;
    }
    v53 = (uint64_t)&v11[*((unsigned __int16 *)v11 + 1) + 4];
    v16 = objc_alloc_init((Class)NSMutableDictionary);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("ESR_header_i"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((_DWORD *)v11 + 2) & 0xF));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("msp"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (*((_DWORD *)v11 + 2) >> 4) & 1));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("channel"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (*((_DWORD *)v11 + 2) >> 5) & 0xF));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("die"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (*((_DWORD *)v11 + 2) >> 9) & 7));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("plane"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (*((_DWORD *)v11 + 2) >> 12) & 0x7FFF));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("bork"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((_DWORD *)v11 + 2) >> 27));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("reason"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)(v11 + 13)));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, CFSTR("failPage"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v13));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("numOfPages"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v11[17]));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("mode"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", (v11[12] >> 1) & 1));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v27, CFSTR("reliability"));

    v28 = v11[12] >> 2;
    if (v28 >= 4)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v11 + 25)));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v29, CFSTR("cycles"));

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v11 + 29)));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v30, CFSTR("age"));

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v11 + 33)));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v31, CFSTR("timeStamp"));

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)(v11 + 69)));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v32, CFSTR("readDisturbCounter"));

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v11[71]));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v33, CFSTR("flow"));

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v11[72]));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v34, CFSTR("minTemp"));

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v11[73]));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v35, CFSTR("maxTemp"));

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v11[24] & 1));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v36, CFSTR("openBlock"));

LABEL_15:
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *((unsigned __int16 *)v11 + 10)));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v37, CFSTR("numScannedPages"));

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *((unsigned __int16 *)v11 + 11)));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v38, CFSTR("numFailures"));

      goto LABEL_16;
    }
    if (v28 == 3)
      goto LABEL_15;
LABEL_16:
    v54 = v10;
    v39 = objc_alloc_init((Class)NSMutableArray);

    if ((_DWORD)v13)
    {
      v40 = 0;
      v41 = 0;
      do
      {
        v42 = (*((unsigned __int8 *)v14 + ((unint64_t)v41 >> 2)) >> (v40 & 6)) & 3;
        if ((_DWORD)v41 == *(unsigned __int16 *)(v11 + 13))
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (*((unsigned __int8 *)v14 + ((unint64_t)v41 >> 2)) >> (v40 & 6)) & 3));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v43, CFSTR("failPageStatus"));

        }
        if ((_DWORD)v42)
        {
          v55[0] = CFSTR("ESR_page_i");
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v41));
          v55[1] = CFSTR("ESR_page_i_status");
          v56[0] = v44;
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v42));
          v56[1] = v45;
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 2));
          objc_msgSend(v39, "addObject:", v46);

        }
        v41 = (v41 + 1);
        v40 += 2;
      }
      while ((_DWORD)v13 != (_DWORD)v41);
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v39, "count")));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v47, CFSTR("ESR_numFailedPages"));

    self = v50;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_payload_array](v50, "error_payload_array"));
    objc_msgSend(v48, "addObject:", v16);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_pages_array](v50, "error_pages_array"));
    objc_msgSend(v49, "addObject:", v39);

    v11 = (char *)v53;
    v10 = (v54 + 1);
    v8 = v16;
    v9 = v39;
    if ((_DWORD)v10 == v51)
    {

      return;
    }
  }
  syslog(3, "Error: entry %u end of geom error header exceeds buffer end");
LABEL_32:
  -[NANDInfo_GeomErrorPayloadManager setInvalid_error_payload:](self, "setInvalid_error_payload:", 1);

}

- (void)populateOtherStats:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_alloc_init((Class)NSMutableDictionary);
    -[NANDInfo_GeomErrorPayloadManager setOther_stats_dict:](self, "setOther_stats_dict:", v6);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(&off_1000BD230, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        v12 = v9;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(&off_1000BD230);
          v9 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11);

          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9));
          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9));
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager other_stats_dict](self, "other_stats_dict"));
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v9);

          }
          v11 = (char *)v11 + 1;
          v12 = v9;
        }
        while (v8 != v11);
        v8 = objc_msgSend(&off_1000BD230, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);

    }
  }

}

- (BOOL)iteratePerPageDictsForMaxPagesWithStatus:(unsigned int)a3 iteratorCallBack:(id)a4
{
  uint64_t (**v5)(id, id);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  NANDInfo_GeomErrorPayloadManager *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  int v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  int v37;
  id v38;
  char v39;
  void *v40;
  BOOL v41;
  int v43;
  void *v44;
  void *v45;
  NANDInfo_GeomErrorPayloadManager *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *context;
  void *v51;
  unsigned int v52;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];

  v5 = (uint64_t (**)(id, id))a4;
  if (-[NANDInfo_GeomErrorPayloadManager invalid_error_payload](self, "invalid_error_payload"))
    goto LABEL_30;
  v6 = objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_payload_array](self, "error_payload_array"));
  if (!v6)
    goto LABEL_30;
  v7 = (void *)v6;
  v8 = objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_pages_array](self, "error_pages_array"));
  if (!v8)
  {

    goto LABEL_30;
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager other_stats_dict](self, "other_stats_dict"));

  if (!v10)
  {
LABEL_30:
    syslog(3, "ERROR: Missing valid input data");
    v41 = 0;
    goto LABEL_31;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_payload_array](self, "error_payload_array"));
  v47 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v47)
  {
    v52 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v48 = *(_QWORD *)v60;
    v44 = v11;
    v46 = self;
    while (2)
    {
      v16 = 0;
      v17 = v13;
      v18 = v14;
      do
      {
        if (*(_QWORD *)v60 != v48)
        {
          v19 = v16;
          objc_enumerationMutation(v11);
          v16 = v19;
        }
        v49 = v16;
        v20 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * v16);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_pages_array](self, "error_pages_array"));
        v22 = objc_msgSend(v21, "count");

        if ((unint64_t)v22 <= v52)
        {
          syslog(3, "ERROR: error pages array smaller than payload array!");
          v41 = 0;
          v14 = v18;
          v13 = v17;
          goto LABEL_36;
        }
        context = objc_autoreleasePoolPush();
        v51 = v20;
        v14 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:copyItems:", v20, 1);

        v23 = self;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_pages_array](self, "error_pages_array"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", v52));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager other_stats_dict](v23, "other_stats_dict"));
        objc_msgSend(v14, "addEntriesFromDictionary:", v25);

        if (objc_msgSend(v13, "count"))
        {
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          obj = v13;
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
          if (v26)
          {
            v27 = v26;
            v28 = 0;
            v29 = *(_QWORD *)v56;
            v45 = v13;
            while (2)
            {
              v30 = 0;
              v31 = v28 + 1;
              v43 = v28 + (_DWORD)v27;
              v32 = v15;
              do
              {
                if (*(_QWORD *)v56 != v29)
                  objc_enumerationMutation(obj);
                v15 = *(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v30);

                if (v31 + (int)v30 > a3)
                {
                  v11 = v44;
                  v13 = v45;
                  goto LABEL_25;
                }
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ESR_page_i")));
                objc_msgSend(v14, "setObject:forKeyedSubscript:", v33, CFSTR("ESR_page_i"));

                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ESR_page_i_status")));
                objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, CFSTR("ESR_page_i_status"));

                v35 = objc_autoreleasePoolPush();
                v36 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:copyItems:", v14, 1);
                v37 = v5[2](v5, v36);

                if (!v37)
                {
                  syslog(3, "ERROR: failed to run the callBack when iterating error payload pages!");
                  objc_autoreleasePoolPop(v35);

                  v11 = v44;
                  v13 = v45;
                  goto LABEL_33;
                }
                objc_autoreleasePoolPop(v35);
                v30 = (char *)v30 + 1;
                v32 = v15;
              }
              while (v27 != v30);
              v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
              v11 = v44;
              v13 = v45;
              v28 = v43;
              if (v27)
                continue;
              break;
            }
          }

          v15 = 0;
LABEL_25:

        }
        else
        {
          objc_msgSend(v14, "setObject:forKeyedSubscript:", &off_1000ACFF8, CFSTR("ESR_page_i"));
          objc_msgSend(v14, "setObject:forKeyedSubscript:", &off_1000ACFF8, CFSTR("ESR_page_i_status"));
          v38 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:copyItems:", v14, 1);
          v39 = v5[2](v5, v38);

          if ((v39 & 1) == 0)
          {
            syslog(3, "ERROR: failed to run the callBack on error entry without error pages!");
LABEL_33:
            objc_autoreleasePoolPop(context);
            v41 = 0;
            v20 = v51;
            goto LABEL_36;
          }
        }
        self = v46;
        ++v52;
        objc_autoreleasePoolPop(context);
        v16 = v49 + 1;
        v12 = v51;
        v17 = v13;
        v40 = v13;
        v18 = v14;
      }
      while ((id)(v49 + 1) != v47);
      v12 = v51;
      v13 = v40;
      v47 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      if (v47)
        continue;
      break;
    }

    v20 = 0;
  }
  else
  {
    v20 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }
  v41 = 1;
LABEL_36:

LABEL_31:
  return v41;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  NANDInfo_GeomErrorPayloadManager *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  if (-[NANDInfo_GeomErrorPayloadManager invalid_error_payload](self, "invalid_error_payload"))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("invalidErrorPayload"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_payload_array](self, "error_payload_array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("error_count"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_payload_array](self, "error_payload_array"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager other_stats_dict](self, "other_stats_dict"));

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager other_stats_dict](self, "other_stats_dict"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("other_stats"));

      }
      v10 = objc_alloc_init((Class)NSMutableArray);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("error_payload"));

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_payload_array](self, "error_payload_array"));
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v11)
      {
        v12 = v11;
        v25 = self;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = *(_QWORD *)v27;
        do
        {
          v17 = 0;
          v18 = v13;
          v19 = v15;
          do
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(obj);
            v15 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v17);

            v13 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:copyItems:", v15, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_pages_array](v25, "error_pages_array"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", (v14 + (_DWORD)v17)));
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("page_statuses"));

            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("error_payload")));
            objc_msgSend(v22, "addObject:", v13);

            v17 = (char *)v17 + 1;
            v18 = v13;
            v19 = v15;
          }
          while (v12 != v17);
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          v14 += (int)v17;
        }
        while (v12);

      }
    }
  }
  return v3;
}

- (BOOL)hasNewErrors
{
  unsigned int v4;

  if (-[NANDInfo_GeomErrorPayloadManager invalid_error_payload](self, "invalid_error_payload"))
    return 0;
  v4 = -[NANDInfo_GeomErrorPayloadManager num_errors_in_payload_cur](self, "num_errors_in_payload_cur");
  return v4 > -[NANDInfo_GeomErrorPayloadManager num_errors_in_payload_prev](self, "num_errors_in_payload_prev");
}

- (NSMutableArray)error_payload_array
{
  return self->_error_payload_array;
}

- (void)setError_payload_array:(id)a3
{
  objc_storeStrong((id *)&self->_error_payload_array, a3);
}

- (NSMutableArray)error_pages_array
{
  return self->_error_pages_array;
}

- (void)setError_pages_array:(id)a3
{
  objc_storeStrong((id *)&self->_error_pages_array, a3);
}

- (NSMutableDictionary)other_stats_dict
{
  return self->_other_stats_dict;
}

- (void)setOther_stats_dict:(id)a3
{
  objc_storeStrong((id *)&self->_other_stats_dict, a3);
}

- (unsigned)num_errors_in_payload_cur
{
  return self->_num_errors_in_payload_cur;
}

- (void)setNum_errors_in_payload_cur:(unsigned int)a3
{
  self->_num_errors_in_payload_cur = a3;
}

- (unsigned)num_errors_in_payload_prev
{
  return self->_num_errors_in_payload_prev;
}

- (void)setNum_errors_in_payload_prev:(unsigned int)a3
{
  self->_num_errors_in_payload_prev = a3;
}

- (BOOL)invalid_error_payload
{
  return self->_invalid_error_payload;
}

- (void)setInvalid_error_payload:(BOOL)a3
{
  self->_invalid_error_payload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_other_stats_dict, 0);
  objc_storeStrong((id *)&self->_error_pages_array, 0);
  objc_storeStrong((id *)&self->_error_payload_array, 0);
}

@end
