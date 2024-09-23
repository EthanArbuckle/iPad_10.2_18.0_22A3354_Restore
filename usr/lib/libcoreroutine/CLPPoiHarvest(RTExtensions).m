@implementation CLPPoiHarvest(RTExtensions)

- (id)initWithMapItem:()RTExtensions accessPoints:locations:motionActivities:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id obj;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  void *v73;
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  obj = a5;
  v12 = a6;
  if (objc_msgSend(v10, "validMUID") && objc_msgSend(v11, "count"))
  {
    v13 = objc_alloc(MEMORY[0x1E0D16B40]);
    objc_msgSend(v11, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithMapItem:date:", v10, v15);

    if (v16)
    {
      v55 = a1;
      v17 = (void *)objc_opt_new();
      v51 = v16;
      objc_msgSend(v17, "setTriggerEvent:", v16);
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v53 = v11;
      v18 = v11;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v67;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v67 != v21)
              objc_enumerationMutation(v18);
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16B48]), "initWithRTWifiAccessPoint:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v22));
            if (v23)
              objc_msgSend(v17, "addAccessPoints:", v23);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
        }
        while (v20);
      }
      v54 = v10;

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "sortedArrayUsingDescriptors:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v12;
      objc_msgSend(v12, "sortedArrayUsingDescriptors:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectEnumerator");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "nextObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      obj = v26;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v63;
        do
        {
          v35 = 0;
          do
          {
            if (*(_QWORD *)v63 != v34)
              objc_enumerationMutation(obj);
            v36 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v35);
            if (v31)
            {
              do
              {
                objc_msgSend(v36, "date");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "startDate");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v37, "compare:", v38);

                if (v39 != -1)
                  break;
                objc_msgSend(v30, "nextObject");
                v40 = objc_claimAutoreleasedReturnValue();

                v31 = (void *)v40;
              }
              while (v40);
            }
            v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16B28]), "initWithRTLocation:rtMotionActivity:", v36, v31);
            if (v41)
              objc_msgSend(v57, "addObject:", v41);

            ++v35;
          }
          while (v35 != v33);
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        }
        while (v33);
      }

      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "sortedArrayUsingDescriptors:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      v10 = v54;
      v16 = v51;
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v59;
        do
        {
          v48 = 0;
          do
          {
            if (*(_QWORD *)v59 != v47)
              objc_enumerationMutation(v44);
            objc_msgSend(v17, "addLocations:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v48++));
          }
          while (v46 != v48);
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
        }
        while (v46);
      }

      v49 = v17;
      a1 = v55;
      v12 = v52;
      v11 = v53;
    }
    else
    {
      v49 = 0;
    }

  }
  else
  {
    v49 = 0;
  }

  return v49;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "triggerEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(a1, "locations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("triggerEvent, %@, wifiAccessPoints, %lu, locations, %lu"), v3, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
