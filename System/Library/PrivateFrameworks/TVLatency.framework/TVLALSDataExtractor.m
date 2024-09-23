@implementation TVLALSDataExtractor

- (TVLALSDataExtractor)init
{
  TVLALSDataExtractor *v2;
  NSMutableArray *v3;
  NSMutableArray *results;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVLALSDataExtractor;
  v2 = -[TVLALSDataExtractor init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    results = v2->_results;
    v2->_results = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  _UnregisterHIDSystemClient(self);
  v3.receiver = self;
  v3.super_class = (Class)TVLALSDataExtractor;
  -[TVLALSDataExtractor dealloc](&v3, sel_dealloc);
}

+ (id)extractALSCalibrationData
{
  const __CFData *v3;
  CFIndex Length;
  NSObject *v5;
  CFDataRef v6;
  const __CFData *v7;
  CFIndex v8;
  NSObject *v9;
  TVLALSCalibrationData *v10;
  void *v11;
  NSObject *v12;
  const UInt8 *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  unint64_t v23;
  int v24;
  const UInt8 *v25;
  id v26;
  const UInt8 *v27;
  uint64_t v28;
  unsigned int v29;
  void *v30;
  void *v31;
  NSObject *v32;
  const UInt8 *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  int v42;
  unint64_t v43;
  int v44;
  const UInt8 *v45;
  id v46;
  const UInt8 *v47;
  uint64_t v48;
  unsigned int v49;
  void *v50;
  void *v51;
  void *v52;
  TVLALSCalibrationData *v53;
  NSObject *v54;
  const UInt8 *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  int v64;
  unint64_t v65;
  int v66;
  const UInt8 *v67;
  id v68;
  const UInt8 *v69;
  uint64_t v70;
  unsigned int v71;
  void *v72;
  void *v73;
  NSObject *v74;
  const UInt8 *BytePtr;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  int v83;
  int v84;
  unint64_t v85;
  int v86;
  const UInt8 *v87;
  id v88;
  const UInt8 *v89;
  uint64_t v90;
  unsigned int v91;
  void *v92;
  void *v93;
  NSObject *v94;
  NSObject *v95;
  const __CFData *v97;
  TVLALSCalibrationData *v98;
  unsigned __int8 *v99;
  unsigned __int8 *v100;
  unsigned __int8 *v101;
  id v102;
  uint8_t buf[4];
  CFIndex v104;
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v3 = (const __CFData *)AMFDRSealingMapCopyLocalDataForClass();
  Length = CFDataGetLength(v3);
  if (Length == 10440)
  {
    if (_TVLLogDefault_onceToken_2 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    v5 = _TVLLogDefault_log_2;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2AB000, v5, OS_LOG_TYPE_INFO, "Found HmClData_VD6287", buf, 2u);
    }
    CFDataGetBytePtr(v3);
    v6 = convertNighthawkHmClv1Tov3();
    if (v6)
    {
      v7 = v6;
      CFRelease(v3);
      v8 = CFDataGetLength(v7);
      if (_TVLLogDefault_onceToken_2 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
      v9 = _TVLLogDefault_log_2;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v104 = v8;
        _os_log_impl(&dword_21F2AB000, v9, OS_LOG_TYPE_INFO, "FDR calibration data converted from v1 to v3. New size = %ld\n", buf, 0xCu);
      }
      v3 = v7;
    }
    else
    {
      v8 = 10440;
    }
  }
  else
  {
    v8 = Length;
  }
  v10 = objc_alloc_init(TVLALSCalibrationData);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "_displayID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setDisplayID:](v10, "setDisplayID:", v11);

  if (v8 > 10235)
  {
    if (v8 == 10348)
    {
      if (_TVLLogDefault_onceToken_2 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
      v74 = _TVLLogDefault_log_2;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2AB000, v74, OS_LOG_TYPE_INFO, "Found HmClData_VD6287_v3", buf, 2u);
      }
      BytePtr = CFDataGetBytePtr(v3);
      if (isInternalBuild_onceToken != -1)
        dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_46);
      if (isInternalBuild_internalBuild)
      {
        if (_TVLLogDefault_onceToken_2 != -1)
          dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
        print_HmCl_VD6287_v3((uint64_t)BytePtr, (os_log_t)_TVLLogDefault_log_2);
      }
      if (BytePtr[10] != 2)
      {
        if (_TVLLogDefault_onceToken_2 != -1)
          dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
        if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR))
          +[TVLALSDataExtractor extractALSCalibrationData].cold.4();
        goto LABEL_130;
      }
      if (BytePtr[5214] != 1)
      {
        if (_TVLLogDefault_onceToken_2 != -1)
          dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
        if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR))
          +[TVLALSDataExtractor extractALSCalibrationData].cold.3();
        goto LABEL_130;
      }
      v101 = (unsigned __int8 *)(BytePtr + 5218);
      if (BytePtr[5218] == 5)
      {
        -[TVLALSCalibrationData setVersion:](v10, "setVersion:", &unk_24E3EEAB0);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", BytePtr[5218]);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLALSCalibrationData setChannels:](v10, "setChannels:", v76);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned __int16 *)(BytePtr + 5443));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLALSCalibrationData setWavelengthStartVisible:](v10, "setWavelengthStartVisible:", v77);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned __int16 *)(BytePtr + 5445));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLALSCalibrationData setWavelengthStartNIR:](v10, "setWavelengthStartNIR:", v78);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned __int16 *)(BytePtr + 5447));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLALSCalibrationData setWavelengthEnd:](v10, "setWavelengthEnd:", v79);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", BytePtr[5449]);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLALSCalibrationData setWavelengthStep:](v10, "setWavelengthStep:", v80);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(BytePtr + 5415));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLALSCalibrationData setNormalizationFactor:](v10, "setNormalizationFactor:", v81);

        v82 = *(unsigned __int16 *)(BytePtr + 5447);
        v83 = *(unsigned __int16 *)(BytePtr + 5443);
        v84 = BytePtr[5449];
        v102 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if (!BytePtr[5218])
          goto LABEL_50;
        v97 = v3;
        v98 = v10;
        v85 = 0;
        v86 = (~v83 + v82 + v84) / v84;
        v87 = BytePtr + 5452;
        do
        {
          v88 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v89 = v87;
          v90 = (v86 & ~(v86 >> 31)) + 1;
          if ((v86 & 0x80000000) == 0)
          {
            do
            {
              v91 = *(__int16 *)v89;
              v89 += 2;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v91);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "addObject:", v92);

              --v90;
            }
            while (v90);
          }
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v88);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "addObject:", v93);

          ++v85;
          v87 += 802;
        }
        while (v85 < *v101);
        goto LABEL_49;
      }
      _TVLLogDefault();
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        +[TVLALSDataExtractor extractALSCalibrationData].cold.2();
      goto LABEL_129;
    }
    if (v8 == 10236)
    {
      if (_TVLLogDefault_onceToken_2 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
      v32 = _TVLLogDefault_log_2;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2AB000, v32, OS_LOG_TYPE_INFO, "Found HmClData", buf, 2u);
      }
      v33 = CFDataGetBytePtr(v3);
      if (isInternalBuild_onceToken != -1)
        dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_46);
      if (isInternalBuild_internalBuild)
      {
        if (_TVLLogDefault_onceToken_2 != -1)
          dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
        print_HmClData((uint64_t)v33, (os_log_t)_TVLLogDefault_log_2);
      }
      -[TVLALSCalibrationData setVersion:](v10, "setVersion:", &unk_24E3EEA98);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v33[80]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVLALSCalibrationData setChannels:](v10, "setChannels:", v34);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned __int16 *)v33 + 168));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVLALSCalibrationData setWavelengthStartVisible:](v10, "setWavelengthStartVisible:", v35);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned __int16 *)v33 + 169));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVLALSCalibrationData setWavelengthStartNIR:](v10, "setWavelengthStartNIR:", v36);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned __int16 *)v33 + 170));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVLALSCalibrationData setWavelengthEnd:](v10, "setWavelengthEnd:", v37);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v33[342]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVLALSCalibrationData setWavelengthStep:](v10, "setWavelengthStep:", v38);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v33 + 74));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVLALSCalibrationData setNormalizationFactor:](v10, "setNormalizationFactor:", v39);

      v40 = *((unsigned __int16 *)v33 + 170);
      v41 = *((unsigned __int16 *)v33 + 168);
      v42 = v33[342];
      v102 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (!v33[80])
        goto LABEL_50;
      v97 = v3;
      v98 = v10;
      v43 = 0;
      v44 = (~v41 + v40 + v42) / v42;
      v45 = v33 + 344;
      do
      {
        v46 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v47 = v45;
        v48 = (v44 & ~(v44 >> 31)) + 1;
        if ((v44 & 0x80000000) == 0)
        {
          do
          {
            v49 = *(__int16 *)v47;
            v47 += 2;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addObject:", v50);

            --v48;
          }
          while (v48);
        }
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v46);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "addObject:", v51);

        ++v43;
        v45 += 802;
      }
      while (v43 < v33[80]);
      goto LABEL_49;
    }
    goto LABEL_87;
  }
  if (v8 == 8672)
  {
    if (_TVLLogDefault_onceToken_2 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    v54 = _TVLLogDefault_log_2;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2AB000, v54, OS_LOG_TYPE_INFO, "Found HmClData_VD6287_v4", buf, 2u);
    }
    v55 = CFDataGetBytePtr(v3);
    if (strncmp((const char *)v55, "lCmH", 5uLL))
    {
      if (v55[4] == 4)
      {
        if (v55[10] == 2)
        {
          if (v55[4376] == 1)
          {
            v100 = (unsigned __int8 *)(v55 + 4380);
            if (v55[4380] == 5)
            {
              -[TVLALSCalibrationData setVersion:](v10, "setVersion:", &unk_24E3EEAB0);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v55[4380]);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              -[TVLALSCalibrationData setChannels:](v10, "setChannels:", v56);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned __int16 *)(v55 + 4571));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              -[TVLALSCalibrationData setWavelengthStartVisible:](v10, "setWavelengthStartVisible:", v57);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned __int16 *)(v55 + 4573));
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              -[TVLALSCalibrationData setWavelengthStartNIR:](v10, "setWavelengthStartNIR:", v58);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned __int16 *)(v55 + 4575));
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              -[TVLALSCalibrationData setWavelengthEnd:](v10, "setWavelengthEnd:", v59);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v55[4577]);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              -[TVLALSCalibrationData setWavelengthStep:](v10, "setWavelengthStep:", v60);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v55 + 4547));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              -[TVLALSCalibrationData setNormalizationFactor:](v10, "setNormalizationFactor:", v61);

              v62 = *(unsigned __int16 *)(v55 + 4575);
              v63 = *(unsigned __int16 *)(v55 + 4571);
              v64 = v55[4577];
              v102 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              if (!v55[4380])
                goto LABEL_50;
              v97 = v3;
              v98 = v10;
              v65 = 0;
              v66 = (~v63 + v62 + v64) / v64;
              v67 = v55 + 4578;
              do
              {
                v68 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                v69 = v67;
                v70 = (v66 & ~(v66 >> 31)) + 1;
                if ((v66 & 0x80000000) == 0)
                {
                  do
                  {
                    v71 = *(__int16 *)v69;
                    v69 += 2;
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v71);
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v68, "addObject:", v72);

                    --v70;
                  }
                  while (v70);
                }
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v68);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v102, "addObject:", v73);

                ++v65;
                v67 += 802;
              }
              while (v65 < *v100);
              goto LABEL_49;
            }
            _TVLLogDefault();
            v95 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              goto LABEL_129;
            goto LABEL_128;
          }
          _TVLLogDefault();
          v95 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
LABEL_129:

            goto LABEL_130;
          }
LABEL_122:
          +[TVLALSDataExtractor extractALSCalibrationData].cold.3();
          goto LABEL_129;
        }
        _TVLLogDefault();
        v95 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          goto LABEL_129;
LABEL_116:
        +[TVLALSDataExtractor extractALSCalibrationData].cold.4();
        goto LABEL_129;
      }
      if (_TVLLogDefault_onceToken_2 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
      if (!os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR))
        goto LABEL_130;
      goto LABEL_106;
    }
    if (_TVLLogDefault_onceToken_2 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    if (!os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR))
      goto LABEL_130;
LABEL_98:
    +[TVLALSDataExtractor extractALSCalibrationData].cold.5();
LABEL_130:
    v53 = 0;
    goto LABEL_131;
  }
  if (v8 != 8760)
  {
LABEL_87:
    if (_TVLLogDefault_onceToken_2 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    v94 = _TVLLogDefault_log_2;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_FAULT))
      +[TVLALSDataExtractor extractALSCalibrationData].cold.1(v8, v94);
    goto LABEL_130;
  }
  if (_TVLLogDefault_onceToken_2 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
  v12 = _TVLLogDefault_log_2;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2AB000, v12, OS_LOG_TYPE_INFO, "Found HmClData_VD6287_v4_od", buf, 2u);
  }
  v13 = CFDataGetBytePtr(v3);
  if (!strncmp((const char *)v13, "lCmH", 5uLL))
  {
    if (_TVLLogDefault_onceToken_2 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    if (!os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR))
      goto LABEL_130;
    goto LABEL_98;
  }
  if (v13[4] != 4)
  {
    if (_TVLLogDefault_onceToken_2 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    if (!os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR))
      goto LABEL_130;
LABEL_106:
    +[TVLALSDataExtractor extractALSCalibrationData].cold.9();
    goto LABEL_130;
  }
  if (v13[10] != 2)
  {
    _TVLLogDefault();
    v95 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      goto LABEL_129;
    goto LABEL_116;
  }
  if (v13[4420] != 1)
  {
    _TVLLogDefault();
    v95 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      goto LABEL_129;
    goto LABEL_122;
  }
  v99 = (unsigned __int8 *)(v13 + 4424);
  if (v13[4424] != 5)
  {
    _TVLLogDefault();
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
LABEL_128:
      +[TVLALSDataExtractor extractALSCalibrationData].cold.6();
      goto LABEL_129;
    }
    goto LABEL_129;
  }
  -[TVLALSCalibrationData setVersion:](v10, "setVersion:", &unk_24E3EEAB0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13[4424]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setChannels:](v10, "setChannels:", v14);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned __int16 *)(v13 + 4657));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setWavelengthStartVisible:](v10, "setWavelengthStartVisible:", v15);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned __int16 *)(v13 + 4659));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setWavelengthStartNIR:](v10, "setWavelengthStartNIR:", v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned __int16 *)(v13 + 4661));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setWavelengthEnd:](v10, "setWavelengthEnd:", v17);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13[4663]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setWavelengthStep:](v10, "setWavelengthStep:", v18);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v13 + 4591));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setNormalizationFactor:](v10, "setNormalizationFactor:", v19);

  v20 = *(unsigned __int16 *)(v13 + 4661);
  v21 = *(unsigned __int16 *)(v13 + 4657);
  v22 = v13[4663];
  v102 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v13[4424])
  {
    v97 = v3;
    v98 = v10;
    v23 = 0;
    v24 = (~v21 + v20 + v22) / v22;
    v25 = v13 + 4664;
    do
    {
      v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v27 = v25;
      v28 = (v24 & ~(v24 >> 31)) + 1;
      if ((v24 & 0x80000000) == 0)
      {
        do
        {
          v29 = *(__int16 *)v27;
          v27 += 2;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v30);

          --v28;
        }
        while (v28);
      }
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v26);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "addObject:", v31);

      ++v23;
      v25 += 802;
    }
    while (v23 < *v99);
LABEL_49:
    v3 = v97;
    v10 = v98;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v102);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSCalibrationData setSpectrumNom:](v10, "setSpectrumNom:", v52);

  if (v3)
    CFRelease(v3);
  v53 = v10;
LABEL_131:

  return v53;
}

+ (unsigned)_displayID
{
  io_registry_entry_t v2;
  io_object_t v3;
  const __CFData *v4;
  const __CFData *v5;
  mach_port_t mainPort[2];
  CFRange v8;

  *(_QWORD *)mainPort = 0;
  if (!IOMasterPort(0, mainPort))
  {
    v2 = IORegistryEntryFromPath(mainPort[0], "IODeviceTree:/arm-io/disp0");
    if (v2)
    {
      v3 = v2;
      v4 = (const __CFData *)IORegistryEntrySearchCFProperty(v2, "IODeviceTree", CFSTR("color-accuracy-index"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 1u);
      if (v4)
      {
        v5 = v4;
        v8.location = 0;
        v8.length = 4;
        CFDataGetBytes(v4, v8, (UInt8 *)&mainPort[1]);
        CFRelease(v5);
      }
      IOObjectRelease(v3);
    }
    if (mainPort[0])
      mach_port_deallocate(*MEMORY[0x24BDAEC58], mainPort[0]);
  }
  return mainPort[1];
}

+ (void)extractALSData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__TVLALSDataExtractor_extractALSData___block_invoke;
  v6[3] = &unk_24E3E9790;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "extract:ALSReadings:", 1, v6);

}

void __38__TVLALSDataExtractor_extractALSData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

+ (void)extract:(unint64_t)a3 ALSReadings:(id)a4
{
  id v5;
  TVLALSDataExtractor *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id completion;
  TVLALSDataExtractor *v11;
  void *v12;
  double v13;
  TVLALSDataExtractor *v14;
  uint64_t v15;
  NSTimer *timer;
  void *v17;
  TVLALSDataExtractor *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  TVLALSDataExtractor *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id location;
  uint8_t buf[16];

  v5 = a4;
  v6 = objc_alloc_init(TVLALSDataExtractor);
  -[NSTimer invalidate](v6->_timer, "invalidate");
  v6->_readCount = a3;
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke;
  v26[3] = &unk_24E3E97E0;
  objc_copyWeak(&v28, &location);
  v8 = v5;
  v27 = v8;
  v9 = MEMORY[0x2207C5BC0](v26);
  completion = v6->_completion;
  v6->_completion = (id)v9;

  v11 = v6;
  v12 = (void *)MEMORY[0x24BDBCF40];
  v13 = (double)v6->_readCount * 1.5;
  v21 = v7;
  v22 = 3221225472;
  v23 = __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke_3;
  v24 = &unk_24E3E9808;
  v14 = v11;
  v25 = v14;
  objc_msgSend(v12, "timerWithTimeInterval:repeats:block:", 0, &v21, v13);
  v15 = objc_claimAutoreleasedReturnValue();
  timer = v6->_timer;
  v6->_timer = (NSTimer *)v15;

  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop", v21, v22, v23, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTimer:forMode:", v6->_timer, *MEMORY[0x24BDBCB80]);

  v18 = v14;
  if (!v18->_ioHIDSystemClient)
  {
    if (_TVLLogDefault_onceToken_2 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    v19 = _TVLLogDefault_log_2;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2AB000, v19, OS_LOG_TYPE_INFO, "ScheduleHIDEventSystemClient", buf, 2u);
    }
    v20 = IOHIDEventSystemClientCreateWithType();
    IOHIDEventSystemClientRegisterEventCallback();
    CFRunLoopGetMain();
    IOHIDEventSystemClientScheduleWithRunLoop();
    v18->_ioHIDSystemClient = (__IOHIDEventSystemClient *)v20;
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    _UnregisterHIDSystemClient(WeakRetained);
    objc_msgSend(v5[5], "invalidate");
    v6 = v5[5];
    v5[5] = 0;

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke_2;
  v9[3] = &unk_24E3E97B8;
  v7 = *(id *)(a1 + 32);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (_TVLLogDefault_onceToken_2 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR))
    __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke_3_cold_1();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_completion, 0);
}

+ (void)extractALSCalibrationData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_21F2AB000, v0, v1, "Calibration version_major=%u, expected=%u\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21F2AB000, v0, v1, "TVLALSDataExtractor timed out to receive HID events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
