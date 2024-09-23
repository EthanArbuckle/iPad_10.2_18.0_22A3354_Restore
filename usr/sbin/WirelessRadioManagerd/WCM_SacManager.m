@implementation WCM_SacManager

- (void)sacProcessGnssFreqInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    if ((self->mGnssState & 1) != 0)
    {
      v7 = v4;
      if (!self->mReportGnssL1
        || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL1FreqList](self, "mGnssL1FreqList")),
            objc_msgSend(v7, "addObjectsFromArray:", v5),
            v5,
            v4 = v7,
            (self->mGnssState & 1) != 0))
      {
        if (self->mReportGnssL5)
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL5FreqList](self, "mGnssL5FreqList"));
          objc_msgSend(v7, "addObjectsFromArray:", v6);

          v4 = v7;
        }
      }
    }
  }

}

- (id)getQueue
{
  return self->mQueue;
}

- (void)sacRemoveAllGnssFreq
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("SAC Coex Manager removed all GNSS frequency from SAC and local cache"));
  -[WCM_SacManager sacReportGnssVictimFreqListOnTargetSac:action:](self, "sacReportGnssVictimFreqListOnTargetSac:action:", 1, 0);
  -[WCM_SacManager sacReportGnssVictimFreqListOnTargetSac:action:](self, "sacReportGnssVictimFreqListOnTargetSac:action:", 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL1FreqList](self, "mGnssL1FreqList"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL1FreqList](self, "mGnssL1FreqList"));
    objc_msgSend(v5, "removeAllObjects");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL5FreqList](self, "mGnssL5FreqList"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL5FreqList](self, "mGnssL5FreqList"));
    objc_msgSend(v8, "removeAllObjects");

  }
  self->mGnssState = 0;
}

- (void)sacUpdateGnssFreqInfo:(id)a3 L5Freq:(id)a4
{
  id v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  if (v20)
  {
    v7 = objc_msgSend(v20, "count") != 0;
    if (v6)
    {
LABEL_3:
      v8 = objc_msgSend(v6, "count") != 0;
      goto LABEL_6;
    }
  }
  else
  {
    v7 = 0;
    if (v6)
      goto LABEL_3;
  }
  v8 = 0;
LABEL_6:
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL1FreqList](self, "mGnssL1FreqList"));
  objc_msgSend(v9, "removeAllObjects");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL5FreqList](self, "mGnssL5FreqList"));
  objc_msgSend(v10, "removeAllObjects");

  if (!v7)
  {
    v15 = 0;
    if (!v8)
      goto LABEL_17;
    goto LABEL_13;
  }
  if (objc_msgSend(v20, "count"))
  {
    v11 = 0;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "logPrint"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC receive update of GNSS L1 Freq[%d]:%@"), v11, v13);

      ++v11;
    }
    while ((unint64_t)objc_msgSend(v20, "count") > v11);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL1FreqList](self, "mGnssL1FreqList"));
  objc_msgSend(v14, "addObjectsFromArray:", v20);

  v15 = 1;
  if (v8)
  {
LABEL_13:
    if (objc_msgSend(v6, "count"))
    {
      v16 = 0;
      do
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v16));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "logPrint"));
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC receive update of GNSS L5 Freq[%d]:%@"), v16, v18);

        ++v16;
      }
      while ((unint64_t)objc_msgSend(v6, "count") > v16);
    }
    v15 |= 2u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL5FreqList](self, "mGnssL5FreqList"));
    objc_msgSend(v19, "addObjectsFromArray:", v6);

  }
LABEL_17:
  self->mGnssL1StateChanged = (self->mGnssState ^ v15) & 1;
  self->mGnssState = v15;

}

- (NSMutableArray)mGnssL5FreqList
{
  return self->_mGnssL5FreqList;
}

- (NSMutableArray)mGnssL1FreqList
{
  return self->_mGnssL1FreqList;
}

- (BOOL)isTestMode
{
  return self->mTestMode;
}

- (void)sacUpdateCellularRPLMNFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  FreqRangeInfo *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  if (v6 && a4 <= 1)
  {
    v15 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a4));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mCellularRPLMNFreqList"));

    if (v9)
      objc_msgSend(v9, "removeAllObjects");
    else
      v9 = objc_alloc_init((Class)NSMutableArray);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC update cellular RPLMN frequency, count=%lu"), objc_msgSend(v15, "count"));
    if (objc_msgSend(v15, "count"))
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v12 = objc_alloc_init(FreqRangeInfo);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", v10));
        -[FreqRangeInfo setFreqWithObj:](v12, "setFreqWithObj:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FreqRangeInfo logPrint](v12, "logPrint"));
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("    SAC cellular rplmn_freq[%d] = %@"), v11, v14);

        objc_msgSend(v9, "addObject:", v12);
        v10 = (v11 + 1);
        v11 = v10;
      }
      while ((unint64_t)objc_msgSend(v15, "count") > v10);
    }

    v6 = v15;
  }

}

- (void)sacUpdateCellularNeighborFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  FreqRangeInfo *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  if (v6 && a4 <= 1)
  {
    v15 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a4));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mCellularNeighborFreqList"));

    if (v9)
      objc_msgSend(v9, "removeAllObjects");
    else
      v9 = objc_alloc_init((Class)NSMutableArray);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC update cellular neighbor frequency, count=%lu"), objc_msgSend(v15, "count"));
    if (objc_msgSend(v15, "count"))
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v12 = objc_alloc_init(FreqRangeInfo);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", v10));
        -[FreqRangeInfo setFreqWithObj:](v12, "setFreqWithObj:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FreqRangeInfo logPrint](v12, "logPrint"));
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("    SAC cellular neighbor_freq[%d] = %@"), v11, v14);

        objc_msgSend(v9, "addObject:", v12);
        v10 = (v11 + 1);
        v11 = v10;
      }
      while ((unint64_t)objc_msgSend(v15, "count") > v10);
    }

    v6 = v15;
  }

}

- (void)sacUpdateCellularHoppingFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  id v18;
  char *v19;
  char *v20;
  BOOL v21;
  FreqRangeInfo *v22;
  id v23;

  v6 = a3;
  if (v6 && a4 <= 1)
  {
    v23 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a4));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mCellularHoppingFreq"));

    if (v9)
      objc_msgSend(v9, "removeAllObjects");
    else
      v9 = objc_alloc_init((Class)NSMutableArray);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC update cellular hopping frequency, count=%lu"), objc_msgSend(v23, "count"));
    if (objc_msgSend(v23, "count"))
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = -1;
      v14 = v23;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", v10));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "logPrint"));
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("    SAC cellular hopping_freq[%d] = %@"), v11, v16);

        v17 = (char *)objc_msgSend(v15, "centerFreq");
        if (v13 > (unint64_t)&v17[-((unint64_t)objc_msgSend(v15, "bw") >> 1)])
        {
          v18 = objc_msgSend(v15, "centerFreq");
          v13 = (unint64_t)v18 - ((unint64_t)objc_msgSend(v15, "bw") >> 1);
        }
        v19 = (char *)objc_msgSend(v15, "centerFreq");
        if (v12 < &v19[(unint64_t)objc_msgSend(v15, "bw") >> 1])
        {
          v20 = (char *)objc_msgSend(v15, "centerFreq");
          v12 = &v20[(unint64_t)objc_msgSend(v15, "bw") >> 1];
        }

        v10 = (v11 + 1);
        v11 = v10;
        v21 = (unint64_t)objc_msgSend(v23, "count") > v10;
        v14 = v23;
      }
      while (v21);
      if ((unint64_t)v12 > v13)
      {
        v22 = -[FreqRangeInfo initWithStartFreq:EndFreq:]([FreqRangeInfo alloc], "initWithStartFreq:EndFreq:", v13, v12);
        objc_msgSend(v9, "addObject:", v22);

      }
    }

    v6 = v23;
  }

}

- (void)sacUpdateCellularDownlinkFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  FreqRangeInfo *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a3;
  if (!v6 || a4 > 1)
    goto LABEL_15;
  v20 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a4));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mCellularPccFreq"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v8));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mCellularSccFreqList"));

  if (!v10)
  {
    v10 = objc_alloc_init((Class)NSMutableArray);
    if (v13)
      goto LABEL_5;
LABEL_7:
    v13 = objc_alloc_init((Class)NSMutableArray);
    goto LABEL_8;
  }
  objc_msgSend(v10, "removeAllObjects");
  if (!v13)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(v13, "removeAllObjects");
LABEL_8:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC update cellular downlink frequency, count=%lu"), objc_msgSend(v20, "count"));
  if (objc_msgSend(v20, "count"))
  {
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = objc_alloc_init(FreqRangeInfo);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", v14));
      -[FreqRangeInfo setFreqWithObj:](v16, "setFreqWithObj:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FreqRangeInfo logPrint](v16, "logPrint"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("    SAC cellular dl_freq[%d] = %@"), v15, v18);

      if ((_DWORD)v15)
        v19 = v13;
      else
        v19 = v10;
      objc_msgSend(v19, "addObject:", v16);

      v14 = (v15 + 1);
      v15 = v14;
    }
    while ((unint64_t)objc_msgSend(v20, "count") > v14);
  }

  v6 = v20;
LABEL_15:

}

- (void)sacSetCellularSubActiveState:(BOOL)a3 onSubId:(unsigned int)a4
{
  int v4;

  if (a4 <= 1)
  {
    v4 = 1 << a4;
    if (!a3)
      v4 = self->mActiveSubId_bitmap & ~v4;
    self->mActiveSubId_bitmap = v4;
  }
}

- (void)sacUpdateCellularSearchFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  FreqRangeInfo *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  if (v6 && a4 <= 1)
  {
    v15 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a4));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mCellularSearchFreqList"));

    if (v9)
      objc_msgSend(v9, "removeAllObjects");
    else
      v9 = objc_alloc_init((Class)NSMutableArray);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC update cellular search frequency, count=%lu"), objc_msgSend(v15, "count"));
    if (objc_msgSend(v15, "count"))
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v12 = objc_alloc_init(FreqRangeInfo);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", v10));
        -[FreqRangeInfo setFreqWithObj:](v12, "setFreqWithObj:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FreqRangeInfo logPrint](v12, "logPrint"));
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("    SAC cellular search_freq[%d] = %@"), v11, v14);

        objc_msgSend(v9, "addObject:", v12);
        v10 = (v11 + 1);
        v11 = v10;
      }
      while ((unint64_t)objc_msgSend(v15, "count") > v10);
    }

    v6 = v15;
  }

}

- (unsigned)sacCreateRawFreqList:(id)a3 bufferSize:(unsigned int)a4 buffer:(__AppleBasebandVictimFreq *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int *p_var2;
  void *v13;

  v7 = a3;
  v8 = v7;
  LODWORD(v9) = 0;
  if (v7 && a5)
  {
    v10 = objc_msgSend(v7, "count");
    if (v10 >= a4)
      v9 = a4;
    else
      v9 = v10;
    if ((_DWORD)v9)
    {
      v11 = 0;
      p_var2 = &a5->var2;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v11));
        *(_QWORD *)(p_var2 - 3) = objc_msgSend(v13, "centerFreq");
        *(_QWORD *)(p_var2 - 1) = ((unint64_t)objc_msgSend(v13, "bw") >> 1);

        ++v11;
        p_var2 += 4;
      }
      while (v9 != v11);
    }
  }

  return v9;
}

- (void)sacReportCellularVictimFreqListOnTargetSac:(unsigned int)a3 action:(unsigned int)a4
{
  uint64_t v5;
  __TelephonyBasebandControllerHandle_tag *v7;
  __TelephonyBasebandControllerHandle_tag *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  dispatch_queue_global_t v17;
  NSObject *v18;
  id v19;
  id v20;
  WCM_SacManager *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  unsigned int v71;
  void *v72;
  void *v73;
  id v74;
  dispatch_queue_global_t global_queue;
  NSObject *v76;
  id v77;
  uint64_t v78;
  unsigned int v79;
  void *v80;
  void *v81;
  id v82;
  dispatch_queue_global_t v83;
  NSObject *v84;
  id v85;
  void *v86;
  void *v87;
  __TelephonyBasebandControllerHandle_tag *v88;
  WCM_SacManager *v89;
  _QWORD v90[5];
  id v91;
  __TelephonyBasebandControllerHandle_tag *v92;
  int v93;
  _QWORD v94[5];
  id v95;
  __TelephonyBasebandControllerHandle_tag *v96;
  int v97;
  _QWORD block[5];
  id v99;
  __TelephonyBasebandControllerHandle_tag *v100;
  int v101;

  v5 = *(_QWORD *)&a3;
  v7 = +[WCM_SacManager basebandController](WCM_SacManager, "basebandController");
  if (v7)
  {
    v8 = v7;
    if ((_DWORD)v5 == 2)
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheCellularReportedReducedList](self, "mCacheCellularReportedReducedList"));
    else
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheCellularReportedFullList](self, "mCacheCellularReportedFullList"));
    v10 = v9;
    if (a4 == 1)
    {
      v20 = objc_alloc_init((Class)NSMutableArray);
      v88 = v8;
      if ((_DWORD)v5 == 2)
      {
        if ((self->mActiveSubId_bitmap & 1) != 0)
        {
          -[WCM_SacManager sacProcessCellularPrimaryFreqInfo:onSubId:](self, "sacProcessCellularPrimaryFreqInfo:onSubId:", v20, 1);
          -[WCM_SacManager sacProcessCellularPrimaryFreqInfo:onSubId:](self, "sacProcessCellularPrimaryFreqInfo:onSubId:", v20, 0);
          -[WCM_SacManager sacProcessCellularSecondaryFreqInfo:onSubId:](self, "sacProcessCellularSecondaryFreqInfo:onSubId:", v20, 1);
          -[WCM_SacManager sacProcessCellularSecondaryFreqInfo:onSubId:](self, "sacProcessCellularSecondaryFreqInfo:onSubId:", v20, 0);
          -[WCM_SacManager sacProcessCellularMeasFreqInfo:onSubId:](self, "sacProcessCellularMeasFreqInfo:onSubId:", v20, 1);
          v21 = self;
          v22 = v20;
          v23 = 0;
        }
        else
        {
          -[WCM_SacManager sacProcessCellularPrimaryFreqInfo:onSubId:](self, "sacProcessCellularPrimaryFreqInfo:onSubId:", v20, 0);
          -[WCM_SacManager sacProcessCellularPrimaryFreqInfo:onSubId:](self, "sacProcessCellularPrimaryFreqInfo:onSubId:", v20, 1);
          -[WCM_SacManager sacProcessCellularSecondaryFreqInfo:onSubId:](self, "sacProcessCellularSecondaryFreqInfo:onSubId:", v20, 0);
          -[WCM_SacManager sacProcessCellularSecondaryFreqInfo:onSubId:](self, "sacProcessCellularSecondaryFreqInfo:onSubId:", v20, 1);
          -[WCM_SacManager sacProcessCellularMeasFreqInfo:onSubId:](self, "sacProcessCellularMeasFreqInfo:onSubId:", v20, 0);
          v21 = self;
          v22 = v20;
          v23 = 1;
        }
        -[WCM_SacManager sacProcessCellularMeasFreqInfo:onSubId:](v21, "sacProcessCellularMeasFreqInfo:onSubId:", v22, v23);
      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", 0));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mCellularHoppingFreq"));
        v27 = objc_msgSend(v26, "count");

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndex:", 0));
        v30 = v29;
        if (v27)
          v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "mCellularHoppingFreq"));
        else
          v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "mCellularPccFreq"));
        v32 = (void *)v31;
        objc_msgSend(v20, "addObjectsFromArray:", v31);

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndex:", 1));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "mCellularHoppingFreq"));
        v36 = objc_msgSend(v35, "count");

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectAtIndex:", 1));
        v39 = v38;
        if (v36)
          v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "mCellularHoppingFreq"));
        else
          v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "mCellularPccFreq"));
        v41 = (void *)v40;
        objc_msgSend(v20, "addObjectsFromArray:", v40);

        v42 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndex:", 0));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "mCellularSccFreqList"));
        objc_msgSend(v20, "addObjectsFromArray:", v44);

        v45 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndex:", 1));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mCellularSccFreqList"));
        objc_msgSend(v20, "addObjectsFromArray:", v47);

        v48 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectAtIndex:", 0));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "mCellularSearchFreqList"));
        objc_msgSend(v20, "addObjectsFromArray:", v50);

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectAtIndex:", 1));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "mCellularSearchFreqList"));
        objc_msgSend(v20, "addObjectsFromArray:", v53);

        v54 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndex:", 0));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "mCellularNeighborFreqList"));
        objc_msgSend(v20, "addObjectsFromArray:", v56);

        v57 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndex:", 1));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "mCellularNeighborFreqList"));
        objc_msgSend(v20, "addObjectsFromArray:", v59);

        v60 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectAtIndex:", 0));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "mCellularRPLMNFreqList"));
        objc_msgSend(v20, "addObjectsFromArray:", v62);

        v63 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectAtIndex:", 1));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "mCellularRPLMNFreqList"));
        objc_msgSend(v20, "addObjectsFromArray:", v65);

      }
      v66 = objc_claimAutoreleasedReturnValue(-[WCM_SacManager getRemoveObjIndex:fromOther:](self, "getRemoveObjIndex:fromOther:", v20, v10));
      v67 = objc_claimAutoreleasedReturnValue(-[WCM_SacManager getInsertObjIndex:fromOther:](self, "getInsertObjIndex:fromOther:", v20, v10));
      v87 = (void *)v66;
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectsAtIndexes:", v66));
      v86 = (void *)v67;
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectsAtIndexes:", v67));
      objc_msgSend(v10, "removeAllObjects");
      objc_msgSend(v10, "setArray:", v20);
      v89 = self;
      if (objc_msgSend(v68, "count"))
      {
        if (objc_msgSend(v68, "count"))
        {
          v70 = 0;
          v71 = 1;
          do
          {
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectAtIndex:", v70));
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "logPrint"));
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC%d client_cellular : Remove Frequency %@:"), v5, v73);

            v70 = v71;
            v15 = (unint64_t)objc_msgSend(v68, "count") > v71++;
          }
          while (v15);
        }
        v74 = objc_msgSend(v68, "copy");
        global_queue = dispatch_get_global_queue(0, 0);
        v76 = objc_claimAutoreleasedReturnValue(global_queue);
        v94[0] = _NSConcreteStackBlock;
        v94[1] = 3221225472;
        v94[2] = sub_100013100;
        v94[3] = &unk_100202B18;
        v94[4] = v89;
        v95 = v74;
        v96 = v88;
        v97 = v5;
        v77 = v74;
        dispatch_async(v76, v94);

      }
      if (objc_msgSend(v69, "count"))
      {
        if (objc_msgSend(v69, "count"))
        {
          v78 = 0;
          v79 = 1;
          do
          {
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectAtIndex:", v78));
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "logPrint"));
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC%d client_cellular : Add Frequency %@:"), v5, v81);

            v78 = v79;
            v15 = (unint64_t)objc_msgSend(v69, "count") > v79++;
          }
          while (v15);
        }
        v82 = objc_msgSend(v69, "copy");
        v83 = dispatch_get_global_queue(0, 0);
        v84 = objc_claimAutoreleasedReturnValue(v83);
        v90[0] = _NSConcreteStackBlock;
        v90[1] = 3221225472;
        v90[2] = sub_100013084;
        v90[3] = &unk_100202B18;
        v90[4] = v89;
        v91 = v82;
        v92 = v88;
        v93 = v5;
        v85 = v82;
        dispatch_async(v84, v90);

      }
    }
    else if (!a4)
    {
      if (objc_msgSend(v9, "count"))
      {
        v11 = 0;
        v12 = 1;
        do
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v11));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "logPrint"));
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC%d client_cellular : Remove Frequency %@:"), v5, v14);

          v11 = v12;
          v15 = (unint64_t)objc_msgSend(v10, "count") > v12++;
        }
        while (v15);
      }
      v16 = objc_msgSend(v10, "copy");
      v17 = dispatch_get_global_queue(0, 0);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100055B20;
      block[3] = &unk_100202B18;
      block[4] = self;
      v99 = v16;
      v100 = v8;
      v101 = v5;
      v19 = v16;
      dispatch_async(v18, block);

      objc_msgSend(v10, "removeAllObjects");
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR(" sacReportCellularVictimFreqListOnTargetSac failed to get baseband controller "));
    v10 = 0;
  }

}

- (NSMutableArray)mCellularFreqSet
{
  return self->_mCellularFreqSet;
}

- (void)sacReportGnssVictimFreqListOnTargetSac:(unsigned int)a3 action:(unsigned int)a4
{
  uint64_t v5;
  id v7;
  __TelephonyBasebandControllerHandle_tag *v8;
  __TelephonyBasebandControllerHandle_tag *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  dispatch_queue_global_t global_queue;
  NSObject *v20;
  id v21;
  uint64_t v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;
  dispatch_queue_global_t v27;
  NSObject *v28;
  id v29;
  int v30;
  __TelephonyBasebandControllerHandle_tag *v31;
  _QWORD v32[5];
  id v33;
  __TelephonyBasebandControllerHandle_tag *v34;
  int v35;
  _QWORD block[5];
  id v37;
  __TelephonyBasebandControllerHandle_tag *v38;
  int v39;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = +[WCM_SacManager basebandController](WCM_SacManager, "basebandController");
  if (!v8)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR(" sacReportGnssVictimFreqListOnTargetSac failed to get baseband controller "));
    v10 = 0;
    goto LABEL_25;
  }
  v9 = v8;
  if ((_DWORD)v5 == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheGnssReportedReducedList](self, "mCacheGnssReportedReducedList"));
    if (a4 == 1)
    {
      -[WCM_SacManager sacProcessGnssFreqInfo:](self, "sacProcessGnssFreqInfo:", v7);
LABEL_8:
      if (-[WCM_SacManager isEqualFreqList:List2:](self, "isEqualFreqList:List2:", v7, v10))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC[%d] Action=%d(0:remove, 1:add) : GNSS Frequency has no change. Action skipped:"), v5, 1);
        goto LABEL_25;
      }
      v31 = v9;
      v30 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheGnssReportedFullList](self, "mCacheGnssReportedFullList"));
    if (a4 == 1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL1FreqList](self, "mGnssL1FreqList"));
      objc_msgSend(v7, "addObjectsFromArray:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL5FreqList](self, "mGnssL5FreqList"));
      objc_msgSend(v7, "addObjectsFromArray:", v12);

      goto LABEL_8;
    }
  }
  if (a4 <= 1)
  {
    v31 = v9;
    v30 = 0;
LABEL_13:
    if (objc_msgSend(v10, "count"))
    {
      v13 = 0;
      v14 = 1;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v13));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "logPrint"));
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC%d client_GNSS : Remove Frequency %@:"), v5, v16);

        v13 = v14;
        v17 = (unint64_t)objc_msgSend(v10, "count") > v14++;
      }
      while (v17);
    }
    v18 = objc_msgSend(v10, "copy");
    global_queue = dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000131F8;
    block[3] = &unk_100202B18;
    block[4] = self;
    v37 = v18;
    v38 = v31;
    v39 = v5;
    v21 = v18;
    dispatch_async(v20, block);

    objc_msgSend(v10, "removeAllObjects");
    if (v30)
    {
      objc_msgSend(v10, "addObjectsFromArray:", v7);
      if (objc_msgSend(v7, "count"))
      {
        if (objc_msgSend(v7, "count"))
        {
          v22 = 0;
          v23 = 1;
          do
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v22));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "logPrint"));
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC%d client_GNSS : Add Frequency %@:"), v5, v25);

            v22 = v23;
            v17 = (unint64_t)objc_msgSend(v7, "count") > v23++;
          }
          while (v17);
        }
        v26 = objc_msgSend(v7, "copy");
        v27 = dispatch_get_global_queue(0, 0);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10001317C;
        v32[3] = &unk_100202B18;
        v32[4] = self;
        v33 = v26;
        v34 = v31;
        v35 = v5;
        v29 = v26;
        dispatch_async(v28, v32);

      }
    }
  }
  if ((_DWORD)v5 == 2 && self->mGnssL1StateChanged)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("GNSS L1 state changed, recalculate cellular victim freq list for reduced list"));
    self->mGnssL1StateChanged = 0;
    -[WCM_SacManager sacReportCellularVictimFreqListOnTargetSac:action:](self, "sacReportCellularVictimFreqListOnTargetSac:action:", 2, 1);
  }
LABEL_25:

}

+ (__TelephonyBasebandControllerHandle_tag)basebandController
{
  __TelephonyBasebandControllerHandle_tag *result;

  result = (__TelephonyBasebandControllerHandle_tag *)qword_100271108;
  if (!qword_100271108)
  {
    result = (__TelephonyBasebandControllerHandle_tag *)TelephonyBasebandCreateController(kCFAllocatorDefault, a2);
    qword_100271108 = (uint64_t)result;
    if (!result)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("SAC Manager: Failed TelephonyBasebandCreateController()"));
      return (__TelephonyBasebandControllerHandle_tag *)qword_100271108;
    }
  }
  return result;
}

- (void)sacProcessCellularSecondaryFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;
  void *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  unsigned int v21;
  FreqRangeInfo *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v26;
  unint64_t mMaxCellAggregateBw;
  unint64_t v28;
  unint64_t v30;
  id v31;

  v6 = a3;
  if (v6 && a4 <= 1)
  {
    v31 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mCellularSccFreqList"));

    v10 = 56;
    if (!self->mGnssState)
      v10 = 80;
    v11 = 64;
    if (!self->mGnssState)
      v11 = 88;
    v12 = *(unsigned int *)((char *)&self->super.isa + v11);
    v13 = *(uint64_t *)((char *)&self->super.isa + v10);
    if (objc_msgSend(v31, "count"))
    {
      v14 = 0;
      v15 = 0;
      v16 = 1;
      do
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndex:", v14));
        v15 += (unint64_t)objc_msgSend(v17, "bw");

        v14 = v16;
        v18 = (unint64_t)objc_msgSend(v31, "count") > v16++;
      }
      while (v18);
    }
    else
    {
      v15 = 0;
    }
    if (v15 < self->mMaxCellAggregateBw)
    {
      v19 = objc_alloc_init((Class)NSMutableArray);
      if (objc_msgSend(v9, "count"))
      {
        v20 = 0;
        v21 = 1;
        do
        {
          v22 = objc_alloc_init(FreqRangeInfo);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v20));
          -[FreqRangeInfo setFreqWithObj:](v22, "setFreqWithObj:", v23);

          -[FreqRangeInfo applyBwLimitFromRight:](v22, "applyBwLimitFromRight:", v13);
          objc_msgSend(v19, "addObject:", v22);

          v20 = v21;
          v18 = (unint64_t)objc_msgSend(v9, "count") > v21++;
        }
        while (v18);
      }
      -[WCM_SacManager sacScreenAllFreq:](self, "sacScreenAllFreq:", v19);
      if (objc_msgSend(v19, "count"))
      {
        v24 = 0;
        while (1)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", v24));
          v26 = objc_msgSend(v25, "bw");
          mMaxCellAggregateBw = self->mMaxCellAggregateBw;
          v28 = mMaxCellAggregateBw - v15;
          if (mMaxCellAggregateBw == v15 || v24 >= v12)
            break;
          v30 = (unint64_t)v26;
          if ((unint64_t)v26 > v28)
          {
            objc_msgSend(v25, "applyBwLimitFromRight:", mMaxCellAggregateBw - v15);
            v30 = v28;
          }
          objc_msgSend(v31, "addObject:", v25);
          v15 += v30;

          if ((unint64_t)objc_msgSend(v19, "count") <= ++v24)
            goto LABEL_27;
        }

      }
LABEL_27:

    }
    v6 = v31;
  }

}

- (void)sacScreenAllFreq:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = v4;
    v6 = objc_msgSend(v4, "count");
    v5 = v12;
    if (v6)
    {
      v7 = objc_alloc_init((Class)NSMutableArray);
      if (objc_msgSend(v12, "count"))
      {
        v8 = 0;
        v9 = 1;
        do
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", v8));
          -[WCM_SacManager sacScreenFreq:freqRangeObj:](self, "sacScreenFreq:freqRangeObj:", v7, v10);

          v8 = v9;
        }
        while ((unint64_t)objc_msgSend(v12, "count") > v9++);
      }
      objc_msgSend(v12, "removeAllObjects");
      objc_msgSend(v12, "setArray:", v7);
      -[WCM_SacManager sacSortFreqByPriority:](self, "sacSortFreqByPriority:", v12);

      v5 = v12;
    }
  }

}

- (void)sacProcessCellularPrimaryFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FreqRangeInfo *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;

  v6 = a3;
  if (v6 && a4 <= 1)
  {
    v22 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v8 = a4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mCellularPccFreq"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mCellularHoppingFreq"));

    v14 = -[FreqRangeInfo initWithStartFreq:EndFreq:]([FreqRangeInfo alloc], "initWithStartFreq:EndFreq:", 0, 0);
    v15 = 48;
    if (!self->mGnssState)
      v15 = 72;
    v16 = *(uint64_t *)((char *)&self->super.isa + v15);
    if (v13 && (v17 = objc_msgSend(v13, "count"), v18 = v13, v17)
      || v10 && (v19 = objc_msgSend(v10, "count"), v18 = v10, v19))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", 0));
      -[FreqRangeInfo setFreqWithObj:](v14, "setFreqWithObj:", v20);

    }
    if (-[FreqRangeInfo FreqStart](v14, "FreqStart"))
    {
      v21 = objc_alloc_init((Class)NSMutableArray);
      -[FreqRangeInfo applyBwLimitFromRight:](v14, "applyBwLimitFromRight:", v16);
      objc_msgSend(v21, "addObject:", v14);
      -[WCM_SacManager sacScreenAllFreq:](self, "sacScreenAllFreq:", v21);
      objc_msgSend(v22, "addObjectsFromArray:", v21);

    }
    v6 = v22;
  }

}

- (void)sacProcessCellularMeasFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unsigned int v19;
  void *v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  unsigned int v24;
  void *v25;
  FreqRangeInfo *v26;
  uint64_t v27;
  unsigned int v28;
  void *v29;
  FreqRangeInfo *v30;
  uint64_t v31;
  unsigned int v32;
  void *v33;
  FreqRangeInfo *v34;
  uint64_t v35;
  unsigned int v36;
  void *v37;
  unint64_t v38;
  unint64_t mMaxCellAggregateBw;
  unint64_t v40;
  id v41;

  v6 = a3;
  if (v6 && a4 <= 1)
  {
    v41 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v8 = a4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mCellularNeighborFreqList"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mCellularSearchFreqList"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", v8));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mCellularRPLMNFreqList"));

    if (self->mMeasurementFreqIncluded)
    {
      if (objc_msgSend(v41, "count"))
      {
        v17 = 0;
        v18 = 0;
        v19 = 1;
        do
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndex:", v17));
          v18 += (unint64_t)objc_msgSend(v20, "bw");

          v17 = v19;
          v21 = (unint64_t)objc_msgSend(v41, "count") > v19++;
        }
        while (v21);
      }
      else
      {
        v18 = 0;
      }
      if (v18 < self->mMaxCellAggregateBw)
      {
        v22 = objc_alloc_init((Class)NSMutableArray);
        if (objc_msgSend(v10, "count"))
        {
          v23 = 0;
          v24 = 1;
          do
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v23));
            v26 = objc_alloc_init(FreqRangeInfo);
            -[FreqRangeInfo setFreqWithObj:](v26, "setFreqWithObj:", v25);
            -[FreqRangeInfo applyBwLimitFromCenter:](v26, "applyBwLimitFromCenter:", 5000000);
            objc_msgSend(v22, "addObject:", v26);

            v23 = v24;
            v21 = (unint64_t)objc_msgSend(v10, "count") > v24++;
          }
          while (v21);
        }
        if (objc_msgSend(v13, "count"))
        {
          v27 = 0;
          v28 = 1;
          do
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", v27));
            v30 = objc_alloc_init(FreqRangeInfo);
            -[FreqRangeInfo setFreqWithObj:](v30, "setFreqWithObj:", v29);
            -[FreqRangeInfo applyBwLimitFromCenter:](v30, "applyBwLimitFromCenter:", 5000000);
            objc_msgSend(v22, "addObject:", v30);

            v27 = v28;
            v21 = (unint64_t)objc_msgSend(v13, "count") > v28++;
          }
          while (v21);
        }
        if (objc_msgSend(v16, "count"))
        {
          v31 = 0;
          v32 = 1;
          do
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", v31));
            v34 = objc_alloc_init(FreqRangeInfo);
            -[FreqRangeInfo setFreqWithObj:](v34, "setFreqWithObj:", v33);
            -[FreqRangeInfo applyBwLimitFromCenter:](v34, "applyBwLimitFromCenter:", 5000000);
            objc_msgSend(v22, "addObject:", v34);

            v31 = v32;
            v21 = (unint64_t)objc_msgSend(v16, "count") > v32++;
          }
          while (v21);
        }
        -[WCM_SacManager sacScreenAllFreq:](self, "sacScreenAllFreq:", v22);
        if (objc_msgSend(v22, "count"))
        {
          v35 = 0;
          v36 = 1;
          while (1)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndex:", v35));
            v38 = (unint64_t)objc_msgSend(v37, "bw");
            mMaxCellAggregateBw = self->mMaxCellAggregateBw;
            v40 = mMaxCellAggregateBw - v18;
            if (mMaxCellAggregateBw == v18)
              break;
            if (v38 > v40)
            {
              objc_msgSend(v37, "applyBwLimitFromCenter:", mMaxCellAggregateBw - v18);
              v38 = v40;
            }
            v18 += v38;
            objc_msgSend(v41, "addObject:", v37);

            v35 = v36;
            v21 = (unint64_t)objc_msgSend(v22, "count") > v36++;
            if (!v21)
              goto LABEL_27;
          }

        }
LABEL_27:

      }
    }

    v6 = v41;
  }

}

- (id)getInsertObjIndex:(id)a3 fromOther:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableIndexSet);
  if (v5 && v6)
  {
    v8 = objc_autoreleasePoolPush();
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "differenceFromArray:withOptions:usingEquivalenceTest:", v6, 2, &stru_100202AF0));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "insertions", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v7, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14), "index"));
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

- (NSMutableArray)mCacheGnssReportedReducedList
{
  return self->_mCacheGnssReportedReducedList;
}

- (NSMutableArray)mCacheGnssReportedFullList
{
  return self->_mCacheGnssReportedFullList;
}

- (BOOL)isEqualFreqList:(id)a3 List2:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unsigned __int8 v9;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  void *v17;

  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  v8 = (void *)v7;
  if (v6 | v7)
  {
    v9 = 0;
    if (v6 && v7)
    {
      v11 = objc_msgSend((id)v6, "count");
      if (v11 == objc_msgSend(v8, "count"))
      {
        v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v6);
        v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v8);
        -[WCM_SacManager freqAscendSort:](self, "freqAscendSort:", v12);
        -[WCM_SacManager freqAscendSort:](self, "freqAscendSort:", v13);
        if (objc_msgSend(v12, "count"))
        {
          v14 = 0;
          v15 = 1;
          do
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", v14));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", v14));
            v9 = objc_msgSend(v16, "isEqual:", v17);

            if ((v9 & 1) == 0)
              break;
            v14 = v15;
          }
          while ((unint64_t)objc_msgSend(v12, "count") > v15++);
        }
        else
        {
          v9 = 1;
        }

      }
      else
      {
        v9 = 0;
      }
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)getRemoveObjIndex:(id)a3 fromOther:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableIndexSet);
  if (v5 && v6)
  {
    v8 = objc_autoreleasePoolPush();
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "differenceFromArray:withOptions:usingEquivalenceTest:", v6, 1, &stru_100202AD0));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "removals", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v7, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14), "index"));
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

- (NSMutableArray)mCacheCellularReportedReducedList
{
  return self->_mCacheCellularReportedReducedList;
}

- (NSMutableArray)mCacheCellularReportedFullList
{
  return self->_mCacheCellularReportedFullList;
}

- (void)sacScreenFreq:(id)a3 freqRangeObj:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  FreqRangeInfo *v29;
  id v31;

  v31 = a3;
  v6 = a4;
  if (v31)
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqInclusionList](self, "mCellularFreqInclusionList"));
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        v9 = 0;
        v10 = 1;
        do
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqInclusionList](self, "mCellularFreqInclusionList"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v9));

          v13 = objc_msgSend(v6, "FreqEnd");
          if (v13 > objc_msgSend(v12, "FreqStart"))
          {
            v14 = objc_msgSend(v6, "FreqStart");
            if (v14 < objc_msgSend(v12, "FreqEnd"))
            {
              v15 = objc_msgSend(v6, "FreqStart");
              if (v15 <= objc_msgSend(v12, "FreqStart"))
              {
                v16 = objc_msgSend(v6, "FreqEnd");
                v17 = objc_msgSend(v12, "FreqEnd");
                v18 = v12;
                v19 = v12;
                if (v16 >= v17)
                  goto LABEL_13;
              }
              v20 = objc_msgSend(v6, "FreqStart");
              if (v20 >= objc_msgSend(v12, "FreqStart"))
              {
                v21 = objc_msgSend(v6, "FreqEnd");
                v22 = objc_msgSend(v12, "FreqEnd");
                v18 = v6;
                v19 = v6;
                if (v21 <= v22)
                  goto LABEL_13;
              }
              v23 = objc_msgSend(v6, "FreqStart");
              v24 = objc_msgSend(v12, "FreqStart");
              v18 = v6;
              v19 = v12;
              if (v23 >= v24
                || (v25 = objc_msgSend(v6, "FreqEnd"),
                    v26 = objc_msgSend(v12, "FreqEnd"),
                    v18 = v12,
                    v19 = v6,
                    v25 <= v26))
              {
LABEL_13:
                v27 = objc_msgSend(v18, "FreqStart");
                v28 = objc_msgSend(v19, "FreqEnd");
                if (v27 && v28)
                {
                  v29 = -[FreqRangeInfo initWithStartFreq:EndFreq:]([FreqRangeInfo alloc], "initWithStartFreq:EndFreq:", v27, v28);
                  -[FreqRangeInfo setPriority:](v29, "setPriority:", v10 - 1);
                  objc_msgSend(v31, "addObject:", v29);

                }
              }
            }
          }

          v9 = v10;
        }
        while ((unint64_t)v8 > v10++);
      }
    }
  }

}

- (NSMutableArray)mCellularFreqInclusionList
{
  return self->_mCellularFreqInclusionList;
}

- (void)sacSortFreqByPriority:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "count");
    v4 = v6;
    if (v5)
    {
      objc_msgSend(v6, "sortUsingComparator:", &stru_100202A90);
      v4 = v6;
    }
  }

}

- (WCM_SacManager)initWithPlatformId:(unint64_t)a3
{
  WCM_SacManager *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *mQueue;
  id v7;
  SacCellularFreqInfoSet *v8;
  SacCellularFreqInfoSet *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSData *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t i;
  unint64_t v94;
  unint64_t v95;
  FreqRangeInfo *v96;
  void *v97;
  SacCellularFreqInfoSet *v99;
  uint64_t v100;
  uint64_t v101;
  objc_super v102;
  _QWORD v103[10];
  _QWORD v104[10];

  v102.receiver = self;
  v102.super_class = (Class)WCM_SacManager;
  v4 = -[WCM_SacManager init](&v102, "init");
  v5 = dispatch_queue_create("com.apple.WirelessRadioManager.SacManager", 0);
  mQueue = v4->mQueue;
  v4->mQueue = (OS_dispatch_queue *)v5;

  v4->mTestMode = 0;
  v4->mGnssState = 0;
  v4->mGnssL1StateChanged = 0;
  v4->mActiveSubId_bitmap = 0;
  v7 = objc_alloc_init((Class)NSMutableArray);
  -[WCM_SacManager setMCellularFreqSet:](v4, "setMCellularFreqSet:", v7);

  v8 = objc_alloc_init(SacCellularFreqInfoSet);
  v9 = objc_alloc_init(SacCellularFreqInfoSet);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](v4, "mCellularFreqSet"));
  objc_msgSend(v10, "addObject:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](v4, "mCellularFreqSet"));
  objc_msgSend(v11, "addObject:", v9);

  v12 = objc_alloc_init((Class)NSMutableArray);
  -[WCM_SacManager setMWifiFreqList:](v4, "setMWifiFreqList:", v12);

  v13 = objc_alloc_init((Class)NSMutableArray);
  -[WCM_SacManager setMGnssL1FreqList:](v4, "setMGnssL1FreqList:", v13);

  v14 = objc_alloc_init((Class)NSMutableArray);
  -[WCM_SacManager setMGnssL5FreqList:](v4, "setMGnssL5FreqList:", v14);

  v15 = objc_alloc_init((Class)NSMutableArray);
  -[WCM_SacManager setMCacheCellularReportedFullList:](v4, "setMCacheCellularReportedFullList:", v15);

  v16 = objc_alloc_init((Class)NSMutableArray);
  -[WCM_SacManager setMCacheCellularReportedReducedList:](v4, "setMCacheCellularReportedReducedList:", v16);

  v17 = objc_alloc_init((Class)NSMutableArray);
  -[WCM_SacManager setMCacheWifiReportedFullList:](v4, "setMCacheWifiReportedFullList:", v17);

  v18 = objc_alloc_init((Class)NSMutableArray);
  -[WCM_SacManager setMCacheWifiReportedReducedList:](v4, "setMCacheWifiReportedReducedList:", v18);

  v19 = objc_alloc_init((Class)NSMutableArray);
  -[WCM_SacManager setMCacheGnssReportedFullList:](v4, "setMCacheGnssReportedFullList:", v19);

  v20 = objc_alloc_init((Class)NSMutableArray);
  -[WCM_SacManager setMCacheGnssReportedReducedList:](v4, "setMCacheGnssReportedReducedList:", v20);

  v21 = objc_alloc_init((Class)NSMutableArray);
  -[WCM_SacManager setMCellularFreqInclusionList:](v4, "setMCellularFreqInclusionList:", v21);

  v101 = 0;
  v22 = sub_1000896B4((uint64_t)CFSTR("coex_sac"), (uint64_t)CFSTR("plist"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v100 = 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v23, 2, &v101, &v100));
  if (v24)
  {
    v99 = v9;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("init SAC Configuration Plist File Found"));
    v25 = (id)-[WCM_SacManager sacGetPlatformPlistIdx:](v4, "sacGetPlatformPlistIdx:", a3);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Config count = %lu, platformID=%llu, SAC plist index=%d"), objc_msgSend(v24, "count"), a3, v25);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration from plist: "));
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v25));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("GNSS_L1")));
    v4->mReportGnssL1 = objc_msgSend(v28, "BOOLValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: GNSS_L1 = %d"), v4->mReportGnssL1);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("GNSS_L5")));
    v4->mReportGnssL5 = objc_msgSend(v30, "BOOLValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: GNSS_L5 = %d"), v4->mReportGnssL5);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", CFSTR("WiFi_2p4")));
    v4->mReportWiFi2G = objc_msgSend(v32, "BOOLValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: WiFi_2p4 = %d"), v4->mReportWiFi2G);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("WiFi_5p0")));
    v4->mReportWiFi5G = objc_msgSend(v34, "BOOLValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: WiFi_5p0 = %d"), v4->mReportWiFi5G);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", CFSTR("WiFi_enh")));
    v4->mReportWiFiEnh = objc_msgSend(v36, "BOOLValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: WiFi_enh = %d"), v4->mReportWiFiEnh);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", CFSTR("Cell_Include_Measurement")));
    v4->mMeasurementFreqIncluded = objc_msgSend(v38, "BOOLValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: Cell_Include_Measurement = %d"), v4->mMeasurementFreqIncluded);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", CFSTR("Cell_PCC_BW_L1ON")));
    v4->mPccBwL1On = 1000 * objc_msgSend(v40, "unsignedIntValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: Cell_PCC_BW_L1ON = %llu (%lluMHz)"), v4->mPccBwL1On, v4->mPccBwL1On / 0xF4240);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("Cell_SCC_BW_L1ON")));
    v4->mSccBwL1On = 1000 * objc_msgSend(v42, "unsignedIntValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: Cell_SCC_BW_L1ON = %llu (%lluMHz)"), v4->mSccBwL1On, v4->mSccBwL1On / 0xF4240);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("Cell_SCC_Channels_L1ON")));
    v4->mAllowedSccNumL1On = objc_msgSend(v44, "unsignedIntValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: Cell_SCC_Channels_L1ON = %d"), v4->mAllowedSccNumL1On);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", CFSTR("Cell_PCC_BW_L1OFF")));
    v4->mPccBwL1Off = 1000 * objc_msgSend(v46, "unsignedIntValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: Cell_PCC_BW_L1OFF = %llu (%lluMHz)"), v4->mPccBwL1Off, v4->mPccBwL1Off / 0xF4240);
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKey:", CFSTR("Cell_SCC_BW_L1OFF")));
    v4->mSccBwL1Off = 1000 * objc_msgSend(v48, "unsignedIntValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: Cell_SCC_BW_L1OFF = %llu (%lluMHz)"), v4->mSccBwL1Off, v4->mSccBwL1Off / 0xF4240);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKey:", CFSTR("Cell_SCC_Channels_L1OFF")));
    v4->mAllowedSccNumL1Off = objc_msgSend(v50, "unsignedIntValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: Cell_SCC_Channels_L1OFF = %d"), v4->mAllowedSccNumL1Off);
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKey:", CFSTR("Cell_Aggregate_BW")));
    v4->mMaxCellAggregateBw = 1000 * objc_msgSend(v52, "unsignedIntValue");

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: Cell_Aggregate_BW = %llu (%lluMHz)"), v4->mMaxCellAggregateBw, v4->mMaxCellAggregateBw / 0xF4240);
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", CFSTR("Cell_priority_1_Fmin")));
    v104[0] = 1000 * objc_msgSend(v54, "unsignedIntValue");

    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKey:", CFSTR("Cell_priority_1_Fmax")));
    v103[0] = 1000 * objc_msgSend(v56, "unsignedIntValue");

    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKey:", CFSTR("Cell_priority_2_Fmin")));
    v104[1] = 1000 * objc_msgSend(v58, "unsignedIntValue");

    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKey:", CFSTR("Cell_priority_2_Fmax")));
    v103[1] = 1000 * objc_msgSend(v60, "unsignedIntValue");

    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKey:", CFSTR("Cell_priority_3_Fmin")));
    v104[2] = 1000 * objc_msgSend(v62, "unsignedIntValue");

    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKey:", CFSTR("Cell_priority_3_Fmax")));
    v103[2] = 1000 * objc_msgSend(v64, "unsignedIntValue");

    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKey:", CFSTR("Cell_priority_4_Fmin")));
    v104[3] = 1000 * objc_msgSend(v66, "unsignedIntValue");

    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKey:", CFSTR("Cell_priority_4_Fmax")));
    v103[3] = 1000 * objc_msgSend(v68, "unsignedIntValue");

    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("Cell_priority_5_Fmin")));
    v104[4] = 1000 * objc_msgSend(v70, "unsignedIntValue");

    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKey:", CFSTR("Cell_priority_5_Fmax")));
    v103[4] = 1000 * objc_msgSend(v72, "unsignedIntValue");

    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKey:", CFSTR("Cell_priority_6_Fmin")));
    v104[5] = 1000 * objc_msgSend(v74, "unsignedIntValue");

    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKey:", CFSTR("Cell_priority_6_Fmax")));
    v103[5] = 1000 * objc_msgSend(v76, "unsignedIntValue");

    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKey:", CFSTR("Cell_priority_7_Fmin")));
    v104[6] = 1000 * objc_msgSend(v78, "unsignedIntValue");

    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKey:", CFSTR("Cell_priority_7_Fmax")));
    v103[6] = 1000 * objc_msgSend(v80, "unsignedIntValue");

    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKey:", CFSTR("Cell_priority_8_Fmin")));
    v104[7] = 1000 * objc_msgSend(v82, "unsignedIntValue");

    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKey:", CFSTR("Cell_priority_8_Fmax")));
    v103[7] = 1000 * objc_msgSend(v84, "unsignedIntValue");

    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKey:", CFSTR("Cell_priority_9_Fmin")));
    v104[8] = 1000 * objc_msgSend(v86, "unsignedIntValue");

    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKey:", CFSTR("Cell_priority_9_Fmax")));
    v103[8] = 1000 * objc_msgSend(v88, "unsignedIntValue");

    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKey:", CFSTR("Cell_priority_10_Fmin")));
    v104[9] = 1000 * objc_msgSend(v90, "unsignedIntValue");

    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v26));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKey:", CFSTR("Cell_priority_10_Fmax")));
    v103[9] = 1000 * objc_msgSend(v92, "unsignedIntValue");

    for (i = 0; i != 10; ++i)
    {
      v94 = v104[i];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: freq_min[%d] = %llu (%lluMHz)"), i, v94, v94 / 0xF4240);
      v95 = v103[i];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Configuration: freq_max[%d] = %llu (%lluMHz)"), i, v95, v95 / 0xF4240);
      v96 = -[FreqRangeInfo initWithStartFreq:EndFreq:]([FreqRangeInfo alloc], "initWithStartFreq:EndFreq:", v94, v95);
      -[FreqRangeInfo setPriority:](v96, "setPriority:", i);
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqInclusionList](v4, "mCellularFreqInclusionList"));
      objc_msgSend(v97, "addObject:", v96);

    }
    v4->mGnssState = 0;
    v9 = v99;
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("init: No SAC Configuration Plist File Found"));
  }

  return v4;
}

- (id)printPlistParam
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: GNSS_L1 = %d\n"), self->mReportGnssL1);
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: GNSS_L5 = %d\n"), self->mReportGnssL5);
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: WiFi_2p4 = %d\n"), self->mReportWiFi2G);
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: WiFi_5p0 = %d\n"), self->mReportWiFi5G);
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: WiFi_enh = %d\n"), self->mReportWiFiEnh);
  for (i = 0; i != 10; ++i)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqInclusionList](self, "mCellularFreqInclusionList"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", i));

    objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: freq_min[%d] = %llu (%lluMHz)\n"), i, objc_msgSend(v6, "FreqStart"), (unint64_t)objc_msgSend(v6, "FreqStart") / 0xF4240);
    objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: freq_max[%d] = %llu (%lluMHz)\n"), i, objc_msgSend(v6, "FreqEnd"), (unint64_t)objc_msgSend(v6, "FreqEnd") / 0xF4240);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: Cell_Aggregate_BW = %llu (%lluMHz)\n"), self->mMaxCellAggregateBw, self->mMaxCellAggregateBw / 0xF4240);
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: Cell_Include_Measurement = %d\n"), self->mMeasurementFreqIncluded);
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: Cell_PCC_BW_L1ON = %llu (%lluMHz)\n"), self->mPccBwL1On, self->mPccBwL1On / 0xF4240);
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: Cell_SCC_BW_L1ON = %llu (%lluMHz)\n"), self->mSccBwL1On, self->mSccBwL1On / 0xF4240);
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: Cell_SCC_Channels_L1ON = %d\n"), self->mAllowedSccNumL1On);
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: Cell_PCC_BW_L1OFF = %llu (%lluMHz)\n"), self->mPccBwL1Off, self->mPccBwL1Off / 0xF4240);
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: Cell_SCC_BW_L1OFF = %llu (%lluMHz)\n"), self->mSccBwL1Off, self->mSccBwL1Off / 0xF4240);
  objc_msgSend(v3, "appendFormat:", CFSTR("SAC Configuration: Cell_SCC_Channels_L1OFF = %d\n"), self->mAllowedSccNumL1Off);
  return v3;
}

- (unsigned)sacGetPlatformPlistIdx:(int64_t)a3
{
  if (a3 > 153)
  {
    if (a3 > 167)
    {
      if (a3 == 168 || a3 == 170)
        return 5;
    }
    else
    {
      if (a3 == 154)
        return 3;
      if (a3 == 157)
        return 4;
    }
  }
  else if ((unint64_t)a3 <= 0x39)
  {
    if (((1 << a3) & 0x330000000000000) == 0)
    {
      if (a3 == 24)
        return 1;
      if (a3 == 25)
        return 2;
      return 0;
    }
    return 5;
  }
  return 0;
}

- (void)setBlockReporting:(BOOL)a3
{
  -[WCM_SacManager setTestMode:](self, "setTestMode:", a3);
}

- (void)freqAscendSort:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "count");
    v4 = v6;
    if (v5)
    {
      objc_msgSend(v6, "sortUsingComparator:", &stru_100202A70);
      v4 = v6;
    }
  }

}

- (void)sacMergeFreqInterval:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v16 = v4;
    v6 = objc_msgSend(v4, "count");
    v5 = v16;
    if (v6)
    {
      -[WCM_SacManager freqAscendSort:](self, "freqAscendSort:", v16);
      v7 = objc_alloc_init((Class)NSMutableArray);
      if (objc_msgSend(v16, "count"))
      {
        v8 = 0;
        v9 = 1;
        do
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", v8));
          if (objc_msgSend(v7, "count"))
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
            v12 = objc_msgSend(v10, "FreqStart");
            if (v12 >= objc_msgSend(v11, "FreqEnd"))
            {
              objc_msgSend(v7, "addObject:", v10);
            }
            else
            {
              v13 = objc_msgSend(v10, "FreqStart");
              if (v13 < objc_msgSend(v11, "FreqEnd"))
              {
                v14 = objc_msgSend(v10, "FreqEnd");
                if (v14 > objc_msgSend(v11, "FreqEnd"))
                  objc_msgSend(v11, "setEndFreqOnly:", objc_msgSend(v10, "FreqEnd"));
              }
            }

          }
          else
          {
            objc_msgSend(v7, "addObject:", v10);
          }

          v8 = v9;
        }
        while ((unint64_t)objc_msgSend(v16, "count") > v9++);
      }
      objc_msgSend(v16, "removeAllObjects");
      objc_msgSend(v16, "addObjectsFromArray:", v7);

      v5 = v16;
    }
  }

}

- (void)sacUpdateWiFiFreqInfo:(unint64_t)a3 Bandwidth:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  FreqRangeInfo *v14;

  v7 = objc_claimAutoreleasedReturnValue(-[WCM_SacManager mWifiFreqList](self, "mWifiFreqList"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mWifiFreqList](self, "mWifiFreqList"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mWifiFreqList](self, "mWifiFreqList"));
      objc_msgSend(v11, "removeAllObjects");

    }
  }
  v14 = -[FreqRangeInfo initWithFreq:Bw:]([FreqRangeInfo alloc], "initWithFreq:Bw:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FreqRangeInfo logPrint](v14, "logPrint"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC Update WiFi Freq:%@"), v12);

  if (a3 && a4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mWifiFreqList](self, "mWifiFreqList"));
    objc_msgSend(v13, "addObject:", v14);

  }
}

- (void)sacProcessWiFiFreqInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FreqRangeInfo *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mWifiFreqList](self, "mWifiFreqList"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));

    if ((unint64_t)objc_msgSend(v6, "centerFreq") <= 0x94B6ADC0 && self->mReportWiFi2G
      || (unint64_t)objc_msgSend(v6, "centerFreq") >= 0x12BCFB580
      && (unint64_t)objc_msgSend(v6, "centerFreq") < 0x162F216C0
      && self->mReportWiFi5G
      || (unint64_t)objc_msgSend(v6, "centerFreq") > 0x162F216BFLL && self->mReportWiFiEnh)
    {
      v7 = objc_alloc_init(FreqRangeInfo);
      -[FreqRangeInfo setFreqWithObj:](v7, "setFreqWithObj:", v6);
      -[FreqRangeInfo applyBwLimitFromCenter:](v7, "applyBwLimitFromCenter:", 20000000);
      objc_msgSend(v8, "addObject:", v7);

    }
    v4 = v8;
  }

}

- (void)sacReportWifiVictimFreqListOnTargetSac:(unsigned int)a3 action:(unsigned int)a4
{
  uint64_t v5;
  id v7;
  __TelephonyBasebandControllerHandle_tag *v8;
  __TelephonyBasebandControllerHandle_tag *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  dispatch_queue_global_t global_queue;
  NSObject *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  unsigned int v31;
  void *v32;
  void *v33;
  id v34;
  __TelephonyBasebandControllerHandle_tag *v35;
  _QWORD v36[5];
  id v37;
  __TelephonyBasebandControllerHandle_tag *v38;
  int v39;
  _QWORD block[5];
  id v41;
  __TelephonyBasebandControllerHandle_tag *v42;
  int v43;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = +[WCM_SacManager basebandController](WCM_SacManager, "basebandController");
  if (v8)
  {
    v9 = v8;
    if ((_DWORD)v5 == 2)
      v10 = objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheWifiReportedReducedList](self, "mCacheWifiReportedReducedList"));
    else
      v10 = objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheWifiReportedFullList](self, "mCacheWifiReportedFullList"));
    v11 = (void *)v10;
    if (a4 == 1)
    {
      v12 = objc_claimAutoreleasedReturnValue(-[WCM_SacManager mWifiFreqList](self, "mWifiFreqList"));
      if (v12)
      {
        v13 = (void *)v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mWifiFreqList](self, "mWifiFreqList"));
        v15 = objc_msgSend(v14, "count");

        if (v15)
        {
          if ((_DWORD)v5 == 2)
          {
            -[WCM_SacManager sacProcessWiFiFreqInfo:](self, "sacProcessWiFiFreqInfo:", v7);
          }
          else
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mWifiFreqList](self, "mWifiFreqList"));
            objc_msgSend(v7, "addObjectsFromArray:", v16);

          }
          if (-[WCM_SacManager isEqualFreqList:List2:](self, "isEqualFreqList:List2:", v7, v11))
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC[%d] Action=%d(0:remove, 1:add) : WiFi Frequency has no change. Action skipped:"), v5, 1);
            goto LABEL_27;
          }
        }
      }
    }
    else if (a4)
    {
      goto LABEL_27;
    }
    v35 = v9;
    if (objc_msgSend(v11, "count"))
    {
      v17 = 0;
      v18 = 1;
      do
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v17));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "logPrint"));
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC%d client_wifi : Remove Frequency %@:"), v5, v20);

        v17 = v18;
        v21 = (unint64_t)objc_msgSend(v11, "count") > v18++;
      }
      while (v21);
    }
    v22 = objc_msgSend(v11, "copy");
    global_queue = dispatch_get_global_queue(0, 0);
    v24 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100055F58;
    block[3] = &unk_100202B18;
    block[4] = self;
    v41 = v22;
    v42 = v35;
    v43 = v5;
    v25 = v22;
    dispatch_async(v24, block);

    objc_msgSend(v11, "removeAllObjects");
    if (a4 == 1)
    {
      v26 = objc_claimAutoreleasedReturnValue(-[WCM_SacManager mWifiFreqList](self, "mWifiFreqList"));
      if (v26)
      {
        v27 = (void *)v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mWifiFreqList](self, "mWifiFreqList"));
        v29 = objc_msgSend(v28, "count");

        if (v29)
        {
          if (objc_msgSend(v7, "count"))
          {
            objc_msgSend(v11, "addObjectsFromArray:", v7);
            if (objc_msgSend(v7, "count"))
            {
              v30 = 0;
              v31 = 1;
              do
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v30));
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "logPrint"));
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SAC%d client_wifi : Add Frequency %@:"), v5, v33);

                v30 = v31;
                v21 = (unint64_t)objc_msgSend(v7, "count") > v31++;
              }
              while (v21);
            }
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_100055FD4;
            v36[3] = &unk_100202B18;
            v36[4] = self;
            v37 = objc_msgSend(v7, "copy");
            v38 = v35;
            v39 = v5;
            v34 = v37;
            dispatch_async(v24, v36);

          }
        }
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR(" sacReportWifiVictimFreqListOnTargetSac failed to get baseband controller "));
    v11 = 0;
  }
LABEL_27:

}

- (void)sacRemoveAllCellularFreqOnSubId0:(BOOL)a3 andSubId1:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v5 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("SAC Coex Manager removed cellular frequency[subId0=%d, subId1=%d] from SAC and local cache"), a3, a4);
  if (v5 || v4)
  {
    -[WCM_SacManager sacReportCellularVictimFreqListOnTargetSac:action:](self, "sacReportCellularVictimFreqListOnTargetSac:action:", 1, 0);
    -[WCM_SacManager sacReportCellularVictimFreqListOnTargetSac:action:](self, "sacReportCellularVictimFreqListOnTargetSac:action:", 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v8 = v7;
    if (v5 && v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 0));
      objc_msgSend(v9, "removeAllFreq");

      v12 = (id)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 1));
      objc_msgSend(v10, "removeAllFreq");

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", !v5));
      objc_msgSend(v11, "removeAllFreq");

      -[WCM_SacManager sacReportCellularVictimFreqListOnTargetSac:action:](self, "sacReportCellularVictimFreqListOnTargetSac:action:", 1, 1);
      -[WCM_SacManager sacReportCellularVictimFreqListOnTargetSac:action:](self, "sacReportCellularVictimFreqListOnTargetSac:action:", 2, 1);
    }
  }
}

- (void)sacRemoveAllWifiFreq
{
  id v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("SAC Coex Manager removed all Wifi frequency from SAC and local cache"));
  -[WCM_SacManager sacReportWifiVictimFreqListOnTargetSac:action:](self, "sacReportWifiVictimFreqListOnTargetSac:action:", 1, 0);
  -[WCM_SacManager sacReportWifiVictimFreqListOnTargetSac:action:](self, "sacReportWifiVictimFreqListOnTargetSac:action:", 2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mWifiFreqList](self, "mWifiFreqList"));
  objc_msgSend(v3, "removeAllObjects");

}

- (void)setTestMode:(BOOL)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Frequency tool set test mode = %d"), a3);
  -[WCM_SacManager frequencyToolClearFreq:](self, "frequencyToolClearFreq:", 0);
  -[WCM_SacManager frequencyToolClearFreq:](self, "frequencyToolClearFreq:", 1);
  -[WCM_SacManager frequencyToolClearFreq:](self, "frequencyToolClearFreq:", 2);
  self->mTestMode = a3;
}

- (void)frequencyToolClearFreq:(int)a3
{
  uint64_t v5;
  uint64_t v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Frequency tool clear frequency on client %d"), *(_QWORD *)&a3);
  switch(a3)
  {
    case 2:
      -[WCM_SacManager sacRemoveAllGnssFreq](self, "sacRemoveAllGnssFreq");
      break;
    case 1:
      -[WCM_SacManager sacRemoveAllWifiFreq](self, "sacRemoveAllWifiFreq", v5, v6);
      break;
    case 0:
      -[WCM_SacManager sacRemoveAllCellularFreqOnSubId0:andSubId1:](self, "sacRemoveAllCellularFreqOnSubId0:andSubId1:", 1, 1);
      break;
  }
}

- (void)removeFreqFromArray:(id)a3 centerFreq:(unint64_t)a4 bandwidth:(unint64_t)a5
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  BOOL v12;
  void *v13;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v13 = v6;
    v8 = objc_msgSend(v6, "count");
    v7 = v13;
    if (v8)
    {
      v9 = 0;
      v10 = 1;
      while (1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v9));
        if (objc_msgSend(v11, "centerFreq") == (id)a4)
          break;

        v9 = v10;
        v12 = (unint64_t)objc_msgSend(v13, "count") > v10++;
        v7 = v13;
        if (!v12)
          goto LABEL_8;
      }
      objc_msgSend(v13, "removeObjectAtIndex:", v9);

      v7 = v13;
    }
  }
LABEL_8:

}

- (void)frequencyToolRemoveFreq:(int)a3 centerFreq:(unint64_t)a4 bandwidth:(unint64_t)a5
{
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
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;

  if (a3)
  {
    if (a3 == 2)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", *(_QWORD *)&a3, CFSTR("Frequency tool client(GNSS) remove freq=%llu, bw=%llu"), a4, a5);
      v18 = objc_alloc((Class)NSMutableArray);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL1FreqList](self, "mGnssL1FreqList"));
      v23 = objc_msgSend(v18, "initWithArray:", v19);

      v20 = objc_alloc((Class)NSMutableArray);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL5FreqList](self, "mGnssL5FreqList"));
      v22 = objc_msgSend(v20, "initWithArray:", v21);

      -[WCM_SacManager removeFreqFromArray:centerFreq:bandwidth:](self, "removeFreqFromArray:centerFreq:bandwidth:", v23, a4, a5);
      -[WCM_SacManager removeFreqFromArray:centerFreq:bandwidth:](self, "removeFreqFromArray:centerFreq:bandwidth:", v22, a4, a5);
      -[WCM_SacManager sacUpdateGnssFreqInfo:L5Freq:](self, "sacUpdateGnssFreqInfo:L5Freq:", v23, v22);
      -[WCM_SacManager sacReportGnssVictimFreqListOnTargetSac:action:](self, "sacReportGnssVictimFreqListOnTargetSac:action:", 1, 1);
      -[WCM_SacManager sacReportGnssVictimFreqListOnTargetSac:action:](self, "sacReportGnssVictimFreqListOnTargetSac:action:", 2, 1);

    }
    else if (a3 == 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Frequency tool client(WiFi) remove freq=%llu, bw=%llu"), a4, a5);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mWifiFreqList](self, "mWifiFreqList"));
      -[WCM_SacManager removeFreqFromArray:centerFreq:bandwidth:](self, "removeFreqFromArray:centerFreq:bandwidth:", v8, a4, a5);

      -[WCM_SacManager sacReportWifiVictimFreqListOnTargetSac:action:](self, "sacReportWifiVictimFreqListOnTargetSac:action:", 1, 1);
      -[WCM_SacManager sacReportWifiVictimFreqListOnTargetSac:action:](self, "sacReportWifiVictimFreqListOnTargetSac:action:", 2, 1);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Frequency tool client(Cellular) remove freq=%llu, bw=%llu"), a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mCellularPccFreq"));
    -[WCM_SacManager removeFreqFromArray:centerFreq:bandwidth:](self, "removeFreqFromArray:centerFreq:bandwidth:", v11, a4, a5);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mCellularSccFreqList"));
    -[WCM_SacManager removeFreqFromArray:centerFreq:bandwidth:](self, "removeFreqFromArray:centerFreq:bandwidth:", v14, a4, a5);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mCellularSearchFreqList"));
    -[WCM_SacManager removeFreqFromArray:centerFreq:bandwidth:](self, "removeFreqFromArray:centerFreq:bandwidth:", v17, a4, a5);

    -[WCM_SacManager sacReportCellularVictimFreqListOnTargetSac:action:](self, "sacReportCellularVictimFreqListOnTargetSac:action:", 1, 1);
    -[WCM_SacManager sacReportCellularVictimFreqListOnTargetSac:action:](self, "sacReportCellularVictimFreqListOnTargetSac:action:", 2, 1);
  }
}

- (void)frequencyToolAddClientFreq:(int)a3 centerFreq:(unint64_t)a4 bandwidth:(unint64_t)a5 celluarCarrierType:(int)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  FreqRangeInfo *v14;
  void *v15;
  id v16;

  if (a3)
  {
    if (a3 == 2)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", *(_QWORD *)&a3, CFSTR("Frequency tool client(GNSS) add freq=%llu, bw=%llu"), a5, *(_QWORD *)&a6, a4, a5);
      v9 = objc_alloc((Class)NSMutableArray);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL1FreqList](self, "mGnssL1FreqList"));
      v16 = objc_msgSend(v9, "initWithArray:", v10);

      v11 = objc_alloc((Class)NSMutableArray);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mGnssL5FreqList](self, "mGnssL5FreqList"));
      v13 = objc_msgSend(v11, "initWithArray:", v12);

      v14 = -[FreqRangeInfo initWithFreq:Bw:]([FreqRangeInfo alloc], "initWithFreq:Bw:", a4, a5);
      v15 = v16;
      if (a4 - 1567747500 < 0xEA2569 || (v15 = v13, a4 - 1170200000 <= 0xBEBC20))
        objc_msgSend(v15, "addObject:", v14);
      -[WCM_SacManager sacUpdateGnssFreqInfo:L5Freq:](self, "sacUpdateGnssFreqInfo:L5Freq:", v16, v13);
      -[WCM_SacManager sacReportGnssVictimFreqListOnTargetSac:action:](self, "sacReportGnssVictimFreqListOnTargetSac:action:", 1, 1);
      -[WCM_SacManager sacReportGnssVictimFreqListOnTargetSac:action:](self, "sacReportGnssVictimFreqListOnTargetSac:action:", 2, 1);

    }
    else if (a3 == 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Frequency tool client(WiFi) add freq=%llu, bw=%llu"), a5, *(_QWORD *)&a6, a4, a5);
      -[WCM_SacManager sacUpdateWiFiFreqInfo:Bandwidth:](self, "sacUpdateWiFiFreqInfo:Bandwidth:", a4, a5);
      -[WCM_SacManager sacReportWifiVictimFreqListOnTargetSac:action:](self, "sacReportWifiVictimFreqListOnTargetSac:action:", 1, 1);
      -[WCM_SacManager sacReportWifiVictimFreqListOnTargetSac:action:](self, "sacReportWifiVictimFreqListOnTargetSac:action:", 2, 1);
    }
  }
  else
  {
    -[WCM_SacManager frequencyToolAddCellularFreq:bandwidth:freqType:](self, "frequencyToolAddCellularFreq:bandwidth:freqType:", a4, a5, *(_QWORD *)&a6);
    -[WCM_SacManager sacReportCellularVictimFreqListOnTargetSac:action:](self, "sacReportCellularVictimFreqListOnTargetSac:action:", 1, 1);
    -[WCM_SacManager sacReportCellularVictimFreqListOnTargetSac:action:](self, "sacReportCellularVictimFreqListOnTargetSac:action:", 2, 1);
  }
}

- (void)frequencyToolAddCellularFreq:(unint64_t)a3 bandwidth:(unint64_t)a4 freqType:(int)a5
{
  uint64_t v5;
  FreqRangeInfo *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  FreqRangeInfo *v17;

  v5 = *(_QWORD *)&a5;
  v17 = -[FreqRangeInfo initWithFreq:Bw:]([FreqRangeInfo alloc], "initWithFreq:Bw:", a3, a4);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Frequency tool client(Cellular) add freq=%llu, bw=%llu, type=%d"), a3, a4, v5);
  if ((_DWORD)v5 == 3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mCellularSearchFreqList"));
    goto LABEL_7;
  }
  if ((_DWORD)v5 == 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mCellularSccFreqList"));
    goto LABEL_7;
  }
  v9 = v17;
  if ((_DWORD)v5 == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mCellularPccFreq"));
    objc_msgSend(v12, "removeAllObjects");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCellularFreqSet](self, "mCellularFreqSet"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mCellularPccFreq"));
LABEL_7:
    v16 = v15;
    objc_msgSend(v15, "addObject:", v17);

    v9 = v17;
  }

}

- (void)frequencyToolGetJasperResult:(id)a3 generalSacResult:(id)a4 client:(int)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  if (v19 && v8)
  {
    objc_msgSend(v19, "removeAllObjects");
    objc_msgSend(v8, "removeAllObjects");
    if (a5)
    {
      if (a5 == 2)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheGnssReportedReducedList](self, "mCacheGnssReportedReducedList"));
        v13 = v19;
      }
      else
      {
        if (a5 == 1)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheWifiReportedReducedList](self, "mCacheWifiReportedReducedList"));
          objc_msgSend(v19, "addObjectsFromArray:", v9);

          v10 = objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheWifiReportedFullList](self, "mCacheWifiReportedFullList"));
LABEL_11:
          v18 = (void *)v10;
          objc_msgSend(v8, "addObjectsFromArray:", v10);

          goto LABEL_12;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheCellularReportedReducedList](self, "mCacheCellularReportedReducedList"));
        objc_msgSend(v19, "addObjectsFromArray:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheWifiReportedReducedList](self, "mCacheWifiReportedReducedList"));
        objc_msgSend(v19, "addObjectsFromArray:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheGnssReportedReducedList](self, "mCacheGnssReportedReducedList"));
        objc_msgSend(v19, "addObjectsFromArray:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheCellularReportedFullList](self, "mCacheCellularReportedFullList"));
        objc_msgSend(v8, "addObjectsFromArray:", v17);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheWifiReportedFullList](self, "mCacheWifiReportedFullList"));
        v13 = v8;
      }
      objc_msgSend(v13, "addObjectsFromArray:", v12);

      v10 = objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheGnssReportedFullList](self, "mCacheGnssReportedFullList"));
      goto LABEL_11;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheCellularReportedReducedList](self, "mCacheCellularReportedReducedList"));
    objc_msgSend(v19, "addObjectsFromArray:", v11);

    v10 = objc_claimAutoreleasedReturnValue(-[WCM_SacManager mCacheCellularReportedFullList](self, "mCacheCellularReportedFullList"));
    goto LABEL_11;
  }
LABEL_12:

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WCM_SacManager;
  -[WCM_SacManager dealloc](&v2, "dealloc");
}

- (void)setMCellularFreqInclusionList:(id)a3
{
  objc_storeStrong((id *)&self->_mCellularFreqInclusionList, a3);
}

- (NSMutableArray)mWifiFreqList
{
  return self->_mWifiFreqList;
}

- (void)setMWifiFreqList:(id)a3
{
  objc_storeStrong((id *)&self->_mWifiFreqList, a3);
}

- (void)setMGnssL1FreqList:(id)a3
{
  objc_storeStrong((id *)&self->_mGnssL1FreqList, a3);
}

- (void)setMGnssL5FreqList:(id)a3
{
  objc_storeStrong((id *)&self->_mGnssL5FreqList, a3);
}

- (void)setMCellularFreqSet:(id)a3
{
  objc_storeStrong((id *)&self->_mCellularFreqSet, a3);
}

- (void)setMCacheCellularReportedFullList:(id)a3
{
  objc_storeStrong((id *)&self->_mCacheCellularReportedFullList, a3);
}

- (void)setMCacheCellularReportedReducedList:(id)a3
{
  objc_storeStrong((id *)&self->_mCacheCellularReportedReducedList, a3);
}

- (NSMutableArray)mCacheWifiReportedFullList
{
  return self->_mCacheWifiReportedFullList;
}

- (void)setMCacheWifiReportedFullList:(id)a3
{
  objc_storeStrong((id *)&self->_mCacheWifiReportedFullList, a3);
}

- (NSMutableArray)mCacheWifiReportedReducedList
{
  return self->_mCacheWifiReportedReducedList;
}

- (void)setMCacheWifiReportedReducedList:(id)a3
{
  objc_storeStrong((id *)&self->_mCacheWifiReportedReducedList, a3);
}

- (void)setMCacheGnssReportedFullList:(id)a3
{
  objc_storeStrong((id *)&self->_mCacheGnssReportedFullList, a3);
}

- (void)setMCacheGnssReportedReducedList:(id)a3
{
  objc_storeStrong((id *)&self->_mCacheGnssReportedReducedList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mCacheGnssReportedReducedList, 0);
  objc_storeStrong((id *)&self->_mCacheGnssReportedFullList, 0);
  objc_storeStrong((id *)&self->_mCacheWifiReportedReducedList, 0);
  objc_storeStrong((id *)&self->_mCacheWifiReportedFullList, 0);
  objc_storeStrong((id *)&self->_mCacheCellularReportedReducedList, 0);
  objc_storeStrong((id *)&self->_mCacheCellularReportedFullList, 0);
  objc_storeStrong((id *)&self->_mCellularFreqSet, 0);
  objc_storeStrong((id *)&self->_mGnssL5FreqList, 0);
  objc_storeStrong((id *)&self->_mGnssL1FreqList, 0);
  objc_storeStrong((id *)&self->_mWifiFreqList, 0);
  objc_storeStrong((id *)&self->_mCellularFreqInclusionList, 0);
  objc_storeStrong((id *)&self->mQueue, 0);
}

@end
