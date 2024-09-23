@implementation STSConnectionHandover

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t majorVersion;
  const char *v5;
  const char *v6;
  const char *v7;
  id v8;

  majorVersion = self->_majorVersion;
  v8 = a3;
  objc_msgSend_encodeInteger_forKey_(v8, v5, majorVersion, CFSTR("majorVersion"));
  objc_msgSend_encodeInteger_forKey_(v8, v6, self->_minorVersion, CFSTR("minorVersion"));
  objc_msgSend_encodeObject_forKey_(v8, v7, (uint64_t)self->_alternativeCarriers, CFSTR("alternativeCarriers"));

}

- (STSConnectionHandover)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  STSConnectionHandover *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSMutableArray *alternativeCarriers;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)STSConnectionHandover;
  v6 = -[STSConnectionHandover init](&v20, sel_init);
  if (v6)
  {
    v6->_majorVersion = (int)objc_msgSend_decodeIntForKey_(v4, v5, (uint64_t)CFSTR("majorVersion"));
    v6->_minorVersion = (int)objc_msgSend_decodeIntForKey_(v4, v7, (uint64_t)CFSTR("minorVersion"));
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend_setWithObjects_(v8, v14, v9, v10, v11, v12, v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v15, CFSTR("alternativeCarriers"));
    v17 = objc_claimAutoreleasedReturnValue();
    alternativeCarriers = v6->_alternativeCarriers;
    v6->_alternativeCarriers = (NSMutableArray *)v17;

  }
  return v6;
}

- (STSConnectionHandover)init
{
  STSConnectionHandover *v2;
  NSMutableArray *v3;
  NSMutableArray *alternativeCarriers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSConnectionHandover;
  v2 = -[STSConnectionHandover init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    alternativeCarriers = v2->_alternativeCarriers;
    v2->_alternativeCarriers = v3;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  STSConnectionHandover *v4;
  STSConnectionHandover *v5;
  STSConnectionHandover *v6;
  unint64_t majorVersion;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  unint64_t minorVersion;
  NSMutableArray *alternativeCarriers;
  void *v14;
  const char *v15;
  char isEqualToArray;

  v4 = (STSConnectionHandover *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToArray = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    majorVersion = self->_majorVersion;
    if (majorVersion == objc_msgSend_majorVersion(v6, v8, v9)
      || (minorVersion = self->_minorVersion, minorVersion == objc_msgSend_minorVersion(v6, v10, v11)))
    {
      alternativeCarriers = self->_alternativeCarriers;
      objc_msgSend_alternativeCarriers(v6, v10, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToArray = objc_msgSend_isEqualToArray_(alternativeCarriers, v15, (uint64_t)v14);

    }
    else
    {
      isEqualToArray = 0;
    }

  }
  else
  {
    isEqualToArray = 0;
  }

  return isEqualToArray;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("majorVersion=%lu, minorVersion=%lu, ac=%@"), self->_majorVersion, self->_minorVersion, self->_alternativeCarriers);
}

- (NSArray)alternativeCarriers
{
  return (NSArray *)MEMORY[0x24BEDD108](MEMORY[0x24BDBCE30], sel_arrayWithArray_, self->_alternativeCarriers);
}

- (void)addAlternativeCarrier:(id)a3
{
  if (a3)
    objc_msgSend_addObject_(self->_alternativeCarriers, a2, (uint64_t)a3);
}

+ (id)connectionHandoverWithData:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v12;

  objc_msgSend_ndefRecordsWithData_(STSNDEFRecord, a2, (uint64_t)a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4;
  if (v4)
  {
    sub_20A02B230(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSConnectionHandover connectionHandoverWithData:]", 154, CFSTR("NDEF:%@"), v5, v6, v7, v4);
    objc_msgSend__connectionHandoverWithNdefMessage_(a1, v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sub_20A02B230(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[STSConnectionHandover connectionHandoverWithData:]", 148, CFSTR("Not a valid NDEF message"), v5, v6, v7, v12);
    v10 = 0;
  }

  return v10;
}

+ (id)_connectionHandoverWithNdefMessage:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;
  unsigned int v17;
  id v18;
  uint64_t v19;
  void *v20;
  int isHandoverSelectRecord;
  const char *v22;
  uint64_t v23;
  int isHandoverRequestRecord;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  unsigned __int8 *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  int v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  id v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  id v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  unsigned int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  STSConnectionHandover *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  uint64_t i;
  void *v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t j;
  const char *v136;
  void *v137;
  STSCHNdefRecordBundle *v138;
  const char *v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  char isWiFiAwareConfigurationRecord;
  const char *v144;
  uint64_t v145;
  __objc2_class **v146;
  char isBluetoothLEConfigurationRecord;
  uint64_t v148;
  int isNfcConfigurationRecord;
  void *v150;
  const char *v151;
  uint64_t v153;
  id v154;
  id v155;
  id v156;
  STSConnectionHandover *v157;
  id obj;
  void *v159;
  unsigned __int8 v160;
  unsigned int v161;
  uint64_t v162;
  BOOL v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  uint64_t v189;

  v189 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v6, v7);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = 0u;
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  v11 = v3;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v181, v188, 16);
  if (v13)
  {
    v16 = (id)v13;
    obj = v11;
    v160 = 0;
    LOBYTE(v17) = 0;
    v168 = 0;
    v163 = 0;
    v18 = *(id *)v182;
    v154 = *(id *)v182;
    while (1)
    {
      v19 = 0;
      v156 = v16;
      do
      {
        if (*(id *)v182 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * v19);
        isHandoverSelectRecord = objc_msgSend_isHandoverSelectRecord(v20, v14, v15);
        isHandoverRequestRecord = objc_msgSend_isHandoverRequestRecord(v20, v22, v23);
        v165 = v19;
        if ((isHandoverSelectRecord & 1) != 0 || isHandoverRequestRecord)
        {
          if (v163)
          {
            sub_20A02B230(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 174, CFSTR("Previous Hr/Hs found.  Invalid handover NDEF"), v27, v28, v29, v153);
            v11 = obj;

            goto LABEL_70;
          }
          objc_msgSend_payload(v20, v25, v26);
          v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v52 = (unsigned __int8 *)objc_msgSend_bytes(v49, v50, v51);

          objc_msgSend_payload(v20, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend_length(v55, v56, v57);

          v161 = *v52;
          objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v59, (uint64_t)(v52 + 1), (v58 - 1));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ndefRecordsWithData_(STSNDEFRecord, v61, (uint64_t)v60);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v65 = objc_msgSend_count(v62, v63, v64);
          v163 = v65 != 0;
          if (!v65)
            sub_20A02B230(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 193, CFSTR("Missing local records in Hr/Hs record"), v66, v67, v68, v153);
          v179 = 0u;
          v180 = 0u;
          v177 = 0u;
          v178 = 0u;
          v69 = v62;
          v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v177, v187, 16);
          if (v71)
          {
            v74 = v71;
            v75 = *(_QWORD *)v178;
            do
            {
              v76 = 0;
              do
              {
                if (*(_QWORD *)v178 != v75)
                  objc_enumerationMutation(v69);
                v77 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * v76);
                if (objc_msgSend_typeNameFormat(v77, v72, v73) == 1)
                {
                  if ((objc_msgSend_isCollisionResolutionRecord(v77, v78, v79) & 1) == 0)
                  {
                    if (objc_msgSend_isAlternativeCarrierRecord(v77, v72, v73))
                    {
                      objc_msgSend_addObject_(v167, v80, (uint64_t)v77);
                    }
                    else if ((objc_msgSend_isHandoverSelectErrorRecord(v77, v80, v81) & isHandoverSelectRecord) == 1)
                    {
                      v86 = v77;

                      v168 = v86;
                    }
                    else
                    {
                      v87 = objc_alloc(MEMORY[0x24BDD17C8]);
                      objc_msgSend_type(v77, v88, v89);
                      v90 = (void *)objc_claimAutoreleasedReturnValue();
                      v92 = (void *)objc_msgSend_initWithData_encoding_(v87, v91, (uint64_t)v90, 4);

                      sub_20A02B230(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 211, CFSTR("Unsupported type:%@"), v93, v94, v95, (uint64_t)v92);
                    }
                  }
                }
                else
                {
                  v82 = objc_msgSend_typeNameFormat(v77, v78, v79);
                  sub_20A02B230(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 200, CFSTR("Unsupported record TNF:%d"), v83, v84, v85, v82);
                }
                ++v76;
              }
              while (v74 != v76);
              v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v72, (uint64_t)&v177, v187, 16);
              v74 = v96;
            }
            while (v96);
          }
          v17 = v161 >> 4;
          v160 = v161 & 0xF;

          v18 = v154;
          v16 = v156;
        }
        else
        {
          if ((objc_msgSend_isWiFiAwareConfigurationRecord(v20, v25, v26) & 1) == 0
            && (objc_msgSend_isBluetoothLEConfigurationRecord(v20, v30, v31) & 1) == 0
            && !objc_msgSend_isNfcConfigurationRecord(v20, v30, v31))
          {
            objc_msgSend_identifier(v20, v30, v31);
            v97 = (void *)objc_claimAutoreleasedReturnValue();

            if (v97)
            {
              objc_msgSend_identifier(v20, v98, v99);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKey_(v10, v100, (uint64_t)v20, v47);
            }
            else
            {
              v101 = objc_alloc(MEMORY[0x24BDD17C8]);
              objc_msgSend_type(v20, v102, v103);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = (void *)objc_msgSend_initWithData_encoding_(v101, v105, (uint64_t)v104, 4);

              v108 = objc_msgSend_typeNameFormat(v20, v106, v107);
              sub_20A02B230(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 229, CFSTR("Unsupported record TNF=%d,type=%@,id=nil"), v109, v110, v111, v108);
            }
LABEL_15:

            goto LABEL_37;
          }
          objc_msgSend_identifier(v20, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend_identifier(v20, v33, v34);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v159, v39, (uint64_t)v38);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (v40)
            {
              objc_msgSend_identifier(v20, v41, v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              sub_20A02B230(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 219, CFSTR("Carrier config %@ exists"), v44, v45, v46, (uint64_t)v43);

            }
            objc_msgSend_identifier(v20, v41, v42);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v159, v48, (uint64_t)v20, v47);
            goto LABEL_15;
          }
          sub_20A02B230(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 223, CFSTR("Missing ID"), v35, v36, v37, v153);
        }
LABEL_37:
        v19 = v165 + 1;
      }
      while ((id)(v165 + 1) != v16);
      v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v181, v188, 16);
      v16 = (id)v112;
      if (!v112)
      {
        v11 = obj;

        if (!v163)
          goto LABEL_69;
        v116 = objc_alloc_init(STSConnectionHandover);
        v116->_majorVersion = v17;
        v116->_minorVersion = v160;
        v157 = v116;
        v173 = 0u;
        v174 = 0u;
        v175 = 0u;
        v176 = 0u;
        v155 = v167;
        v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v155, v117, (uint64_t)&v173, v186, 16);
        if (v164)
        {
          v162 = *(_QWORD *)v174;
          do
          {
            for (i = 0; i != v164; ++i)
            {
              if (*(_QWORD *)v174 != v162)
                objc_enumerationMutation(v155);
              v121 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * i);
              objc_msgSend_getCarrierDataReferenceFromAlternativeCarrierRecord(v121, v118, v119);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              if (v123)
              {
                objc_msgSend_objectForKeyedSubscript_(v159, v122, (uint64_t)v123);
                v166 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_array(MEMORY[0x24BDBCEB8], v124, v125);
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_getAuxiliaryDataReferencesFromAlternativeCarrierRecord(v121, v127, v128);
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                v169 = 0u;
                v170 = 0u;
                v171 = 0u;
                v172 = 0u;
                v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(v129, v130, (uint64_t)&v169, v185, 16);
                if (v131)
                {
                  v133 = v131;
                  v134 = *(_QWORD *)v170;
                  do
                  {
                    for (j = 0; j != v133; ++j)
                    {
                      if (*(_QWORD *)v170 != v134)
                        objc_enumerationMutation(v129);
                      objc_msgSend_objectForKeyedSubscript_(v10, v132, *(_QWORD *)(*((_QWORD *)&v169 + 1) + 8 * j));
                      v137 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v137)
                        objc_msgSend_addObject_(v126, v136, (uint64_t)v137);

                    }
                    v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v129, v132, (uint64_t)&v169, v185, 16);
                  }
                  while (v133);
                }
                v138 = [STSCHNdefRecordBundle alloc];
                v140 = (void *)objc_msgSend_initWithAlternativeRecord_configurationRecord_auxiliaryRecords_errorRecord_(v138, v139, (uint64_t)v121, v166, v126, v168);
                isWiFiAwareConfigurationRecord = objc_msgSend_isWiFiAwareConfigurationRecord(v166, v141, v142);
                v146 = off_24C2B2DC0;
                if ((isWiFiAwareConfigurationRecord & 1) != 0
                  || (isBluetoothLEConfigurationRecord = objc_msgSend_isBluetoothLEConfigurationRecord(v166, v144, v145),
                      v146 = off_24C2B2DA8,
                      (isBluetoothLEConfigurationRecord & 1) != 0)
                  || (isNfcConfigurationRecord = objc_msgSend_isNfcConfigurationRecord(v166, v144, v148),
                      v146 = off_24C2B2DB8,
                      isNfcConfigurationRecord))
                {
                  objc_msgSend_connectionHandoverAlternativeCarrierWithBundle_(*v146, v144, (uint64_t)v140);
                  v150 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_addAlternativeCarrier_(v157, v151, (uint64_t)v150);

                }
              }

            }
            v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v155, v118, (uint64_t)&v173, v186, 16);
          }
          while (v164);
        }

        v11 = obj;
        goto LABEL_71;
      }
    }
  }

  v168 = 0;
LABEL_69:
  sub_20A02B230(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 234, CFSTR("No Hr record found"), v113, v114, v115, v153);
LABEL_70:
  v157 = 0;
LABEL_71:

  return v157;
}

+ (id)requestWithAlternativeCarriers:(id)a3
{
  return (id)MEMORY[0x24BEDD108](a1, sel__createNdefWithType_alternativeCarriers_errorRecord_, 0);
}

+ (id)selectWithAlternativeCarriers:(id)a3 error:(id)a4
{
  return (id)MEMORY[0x24BEDD108](a1, sel__createNdefWithType_alternativeCarriers_errorRecord_, 1);
}

+ (id)_createNdefWithType:(int64_t)a3 alternativeCarriers:(id)a4 errorRecord:(id)a5
{
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  STSNDEFRecord *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  void *v49;
  const char *v50;
  STSNDEFRecord *v51;
  const char *v52;
  void *v53;
  void *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  void *v58;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE __buf[2];
  char v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v61 = a5;
  if (a3)
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v8, (uint64_t)"Hs", 2);
  else
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v8, (uint64_t)"Hr", 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 21;
  objc_msgSend_data(MEMORY[0x24BDBCEC8], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendBytes_length_(v11, v12, (uint64_t)&v67, 1);
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    arc4random_buf(__buf, 2uLL);
    v19 = [STSNDEFRecord alloc];
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v20, (uint64_t)"cr", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v22, (uint64_t)__buf, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend_initWithFormat_type_identifier_payload_(v19, v24, 209, v21, 0, v23);

    objc_msgSend_addObject_(v15, v26, (uint64_t)v25);
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v27 = v7;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v62, v68, 16);
  if (v29)
  {
    v32 = v29;
    v33 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v63 != v33)
          objc_enumerationMutation(v27);
        objc_msgSend_createNdefRecordBundle(*(void **)(*((_QWORD *)&v62 + 1) + 8 * i), v30, v31);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_alternativeRecord(v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v15, v39, (uint64_t)v38);

        objc_msgSend_configurationRecord(v35, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v18, v43, (uint64_t)v42);

        objc_msgSend_auxiliaryRecords(v35, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v18, v47, (uint64_t)v46);

      }
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v62, v68, 16);
    }
    while (v32);
  }

  if (a3 == 1 && v61)
    objc_msgSend_addObject_(v15, v48, (uint64_t)v61);
  objc_msgSend_dataWithSTSNDEFRecords_(MEMORY[0x24BDBCE50], v48, (uint64_t)v15);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendData_(v11, v50, (uint64_t)v49);

  v51 = [STSNDEFRecord alloc];
  v53 = (void *)objc_msgSend_initWithFormat_type_identifier_payload_(v51, v52, 1, v60, 0, v11);
  v54 = (void *)objc_opt_new();
  objc_msgSend_addObject_(v54, v55, (uint64_t)v53);
  objc_msgSend_addObjectsFromArray_(v54, v56, (uint64_t)v18);
  objc_msgSend_dataWithSTSNDEFRecords_(MEMORY[0x24BDBCE50], v57, (uint64_t)v54);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  return v58;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeCarriers, 0);
}

@end
