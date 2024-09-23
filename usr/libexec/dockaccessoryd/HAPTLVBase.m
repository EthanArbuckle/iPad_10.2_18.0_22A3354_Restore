@implementation HAPTLVBase

- (HAPTLVBase)initWithTLVData:(id)a3
{
  id v5;
  HAPTLVBase *v6;
  HAPTLVBase *v7;
  HAPTLVBase *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HAPTLVBase;
  v6 = -[HAPTLVBase init](&v10, "init");
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_tlvDatablob, a3), !-[HAPTLVBase _parseFromTLVData](v7, "_parseFromTLVData")))
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (BOOL)_parseFromTLVData
{
  return 0;
}

- (BOOL)_parseFields:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  char v11;
  int *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  __CFString *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  __CFString *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  __CFString *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  __CFString *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  __CFString *v76;
  id v77;
  id v78;
  NSObject *v79;
  __CFString *v80;
  void *v81;
  void *v82;
  id v83;
  id v85;
  void *v86;
  HAPTLVBase *v87;
  void *v88;
  id v89;
  NSObject *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  id v100;
  __int16 v101;
  void *v102;
  _BYTE v103[128];

  v4 = a3;
  v87 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVBase tlvDatablob](self, "tlvDatablob"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HAPTLVParser parserWithData:](HAPTLVParser, "parserWithData:", v5));

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
  if (!v8)
  {
    v11 = 1;
    goto LABEL_53;
  }
  v10 = v8;
  v11 = 1;
  v12 = &OBJC_IVAR___HAPAccessory__identifier;
  v13 = *(_QWORD *)v92;
  v88 = v6;
  v89 = v7;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v92 != v13)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)v14);
      v16 = objc_opt_class(v12 + 988, v9);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      {
        v18 = v15;
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parseResponseForNumber:", objc_msgSend(v18, "tlvid")));
        if (v20)
          goto LABEL_36;
        v21 = sub_10007CCE4(0, v19);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = sub_10007CD2C(0);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
          v26 = objc_msgSend(v18, "tlvid");
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVBase tlvDatablob](v87, "tlvDatablob"));
          *(_DWORD *)buf = 138544130;
          v96 = v24;
          v97 = 2112;
          v98 = v25;
          v99 = 2048;
          v100 = v26;
          v101 = 2112;
          v102 = v27;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse number for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

          v6 = v88;
          v7 = v89;
        }
        goto LABEL_27;
      }
      v28 = objc_opt_class(HAPUint8Wrapper, v17);
      if ((objc_opt_isKindOfClass(v15, v28) & 1) != 0)
      {
        v18 = v15;
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parseResponseForUInt8:", objc_msgSend(v18, "tlvid")));
        if (v20)
          goto LABEL_36;
        v31 = sub_10007CCE4(0, v30);
        v22 = objc_claimAutoreleasedReturnValue(v31);
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v32 = sub_10007CD2C(0);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
        v35 = objc_msgSend(v18, "tlvid");
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVBase tlvDatablob](v87, "tlvDatablob"));
        *(_DWORD *)buf = 138544130;
        v96 = v33;
        v97 = 2112;
        v98 = v34;
        v99 = 2048;
        v100 = v35;
        v101 = 2112;
        v102 = v36;
        v37 = v22;
        v38 = "%{public}@Failed to parse uint8 for tlv: %@ with ID: %tu (%@)";
        goto LABEL_26;
      }
      v39 = objc_opt_class(HAPUint16Wrapper, v29);
      if ((objc_opt_isKindOfClass(v15, v39) & 1) != 0)
      {
        v18 = v15;
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parseResponseForUInt16:", objc_msgSend(v18, "tlvid")));
        if (v20)
          goto LABEL_36;
        v42 = sub_10007CCE4(0, v41);
        v22 = objc_claimAutoreleasedReturnValue(v42);
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v43 = sub_10007CD2C(0);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
        v44 = objc_msgSend(v18, "tlvid");
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVBase tlvDatablob](v87, "tlvDatablob"));
        *(_DWORD *)buf = 138544130;
        v96 = v33;
        v97 = 2112;
        v98 = v34;
        v99 = 2048;
        v100 = v44;
        v101 = 2112;
        v102 = v36;
        v37 = v22;
        v38 = "%{public}@Failed to parse uint16 for tlv: %@ with ID: %tu (%@)";
        goto LABEL_26;
      }
      v45 = objc_opt_class(HAPStringWrapper, v40);
      if ((objc_opt_isKindOfClass(v15, v45) & 1) != 0)
      {
        v18 = v15;
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parseResponseForString:", objc_msgSend(v18, "tlvid")));
        if (v20)
          goto LABEL_36;
        v48 = sub_10007CCE4(0, v47);
        v22 = objc_claimAutoreleasedReturnValue(v48);
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v49 = sub_10007CD2C(0);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v49);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
        v50 = objc_msgSend(v18, "tlvid");
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVBase tlvDatablob](v87, "tlvDatablob"));
        *(_DWORD *)buf = 138544130;
        v96 = v33;
        v97 = 2112;
        v98 = v34;
        v99 = 2048;
        v100 = v50;
        v101 = 2112;
        v102 = v36;
        v37 = v22;
        v38 = "%{public}@Failed to parse String for tlv: %@ with ID: %tu (%@)";
        goto LABEL_26;
      }
      v51 = objc_opt_class(HAPDataWrapper, v46);
      if ((objc_opt_isKindOfClass(v15, v51) & 1) != 0)
      {
        v18 = v15;
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parseResponseForData:", objc_msgSend(v18, "tlvid")));
        if (v20)
          goto LABEL_36;
        v54 = sub_10007CCE4(0, v53);
        v22 = objc_claimAutoreleasedReturnValue(v54);
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v55 = sub_10007CD2C(0);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v55);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
        v56 = objc_msgSend(v18, "tlvid");
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVBase tlvDatablob](v87, "tlvDatablob"));
        *(_DWORD *)buf = 138544130;
        v96 = v33;
        v97 = 2112;
        v98 = v34;
        v99 = 2048;
        v100 = v56;
        v101 = 2112;
        v102 = v36;
        v37 = v22;
        v38 = "%{public}@Failed to parse Data for tlv: %@ with ID: %tu (%@)";
        goto LABEL_26;
      }
      v57 = objc_opt_class(HAPArrayWrapper, v52);
      if ((objc_opt_isKindOfClass(v15, v57) & 1) != 0)
      {
        v59 = v15;
        v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parseResponseForArray:", objc_msgSend(v59, "tlvid")));
        if (!v60)
        {
          v69 = sub_10007CCE4(0, v61);
          v20 = objc_claimAutoreleasedReturnValue(v69);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v70 = sub_10007CD2C(0);
            v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "name"));
            v73 = objc_msgSend(v59, "tlvid");
            v74 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVBase tlvDatablob](v87, "tlvDatablob"));
            *(_DWORD *)buf = 138544130;
            v96 = v71;
            v97 = 2112;
            v98 = v72;
            v99 = 2048;
            v100 = v73;
            v12 = &OBJC_IVAR___HAPAccessory__identifier;
            v101 = 2112;
            v102 = v74;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Array for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

            v6 = v88;
          }
          v11 = 0;
          v7 = v89;
          goto LABEL_37;
        }
        v20 = v60;
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectCreator"));

        if (!v62)
        {
          objc_msgSend(v59, "setField:", v20);
          v6 = v88;
          v7 = v89;
          goto LABEL_37;
        }
        v90 = v20;
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectCreator"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVBase _parseArray:result:objectCreator:](v87, "_parseArray:result:objectCreator:", v20, &v90, v63));
        v65 = v90;

        if (v64)
        {
          objc_msgSend(v59, "setField:", v64);
        }
        else
        {
          v78 = sub_10007CCE4(0, v66);
          v79 = objc_claimAutoreleasedReturnValue(v78);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            v80 = sub_10007CD2C(0);
            v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "name"));
            v85 = objc_msgSend(v59, "tlvid");
            v82 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVBase tlvDatablob](v87, "tlvDatablob"));
            *(_DWORD *)buf = 138544130;
            v96 = v81;
            v97 = 2112;
            v98 = v86;
            v99 = 2048;
            v100 = v85;
            v101 = 2112;
            v102 = v82;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%{public}@Failed to construct array for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

          }
          v11 = 0;
        }
        v6 = v88;

        v20 = v65;
        v7 = v89;
        goto LABEL_28;
      }
      v67 = objc_opt_class(HAPUUIDWrapper, v58);
      if ((objc_opt_isKindOfClass(v15, v67) & 1) == 0)
        goto LABEL_38;
      v18 = v15;
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parseResponseForUUID:", objc_msgSend(v18, "tlvid")));
      if (v20)
      {
LABEL_36:
        objc_msgSend(v18, "setField:", v20);
        goto LABEL_37;
      }
      v75 = sub_10007CCE4(0, v68);
      v22 = objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v76 = sub_10007CD2C(0);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v76);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
        v77 = objc_msgSend(v18, "tlvid");
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVBase tlvDatablob](v87, "tlvDatablob"));
        *(_DWORD *)buf = 138544130;
        v96 = v33;
        v97 = 2112;
        v98 = v34;
        v99 = 2048;
        v100 = v77;
        v101 = 2112;
        v102 = v36;
        v37 = v22;
        v38 = "%{public}@Failed to parse UUID for tlv: %@ with ID: %tu (%@)";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, v38, buf, 0x2Au);

        v7 = v89;
        v6 = v88;
      }
LABEL_27:

      v11 = 0;
LABEL_28:
      v12 = &OBJC_IVAR___HAPAccessory__identifier;
LABEL_37:

LABEL_38:
      v14 = (char *)v14 + 1;
    }
    while (v10 != v14);
    v83 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
    v10 = v83;
  }
  while (v83);
LABEL_53:

  return v11 & 1;
}

- (BOOL)_parseMandatory:(id)a3 optional:(id)a4
{
  id v6;

  v6 = a4;
  LOBYTE(a3) = -[HAPTLVBase _parseFields:](self, "_parseFields:", a3);
  -[HAPTLVBase _parseFields:](self, "_parseFields:", v6);

  return (char)a3;
}

- (id)_parseArray:(id)a3 result:(id *)a4 objectCreator:(id)a5
{
  id v6;
  uint64_t (**v7)(id, _QWORD);
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = (uint64_t (**)(id, _QWORD))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v9);
      v14 = v7[2](v7, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13));
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (!v15)
        break;
      v16 = (void *)v15;
      objc_msgSend(v8, "addObject:", v15, (_QWORD)v19);

      if (v11 == (id)++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  v17 = objc_msgSend(v8, "copy");
  return v17;
}

- (NSData)tlvDatablob
{
  return self->_tlvDatablob;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlvDatablob, 0);
}

@end
