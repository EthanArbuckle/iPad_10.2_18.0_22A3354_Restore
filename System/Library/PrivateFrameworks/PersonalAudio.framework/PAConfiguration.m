@implementation PAConfiguration

+ (PAConfiguration)configurationWithPreset:(id)a3 andAdjustments:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setPreset:", v6);

  objc_msgSend(v7, "setPresetAdjustments:", v5);
  return (PAConfiguration *)v7;
}

+ (id)configurationFromType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  switch(a3)
  {
    case 1uLL:
    case 2uLL:
      +[PAConfiguration configurationWithRawAdjustment:](PAConfiguration, "configurationWithRawAdjustment:", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    case 3uLL:
      v6 = 1;
      goto LABEL_12;
    case 4uLL:
      v6 = 1;
      goto LABEL_14;
    case 5uLL:
      v6 = 1;
      goto LABEL_16;
    case 6uLL:
      v6 = 2;
      goto LABEL_12;
    case 7uLL:
      v6 = 2;
      goto LABEL_14;
    case 8uLL:
      v6 = 2;
      goto LABEL_16;
    case 9uLL:
      v6 = 3;
LABEL_12:
      v7 = 1;
      goto LABEL_17;
    case 0xAuLL:
      v6 = 3;
LABEL_14:
      v7 = 2;
      goto LABEL_17;
    case 0xBuLL:
      v6 = 3;
LABEL_16:
      v7 = 3;
LABEL_17:
      +[PAConfiguration configurationWithLevel:andShape:](PAConfiguration, "configurationWithLevel:andShape:", v6, v7, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (PAConfiguration)configurationWithLevel:(unint64_t)a3 andShape:(unint64_t)a4
{
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
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  paBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Presets_Level_%lu_Shape_%lu"), a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:", v7, CFSTR("aupreset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  paBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Presets_SpeechMode_Level_%lu_Shape_%lu"), a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathForResource:ofType:", v10, CFSTR("aupreset"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v17 = CFSTR("PAPresetAdjustmentSpeechModeKey");
    v18[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(v12, "count"))
  {
    +[PAConfiguration configurationWithPreset:andAdjustments:](PAConfiguration, "configurationWithPreset:andAdjustments:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLevel:", a3);
    objc_msgSend(v15, "setShape:", a4);
  }
  else
  {
    v15 = 0;
  }

  return (PAConfiguration *)v15;
}

+ (PAConfiguration)configurationWithRawAdjustment:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  paBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("Presets_0_dB_gain"), CFSTR("aupreset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PAConfiguration configurationWithPreset:andAdjustments:](PAConfiguration, "configurationWithPreset:andAdjustments:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLevel:", 0);
  objc_msgSend(v7, "setShape:", a3);

  return (PAConfiguration *)v7;
}

+ (PAConfiguration)configurationWithAudiogram:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count") == 8)
  {
    +[PAConfiguration configurationWithMediaOffsets:andSpeechOffsets:](PAConfiguration, "configurationWithMediaOffsets:andSpeechOffsets:", v3, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping audiogram %@"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "+[PAConfiguration configurationWithAudiogram:]", 181, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v6);
      v9 = v7;
      *(_DWORD *)buf = 136446210;
      v12 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v4 = 0;
  }

  return (PAConfiguration *)v4;
}

+ (PAConfiguration)configurationWithMediaOffsets:(id)a3 andSpeechOffsets:(id)a4
{
  id v6;
  uint64_t v7;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _DWORD *v32;
  _DWORD *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
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
  int v73;
  void *v74;
  int v75;
  void *v76;
  int v77;
  void *v78;
  int v79;
  void *v80;
  int v81;
  void *v82;
  int v83;
  void *v84;
  int v85;
  void *v86;
  int v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  NSObject *v114;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  id v123;
  uint8_t buf[4];
  uint64_t v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v123 = a4;
  if (objc_msgSend(v6, "count") == 8 && objc_msgSend(v123, "count") == 8)
  {
    v120 = a1;
    +[PAConfiguration configurationWithLevel:andShape:](PAConfiguration, "configurationWithLevel:andShape:", 1, 1);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    paBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathForResource:ofType:", CFSTR("PresetValues"), CFSTR("plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("level"));
    v122 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1EA906098, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v13, "objectForKey:", CFSTR("shape"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1EA906098, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v14;
    v19 = (void *)v7;
    objc_msgSend(v18, "dictionaryWithDictionary:", v17);
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    paBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pathForResource:ofType:", CFSTR("PresetValuesSpeech"), CFSTR("plist"));
    v21 = objc_claimAutoreleasedReturnValue();

    v119 = (void *)v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v118 = v22;
    objc_msgSend(v22, "objectForKey:", CFSTR("level"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1EA906098, "stringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0C99E08];
    v117 = v25;
    objc_msgSend(v25, "objectForKey:", CFSTR("shape"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1EA906098, "stringValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKey:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dictionaryWithDictionary:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v116;
    v32 = (_DWORD *)objc_msgSend(v116, "settingsFromConfiguration:", 0);
    v33 = (_DWORD *)objc_msgSend(v116, "settingsFromConfiguration:", 1);
    +[PAAudiogramUtilities offsetsSortedByFrequency:](PAAudiogramUtilities, "offsetsSortedByFrequency:", v122);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[PAAudiogramUtilities offsetsSortedByFrequency:](PAAudiogramUtilities, "offsetsSortedByFrequency:", v123);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "floatValue");
      v32[32] = v37;
      *v32 = v37;

      objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "floatValue");
      v32[33] = v39;
      v32[1] = v39;

      objc_msgSend(v34, "objectAtIndexedSubscript:", 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "floatValue");
      v32[34] = v41;
      v32[2] = v41;

      objc_msgSend(v34, "objectAtIndexedSubscript:", 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "floatValue");
      v32[35] = v43;
      v32[3] = v43;

      objc_msgSend(v34, "objectAtIndexedSubscript:", 4);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "floatValue");
      v32[36] = v45;
      v32[4] = v45;

      objc_msgSend(v34, "objectAtIndexedSubscript:", 5);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "floatValue");
      v32[37] = v47;
      v32[5] = v47;

      objc_msgSend(v34, "objectAtIndexedSubscript:", 6);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "floatValue");
      v32[38] = v49;
      v32[6] = v49;

      objc_msgSend(v34, "objectAtIndexedSubscript:", 7);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "floatValue");
      v32[39] = v51;
      v32[7] = v51;

      v32[31] = 0;
      objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v52, CFSTR("leftLoss250_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v53, CFSTR("leftLoss500_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v54, CFSTR("leftLoss1000_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 3);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v55, CFSTR("leftLoss2000_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 4);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v56, CFSTR("leftLoss3000_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 5);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v57, CFSTR("leftLoss4000_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 6);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v58, CFSTR("leftLoss6000_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 7);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v59, CFSTR("leftLoss10000_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v60, CFSTR("rightLoss250_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v61, CFSTR("rightLoss500_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 2);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v62, CFSTR("rightLoss1000_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 3);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v63, CFSTR("rightLoss2000_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 4);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v64, CFSTR("rightLoss3000_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 5);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v65, CFSTR("rightLoss4000_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 6);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v66, CFSTR("rightLoss6000_dBHL"));

      objc_msgSend(v34, "objectAtIndexedSubscript:", 7);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKey:", v67, CFSTR("rightLoss10000_dBHL"));

      objc_msgSend(v19, "setObject:forKey:", v121, CFSTR("PAConfigPresetMediaKey"));
      v68 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v116, "preset");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "dictionaryWithDictionary:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v120, "dataFromPreset:", v32);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setValue:forKey:", v71, CFSTR("data"));

      objc_msgSend(v116, "setPreset:", v70);
      free(v32);

    }
    if (v33)
    {
      objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "floatValue");
      v33[32] = v73;
      *v33 = v73;

      objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "floatValue");
      v33[33] = v75;
      v33[1] = v75;

      objc_msgSend(v35, "objectAtIndexedSubscript:", 2);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "floatValue");
      v33[34] = v77;
      v33[2] = v77;

      objc_msgSend(v35, "objectAtIndexedSubscript:", 3);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "floatValue");
      v33[35] = v79;
      v33[3] = v79;

      objc_msgSend(v35, "objectAtIndexedSubscript:", 4);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "floatValue");
      v33[36] = v81;
      v33[4] = v81;

      objc_msgSend(v35, "objectAtIndexedSubscript:", 5);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "floatValue");
      v33[37] = v83;
      v33[5] = v83;

      objc_msgSend(v35, "objectAtIndexedSubscript:", 6);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "floatValue");
      v33[38] = v85;
      v33[6] = v85;

      objc_msgSend(v35, "objectAtIndexedSubscript:", 7);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "floatValue");
      v33[39] = v87;
      v33[7] = v87;

      v33[31] = 0;
      objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v88, CFSTR("leftLoss250_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v89, CFSTR("leftLoss500_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 2);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v90, CFSTR("leftLoss1000_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 3);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v91, CFSTR("leftLoss2000_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 4);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v92, CFSTR("leftLoss3000_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 5);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v93, CFSTR("leftLoss4000_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 6);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v94, CFSTR("leftLoss6000_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 7);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v95, CFSTR("leftLoss10000_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v96, CFSTR("rightLoss250_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v97, CFSTR("rightLoss500_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 2);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v98, CFSTR("rightLoss1000_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 3);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v99, CFSTR("rightLoss2000_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 4);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v100, CFSTR("rightLoss3000_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 5);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v101, CFSTR("rightLoss4000_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 6);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v102, CFSTR("rightLoss6000_dBHL"));

      objc_msgSend(v35, "objectAtIndexedSubscript:", 7);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v103, CFSTR("rightLoss10000_dBHL"));

      objc_msgSend(v19, "setObject:forKey:", v30, CFSTR("PAConfigPresetSpeechKey"));
      v104 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v116, "presetAdjustments");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "valueForKey:", CFSTR("PAPresetAdjustmentSpeechModeKey"));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "dictionaryWithDictionary:", v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v120, "dataFromPreset:", v33);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setValue:forKey:", v108, CFSTR("data"));

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v107, CFSTR("PAPresetAdjustmentSpeechModeKey"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "setPresetAdjustments:", v109);

      free(v33);
    }
    objc_msgSend(v116, "setAudiogramSettings:", v19);
    objc_msgSend(v116, "setShape:", 12);
    objc_msgSend(v116, "setLevel:", 12);

    v6 = v122;
  }
  else
  {
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping offsets %@ - %@"), v6, v123);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "+[PAConfiguration configurationWithMediaOffsets:andSpeechOffsets:]", 192, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v113 = objc_retainAutorelease(v111);
      v114 = v112;
      *(_DWORD *)buf = 136446210;
      v125 = objc_msgSend(v113, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v114, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v31 = 0;
  }

  return (PAConfiguration *)v31;
}

+ (PAConfiguration)configurationWithLeftMediaLoss:(id)a3 rightMediaLoss:(id)a4 leftSpeechLoss:(id)a5 andRightSpeechLoss:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v20;
  unint64_t v21;
  uint64_t i;
  void *v23;
  float *v24;
  void *v25;
  float v26;
  void *v27;
  float v28;
  void *v29;
  float v30;
  void *v31;
  float v32;
  void *v33;
  float v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  float v40;
  float v41;
  float v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
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
  _DWORD *v70;
  _DWORD *v71;
  void *v72;
  int v73;
  void *v74;
  int v75;
  void *v76;
  int v77;
  void *v78;
  int v79;
  void *v80;
  int v81;
  void *v82;
  int v83;
  void *v84;
  int v85;
  void *v86;
  int v87;
  void *v88;
  int v89;
  void *v90;
  int v91;
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
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  _DWORD *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  int v127;
  void *v128;
  int v129;
  void *v130;
  int v131;
  void *v132;
  int v133;
  void *v134;
  int v135;
  void *v136;
  int v137;
  void *v138;
  int v139;
  void *v140;
  int v141;
  void *v142;
  int v143;
  void *v144;
  int v145;
  void *v146;
  int v147;
  void *v148;
  int v149;
  void *v150;
  int v151;
  void *v152;
  int v153;
  void *v154;
  int v155;
  void *v156;
  int v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  void *v183;
  void *v184;
  void *v185;
  id v186;
  void *v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  uint8_t buf[4];
  uint64_t v194;
  uint64_t v195;

  v195 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v187 = v13;
  if ((unint64_t)objc_msgSend(v10, "count") < 8
    || (unint64_t)objc_msgSend(v11, "count") < 8
    || (unint64_t)objc_msgSend(v12, "count") < 8
    || (unint64_t)objc_msgSend(v13, "count") < 8)
  {
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing coefficients [%lu, %lu, %lu, %lu]"), objc_msgSend(v10, "count"), objc_msgSend(v11, "count"), objc_msgSend(v12, "count"), objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "+[PAConfiguration configurationWithLeftMediaLoss:rightMediaLoss:leftSpeechLoss:andRightSpeechLoss:]", 302, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v15);
      v17 = v16;
      *(_DWORD *)buf = 136446210;
      v194 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v18 = 0;
    goto LABEL_8;
  }
  v182 = a1;
  v183 = v12;
  v184 = v11;
  v188 = 0;
  v20 = 1;
  v21 = 0x1EA901000uLL;
  v186 = v10;
  do
  {
    for (i = 1; i != 4; ++i)
    {
      objc_msgSend(*(id *)(v21 + 3144), "configurationWithLevel:andShape:", v20, i);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (float *)objc_msgSend(v23, "settingsFromConfiguration:", 0);

      if (!v24)
        continue;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "floatValue");
      if (v26 != *v24)
        goto LABEL_27;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      if (v28 != v24[1])
        goto LABEL_26;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "floatValue");
      if (v30 != v24[2])
        goto LABEL_25;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "floatValue");
      if (v32 != v24[3])
      {

LABEL_25:
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(v10, "objectAtIndexedSubscript:", 4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "floatValue");
      if (v34 != v24[4])
      {

        goto LABEL_34;
      }
      objc_msgSend(v10, "objectAtIndexedSubscript:", 5);
      v35 = v10;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "floatValue");
      if (v37 != v24[5])
        goto LABEL_33;
      objc_msgSend(v35, "objectAtIndexedSubscript:", 6);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "floatValue");
      if (v38 != v24[6])
      {

LABEL_33:
        v10 = v35;
LABEL_34:
        v21 = 0x1EA901000;
        goto LABEL_27;
      }
      objc_msgSend(v35, "objectAtIndexedSubscript:", 7);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "floatValue");
      v41 = v40;
      v42 = v24[7];

      if (v41 != v42)
      {
        v10 = v186;
        v21 = 0x1EA901000;
        goto LABEL_28;
      }
      PAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loss matches preset [%d, %d]"), v20, i);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "+[PAConfiguration configurationWithLeftMediaLoss:rightMediaLoss:leftSpeechLoss:andRightSpeechLoss:]", 324, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)*MEMORY[0x1E0D2F9A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
      {
        v46 = objc_retainAutorelease(v44);
        v47 = v45;
        v48 = objc_msgSend(v46, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v194 = v48;
        _os_log_impl(&dword_1DE3BE000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      v21 = 0x1EA901000uLL;
      +[PAConfiguration configurationWithLevel:andShape:](PAConfiguration, "configurationWithLevel:andShape:", v20, i);
      v25 = (void *)v188;
      v188 = objc_claimAutoreleasedReturnValue();
      v10 = v186;
LABEL_27:

LABEL_28:
      free(v24);
    }
    ++v20;
  }
  while (v20 != 4);
  v12 = v183;
  v11 = v184;
  v18 = (void *)v188;
  if (!v188)
  {
    objc_msgSend(*(id *)(v21 + 3144), "configurationWithLevel:andShape:", 1, 2);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    paBundle();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "pathForResource:ofType:", CFSTR("PresetValues"), CFSTR("plist"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectForKey:", CFSTR("level"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1EA906098, "stringValue");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKey:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v54, "objectForKey:", CFSTR("shape"));
    v56 = v10;
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1EA906098, "stringValue");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectForKey:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryWithDictionary:", v59);
    v181 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v184;
    v10 = v56;
    paBundle();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "pathForResource:ofType:", CFSTR("PresetValuesSpeech"), CFSTR("plist"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v15);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v192 = v61;
    objc_msgSend(v61, "objectForKey:", CFSTR("level"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1EA906098, "stringValue");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectForKey:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = (void *)MEMORY[0x1E0C99E08];
    v190 = v64;
    objc_msgSend(v64, "objectForKey:", CFSTR("shape"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1EA906098, "stringValue");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "objectForKey:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "dictionaryWithDictionary:", v68);
    v185 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = v181;
    v70 = (_DWORD *)objc_msgSend(v189, "settingsFromConfiguration:", 0);
    v71 = (_DWORD *)objc_msgSend(v189, "settingsFromConfiguration:", 1);
    if (v70)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "floatValue");
      *v70 = v73;

      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "floatValue");
      v70[1] = v75;

      objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "floatValue");
      v70[2] = v77;

      objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "floatValue");
      v70[3] = v79;

      objc_msgSend(v10, "objectAtIndexedSubscript:", 4);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "floatValue");
      v70[4] = v81;

      objc_msgSend(v10, "objectAtIndexedSubscript:", 5);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "floatValue");
      v70[5] = v83;

      objc_msgSend(v10, "objectAtIndexedSubscript:", 6);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "floatValue");
      v70[6] = v85;

      objc_msgSend(v10, "objectAtIndexedSubscript:", 7);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "floatValue");
      v70[7] = v87;

      objc_msgSend(v184, "objectAtIndexedSubscript:", 0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "floatValue");
      v70[32] = v89;

      objc_msgSend(v184, "objectAtIndexedSubscript:", 1);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "floatValue");
      v70[33] = v91;

      objc_msgSend(v184, "objectAtIndexedSubscript:", 2);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "floatValue");
      v70[34] = v93;

      objc_msgSend(v184, "objectAtIndexedSubscript:", 3);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "floatValue");
      v70[35] = v95;

      objc_msgSend(v184, "objectAtIndexedSubscript:", 4);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "floatValue");
      v70[36] = v97;

      objc_msgSend(v184, "objectAtIndexedSubscript:", 5);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "floatValue");
      v70[37] = v99;

      objc_msgSend(v184, "objectAtIndexedSubscript:", 6);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "floatValue");
      v70[38] = v101;

      objc_msgSend(v184, "objectAtIndexedSubscript:", 7);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "floatValue");
      v70[39] = v103;

      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v104, CFSTR("leftLoss250_dBHL"));

      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v105, CFSTR("leftLoss500_dBHL"));

      objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v106, CFSTR("leftLoss1000_dBHL"));

      objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v107, CFSTR("leftLoss2000_dBHL"));

      objc_msgSend(v10, "objectAtIndexedSubscript:", 4);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v108, CFSTR("leftLoss3000_dBHL"));

      objc_msgSend(v10, "objectAtIndexedSubscript:", 5);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v109, CFSTR("leftLoss4000_dBHL"));

      objc_msgSend(v10, "objectAtIndexedSubscript:", 6);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v110, CFSTR("leftLoss6000_dBHL"));

      objc_msgSend(v10, "objectAtIndexedSubscript:", 7);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v111, CFSTR("leftLoss10000_dBHL"));

      objc_msgSend(v184, "objectAtIndexedSubscript:", 0);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v112, CFSTR("rightLoss250_dBHL"));

      objc_msgSend(v184, "objectAtIndexedSubscript:", 1);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v113, CFSTR("rightLoss500_dBHL"));

      objc_msgSend(v184, "objectAtIndexedSubscript:", 2);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v114, CFSTR("rightLoss1000_dBHL"));

      objc_msgSend(v184, "objectAtIndexedSubscript:", 3);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v115, CFSTR("rightLoss2000_dBHL"));

      objc_msgSend(v184, "objectAtIndexedSubscript:", 4);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v116, CFSTR("rightLoss3000_dBHL"));

      objc_msgSend(v184, "objectAtIndexedSubscript:", 5);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v117, CFSTR("rightLoss4000_dBHL"));

      objc_msgSend(v184, "objectAtIndexedSubscript:", 6);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v118, CFSTR("rightLoss6000_dBHL"));

      objc_msgSend(v184, "objectAtIndexedSubscript:", 7);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setObject:forKey:", v119, CFSTR("rightLoss10000_dBHL"));

      objc_msgSend(v14, "setObject:forKey:", v181, CFSTR("PAConfigPresetMediaKey"));
      objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("PAConfigLeftMediaKey"));
      objc_msgSend(v14, "setObject:forKey:", v184, CFSTR("PAConfigRightMediaKey"));
      v120 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v189, "preset");
      v121 = v71;
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "dictionaryWithDictionary:", v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v182, "dataFromPreset:", v70);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "setValue:forKey:", v124, CFSTR("data"));

      v71 = v121;
      objc_msgSend(v189, "setPreset:", v123);
      free(v70);

    }
    v12 = v183;
    v125 = v185;
    if (v71)
    {
      objc_msgSend(v183, "objectAtIndexedSubscript:", 0);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "floatValue");
      *v71 = v127;

      objc_msgSend(v183, "objectAtIndexedSubscript:", 1);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "floatValue");
      v71[1] = v129;

      objc_msgSend(v183, "objectAtIndexedSubscript:", 2);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "floatValue");
      v71[2] = v131;

      objc_msgSend(v183, "objectAtIndexedSubscript:", 3);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "floatValue");
      v71[3] = v133;

      objc_msgSend(v183, "objectAtIndexedSubscript:", 4);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "floatValue");
      v71[4] = v135;

      objc_msgSend(v183, "objectAtIndexedSubscript:", 5);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "floatValue");
      v71[5] = v137;

      objc_msgSend(v183, "objectAtIndexedSubscript:", 6);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "floatValue");
      v71[6] = v139;

      objc_msgSend(v183, "objectAtIndexedSubscript:", 7);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "floatValue");
      v71[7] = v141;

      objc_msgSend(v187, "objectAtIndexedSubscript:", 0);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "floatValue");
      v71[32] = v143;

      objc_msgSend(v187, "objectAtIndexedSubscript:", 1);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "floatValue");
      v71[33] = v145;

      objc_msgSend(v187, "objectAtIndexedSubscript:", 2);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "floatValue");
      v71[34] = v147;

      objc_msgSend(v187, "objectAtIndexedSubscript:", 3);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "floatValue");
      v71[35] = v149;

      objc_msgSend(v187, "objectAtIndexedSubscript:", 4);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "floatValue");
      v71[36] = v151;

      objc_msgSend(v187, "objectAtIndexedSubscript:", 5);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "floatValue");
      v71[37] = v153;

      objc_msgSend(v187, "objectAtIndexedSubscript:", 6);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "floatValue");
      v71[38] = v155;
      v180 = v71;

      objc_msgSend(v187, "objectAtIndexedSubscript:", 7);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "floatValue");
      v71[39] = v157;

      objc_msgSend(v183, "objectAtIndexedSubscript:", 0);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v158, CFSTR("leftLoss250_dBHL"));

      objc_msgSend(v183, "objectAtIndexedSubscript:", 1);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v159, CFSTR("leftLoss500_dBHL"));

      objc_msgSend(v183, "objectAtIndexedSubscript:", 2);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v160, CFSTR("leftLoss1000_dBHL"));

      objc_msgSend(v183, "objectAtIndexedSubscript:", 3);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v161, CFSTR("leftLoss2000_dBHL"));

      objc_msgSend(v183, "objectAtIndexedSubscript:", 4);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v162, CFSTR("leftLoss3000_dBHL"));

      objc_msgSend(v183, "objectAtIndexedSubscript:", 5);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v163, CFSTR("leftLoss4000_dBHL"));

      objc_msgSend(v183, "objectAtIndexedSubscript:", 6);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v164, CFSTR("leftLoss6000_dBHL"));

      objc_msgSend(v183, "objectAtIndexedSubscript:", 7);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v165, CFSTR("leftLoss10000_dBHL"));

      objc_msgSend(v187, "objectAtIndexedSubscript:", 0);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v166, CFSTR("rightLoss250_dBHL"));

      objc_msgSend(v187, "objectAtIndexedSubscript:", 1);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v167, CFSTR("rightLoss500_dBHL"));

      objc_msgSend(v187, "objectAtIndexedSubscript:", 2);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v168, CFSTR("rightLoss1000_dBHL"));

      objc_msgSend(v187, "objectAtIndexedSubscript:", 3);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v169, CFSTR("rightLoss2000_dBHL"));

      objc_msgSend(v187, "objectAtIndexedSubscript:", 4);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v170, CFSTR("rightLoss3000_dBHL"));

      objc_msgSend(v187, "objectAtIndexedSubscript:", 5);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v171, CFSTR("rightLoss4000_dBHL"));

      objc_msgSend(v187, "objectAtIndexedSubscript:", 6);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v172, CFSTR("rightLoss6000_dBHL"));

      objc_msgSend(v187, "objectAtIndexedSubscript:", 7);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "setObject:forKey:", v173, CFSTR("rightLoss10000_dBHL"));

      objc_msgSend(v14, "setObject:forKey:", v185, CFSTR("PAConfigPresetSpeechKey"));
      objc_msgSend(v14, "setObject:forKey:", v183, CFSTR("PAConfigLeftSpeechKey"));
      objc_msgSend(v14, "setObject:forKey:", v187, CFSTR("PAConfigRightSpeechKey"));
      v174 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v189, "presetAdjustments");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "valueForKey:", CFSTR("PAPresetAdjustmentSpeechModeKey"));
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "dictionaryWithDictionary:", v176);
      v177 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = v181;
      v125 = v185;

      objc_msgSend(v182, "dataFromPreset:", v180);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "setValue:forKey:", v178, CFSTR("data"));

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v177, CFSTR("PAPresetAdjustmentSpeechModeKey"));
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "setPresetAdjustments:", v179);

      free(v180);
    }
    objc_msgSend(v189, "setAudiogramSettings:", v14);
    objc_msgSend(v189, "setShape:", 12);
    v18 = v189;
    objc_msgSend(v189, "setLevel:", 12);

LABEL_8:
  }

  return (PAConfiguration *)v18;
}

+ (id)configurationFromAudiogramSample:(id)a3
{
  void *v3;
  void *v4;

  +[PAAudiogramUtilities normalizedOffsetsFromAudiogram:](PAAudiogramUtilities, "normalizedOffsetsFromAudiogram:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PAConfiguration configurationWithAudiogram:](PAConfiguration, "configurationWithAudiogram:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)paramDataWithValue:(float)a3 andOffset:(int)a4
{
  _DWORD v5[2];

  v5[0] = bswap32(a4 >> 2);
  v5[1] = bswap32(LODWORD(a3));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dataFromPreset:(id *)a3
{
  void *v5;
  void *v6;
  double v7;
  float v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  double v79;
  void *v80;
  double v81;
  void *v82;
  double v83;
  void *v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  uint64_t v90;
  int v91;

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  *(float *)&v7 = a3->var0;
  if (a3->var0 == a3->var32
    && (*(float *)&v7 = a3->var1, *(float *)&v7 == a3->var33)
    && (*(float *)&v7 = a3->var2, *(float *)&v7 == a3->var34)
    && (*(float *)&v7 = a3->var3, *(float *)&v7 == a3->var35)
    && (*(float *)&v7 = a3->var4, *(float *)&v7 == a3->var36)
    && (*(float *)&v7 = a3->var5, *(float *)&v7 == a3->var37)
    && (*(float *)&v7 = a3->var6, *(float *)&v7 == a3->var38))
  {
    *(float *)&v7 = a3->var7;
    v8 = 0.0;
  }
  else
  {
    v8 = 1.0;
  }
  v90 = 0;
  v91 = 671088640;
  objc_msgSend(v5, "appendBytes:length:", &v90, 12, v7);
  *(float *)&v9 = a3->var0;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v10);

  *(float *)&v11 = a3->var1;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v12);

  *(float *)&v13 = a3->var2;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v14);

  *(float *)&v15 = a3->var3;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v16);

  *(float *)&v17 = a3->var4;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v18);

  *(float *)&v19 = a3->var5;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 20, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v20);

  *(float *)&v21 = a3->var6;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 24, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v22);

  *(float *)&v23 = a3->var7;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 28, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v24);

  *(float *)&v25 = a3->var8;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 32, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v26);

  *(float *)&v27 = a3->var9;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 36, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v28);

  *(float *)&v29 = a3->var10;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 40, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v30);

  *(float *)&v31 = a3->var11;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 44, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v32);

  *(float *)&v33 = a3->var12;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 48, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v34);

  *(float *)&v35 = a3->var13;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 52, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v36);

  *(float *)&v37 = a3->var14;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 56, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v38);

  *(float *)&v39 = a3->var15;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 60, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v40);

  *(float *)&v41 = a3->var16;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 64, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v42);

  *(float *)&v43 = a3->var17;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 68, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v44);

  *(float *)&v45 = a3->var18;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 72, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v46);

  *(float *)&v47 = a3->var19;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 76, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v48);

  *(float *)&v49 = a3->var20;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 80, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v50);

  *(float *)&v51 = a3->var21;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 84, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v52);

  *(float *)&v53 = a3->var22;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 88, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v54);

  *(float *)&v55 = a3->var23;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 92, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v56);

  *(float *)&v57 = a3->var24;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 96, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v58);

  *(float *)&v59 = a3->var25;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 100, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v60);

  *(float *)&v61 = a3->var26;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 104, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v62);

  *(float *)&v63 = a3->var27;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 108, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v64);

  *(float *)&v65 = a3->var28;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 112, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v66);

  *(float *)&v67 = a3->var29;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 116, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v68);

  *(float *)&v69 = a3->var30;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 120, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v70);

  *(float *)&v71 = v8;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 124, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v72);

  *(float *)&v73 = a3->var32;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 128, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v74);

  *(float *)&v75 = a3->var33;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 132, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v76);

  *(float *)&v77 = a3->var34;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 136, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v78);

  *(float *)&v79 = a3->var35;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 140, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v80);

  *(float *)&v81 = a3->var36;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 144, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v82);

  *(float *)&v83 = a3->var37;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 148, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v84);

  *(float *)&v85 = a3->var38;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 152, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v86);

  *(float *)&v87 = a3->var39;
  objc_msgSend(a1, "paramDataWithValue:andOffset:", 156, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v88);

  return v6;
}

- (PAConfiguration)initWithCoder:(id)a3
{
  id v4;
  PAConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  id v20;
  id v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PAConfiguration;
  v5 = -[PAConfiguration init](&v22, sel_init);
  if (v5)
  {
    -[PAConfiguration setLevel:](v5, "setLevel:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PAConfigPresetLevelKey")));
    -[PAConfiguration setShape:](v5, "setShape:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PAConfigPresetShapeKey")));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v12, CFSTR("PAConfigPresetKey"), &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;
    -[PAConfiguration setPreset:](v5, "setPreset:", v13);

    if (v14
      && objc_msgSend(v14, "code") != 4865
      && os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_ERROR))
    {
      -[PAConfiguration initWithCoder:].cold.3();
    }

    v20 = 0;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v12, CFSTR("PAConfigPresetAdjustmentsKey"), &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;
    -[PAConfiguration setPresetAdjustments:](v5, "setPresetAdjustments:", v15);

    if (v16
      && objc_msgSend(v16, "code") != 4865
      && os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_ERROR))
    {
      -[PAConfiguration initWithCoder:].cold.2();
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PAConfigPresetAudiogramKey")))
    {

      v19 = 0;
      objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v12, CFSTR("PAConfigPresetAudiogramKey"), &v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v19;
      -[PAConfiguration setAudiogramSettings:](v5, "setAudiogramSettings:", v17);

      if (v16)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_ERROR))
          -[PAConfiguration initWithCoder:].cold.1();
      }
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeInteger:forKey:", self->_level, CFSTR("PAConfigPresetLevelKey"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_shape, CFSTR("PAConfigPresetShapeKey"));
  -[PAConfiguration preset](self, "preset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("PAConfigPresetKey"));

  -[PAConfiguration presetAdjustments](self, "presetAdjustments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("PAConfigPresetAdjustmentsKey"));

  -[PAConfiguration audiogramSettings](self, "audiogramSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[PAConfiguration audiogramSettings](self, "audiogramSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("PAConfigPresetAudiogramKey"));

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PAConfiguration preset](self, "preset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToDictionary:", v7))
    {
      -[PAConfiguration presetAdjustments](self, "presetAdjustments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presetAdjustments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PAConfiguration: %p, Level: %d, Shape: %d"), self, -[PAConfiguration level](self, "level"), -[PAConfiguration shape](self, "shape"));
}

- (id)presetDictionaryForSpeech:(BOOL)a3
{
  unint64_t level;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  double v10;
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
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  level = self->_level;
  if (level)
  {
    v5 = a3;
    if (level == 12)
    {
      -[PAConfiguration audiogramSettings](self, "audiogramSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
        v8 = CFSTR("PAConfigPresetSpeechKey");
      else
        v8 = CFSTR("PAConfigPresetMediaKey");
      objc_msgSend(v6, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = CFSTR("PresetValues");
      if (a3)
        v26 = CFSTR("PresetValuesSpeech");
      v27 = v26;
      paBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "pathForResource:ofType:", v27, CFSTR("plist"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKey:", CFSTR("level"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PAConfiguration level](self, "level"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringValue");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKey:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "objectForKey:", CFSTR("shape"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PAConfiguration shape](self, "shape"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringValue");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKey:", v36);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (self->_shape == 2)
      v10 = 10.0;
    else
      v10 = 0.0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("leftLoss250_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("leftLoss500_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("leftLoss1000_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("leftLoss2000_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("leftLoss3000_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("leftLoss4000_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v17, CFSTR("leftLoss6000_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("leftLoss10000_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v19, CFSTR("rightLoss250_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("rightLoss500_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v21, CFSTR("rightLoss1000_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v22, CFSTR("rightLoss2000_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v23, CFSTR("rightLoss3000_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v24, CFSTR("rightLoss4000_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v25, CFSTR("rightLoss6000_dBHL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("rightLoss10000_dBHL"));
  }

  return v9;
}

- ($582E6112602F317AA177BE214B91E8F0)settingsFromConfiguration:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  void *v10;
  id v11;
  NSObject *v12;
  $582E6112602F317AA177BE214B91E8F0 *v13;
  void *v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  float v19;
  void *v20;
  float v21;
  void *v22;
  float v23;
  void *v24;
  float v25;
  void *v26;
  float v27;
  void *v28;
  float v29;
  void *v30;
  float v31;
  void *v32;
  float v33;
  void *v34;
  float v35;
  void *v36;
  float v37;
  void *v38;
  float v39;
  void *v40;
  float v41;
  void *v42;
  float v43;
  void *v44;
  float v45;
  void *v46;
  float v47;
  void *v48;
  float v49;
  void *v50;
  float v51;
  void *v52;
  float v53;
  void *v54;
  float v55;
  void *v56;
  float v57;
  void *v58;
  float v59;
  void *v60;
  float v61;
  void *v62;
  float v63;
  void *v64;
  float v65;
  void *v66;
  float v67;
  void *v68;
  float v69;
  void *v70;
  float v71;
  void *v72;
  float v73;
  void *v74;
  float v75;
  void *v76;
  float v77;
  void *v78;
  float v79;
  void *v80;
  float v81;
  void *v82;
  float v83;
  void *v84;
  float v85;
  void *v86;
  float v87;
  void *v88;
  float v89;
  void *v90;
  float v91;
  float v92;
  uint8_t buf[4];
  uint64_t v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  -[PAConfiguration presetDictionaryForSpeech:](self, "presetDictionaryForSpeech:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PAInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "objectForKey:", CFSTR("leftLoss250_dBHL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("rightLoss250_dBHL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Preset values (first band) {%@, %@}"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAConfiguration settingsFromConfiguration:]", 680, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x1E0D2F9A8];
  v10 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v8);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    v95 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    -[PAConfiguration settingsFromConfiguration:].cold.1();
  if (objc_msgSend(v3, "count") == 40)
  {
    v13 = ($582E6112602F317AA177BE214B91E8F0 *)malloc_type_calloc(1uLL, 0xA0uLL, 0x1000040B8406A4EuLL);
    objc_msgSend(v3, "objectForKey:", CFSTR("leftLoss250_dBHL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v13->var0 = v15;

    objc_msgSend(v3, "objectForKey:", CFSTR("leftLoss500_dBHL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v13->var1 = v17;

    objc_msgSend(v3, "objectForKey:", CFSTR("leftLoss1000_dBHL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v13->var2 = v19;

    objc_msgSend(v3, "objectForKey:", CFSTR("leftLoss2000_dBHL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v13->var3 = v21;

    objc_msgSend(v3, "objectForKey:", CFSTR("leftLoss3000_dBHL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    v13->var4 = v23;

    objc_msgSend(v3, "objectForKey:", CFSTR("leftLoss4000_dBHL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    v13->var5 = v25;

    objc_msgSend(v3, "objectForKey:", CFSTR("leftLoss6000_dBHL"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    v13->var6 = v27;

    objc_msgSend(v3, "objectForKey:", CFSTR("leftLoss10000_dBHL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    v13->var7 = v29;

    objc_msgSend(v3, "objectForKey:", CFSTR("maxFdcGain_dB"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    v13->var8 = v31;

    objc_msgSend(v3, "objectForKey:", CFSTR("minFdcGain_dB"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "floatValue");
    v13->var9 = v33;

    objc_msgSend(v3, "objectForKey:", CFSTR("attackTime_ms"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "floatValue");
    v13->var10 = v35;

    objc_msgSend(v3, "objectForKey:", CFSTR("releaseTime_ms"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    v13->var11 = v37;

    objc_msgSend(v3, "objectForKey:", CFSTR("fdcInputSmoothingTime_ms"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "floatValue");
    v13->var12 = v39;

    objc_msgSend(v3, "objectForKey:", CFSTR("fineTuningGainBias_dB"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "floatValue");
    v13->var13 = v41;

    objc_msgSend(v3, "objectForKey:", CFSTR("fineTuningBrightnessAdjust_dB"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "floatValue");
    v13->var14 = v43;

    objc_msgSend(v3, "objectForKey:", CFSTR("fineTuningRatioAdjust"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "floatValue");
    v13->var15 = v45;

    objc_msgSend(v3, "objectForKey:", CFSTR("fineTuningSplBias_dB"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "floatValue");
    v13->var16 = v47;

    objc_msgSend(v3, "objectForKey:", CFSTR("enableNoiseSuppression"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "floatValue");
    v13->var17 = v49;

    objc_msgSend(v3, "objectForKey:", CFSTR("noiseEstTimeConst_s"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "floatValue");
    v13->var18 = v51;

    objc_msgSend(v3, "objectForKey:", CFSTR("noiseEstBias_dB"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "floatValue");
    v13->var19 = v53;

    objc_msgSend(v3, "objectForKey:", CFSTR("noiseSuppTimeConst_ms"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "floatValue");
    v13->var20 = v55;

    objc_msgSend(v3, "objectForKey:", CFSTR("noiseSuppFloor_dB"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "floatValue");
    v13->var21 = v57;

    objc_msgSend(v3, "objectForKey:", CFSTR("minCombinedGain_dB"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "floatValue");
    v13->var22 = v59;

    objc_msgSend(v3, "objectForKey:", CFSTR("filteringMode"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "floatValue");
    v13->var23 = v61;

    objc_msgSend(v3, "objectForKey:", CFSTR("outputSensitivity_dB"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "floatValue");
    v13->var24 = v63;

    objc_msgSend(v3, "objectForKey:", CFSTR("downstreamGain_dB"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "floatValue");
    v13->var25 = v65;

    objc_msgSend(v3, "objectForKey:", CFSTR("processingMode"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "floatValue");
    v13->var26 = v67;

    objc_msgSend(v3, "objectForKey:", CFSTR("headphoneType"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "floatValue");
    v13->var27 = v69;

    objc_msgSend(v3, "objectForKey:", CFSTR("expanderRatio"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "floatValue");
    v13->var28 = v71;

    objc_msgSend(v3, "objectForKey:", CFSTR("expanderThreshold_dB"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "floatValue");
    v13->var29 = v73;

    objc_msgSend(v3, "objectForKey:", CFSTR("linkedMode"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "floatValue");
    v13->var30 = v75;

    objc_msgSend(v3, "objectForKey:", CFSTR("rightLoss250_dBHL"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "floatValue");
    v13->var32 = v77;

    objc_msgSend(v3, "objectForKey:", CFSTR("rightLoss500_dBHL"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "floatValue");
    v13->var33 = v79;

    objc_msgSend(v3, "objectForKey:", CFSTR("rightLoss1000_dBHL"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "floatValue");
    v13->var34 = v81;

    objc_msgSend(v3, "objectForKey:", CFSTR("rightLoss2000_dBHL"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "floatValue");
    v13->var35 = v83;

    objc_msgSend(v3, "objectForKey:", CFSTR("rightLoss3000_dBHL"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "floatValue");
    v13->var36 = v85;

    objc_msgSend(v3, "objectForKey:", CFSTR("rightLoss4000_dBHL"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "floatValue");
    v13->var37 = v87;

    objc_msgSend(v3, "objectForKey:", CFSTR("rightLoss6000_dBHL"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "floatValue");
    v13->var38 = v89;

    objc_msgSend(v3, "objectForKey:", CFSTR("rightLoss10000_dBHL"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "floatValue");
    v13->var39 = v91;

    if (v13->var0 == v13->var32
      && v13->var1 == v13->var33
      && v13->var2 == v13->var34
      && v13->var3 == v13->var35
      && v13->var4 == v13->var36
      && v13->var5 == v13->var37
      && v13->var6 == v13->var38
      && v13->var7 == v13->var39)
    {
      v92 = 0.0;
    }
    else
    {
      v92 = 1.0;
    }
    v13->var31 = v92;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- ($582E6112602F317AA177BE214B91E8F0)readSettingsFromPreset:(id)a3
{
  void *v3;
  $582E6112602F317AA177BE214B91E8F0 *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  os_log_t *v11;
  void *v12;
  void *v13;
  void *v14;
  os_log_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int buf[6];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "valueForKey:", CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = ($582E6112602F317AA177BE214B91E8F0 *)malloc_type_calloc(1uLL, 0xA0uLL, 0x1000040B8406A4EuLL);
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 160);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v21 = 0;
    objc_msgSend(v3, "getBytes:range:", &v21, 0, 12);
    v6 = bswap32(v22);
    if (v6 >= 1)
    {
      v7 = 0;
      v8 = 8 * v6;
      do
      {
        *(_QWORD *)buf = 0;
        if (v7 + 20 <= (unint64_t)objc_msgSend(v3, "length"))
        {
          objc_msgSend(v3, "getBytes:range:", buf, v7 + 12, 8);
          v9 = bswap32(buf[0]);
          v20 = bswap32(buf[1]);
          if (v9 <= 0x28)
            objc_msgSend(v5, "replaceBytesInRange:withBytes:", 4 * v9, 4, &v20);
        }
        v7 += 8;
      }
      while (v8 != v7);
    }
    v10 = objc_msgSend(v5, "length");
    v11 = (os_log_t *)MEMORY[0x1E0D2F9A8];
    if (v10 != 160)
    {
      v12 = (void *)*MEMORY[0x1E0D2F9A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_FAULT))
        -[PAConfiguration readSettingsFromPreset:].cold.2(v12, v5);
    }
    objc_msgSend(v5, "getBytes:length:", v4, objc_msgSend(v5, "length"));
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Preset settings (first band) {%lf, %lf}"), v4->var0, v4->var32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAConfiguration readSettingsFromPreset:]", 787, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v14);
      v17 = v15;
      v18 = objc_msgSend(v16, "UTF8String");
      buf[0] = 136446210;
      *(_QWORD *)&buf[1] = v18;
      _os_log_impl(&dword_1DE3BE000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)buf, 0xCu);

    }
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
      -[PAConfiguration readSettingsFromPreset:].cold.1(&v4->var0);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- ($D1907C19D6DE236B0F95485CBF7F2EE1)transparencySettingsForAddress:(id)a3
{
  id v4;
  $582E6112602F317AA177BE214B91E8F0 *v5;
  float32x2_t *v6;
  $D1907C19D6DE236B0F95485CBF7F2EE1 *v7;
  float64x2_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  os_log_t *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  double v30;
  float v31;
  float v32;
  float v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  os_log_t v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v44;
  double var0;
  double var1;
  double var2;
  double var3;
  double var4;
  double var5;
  double var6;
  double var7;
  double var8;
  double var9;
  double var10;
  double var11;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  double v80;
  __int16 v81;
  double v82;
  __int16 v83;
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  __int16 v91;
  double v92;
  __int16 v93;
  double v94;
  __int16 v95;
  double v96;
  __int16 v97;
  double v98;
  __int16 v99;
  double v100;
  __int16 v101;
  double v102;
  __int16 v103;
  double v104;
  __int16 v105;
  double v106;
  __int16 v107;
  double v108;
  __int16 v109;
  double v110;
  __int16 v111;
  double v112;
  __int16 v113;
  double v114;
  __int16 v115;
  double v116;
  __int16 v117;
  double v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PAConfiguration settingsFromConfiguration:](self, "settingsFromConfiguration:", 0);
  if (v5)
  {
    v6 = (float32x2_t *)v5;
    v7 = ($D1907C19D6DE236B0F95485CBF7F2EE1 *)malloc_type_malloc(0x64uLL, 0x100004093FC706DuLL);
    v8 = (float64x2_t)vdupq_n_s64(0x4054000000000000uLL);
    *(float32x4_t *)&v7->var1.var0 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmaxnmq_f64(vminnmq_f64(vcvtq_f64_f32(*v6), v8), (float64x2_t)0)), vmaxnmq_f64(vminnmq_f64(vcvt_hight_f64_f32(*(float32x4_t *)v6->f32), v8), (float64x2_t)0));
    *(float32x4_t *)&v7->var1.var4 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmaxnmq_f64(vminnmq_f64(vcvtq_f64_f32(v6[2]), v8), (float64x2_t)0)), vmaxnmq_f64(vminnmq_f64(vcvt_hight_f64_f32(*(float32x4_t *)v6[2].f32), v8), (float64x2_t)0));
    *(float32x4_t *)&v7->var2.var0 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmaxnmq_f64(vminnmq_f64(vcvtq_f64_f32(v6[16]), v8), (float64x2_t)0)), vmaxnmq_f64(vminnmq_f64(vcvt_hight_f64_f32(*(float32x4_t *)v6[16].f32), v8), (float64x2_t)0));
    *(float32x4_t *)&v7->var2.var4 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmaxnmq_f64(vminnmq_f64(vcvtq_f64_f32(v6[18]), v8), (float64x2_t)0)), vmaxnmq_f64(vminnmq_f64(vcvt_hight_f64_f32(*(float32x4_t *)v6[18].f32), v8), (float64x2_t)0));
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transparencyToneForAddress:", v4);
    v11 = v10 * 2.0 + -1.0;

    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transparencyBalanceForAddress:", v4);
    v14 = v13 * 2.0 + -1.0;

    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transparencyAmplificationForAddress:", v4);
    v17 = v16 * 2.0 + -1.0;

    if (v14 <= 0.0)
      v18 = v14;
    else
      v18 = 0.0;
    v19 = v17 - v18;
    v20 = fmax(v14, 0.0) + v17;
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending tone: %lf, leftGain: %lf, rightGain: %lf balance %lf"), *(_QWORD *)&v11, *(_QWORD *)&v19, *(_QWORD *)&v20, *(_QWORD *)&v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAConfiguration transparencySettingsForAddress:]", 868, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (os_log_t *)MEMORY[0x1E0D2F9A8];
    v24 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_retainAutorelease(v22);
      v26 = v24;
      *(_DWORD *)buf = 136446210;
      v70 = objc_msgSend(v25, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "transparencyBeamformingForAddress:", v4);
    v7->var2.var10 = (float)v28;
    v7->var1.var10 = (float)v28;

    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "transparencyNoiseSupressorForAddress:", v4);
    *(float *)&v30 = v30;
    v7->var2.var11 = *(float *)&v30;
    v7->var1.var11 = *(float *)&v30;

    v31 = fmax(fmin(v11, 1.0), -1.0);
    v32 = fmax(fmin(v19, 2.0), -1.0);
    v7->var1.var8 = v32;
    v7->var1.var9 = v31;
    v33 = fmax(fmin(v20, 2.0), -1.0);
    v7->var2.var8 = v33;
    v7->var2.var9 = v31;
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "personalMediaEnabled") & 1) != 0)
    {
      +[PASettings sharedInstance](PASettings, "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v7->var0 = (float)objc_msgSend(v35, "transparencyCustomizedForAddress:", v4);

    }
    else
    {
      v7->var0 = 0.0;
    }

    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending enabled %lf, first band: {%lf, %lf}"), v7->var0, v7->var1.var0, v7->var2.var0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAConfiguration transparencySettingsForAddress:]", 890, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *v23;
    if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_retainAutorelease(v37);
      v40 = v38;
      v41 = objc_msgSend(v39, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v70 = v41;
      _os_log_impl(&dword_1DE3BE000, v40, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v42 = *v23;
    if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&v44 = v7->var0;
      var0 = v7->var1.var0;
      var1 = v7->var1.var1;
      var2 = v7->var1.var2;
      var3 = v7->var1.var3;
      var4 = v7->var1.var4;
      var5 = v7->var1.var5;
      var6 = v7->var1.var6;
      var7 = v7->var1.var7;
      var8 = v7->var1.var8;
      var9 = v7->var1.var9;
      var10 = v7->var1.var10;
      var11 = v7->var1.var11;
      v57 = v7->var2.var0;
      v58 = v7->var2.var1;
      v59 = v7->var2.var2;
      v60 = v7->var2.var3;
      v61 = v7->var2.var4;
      v62 = v7->var2.var5;
      v63 = v7->var2.var6;
      v64 = v7->var2.var7;
      v65 = v7->var2.var8;
      v66 = v7->var2.var9;
      v67 = v7->var2.var10;
      v68 = v7->var2.var11;
      *(_DWORD *)buf = 134224128;
      v70 = v44;
      v71 = 2048;
      v72 = var0;
      v73 = 2048;
      v74 = var1;
      v75 = 2048;
      v76 = var2;
      v77 = 2048;
      v78 = var3;
      v79 = 2048;
      v80 = var4;
      v81 = 2048;
      v82 = var5;
      v83 = 2048;
      v84 = var6;
      v85 = 2048;
      v86 = var7;
      v87 = 2048;
      v88 = var8;
      v89 = 2048;
      v90 = var9;
      v91 = 2048;
      v92 = var10;
      v93 = 2048;
      v94 = var11;
      v95 = 2048;
      v96 = v57;
      v97 = 2048;
      v98 = v58;
      v99 = 2048;
      v100 = v59;
      v101 = 2048;
      v102 = v60;
      v103 = 2048;
      v104 = v61;
      v105 = 2048;
      v106 = v62;
      v107 = 2048;
      v108 = v63;
      v109 = 2048;
      v110 = v64;
      v111 = 2048;
      v112 = v65;
      v113 = 2048;
      v114 = v66;
      v115 = 2048;
      v116 = v67;
      v117 = 2048;
      v118 = v68;
      _os_log_debug_impl(&dword_1DE3BE000, v42, OS_LOG_TYPE_DEBUG, "Sending enabled %lf, left: {%lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf}, right: {%lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf}", buf, 0xFCu);
    }
    free(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)lossArrayFromDictionary:(id)a3 forLeft:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v8 = CFSTR("leftLoss250_dBHL");
  else
    v8 = CFSTR("rightLoss250_dBHL");
  if (v4)
    v9 = CFSTR("leftLoss500_dBHL");
  else
    v9 = CFSTR("rightLoss500_dBHL");
  if (v4)
    v10 = CFSTR("leftLoss1000_dBHL");
  else
    v10 = CFSTR("rightLoss1000_dBHL");
  if (v4)
    v11 = CFSTR("leftLoss2000_dBHL");
  else
    v11 = CFSTR("rightLoss2000_dBHL");
  if (v4)
    v12 = CFSTR("leftLoss3000_dBHL");
  else
    v12 = CFSTR("rightLoss3000_dBHL");
  if (v4)
    v13 = CFSTR("leftLoss4000_dBHL");
  else
    v13 = CFSTR("rightLoss4000_dBHL");
  if (v4)
    v14 = CFSTR("leftLoss6000_dBHL");
  else
    v14 = CFSTR("rightLoss6000_dBHL");
  if (v4)
    v15 = CFSTR("leftLoss10000_dBHL");
  else
    v15 = CFSTR("rightLoss10000_dBHL");
  objc_msgSend(v6, "objectForKey:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hcSafeAddObject:", v16);

  objc_msgSend(v6, "objectForKey:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hcSafeAddObject:", v17);

  objc_msgSend(v6, "objectForKey:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hcSafeAddObject:", v18);

  objc_msgSend(v6, "objectForKey:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hcSafeAddObject:", v19);

  objc_msgSend(v6, "objectForKey:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hcSafeAddObject:", v20);

  objc_msgSend(v6, "objectForKey:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hcSafeAddObject:", v21);

  objc_msgSend(v6, "objectForKey:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hcSafeAddObject:", v22);

  objc_msgSend(v6, "objectForKey:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hcSafeAddObject:", v23);
  if (objc_msgSend(v7, "count") == 8)
    v24 = v7;
  else
    v24 = 0;
  v25 = v24;

  return v25;
}

- (id)onBudsMediaSettingsForRoute:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
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
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  char v50;
  void *v51;
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(getHMDeviceConfigurationsClass());
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v4;
  v7 = objc_msgSend(v6, "personalMediaEnabledForRouteUID:", v4);

  if (v7)
  {
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v8, "personalAudioAccommodationTypes");

  }
  else
  {
    v50 = 0;
  }
  PAInitializeLogging();
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "currentEnrollmentProgress"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "personalMediaEnabledByRouteUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accommodationTypesByRouteUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Checking state %@ - %@ - %@ - %@"), v51, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAConfiguration onBudsMediaSettingsForRoute:]", 962, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_retainAutorelease(v18);
    v21 = v19;
    *(_DWORD *)buf = 136446210;
    v53 = objc_msgSend(v20, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "currentEnrollmentProgress") == 2)
    v23 = 1;
  else
    v23 = 2;
  objc_msgSend(v5, "setEnrollPMEVoice:", v23);

  if ((v50 & 2) != 0)
    v24 = 1;
  else
    v24 = 2;
  objc_msgSend(v5, "setEnablePMEVoice:", v24);
  if ((v50 & 4) != 0)
    v25 = 1;
  else
    v25 = 2;
  objc_msgSend(v5, "setEnablePMEMedia:", v25);
  -[PAConfiguration presetDictionaryForSpeech:](self, "presetDictionaryForSpeech:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAConfiguration presetDictionaryForSpeech:](self, "presetDictionaryForSpeech:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAConfiguration lossArrayFromDictionary:forLeft:](self, "lossArrayFromDictionary:forLeft:", v27, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaLossArrayLeft:", v28);

  -[PAConfiguration lossArrayFromDictionary:forLeft:](self, "lossArrayFromDictionary:forLeft:", v27, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaLossArrayRight:", v29);

  -[PAConfiguration lossArrayFromDictionary:forLeft:](self, "lossArrayFromDictionary:forLeft:", v26, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVoiceLossArrayLeft:", v30);

  -[PAConfiguration lossArrayFromDictionary:forLeft:](self, "lossArrayFromDictionary:forLeft:", v26, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVoiceLossArrayRight:", v31);

  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Media config for route %@"), v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAConfiguration onBudsMediaSettingsForRoute:]", 976, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v35 = objc_retainAutorelease(v33);
    v36 = v34;
    v37 = objc_msgSend(v35, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v53 = v37;
    _os_log_impl(&dword_1DE3BE000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  PAInitializeLogging();
  v38 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "mediaLossArrayLeft");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaLossArrayRight");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "voiceLossArrayLeft");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "voiceLossArrayRight");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("Sending configuration [%@, %@], [%@, %@]"), v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAConfiguration onBudsMediaSettingsForRoute:]", 977, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v46 = objc_retainAutorelease(v44);
    v47 = v45;
    v48 = objc_msgSend(v46, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v53 = v48;
    _os_log_impl(&dword_1DE3BE000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  return v5;
}

- (float)pureToneAverageForSpeech:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  float v40;
  float v41;
  void *v42;
  float v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v3 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  if (self->_level == 12)
  {
    -[PAConfiguration audiogramSettings](self, "audiogramSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      v7 = CFSTR("PAConfigPresetSpeechKey");
    else
      v7 = CFSTR("PAConfigPresetMediaKey");
    objc_msgSend(v5, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("PresetValues");
    if (a3)
      v9 = CFSTR("PresetValuesSpeech");
    v10 = v9;
    paBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathForResource:ofType:", v10, CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("level"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PAConfiguration level](self, "level"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectForKey:", CFSTR("shape"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PAConfiguration shape](self, "shape"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20 = 0.0;
  if (objc_msgSend(v8, "count") == 40)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("leftLoss500_dBHL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    v23 = v22;
    objc_msgSend(v8, "objectForKey:", CFSTR("leftLoss1000_dBHL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    v26 = v23 + v25;
    objc_msgSend(v8, "objectForKey:", CFSTR("leftLoss2000_dBHL"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    v29 = v26 + v28;
    objc_msgSend(v8, "objectForKey:", CFSTR("leftLoss4000_dBHL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    v32 = (float)(v29 + v31) * 0.25;

    objc_msgSend(v8, "objectForKey:", CFSTR("rightLoss500_dBHL"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "floatValue");
    v35 = v34;
    objc_msgSend(v8, "objectForKey:", CFSTR("rightLoss1000_dBHL"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    v38 = v35 + v37;
    objc_msgSend(v8, "objectForKey:", CFSTR("rightLoss2000_dBHL"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "floatValue");
    v41 = v38 + v40;
    objc_msgSend(v8, "objectForKey:", CFSTR("rightLoss4000_dBHL"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "floatValue");
    v20 = (float)(v41 + v43) * 0.25;

    if (v32 < v20)
      v20 = v32;
  }
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PTA %d = %lf"), v3, v20);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAConfiguration pureToneAverageForSpeech:]", 1009, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v47 = objc_retainAutorelease(v45);
    v48 = v46;
    *(_DWORD *)buf = 136446210;
    v51 = objc_msgSend(v47, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  return v20;
}

- (float)mediaPureToneAverage
{
  float result;

  -[PAConfiguration pureToneAverageForSpeech:](self, "pureToneAverageForSpeech:", 0);
  return result;
}

- (float)speechPureToneAverage
{
  float result;

  -[PAConfiguration pureToneAverageForSpeech:](self, "pureToneAverageForSpeech:", 1);
  return result;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (unint64_t)shape
{
  return self->_shape;
}

- (void)setShape:(unint64_t)a3
{
  self->_shape = a3;
}

- (NSDictionary)preset
{
  return self->_preset;
}

- (void)setPreset:(id)a3
{
  objc_storeStrong((id *)&self->_preset, a3);
}

- (NSDictionary)presetAdjustments
{
  return self->_presetAdjustments;
}

- (void)setPresetAdjustments:(id)a3
{
  objc_storeStrong((id *)&self->_presetAdjustments, a3);
}

- (NSDictionary)audiogramSettings
{
  return self->_audiogramSettings;
}

- (void)setAudiogramSettings:(id)a3
{
  objc_storeStrong((id *)&self->_audiogramSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audiogramSettings, 0);
  objc_storeStrong((id *)&self->_presetAdjustments, 0);
  objc_storeStrong((id *)&self->_preset, 0);
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DE3BE000, v0, v1, "Error decoding audiogram preset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DE3BE000, v0, v1, "Error decoding preset adjustments: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DE3BE000, v0, v1, "Error decoding preset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)settingsFromConfiguration:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1DE3BE000, v0, OS_LOG_TYPE_DEBUG, "Preset values %@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)readSettingsFromPreset:(float *)a1 .cold.1(float *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  float *v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  os_log_t v57;
  int v58;
  double v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  double v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  double v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  double v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  double v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  double v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  double v83;
  __int16 v84;
  __int16 v85;
  double v86;
  __int16 v87;
  __int16 v88;
  __int16 v89;
  __int16 v90;
  double v91;
  __int16 v92;
  __int16 v93;
  __int16 v94;
  __int16 v95;
  double v96;
  __int16 v97;
  __int16 v98;
  __int16 v99;
  __int16 v100;
  double v101;
  __int16 v102;
  __int16 v103;
  __int16 v104;
  __int16 v105;
  double v106;
  __int16 v107;
  __int16 v108;
  __int16 v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  __int16 v113;
  __int16 v114;
  __int16 v115;
  double v116;
  __int16 v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v58 = 134227968;
  v59 = OUTLINED_FUNCTION_0(*a1);
  v61 = v1;
  v63 = OUTLINED_FUNCTION_0(*(float *)(v2 + 8));
  v65 = v3;
  v67 = OUTLINED_FUNCTION_0(*(float *)(v4 + 16));
  v69 = v5;
  v71 = OUTLINED_FUNCTION_0(*(float *)(v6 + 24));
  v73 = v7;
  v75 = OUTLINED_FUNCTION_0(*(float *)(v8 + 32));
  v77 = v9;
  v79 = OUTLINED_FUNCTION_0(*(float *)(v10 + 40));
  v81 = v11;
  v83 = OUTLINED_FUNCTION_0(*(float *)(v12 + 48));
  *(_QWORD *)(v13 + 134) = v14;
  v86 = OUTLINED_FUNCTION_0(*(float *)(v15 + 56));
  *(_QWORD *)(v16 + 154) = v17;
  v19 = OUTLINED_FUNCTION_0(*(float *)(v18 + 64));
  *(double *)(v20 + 164) = v19;
  *(_QWORD *)(v20 + 174) = v21;
  v91 = OUTLINED_FUNCTION_0(*(float *)(v22 + 72));
  *(_QWORD *)(v23 + 194) = v24;
  v26 = OUTLINED_FUNCTION_0(*(float *)(v25 + 80));
  *(double *)(v27 + 204) = v26;
  *(_QWORD *)(v27 + 214) = v28;
  v96 = OUTLINED_FUNCTION_0(*(float *)(v29 + 88));
  *(_QWORD *)(v30 + 234) = v31;
  v33 = OUTLINED_FUNCTION_0(*(float *)(v32 + 96));
  *(double *)(v34 + 244) = v33;
  *(_QWORD *)(v34 + 254) = v35;
  v101 = OUTLINED_FUNCTION_0(*(float *)(v36 + 104));
  *v37 = v38;
  v40 = OUTLINED_FUNCTION_0(*(float *)(v39 + 112));
  *(double *)(v41 + 10) = v40;
  *(_QWORD *)(v41 + 20) = v42;
  v106 = OUTLINED_FUNCTION_0(*(float *)(v43 + 120));
  v45 = *v44;
  *(_QWORD *)(v46 + 40) = v47;
  *(double *)(v46 + 50) = v45;
  v49 = OUTLINED_FUNCTION_0(*(float *)(v48 + 132));
  *(double *)(v50 + 60) = v49;
  v111 = v51;
  v53 = OUTLINED_FUNCTION_0(*(float *)(v52 + 140));
  *(double *)(v54 + 80) = v53;
  *(_QWORD *)(v54 + 90) = v55;
  LODWORD(v55) = *(_DWORD *)(v56 + 152);
  *(double *)(v54 + 100) = *(float *)(v56 + 148);
  v116 = *(float *)&v55;
  *(double *)(v54 + 120) = *(float *)(v56 + 156);
  v60 = 2048;
  v62 = 2048;
  v64 = 2048;
  v66 = 2048;
  v68 = 2048;
  v70 = 2048;
  v72 = 2048;
  v74 = 2048;
  v76 = 2048;
  v78 = 2048;
  v80 = 2048;
  v82 = 2048;
  v84 = 2048;
  v85 = 2048;
  v87 = 2048;
  v88 = 2048;
  v89 = 2048;
  v90 = 2048;
  v92 = 2048;
  v93 = 2048;
  v94 = 2048;
  v95 = 2048;
  v97 = 2048;
  v98 = 2048;
  v99 = 2048;
  v100 = 2048;
  v102 = 2048;
  v103 = 2048;
  v104 = 2048;
  v105 = 2048;
  v107 = 2048;
  v108 = 2048;
  v109 = 2048;
  v110 = 2048;
  v112 = 2048;
  v113 = 2048;
  v114 = 2048;
  v115 = 2048;
  v117 = 2048;
  _os_log_debug_impl(&dword_1DE3BE000, v57, OS_LOG_TYPE_DEBUG, "Preset settings {%lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf}", (uint8_t *)&v58, 0x192u);
}

- (void)readSettingsFromPreset:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "length");
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1DE3BE000, v3, OS_LOG_TYPE_FAULT, "PAPresetSettings translated data wrong length %lu", v4, 0xCu);

}

@end
