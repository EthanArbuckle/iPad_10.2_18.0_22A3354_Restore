@implementation WiFiUsageParsedBeacon

- (BOOL)parseBeaconIE:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  char *v6;
  unint64_t v7;
  WiFiUsageParsedBeacon *v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unsigned __int8 v33;
  void *v34;
  WiFiUsageParsedBeacon *v35;
  NSMutableDictionary *extendedIEList;
  void *v37;
  void *v38;
  void *v39;
  NSMutableDictionary *taggedIEList;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  NSMutableDictionary *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSMutableDictionary *v52;
  uint64_t v53;
  void *v54;
  NSMutableDictionary *v55;
  void *v56;
  NSMutableDictionary *v57;
  void *v58;
  NSMutableDictionary *vendorIEList;
  void *v60;
  NSMutableDictionary *v61;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;

  if (a4 < 3)
    return 1;
  v6 = a5;
  v7 = a4;
  v9 = self;
  v10 = 0x1E0CB3000uLL;
  v11 = 0x1E881B000uLL;
  while (1)
  {
    if (a3 + 1 > v6)
    {
      NSLog(CFSTR("%s: reached end of buffer before parsing IE type (length:%lu IE content:(%p + %lu = %p) > %p)"), a2, "-[WiFiUsageParsedBeacon parseBeaconIE:length:endOfBuffer:]", v7, a3, 1, a3 + 1, v6);
      return 0;
    }
    v12 = a3 + 2;
    v13 = *a3;
    if (a3 + 2 > v6)
    {
      NSLog(CFSTR("%s: reached end of buffer while parsing IE %u before parsing length ((%p + %lu = %p) > %p)"), a2, "-[WiFiUsageParsedBeacon parseBeaconIE:length:endOfBuffer:]", v13, a3 + 1, 1, a3 + 2, v6);
      return 0;
    }
    v14 = a3[1];
    if (&v12[v14] > v6)
    {
      NSLog(CFSTR("%s: reached end of buffer while parsing IE %u before parsing IE content (length:%hhu IE content:(%p + %u = %p) > %p)"), a2, "-[WiFiUsageParsedBeacon parseBeaconIE:length:endOfBuffer:]", v13, v14, a3 + 2, v14, &v12[v14], v6);
      return 0;
    }
    v69 = MEMORY[0x1D17AC818]();
    v15 = *(void **)(v10 + 2368);
    objc_msgSend(*(id *)(v11 + 2672), "prefixForCA");
    v16 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@%u"), v17, v13);
    v18 = objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v13 != 255)
      break;
    v68 = (void *)v18;
    v31 = a3[2];
    v32 = v10;
    v33 = v14 - 1;
    +[WiFiUsageParsedBeacon isValidIE:ofLen:withIsExtended:](WiFiUsageParsedBeacon, "isValidIE:ofLen:withIsExtended:", v31, (v14 - 1), 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v9;
    extendedIEList = v9->_extendedIEList;
    v37 = *(void **)(v32 + 2368);
    objc_msgSend(*(id *)(v16 + 2672), "prefixForCA");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("%@255_%d_isValid"), v38, v31);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](extendedIEList, "setValue:forKey:", v34, v39);

    v70 = v34;
    if (v34 && (objc_msgSend(v34, "BOOLValue") & 1) == 0)
    {
      taggedIEList = v35->_taggedIEList;
      v41 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(v16 + 2672), "prefixForCA");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", CFSTR("%@255_%u_isValid"), v42, v31);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](taggedIEList, "objectForKeyedSubscript:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0x1E881B000uLL;
      NSLog(CFSTR("%s: Element %u is invalid:%@"), "-[WiFiUsageParsedBeacon parseBeaconIE:length:endOfBuffer:]", v31, v44);

    }
    v14 = v33;
    v6 = a5;
    if (!-[WiFiUsageParsedBeacon parseExtendedIE:from:length:endOfBuffer:](v35, "parseExtendedIE:from:length:endOfBuffer:", v31, a3 + 3, v33))
    {
      v22 = v68;
      v62 = (void *)v69;
      goto LABEL_34;
    }
    v45 = v7 - 3;
    v46 = self->_extendedIEList;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3 + 3, v14);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(v16 + 2672), "prefixForCA");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v48;
    v24 = v45;
    objc_msgSend(v50, "stringWithFormat:", CFSTR("%@255_%d"), v49, v31);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v46;
    v9 = self;
    -[NSMutableDictionary setValue:forKey:](v52, "setValue:forKey:", v47, v51);

    v11 = 0x1E881B000;
    v53 = 3;
    v22 = v68;
    v54 = (void *)v69;
LABEL_26:

    objc_autoreleasePoolPop(v54);
    a3 += v53 + v14;
    v7 = v24 - v14;
    v10 = 0x1E0CB3000;
    if (v7 <= 2)
      return 1;
  }
  +[WiFiUsageParsedBeacon isValidIE:ofLen:withIsExtended:](WiFiUsageParsedBeacon, "isValidIE:ofLen:withIsExtended:", v13, v14, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v9->_taggedIEList;
  objc_msgSend(*(id *)(v10 + 2368), "stringWithFormat:", CFSTR("%@_isValid"), v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](v20, "setValue:forKey:", v19, v21);

  v22 = (void *)v18;
  if (v19 && (objc_msgSend(v19, "BOOLValue") & 1) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_taggedIEList, "objectForKeyedSubscript:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Element %u is invalid:%@"), "-[WiFiUsageParsedBeacon parseBeaconIE:length:endOfBuffer:]", v13, v23);

  }
  v70 = v19;
  v24 = v7 - 2;
  v11 = 0x1E881B000uLL;
  if ((_DWORD)v13 == 221)
  {
    v65 = v24;
    v67 = (void *)v18;
    __memcpy_chk();
    v25 = (void *)MEMORY[0x1E0CB3940];
    +[WiFiUsageAccessPointProfile prefixForCA](WiFiUsageAccessPointProfile, "prefixForCA");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v14 < 4)
    {
      objc_msgSend(v25, "stringWithFormat:", CFSTR("%@%02X:%02X:%02X%@%@"), v26, 0, 0, 0, &stru_1E881F240, &stru_1E881F240);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0x1E881B000;
      v22 = v67;
      v54 = (void *)v69;
      v6 = a5;
    }
    else
    {
      v63 = v25;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%d"), 0);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v64 = (void *)v28;
      if ((_DWORD)v14 == 4)
      {
        objc_msgSend(v63, "stringWithFormat:", CFSTR("%@%02X:%02X:%02X%@%@"), v27, 0, 0, 0, v28, &stru_1E881F240);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%d"), 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "stringWithFormat:", CFSTR("%@%02X:%02X:%02X%@%@"), v27, 0, 0, 0, v29, v58);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v11 = 0x1E881B000;
      v22 = v67;
      v54 = (void *)v69;
      v6 = a5;

    }
    vendorIEList = self->_vendorIEList;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3 + 2, v14);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = vendorIEList;
    v9 = self;
    -[NSMutableDictionary setValue:forKey:](v61, "setValue:forKey:", v60, v30);

    v53 = 2;
    v24 = v65;
    goto LABEL_26;
  }
  v6 = a5;
  if (-[WiFiUsageParsedBeacon parseNormalIE:from:length:endOfBuffer:](self, "parseNormalIE:from:length:endOfBuffer:", v13, a3 + 2, v14, a5))
  {
    v55 = self->_taggedIEList;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3 + 2, v14);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v55;
    v9 = self;
    -[NSMutableDictionary setValue:forKey:](v57, "setValue:forKey:", v56, v22);

    v53 = 2;
    v54 = (void *)v69;
    goto LABEL_26;
  }
  v62 = (void *)v69;
LABEL_34:

  objc_autoreleasePoolPop(v62);
  return 0;
}

- (WiFiUsageParsedBeacon)initWithBeaconData:(id)a3 andAdditionalMetadata:(id)a4
{
  id v6;
  id v7;
  WiFiUsageParsedBeacon *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WiFiUsageParsedBeacon;
  v8 = -[WiFiUsageParsedBeacon init](&v23, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "length");
    v10 = objc_retainAutorelease(v6);
    v11 = objc_msgSend(v10, "bytes");
    if (v9 >= 0x25)
    {
      v12 = *(unsigned __int16 *)(v11 + 32);
      v13 = *(unsigned __int16 *)(v11 + 34);
      v14 = v11 + 36;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%x:%02x:%02x:%02x:%02x:%02x"), *(unsigned __int8 *)(v11 + 16), *(unsigned __int8 *)(v11 + 17), *(unsigned __int8 *)(v11 + 18), *(unsigned __int8 *)(v11 + 19), *(unsigned __int8 *)(v11 + 20), *(unsigned __int8 *)(v11 + 21));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageParsedBeacon setBssid:](v8, "setBssid:", v15);

      -[WiFiUsageParsedBeacon setBeaconInterval:](v8, "setBeaconInterval:", v12);
      -[WiFiUsageParsedBeacon setCapabilities:](v8, "setCapabilities:", v13);
      -[WiFiUsageParsedBeacon setChannel:](v8, "setChannel:", 0);
      -[WiFiUsageParsedBeacon setBand:](v8, "setBand:", 0);
      -[WiFiUsageParsedBeacon setHasHT:](v8, "setHasHT:", 0);
      -[WiFiUsageParsedBeacon setHasVHT:](v8, "setHasVHT:", 0);
      -[WiFiUsageParsedBeacon setHasHE:](v8, "setHasHE:", 0);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageParsedBeacon setTaggedIEList:](v8, "setTaggedIEList:", v16);

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageParsedBeacon setVendorIEList:](v8, "setVendorIEList:", v17);

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageParsedBeacon setExtendedIEList:](v8, "setExtendedIEList:", v18);

      -[WiFiUsageParsedBeacon setParsingSuccessful:](v8, "setParsingSuccessful:", 1);
      -[WiFiUsageParsedBeacon setColocated6Ghz:](v8, "setColocated6Ghz:", 0);
      -[WiFiUsageParsedBeacon setColocated6GhzIsPSC:](v8, "setColocated6GhzIsPSC:", 0);
      -[WiFiUsageParsedBeacon setApName:](v8, "setApName:", 0);
      objc_msgSend(v7, "objectForKey:", CFSTR("IS_BEACON_AT_HE_RATE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageParsedBeacon setIsBeaconAtHeRate:](v8, "setIsBeaconAtHeRate:", v19);

      v20 = objc_retainAutorelease(v10);
      -[WiFiUsageParsedBeacon setParsingSuccessful:](v8, "setParsingSuccessful:", -[WiFiUsageParsedBeacon parseBeaconIE:length:endOfBuffer:](v8, "parseBeaconIE:length:endOfBuffer:", v14, v9 - 36, objc_msgSend(v20, "bytes") + objc_msgSend(v20, "length")));
      if (!v8->_band && v8->_channel)
      {
        if (v8->_channel <= 0x13u)
          v21 = 2;
        else
          v21 = 5;
        -[WiFiUsageParsedBeacon setBand:](v8, "setBand:", v21);
      }
    }
    else
    {
      NSLog(CFSTR("%s: invalid beacon length = %d"), "-[WiFiUsageParsedBeacon initWithBeaconData:andAdditionalMetadata:]", v9);

      v8 = 0;
    }
  }

  return v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
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
  void *v24;
  void *v25;
  NSString *apName;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t m;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t n;
  void *v72;
  void *v73;
  void *v74;
  void *v76;
  void *v77;
  WiFiUsageParsedBeacon *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter reformatMACAddress:](WiFiUsagePrivacyFilter, "reformatMACAddress:", self->_bssid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("bssid"));

  +[WiFiUsagePrivacyFilter sanitizedOUI:](WiFiUsagePrivacyFilter, "sanitizedOUI:", self->_bssid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("oui"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("oui"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bssid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringToIndex:", 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("oui_was_sanitized"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)self->_beaconInterval);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("BeaconInterval"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)self->_capabilities);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("Capabilities"));

  if (self->_band)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("Band"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasHT);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isHT"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasVHT);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isVHT"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasHE);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isHE"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasEHT);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isEHT"));

  if (self->_hasHT)
  {
    if (self->_htRxNSS)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("HtRxNSS"));

    }
    if (self->_htTxNSS)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("HtTxNSS"));

    }
  }
  if (self->_hasVHT)
  {
    if (self->_vhtRxNSS)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("VhtRxNSS"));

    }
    if (self->_vhtTxNSS)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("VhtTxNSS"));

    }
  }
  if (self->_hasHE)
  {
    if (self->_heRxNSS)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("HeRxNSS"));

    }
    if (self->_heTxNSS)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("HeTxNSS"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_colocated6Ghz);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("hasColocated6Ghz"));

  if (self->_colocated6Ghz)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_colocated6GhzIsPSC);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("colocated6GhzIsPSC"));

  }
  apName = self->_apName;
  if (apName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", apName, CFSTR("apName"));
  v27 = (void *)objc_opt_new();
  v28 = v27;
  if (self->_hasColocatedMLD6G)
    objc_msgSend(v27, "addObject:", CFSTR("6G"));
  if (self->_hasColocatedMLD5G)
    objc_msgSend(v28, "addObject:", CFSTR("5G"));
  if (self->_hasColocatedMLD2G)
    objc_msgSend(v28, "addObject:", CFSTR("2G"));
  v76 = v28;
  objc_msgSend(v28, "componentsJoinedByString:", CFSTR(","));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("hasColocatedMLOs"));

  objc_msgSend(v3, "addEntriesFromDictionary:", self->_taggedIEList);
  objc_msgSend(v3, "addEntriesFromDictionary:", self->_vendorIEList);
  v77 = v3;
  objc_msgSend(v3, "addEntriesFromDictionary:", self->_extendedIEList);
  v30 = (void *)objc_opt_new();
  v31 = (void *)objc_opt_new();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v78 = self;
  -[NSMutableDictionary allKeys](self->_taggedIEList, "allKeys");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (SELF ENDSWITH \"_isValid\")"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "filteredArrayUsingPredicate:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v96 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
        v40 = (void *)MEMORY[0x1E0CB37E8];
        +[WiFiUsageAccessPointProfile prefixForCA](WiFiUsageAccessPointProfile, "prefixForCA");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "substringFromIndex:", objc_msgSend(v41, "length"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "numberWithInteger:", objc_msgSend(v42, "integerValue"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v43);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
    }
    while (v36);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  objc_msgSend(v31, "sortedArrayUsingSelector:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v92;
    do
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v92 != v47)
          objc_enumerationMutation(v44);
        objc_msgSend(v30, "appendFormat:", CFSTR("%@|"), *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j));
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
    }
    while (v46);
  }

  objc_msgSend(v31, "removeAllObjects");
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  -[NSMutableDictionary allKeys](v78->_extendedIEList, "allKeys");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (SELF ENDSWITH \"_isValid\")"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "filteredArrayUsingPredicate:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v88;
    do
    {
      for (k = 0; k != v53; ++k)
      {
        if (*(_QWORD *)v88 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * k);
        v57 = (void *)MEMORY[0x1E0CB37E8];
        +[WiFiUsageAccessPointProfile prefixForCA](WiFiUsageAccessPointProfile, "prefixForCA");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "substringFromIndex:", objc_msgSend(v58, "length") + 4);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "numberWithInteger:", objc_msgSend(v59, "integerValue"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v60);

      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
    }
    while (v53);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend(v31, "sortedArrayUsingSelector:", sel_compare_);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v84;
    do
    {
      for (m = 0; m != v63; ++m)
      {
        if (*(_QWORD *)v84 != v64)
          objc_enumerationMutation(v61);
        objc_msgSend(v30, "appendFormat:", CFSTR("255_%@|"), *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * m));
      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
    }
    while (v63);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[NSMutableDictionary allKeys](v78->_vendorIEList, "allKeys");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "sortedArrayUsingSelector:", sel_compare_);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v80;
    do
    {
      for (n = 0; n != v69; ++n)
      {
        if (*(_QWORD *)v80 != v70)
          objc_enumerationMutation(v67);
        v72 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * n);
        +[WiFiUsageAccessPointProfile prefixForCA](WiFiUsageAccessPointProfile, "prefixForCA");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "substringFromIndex:", objc_msgSend(v73, "length"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "appendFormat:", CFSTR("%@|"), v74);

      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
    }
    while (v69);
  }

  objc_msgSend(v77, "setObject:forKeyedSubscript:", v30, CFSTR("IEs_in_frame"));
  objc_msgSend(v77, "setValue:forKey:", 0, CFSTR("BeaconInformationElement_221_isValid"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", v78->_isBeaconAtHeRate, CFSTR("isBeaconAtHeRate"));

  return v77;
}

- (id)description
{
  id v2;
  void *v3;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  WiFiUsageParsedBeacon *v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSMutableDictionary *taggedIEList;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  const __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  WiFiUsageParsedBeacon *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t k;
  uint64_t v36;
  void *v37;
  NSMutableDictionary *v38;
  void *v39;
  void *v40;
  NSMutableDictionary *v41;
  const __CFString *v42;
  id v43;
  void *v44;
  id obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  WiFiUsageParsedBeacon *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37A0];
  if (self->_parsingSuccessful)
    v6 = CFSTR("successful");
  else
    v6 = CFSTR("FAILED");
  +[WiFiUsagePrivacyFilter sanitizedOUI:](WiFiUsagePrivacyFilter, "sanitizedOUI:", self->_bssid);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Beacon parsing %@.\noui: %@\nBeaconInterval:%d\nCapabilities:0x%02X\nBand:%u\tChannel:%u"), v6, v7, self->_beaconInterval, self->_capabilities, self->_band, self->_channel);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_colocated6Ghz)
  {
    if (self->_colocated6GhzIsPSC)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    objc_msgSend(v8, "appendFormat:", CFSTR("hasColocated6Ghz: YES onPSCchan:%@"), v9);
  }
  if (self->_apName)
    objc_msgSend(v8, "appendFormat:", CFSTR("\napName:%@"), self->_apName);
  if (self->_hasHT)
  {
    if (self->_htInfo)
      objc_msgSend(v8, "appendFormat:", CFSTR("\nHtInfo:0x%02X"), self->_htInfo);
    if (self->_htAMPDUParams)
      objc_msgSend(v8, "appendFormat:", CFSTR(" HtAMPDUParams:0x%02X"), self->_htAMPDUParams);
    if (self->_htExtendedCapabilities)
      objc_msgSend(v8, "appendFormat:", CFSTR(" HtExtendedCapabilities:0x%02X"), self->_htExtendedCapabilities);
    if (self->_htTxBFCapabilities)
      objc_msgSend(v8, "appendFormat:", CFSTR(" HtTxBFCapabilities:0x%02X"), self->_htTxBFCapabilities);
    if (self->_htAntennaSelection)
      objc_msgSend(v8, "appendFormat:", CFSTR(" HtAntennaSelection:0x%02X"), self->_htAntennaSelection);
    if (self->_htRxNSS)
      objc_msgSend(v8, "appendFormat:", CFSTR(" HtRxNSS:%d"), self->_htRxNSS);
    if (self->_htTxNSS)
      objc_msgSend(v8, "appendFormat:", CFSTR(" HtTxNSS:%d"), self->_htTxNSS);
  }
  if (self->_hasVHT)
  {
    if (self->_vhtInfo)
      objc_msgSend(v8, "appendFormat:", CFSTR("\nVhtInfo:0x%02X"), self->_vhtInfo);
    if (self->_vhtRxMCSMap)
      objc_msgSend(v8, "appendFormat:", CFSTR(" VhtRxMCSMap:0x%02X"), self->_vhtRxMCSMap);
    if (self->_vhtRxMaxRate)
      objc_msgSend(v8, "appendFormat:", CFSTR(" VhtRxMaxRate:0x%02X"), self->_vhtRxMaxRate);
    if (self->_vhtTxMCSMap)
      objc_msgSend(v8, "appendFormat:", CFSTR(" VhtTxMCSMap:0x%02X"), self->_vhtTxMCSMap);
    if (self->_vhtTxMaxRate)
      objc_msgSend(v8, "appendFormat:", CFSTR(" VhtTxMaxRate:0x%02X"), self->_vhtTxMaxRate);
    if (self->_vhtRxNSS)
      objc_msgSend(v8, "appendFormat:", CFSTR(" VhtRxNSS:%d"), self->_vhtRxNSS);
    if (self->_vhtTxNSS)
      objc_msgSend(v8, "appendFormat:", CFSTR(" VhtTxNSS:%d"), self->_vhtTxNSS);
  }
  if (self->_hasHE)
  {
    if (self->_heMACInfo)
      objc_msgSend(v8, "appendFormat:", CFSTR("\nHE MAC Info:%@"), self->_heMACInfo);
    if (self->_hePHYInfo)
      objc_msgSend(v8, "appendFormat:", CFSTR(" HE PHY Info:%@"), self->_hePHYInfo);
    if (self->_heRxNSS)
      objc_msgSend(v8, "appendFormat:", CFSTR(" HeRxNSS:%d"), self->_heRxNSS);
    if (self->_heTxNSS)
      objc_msgSend(v8, "appendFormat:", CFSTR(" HeTxNSS:%d"), self->_heTxNSS);
  }
  v51 = v8;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[NSMutableDictionary allKeys](self->_taggedIEList, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (SELF ENDSWITH \"_isValid\")"));
  v52 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v52;
  obj = v12;
  v49 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v49)
  {
    v47 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v62 != v47)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v13->_taggedIEList, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        taggedIEList = v13->_taggedIEList;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_isValid"), v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](taggedIEList, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19
          || (v20 = v13->_taggedIEList,
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_isValid"), v15),
              v2 = (id)objc_claimAutoreleasedReturnValue(),
              -[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v2),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              v21 = CFSTR(" (invalid!) :"),
              objc_msgSend(v3, "BOOLValue")))
        {
          v21 = &stru_1E881F240;
        }
        v22 = objc_retainAutorelease(v16);
        +[WiFiUsagePrivacyFilter toHEXString:length:](WiFiUsagePrivacyFilter, "toHEXString:length:", objc_msgSend(v22, "bytes"), objc_msgSend(v22, "length"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "appendFormat:", CFSTR("\n\"%@\"%@:(%@)"), v15, v21, v23);

        if (v19)
        {

        }
        v13 = v52;
      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v49);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[NSMutableDictionary allKeys](v13->_vendorIEList, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v58 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](v52->_vendorIEList, "objectForKeyedSubscript:", v29);
        v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v3 = (void *)objc_msgSend(v2, "bytes");
        +[WiFiUsagePrivacyFilter toHEXString:length:](WiFiUsagePrivacyFilter, "toHEXString:length:", v3, objc_msgSend(v2, "length"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "appendFormat:", CFSTR("\n\"%@\":(%@)"), v29, v30);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v26);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v31 = v52;
  -[NSMutableDictionary allKeys](v52->_extendedIEList, "allKeys");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (SELF ENDSWITH \"_isValid\")"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "filteredArrayUsingPredicate:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v50)
  {
    v48 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v54 != v48)
          objc_enumerationMutation(v34);
        v36 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k);
        -[NSMutableDictionary objectForKeyedSubscript:](v31->_extendedIEList, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v31->_taggedIEList;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_isValid"), v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v40
          || (v41 = v31->_taggedIEList,
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_isValid"), v36),
              v2 = (id)objc_claimAutoreleasedReturnValue(),
              -[NSMutableDictionary objectForKeyedSubscript:](v41, "objectForKeyedSubscript:", v2),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              v42 = CFSTR(" (invalid!) :"),
              objc_msgSend(v3, "BOOLValue")))
        {
          v42 = &stru_1E881F240;
        }
        v43 = objc_retainAutorelease(v37);
        +[WiFiUsagePrivacyFilter toHEXString:length:](WiFiUsagePrivacyFilter, "toHEXString:length:", objc_msgSend(v43, "bytes"), objc_msgSend(v43, "length"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "appendFormat:", CFSTR("\n\"%@\"%@:(%@)"), v36, v42, v44);

        if (v40)
        {

        }
        v31 = v52;
      }
      v50 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v50);
  }

  return v51;
}

+ (id)isValidIE:(unsigned __int8)a3 ofLen:(unsigned __int8)a4 withIsExtended:(BOOL)a5
{
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v5 = a4;
  if (a5)
    v6 = (void *)_extendedElementsLenLimits;
  else
    v6 = (void *)_elementsLenLimits;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maxLen"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maxLen"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maxLen"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "unsignedIntegerValue") >= (unint64_t)v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minLen"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minLen"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) != 0)
      {
        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minLen"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "numberWithBool:", objc_msgSend(v19, "unsignedIntegerValue") <= (unint64_t)v5);
        v20 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v20;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fixedLen"));
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fixedLen"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v24 = objc_opt_isKindOfClass();

      if ((v24 & 1) != 0)
      {
        v25 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fixedLen"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "numberWithBool:", objc_msgSend(v26, "unsignedIntegerValue") == v5);
        v27 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v27;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)parseNormalIE:(unsigned __int8)a3 from:(char *)a4 length:(unint64_t)a5 endOfBuffer:(char *)a6
{
  _BOOL4 v6;

  if (!a5 || &a4[a5] > a6)
  {
    NSLog(CFSTR("%s: reached end of buffer while parsing IE %u"), a2, "-[WiFiUsageParsedBeacon parseNormalIE:from:length:endOfBuffer:]", a3);
    goto LABEL_10;
  }
  if ((int)a3 > 132)
  {
    if (a3 == 133)
    {
      if (-[WiFiUsageParsedBeacon parseApName:length:endOfBuffer:](self, "parseApName:length:endOfBuffer:", a4, a5, a6))
        goto LABEL_23;
      goto LABEL_10;
    }
    if (a3 != 191)
    {
      if (a3 != 201
        || -[WiFiUsageParsedBeacon parseRNR:length:endOfBuffer:](self, "parseRNR:length:endOfBuffer:", a4, a5, a6))
      {
        goto LABEL_23;
      }
      goto LABEL_10;
    }
    if (!-[WiFiUsageParsedBeacon parseVHTCapa:length:endOfBuffer:](self, "parseVHTCapa:length:endOfBuffer:", a4, a5, a6))goto LABEL_10;
LABEL_23:
    LOBYTE(v6) = 1;
    return v6;
  }
  if (a3 == 3)
  {
    if (!-[WiFiUsageParsedBeacon parseDSSS:length:endOfBuffer:](self, "parseDSSS:length:endOfBuffer:", a4, a5, a6))
      goto LABEL_10;
    goto LABEL_23;
  }
  if (a3 == 45)
  {
    if (-[WiFiUsageParsedBeacon parseHTCapa:length:endOfBuffer:](self, "parseHTCapa:length:endOfBuffer:", a4, a5, a6))
      goto LABEL_23;
LABEL_10:
    LOBYTE(v6) = 0;
    return v6;
  }
  if (a3 != 61)
    goto LABEL_23;
  v6 = -[WiFiUsageParsedBeacon parseHTOp:length:endOfBuffer:](self, "parseHTOp:length:endOfBuffer:", a4, a5, a6);
  if (v6)
    goto LABEL_23;
  return v6;
}

- (BOOL)parseExtendedIE:(unsigned __int8)a3 from:(char *)a4 length:(unint64_t)a5 endOfBuffer:(char *)a6
{
  _BOOL4 v6;

  if (a5 && &a4[a5] <= a6)
  {
    if (a3 == 108)
    {
      v6 = -[WiFiUsageParsedBeacon parseEHTCapa:length:endOfBuffer:](self, "parseEHTCapa:length:endOfBuffer:", a4, a5, a6);
      if (!v6)
        return v6;
      goto LABEL_13;
    }
    if (a3 == 59)
    {
      if (-[WiFiUsageParsedBeacon parseHE6GHz:length:endOfBuffer:](self, "parseHE6GHz:length:endOfBuffer:", a4, a5, a6))
      {
LABEL_13:
        LOBYTE(v6) = 1;
        return v6;
      }
    }
    else if (a3 != 35
           || -[WiFiUsageParsedBeacon parseHECapa:length:endOfBuffer:](self, "parseHECapa:length:endOfBuffer:", a4, a5, a6))
    {
      goto LABEL_13;
    }
  }
  else
  {
    NSLog(CFSTR("%s: reached end of buffer while parsing Extended IE %u"), a2, "-[WiFiUsageParsedBeacon parseExtendedIE:from:length:endOfBuffer:]", a3);
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)parseHTCapa:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  BOOL v5;
  BOOL v6;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  _BYTE v12[26];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a4)
    v5 = a3 + 26 > a5;
  else
    v5 = 1;
  v6 = !v5;
  if (v5)
  {
    NSLog(CFSTR("%s: reached end of buffer while parsing IE %u"), a2, "-[WiFiUsageParsedBeacon parseHTCapa:length:endOfBuffer:]", 45);
  }
  else
  {
    *(_OWORD *)v12 = *(_OWORD *)a3;
    *(_OWORD *)&v12[10] = *(_OWORD *)(a3 + 10);
    -[WiFiUsageParsedBeacon setHasHT:](self, "setHasHT:", 1);
    -[WiFiUsageParsedBeacon setHtInfo:](self, "setHtInfo:", *(unsigned __int16 *)v12);
    -[WiFiUsageParsedBeacon setHtAMPDUParams:](self, "setHtAMPDUParams:", v12[2]);
    -[WiFiUsageParsedBeacon setHtExtendedCapabilities:](self, "setHtExtendedCapabilities:", *(unsigned __int16 *)&v12[19]);
    -[WiFiUsageParsedBeacon setHtAntennaSelection:](self, "setHtAntennaSelection:", v12[25]);
    -[WiFiUsageParsedBeacon setHtTxBFCapabilities:](self, "setHtTxBFCapabilities:", *(unsigned int *)&v12[21]);
    v8 = 0;
    v9 = 0;
    do
    {
      if (v12[v8 + 3])
        v9 = v8 + 1;
      ++v8;
    }
    while (v8 != 4);
    if ((~v12[15] & 3) != 0)
      v10 = v9;
    else
      v10 = (v12[15] >> 2) & 3;
    -[WiFiUsageParsedBeacon setHtRxNSS:](self, "setHtRxNSS:", v9);
    -[WiFiUsageParsedBeacon setHtTxNSS:](self, "setHtTxNSS:", v10);
  }
  return v6;
}

- (BOOL)parseVHTCapa:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  BOOL v5;
  BOOL v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  int v14;
  unsigned __int8 v15;
  char v16;
  int v17;
  unsigned __int8 v18;

  if (a4)
    v5 = a3 + 12 > a5;
  else
    v5 = 1;
  v6 = !v5;
  if (v5)
  {
    NSLog(CFSTR("%s: reached end of buffer while parsing IE %u"), a2, "-[WiFiUsageParsedBeacon parseVHTCapa:length:endOfBuffer:]", 191);
  }
  else
  {
    v8 = *(unsigned int *)a3;
    v9 = *((unsigned __int16 *)a3 + 2);
    v10 = *((unsigned __int16 *)a3 + 3);
    v11 = *((unsigned __int16 *)a3 + 4);
    v12 = *((unsigned __int16 *)a3 + 5);
    -[WiFiUsageParsedBeacon setHasVHT:](self, "setHasVHT:", 1);
    -[WiFiUsageParsedBeacon setVhtInfo:](self, "setVhtInfo:", v8);
    -[WiFiUsageParsedBeacon setVhtRxMCSMap:](self, "setVhtRxMCSMap:", v9);
    -[WiFiUsageParsedBeacon setVhtTxMCSMap:](self, "setVhtTxMCSMap:", v11);
    -[WiFiUsageParsedBeacon setVhtRxMaxRate:](self, "setVhtRxMaxRate:", v10);
    -[WiFiUsageParsedBeacon setVhtTxMaxRate:](self, "setVhtTxMaxRate:", v12);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    do
    {
      if ((~(v9 >> v13) & 3) != 0)
        v15 = v14 + 1;
      ++v14;
      v13 += 2;
    }
    while (v14 != 8);
    v16 = 0;
    v17 = 0;
    v18 = 0;
    do
    {
      if ((~(v11 >> v16) & 3) != 0)
        v18 = v17 + 1;
      ++v17;
      v16 += 2;
    }
    while (v17 != 8);
    -[WiFiUsageParsedBeacon setVhtRxNSS:](self, "setVhtRxNSS:", v15);
    -[WiFiUsageParsedBeacon setVhtTxNSS:](self, "setVhtTxNSS:", v18);
  }
  return v6;
}

- (BOOL)parseHECapa:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  unsigned __int16 *v7;
  void *v11;
  void *v12;
  char v13;
  int v14;
  unsigned __int8 v15;
  char v16;
  char v17;
  int v18;
  unsigned __int8 v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[21];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a4 || (v7 = (unsigned __int16 *)(a3 + 21), a3 + 21 > a5))
  {
    NSLog(CFSTR("%s: reached end of buffer while parsing extended IE %u"), a2, a3, "-[WiFiUsageParsedBeacon parseHECapa:length:endOfBuffer:]", 35);
    return 0;
  }
  *(_OWORD *)v26 = *(_OWORD *)a3;
  *(_QWORD *)&v26[13] = *(_QWORD *)(a3 + 13);
  -[WiFiUsageParsedBeacon setHasHE:](self, "setHasHE:", 1);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v26, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageParsedBeacon setHeMACInfo:](self, "setHeMACInfo:", v11);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v26[6], 11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageParsedBeacon setHePHYInfo:](self, "setHePHYInfo:", v12);

  -[WiFiUsageParsedBeacon setHeRxMCSMap80MHz:](self, "setHeRxMCSMap80MHz:", *(unsigned __int16 *)&v26[17]);
  -[WiFiUsageParsedBeacon setHeTxMCSMap80MHz:](self, "setHeTxMCSMap80MHz:", *(unsigned __int16 *)&v26[19]);
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = v26[6];
  do
  {
    if ((~(*(unsigned __int16 *)&v26[17] >> v13) & 3) != 0)
      v15 = v14 + 1;
    ++v14;
    v13 += 2;
  }
  while (v14 != 8);
  v17 = 0;
  v18 = 0;
  v19 = 0;
  do
  {
    if ((~(*(unsigned __int16 *)&v26[19] >> v17) & 3) != 0)
      v19 = v18 + 1;
    ++v18;
    v17 += 2;
  }
  while (v18 != 8);
  v20 = a4 - 21;
  -[WiFiUsageParsedBeacon setHeRxNSS:](self, "setHeRxNSS:", v15);
  -[WiFiUsageParsedBeacon setHeTxNSS:](self, "setHeTxNSS:", v19);
  if ((v16 & 4) == 0)
  {
    if ((v16 & 8) == 0)
      return 1;
    goto LABEL_23;
  }
  if (a4 == 21 || a3 + 23 > a5)
  {
    NSLog(CFSTR("%s: reached end of buffer while parsing extended IE %u (HE RX MCS Map 160Mhz)"), v21, v22, "-[WiFiUsageParsedBeacon parseHECapa:length:endOfBuffer:]", 35);
    return 0;
  }
  if (a4 == 23 || (v23 = a3 + 25, a3 + 25 > a5))
  {
    NSLog(CFSTR("%s: reached end of buffer while parsing extended IE %u (HE TX MCS Map 160Mhz)"), v21, v22, "-[WiFiUsageParsedBeacon parseHECapa:length:endOfBuffer:]", 35);
    return 0;
  }
  v24 = *(unsigned __int16 *)(a3 + 23);
  v20 = a4 - 25;
  -[WiFiUsageParsedBeacon setHeRxMCSMap160MHz:](self, "setHeRxMCSMap160MHz:", *v7);
  -[WiFiUsageParsedBeacon setHeTxMCSMap160MHz:](self, "setHeTxMCSMap160MHz:", v24);
  v7 = (unsigned __int16 *)v23;
  if ((v16 & 8) != 0)
  {
LABEL_23:
    if (!v20 || v7 + 1 > (unsigned __int16 *)a5)
    {
      NSLog(CFSTR("%s: reached end of buffer while parsing extended IE %u (HE RX MCS Map 80+80Mhz)"), v21, v22, "-[WiFiUsageParsedBeacon parseHECapa:length:endOfBuffer:]", 35);
      return 0;
    }
    if (v20 == 2 || v7 + 2 > (unsigned __int16 *)a5)
    {
      NSLog(CFSTR("%s: reached end of buffer while parsing extended IE %u (HE TX MCS Map 80+80Mhz)"), v21, v22, "-[WiFiUsageParsedBeacon parseHECapa:length:endOfBuffer:]", 35);
      return 0;
    }
    v25 = v7[1];
    -[WiFiUsageParsedBeacon setHeRxMCSMap8080MHz:](self, "setHeRxMCSMap8080MHz:", *v7);
    -[WiFiUsageParsedBeacon setHeTxMCSMap8080MHz:](self, "setHeTxMCSMap8080MHz:", v25);
  }
  return 1;
}

- (BOOL)parseEHTCapa:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  -[WiFiUsageParsedBeacon setHasEHT:](self, "setHasEHT:", 1, a4, a5);
  return 1;
}

- (BOOL)parseRNR:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  char *v5;
  char *v7;
  char *v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  _BOOL4 v13;
  int v15;
  int v16;
  int v17;
  unsigned __int8 v18;
  unint64_t v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t v23;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  int v32;

  v5 = a3 + 4;
  if (a3 + 4 < a5)
  {
    v7 = a3;
    v8 = &a3[a4];
    do
    {
      if (v8 <= v5)
        break;
      v9 = a4;
      if (a4 < 4uLL)
        break;
      v10 = *(unsigned __int16 *)v7;
      v11 = v10 >> 8;
      v13 = (v10 & 3) == 1 && (_DWORD)v11 == 3;
      v15 = (v10 & 3) == 0 && (_DWORD)v11 == 16 || v13;
      if (v10 >= 0x100)
      {
        v16 = 0;
        v17 = v10 & 0xFB00;
        if (v10 <= 0xCFF)
          v18 = 0;
        else
          v18 = 11;
        if (v17 == 2048 || v17 == 512)
          v18 = BYTE1(v10) - 1;
        v20 = (unint64_t)&v5[v11];
        if (&v5[v11] <= v8 && v20 <= (unint64_t)a5)
        {
          LOBYTE(v21) = 0;
          v22 = ((v10 >> 4) + 1) * v11;
          do
          {
            v21 = (v21 + v11);
            v23 = v20 + v21;
          }
          while (v21 < v22 && v23 <= (unint64_t)v8 && v23 <= (unint64_t)a5);
          v16 = (v5[v18] >> 6) & 1;
        }
        v26 = v7[2];
        if (v16 && v26 >= 0x83 && v26 < 0x88)
        {
          v32 = v15;
          v27 = v7[3];
          -[WiFiUsageParsedBeacon setColocated6Ghz:](self, "setColocated6Ghz:", 1);
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E8863F20);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "containsObject:", v29);

          if (v30)
            -[WiFiUsageParsedBeacon setColocated6GhzIsPSC:](self, "setColocated6GhzIsPSC:", 1);

          v15 = v32;
        }
        if ((v15 & v16) == 1)
        {
          if ((v26 - 81) > 3u)
          {
            if ((v26 - 115) > 0xFu)
            {
              if ((v26 + 125) <= 4u)
                -[WiFiUsageParsedBeacon setHasColocatedMLD6G:](self, "setHasColocatedMLD6G:", 1);
            }
            else
            {
              -[WiFiUsageParsedBeacon setHasColocatedMLD5G:](self, "setHasColocatedMLD5G:", 1);
            }
          }
          else
          {
            -[WiFiUsageParsedBeacon setHasColocatedMLD2G:](self, "setHasColocatedMLD2G:", 1);
          }
        }
      }
      v7 += (v11 + 4);
      LOBYTE(a4) = v9 - (v11 + 4);
      v5 = v7 + 4;
    }
    while (v7 + 4 < a5);
  }
  return 1;
}

- (BOOL)parseApName:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  id v6;
  size_t v7;
  uint64_t v8;
  void *v9;
  _BYTE v11[30];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a4 > 0x1D)
  {
    *(_OWORD *)v11 = *(_OWORD *)a3;
    *(_OWORD *)&v11[14] = *(_OWORD *)(a3 + 14);
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = strnlen((const char *)((unint64_t)v11 | 0xA), 0x10uLL);
    if (v7 >= 0x10)
      v8 = 16;
    else
      v8 = v7;
    v9 = (void *)objc_msgSend(v6, "initWithBytes:length:encoding:", (unint64_t)v11 | 0xA, v8, 1);
    -[WiFiUsageParsedBeacon setApName:](self, "setApName:", v9);

  }
  else
  {
    NSLog(CFSTR("%s: IE %d too short (%lu, expected %lu)"), a2, a3, "-[WiFiUsageParsedBeacon parseApName:length:endOfBuffer:]", 133, a4, 30);
  }
  return 1;
}

- (BOOL)parseDSSS:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  BOOL v5;
  BOOL v6;

  if (a4)
    v5 = a3 + 1 > a5;
  else
    v5 = 1;
  v6 = !v5;
  if (v5)
    NSLog(CFSTR("%s: reached end of buffer while parsing IE %u"), a2, "-[WiFiUsageParsedBeacon parseDSSS:length:endOfBuffer:]", 3);
  else
    -[WiFiUsageParsedBeacon setChannel:](self, "setChannel:", *a3);
  return v6;
}

- (BOOL)parseHTOp:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  BOOL v5;
  BOOL v6;
  uint64_t channel;

  if (a4)
    v5 = a3 + 8 > a5;
  else
    v5 = 1;
  v6 = !v5;
  if (v5)
  {
    NSLog(CFSTR("%s: reached end of buffer while parsing IE %u"), a2, "-[WiFiUsageParsedBeacon parseHTOp:length:endOfBuffer:]", 61);
  }
  else
  {
    channel = self->_channel;
    if (self->_channel)
    {
      if ((_DWORD)channel != *a3)
      {
        NSLog(CFSTR("%s - Found primary channel in HTOp (%u) that differs from other elements (%u)"), a2, "-[WiFiUsageParsedBeacon parseHTOp:length:endOfBuffer:]", *a3, channel);
        channel = *a3;
      }
    }
    else
    {
      channel = *a3;
    }
    -[WiFiUsageParsedBeacon setChannel:](self, "setChannel:", channel);
  }
  return v6;
}

- (BOOL)parseHE6GHz:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  BOOL v5;
  BOOL v6;
  uint64_t channel;

  if (a4)
    v5 = a3 + 5 > a5;
  else
    v5 = 1;
  v6 = !v5;
  if (v5)
  {
    NSLog(CFSTR("%s: reached end of buffer while parsing IE %u"), a2, "-[WiFiUsageParsedBeacon parseHE6GHz:length:endOfBuffer:]", 59);
  }
  else
  {
    channel = self->_channel;
    if (self->_channel)
    {
      if ((_DWORD)channel != *a3)
      {
        NSLog(CFSTR("%s - Found primary channel in 6GhzOp IE (%u) that differs from other elements (%u)"), a2, "-[WiFiUsageParsedBeacon parseHE6GHz:length:endOfBuffer:]", *a3, channel);
        channel = *a3;
      }
    }
    else
    {
      channel = *a3;
    }
    -[WiFiUsageParsedBeacon setChannel:](self, "setChannel:", channel);
    -[WiFiUsageParsedBeacon setBand:](self, "setBand:", 6);
  }
  return v6;
}

+ (void)defaults
{
  void *v2;
  void *v3;

  v2 = (void *)_elementsLenLimits;
  _elementsLenLimits = 0;

  v3 = (void *)_extendedElementsLenLimits;
  _extendedElementsLenLimits = 0;

}

+ (void)initialize
{
  objc_msgSend(a1, "defaults");
  objc_msgSend(a1, "updateConfig");
}

+ (void)updateConfig
{
  const __CFString *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  id v7;
  char v8;
  id obj;

  v3 = CFSTR("elements");
  +[WiFiUsageBeaconParsingConfiguration getConfigForKey:](WiFiUsageBeaconParsingConfiguration, "getConfigForKey:", CFSTR("elements"));
  v4 = objc_claimAutoreleasedReturnValue();
  obj = (id)v4;
  if (!v4)
    goto LABEL_6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = (uint64_t)obj;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  v6 = (void *)_elementsLenLimits;
  _elementsLenLimits = (uint64_t)obj;
  v7 = obj;

  v3 = CFSTR("extendedElements");
  +[WiFiUsageBeaconParsingConfiguration getConfigForKey:](WiFiUsageBeaconParsingConfiguration, "getConfigForKey:", CFSTR("extendedElements"));
  obj = (id)objc_claimAutoreleasedReturnValue();

  v4 = (uint64_t)obj;
  if (!obj)
    goto LABEL_6;
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();
  v4 = (uint64_t)obj;
  if ((v8 & 1) != 0)
  {
    objc_storeStrong((id *)&_extendedElementsLenLimits, obj);
  }
  else
  {
LABEL_6:
    NSLog(CFSTR("%s: impossible to parse %@. Expected Dictionary, found: %@"), "+[WiFiUsageParsedBeacon updateConfig]", v3, v4);
    objc_msgSend(a1, "defaults");
  }

}

+ (id)config
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("elements len limits: %@ extendedElements len limits: %@"), _elementsLenLimits, _extendedElementsLenLimits);
}

- (unsigned)beaconInterval
{
  return self->_beaconInterval;
}

- (void)setBeaconInterval:(unsigned __int16)a3
{
  self->_beaconInterval = a3;
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unsigned __int16)a3
{
  self->_capabilities = a3;
}

- (unsigned)htRxNSS
{
  return self->_htRxNSS;
}

- (void)setHtRxNSS:(unsigned __int8)a3
{
  self->_htRxNSS = a3;
}

- (unsigned)htTxNSS
{
  return self->_htTxNSS;
}

- (void)setHtTxNSS:(unsigned __int8)a3
{
  self->_htTxNSS = a3;
}

- (unsigned)vhtRxNSS
{
  return self->_vhtRxNSS;
}

- (void)setVhtRxNSS:(unsigned __int8)a3
{
  self->_vhtRxNSS = a3;
}

- (unsigned)vhtTxNSS
{
  return self->_vhtTxNSS;
}

- (void)setVhtTxNSS:(unsigned __int8)a3
{
  self->_vhtTxNSS = a3;
}

- (unsigned)heRxNSS
{
  return self->_heRxNSS;
}

- (void)setHeRxNSS:(unsigned __int8)a3
{
  self->_heRxNSS = a3;
}

- (unsigned)heTxNSS
{
  return self->_heTxNSS;
}

- (void)setHeTxNSS:(unsigned __int8)a3
{
  self->_heTxNSS = a3;
}

- (BOOL)colocated6Ghz
{
  return self->_colocated6Ghz;
}

- (void)setColocated6Ghz:(BOOL)a3
{
  self->_colocated6Ghz = a3;
}

- (NSString)apName
{
  return self->_apName;
}

- (void)setApName:(id)a3
{
  objc_storeStrong((id *)&self->_apName, a3);
}

- (NSMutableDictionary)taggedIEList
{
  return self->_taggedIEList;
}

- (void)setTaggedIEList:(id)a3
{
  objc_storeStrong((id *)&self->_taggedIEList, a3);
}

- (NSMutableDictionary)vendorIEList
{
  return self->_vendorIEList;
}

- (void)setVendorIEList:(id)a3
{
  objc_storeStrong((id *)&self->_vendorIEList, a3);
}

- (NSMutableDictionary)extendedIEList
{
  return self->_extendedIEList;
}

- (void)setExtendedIEList:(id)a3
{
  objc_storeStrong((id *)&self->_extendedIEList, a3);
}

- (BOOL)parsingSuccessful
{
  return self->_parsingSuccessful;
}

- (void)setParsingSuccessful:(BOOL)a3
{
  self->_parsingSuccessful = a3;
}

- (NSNumber)isBeaconAtHeRate
{
  return self->_isBeaconAtHeRate;
}

- (void)setIsBeaconAtHeRate:(id)a3
{
  self->_isBeaconAtHeRate = (NSNumber *)a3;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_storeStrong((id *)&self->_bssid, a3);
}

- (unsigned)channel
{
  return self->_channel;
}

- (void)setChannel:(unsigned __int8)a3
{
  self->_channel = a3;
}

- (unsigned)band
{
  return self->_band;
}

- (void)setBand:(unsigned __int8)a3
{
  self->_band = a3;
}

- (unsigned)htInfo
{
  return self->_htInfo;
}

- (void)setHtInfo:(unsigned __int16)a3
{
  self->_htInfo = a3;
}

- (unsigned)htAMPDUParams
{
  return self->_htAMPDUParams;
}

- (void)setHtAMPDUParams:(unsigned __int8)a3
{
  self->_htAMPDUParams = a3;
}

- (unsigned)htExtendedCapabilities
{
  return self->_htExtendedCapabilities;
}

- (void)setHtExtendedCapabilities:(unsigned __int16)a3
{
  self->_htExtendedCapabilities = a3;
}

- (unsigned)htTxBFCapabilities
{
  return self->_htTxBFCapabilities;
}

- (void)setHtTxBFCapabilities:(unsigned int)a3
{
  self->_htTxBFCapabilities = a3;
}

- (unsigned)htAntennaSelection
{
  return self->_htAntennaSelection;
}

- (void)setHtAntennaSelection:(unsigned __int8)a3
{
  self->_htAntennaSelection = a3;
}

- (NSData)htMCSSet
{
  return self->_htMCSSet;
}

- (unsigned)vhtInfo
{
  return self->_vhtInfo;
}

- (void)setVhtInfo:(unsigned int)a3
{
  self->_vhtInfo = a3;
}

- (unsigned)vhtRxMCSMap
{
  return self->_vhtRxMCSMap;
}

- (void)setVhtRxMCSMap:(unsigned __int16)a3
{
  self->_vhtRxMCSMap = a3;
}

- (unsigned)vhtRxMaxRate
{
  return self->_vhtRxMaxRate;
}

- (void)setVhtRxMaxRate:(unsigned __int16)a3
{
  self->_vhtRxMaxRate = a3;
}

- (unsigned)vhtTxMCSMap
{
  return self->_vhtTxMCSMap;
}

- (void)setVhtTxMCSMap:(unsigned __int16)a3
{
  self->_vhtTxMCSMap = a3;
}

- (unsigned)vhtTxMaxRate
{
  return self->_vhtTxMaxRate;
}

- (void)setVhtTxMaxRate:(unsigned __int16)a3
{
  self->_vhtTxMaxRate = a3;
}

- (NSData)heMACInfo
{
  return self->_heMACInfo;
}

- (void)setHeMACInfo:(id)a3
{
  objc_storeStrong((id *)&self->_heMACInfo, a3);
}

- (NSData)hePHYInfo
{
  return self->_hePHYInfo;
}

- (void)setHePHYInfo:(id)a3
{
  objc_storeStrong((id *)&self->_hePHYInfo, a3);
}

- (unsigned)heRxMCSMap80MHz
{
  return self->_heRxMCSMap80MHz;
}

- (void)setHeRxMCSMap80MHz:(unsigned __int16)a3
{
  self->_heRxMCSMap80MHz = a3;
}

- (unsigned)heTxMCSMap80MHz
{
  return self->_heTxMCSMap80MHz;
}

- (void)setHeTxMCSMap80MHz:(unsigned __int16)a3
{
  self->_heTxMCSMap80MHz = a3;
}

- (unsigned)heRxMCSMap160MHz
{
  return self->_heRxMCSMap160MHz;
}

- (void)setHeRxMCSMap160MHz:(unsigned __int16)a3
{
  self->_heRxMCSMap160MHz = a3;
}

- (unsigned)heTxMCSMap160MHz
{
  return self->_heTxMCSMap160MHz;
}

- (void)setHeTxMCSMap160MHz:(unsigned __int16)a3
{
  self->_heTxMCSMap160MHz = a3;
}

- (unsigned)heRxMCSMap8080MHz
{
  return self->_heRxMCSMap8080MHz;
}

- (void)setHeRxMCSMap8080MHz:(unsigned __int16)a3
{
  self->_heRxMCSMap8080MHz = a3;
}

- (unsigned)heTxMCSMap8080MHz
{
  return self->_heTxMCSMap8080MHz;
}

- (void)setHeTxMCSMap8080MHz:(unsigned __int16)a3
{
  self->_heTxMCSMap8080MHz = a3;
}

- (BOOL)colocated6GhzIsPSC
{
  return self->_colocated6GhzIsPSC;
}

- (void)setColocated6GhzIsPSC:(BOOL)a3
{
  self->_colocated6GhzIsPSC = a3;
}

- (BOOL)hasHT
{
  return self->_hasHT;
}

- (void)setHasHT:(BOOL)a3
{
  self->_hasHT = a3;
}

- (BOOL)hasVHT
{
  return self->_hasVHT;
}

- (void)setHasVHT:(BOOL)a3
{
  self->_hasVHT = a3;
}

- (BOOL)hasHE
{
  return self->_hasHE;
}

- (void)setHasHE:(BOOL)a3
{
  self->_hasHE = a3;
}

- (BOOL)hasEHT
{
  return self->_hasEHT;
}

- (void)setHasEHT:(BOOL)a3
{
  self->_hasEHT = a3;
}

- (BOOL)hasColocatedMLD2G
{
  return self->_hasColocatedMLD2G;
}

- (void)setHasColocatedMLD2G:(BOOL)a3
{
  self->_hasColocatedMLD2G = a3;
}

- (BOOL)hasColocatedMLD5G
{
  return self->_hasColocatedMLD5G;
}

- (void)setHasColocatedMLD5G:(BOOL)a3
{
  self->_hasColocatedMLD5G = a3;
}

- (BOOL)hasColocatedMLD6G
{
  return self->_hasColocatedMLD6G;
}

- (void)setHasColocatedMLD6G:(BOOL)a3
{
  self->_hasColocatedMLD6G = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hePHYInfo, 0);
  objc_storeStrong((id *)&self->_heMACInfo, 0);
  objc_storeStrong((id *)&self->_htMCSSet, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_extendedIEList, 0);
  objc_storeStrong((id *)&self->_vendorIEList, 0);
  objc_storeStrong((id *)&self->_taggedIEList, 0);
  objc_storeStrong((id *)&self->_apName, 0);
}

@end
