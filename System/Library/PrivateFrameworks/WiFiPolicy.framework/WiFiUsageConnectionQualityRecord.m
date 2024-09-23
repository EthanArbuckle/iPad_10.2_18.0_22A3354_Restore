@implementation WiFiUsageConnectionQualityRecord

- (WiFiUsageConnectionQualityRecord)initWithUsageSession:(id)a3 andNeighborBssList:(id)a4 andOtherBssList:(id)a5
{
  id v8;
  id v9;
  id v10;
  WiFiUsageConnectionQualityRecord *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *identifier;
  GEOWiFiConnectionQuality *v20;
  GEOWiFiConnectionQuality *geoMessage;
  GEOWiFiConnectionQuality *v22;
  void *v23;
  GEOWiFiConnectionQuality *v24;
  void *v25;
  GEOWiFiConnectionQuality *v26;
  void *v27;
  void *v28;
  void *v29;
  GEOWiFiConnectionQuality *v30;
  void *v31;
  GEOWiFiConnectionQuality *v32;
  void *v33;
  void *v34;
  GEOWiFiConnectionQuality *v35;
  void *v36;
  void *v37;
  GEOWiFiConnectionQuality *v38;
  void *v39;
  void *v40;
  GEOWiFiConnectionQuality *v41;
  void *v42;
  void *v43;
  GEOWiFiConnectionQuality *v44;
  void *v45;
  void *v46;
  GEOWiFiConnectionQuality *v47;
  void *v48;
  GEOWiFiConnectionQuality *v49;
  void *v50;
  void *v51;
  WiFiUsageConnectionQualityRecord *v52;
  void *v53;
  uint64_t v54;
  GEOWiFiConnectionQuality *v55;
  void *v56;
  double v57;
  void *v58;
  unint64_t v59;
  void *v60;
  int v61;
  uint64_t v62;
  double v63;
  GEOWiFiConnectionQuality *v64;
  uint64_t v65;
  WiFiUsageConnectionQualityRecord *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  _BOOL4 v72;
  void *v73;
  BOOL v74;
  GEOWiFiConnectionQuality *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id *v82;
  void *v83;
  void *v84;
  int v85;
  id v86;
  uint64_t v87;
  void *v88;
  int v89;
  id v90;
  uint64_t v91;
  void *v92;
  int v93;
  void *v94;
  int v95;
  void *v96;
  int v97;
  void *v98;
  int v99;
  void *v100;
  int v101;
  void *v102;
  int v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t i;
  void *v110;
  id v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  char v115;
  uint64_t v116;
  uint64_t j;
  void *v118;
  id v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t k;
  void *v131;
  id v132;
  void *v133;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  id *p_isa;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  objc_super v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_opt_class())
  {
    v66 = 0;
    goto LABEL_72;
  }
  v137 = v10;
  v139 = v9;
  v153.receiver = self;
  v153.super_class = (Class)WiFiUsageConnectionQualityRecord;
  v11 = -[WiFiUsageConnectionQualityRecord init](&v153, sel_init);
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "networkDetails");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "networkName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "networkDetails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "connectedBss");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bssid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), v14, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  identifier = v11->_identifier;
  v11->_identifier = (NSString *)v18;

  v20 = (GEOWiFiConnectionQuality *)objc_alloc_init(MEMORY[0x1E0D27720]);
  geoMessage = v11->_geoMessage;
  v11->_geoMessage = v20;

  -[GEOWiFiConnectionQuality setPacketsIn:](v11->_geoMessage, "setPacketsIn:", objc_msgSend(v8, "totalRxFrames"));
  -[GEOWiFiConnectionQuality setPacketsOut:](v11->_geoMessage, "setPacketsOut:", objc_msgSend(v8, "totalTxFrames"));
  v22 = v11->_geoMessage;
  +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", objc_msgSend(v8, "netInterfaceRxBytes"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setBytesInTotal:](v22, "setBytesInTotal:", objc_msgSend(v23, "unsignedLongLongValue"));

  v24 = v11->_geoMessage;
  +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", objc_msgSend(v8, "netInterfaceTxBytes"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setBytesOutTotal:](v24, "setBytesOutTotal:", objc_msgSend(v25, "unsignedLongLongValue"));

  -[GEOWiFiConnectionQuality setCca:](v11->_geoMessage, "setCca:", objc_msgSend(v8, "averageCca"));
  -[GEOWiFiConnectionQuality setRssi:](v11->_geoMessage, "setRssi:", objc_msgSend(v8, "lastRssi"));
  -[GEOWiFiConnectionQuality setSnr:](v11->_geoMessage, "setSnr:", objc_msgSend(v8, "averageSnr"));
  v26 = v11->_geoMessage;
  objc_msgSend(v8, "networkDetails");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "connectedBss");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bssid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setUniqueID:](v26, "setUniqueID:", v29);

  v30 = v11->_geoMessage;
  objc_msgSend(v8, "networkDetails");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setHotspot20:](v30, "setHotspot20:", objc_msgSend(v31, "isPasspoint"));

  v32 = v11->_geoMessage;
  objc_msgSend(v8, "networkDetails");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "connectedBss");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setBand:](v32, "setBand:", objc_msgSend(v34, "band"));

  v35 = v11->_geoMessage;
  objc_msgSend(v8, "networkDetails");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "connectedBss");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setChannel:](v35, "setChannel:", objc_msgSend(v37, "channel"));

  v38 = v11->_geoMessage;
  objc_msgSend(v8, "networkDetails");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "connectedBss");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setChannelWidth:](v38, "setChannelWidth:", objc_msgSend(v40, "channelWidth"));

  v41 = v11->_geoMessage;
  objc_msgSend(v8, "networkDetails");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "connectedBss");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setPhyMode:](v41, "setPhyMode:", objc_msgSend(v43, "phyMode"));

  v44 = v11->_geoMessage;
  objc_msgSend(v8, "networkDetails");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "connectedBss");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setIsEdgeBSS:](v44, "setIsEdgeBSS:", objc_msgSend(v46, "isEdgeBss"));

  v47 = v11->_geoMessage;
  objc_msgSend(v8, "responsivenessScore");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "doubleValue");
  -[GEOWiFiConnectionQuality setResponsivenessScore:](v47, "setResponsivenessScore:");

  v49 = v11->_geoMessage;
  objc_msgSend(v8, "networkDetails");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "connectedBss");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setNetworkType:](v49, "setNetworkType:", objc_msgSend(v51, "networkAccessCode") + 1);

  v52 = v11;
  objc_msgSend(v8, "networkDetails");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v50) = objc_msgSend(v53, "isAdhoc");

  if ((_DWORD)v50)
    v54 = 1;
  else
    v54 = 2;
  -[GEOWiFiConnectionQuality setApMode:](v11->_geoMessage, "setApMode:", v54);
  v55 = v11->_geoMessage;
  objc_msgSend(v8, "sessionStartTime");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "timeIntervalSinceReferenceDate");
  -[GEOWiFiConnectionQuality setTimeOfDay:](v55, "setTimeOfDay:", (unint64_t)v57);

  objc_msgSend(v8, "networkDetails");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "captiveStatus");

  if (v59 <= 2)
    -[GEOWiFiConnectionQuality setCaptiveDetermination:](v11->_geoMessage, "setCaptiveDetermination:", v59);
  objc_msgSend(v8, "networkDetails");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "isAutoJoined");

  if (v61)
    v62 = 1;
  else
    v62 = 2;
  -[GEOWiFiConnectionQuality setAssociationReason:](v11->_geoMessage, "setAssociationReason:", v62);
  -[GEOWiFiConnectionQuality setDisassociationReason:](v11->_geoMessage, "setDisassociationReason:", WiFiUsageConnectionQualityRecordConvertDisconnectReasonToGEOReason(objc_msgSend(v8, "lastDisconnectReason")));
  objc_msgSend(v8, "sessionDuration");
  if (v63 >= 60.0)
  {
    objc_msgSend(v8, "sessionDuration");
    if (v67 >= 300.0)
    {
      objc_msgSend(v8, "sessionDuration");
      if (v68 >= 1200.0)
      {
        objc_msgSend(v8, "sessionDuration");
        if (v69 >= 3600.0)
        {
          objc_msgSend(v8, "sessionDuration");
          v64 = v11->_geoMessage;
          if (v70 >= 3600.0)
            v65 = 5;
          else
            v65 = 0;
        }
        else
        {
          v64 = v11->_geoMessage;
          v65 = 4;
        }
      }
      else
      {
        v64 = v11->_geoMessage;
        v65 = 3;
      }
    }
    else
    {
      v64 = v11->_geoMessage;
      v65 = 2;
    }
  }
  else
  {
    v64 = v11->_geoMessage;
    v65 = 1;
  }
  -[GEOWiFiConnectionQuality setAssociationLength:](v64, "setAssociationLength:", v65);
  objc_msgSend(v8, "networkDetails");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  p_isa = (id *)&v11->super.isa;
  if ((objc_msgSend(v71, "isPublic") & 1) == 0)
  {
    objc_msgSend(v8, "networkDetails");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v73, "isCarrierBased"))
    {
LABEL_28:

      goto LABEL_29;
    }
    v74 = +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:](WiFiUsagePrivacyFilter, "canPerformActionWithSampleRate:", 1);

    if (!v74)
      goto LABEL_29;
LABEL_27:
    v75 = v11->_geoMessage;
    objc_msgSend(v8, "networkDetails");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "networkName");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOWiFiConnectionQuality setIdentifier:](v75, "setIdentifier:", v73);
    goto LABEL_28;
  }
  v72 = +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:](WiFiUsagePrivacyFilter, "canPerformActionWithSampleRate:", 1);

  if (v72)
    goto LABEL_27;
LABEL_29:
  v76 = objc_alloc_init(MEMORY[0x1E0D27138]);
  objc_msgSend(v8, "networkDetails");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "connectedBss");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "locationLatitude");
  objc_msgSend(v76, "setLat:");

  objc_msgSend(v8, "networkDetails");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "connectedBss");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "locationLongitude");
  objc_msgSend(v76, "setLng:");

  v81 = objc_alloc_init(MEMORY[0x1E0D27160]);
  v136 = v76;
  objc_msgSend(v81, "setLatLng:", v76);
  v82 = (id *)&v52->super.isa;
  v135 = v81;
  -[GEOWiFiConnectionQuality setLocation:](v52->_geoMessage, "setLocation:", v81);
  objc_msgSend(v8, "networkDetails");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v83, "addedFromUI"))
  {

LABEL_32:
    v86 = p_isa[1];
    v87 = 1;
    goto LABEL_33;
  }
  objc_msgSend(v8, "networkDetails");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "addedViaATJ");

  if (v85)
    goto LABEL_32;
  objc_msgSend(v8, "networkDetails");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "addedFromApp");

  if (v95)
  {
    v86 = p_isa[1];
    v87 = 2;
  }
  else
  {
    objc_msgSend(v8, "networkDetails");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v98, "isCarrierBased");

    v86 = p_isa[1];
    if (v99)
      v87 = 3;
    else
      v87 = 0;
  }
LABEL_33:
  objc_msgSend(v86, "setNetworkOrigin:", v87);
  objc_msgSend(v8, "networkDetails");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "isOpen");

  if (v89)
  {
    v90 = p_isa[1];
    v91 = 1;
  }
  else
  {
    objc_msgSend(v8, "networkDetails");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "hasEnterpriseSecurity");

    if (v93)
    {
      v90 = p_isa[1];
      v91 = 4;
    }
    else
    {
      objc_msgSend(v8, "networkDetails");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v96, "hasWep");

      v90 = p_isa[1];
      if (v97)
        v91 = 2;
      else
        v91 = 3;
    }
  }
  objc_msgSend(v90, "addAuthTraits:", v91);
  objc_msgSend(v8, "networkDetails");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "isMoving");

  if (v101)
    objc_msgSend(p_isa[1], "addTraits:", 1);
  objc_msgSend(v8, "networkDetails");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v102, "isWidelyDeployed");

  if (v103)
    objc_msgSend(p_isa[1], "addTraits:", 2);
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  objc_msgSend(v8, "networkDetails");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "downloadSpeedResults");
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v149, v156, 16);
  if (v106)
  {
    v107 = v106;
    v108 = *(_QWORD *)v150;
    do
    {
      for (i = 0; i != v107; ++i)
      {
        if (*(_QWORD *)v150 != v108)
          objc_enumerationMutation(v105);
        v110 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
        v111 = objc_alloc_init(MEMORY[0x1E0D27730]);
        objc_msgSend(v110, "floatValue");
        objc_msgSend(v111, "setAvgDL:");
        objc_msgSend(p_isa[1], "addSpeedTest:", v111);

      }
      v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v149, v156, 16);
    }
    while (v107);
  }
  v138 = v8;

  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v112 = v139;
  v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v145, v155, 16);
  if (v113)
  {
    v114 = v113;
    v115 = 0;
    v116 = *(_QWORD *)v146;
    do
    {
      for (j = 0; j != v114; ++j)
      {
        if (*(_QWORD *)v146 != v116)
          objc_enumerationMutation(v112);
        v118 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * j);
        v119 = objc_alloc_init(MEMORY[0x1E0D27710]);
        objc_msgSend(v119, "setRssi:", objc_msgSend(v118, "rssi"));
        objc_msgSend(v119, "setChannel:", objc_msgSend(v118, "channel"));
        objc_msgSend(v118, "bssid");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "setUniqueID:", v120);

        objc_msgSend(v82[1], "addEssMembers:", v119);
        if ((v115 & 1) == 0)
        {
          v121 = objc_msgSend(v118, "networkAccessCode");
          v122 = objc_msgSend(v118, "venueGroup");
          v123 = objc_msgSend(v118, "venueCode");
          v124 = objc_alloc_init(MEMORY[0x1E0D27740]);
          objc_msgSend(v124, "setVenueName:", &stru_1E881F240);
          objc_msgSend(v124, "setNetworkType:", v121);
          objc_msgSend(v124, "setVenueType:", v123);
          v125 = v122;
          v82 = p_isa;
          objc_msgSend(v124, "setVenueGroup:", v125);
          objc_msgSend(p_isa[1], "setPasspointInfo:", v124);

        }
        v115 = 1;
      }
      v114 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v145, v155, 16);
    }
    while (v114);
  }

  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v10 = v137;
  v126 = v137;
  v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v141, v154, 16);
  v8 = v138;
  if (v127)
  {
    v128 = v127;
    v129 = *(_QWORD *)v142;
    do
    {
      for (k = 0; k != v128; ++k)
      {
        if (*(_QWORD *)v142 != v129)
          objc_enumerationMutation(v126);
        v131 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * k);
        v132 = objc_alloc_init(MEMORY[0x1E0D27710]);
        objc_msgSend(v132, "setRssi:", objc_msgSend(v131, "rssi"));
        objc_msgSend(v132, "setChannel:", objc_msgSend(v131, "channel"));
        objc_msgSend(v131, "bssid");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "setUniqueID:", v133);

        objc_msgSend(p_isa[1], "addNearbyBSS:", v132);
      }
      v128 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v141, v154, 16);
    }
    while (v128);
  }

  self = p_isa;
  v66 = self;
  v9 = v139;
LABEL_72:

  return v66;
}

- (void)queryNetworkPerformanceFeedAndSubmitToGeoWiFi
{
  NSObject *v3;
  _QWORD block[6];
  _QWORD v5[5];
  id v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__3;
  v5[4] = __Block_byref_object_dispose__3;
  v6 = 0;
  if (self->_identifier)
  {
    dispatch_get_global_queue(-2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__WiFiUsageConnectionQualityRecord_queryNetworkPerformanceFeedAndSubmitToGeoWiFi__block_invoke;
    block[3] = &unk_1E881D700;
    block[4] = self;
    block[5] = v5;
    dispatch_async(v3, block);

  }
  else
  {
    NSLog(CFSTR("%s: null identifier."), a2, "-[WiFiUsageConnectionQualityRecord queryNetworkPerformanceFeedAndSubmitToGeoWiFi]");
  }
  _Block_object_dispose(v5, 8);

}

void __81__WiFiUsageConnectionQualityRecord_queryNetworkPerformanceFeedAndSubmitToGeoWiFi__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  __int128 v8;

  v2 = (void *)MEMORY[0x1D17AC818]();
  v3 = objc_alloc(MEMORY[0x1E0DB02A8]);
  v4 = (void *)objc_msgSend(v3, "initWorkspaceWithService:", *MEMORY[0x1E0DB0520]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0690]), "initWithWorkspace:", v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *MEMORY[0x1E0DB0610], 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__WiFiUsageConnectionQualityRecord_queryNetworkPerformanceFeedAndSubmitToGeoWiFi__block_invoke_2;
    v7[3] = &unk_1E881D6D8;
    v8 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v5, "fullScorecardFor:options:reply:", 1, v6, v7);

  }
  objc_autoreleasePoolPop(v2);
}

void __81__WiFiUsageConnectionQualityRecord_queryNetworkPerformanceFeedAndSubmitToGeoWiFi__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  objc_msgSend(a2, "objectForKey:", CFSTR("historical"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v33 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  NSLog(CFSTR("%s: %@"), "-[WiFiUsageConnectionQualityRecord queryNetworkPerformanceFeedAndSubmitToGeoWiFi]_block_invoke_2", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("overallStay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOverAllStay:", objc_msgSend(v8, "unsignedLongLongValue"));

  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("lowLqmStay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLowLQMStay:", objc_msgSend(v10, "unsignedLongLongValue"));

  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("faultyStay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFaultyStay:", objc_msgSend(v12, "unsignedLongLongValue"));

  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("dataStalls"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDataStalls:", objc_msgSend(v14, "unsignedLongLongValue"));

  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("rttMin"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  objc_msgSend(v15, "setRoundTripTimeMin:");

  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("rttAvg"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  objc_msgSend(v17, "setRoundTripTimeAvg:");

  v19 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("rttVar"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  objc_msgSend(v19, "setRoundTripTimeVar:");

  v21 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("connSuccesses"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSuccessfulConnections:", objc_msgSend(v22, "unsignedLongLongValue"));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("connAttempts"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "unsignedLongLongValue");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("connSuccesses"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24 - objc_msgSend(v25, "unsignedLongLongValue");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setFailedConnections:", v26);
  v27 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("connAttempts"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSslConnectionCount:", objc_msgSend(v28, "unsignedIntValue"));

  v29 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("certErrors"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSslErrorCount:", objc_msgSend(v30, "unsignedIntValue"));

  v31 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("isKnownGood"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setIsKnownGood:", objc_msgSend(v32, "BOOLValue"));

  objc_msgSend(MEMORY[0x1E0D27728], "reportWiFiConnectionQuality:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  NSLog(CFSTR("%s: submitted GeoServices message for WiFiConnectionQuality."), "-[WiFiUsageConnectionQualityRecord queryNetworkPerformanceFeedAndSubmitToGeoWiFi]_block_invoke_2");

}

- (GEOWiFiConnectionQuality)geoMessage
{
  return self->_geoMessage;
}

- (void)setGeoMessage:(id)a3
{
  objc_storeStrong((id *)&self->_geoMessage, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_geoMessage, 0);
}

@end
