@implementation WCM_CellularRc1CoexIssueTable

- (id)initFromPlist:(id)a3
{
  id v4;
  WCM_CellularRc1CoexIssueTable *v5;
  NSMutableArray *v6;
  NSMutableArray *mCellularRc1CoexIssueTable;
  NSData *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  int *v12;
  const __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id *p_isa;
  void *v73;
  void *v74;
  objc_super v75;

  v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)WCM_CellularRc1CoexIssueTable;
  v5 = -[WCM_CellularRc1CoexIssueTable init](&v75, "init");
  v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularRc1CoexIssueTable = v5->mCellularRc1CoexIssueTable;
  p_isa = (id *)&v5->super.isa;
  v5->mCellularRc1CoexIssueTable = v6;

  v71 = v4;
  v8 = sub_1000896B4((uint64_t)v4, (uint64_t)CFSTR("plist"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:"));
  v69 = 0;
  if (v9)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("init Cellular-RC1 Coex Plist File Found"));
    if (objc_msgSend(v9, "count"))
    {
      v10 = 0;
      v11 = 1;
      v12 = &OBJC_IVAR___WRM_LTECoexMetrics_mULCACoexStats;
      v13 = CFSTR("issueBand");
      do
      {
        v14 = objc_alloc_init((Class)(v12 + 502));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v13));

        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cellular-RC1 Coex Plist: issueBand = %@"), v16);
        if ((objc_msgSend(v14, "setIssueFrequencyRangeByIssueBand:", v16) & 1) != 0)
        {
          v74 = v16;
          v17 = v13;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("issueType")));
          objc_msgSend(v14, "setIssueType:", objc_msgSend(v19, "intValue"));

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("RC1Channel")));

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(off_100270BC8, "objectForKeyedSubscript:", v21));
          if (v22)
          {
            v73 = v21;
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(off_100270BC8, "objectForKeyedSubscript:", v21));
            objc_msgSend(v14, "setRc1IssueChannel:", objc_msgSend(v23, "intValue"));

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("cellAntenna1")));
            v26 = objc_msgSend(v25, "intValue");

            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("cellTxPowerLimit1")));

            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("cellTxPowerLimit1")));
            objc_msgSend(v30, "doubleValue");
            v32 = v31;

            if ((_DWORD)v26)
            {
              if (objc_msgSend(v28, "containsString:", CFSTR("NA")))
              {
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "CellAntBlockingList"));
                v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v26));
                objc_msgSend(v33, "addObject:", v34);

                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cellular-RC1 Coex Plist: Block antenna %u"), v26, v68, v69);
              }
              else
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellTxPowerLimit"));
                v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32));
                v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v26));
                objc_msgSend(v35, "setObject:forKey:", v36, v37);

                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cellular-RC1 Coex Plist: Power cap antenna %u to %@dBm"), v26, v28, v69);
              }
            }
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("cellAntenna2")));
            v40 = objc_msgSend(v39, "intValue");

            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("cellTxPowerLimit2")));

            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("cellTxPowerLimit2")));
            objc_msgSend(v44, "doubleValue");
            v46 = v45;

            if ((_DWORD)v40)
            {
              if (objc_msgSend(v42, "containsString:", CFSTR("NA")))
              {
                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "CellAntBlockingList"));
                v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v40));
                objc_msgSend(v47, "addObject:", v48);

                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cellular-RC1 Coex Plist: Block antenna %u"), v40);
              }
              else
              {
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellTxPowerLimit"));
                v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v46));
                v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v40));
                objc_msgSend(v49, "setObject:forKey:", v50, v51);

                v68 = v42;
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cellular-RC1 Coex Plist: Power cap antenna %u to %@dBm"), v40);
              }
            }
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKey:", CFSTR("cellAntenna3")));
            v54 = objc_msgSend(v53, "intValue");

            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKey:", CFSTR("cellTxPowerLimit3")));

            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKey:", CFSTR("cellTxPowerLimit3")));
            objc_msgSend(v58, "doubleValue");
            v60 = v59;

            v17 = CFSTR("issueBand");
            if ((_DWORD)v54)
            {
              if (objc_msgSend(v56, "containsString:", CFSTR("NA")))
              {
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "CellAntBlockingList"));
                v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v54));
                objc_msgSend(v61, "addObject:", v62);

                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cellular-RC1 Coex Plist: Block antenna %u"), v54);
              }
              else
              {
                v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellTxPowerLimit"));
                v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v60));
                v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v54));
                objc_msgSend(v63, "setObject:forKey:", v64, v65);

                v68 = v56;
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cellular-RC1 Coex Plist: Power cap antenna %u to %@dBm"), v54);
              }
            }
            objc_msgSend(p_isa[1], "addObject:", v14);

            v12 = &OBJC_IVAR___WRM_LTECoexMetrics_mULCACoexStats;
            v21 = v73;
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("RC1 channel type %@ is not defined"), v21);
          }

          v13 = v17;
          v16 = v74;
        }
        else
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("issue band %@ is not defined"), v16);
        }

        v10 = v11;
      }
      while ((unint64_t)objc_msgSend(v9, "count") > v11++);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("init: No Plist File Found for Cellular-RC1 Coex"));
  }

  return p_isa;
}

- (id)initFromPlistV2:(id)a3
{
  id v4;
  WCM_CellularRc1CoexIssueTable *v5;
  NSMutableArray *v6;
  NSMutableArray *mCellularRc1CoexIssueTable;
  NSData *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  WCM_CellularRc1CoexIssue *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  uint64_t v39;
  void *v40;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)WCM_CellularRc1CoexIssueTable;
  v5 = -[WCM_CellularRc1CoexIssueTable init](&v48, "init");
  v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularRc1CoexIssueTable = v5->mCellularRc1CoexIssueTable;
  v5->mCellularRc1CoexIssueTable = v6;

  v47 = v4;
  v8 = sub_1000896B4((uint64_t)v4, (uint64_t)CFSTR("plist"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:"));
  v45 = 0;
  if (v9)
    v10 = CFSTR("init: Antenna blocking policy Plist File Found");
  else
    v10 = CFSTR("init: No antenna blocking policy Plist File Found");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v10);
  v44 = v9;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("NB_MMS_Client")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("Policy")));
  if (objc_msgSend(v11, "count"))
  {
    v12 = 0;
    v13 = 1;
    do
    {
      v14 = objc_alloc_init(WCM_CellularRc1CoexIssue);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v12));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Cellular_Band")));
      -[WCM_CellularRc1CoexIssue setCellBand:](v14, "setCellBand:", objc_msgSend(v16, "intValue"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Coex_Tech")));
      -[WCM_CellularRc1CoexIssue setBandInfoType:](v14, "setBandInfoType:", objc_msgSend(v17, "intValue"));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Issue_Type")));
      -[WCM_CellularRc1CoexIssue setIssueType:](v14, "setIssueType:", objc_msgSend(v18, "intValue"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Cellular_Center_Frequency_KHz")));
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Cellular_Bandwidth_KHz")));
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cellular-RC1 Coex Plist: issueBand = %u, Coex_Tech=%u"), -[WCM_CellularRc1CoexIssue cellBand](v14, "cellBand"), -[WCM_CellularRc1CoexIssue bandInfoType](v14, "bandInfoType"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("NB_Antenna_Bitmap")));
      -[WCM_CellularRc1CoexIssue setRc1AntBitmap:](v14, "setRc1AntBitmap:", objc_msgSend(v25, "intValue"));

      -[WCM_CellularRc1CoexIssue setDownlinkLowFreq_Hz:](v14, "setDownlinkLowFreq_Hz:", 0.0);
      -[WCM_CellularRc1CoexIssue setDownlinkHighFreq_Hz:](v14, "setDownlinkHighFreq_Hz:", 0.0);
      v26 = v24 * 0.5;
      -[WCM_CellularRc1CoexIssue setUplinkLowFreq_Hz:](v14, "setUplinkLowFreq_Hz:", (v21 - v26) * 1000.0);
      -[WCM_CellularRc1CoexIssue setUplinkHighFreq_Hz:](v14, "setUplinkHighFreq_Hz:", (v21 + v26) * 1000.0);
      -[WCM_CellularRc1CoexIssue uplinkLowFreq_Hz](v14, "uplinkLowFreq_Hz");
      v28 = v27;
      -[WCM_CellularRc1CoexIssue uplinkHighFreq_Hz](v14, "uplinkHighFreq_Hz");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cellular-RC1 Coex Plist: uplinkLowFreq_Hz = %f, uplinkHighFreq_Hz=%f"), v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("NB_Priority_Bitmap")));
      -[WCM_CellularRc1CoexIssue setRc1PriorityBitmap:](v14, "setRc1PriorityBitmap:", objc_msgSend(v30, "intValue"));

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("NB_Channel_Band")));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(off_100270BC8, "objectForKeyedSubscript:", v31));

      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(off_100270BC8, "objectForKeyedSubscript:", v31));
        -[WCM_CellularRc1CoexIssue setRc1IssueChannel:](v14, "setRc1IssueChannel:", objc_msgSend(v33, "intValue"));

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("NB_Channel_Start")));
        -[WCM_CellularRc1CoexIssue setNbChannelToAvoidStart:](v14, "setNbChannelToAvoidStart:", objc_msgSend(v34, "intValue"));

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("NB_Channel_End")));
        -[WCM_CellularRc1CoexIssue setNbChannelToAvoidEnd:](v14, "setNbChannelToAvoidEnd:", objc_msgSend(v35, "intValue"));

        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Cellular_Ant_Bitmap")));
        -[WCM_CellularRc1CoexIssue setCellAgressorAntBitmap:](v14, "setCellAgressorAntBitmap:", objc_msgSend(v36, "intValue"));

        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Cellular_TX_Power_Cap")));
        objc_msgSend(v37, "doubleValue");
        LODWORD(v39) = vcvtd_n_s64_f64(v38, 4uLL);
        -[WCM_CellularRc1CoexIssue setCellTxPowerCap_16th_dBm:](v14, "setCellTxPowerCap_16th_dBm:", v39);

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Mitigation_Type")));
        -[WCM_CellularRc1CoexIssue setMitigationType:](v14, "setMitigationType:", objc_msgSend(v40, "intValue"));

        -[NSMutableArray addObject:](v5->mCellularRc1CoexIssueTable, "addObject:", v14);
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("RC1 channel type %@ is not defined"), v31);
      }

      v12 = v13;
    }
    while ((unint64_t)objc_msgSend(v11, "count") > v13++);
  }

  return v5;
}

- (unsigned)getTableSize
{
  NSMutableArray *mCellularRc1CoexIssueTable;

  mCellularRc1CoexIssueTable = self->mCellularRc1CoexIssueTable;
  if (mCellularRc1CoexIssueTable)
    LODWORD(mCellularRc1CoexIssueTable) = -[NSMutableArray count](mCellularRc1CoexIssueTable, "count");
  return mCellularRc1CoexIssueTable;
}

- (id)findCellRc1CoexIssueByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1Channel:(int)a8
{
  NSMutableArray *mCellularRc1CoexIssueTable;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  double v19;
  double v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  mCellularRc1CoexIssueTable = self->mCellularRc1CoexIssueTable;
  if (mCellularRc1CoexIssueTable && -[NSMutableArray count](mCellularRc1CoexIssueTable, "count", a4, a5, a6, a7))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = self->mCellularRc1CoexIssueTable;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v18, "bandInfoType", (_QWORD)v23) & a3) != 0)
          {
            objc_msgSend(v18, "uplinkLowFreq_Hz");
            if (v19 <= a6)
            {
              objc_msgSend(v18, "uplinkHighFreq_Hz");
              if (v20 > a6 && (objc_msgSend(v18, "Rc1IssueChannel") & a8) != 0)
              {
                v21 = v18;
                goto LABEL_17;
              }
            }
          }
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v15)
          continue;
        break;
      }
    }
    v21 = 0;
LABEL_17:

  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (id)findAllCellRc1CoexIssueByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1Channel:(int)a8
{
  NSMutableArray *mCellularRc1CoexIssueTable;
  NSMutableArray *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  double v20;
  double v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  mCellularRc1CoexIssueTable = self->mCellularRc1CoexIssueTable;
  if (mCellularRc1CoexIssueTable && -[NSMutableArray count](mCellularRc1CoexIssueTable, "count", a4, a5, a6, a7))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = self->mCellularRc1CoexIssueTable;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v19, "bandInfoType", (_QWORD)v23) & a3) != 0)
          {
            objc_msgSend(v19, "uplinkLowFreq_Hz");
            if (v20 <= a6)
            {
              objc_msgSend(v19, "uplinkHighFreq_Hz");
              if (v21 > a6 && (objc_msgSend(v19, "Rc1IssueChannel") & a8) != 0)
              {
                if (!v16)
                  v16 = objc_alloc_init((Class)NSMutableArray);
                objc_msgSend(v16, "addObject:", v19);
              }
            }
          }
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (BOOL)isCellularInRc1CoexBand:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1ChannelBitmask:(unsigned int)a8
{
  uint64_t v13;
  unsigned int v15;
  BOOL v16;
  int v17;
  void *v18;
  void *v19;

  v13 = *(_QWORD *)&a3;
  v15 = 0;
  v16 = 1;
  v17 = 1;
  while ((v17 & a8) == 0)
  {
LABEL_6:
    v17 = 2 << v15;
    v16 = v15++ < 9;
    if (v15 == 10)
      return 0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_CellularRc1CoexIssueTable findCellRc1CoexIssueByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:](self, "findCellRc1CoexIssueByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:", v13, a4, a5, a6, a7));
  v19 = v18;
  if (!v18
    || (objc_msgSend(v18, "uwbCoexIssueFreqRangeForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:uwbIssueFreqRange:", 0, a4, a5, a6, a7) & 1) == 0)
  {

    goto LABEL_6;
  }

  return v16;
}

- (void)findRc1NbCoexIssueChannelByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1Channel:(int)a8 uwbNbIssueChannelBegin:(int *)a9 uwbNbIssueChannelEnd:(int *)a10
{
  void *v16;
  id v17;

  if (a9 && a10)
  {
    *a9 = -1;
    *a10 = -1;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_CellularRc1CoexIssueTable findCellRc1CoexIssueByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:](self, "findCellRc1CoexIssueByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:", *(_QWORD *)&a3, *(_QWORD *)&a8));
    if (v16)
    {
      v17 = v16;
      objc_msgSend(v16, "uwbNbCoexIssueChannelForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:uwbNbIssueChannelBegin:uwbNbIssueChannelEnd:", a9, a10, a4, a5, a6, a7);
      v16 = v17;
    }

  }
}

- (id)createDynamicRc1NbCoexPolicyByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1Channel:(int)a8
{
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_CellularRc1CoexIssueTable findAllCellRc1CoexIssueByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:](self, "findAllCellRc1CoexIssueByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:", *(_QWORD *)&a3, *(_QWORD *)&a8));
  v13 = v12;
  if (v12
    && (v23 = 0u,
        v24 = 0u,
        v21 = 0u,
        v22 = 0u,
        (v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16)) != 0))
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "uwbNbDynamicCoexPolicyForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", a4, a5, a6, a7));
        if (v19)
        {
          if (!v16)
            v16 = objc_alloc_init((Class)NSMutableArray);
          objc_msgSend(v16, "addObject:", v19);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCellularRc1CoexIssueTable, 0);
}

@end
