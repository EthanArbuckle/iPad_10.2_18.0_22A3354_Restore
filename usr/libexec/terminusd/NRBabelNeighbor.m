@implementation NRBabelNeighbor

- (void)enqueueNextIHU
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NRBabelPendingOutgoingTLVs *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_pendingOutgoingPackets;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "representsIHU", (_QWORD)v11))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeObjectsInArray:](self->_pendingOutgoingPackets, "removeObjectsInArray:", v3);
  v10 = -[NRBabelPendingOutgoingTLVs initWithInterval:]([NRBabelPendingOutgoingTLVs alloc], "initWithInterval:", self->_outgoingIHUInterval);
  -[NRBabelPendingOutgoingTLVs setRepresentsIHU:](v10, "setRepresentsIHU:", 1);
  -[NSMutableArray addObject:](self->_pendingOutgoingPackets, "addObject:", v10);

}

- (void)enqueueNextUpdate
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NRBabelPendingOutgoingTLVs *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_pendingOutgoingPackets;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "representsUpdate", (_QWORD)v11))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeObjectsInArray:](self->_pendingOutgoingPackets, "removeObjectsInArray:", v3);
  v10 = -[NRBabelPendingOutgoingTLVs initWithInterval:]([NRBabelPendingOutgoingTLVs alloc], "initWithInterval:", self->_outgoingUpdateInterval);
  -[NRBabelPendingOutgoingTLVs setRepresentsUpdate:](v10, "setRepresentsUpdate:", 1);
  -[NSMutableArray addObject:](self->_pendingOutgoingPackets, "addObject:", v10);

}

- (id)createIHUTLV
{
  unsigned int v2;
  unsigned int v3;
  int v5;
  __int16 v6;
  __int16 v7;

  v2 = bswap32(self->_rxcost);
  v3 = bswap32(self->_outgoingIHUInterval);
  v5 = 1541;
  v6 = HIWORD(v2);
  v7 = HIWORD(v3);
  return objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v5, 8);
}

- (id)createPersonalHelloTLV
{
  int v2;
  unsigned int v3;
  int v5;
  __int16 v6;
  __int16 v7;

  v2 = self->_outgoingPersonalHelloSeqno + 1;
  self->_outgoingPersonalHelloSeqno = v2;
  v3 = bswap32(self->_outgoingIHUInterval);
  v5 = 8390148;
  v6 = bswap32(v2) >> 16;
  v7 = HIWORD(v3);
  return objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v5, 8);
}

- (void)processPendingOutgoingPackets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  double v14;
  __objc2_prot *v15;
  id v16;
  id v17;
  id v18;
  char v19;
  char v20;
  uint64_t v21;
  void *k;
  void *v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  NRBabelNeighbor *v28;
  NSMutableArray *pendingOutgoingPackets;
  id v30;
  NSMutableArray *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  __objc2_prop_list *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __objc2_prot *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  const char *v46;
  const char *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  NSMutableArray *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *m;
  void *v62;
  double v63;
  double v64;
  double v65;
  NSMutableArray *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *n;
  void *v71;
  double v72;
  double v73;
  double v74;
  NSObject *v75;
  __objc2_prop_list *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  dispatch_time_t v81;
  uint64_t v82;
  __objc2_prop_list *v83;
  void *v84;
  double v85;
  const char *v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  NRBabelNeighbor *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  timespec when;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instance"));

  if (!v4)
    goto LABEL_107;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v6 = v5;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v92 = self;
  v8 = self->_pendingOutgoingPackets;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v110 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "minTime");
        if (v14 <= v6)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
    }
    while (v10);
  }

  v15 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  if (!objc_msgSend(v7, "count"))
  {
    v28 = v92;
    if (-[NSMutableArray count](v92->_pendingOutgoingPackets, "count"))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 2))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        pendingOutgoingPackets = v92->_pendingOutgoingPackets;
        v30 = (id)qword_1001E4740;
        _NRLogWithArgs(v30, 2, "%s%.30s:%-4d not sending anything to %@ (%u not ready yet)", ", "-[NRBabelNeighbor processPendingOutgoingPackets]", 1429, v92, -[NSMutableArray count](pendingOutgoingPackets, "count"));

      }
      v88 = v7;
      v90 = v4;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v31 = v92->_pendingOutgoingPackets;
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v102;
        do
        {
          for (j = 0; j != v33; j = (char *)j + 1)
          {
            if (*(_QWORD *)v102 != v34)
              objc_enumerationMutation(v31);
            v44 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)j);
            if (qword_1001E4748 != -1)
              dispatch_once(&qword_1001E4748, &stru_1001B7158);
            if (_NRLogIsLevelEnabled(v15[25].inst_props, 2))
            {
              if (qword_1001E4748 != -1)
                dispatch_once(&qword_1001E4748, &stru_1001B7158);
              v36 = v15[25].inst_props;
              objc_msgSend(v44, "minTime");
              v38 = v37 - v6;
              objc_msgSend(v44, "maxTime");
              v40 = v39 - v6;
              v41 = v15;
              objc_msgSend(v44, "minTime");
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
              objc_msgSend(v44, "maxTime");
              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
              _NRLogWithArgs(v36, 2, "%s%.30s:%-4d in pipeline: in min %fs max %fs, minTime %@, maxTime %@", ", "-[NRBabelNeighbor processPendingOutgoingPackets]", 1433, *(_QWORD *)&v38, *(_QWORD *)&v40, v42, v43);

              v15 = v41;
            }
          }
          v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
        }
        while (v33);
      }

      v7 = v88;
      v4 = v90;
      v28 = v92;
    }
    else
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 2))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        _NRLogWithArgs(qword_1001E4740, 2, "%s%.30s:%-4d not sending anything to %@ (nothing in queue)", ", "-[NRBabelNeighbor processPendingOutgoingPackets]", 1436, v92);
      }
    }
    goto LABEL_71;
  }
  v89 = v4;
  v91 = objc_alloc_init((Class)NSMutableArray);
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v87 = v7;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = 0;
    v21 = *(_QWORD *)v106;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(_QWORD *)v106 != v21)
          objc_enumerationMutation(v16);
        v23 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)k);
        v24 = objc_msgSend(v23, "representsIHU");
        v25 = objc_msgSend(v23, "representsUpdate");
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "tlvs"));

        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "tlvs"));
          objc_msgSend(v91, "addObjectsFromArray:", v27);

        }
        v20 |= v24;
        v19 |= v25;
        -[NSMutableArray removeObject:](v92->_pendingOutgoingPackets, "removeObject:", v23);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
    v20 = 0;
  }

  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  v7 = v87;
  v4 = v89;
  v15 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  v28 = v92;
  if (!_NRLogIsLevelEnabled(qword_1001E4740, 2))
  {
    if ((v20 & 1) == 0)
      goto LABEL_46;
LABEL_62:
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor createIHUTLV](v28, "createIHUTLV"));
    objc_msgSend(v91, "addObject:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor createPersonalHelloTLV](v28, "createPersonalHelloTLV"));
    objc_msgSend(v91, "addObject:", v50);

    if ((v19 & 1) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if ((v20 & 1) != 0)
    v46 = "IHU+";
  else
    v46 = "";
  if ((v19 & 1) != 0)
    v47 = "Update+";
  else
    v47 = "";
  v48 = (id)qword_1001E4740;
  v86 = v47;
  v28 = v92;
  _NRLogWithArgs(v48, 2, "%s%.30s:%-4d sending %s%s%u to %@", ", "-[NRBabelNeighbor processPendingOutgoingPackets]", 1410, v46, v86, objc_msgSend(v91, "count"), v92);

  if ((v20 & 1) != 0)
    goto LABEL_62;
LABEL_46:
  if ((v19 & 1) != 0)
  {
LABEL_47:
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "createUpdateTLVsWithInterval:", v28->_outgoingUpdateInterval));
    objc_msgSend(v91, "addObjectsFromArray:", v45);

  }
LABEL_48:
  -[NRBabelNeighbor sendTLVs:](v28, "sendTLVs:", v91);
  if ((v20 & 1) != 0)
    -[NRBabelNeighbor enqueueNextIHU](v28, "enqueueNextIHU");
  if ((v19 & 1) != 0)
    -[NRBabelNeighbor enqueueNextUpdate](v28, "enqueueNextUpdate");

LABEL_71:
  if (-[NSMutableArray count](v28->_pendingOutgoingPackets, "count"))
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v28->_pendingOutgoingPackets, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v51, "maxTime");
    v53 = v52;

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v28->_pendingOutgoingPackets, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v54, "minTime");
    v56 = v55;

    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v57 = v28->_pendingOutgoingPackets;
    v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v97, v115, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v98;
      do
      {
        for (m = 0; m != v59; m = (char *)m + 1)
        {
          if (*(_QWORD *)v98 != v60)
            objc_enumerationMutation(v57);
          v62 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)m);
          objc_msgSend(v62, "maxTime");
          if (v63 < v53)
          {
            objc_msgSend(v62, "maxTime");
            v53 = v64;
            objc_msgSend(v62, "minTime");
            v56 = v65;
          }
        }
        v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v97, v115, 16);
      }
      while (v59);
    }

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v66 = v92->_pendingOutgoingPackets;
    v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v94;
      do
      {
        for (n = 0; n != v68; n = (char *)n + 1)
        {
          if (*(_QWORD *)v94 != v69)
            objc_enumerationMutation(v66);
          v71 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)n);
          objc_msgSend(v71, "minTime");
          if (v56 < v72)
          {
            objc_msgSend(v71, "minTime");
            if (v73 < v53)
            {
              objc_msgSend(v71, "minTime");
              v56 = v74;
            }
          }
        }
        v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
      }
      while (v68);
    }

    v75 = v92->_pendingOutgoingTimer;
    if (v56 >= v53)
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(v15[25].inst_props, 17))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        v76 = v15[25].inst_props;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v56));
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v53));
        _NRLogWithArgs(v76, 17, "minTime %@ >= maxTime %@", v77, v78);

      }
      v53 = v56 + 0.001;
    }
    v79 = (v53 - v56) * 2.32830644e-10 * (double)arc4random();
    v80 = v79 + v56;
    when.tv_sec = vcvtmd_s64_f64(v80) + 978307200;
    when.tv_nsec = (uint64_t)((v80 - floor(v80)) * 1000000000.0);
    v81 = dispatch_walltime(&when, 0);
    v82 = (unint64_t)(fmin(v79, v53 - v80) * 1000000000.0);
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(v15[25].inst_props, 2))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v83 = v15[25].inst_props;
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v80));
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      _NRLogWithArgs(v83, 2, "%s%.30s:%-4d rescheduling timer %@ for %@, which is in %fs leeway %llums", ", "rescheduleTimer", 1290, v75, v84, v80 - v85, v82 / 0xF4240);

    }
    dispatch_source_set_timer(v75, v81, 0xFFFFFFFFFFFFFFFFLL, v82);

  }
LABEL_107:

}

- (void)dealloc
{
  NSObject *incomingPublicHelloTimer;
  OS_dispatch_source *v4;
  NSObject *incomingPersonalHelloTimer;
  OS_dispatch_source *v6;
  NSObject *incomingIHUTimer;
  OS_dispatch_source *v8;
  NSObject *pendingOutgoingTimer;
  OS_dispatch_source *v10;
  objc_super v11;

  incomingPublicHelloTimer = self->_incomingPublicHelloTimer;
  if (incomingPublicHelloTimer)
  {
    dispatch_source_cancel(incomingPublicHelloTimer);
    v4 = self->_incomingPublicHelloTimer;
    self->_incomingPublicHelloTimer = 0;

  }
  incomingPersonalHelloTimer = self->_incomingPersonalHelloTimer;
  if (incomingPersonalHelloTimer)
  {
    dispatch_source_cancel(incomingPersonalHelloTimer);
    v6 = self->_incomingPersonalHelloTimer;
    self->_incomingPersonalHelloTimer = 0;

  }
  incomingIHUTimer = self->_incomingIHUTimer;
  if (incomingIHUTimer)
  {
    dispatch_source_cancel(incomingIHUTimer);
    v8 = self->_incomingIHUTimer;
    self->_incomingIHUTimer = 0;

  }
  pendingOutgoingTimer = self->_pendingOutgoingTimer;
  if (pendingOutgoingTimer)
  {
    dispatch_source_cancel(pendingOutgoingTimer);
    v10 = self->_pendingOutgoingTimer;
    self->_pendingOutgoingTimer = 0;

  }
  v11.receiver = self;
  v11.super_class = (Class)NRBabelNeighbor;
  -[NRBabelNeighbor dealloc](&v11, "dealloc");
}

- (void)scheduleTLV:(id)a3 interval:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NRBabelPendingOutgoingTLVs *v8;

  v4 = a4;
  v6 = a3;
  v8 = -[NRBabelPendingOutgoingTLVs initWithInterval:]([NRBabelPendingOutgoingTLVs alloc], "initWithInterval:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelPendingOutgoingTLVs tlvs](v8, "tlvs"));
  objc_msgSend(v7, "addObject:", v6);

  -[NSMutableArray addObject:](self->_pendingOutgoingPackets, "addObject:", v8);
  -[NRBabelNeighbor processPendingOutgoingPackets](self, "processPendingOutgoingPackets");

}

- (void)resetIncomingHelloTimer:(BOOL)a3 personal:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int64_t v9;
  dispatch_time_t v10;
  NSObject *source;

  v4 = a3;
  v5 = 22;
  if (a4)
    v5 = 26;
  v6 = 80;
  if (a4)
    v6 = 56;
  v7 = *(unsigned __int16 *)((char *)&self->super.isa + v5);
  source = *(id *)((char *)&self->super.isa + v6);
  v8 = 12500000 * v7;
  if (v7 <= 0x64)
    v8 = 17500000 * v7;
  if (v4)
    v9 = v8;
  else
    v9 = 10000000 * v7;
  v10 = dispatch_time(0x8000000000000000, v9);
  dispatch_source_set_timer(source, v10, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);

}

- (void)resetIncomingIHUTimerInterval:(unsigned __int16)a3
{
  NSObject *incomingIHUTimer;
  dispatch_time_t v4;

  incomingIHUTimer = self->_incomingIHUTimer;
  v4 = dispatch_time(0x8000000000000000, 35000000 * a3);
  dispatch_source_set_timer(incomingIHUTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (void)updateRXCostCheckTime:(BOOL)a3 personal:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  unint64_t *p_incomingPublicHelloHistory;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  unsigned int v20;
  unsigned int lastIncomingPublicHelloInterval;
  double lastIncomingPublicHelloTime;
  double v23;
  unint64_t *p_incomingPersonalHelloHistory;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  unsigned int v28;
  unsigned int lastIncomingPersonalHelloInterval;
  double lastIncomingPersonalHelloTime;
  double v31;
  unsigned int v32;
  uint64_t rxcost;
  unsigned int v34;
  const char *v35;
  void *v36;
  void *v37;

  v4 = a4;
  v5 = a3;
  p_incomingPublicHelloHistory = &self->_incomingPublicHelloHistory;
  v8 = (int8x16_t)vld1q_dup_f64((const double *)p_incomingPublicHelloHistory);
  v9 = (int8x16_t)xmmword_10015D0B0;
  v10 = (int8x16_t)xmmword_10015D0C0;
  v11 = (int8x16_t)xmmword_10015D0D0;
  v12 = (int8x16_t)xmmword_10015D0E0;
  v13 = (int8x16_t)xmmword_10015D0F0;
  v14 = (int8x16_t)xmmword_10015D100;
  v15 = (int8x16_t)xmmword_10015D110;
  v16 = (int8x16_t)xmmword_10015D120;
  v17 = (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10015D0B0)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10015D0C0))), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10015D0D0)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10015D0E0))));
  v18 = (int8x16_t)xmmword_10015D130;
  v19 = vandq_s8(vcltzq_s8(vshlq_n_s8(vuzp1q_s8(v17, (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10015D0F0)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10015D100))), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10015D110)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_10015D120))))), 7uLL)), (int8x16_t)xmmword_10015D130);
  v17.i8[0] = vaddv_s8(*(int8x8_t *)v19.i8);
  v19.i64[0] = vextq_s8(v19, v19, 8uLL).u64[0];
  v19.i8[0] = vaddv_s8(*(int8x8_t *)v19.i8);
  v19.i32[0] = (unsigned __int16)(v17.i16[0] | (v19.i16[0] << 8));
  *(int8x8_t *)v19.i8 = vcnt_s8(*(int8x8_t *)v19.i8);
  v19.i16[0] = vaddlv_u8(*(uint8x8_t *)v19.i8);
  v20 = v19.i32[0];
  if (a3)
  {
    lastIncomingPublicHelloInterval = self->_lastIncomingPublicHelloInterval;
    lastIncomingPublicHelloTime = self->_lastIncomingPublicHelloTime;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v18 = (int8x16_t)xmmword_10015D130;
    v16 = (int8x16_t)xmmword_10015D120;
    v15 = (int8x16_t)xmmword_10015D110;
    v14 = (int8x16_t)xmmword_10015D100;
    v13 = (int8x16_t)xmmword_10015D0F0;
    v12 = (int8x16_t)xmmword_10015D0E0;
    v11 = (int8x16_t)xmmword_10015D0D0;
    v10 = (int8x16_t)xmmword_10015D0C0;
    v9 = (int8x16_t)xmmword_10015D0B0;
    v20 += ((v23 - lastIncomingPublicHelloTime) * 100.0) / lastIncomingPublicHelloInterval;
  }
  p_incomingPersonalHelloHistory = &self->_incomingPersonalHelloHistory;
  v25 = (int8x16_t)vld1q_dup_f64((const double *)p_incomingPersonalHelloHistory);
  v26 = (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v9)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v10))), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v11)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v12))));
  v27 = vandq_s8(vcltzq_s8(vshlq_n_s8(vuzp1q_s8(v26, (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v13)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v14))), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v15)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v16))))), 7uLL)), v18);
  v26.i8[0] = vaddv_s8(*(int8x8_t *)v27.i8);
  v27.i64[0] = vextq_s8(v27, v27, 8uLL).u64[0];
  v27.i8[0] = vaddv_s8(*(int8x8_t *)v27.i8);
  v27.i32[0] = (unsigned __int16)(v26.i16[0] | (v27.i16[0] << 8));
  *(int8x8_t *)v27.i8 = vcnt_s8(*(int8x8_t *)v27.i8);
  v27.i16[0] = vaddlv_u8(*(uint8x8_t *)v27.i8);
  v28 = v27.i32[0];
  if (v5)
  {
    lastIncomingPersonalHelloInterval = self->_lastIncomingPersonalHelloInterval;
    lastIncomingPersonalHelloTime = self->_lastIncomingPersonalHelloTime;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v28 += ((v31 - lastIncomingPersonalHelloTime) * 100.0) / lastIncomingPersonalHelloInterval;
  }
  if (v20 >= v28)
    v32 = v28;
  else
    v32 = v20;
  rxcost = self->_rxcost;
  if (v32 <= 0xF)
    v34 = 0x1000 / (16 - (unsigned __int16)v32);
  else
    v34 = 0xFFFF;
  self->_rxcost = v34;
  if (v34 != (_DWORD)rxcost)
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v35 = "hello";
      if (v5)
        v35 = "timeout";
      _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d changing rxcost for %@ from %u to %u in response to %s", ", "-[NRBabelNeighbor updateRXCostCheckTime:personal:]", 1562, self, rxcost, self->_rxcost, v35);
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "instance"));
    objc_msgSend(v37, "updateRoutes");

  }
  -[NRBabelNeighbor resetIncomingHelloTimer:personal:](self, "resetIncomingHelloTimer:personal:", !v5, v4);
}

- (void)handleHelloWithSeqno:(unsigned __int16)a3 interval:(unsigned __int16)a4 personal:(BOOL)a5
{
  _BOOL8 v5;
  int v7;
  unsigned int lastIncomingPersonalHelloSeqno;
  int v9;
  unint64_t v10;
  unsigned int lastIncomingPublicHelloSeqno;
  int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;

  v5 = a5;
  v7 = a3 | 0x10000;
  if (a5)
  {
    lastIncomingPersonalHelloSeqno = self->_lastIncomingPersonalHelloSeqno;
    if (lastIncomingPersonalHelloSeqno < a3)
      v7 = a3;
    v9 = v7 - lastIncomingPersonalHelloSeqno;
    if (v9 < 1)
      v9 += 0x10000;
    if (v9 <= 16)
      v10 = (self->_incomingPersonalHelloHistory << v9) | 1;
    else
      v10 = 0xFFFFLL;
    self->_incomingPersonalHelloHistory = v10;
    self->_lastIncomingPersonalHelloSeqno = a3;
    if (a4)
    {
      v14 = 72;
      v15 = 26;
LABEL_20:
      *(_WORD *)((char *)&self->super.isa + v15) = a4;
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      *(Class *)((char *)&self->super.isa + v14) = v16;
      -[NRBabelNeighbor updateRXCostCheckTime:personal:](self, "updateRXCostCheckTime:personal:", 0, v5);
    }
  }
  else
  {
    lastIncomingPublicHelloSeqno = self->_lastIncomingPublicHelloSeqno;
    if (lastIncomingPublicHelloSeqno < a3)
      v7 = a3;
    v12 = v7 - lastIncomingPublicHelloSeqno;
    if (v12 < 1)
      v12 += 0x10000;
    if (v12 <= 16)
      v13 = (self->_incomingPublicHelloHistory << v12) | 1;
    else
      v13 = 0xFFFFLL;
    self->_incomingPublicHelloHistory = v13;
    self->_lastIncomingPublicHelloSeqno = a3;
    if (a4)
    {
      v14 = 48;
      v15 = 22;
      goto LABEL_20;
    }
  }
}

- (NRBabelNeighbor)initWithAddress:(const in6_addr *)a3 babelInterface:(id)a4
{
  id v4;
  id v7;
  char *v8;
  NRBabelNeighbor *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  NRBabelNeighbor *v14;
  char v15;
  NRDDTLSStack *v16;
  void *v17;
  id *v18;
  id v19;
  void *v20;
  NSObject *v21;
  OS_dispatch_source *v22;
  OS_dispatch_source *incomingPublicHelloTimer;
  NSObject *v24;
  OS_dispatch_source *v25;
  OS_dispatch_source *incomingPersonalHelloTimer;
  NSObject *v27;
  OS_dispatch_source *v28;
  OS_dispatch_source *incomingIHUTimer;
  NSObject *v30;
  OS_dispatch_source *v31;
  OS_dispatch_source *pendingOutgoingTimer;
  NSMutableArray *v33;
  NSMutableArray *pendingOutgoingPackets;
  NRBabelPendingOutgoingTLVs *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  id v41;
  int IsLevelEnabled;
  id v43;
  int *v44;
  uint64_t v45;
  id v46;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD handler[4];
  id v55;
  id location;
  objc_super v57;

  v4 = a4;
  v7 = a4;
  v8 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "instance"));
  if (v8)
  {
    v57.receiver = self;
    v57.super_class = (Class)NRBabelNeighbor;
    v9 = -[NRBabelNeighbor init](&v57, "init");
    if (v9)
    {
      self = v9;
      v9->_address = *a3;
      objc_storeStrong((id *)&v9->_babelInterface, v4);
      if (!objc_msgSend(v7, "dtlsEnabled"))
      {
LABEL_17:
        self->_outgoingPersonalHelloSeqno = arc4random_uniform(0x10000u);
        self->_incomingPublicHelloHistory = 0xFFFFLL;
        self->_incomingPersonalHelloHistory = 0xFFFFLL;
        *(_QWORD *)&self->_outgoingIHUInterval = -4059036496;
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
        v22 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v21);
        incomingPublicHelloTimer = self->_incomingPublicHelloTimer;
        self->_incomingPublicHelloTimer = v22;

        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
        v25 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v24);
        incomingPersonalHelloTimer = self->_incomingPersonalHelloTimer;
        self->_incomingPersonalHelloTimer = v25;

        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
        v28 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v27);
        incomingIHUTimer = self->_incomingIHUTimer;
        self->_incomingIHUTimer = v28;

        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
        v31 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v30);
        pendingOutgoingTimer = self->_pendingOutgoingTimer;
        self->_pendingOutgoingTimer = v31;

        v33 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        pendingOutgoingPackets = self->_pendingOutgoingPackets;
        self->_pendingOutgoingPackets = v33;

        v35 = objc_alloc_init(NRBabelPendingOutgoingTLVs);
        -[NRBabelPendingOutgoingTLVs setRepresentsIHU:](v35, "setRepresentsIHU:", 1);
        -[NRBabelPendingOutgoingTLVs setRepresentsUpdate:](v35, "setRepresentsUpdate:", 1);
        -[NSMutableArray addObject:](self->_pendingOutgoingPackets, "addObject:", v35);
        -[NRBabelNeighbor processPendingOutgoingPackets](self, "processPendingOutgoingPackets");
        objc_initWeak(&location, self);
        v36 = self->_pendingOutgoingTimer;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1000B6740;
        handler[3] = &unk_1001B7F28;
        objc_copyWeak(&v55, &location);
        dispatch_source_set_event_handler(v36, handler);
        dispatch_activate((dispatch_object_t)self->_pendingOutgoingTimer);
        v37 = self->_incomingPublicHelloTimer;
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_1000B6770;
        v52[3] = &unk_1001B7F28;
        objc_copyWeak(&v53, &location);
        dispatch_source_set_event_handler(v37, v52);
        dispatch_activate((dispatch_object_t)self->_incomingPublicHelloTimer);
        v38 = self->_incomingPersonalHelloTimer;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_1000B67A8;
        v50[3] = &unk_1001B7F28;
        objc_copyWeak(&v51, &location);
        dispatch_source_set_event_handler(v38, v50);
        dispatch_activate((dispatch_object_t)self->_incomingPersonalHelloTimer);
        v39 = self->_incomingIHUTimer;
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_1000B67E0;
        v48[3] = &unk_1001B7F28;
        objc_copyWeak(&v49, &location);
        dispatch_source_set_event_handler(v39, v48);
        dispatch_activate((dispatch_object_t)self->_incomingIHUTimer);
        self = self;
        objc_destroyWeak(&v49);
        objc_destroyWeak(&v51);
        objc_destroyWeak(&v53);
        objc_destroyWeak(&v55);
        objc_destroyWeak(&location);

        v14 = self;
        goto LABEL_18;
      }
      -[NRBabelNeighbor setDtlsEnabled:](self, "setDtlsEnabled:", 1);
      v4 = (id)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
      v10 = (unint64_t *)objc_msgSend(v4, "localAddress");
      v11 = bswap64(*(_QWORD *)a3->__u6_addr8);
      v12 = bswap64(*v10);
      if (v11 == v12 && (v11 = bswap64(*(_QWORD *)&a3->__u6_addr32[2]), v12 = bswap64(v10[1]), v11 == v12))
      {
        v13 = 0;
      }
      else if (v11 < v12)
      {
        v13 = -1;
      }
      else
      {
        v13 = 1;
      }
      v15 = v13 > 0;
      v16 = [NRDDTLSStack alloc];
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
      v18 = sub_100126284((id *)&v16->super.isa, v17, v15, self);
      -[NRBabelNeighbor setDtlsStack:](self, "setDtlsStack:", v18);

      a3 = (const in6_addr *)&OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
      if (qword_1001E4748 == -1)
      {
LABEL_12:
        if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
        {
          if (*(_QWORD *)&a3[116].__u6_addr32[2] != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          v19 = (id)qword_1001E4740;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor dtlsStack](self, "dtlsStack"));
          _NRLogWithArgs(v19, 1, "%s%.30s:%-4d %@ started %@", ", "-[NRBabelNeighbor initWithAddress:babelInterface:]", 1636, self, v20);

        }
        goto LABEL_17;
      }
    }
    else
    {
      v41 = sub_1000B093C();
      IsLevelEnabled = _NRLogIsLevelEnabled(v41, 16);

      if (IsLevelEnabled)
      {
        v43 = sub_1000B093C();
        _NRLogWithArgs(v43, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBabelNeighbor initWithAddress:babelInterface:]", 1626);

      }
      v7 = (id)_os_log_pack_size(12);
      v8 = (char *)&v48[-1] - ((__chkstk_darwin(v7) + 15) & 0xFFFFFFFFFFFFFFF0);
      v44 = __error();
      v45 = _os_log_pack_fill(v8, v7, *v44, &_mh_execute_header, "%{public}s [super init] failed");
      *(_DWORD *)v45 = 136446210;
      *(_QWORD *)(v45 + 4) = "-[NRBabelNeighbor initWithAddress:babelInterface:]";
      v46 = sub_1000B093C();
      _NRLogAbortWithPack(v46, v8);
    }
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
    goto LABEL_12;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (BOOL)matchesAddress:(const in6_addr *)a3
{
  return *(_QWORD *)self->_address.__u6_addr8 == *(_QWORD *)a3->__u6_addr8
      && *(_QWORD *)&self->_address.__u6_addr32[2] == *(_QWORD *)&a3->__u6_addr32[2];
}

- (BOOL)matchesAddress:(const in6_addr *)a3 babelInterface:(id)a4
{
  unsigned int v6;

  v6 = -[NRBabelInterface isEqual:](self->_babelInterface, "isEqual:", a4);
  if (v6)
    LOBYTE(v6) = -[NRBabelNeighbor matchesAddress:](self, "matchesAddress:", a3);
  return v6;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *IPv6AddrString;
  NRBabelInterface *babelInterface;
  unsigned int v7;
  const char *v8;
  id v9;

  v3 = objc_alloc((Class)NSString);
  IPv6AddrString = (void *)createIPv6AddrString(&self->_address, v4);
  babelInterface = self->_babelInterface;
  v7 = -[NRBabelNeighbor dtlsEnabled](self, "dtlsEnabled");
  v8 = "";
  if (v7)
    v8 = "_DTLS";
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@[%@]%s"), IPv6AddrString, babelInterface, v8);

  return (NSString *)v9;
}

- (id)descriptionWithNextHop:(const in6_addr *)a3
{
  unsigned __int8 v5;
  uint64_t v6;
  id v7;
  void *IPv6AddrString;
  id v9;
  void *v10;

  v5 = -[NRBabelNeighbor matchesAddress:](self, "matchesAddress:");
  v7 = objc_alloc((Class)NSString);
  if ((v5 & 1) != 0)
  {
    IPv6AddrString = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor description](self, "description"));
    v9 = objc_msgSend(v7, "initWithString:", IPv6AddrString);
  }
  else
  {
    IPv6AddrString = (void *)createIPv6AddrString(a3, v6);
    v9 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@(nh %@)"), self, IPv6AddrString);
  }
  v10 = v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = objc_opt_class(NRBabelNeighbor);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = objc_msgSend(v4, "matchesAddress:babelInterface:", &self->_address, self->_babelInterface);
  else
    v6 = 0;

  return v6;
}

- (unsigned)metric
{
  unsigned int txcost;
  unsigned __int16 v3;
  int v4;
  unsigned int v5;

  txcost = self->_txcost;
  v3 = -1;
  if (txcost != 0xFFFF)
  {
    if (txcost <= 0x100)
      v4 = 256;
    else
      v4 = self->_txcost;
    v5 = self->_rxcost * v4;
    if (v5 > 0xFFFEFF)
      return -1;
    else
      return v5 >> 8;
  }
  return v3;
}

- (void)sendFullPacket:(iovec *)a3 iovLen:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  size_t *p_iov_len;
  id *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD completion[5];

  v4 = *(_QWORD *)&a4;
  if (!-[NRBabelNeighbor dtlsEnabled](self, "dtlsEnabled"))
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
    objc_msgSend(v13, "sendPacket:iovLen:toAddr:", a3, v4, &self->_address);
LABEL_16:

    return;
  }
  if (-[NRBabelNeighbor dtlsReady](self, "dtlsReady"))
  {
    v7 = objc_alloc_init((Class)NSMutableData);
    if ((_DWORD)v4)
    {
      v4 = v4;
      p_iov_len = &a3->iov_len;
      do
      {
        objc_msgSend(v7, "appendBytes:length:", *(p_iov_len - 1), *p_iov_len);
        p_iov_len += 2;
        --v4;
      }
      while (v4);
    }
    v9 = (id *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor dtlsStack](self, "dtlsStack"));
    v13 = v7;
    if (v9)
    {
      if (qword_1001E4A08 != -1)
        dispatch_once(&qword_1001E4A08, &stru_1001B8570);
      if (_NRLogIsLevelEnabled(qword_1001E4A00, 1))
      {
        if (qword_1001E4A08 != -1)
          dispatch_once(&qword_1001E4A08, &stru_1001B8570);
        v10 = (id)qword_1001E4A00;
        _NRLogWithArgs(v10, 1, "%s%.30s:%-4d %@ writing %llu outbound unencrypted bytes into DTLS", ", "-[NRDDTLSStack processOutboundUnencryptedData:]", 108, v9, objc_msgSend(v13, "length"));

      }
      v11 = v9[4];
      v12 = objc_msgSend(v13, "_createDispatchData");
      completion[0] = _NSConcreteStackBlock;
      completion[1] = 3221225472;
      completion[2] = sub_100124E54;
      completion[3] = &unk_1001B8410;
      completion[4] = v9;
      nw_connection_send(v11, v12, _nw_content_context_default_message, 0, completion);

    }
    goto LABEL_16;
  }
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d %@ dropping bytes because DTLS not ready", ", "-[NRBabelNeighbor sendFullPacket:iovLen:]", 1780, self);
  }
}

- (void)sendTLVs:(id)a3
{
  unsigned int v3;
  id v5;
  unsigned int v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  id v21;
  unsigned int v22;
  unsigned int v23;
  __objc2_prot *v24;
  id v25;
  void *v26;
  NRBabelNeighbor *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  id v33;
  id v34;
  int IsLevelEnabled;
  id v36;
  char *v37;
  int *v38;
  uint64_t v39;
  id v40;
  int v41;
  id v42;
  int *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NRBabelNeighbor *v49;
  id v50;
  id v51;
  id v52;
  unsigned int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  int v62;
  _BYTE v63[128];
  _BYTE v64[128];

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
    goto LABEL_35;
  v6 = objc_msgSend(v5, "count");
  v7 = v6 + 1;
  if (v6 == -1)
  {
    v34 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v34, 16);

    if (IsLevelEnabled)
    {
      v36 = sub_1000B093C();
      _NRLogWithArgs(v36, 16, "%s%.30s:%-4d ABORTING: strict_calloc called with count 0", ", "strict_calloc", 96);

    }
    v24 = (__objc2_prot *)_os_log_pack_size(12);
    v37 = (char *)&v46 - ((__chkstk_darwin(v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    v38 = __error();
    v39 = _os_log_pack_fill(v37, v24, *v38, &_mh_execute_header, "%{public}s strict_calloc called with count 0");
    *(_DWORD *)v39 = 136446210;
    *(_QWORD *)(v39 + 4) = "strict_calloc";
LABEL_42:
    v45 = sub_1000B093C();
    _NRLogAbortWithPack(v45, v37);
LABEL_43:
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
LABEL_20:
    v7 = v47;
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (*(_QWORD *)&v24[25].cb != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "varying sizes of mystery", v46);
    }
    goto LABEL_25;
  }
  v8 = malloc_type_calloc(v6 + 1, 0x10uLL, 0xF1748037uLL);
  if (!v8)
  {
    v40 = sub_1000B093C();
    v41 = _NRLogIsLevelEnabled(v40, 16);

    if (v41)
    {
      v42 = sub_1000B093C();
      _NRLogWithArgs(v42, 16, "%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", ", "strict_calloc", 108, v7, 0x10uLL);

    }
    v24 = (__objc2_prot *)_os_log_pack_size(32);
    v37 = (char *)&v46 - ((__chkstk_darwin(v24) + 15) & 0xFFFFFFFFFFFFFFF0);
    v43 = __error();
    v44 = _os_log_pack_fill(v37, v24, *v43, &_mh_execute_header, "%{public}s strict_calloc(%zu, %zu) failed");
    *(_DWORD *)v44 = 136446722;
    *(_QWORD *)(v44 + 4) = "strict_calloc";
    *(_WORD *)(v44 + 12) = 2048;
    *(_QWORD *)(v44 + 14) = v7;
    *(_WORD *)(v44 + 22) = 2048;
    *(_QWORD *)(v44 + 24) = 16;
    goto LABEL_42;
  }
  v62 = 554;
  *v8 = &v62;
  v8[1] = 4;
  v49 = self;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
  v11 = objc_msgSend(v10, "mtu");

  v12 = objc_alloc_init((Class)NSMutableArray);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v50 = v5;
  v52 = v5;
  v13 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  v51 = v12;
  v48 = v9;
  if (v13)
  {
    v14 = v13;
    v3 = 0;
    v53 = v11 - 4;
    v15 = *(_QWORD *)v59;
    v16 = v9 + 1;
    v17 = 1;
    v47 = v7;
LABEL_6:
    v18 = 0;
    v46 = v17;
    if (v7 >= v17)
      v19 = (void *)(v7 - v17);
    else
      v19 = 0;
    v20 = &v16[2 * v17];
    while (1)
    {
      if (*(_QWORD *)v59 != v15)
        objc_enumerationMutation(v52);
      if (v19 == v18)
        break;
      v21 = *(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v18);
      v22 = objc_msgSend(v21, "length");
      v23 = v3 + v22;
      if ((unsigned __int16)(v3 + v22) > (unsigned __int16)v53)
      {
        objc_msgSend(v51, "addObject:", v21);
      }
      else
      {
        *(v20 - 1) = objc_msgSend(v21, "bytes");
        *v20 = objc_msgSend(v21, "length");
        v3 = v23;
      }
      v18 = (char *)v18 + 1;
      v20 += 2;
      if (v14 == v18)
      {
        v17 = v46 + (_DWORD)v18;
        v14 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
        v7 = v47;
        if (v14)
          goto LABEL_6;
        goto LABEL_25;
      }
    }
    v24 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
    if (qword_1001E4748 != -1)
      goto LABEL_43;
    goto LABEL_20;
  }
  v3 = 0;
LABEL_25:
  v25 = v52;

  HIWORD(v62) = bswap32(v3) >> 16;
  v26 = v48;
  v27 = v49;
  -[NRBabelNeighbor sendFullPacket:iovLen:](v49, "sendFullPacket:iovLen:", v48, v7);
  free(v26);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v28 = v25;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v31)
          objc_enumerationMutation(v28);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v30);
  }

  v33 = v51;
  if (objc_msgSend(v51, "count"))
    -[NRBabelNeighbor sendTLVs:](v27, "sendTLVs:", v33);

  v5 = v50;
LABEL_35:

}

- (void)handleIsReady:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d %@ DTLS %@ is ready", ", "-[NRBabelNeighbor handleIsReady:]", 1847, self, v6);
  }
  -[NRBabelNeighbor setDtlsReady:](self, "setDtlsReady:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instance"));
  objc_msgSend(v5, "sendImmediateRouteUpdateToNeighbor:", self);

}

- (void)handleDTLSStack:(id)a3 outboundEncryptedData:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[2];

  v6 = a3;
  v7 = a4;
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    v8 = (id)qword_1001E4740;
    _NRLogWithArgs(v8, 1, "%s%.30s:%-4d %@ passing %llu outbound encrypted bytes to interface", ", "-[NRBabelNeighbor handleDTLSStack:outboundEncryptedData:]", 1855, self, objc_msgSend(v7, "length"));

  }
  v10[0] = objc_msgSend(v7, "bytes");
  v10[1] = objc_msgSend(v7, "length");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
  objc_msgSend(v9, "sendPacket:iovLen:toAddr:", v10, 1, &self->_address);

}

- (void)handleDTLSStack:(id)a3 inboundDecryptedData:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    v6 = (id)qword_1001E4740;
    _NRLogWithArgs(v6, 1, "%s%.30s:%-4d %@ passing %llu inbound decrypted bytes to instance", ", "-[NRBabelNeighbor handleDTLSStack:inboundDecryptedData:]", 1867, self, objc_msgSend(v9, "length"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "instance"));
  objc_msgSend(v8, "handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), &self->_address, objc_msgSend(v5, "localAddress"), v5, 1);

}

- (in6_addr)address
{
  uint64_t v2;
  uint64_t v3;
  in6_addr result;

  v2 = *(_QWORD *)&self->_address.__u6_addr32[2];
  v3 = *(_QWORD *)self->_address.__u6_addr8;
  *(_QWORD *)&result.__u6_addr32[2] = v2;
  *(_QWORD *)result.__u6_addr8 = v3;
  return result;
}

- (void)setAddress:(in6_addr)a3
{
  self->_address = a3;
}

- (NRBabelInterface)babelInterface
{
  return self->_babelInterface;
}

- (void)setBabelInterface:(id)a3
{
  objc_storeStrong((id *)&self->_babelInterface, a3);
}

- (unsigned)outgoingPersonalHelloSeqno
{
  return self->_outgoingPersonalHelloSeqno;
}

- (void)setOutgoingPersonalHelloSeqno:(unsigned __int16)a3
{
  self->_outgoingPersonalHelloSeqno = a3;
}

- (unsigned)outgoingIHUInterval
{
  return self->_outgoingIHUInterval;
}

- (void)setOutgoingIHUInterval:(unsigned __int16)a3
{
  self->_outgoingIHUInterval = a3;
}

- (unsigned)outgoingUpdateInterval
{
  return self->_outgoingUpdateInterval;
}

- (void)setOutgoingUpdateInterval:(unsigned __int16)a3
{
  self->_outgoingUpdateInterval = a3;
}

- (unsigned)txcost
{
  return self->_txcost;
}

- (void)setTxcost:(unsigned __int16)a3
{
  self->_txcost = a3;
}

- (unsigned)rxcost
{
  return self->_rxcost;
}

- (void)setRxcost:(unsigned __int16)a3
{
  self->_rxcost = a3;
}

- (unint64_t)incomingPublicHelloHistory
{
  return self->_incomingPublicHelloHistory;
}

- (void)setIncomingPublicHelloHistory:(unint64_t)a3
{
  self->_incomingPublicHelloHistory = a3;
}

- (unsigned)lastIncomingPublicHelloSeqno
{
  return self->_lastIncomingPublicHelloSeqno;
}

- (void)setLastIncomingPublicHelloSeqno:(unsigned __int16)a3
{
  self->_lastIncomingPublicHelloSeqno = a3;
}

- (double)lastIncomingPublicHelloTime
{
  return self->_lastIncomingPublicHelloTime;
}

- (void)setLastIncomingPublicHelloTime:(double)a3
{
  self->_lastIncomingPublicHelloTime = a3;
}

- (unsigned)lastIncomingPublicHelloInterval
{
  return self->_lastIncomingPublicHelloInterval;
}

- (void)setLastIncomingPublicHelloInterval:(unsigned __int16)a3
{
  self->_lastIncomingPublicHelloInterval = a3;
}

- (OS_dispatch_source)incomingPublicHelloTimer
{
  return self->_incomingPublicHelloTimer;
}

- (void)setIncomingPublicHelloTimer:(id)a3
{
  objc_storeStrong((id *)&self->_incomingPublicHelloTimer, a3);
}

- (unint64_t)incomingPersonalHelloHistory
{
  return self->_incomingPersonalHelloHistory;
}

- (void)setIncomingPersonalHelloHistory:(unint64_t)a3
{
  self->_incomingPersonalHelloHistory = a3;
}

- (unsigned)lastIncomingPersonalHelloSeqno
{
  return self->_lastIncomingPersonalHelloSeqno;
}

- (void)setLastIncomingPersonalHelloSeqno:(unsigned __int16)a3
{
  self->_lastIncomingPersonalHelloSeqno = a3;
}

- (double)lastIncomingPersonalHelloTime
{
  return self->_lastIncomingPersonalHelloTime;
}

- (void)setLastIncomingPersonalHelloTime:(double)a3
{
  self->_lastIncomingPersonalHelloTime = a3;
}

- (unsigned)lastIncomingPersonalHelloInterval
{
  return self->_lastIncomingPersonalHelloInterval;
}

- (void)setLastIncomingPersonalHelloInterval:(unsigned __int16)a3
{
  self->_lastIncomingPersonalHelloInterval = a3;
}

- (OS_dispatch_source)incomingPersonalHelloTimer
{
  return self->_incomingPersonalHelloTimer;
}

- (void)setIncomingPersonalHelloTimer:(id)a3
{
  objc_storeStrong((id *)&self->_incomingPersonalHelloTimer, a3);
}

- (unsigned)lastIncomingIHUInterval
{
  return self->_lastIncomingIHUInterval;
}

- (void)setLastIncomingIHUInterval:(unsigned __int16)a3
{
  self->_lastIncomingIHUInterval = a3;
}

- (OS_dispatch_source)incomingIHUTimer
{
  return self->_incomingIHUTimer;
}

- (void)setIncomingIHUTimer:(id)a3
{
  objc_storeStrong((id *)&self->_incomingIHUTimer, a3);
}

- (OS_dispatch_source)pendingOutgoingTimer
{
  return self->_pendingOutgoingTimer;
}

- (void)setPendingOutgoingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pendingOutgoingTimer, a3);
}

- (NSMutableArray)pendingOutgoingPackets
{
  return self->_pendingOutgoingPackets;
}

- (void)setPendingOutgoingPackets:(id)a3
{
  objc_storeStrong((id *)&self->_pendingOutgoingPackets, a3);
}

- (BOOL)dtlsEnabled
{
  return self->_dtlsEnabled;
}

- (void)setDtlsEnabled:(BOOL)a3
{
  self->_dtlsEnabled = a3;
}

- (BOOL)dtlsReady
{
  return self->_dtlsReady;
}

- (void)setDtlsReady:(BOOL)a3
{
  self->_dtlsReady = a3;
}

- (NRDDTLSStack)dtlsStack
{
  return self->_dtlsStack;
}

- (void)setDtlsStack:(id)a3
{
  objc_storeStrong((id *)&self->_dtlsStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dtlsStack, 0);
  objc_storeStrong((id *)&self->_pendingOutgoingPackets, 0);
  objc_storeStrong((id *)&self->_pendingOutgoingTimer, 0);
  objc_storeStrong((id *)&self->_incomingIHUTimer, 0);
  objc_storeStrong((id *)&self->_incomingPersonalHelloTimer, 0);
  objc_storeStrong((id *)&self->_incomingPublicHelloTimer, 0);
  objc_storeStrong((id *)&self->_babelInterface, 0);
}

@end
