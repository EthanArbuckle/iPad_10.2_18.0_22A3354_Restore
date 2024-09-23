@implementation VUIVideoAdvisoryInfoDictionaryBuilder

+ (id)advisoryInfoDictionaryWithRatingImage:(id)a3 photoSensitivityImage:(id)a4 highMotionWarningImage:(id)a5 andMediaItem:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  float v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  float v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  v14 = v13;
  if (v9)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("VUIAdvisoryViewLogoImageKey"));
  if (v12)
  {
    v52 = v11;
    v49 = v9;
    objc_msgSend(v12, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19C8]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v14;
    if (objc_msgSend(v50, "count"))
    {
      v47 = v12;
      v48 = v10;
      v15 = (void *)objc_opt_new();
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      obj = v50;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v55 != v18)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            v21 = (void *)objc_opt_new();
            objc_msgSend(v20, "ratingName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "length");

            if (v23)
            {
              objc_msgSend(v20, "ratingName");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("VUIAdvisoryViewLegendNameKey"));

            }
            objc_msgSend(v20, "ratingDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "length");

            if (v26)
            {
              objc_msgSend(v20, "ratingDescription");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, CFSTR("VUIAdvisoryViewLegendDescriptionKey"));

            }
            if (objc_msgSend(v21, "count"))
              objc_msgSend(v15, "addObject:", v21);

          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        }
        while (v17);
      }

      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("VUIAdvisoryViewLegendsKey"));
      v12 = v47;
      v10 = v48;
    }
    objc_msgSend(v12, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BC8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedInfoString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length");

    if (v30)
    {
      objc_msgSend(v28, "localizedInfoString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v31, CFSTR("VUIAdvisoryViewBlockDescriptionKey"));

    }
    v32 = (void *)objc_opt_new();
    objc_msgSend(v12, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BA8]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BA0]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v33, "floatValue");
      if (v10)
      {
        if (v35 > 0.0 && v34)
        {
          v60[0] = CFSTR("VUIIAdditionalAdvisoryInfoDisplayDurationKey");
          v60[1] = CFSTR("VUIIAdditionalAdvisoryInfoViewDescriptionKey");
          v61[0] = v33;
          v61[1] = v34;
          v60[2] = CFSTR("VUIAdditionalAdvisoryInfoViewImageKey");
          v61[2] = v10;
          v36 = (void *)MEMORY[0x1E0C99D80];
          v37 = v10;
          objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "addObject:", v38);
        }
      }
    }
    objc_msgSend(v12, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B38]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B30]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v39, "floatValue");
      if (v52)
      {
        if (v41 > 0.0 && v40)
        {
          v58[0] = CFSTR("VUIIAdditionalAdvisoryInfoDisplayDurationKey");
          v58[1] = CFSTR("VUIIAdditionalAdvisoryInfoViewDescriptionKey");
          v59[0] = v39;
          v59[1] = v40;
          v58[2] = CFSTR("VUIAdditionalAdvisoryInfoViewImageKey");
          v59[2] = v52;
          v42 = (void *)MEMORY[0x1E0C99D80];
          v43 = v52;
          objc_msgSend(v42, "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "addObject:", v44);
        }
      }
    }
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v32, CFSTR("VUIAdvisoryViewAdditionalViewsDictionaryKey"));

    v14 = v51;
    v9 = v49;
    v11 = v52;
  }
  v45 = (void *)objc_msgSend(v14, "copy");

  return v45;
}

@end
