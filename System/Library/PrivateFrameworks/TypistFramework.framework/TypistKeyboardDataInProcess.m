@implementation TypistKeyboardDataInProcess

+ (id)getKeyboardLayout:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD *v73;
  uint64_t *v74;
  uint64_t *v75;
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _QWORD v83[6];
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  _QWORD v90[5];
  id v91;
  _QWORD v92[5];
  id v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x3032000000;
  v92[3] = __Block_byref_object_copy__6;
  v92[4] = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
  v93 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x3032000000;
  v90[3] = __Block_byref_object_copy__6;
  v90[4] = __Block_byref_object_dispose__6;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "_layout");
  v91 = (id)objc_claimAutoreleasedReturnValue();
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__6;
  v88 = __Block_byref_object_dispose__6;
  v89 = 0;
  v83[0] = MEMORY[0x24BDAC760];
  v83[1] = 3221225472;
  v83[2] = __49__TypistKeyboardDataInProcess_getKeyboardLayout___block_invoke;
  v83[3] = &unk_251A7CD38;
  v83[4] = &v84;
  v83[5] = v92;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v83);
  if (objc_msgSend((id)v85[5], "containsString:", CFSTR("_")))
  {
    objc_msgSend((id)v85[5], "componentsSeparatedByString:", CFSTR("_"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v85[5];
    v85[5] = v8;

  }
  v77 = 0;
  v78 = &v77;
  v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__6;
  v81 = __Block_byref_object_dispose__6;
  v82 = 0;
  v70[0] = MEMORY[0x24BDAC760];
  v70[1] = 3221225472;
  v70[2] = __49__TypistKeyboardDataInProcess_getKeyboardLayout___block_invoke_2;
  v70[3] = &unk_251A7D130;
  v73 = v90;
  v74 = &v77;
  v38 = v4;
  v71 = v38;
  v75 = &v84;
  v76 = a1;
  v10 = v5;
  v72 = v10;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v70);
  v34 = v10;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend((id)v78[5], "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v94, 16);
  if (v19)
  {
    v37 = *(_QWORD *)v67;
    v20 = *MEMORY[0x24BDF7960];
    obj = v11;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v67 != v37)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
        TYLog(CFSTR("\n------------------------------------ PREPROCESSING Plane:%@"), v12, v13, v14, v15, v16, v17, v18, v22);
        v60 = 0;
        v61 = &v60;
        v62 = 0x3032000000;
        v63 = __Block_byref_object_copy__6;
        v64 = __Block_byref_object_dispose__6;
        v65 = 0;
        v54 = 0;
        v55 = &v54;
        v56 = 0x3032000000;
        v57 = __Block_byref_object_copy__6;
        v58 = __Block_byref_object_dispose__6;
        v59 = 0;
        v48 = 0;
        v49 = &v48;
        v50 = 0x3032000000;
        v51 = __Block_byref_object_copy__6;
        v52 = __Block_byref_object_dispose__6;
        v53 = 0;
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __49__TypistKeyboardDataInProcess_getKeyboardLayout___block_invoke_3;
        v40[3] = &unk_251A7D158;
        v42 = v92;
        v40[4] = v22;
        v43 = v90;
        v44 = &v60;
        v46 = &v48;
        v47 = a1;
        v45 = &v54;
        v23 = v38;
        v41 = v23;
        +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v40);
        objc_msgSend(a1, "getKeyboardUISettings");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "BOOLValue");

        if (v26)
        {
          objc_msgSend(a1, "addKeyboardGestureKeys:keys:inPlane:addTo:", v23, v61[5], v22, v49[5]);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v49[5];
          v49[5] = v27;

        }
        if (objc_msgSend(v23, "usePopupKeys"))
        {
          objc_msgSend(v23, "addKeyboardPopupKeys:inPlane:addTo:keyplaneKeycaps:", v61[5], v22, v49[5], v55[5]);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v49[5];
          v49[5] = v29;

        }
        objc_msgSend(v39, "setObject:forKey:", v49[5], v22);

        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v54, 8);

        _Block_object_dispose(&v60, 8);
      }
      v11 = obj;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v94, 16);
    }
    while (v19);
  }

  objc_msgSend(v34, "setObject:forKey:", v39, CFSTR("keyPlanes"));
  v31 = v72;
  v32 = v34;

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(v90, 8);
  _Block_object_dispose(v92, 8);

  return v32;
}

void __49__TypistKeyboardDataInProcess_getKeyboardLayout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_getCurrentKeyplaneName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__TypistKeyboardDataInProcess_getKeyboardLayout___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v38 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "performSelector:", sel_keyboard);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "subtrees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "containsString:", CFSTR("_")))
        {
          objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("_"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lowercaseString");
          v11 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v11;
        }
        objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(v38 + 32), "generateKeyplaneSwitchTable:", v2);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(v38 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = objc_msgSend(*(id *)(v38 + 32), "isTenKey");
  v16 = *(void **)(v38 + 72);
  v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v38 + 56) + 8) + 40);
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v38 + 64) + 8) + 40);
  if (v15)
    objc_msgSend(v16, "determineDefaultPlane10Key:basePlaneName:", v17, v18);
  else
    objc_msgSend(v16, "determineDefaultPlane:basePlaneName:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v38 + 40), "setObject:forKey:", v19, CFSTR("defaultPlaneName"));
  TYLog(CFSTR("#####  DEFAULT PLANE: %@"), v20, v21, v22, v23, v24, v25, v26, (char)v19);
  objc_msgSend(*(id *)(v38 + 72), "cleanUpSwitchTableBasedOnDefaultPlane:defaultPlaneName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v38 + 56) + 8) + 40), v19);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = *(_QWORD *)(*(_QWORD *)(v38 + 56) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v27;

  objc_msgSend(*(id *)(v38 + 40), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v38 + 56) + 8) + 40), CFSTR("planeSwitchTable"));
  TYLog(CFSTR("\nplaneSwitchTable = %@"), v30, v31, v32, v33, v34, v35, v36, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v38 + 56) + 8) + 40));

}

void __49__TypistKeyboardDataInProcess_getKeyboardLayout___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "keyplaneNamed:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_changeToKeyplane:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "keyplaneNamed:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keys");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 88), "updateCachedKeyplaneKeycaps:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(a1 + 88), "getKeyboardPlaneKeys:keys:inPlane:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 32));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

+ (id)getTIPreferences
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  _BOOL8 v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BEB5058];
  v5 = objc_msgSend(v3, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5058]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, v4);

  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BEB5060];
  v9 = objc_msgSend(v7, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5060]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v10, v8);

  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BEB5078];
  v13 = objc_msgSend(v11, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5078]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v14, v12);

  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BEB50C0];
  v17 = objc_msgSend(v15, "BOOLForPreferenceKey:", *MEMORY[0x24BEB50C0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v18, v16);

  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BEB5070];
  v21 = objc_msgSend(v19, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5070]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v22, v20);

  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x24BEB50C8];
  v25 = objc_msgSend(v23, "BOOLForPreferenceKey:", *MEMORY[0x24BEB50C8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v26, v24);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x24BEB4F58];
  v29 = objc_msgSend(v27, "BOOLForPreferenceKey:", *MEMORY[0x24BEB4F58]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v30, v28);

  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x24BEB5108];
  v33 = objc_msgSend(v31, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5108]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v34, v32);

  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *MEMORY[0x24BEB5118];
  v37 = objc_msgSend(v35, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5118]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v38, v36);

  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = *MEMORY[0x24BEB5050];
  v41 = objc_msgSend(v39, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5050]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v42, v40);

  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x24BEB5228];
  v45 = objc_msgSend(v43, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5228]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v46, v44);

  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *MEMORY[0x24BEB5110];
  v49 = objc_msgSend(v47, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5110]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v50, v48);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = *MEMORY[0x24BEB4F70];
  objc_msgSend(v51, "valueForPreferenceKey:", *MEMORY[0x24BEB4F70]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53 != 0;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v55, v52);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = *MEMORY[0x24BEB5238];
  objc_msgSend(v56, "valueForPreferenceKey:", *MEMORY[0x24BEB5238]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "intValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v60, v57);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = *MEMORY[0x24BEB5100];
  objc_msgSend(v61, "valueForPreferenceKey:", *MEMORY[0x24BEB5100]);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "intValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v65, v62);

  return v2;
}

+ (id)getKeyboardUISettings
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v3 = (void *)objc_opt_new();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __52__TypistKeyboardDataInProcess_getKeyboardUISettings__block_invoke;
  v26[3] = &unk_251A7C9D8;
  v26[4] = &v27;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v26);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v28 + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("floatingKeyboard"));

  v5 = objc_msgSend(MEMORY[0x24BDF6B50], "_showSmallDisplayKeyplane");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("LowerCaseKeyboard"));

  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferencesActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDF7960];
  v10 = objc_msgSend(v8, "BOOLForPreferenceKey:", *MEMORY[0x24BDF7960]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, v9);

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "dictationIsEnabled");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("dictation"));

  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BEB5068];
  objc_msgSend(v15, "valueForPreferenceKey:", *MEMORY[0x24BEB5068]);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = CFSTR("Unknown");
  if (v17)
    v19 = (__CFString *)v17;
  v20 = v19;

  objc_msgSend(v3, "setObject:forKey:", v20, v16);
  v21 = objc_msgSend(a1, "shouldShowDictationKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("shouldShowDictationKey"));

  v23 = objc_msgSend(a1, "shouldShowGlobeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("shouldShowGlobeKey"));

  _Block_object_dispose(&v27, 8);
  return v3;
}

uint64_t __52__TypistKeyboardDataInProcess_getKeyboardUISettings__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDF6B38], "isFloating");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)getSentenceBoundaryStrings
{
  return &unk_251A994E8;
}

+ (id)setTIPreferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  char v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  char v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  char v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  char v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  char v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  char v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  char v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  char v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  char v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  void *v176;
  uint64_t v177;
  void *v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getTIPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v9 = *MEMORY[0x24BEB5058];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB5058]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing AutoCapitalization Settings: Current=%d ChangeTo=%d"), v13, v14, v15, v16, v17, v18, v11);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setValue:forKey:", v20, 9);

    }
    v21 = *MEMORY[0x24BEB5060];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB5060]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing AutoCorrection Settings: Current=%d ChangeTo=%d"), v25, v26, v27, v28, v29, v30, v23);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v21);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setValue:forKey:", v32, 8);

    }
    v33 = *MEMORY[0x24BEB5078];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB5078]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing CheckSpelling Settings: Current=%d ChangeTo=%d"), v37, v38, v39, v40, v41, v42, v35);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v33);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setValue:forKey:", v44, 10);

    }
    v45 = *MEMORY[0x24BEB50C0];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB50C0]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v45);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing PeriodShortcut Settings: Current=%d ChangeTo=%d"), v49, v50, v51, v52, v53, v54, v47);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v45);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setValue:forKey:", v56, 11);

    }
    v57 = *MEMORY[0x24BEB5070];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB5070]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v57);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing CapsLock Settings: Current=%d ChangeTo=%d"), v61, v62, v63, v64, v65, v66, v59);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v57);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setValue:forKey:", v68, 12);

    }
    v69 = *MEMORY[0x24BEB50C8];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB50C8]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v69);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing Predictive Settings: Current=%d ChangeTo=%d"), v73, v74, v75, v76, v77, v78, v71);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v69);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setValue:forKey:", v80, 36);

    }
    v81 = *MEMORY[0x24BEB4F58];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB4F58]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v82, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v81);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing Fuzzy Settings: Current=%d ChangeTo=%d"), v85, v86, v87, v88, v89, v90, v83);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v81);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setValue:forPreferenceKey:", v92, v81);

    }
    v93 = *MEMORY[0x24BEB5108];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB5108]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v93);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing Smart Dashes Settings: Current=%d ChangeTo=%d"), v97, v98, v99, v100, v101, v102, v95);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v93);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setValue:forPreferenceKey:", v104, v93);

    }
    v105 = *MEMORY[0x24BEB5118];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB5118]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend(v106, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v93);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing Smart Quotes Settings: Current=%d ChangeTo=%d"), v109, v110, v111, v112, v113, v114, v107);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v105);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "setValue:forPreferenceKey:", v116, v105);

    }
    v117 = *MEMORY[0x24BEB5050];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB5050]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v118, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v117);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing KeyPaddle Settings: Current=%d ChangeTo=%d"), v121, v122, v123, v124, v125, v126, v119);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v117);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "setValue:forKey:", v128, 38);

    }
    v129 = *MEMORY[0x24BEB5228];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB5228]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = objc_msgSend(v130, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v129);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing Typology Settings: Current=%d ChangeTo=%d"), v133, v134, v135, v136, v137, v138, v131);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v129);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "setValue:forKey:", v140, 53);

    }
    v141 = *MEMORY[0x24BEB5110];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB5110]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = objc_msgSend(v142, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v141);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing Smart Full-width Settings: Current=%d ChangeTo=%d"), v145, v146, v147, v148, v149, v150, v143);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v141);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "setValue:forPreferenceKey:", v152, v141);

    }
    v153 = *MEMORY[0x24BEB4F70];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB4F70]))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v153);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = objc_msgSend(v154, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v153);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing Use CapsLock as Roman Switch Settings: Current=%d ChangeTo=%d"), v157, v158, v159, v160, v161, v162, v155);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v153);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "setValue:forPreferenceKey:", v164, v153);

    }
    v165 = *MEMORY[0x24BEB5238];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB5238]))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v165);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = objc_msgSend(a1, "getWubiEnumeration:", v166);

      objc_msgSend(v6, "objectForKeyedSubscript:", v165);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing Wubi Standard Settings: Current=%i, ChangeTo=%i"), v169, v170, v171, v172, v173, v174, (char)v168);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v167);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "setValue:forPreferenceKey:", v176, v165);

    }
    v177 = *MEMORY[0x24BEB5100];
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB5100]))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = objc_msgSend(a1, "getShuangpinEnumeration:", v178);

      objc_msgSend(v6, "objectForKeyedSubscript:", v177);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing Shaungpin Settings: Current=%i, ChangeTo=%i"), v181, v182, v183, v184, v185, v186, (char)v180);

      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v179);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "setValue:forPreferenceKey:", v188, v177);

    }
  }
  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "synchronizePreferences");

  +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.5);
  objc_msgSend(a1, "getTIPreferences");
  v190 = (void *)objc_claimAutoreleasedReturnValue();

  return v190;
}

+ (id)setKeyboardUISettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _UNKNOWN **v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  CFPropertyListRef *v50;
  void *v51;
  char v52;
  void *v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v79;
  _QWORD v80[4];
  char v81;
  char v82;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getKeyboardUISettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 0x24BDF6000;
  v10 = &off_251A7C000;
  if (!v7 || !objc_msgSend(v7, "count"))
    goto LABEL_22;
  if (objc_msgSend(v8, "containsObject:", CFSTR("floatingKeyboard")))
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 1)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("floatingKeyboard"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("floatingKeyboard"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      if (v16)
        v23 = CFSTR("Floating");
      else
        v23 = CFSTR("Not floating");
      TYLogl(OS_LOG_TYPE_DEFAULT, CFSTR("Changing Floating Settings: Current=%@ ChangeTo=%@"), v17, v18, v19, v20, v21, v22, (char)v23);
      v80[0] = MEMORY[0x24BDAC760];
      v80[1] = 3221225472;
      v80[2] = __53__TypistKeyboardDataInProcess_setKeyboardUISettings___block_invoke;
      v80[3] = &__block_descriptor_34_e5_v8__0l;
      v81 = v14;
      v9 = 0x24BDF6000;
      v82 = v16;
      +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v80);
    }
  }
  v24 = *MEMORY[0x24BDF7960];
  if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BDF7960]))
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "userInterfaceIdiom") != 1)
    {
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("floatingKeyboard"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");

    v9 = 0x24BDF6000;
    if ((v27 & 1) == 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "BOOLValue");
      TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing GestureKey Settings: Current=%d ChangeTo=%d"), v31, v32, v33, v34, v35, v36, v29);

      objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "preferencesActions");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v24);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setValue:forPreferenceKey:", v38, v24);

      v9 = 0x24BDF6000;
      goto LABEL_13;
    }
  }
LABEL_14:
  if (objc_msgSend(v8, "containsObject:", CFSTR("LowerCaseKeyboard")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LowerCaseKeyboard"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LowerCaseKeyboard"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "BOOLValue");
    v42 = v40;
    v9 = 0x24BDF6000;
    TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing SmallDisplay Settings: Current=%d ChangeTo=%d"), v43, v44, v45, v46, v47, v48, v42);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LowerCaseKeyboard"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
    if (!v49)
      v50 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
    CFPreferencesSetAppValue(CFSTR("LowerCaseKeyboard"), *v50, CFSTR("com.apple.Accessibility"));

  }
  if (objc_msgSend(v8, "containsObject:", CFSTR("dictation")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dictation"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictation"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "BOOLValue");
    v54 = v52;
    v9 = 0x24BDF6000;
    TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing Dictation Settings: Current=%d ChangeTo=%d"), v55, v56, v57, v58, v59, v60, v54);

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setSuppressDictationOptIn:", 1);

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictation"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setDictationIsEnabled:", objc_msgSend(v63, "BOOLValue"));

  }
  v64 = *MEMORY[0x24BEB5068];
  v10 = &off_251A7C000;
  if (objc_msgSend(v8, "containsObject:", *MEMORY[0x24BEB5068]))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v64);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    TYLogl(OS_LOG_TYPE_INFO, CFSTR("Changing Dictation Settings: Current=%@ ChangeTo=%@"), v66, v67, v68, v69, v70, v71, (char)v65);

    v9 = 0x24BDF6000uLL;
    objc_msgSend(v4, "objectForKeyedSubscript:", v64);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (id)objc_msgSend(a1, "setOneHandedKeyboardHandBias:", v72);

  }
LABEL_22:
  objc_msgSend(*(id *)(v9 + 2904), "sharedPreferencesController");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "preferencesActions");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "synchronizePreferences");

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "synchronize");

  objc_msgSend(v10[62], "waitFor:", 0.5);
  objc_msgSend(a1, "getKeyboardUISettings");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  return v77;
}

void __53__TypistKeyboardDataInProcess_setKeyboardUISettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(MEMORY[0x24BDF6B38], "supportsFloating")
    && *(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a1 + 33))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Dock and Merge"), CFSTR("Dock and Merge"), CFSTR("Localizable"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Floating"), CFSTR("Floating"), CFSTR("Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)-[objc_class performSelector:](NSClassFromString(CFSTR("UIKeyboardSplitControlMenu")), "performSelector:", sel_sharedInstance);
    if (*(_BYTE *)(a1 + 32))
      v5 = v3;
    else
      v5 = v2;
    objc_msgSend(v4, "performSelector:withObject:", sel_actionForItem_, v5);

  }
}

+ (id)setKeyboards:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = a3;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TYLog(CFSTR("Replacing keyboards with: %@"), v5, v6, v7, v8, v9, v10, v11, (char)v4);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  TYLog(CFSTR("Current Keyboards are\n%@"), v14, v15, v16, v17, v18, v19, v20, (char)v13);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setValue:forKey:", v3, 0);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValue:forKey:", MEMORY[0x24BDBD1C8], 1);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "synchronizePreferences");

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "valueForKey:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  TYLog(CFSTR("New Keyboard is\n%@"), v26, v27, v28, v29, v30, v31, v32, (char)v25);
  return v25;
}

+ (id)addKeyboards:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  TYLog(CFSTR("Appending keyboards: %@\n to current list: %@"), v7, v8, v9, v10, v11, v12, v13, (char)v3);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v14 = v3;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        v27 = objc_msgSend(v6, "containsObject:", v19);
        v28 = CFSTR("Keyboard [%@] already exists. Skipping...");
        if ((v27 & 1) == 0)
        {
          objc_msgSend(v6, "addObject:", v19);
          v28 = CFSTR("Added [%@] to list of keyboard IDs.");
        }
        TYLog(v28, v20, v21, v22, v23, v24, v25, v26, v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setValue:forKey:", v6, 0);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setValue:forKey:", MEMORY[0x24BDBD1C8], 1);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "synchronizePreferences");

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "valueForKey:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  TYLog(CFSTR("New Keyboards are:\n%@"), v34, v35, v36, v37, v38, v39, v40, (char)v33);
  return v33;
}

+ (id)removeKeyboards:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  TYLog(CFSTR("Removing keyboard: %@"), v4, v5, v6, v7, v8, v9, v10, (char)v3);
  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  TYLog(CFSTR("Current Keyboards are\n%@"), v14, v15, v16, v17, v18, v19, v20, (char)v13);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v21 = v3;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v56;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v56 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        v34 = objc_msgSend(v13, "containsObject:", v26);
        v35 = CFSTR("Unable to remove [%@] since the ID does not match any keyboard in the current set");
        if (v34)
        {
          if (objc_msgSend(v13, "count") == 1)
          {
            TYLog(CFSTR("[%@] cannot be removed, becuase it's the only keyboard enabled. Aborting..."), v36, v37, v38, v39, v40, v41, v42, v26);
            goto LABEL_13;
          }
          objc_msgSend(v13, "removeObject:", v26);
          v35 = CFSTR("Removed [%@] from the list of keyboards.");
        }
        TYLog(v35, v27, v28, v29, v30, v31, v32, v33, v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      if (v23)
        continue;
      break;
    }
  }
LABEL_13:

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setValue:forKey:", v13, 0);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "synchronizePreferences");

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "valueForKey:", 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  TYLog(CFSTR("New Keyboards are\n%@"), v47, v48, v49, v50, v51, v52, v53, (char)v46);
  return v46;
}

+ (id)dismissOneTimeTIActions:(id)a3
{
  return 0;
}

+ (BOOL)switchToKeyboard:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v4 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48__TypistKeyboardDataInProcess_switchToKeyboard___block_invoke;
  v16[3] = &unk_251A7C8B0;
  v5 = v3;
  v17 = v5;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v16);
  v6 = 10.0;
  while (1)
  {
    +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.2);
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __48__TypistKeyboardDataInProcess_switchToKeyboard___block_invoke_2;
    v15[3] = &unk_251A7C9D8;
    v15[4] = &v18;
    +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v15);
    v13 = objc_msgSend((id)v19[5], "isEqualToString:", v5);
    if (v13)
      break;
    v6 = v6 + -0.2;
    if (v6 <= 0.0)
    {
      TYLogl(OS_LOG_TYPE_ERROR, CFSTR("Unable to switch to keyboard [%@] after %ld"), v7, v8, v9, v10, v11, v12, (char)v5);
      goto LABEL_6;
    }
  }
  TYLogl(OS_LOG_TYPE_DEFAULT, CFSTR("Switched keyboard to %@"), v7, v8, v9, v10, v11, v12, (char)v5);
LABEL_6:

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __48__TypistKeyboardDataInProcess_switchToKeyboard___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDF6B40], "keyboardInputModeWithIdentifier:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setKeyboardInputMode:userInitiated:", v2, 1);

}

void __48__TypistKeyboardDataInProcess_switchToKeyboard___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_getLocalizedInputMode");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (BOOL)dismissKeyboard
{
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", &__block_literal_global_10);
  return 1;
}

void __46__TypistKeyboardDataInProcess_dismissKeyboard__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dismissKeyboard");

}

+ (BOOL)switchToPlane:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__TypistKeyboardDataInProcess_switchToPlane___block_invoke;
  v11[3] = &unk_251A7D1C0;
  v12 = v4;
  v13 = v6;
  v14 = v3;
  v7 = v3;
  v8 = v6;
  v9 = v4;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v11);

  return 1;
}

void __45__TypistKeyboardDataInProcess_switchToPlane___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "keyplaneNamed:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_changeToKeyplane:", v2);

}

+ (id)getVisibleKeyplaneName
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__6;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__TypistKeyboardDataInProcess_getVisibleKeyplaneName__block_invoke;
  v4[3] = &unk_251A7C9D8;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __53__TypistKeyboardDataInProcess_getVisibleKeyplaneName__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_getCurrentKeyplaneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)getKeyplaneDescription:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  v22 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__6;
  v15[4] = __Block_byref_object_dispose__6;
  objc_msgSend(v4, "_layout");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__6;
  v13[4] = __Block_byref_object_dispose__6;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__TypistKeyboardDataInProcess_getKeyplaneDescription___block_invoke;
  v8[3] = &unk_251A7D1E8;
  v10 = v13;
  v11 = v15;
  v5 = v3;
  v9 = v5;
  v12 = &v17;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v8);
  v6 = (id)v18[5];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(&v17, 8);
  return v6;
}

uint64_t __54__TypistKeyboardDataInProcess_getKeyplaneDescription___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "keyplaneNamed:", a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setName:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setIsLetters:", objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "isLetters"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setIsAlphabeticPlane:", objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "isAlphabeticPlane"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setIsShiftKeyplane:", objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "isShiftKeyplane"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setUsesAutoShift:", objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "usesAutoShift"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setIgnoresShiftState:", objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "ignoresShiftState"));
}

+ (id)getAllCandidates
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__TypistKeyboardDataInProcess_getAllCandidates__block_invoke;
  v5[3] = &unk_251A7C9D8;
  v5[4] = &v6;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v5);
  v2 = (void *)v7[5];
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v3 = v2;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__TypistKeyboardDataInProcess_getAllCandidates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_getAutocorrectionList");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)getVisibleCandidateList:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", CFSTR("typistCandidateBarTypeMecabra")))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__6;
    v13 = __Block_byref_object_dispose__6;
    v14 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__TypistKeyboardDataInProcess_getVisibleCandidateList___block_invoke;
    v8[3] = &unk_251A7C9D8;
    v8[4] = &v9;
    +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v8);
    v5 = (void *)v10[5];
    if (!v5)
      v5 = (void *)MEMORY[0x24BDBD1A8];
    v6 = v5;
    _Block_object_dispose(&v9, 8);

  }
  else if (objc_msgSend(v4, "isEqual:", CFSTR("typistCandidateBarTypeFavonious")))
  {
    objc_msgSend(a1, "getAllCandidates");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (id)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

void __55__TypistKeyboardDataInProcess_getVisibleCandidateList___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[TypistKeyboardUtilities searchForViewInKeyboardWindow:](TypistKeyboardUtilities, "searchForViewInKeyboardWindow:", CFSTR("TUICandidateView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(v2, "visibleCandidates");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v6;
  }

}

+ (CGPoint)getCandidateCenter:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  CGPoint result;

  v4 = a3;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x3010000000;
  v18 = 0;
  v19 = 0;
  v17 = &unk_2494BA09E;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__TypistKeyboardDataInProcess_getCandidateCenter___block_invoke;
  v10[3] = &unk_251A7D210;
  v5 = v4;
  v12 = &v14;
  v13 = a1;
  v11 = v5;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v10);
  v6 = v15[4];
  v7 = v15[5];

  _Block_object_dispose(&v14, 8);
  v8 = v6;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

void __50__TypistKeyboardDataInProcess_getCandidateCenter___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6FF8], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDBF070];
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v53 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        NSClassFromString(CFSTR("UIRemoteKeyboardWindow"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "allSubViews");
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v10 = (id)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v49;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v49 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                NSClassFromString(CFSTR("TUICandidateArrowButton"));
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  NSClassFromString(CFSTR("UIKeyboardCandidateUnsplitKeyboardToggleButton"));
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    continue;
                }
                objc_msgSend(v15, "superview");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "frame");
                objc_msgSend(v16, "convertRect:toView:", 0);
                v3 = v17;

                goto LABEL_21;
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
              if (v12)
                continue;
              break;
            }
          }
LABEL_21:

          goto LABEL_22;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_22:
  v43 = v4;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v18 = v10;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v45;
    while (2)
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v45 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
        NSClassFromString(CFSTR("TUICandidateCell"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v23, "performSelector:", sel_textLabel);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "text");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "isEqualToString:", *(_QWORD *)(a1 + 32)))
          {
            v26 = objc_msgSend(*(id *)(a1 + 48), "isCandidateCellVisible:", v23);

            if ((v26 & 1) != 0)
            {
              +[TypistKeyboardUtilities getRootViewControllerViaScene](TypistKeyboardUtilities, "getRootViewControllerViaScene");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "superview");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "frame");
              v30 = v29;
              v32 = v31;
              v34 = v33;
              v36 = v35;
              objc_msgSend(v27, "view");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "convertRect:toView:", v37, v30, v32, v34, v36);

              UIRectGetCenter();
              v40 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              *(_QWORD *)(v40 + 32) = v38;
              *(_QWORD *)(v40 + 40) = v39;
              v41 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v42 = *(double *)(v41 + 32);
              if (v42 >= v3 + -2.0)
                v42 = v3 + -2.0;
              *(double *)(v41 + 32) = v42;

              goto LABEL_39;
            }
          }
          else
          {

          }
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      if (v20)
        continue;
      break;
    }
  }
LABEL_39:

}

+ (CGPoint)getCandidateCenterAtIndex:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[7];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CGPoint result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = &unk_2494BA09E;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__TypistKeyboardDataInProcess_getCandidateCenterAtIndex___block_invoke;
  v7[3] = &unk_251A7D238;
  v7[4] = &v8;
  v7[5] = a3;
  v7[6] = a1;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.y = v6;
  result.x = v5;
  return result;
}

void __57__TypistKeyboardDataInProcess_getCandidateCenterAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6FF8], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v1)
  {
    v2 = 0;
    v26 = *(_QWORD *)v32;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v3);
        NSClassFromString(CFSTR("UIRemoteKeyboardWindow"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v4, "allSubViews");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v6)
          {
            v7 = *(_QWORD *)v28;
            do
            {
              v8 = 0;
              do
              {
                if (*(_QWORD *)v28 != v7)
                  objc_enumerationMutation(v5);
                v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
                NSClassFromString(CFSTR("UIMorphingLabel"));
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (*(_QWORD *)(a1 + 40) == v2)
                  {
                    +[TypistKeyboardUtilities getRootViewControllerViaScene](TypistKeyboardUtilities, "getRootViewControllerViaScene");
                    v10 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "superview");
                    v11 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "frame");
                    v13 = v12;
                    v15 = v14;
                    v17 = v16;
                    v19 = v18;
                    objc_msgSend(v10, "view");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "convertRect:toView:", v20, v13, v15, v17, v19);
                    UIRectGetCenter();
                    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
                    *(_QWORD *)(v21 + 32) = v22;
                    *(_QWORD *)(v21 + 40) = v23;

                    goto LABEL_18;
                  }
                  ++v2;
                }
                ++v8;
              }
              while (v6 != v8);
              v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v6);
          }
LABEL_18:

        }
        ++v3;
      }
      while (v3 != v1);
      v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v1);
  }

}

+ (CGRect)getCandidateBarRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[5];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  CGRect result;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x4010000000;
  v14 = &unk_2494BA09E;
  v15 = 0u;
  v16 = 0u;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__TypistKeyboardDataInProcess_getCandidateBarRect__block_invoke;
  v10[3] = &unk_251A7C9D8;
  v10[4] = &v11;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v10);
  v2 = v12[4];
  v3 = v12[5];
  v4 = v12[6];
  v5 = v12[7];
  _Block_object_dispose(&v11, 8);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

void __50__TypistKeyboardDataInProcess_getCandidateBarRect__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;

  +[TypistKeyboardUtilities searchForViewInKeyboardWindow:](TypistKeyboardUtilities, "searchForViewInKeyboardWindow:", CFSTR("TUICandidateView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v11 = v2;
    objc_msgSend(v2, "frame");
    v4 = v3;
    objc_msgSend(v11, "frame");
    v6 = v5;
    objc_msgSend(v11, "frame");
    v8 = v7;
    objc_msgSend(v11, "frame");
    v2 = v11;
    v9 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v9[4] = v4;
    v9[5] = v6;
    v9[6] = v8;
    v9[7] = v10;
  }

}

+ (__n128)getKeyboardScaleTransform
{
  return *(__n128 *)MEMORY[0x24BDAEE00];
}

+ (double)getKeyboardPPM
{
  return 0.0;
}

+ (BOOL)isExtendedCandidateViewMode
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__TypistKeyboardDataInProcess_isExtendedCandidateViewMode__block_invoke;
  v4[3] = &unk_251A7C9D8;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __58__TypistKeyboardDataInProcess_isExtendedCandidateViewMode__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidateList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "isExtendedList");

}

+ (CGPoint)getExtendedCandidateViewToggleButtonCenter
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[5];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  CGPoint result;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x3010000000;
  v10 = &unk_2494BA09E;
  v11 = *MEMORY[0x24BDBEFB0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__TypistKeyboardDataInProcess_getExtendedCandidateViewToggleButtonCenter__block_invoke;
  v6[3] = &unk_251A7C9D8;
  v6[4] = &v7;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v6);
  v2 = v8[4];
  v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  v4 = v2;
  v5 = v3;
  result.y = v5;
  result.x = v4;
  return result;
}

void __73__TypistKeyboardDataInProcess_getExtendedCandidateViewToggleButtonCenter__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6FF8], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    v18 = *(_QWORD *)v25;
    v19 = a1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "allSubViews", v18);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v21 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              NSClassFromString(CFSTR("TUICandidateArrowButton"));
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                NSClassFromString(CFSTR("UIKeyboardCandidateUnsplitKeyboardToggleButton"));
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
              }
              objc_msgSend(v13, "superview");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "frame");
              objc_msgSend(v14, "convertRect:toView:", 0);
              UIRectGetCenter();
              v15 = *(_QWORD *)(*(_QWORD *)(v19 + 32) + 8);
              *(_QWORD *)(v15 + 32) = v16;
              *(_QWORD *)(v15 + 40) = v17;

              goto LABEL_19;
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            v5 = v18;
            if (v10)
              continue;
            break;
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v4);
  }
LABEL_19:

}

+ (BOOL)hasMarkedText
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__TypistKeyboardDataInProcess_hasMarkedText__block_invoke;
  v4[3] = &unk_251A7C9D8;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __44__TypistKeyboardDataInProcess_hasMarkedText__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "hasMarkedText");

}

+ (id)markedText
{
  __CFString *v2;
  __CFString *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__TypistKeyboardDataInProcess_markedText__block_invoke;
  v5[3] = &unk_251A7C9D8;
  v5[4] = &v6;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v5);
  v2 = (__CFString *)v7[5];
  if (!v2)
    v2 = &stru_251A7DE60;
  v3 = v2;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__TypistKeyboardDataInProcess_markedText__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markedText");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (void)showCandidateAtIndex:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__TypistKeyboardDataInProcess_showCandidateAtIndex___block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a3;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v3);
}

void __52__TypistKeyboardDataInProcess_showCandidateAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidateList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showCandidateAtIndex:", *(_QWORD *)(a1 + 32));

}

+ (CGRect)findKeyBoundsInKeyboard:(id)a3
{
  id v3;
  __int128 v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  CGRect result;

  v3 = a3;
  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x4010000000;
  v23 = &unk_2494BA09E;
  v4 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
  v24 = *MEMORY[0x24BDBF070];
  v25 = v4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__6;
  v18[4] = __Block_byref_object_dispose__6;
  v19 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__TypistKeyboardDataInProcess_findKeyBoundsInKeyboard___block_invoke;
  v14[3] = &unk_251A7D260;
  v16 = v18;
  v5 = v3;
  v15 = v5;
  v17 = &v20;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v14);
  v6 = v21[4];
  v7 = v21[5];
  v8 = v21[6];
  v9 = v21[7];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

void __55__TypistKeyboardDataInProcess_findKeyBoundsInKeyboard___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layout");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "performSelector:", sel_keyboard);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v6, "subtrees", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "firstCachedKeyWithName:", a1[4]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "firstCachedKeyWithName:", a1[4]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "frame");
          v15 = *(_QWORD **)(a1[6] + 8);
          v15[4] = v16;
          v15[5] = v17;
          v15[6] = v18;
          v15[7] = v19;

          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "convertRect:toView:", 0, *(double *)(*(_QWORD *)(a1[6] + 8) + 32), *(double *)(*(_QWORD *)(a1[6] + 8) + 40), *(double *)(*(_QWORD *)(a1[6] + 8) + 48), *(double *)(*(_QWORD *)(a1[6] + 8) + 56));
  v20 = *(_QWORD **)(a1[6] + 8);
  v20[4] = v21;
  v20[5] = v22;
  v20[6] = v23;
  v20[7] = v24;

}

+ (id)generateKeyplaneSwitchTable:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  const __CFString *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  uint64_t v62;
  char v64;
  id obj;
  id v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[6];
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v66 = (id)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v3;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v80 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        TYLog(CFSTR("########  PLANE NAME: %@"), v5, v6, v7, v8, v9, v10, v11, (char)v15);
        if (objc_msgSend(v15, "hasSuffix:", CFSTR("-split")))
        {
          TYLog(CFSTR("                      ===> IGNORED"), v16, v17, v18, v19, v20, v21, v22, v64);
          continue;
        }
        v23 = (void *)objc_opt_new();
        v73 = 0;
        v74 = &v73;
        v75 = 0x3032000000;
        v76 = __Block_byref_object_copy__6;
        v77 = __Block_byref_object_dispose__6;
        v78 = 0;
        v72[0] = MEMORY[0x24BDAC760];
        v72[1] = 3221225472;
        v72[2] = __59__TypistKeyboardDataInProcess_generateKeyplaneSwitchTable___block_invoke;
        v72[3] = &unk_251A7D288;
        v72[4] = v15;
        v72[5] = &v73;
        +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v72);
        v24 = objc_msgSend((id)v74[5], "isAlphabeticPlane");
        objc_msgSend((id)v74[5], "isShiftKeyplane");
        objc_msgSend((id)v74[5], "isShiftKeyPlaneChooser");
        objc_msgSend((id)v74[5], "isLetters");
        TYLog(CFSTR("          { isAlphabet:%d, isShift:%d, isShiftChooser:%d, isLetters:%d }"), v25, v26, v27, v28, v29, v30, v31, v24);
        objc_msgSend((id)v74[5], "stringForProperty:", CFSTR("shift-alternate"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "getKeyboardUISettings");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("LowerCaseKeyboard"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v34, "BOOLValue") & 1) == 0)
        {

          goto LABEL_12;
        }
        objc_msgSend((id)v74[5], "stringForProperty:", CFSTR("shift-alternate-small-display"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35 == 0;

        if (!v36)
        {
          objc_msgSend((id)v74[5], "stringForProperty:", CFSTR("shift-alternate-small-display"));
          v33 = v32;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

        }
        if (objc_msgSend(v32, "length") && (objc_msgSend(v32, "isEqualToString:", v15) & 1) == 0)
        {
          objc_msgSend(v23, "setObject:forKey:", CFSTR("⇧"), v32);
          objc_msgSend(v4, "addObject:", v32);
          TYLog(CFSTR("      --> Shift --> %@"), v37, v38, v39, v40, v41, v42, v43, (char)v32);
        }
        objc_msgSend((id)v74[5], "stringForProperty:", CFSTR("more-alternate"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "getKeyboardUISettings");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("LowerCaseKeyboard"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v46, "BOOLValue") & 1) == 0)
        {

          goto LABEL_20;
        }
        objc_msgSend((id)v74[5], "stringForProperty:", CFSTR("more-alternate-small-display"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47 == 0;

        if (!v48)
        {
          objc_msgSend((id)v74[5], "stringForProperty:", CFSTR("more-alternate-small-display"));
          v45 = v44;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

        }
        if (objc_msgSend(v44, "length"))
        {
          objc_msgSend(v23, "setObject:forKey:", CFSTR("🔤"), v44);
          objc_msgSend(v4, "addObject:", v44);
          TYLog(CFSTR("      --> More  --> %@"), v49, v50, v51, v52, v53, v54, v55, (char)v44);
        }
        if (objc_msgSend(v23, "count"))
        {
          if (!objc_msgSend((id)v74[5], "isLetters")
            || (v56 = objc_msgSend((id)v74[5], "isShiftKeyplane"), v57 = CFSTR("YES"), v56))
          {
            v57 = CFSTR("NO");
          }
          objc_msgSend(v23, "setObject:forKey:", v57, CFSTR("maybeDefaultPlane"));
          objc_msgSend(v66, "setObject:forKey:", v23, v15);
        }
        _Block_object_dispose(&v73, 8);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    }
    while (v12);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend(v66, "allKeys");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
  if (v59)
  {
    v60 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v59; ++j)
      {
        if (*(_QWORD *)v69 != v60)
          objc_enumerationMutation(v58);
        v62 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
        if ((objc_msgSend(v4, "containsObject:", v62) & 1) == 0)
          objc_msgSend(v66, "removeObjectForKey:", v62);
      }
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
    }
    while (v59);
  }

  return v66;
}

void __59__TypistKeyboardDataInProcess_generateKeyplaneSwitchTable___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyplaneNamed:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)generateKeyplaneSwitchTableFor10Key:(id)a3
{
  id v3;
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id obj;
  void *v55;
  void *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v52 = (id)objc_opt_new();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v4)
  {
    v12 = v4;
    v13 = *(_QWORD *)v63;
    v51 = *(_QWORD *)v63;
    do
    {
      v14 = 0;
      v53 = v12;
      do
      {
        if (*(_QWORD *)v63 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v14);
        TYLog(CFSTR("########  PLANE NAME: %@"), v5, v6, v7, v8, v9, v10, v11, (char)v15);
        if (objc_msgSend(v15, "hasSuffix:", CFSTR("-split")))
        {
          TYLog(CFSTR("                      ===> IGNORED"), v16, v17, v18, v19, v20, v21, v22, v50);
        }
        else
        {
          v57 = v14;
          v23 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_layout");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "keyplaneNamed:", v15);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "stringForProperty:", CFSTR("shift-alternate"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "length"))
          {
            objc_msgSend(v23, "setObject:forKey:", CFSTR("⇧"), v27);
            TYLog(CFSTR("      --> Shift --> %@"), v28, v29, v30, v31, v32, v33, v34, (char)v27);
          }
          v55 = v27;
          v56 = v26;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          objc_msgSend(v26, "keys");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v59;
            do
            {
              for (i = 0; i != v37; ++i)
              {
                if (*(_QWORD *)v59 != v38)
                  objc_enumerationMutation(v35);
                objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "representedString");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "lowercaseString");
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v41, "hasSuffix:", CFSTR("-plane"))
                  && (objc_msgSend(v41, "isEqualToString:", v15) & 1) == 0)
                {
                  objc_msgSend(v23, "setObject:forKey:", v41, v41);
                  TYLog(CFSTR("      --> Switch --> %@"), v42, v43, v44, v45, v46, v47, v48, (char)v41);
                }

              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
            }
            while (v37);
          }

          objc_msgSend(v52, "setObject:forKey:", v23, v15);
          v12 = v53;
          v13 = v51;
          v14 = v57;
        }
        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v12);
  }

  return v52;
}

+ (id)determineDefaultPlane:(id)a3 basePlaneName:(id)a4
{
  id v5;
  const __CFString *v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  id v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
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
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v42 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v5, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v48 = v5;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v45)
  {
    v44 = *(_QWORD *)v60;
    v6 = CFSTR("🔤");
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v60 != v44)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(v5, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = v10;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        if (v11)
        {
          v12 = v11;
          v46 = i;
          v13 = 0;
          v14 = *(_QWORD *)v56;
          do
          {
            v15 = 0;
            v49 = v12;
            do
            {
              v16 = v13;
              if (*(_QWORD *)v56 != v14)
                objc_enumerationMutation(v50);
              v13 = *(id *)(*((_QWORD *)&v55 + 1) + 8 * v15);

              objc_msgSend(v5, "objectForKeyedSubscript:", v8);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", v13);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v18, "isEqualToString:", v6) & 1) != 0)
              {
                objc_msgSend(v5, "objectForKeyedSubscript:", v13);
                v19 = v14;
                v20 = v8;
                v21 = v6;
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("maybeDefaultPlane"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("YES"));

                v5 = v48;
                v6 = v21;
                v8 = v20;
                v14 = v19;
                v12 = v49;

                if (v24)
                  objc_msgSend(v47, "addObject:", v13);
              }
              else
              {

              }
              ++v15;
            }
            while (v12 != v15);
            v12 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
          }
          while (v12);

          i = v46;
        }

      }
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    }
    while (v45);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v25 = v47;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  v27 = v42;
  if (v26)
  {
    v28 = v26;
    v29 = 0;
    v30 = *(_QWORD *)v52;
    while (2)
    {
      v31 = 0;
      v32 = v29;
      do
      {
        if (*(_QWORD *)v52 != v30)
          objc_enumerationMutation(v25);
        v29 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * v31);

        if ((objc_msgSend(v27, "isEqualToString:", v29) & 1) != 0)
        {
LABEL_35:
          v40 = v29;

          goto LABEL_36;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v29);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", v27);
        v34 = objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v35 = (void *)v34;
          objc_msgSend(v5, "objectForKeyedSubscript:", v29);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v27);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("⇧"));

          v27 = v42;
          v5 = v48;

          if ((v38 & 1) != 0)
            goto LABEL_35;
        }
        else
        {

        }
        ++v31;
        v32 = v29;
      }
      while (v28 != v31);
      v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      if (v28)
        continue;
      break;
    }

  }
  if (objc_msgSend(v25, "count"))
  {
    objc_msgSend(v25, "allObjects");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndex:", 0);
    v40 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v40 = v27;
  }
LABEL_36:

  return v40;
}

+ (id)determineDefaultPlane10Key:(id)a3 basePlaneName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v25 = a4;
  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performSelector:", sel_keyboard);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = v8;
  objc_msgSend(v8, "subtrees");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v27;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v13)
        objc_enumerationMutation(v9);
      objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v14), "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "containsString:", CFSTR("_")))
      {
        objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("_"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lowercaseString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = v15;
      }
      objc_msgSend(v5, "allKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containsObject:", v12);

      if ((v19 & 1) != 0)
        break;
      if (v11 == ++v14)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v12 = 0;
  }

  if (objc_msgSend(v12, "length"))
  {
    v20 = v12;
    v21 = v25;
  }
  else
  {
    v21 = v25;
    objc_msgSend(a1, "determineDefaultPlane:basePlaneName:", v5, v25);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

+ (id)cleanUpSwitchTableBasedOnDefaultPlane:(id)a3 defaultPlaneName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  void *v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
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
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v36 = v6;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v39 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v62;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v62 != v38)
          objc_enumerationMutation(obj);
        v40 = v10;
        v11 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v10);
        objc_msgSend(v7, "addObject:", v11);
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = v13;
        v43 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
        if (v43)
        {
          v42 = *(_QWORD *)v58;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v58 != v42)
                objc_enumerationMutation(v41);
              v44 = v14;
              v15 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v14);
              objc_msgSend(v7, "addObject:", v15);
              v55 = 0u;
              v56 = 0u;
              v53 = 0u;
              v54 = 0u;
              objc_msgSend(v5, "objectForKeyedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "allKeys");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
              if (v18)
              {
                v19 = v18;
                v20 = *(_QWORD *)v54;
                do
                {
                  for (i = 0; i != v19; ++i)
                  {
                    if (*(_QWORD *)v54 != v20)
                      objc_enumerationMutation(v17);
                    v22 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
                    objc_msgSend(v7, "addObject:", v22);
                    v51 = 0u;
                    v52 = 0u;
                    v49 = 0u;
                    v50 = 0u;
                    objc_msgSend(v5, "objectForKeyedSubscript:", v22);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "allKeys");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
                    if (v25)
                    {
                      v26 = v25;
                      v27 = *(_QWORD *)v50;
                      do
                      {
                        for (j = 0; j != v26; ++j)
                        {
                          if (*(_QWORD *)v50 != v27)
                            objc_enumerationMutation(v24);
                          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j));
                        }
                        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
                      }
                      while (v26);
                    }

                  }
                  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
                }
                while (v19);
              }

              v14 = v44 + 1;
            }
            while (v44 + 1 != v43);
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
          }
          while (v43);
        }

        v10 = v40 + 1;
      }
      while (v40 + 1 != v39);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v39);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v5, "allKeys");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v65, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
        if ((objc_msgSend(v7, "containsObject:", v34) & 1) == 0)
          objc_msgSend(v5, "removeObjectForKey:", v34);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v65, 16);
    }
    while (v31);
  }

  return v5;
}

+ (id)getKeyboardPlaneKeys:(id)a3 keys:(id)a4 inPlane:(id)a5
{
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  _BOOL4 v50;
  unint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v65;
  void *v66;
  int v67;
  int v68;
  id v70;
  uint64_t v71;
  id v72;
  id v73;
  __CFString *v74;
  void *v75;
  id v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[5];
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  char v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _QWORD v93[11];
  _QWORD v94[13];

  v94[11] = *MEMORY[0x24BDAC8D0];
  v76 = a3;
  v72 = a4;
  v70 = a5;
  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v76, "shouldShowDictationKey");
  v67 = objc_msgSend(v76, "shouldShowGlobeKey");
  objc_msgSend(v66, "_layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "globeKeyDisplaysAsEmojiKey");

  objc_msgSend(v66, "_layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "showsDedicatedEmojiKeyAlongsideGlobeButton");

  v11 = (void *)objc_opt_new();
  if (objc_msgSend(v72, "count"))
  {
    v12 = 0;
    v65 = v8 ^ 1 | v10;
    while (1)
    {
      v71 = v12;
      objc_msgSend(v72, "objectAtIndexedSubscript:");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "changeKeyNameToGenericCharacter:", v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v77, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lowercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "hasPrefix:", CFSTR("copy-")) & 1) != 0)
        goto LABEL_6;
      objc_msgSend(v77, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lowercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "hasPrefix:", CFSTR("cut-")) & 1) != 0)
        break;
      objc_msgSend(v77, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lowercaseString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "hasPrefix:", CFSTR("paste-"));

      if ((v23 & 1) != 0)
        goto LABEL_7;
      v19 = v14;
      if (v14
        || (objc_msgSend(v77, "representedString"), (v19 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
      {
LABEL_8:
        v73 = v70;
        v74 = v19;
        if ((-[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("Dictation")) & 1) != 0)
        {
          v20 = v68;
        }
        else if (-[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("🌐")))
        {
          if ((v65 & 1) != 0)
          {
            v20 = v67;
          }
          else
          {

            v20 = v67;
            v74 = CFSTR("Emoji");
          }
        }
        else
        {
          v20 = objc_msgSend(v77, "visible");
        }
        objc_msgSend(v77, "frame");
        UIRectGetCenter();
        objc_msgSend(a1, "centerOfKey:withOffset:");
        v25 = v24;
        v27 = v26;
        objc_msgSend(v76, "convertRepresentedStringsIfNecessary:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v94[0] = v75;
        v93[0] = CFSTR("key");
        v93[1] = CFSTR("keyname");
        objc_msgSend(v77, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v94[1] = v28;
        v94[2] = CFSTR("tap");
        v93[2] = CFSTR("action");
        v93[3] = CFSTR("x");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v94[3] = v29;
        v93[4] = CFSTR("y");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v94[4] = v30;
        v93[5] = CFSTR("rect");
        v31 = (void *)MEMORY[0x24BDD1968];
        objc_msgSend(v77, "frame");
        objc_msgSend(v31, "valueWithCGRect:");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v94[5] = v32;
        v94[6] = v73;
        v93[6] = CFSTR("plane");
        v93[7] = CFSTR("more-after");
        objc_msgSend(v77, "cache");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKey:", CFSTR("more-after"));
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
        if (v34)
          v36 = (void *)v34;
        else
          v36 = &unk_251A95888;
        v94[7] = v36;
        v94[8] = CFSTR("basekey");
        v93[8] = CFSTR("type");
        v93[9] = CFSTR("visible");
        v37 = MEMORY[0x24BDBD1C0];
        if (v20)
          v37 = MEMORY[0x24BDBD1C8];
        v94[9] = v37;
        v93[10] = CFSTR("secondaryDisplayString");
        objc_msgSend(v77, "secondaryDisplayStrings");
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v38;
        v40 = &stru_251A7DE60;
        if (v38)
          v40 = (const __CFString *)v38;
        v94[10] = v40;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v94, v93, 11);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setValue:forKey:", v41, v75);
        v87 = 0;
        v88 = &v87;
        v89 = 0x2020000000;
        v90 = 0;
        v86[0] = MEMORY[0x24BDAC760];
        v86[1] = 3221225472;
        v86[2] = __65__TypistKeyboardDataInProcess_getKeyboardPlaneKeys_keys_inPlane___block_invoke;
        v86[3] = &unk_251A7C9D8;
        v86[4] = &v87;
        +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v86);
        objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v42, "userInterfaceIdiom") == 1)
        {
          objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v43, "userInterfaceIdiom") == 1)
          {
            v44 = *((_BYTE *)v88 + 24) == 0;

            if (v44)
              goto LABEL_41;
LABEL_31:
            v84 = 0u;
            v85 = 0u;
            v82 = 0u;
            v83 = 0u;
            objc_msgSend(v77, "secondaryDisplayStrings");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
            if (v45)
            {
              v46 = *(_QWORD *)v83;
              do
              {
                for (i = 0; i != v45; ++i)
                {
                  if (*(_QWORD *)v83 != v46)
                    objc_enumerationMutation(v42);
                  objc_msgSend(CFSTR("⊎"), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "setValue:forKey:", v41, v48);

                }
                v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
              }
              while (v45);
            }
          }
          else
          {

          }
LABEL_41:
          if (objc_msgSend(v76, "isTenKey"))
          {
            objc_msgSend(v76, "setupTenKey:forKey:keyName:planeName:", v11, v77, v75, v73);
          }
          else if ((objc_msgSend(v76, "isTenKey") & 1) == 0 && objc_msgSend(v76, "isKanaKeyboard"))
          {
            objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v49, "userInterfaceIdiom") == 1)
            {
              v50 = *((_BYTE *)v88 + 24) == 0;

              if (v50)
                objc_msgSend(v76, "setup50OnFlick:forKey:keyName:planeName:", v11, v77, v75, v73);
            }
            else
            {

            }
          }
          _Block_object_dispose(&v87, 8);

          goto LABEL_50;
        }

        goto LABEL_31;
      }
LABEL_50:

      v51 = objc_msgSend(v72, "count");
      v12 = v71 + 1;
      if (v51 <= v71 + 1)
        goto LABEL_51;
    }

LABEL_6:
LABEL_7:
    objc_msgSend(v77, "name");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v19)
      goto LABEL_8;
    goto LABEL_50;
  }
LABEL_51:
  v52 = (void *)objc_opt_new();
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v53 = v11;
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
  if (v54)
  {
    v55 = *(_QWORD *)v79;
    do
    {
      for (j = 0; j != v54; ++j)
      {
        if (*(_QWORD *)v79 != v55)
          objc_enumerationMutation(v53);
        objc_msgSend(v52, "appendFormat:", CFSTR("[%@]"), *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j));
      }
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    }
    while (v54);
  }

  TYLog(CFSTR("Plane: %@, Keys -> %@"), v57, v58, v59, v60, v61, v62, v63, (char)v70);
  return v53;
}

uint64_t __65__TypistKeyboardDataInProcess_getKeyboardPlaneKeys_keys_inPlane___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDF6B38], "isFloating");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)updateCachedKeyplaneKeycaps:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "displayString", (_QWORD)v20);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          v14 = objc_msgSend(v11, "interactionType");

          if (v14 != 10)
          {
            v15 = objc_msgSend(MEMORY[0x24BDF6B50], "_showSmallDisplayKeyplane");
            objc_msgSend(v11, "displayString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if ((v15 & 1) == 0)
            {
              objc_msgSend(v16, "uppercaseStringWithLocale:", v5);
              v18 = objc_claimAutoreleasedReturnValue();

              v17 = (void *)v18;
            }
            objc_msgSend(v4, "addObject:", v17);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  return v4;
}

+ (CGPoint)centerOfKey:(CGPoint)a3 withOffset:(CGPoint)a4
{
  CGFloat v4;
  CGFloat v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  CGPoint result;

  v4 = a3.x + a4.x;
  v5 = a3.y + a4.y;
  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x3010000000;
  v22 = 0;
  v23 = 0;
  v21 = &unk_2494BA09E;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__TypistKeyboardDataInProcess_centerOfKey_withOffset___block_invoke;
  v13[3] = &unk_251A7D2B0;
  v15 = &v18;
  v8 = v7;
  v14 = v8;
  v16 = v4;
  v17 = v5;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v13);
  v9 = v19[4];
  v10 = v19[5];

  _Block_object_dispose(&v18, 8);
  v11 = v9;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

void __54__TypistKeyboardDataInProcess_centerOfKey_withOffset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:toLayer:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v4;

}

+ (id)addKeyboardGestureKeys:(id)a3 keys:(id)a4 inPlane:(id)a5 addTo:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  float v41;
  float v42;
  void *v43;
  void *v44;
  float v45;
  float v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v75;
  void *v76;
  unint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  id obj;
  int v83;
  id v84;
  id v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[5];
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  char v99;
  _BYTE v100[128];
  _QWORD v101[8];
  _QWORD v102[8];
  _BYTE v103[128];
  _QWORD v104[3];

  v104[1] = *MEMORY[0x24BDAC8D0];
  v85 = a3;
  v9 = a4;
  v10 = a5;
  v84 = a6;
  v76 = v9;
  v78 = v10;
  if (!v9 || !v10)
  {
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("[addKeyboardGestureKeys] - FAILURE - keys or planeName is missing!"), v11, v12, v13, v14, v15, v16, v75);
    goto LABEL_50;
  }
  v96 = 0;
  v97 = &v96;
  v98 = 0x2020000000;
  v99 = 0;
  v95[0] = MEMORY[0x24BDAC760];
  v95[1] = 3221225472;
  v95[2] = __73__TypistKeyboardDataInProcess_addKeyboardGestureKeys_keys_inPlane_addTo___block_invoke;
  v95[3] = &unk_251A7C9D8;
  v95[4] = &v96;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v95);
  v77 = 0;
LABEL_4:
  if (objc_msgSend(v76, "count") > v77)
  {
    objc_msgSend(v76, "objectAtIndexedSubscript:");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "changeKeyNameToGenericCharacter:", v17);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v86)
    {
      objc_msgSend(v79, "representedString");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v79, "secondaryRepresentedStrings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      if (objc_msgSend(v79, "displayTypeHint") == 10)
      {

LABEL_10:
        objc_msgSend(v79, "secondaryRepresentedStrings");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        obj = v19;
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
        if (!v25)
          goto LABEL_36;
        v83 = 0;
        v80 = *(_QWORD *)v92;
        while (1)
        {
          v81 = v25;
          for (i = 0; i != v81; ++i)
          {
            if (*(_QWORD *)v92 != v80)
              objc_enumerationMutation(obj);
            v27 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
            v28 = objc_msgSend(obj, "count");
            if (v28 == 1)
            {
              v37 = CFSTR("↓");
              v38 = CFSTR("flick-down");
LABEL_32:
              objc_msgSend(v84, "objectForKey:", v86);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("x"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "floatValue");
              v42 = v41;
              objc_msgSend(v84, "objectForKey:", v86);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("y"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "floatValue");
              v46 = v45;

              LODWORD(v47) = 1118175232;
              objc_msgSend(v85, "calculateCoordinatesForFlickGesture:direction:offset:", v37, v42, v46, v47);
              v49 = v48;
              v51 = v50;
              v101[0] = CFSTR("key");
              objc_msgSend(v85, "convertRepresentedStringsIfNecessary:", v27);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v102[0] = v52;
              v101[1] = CFSTR("keyname");
              objc_msgSend(v79, "name");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v102[1] = v53;
              v102[2] = v86;
              v101[2] = CFSTR("basekey");
              v101[3] = CFSTR("action");
              v102[3] = v38;
              v101[4] = CFSTR("x");
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v49);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v102[4] = v54;
              v101[5] = CFSTR("y");
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v51);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v102[5] = v55;
              v102[6] = v78;
              v101[6] = CFSTR("plane");
              v101[7] = CFSTR("type");
              v102[7] = CFSTR("gesture");
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 8);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "convertRepresentedStringsIfNecessary:", v27);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFString stringByAppendingString:](v37, "stringByAppendingString:", v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "setValue:forKey:", v56, v58);

              ++v83;
              continue;
            }
            if (v28 == 2)
            {
              v35 = CFSTR("↙");
              if (v83)
              {
                v36 = CFSTR("flick-down-left");
              }
              else
              {
                v35 = CFSTR("↘");
                v36 = CFSTR("flick-down-right");
              }
              v37 = v35;
              v38 = v36;
              goto LABEL_32;
            }
            TYLogl(OS_LOG_TYPE_ERROR, CFSTR("Too many secondaryRepresentedStrings on key '%@'. Unable to determine gesture direction."), v29, v30, v31, v32, v33, v34, (char)v86);
          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
          if (!v25)
          {
LABEL_36:

            ++v77;
            goto LABEL_4;
          }
        }
      }
      if (objc_msgSend(v79, "displayType") == 7)
      {
        objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "userInterfaceIdiom") == 1)
        {
          v21 = *((_BYTE *)v97 + 24) == 0;

          if (v21)
            goto LABEL_10;
LABEL_17:
          objc_msgSend(v79, "gestureKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v79, "gestureKey");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "representedString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v104[0] = v24;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v104, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v19 = 0;
          }
          goto LABEL_20;
        }

      }
    }

    goto LABEL_17;
  }
  v59 = (void *)objc_opt_new();
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v60 = v84;
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
  if (v61)
  {
    v62 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v61; ++j)
      {
        if (*(_QWORD *)v88 != v62)
          objc_enumerationMutation(v60);
        v64 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
        if ((objc_msgSend(v64, "hasPrefix:", CFSTR("↓")) & 1) != 0
          || (objc_msgSend(v64, "hasPrefix:", CFSTR("↘")) & 1) != 0
          || objc_msgSend(v64, "hasPrefix:", CFSTR("flick-down-left")))
        {
          objc_msgSend(v60, "objectForKeyedSubscript:", v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("basekey"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "appendFormat:", CFSTR("[%@{%@}]"), v64, v66);

        }
      }
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
    }
    while (v61);
  }

  TYLog(CFSTR("Plane: %@, Gesture keys -> %@"), v67, v68, v69, v70, v71, v72, v73, (char)v78);
  _Block_object_dispose(&v96, 8);
LABEL_50:

  return v84;
}

uint64_t __73__TypistKeyboardDataInProcess_addKeyboardGestureKeys_keys_inPlane_addTo___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDF6B38], "isFloating");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)addKeyboardPopupKeys:(id)a3 keys:(id)a4 inPlane:(id)a5 addTo:(id)a6 keyplaneKeycaps:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  uint64_t v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v68;
  id obj;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  id v75;
  void *v76;
  id v77;
  id v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
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
  _QWORD v96[4];
  id v97;
  id v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  _BYTE v111[128];
  _QWORD v112[9];
  _QWORD v113[9];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;
  CGRect v117;

  v116 = *MEMORY[0x24BDAC8D0];
  v75 = a3;
  v11 = a4;
  v12 = a5;
  v81 = a6;
  v71 = a7;
  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = 0;
  v106 = &v105;
  v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__6;
  v109 = __Block_byref_object_dispose__6;
  v110 = 0;
  v101 = 0;
  v102 = &v101;
  v103 = 0x2020000000;
  v104 = 0;
  v96[0] = MEMORY[0x24BDAC760];
  v96[1] = 3221225472;
  v96[2] = __87__TypistKeyboardDataInProcess_addKeyboardPopupKeys_keys_inPlane_addTo_keyplaneKeycaps___block_invoke;
  v96[3] = &unk_251A7D2D8;
  v99 = &v105;
  v70 = v14;
  v97 = v70;
  v77 = v12;
  v98 = v77;
  v100 = &v101;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v96);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_referenceBounds");
  v68 = CGRectGetHeight(v117) > 1194.0 && *((_BYTE *)v102 + 24) == 0;

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = v11;
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
  if (v73)
  {
    v72 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v73; ++i)
      {
        if (*(_QWORD *)v93 != v72)
          objc_enumerationMutation(obj);
        v80 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
        objc_msgSend(v80, "representedString");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v82, "length"))
          goto LABEL_40;
        if (objc_msgSend(v80, "displayType") == 7)
        {
          objc_msgSend(v80, "secondaryRepresentedStrings");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "count"))
          {
            v17 = objc_msgSend((id)v106[5], "isShiftKeyplane");

            if (!v17)
              goto LABEL_15;
            objc_msgSend(v80, "secondaryRepresentedStrings");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "firstObject");
            v18 = objc_claimAutoreleasedReturnValue();

            v82 = (void *)v18;
          }

        }
LABEL_15:
        if (!objc_msgSend(a1, "generatePopupKeySubtrees:key:plane:layout:keyplaneKeycaps:", v75, v80, v106[5], v70, v71))goto LABEL_40;
        objc_msgSend(v81, "objectForKeyedSubscript:", v82);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19 == 0;

        if (v20)
          goto LABEL_40;
        objc_msgSend(v80, "subtrees");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count") == 1)
        {
          objc_msgSend(v80, "subtrees");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "secondaryDisplayStrings");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            v25 = v68;
          else
            v25 = 0;

          if (v25)
            goto LABEL_40;
        }
        else
        {

        }
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        objc_msgSend(v80, "subtrees");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v88, v114, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v89;
          v79 = v26;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v89 != v28)
                objc_enumerationMutation(v79);
              v30 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
              objc_msgSend(v30, "representedString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v31, "isEqualToString:", v82) & 1) == 0)
              {
                objc_msgSend(v30, "frame");
                UIRectGetCenter();
                objc_msgSend(a1, "centerOfKey:withOffset:");
                v33 = v32;
                v35 = v34;
                v113[0] = v31;
                v112[0] = CFSTR("key");
                v112[1] = CFSTR("keyname");
                objc_msgSend(v30, "name");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v113[1] = v36;
                v113[2] = CFSTR("drag");
                v112[2] = CFSTR("action");
                v112[3] = CFSTR("x");
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v33);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v113[3] = v37;
                v112[4] = CFSTR("y");
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v35);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v113[4] = v38;
                v113[5] = CFSTR("popover");
                v112[5] = CFSTR("type");
                v112[6] = CFSTR("basekey");
                v113[6] = v82;
                v113[7] = v77;
                v112[7] = CFSTR("plane");
                v112[8] = CFSTR("more-after");
                objc_msgSend(v80, "cache");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "objectForKey:", CFSTR("more-after"));
                v40 = objc_claimAutoreleasedReturnValue();
                v41 = (void *)v40;
                v42 = &unk_251A95888;
                if (v40)
                  v42 = (void *)v40;
                v113[8] = v42;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v113, v112, 9);
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v81, "objectForKeyedSubscript:", v31);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = v44 == 0;

                if (v45)
                {
                  objc_msgSend(v81, "setValue:forKey:", v43, v31);
                  objc_msgSend(v76, "appendString:", v31);
                }
                else
                {
                  objc_msgSend(v75, "keyboardID");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = objc_msgSend(v46, "hasPrefix:", CFSTR("am"));

                  if (v47)
                  {
                    objc_msgSend(CFSTR("‍"), "stringByAppendingString:", v31);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "setValue:forKey:", v43, v48);

                    objc_msgSend(CFSTR("‍"), "stringByAppendingString:", v31);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "appendString:", v49);

                  }
                }

              }
            }
            v26 = v79;
            v27 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v88, v114, 16);
          }
          while (v27);
        }

LABEL_40:
      }
      v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
    }
    while (v73);
  }

  v83 = (void *)objc_opt_new();
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v50 = v81;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v84, v111, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v85;
    do
    {
      for (k = 0; k != v51; ++k)
      {
        if (*(_QWORD *)v85 != v52)
          objc_enumerationMutation(v50);
        v54 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * k);
        objc_msgSend(v50, "objectForKeyedSubscript:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("type"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("popover"));

        if (v57)
        {
          objc_msgSend(v50, "objectForKeyedSubscript:", v54);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("basekey"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "appendFormat:", CFSTR("[%@{%@}]"), v54, v59);

        }
      }
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v84, v111, 16);
    }
    while (v51);
  }

  TYLog(CFSTR("Plane: %@, Popup keys -> %@"), v60, v61, v62, v63, v64, v65, v66, (char)v77);
  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);

  return v50;
}

uint64_t __87__TypistKeyboardDataInProcess_addKeyboardPopupKeys_keys_inPlane_addTo_keyplaneKeycaps___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "keyplaneNamed:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(MEMORY[0x24BDF6B38], "isFloating");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

+ (BOOL)generatePopupKeySubtrees:(id)a3 key:(id)a4 plane:(id)a5 layout:(id)a6 keyplaneKeycaps:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(v13, "state");
  if (v13 && (objc_msgSend(a1, "downActionFlagsForKey:plane:keyplaneKeycaps:", v13, v14, v16) & 0x1000F8000) != 0)
    objc_msgSend(a1, "showPopupVariantsForKey:key:plane:keyplaneKeycaps:", v12, v13, v14, v16);
  objc_msgSend(v13, "subtrees");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = objc_msgSend(v13, "state");

    if (v19 == 16)
    {
      v20 = objc_msgSend(v13, "selectedVariantIndex");
      objc_msgSend(v13, "highlightedVariantsList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSelectedVariantIndex:", 0);
      objc_msgSend(v13, "setHighlightedVariantsList:", 0);
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __89__TypistKeyboardDataInProcess_generatePopupKeySubtrees_key_plane_layout_keyplaneKeycaps___block_invoke;
      v23[3] = &unk_251A7D1C0;
      v21 = v13;
      v24 = v21;
      v25 = v15;
      v26 = v14;
      +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v23);
      objc_msgSend(v21, "setSelectedVariantIndex:", v20);
      objc_msgSend(v21, "setHighlightedVariantsList:", v18);

      LOBYTE(v18) = 1;
    }
    else
    {
      LOBYTE(v18) = 0;
    }
  }
  objc_msgSend(v13, "setState:", v17);

  return (char)v18;
}

void __89__TypistKeyboardDataInProcess_generatePopupKeySubtrees_key_plane_layout_keyplaneKeycaps___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "dynamicLayout");
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "preparePopupVariantsForKey:onKeyplane:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v3, "currentKeyplaneView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "factory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "traitsForKey:onKeyplane:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

+ (void)showPopupVariantsForKey:(id)a3 key:(id)a4 plane:(id)a5 keyplaneKeycaps:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  int v56;
  int v57;
  void *v58;
  char v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  BOOL v81;
  void *v82;
  unint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int16 v95;
  _QWORD v96[4];
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[4];
  id v103;
  uint64_t *v104;
  uint64_t *v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  char v118;
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;
  CGRect v122;

  v121 = *MEMORY[0x24BDAC8D0];
  v87 = a3;
  v10 = a4;
  v89 = a5;
  v88 = a6;
  v90 = v10;
  if (!v10 || objc_msgSend(v10, "state") == 16)
    goto LABEL_95;
  objc_msgSend(v10, "representedString");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardGetCurrentUILanguage();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(a1, "downActionFlagsForKey:plane:keyplaneKeycaps:", v10, v89, v88);
  v115 = 0;
  v116 = &v115;
  v117 = 0x2020000000;
  v118 = 0;
  v111 = 0;
  v112 = &v111;
  v113 = 0x2020000000;
  v114 = 0;
  v107 = 0;
  v108 = &v107;
  v109 = 0x2020000000;
  v110 = 0;
  v12 = MEMORY[0x24BDAC760];
  v102[0] = MEMORY[0x24BDAC760];
  v102[1] = 3221225472;
  v102[2] = __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke_2;
  v102[3] = &unk_251A7D300;
  v104 = &v115;
  v73 = v11;
  v103 = v73;
  v105 = &v111;
  v106 = &v107;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v102);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v13, "userInterfaceIdiom") == 1 && *((_BYTE *)v108 + 24) == 0;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_referenceBounds");
  v15 = CGRectGetHeight(v122) > 1194.0 && *((_BYTE *)v108 + 24) == 0;

  if ((v86 & 0x8000) != 0)
  {
    UIKeyboardGetCurrentInputMode();
    v22 = objc_claimAutoreleasedReturnValue();

    v24 = v76;
    v16 = v24;
    if ((v86 & 0x80000) != 0)
    {
      objc_msgSend(v89, "componentName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingFormat:", CFSTR("-%@"), v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v90, "displayType") == 7)
    {
      objc_msgSend(v90, "secondaryRepresentedStrings");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count") == 0;

      if (!v27)
      {
        objc_msgSend(v90, "secondaryRepresentedStrings");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByAppendingString:", v29);
        v30 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v30;
      }
    }
    UIKeyboardRomanAccentVariants();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15
      && objc_msgSend(v90, "displayType") == 7
      && objc_msgSend(v90, "interactionType") == 2
      && objc_msgSend(v90, "variantType") != 3)
    {
      if (*((_BYTE *)v116 + 24) && !*((_BYTE *)v112 + 24))
      {
        objc_msgSend(v90, "secondaryRepresentedStrings");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectAtIndex:", 0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v65;
        if (v65)
        {
          v67 = v65;
        }
        else
        {
          objc_msgSend(v90, "representedString");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "substringFromIndex:", 1);
          v67 = (id)objc_claimAutoreleasedReturnValue();

        }
        if ((v86 & 0x80000) != 0)
        {
          objc_msgSend(v89, "componentName");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringByAppendingFormat:", CFSTR("-%@"), v69);
          v70 = objc_claimAutoreleasedReturnValue();

          v67 = (id)v70;
        }
        UIKeyboardRomanAccentVariants();
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = v67;
      }
      else
      {
        objc_msgSend(a1, "_variantsByAppendingDualStringKey:toVariants:", v90, v31);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v23 = v31;
    }
    goto LABEL_38;
  }
  if ((v86 & 0x40000) != 0 && ((*((_BYTE *)v116 + 24) != 0) & ~v15) == 0)
  {
    UIKeyboardCurrencyVariants();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15 ^ 1;
    if (v16)
      v17 = 1;
    if ((v17 & 1) == 0)
    {
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      objc_msgSend(v10, "secondaryRepresentedStrings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v99;
LABEL_17:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v99 != v20)
            objc_enumerationMutation(v18);
          UIKeyboardCurrencyVariants();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            break;
          if (v19 == ++v21)
          {
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
            if (v19)
              goto LABEL_17;
            goto LABEL_23;
          }
        }
      }
      else
      {
LABEL_23:
        v16 = 0;
      }

    }
    if (v16)
    {
      v22 = (uint64_t)v80;
      if (v15)
      {
LABEL_27:
        objc_msgSend(a1, "_variantsByAppendingDualStringKey:toVariants:", v90, v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:

LABEL_39:
        v80 = (void *)v22;
        goto LABEL_41;
      }
    }
    else
    {
      UIKeyboardGetCurrentInputMode();
      v22 = objc_claimAutoreleasedReturnValue();

      UIKeyboardCurrencyVariants();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_27;
    }
    v23 = v16;
    goto LABEL_39;
  }
  v23 = 0;
LABEL_41:
  objc_msgSend(v23, "objectForKey:", *MEMORY[0x24BDF7B68]);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", *MEMORY[0x24BDF7B60]);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v23;
  if (v23 && objc_msgSend(v77, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v77);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v75);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", *MEMORY[0x24BDF7B58]);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v82 && v84 && v71)
    {
      v32 = objc_msgSend(v71, "isEqualToString:", *MEMORY[0x24BDF7950]);
      if ((v32 & 1) != 0
        || (v32 = objc_msgSend(v71, "isEqualToString:", *MEMORY[0x24BDF7958]), (v32 & 1) != 0)
        || (v32 = objc_msgSend(v71, "isEqualToString:", *MEMORY[0x24BDF7948]), (_DWORD)v32))
      {
        __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke(v32, v82);
        __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke(v33, v84);
      }
      v34 = objc_msgSend(v82, "count");
      if (v34 <= objc_msgSend(v84, "count"))
        v35 = v82;
      else
        v35 = v84;
      v79 = objc_msgSend(v35, "count");
      v96[0] = v12;
      v96[1] = 3221225472;
      v96[2] = __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke_3;
      v96[3] = &unk_251A7C8B0;
      v97 = v73;
      +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v96);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "representedString");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v90, "displayType") == 7 && (unint64_t)objc_msgSend(v76, "length") >= 2)
      {
        v95 = objc_msgSend(v76, "characterAtIndex:", 0);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v95, 1);
        v37 = objc_claimAutoreleasedReturnValue();

        v78 = (void *)v37;
      }
      if (v79)
      {
        v38 = 0;
        v39 = 1;
        while (1)
        {
          objc_msgSend(v84, "objectAtIndex:", v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v89, "isShiftKeyplane") & 1) != 0
            || !objc_msgSend(MEMORY[0x24BDF6B50], "_showSmallDisplayKeyplane"))
          {
            objc_msgSend(v40, "uppercaseStringWithLocale:", v85);
            v41 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v40, "lowercaseStringWithLocale:", v85);
            v41 = objc_claimAutoreleasedReturnValue();
          }
          v42 = (void *)v41;
          v43 = (v86 & 0x40000) != 0 ? v40 : (void *)v41;
          v44 = v43;
          objc_msgSend(v90, "displayString");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v45, "isEqual:", v44) & 1) != 0
            || !objc_msgSend(v88, "containsObject:", v42)
            || objc_msgSend(v90, "variantType") == 9)
          {
            break;
          }
          objc_msgSend(v87, "keyboardID");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "hasPrefix:", CFSTR("am"));

          if ((v59 & 1) != 0)
            goto LABEL_69;
LABEL_78:

          if (v79 == ++v38)
            goto LABEL_83;
        }

LABEL_69:
        objc_msgSend(v82, "objectAtIndex:", v38);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isEqual:", v78);
        v48 = 2;
        if (!v47)
          v48 = v39;
        v83 = v48;
        if ((v47 & v81 & 1) == 0)
        {
          v49 = (void *)objc_msgSend(v90, "copy");
          objc_msgSend(v49, "setRepresentedString:", v46);
          objc_msgSend(v49, "setDisplayString:", v40);
          objc_msgSend(v49, "setDisplayType:", 0);
          v50 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v90, "name");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "representedString");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "stringWithFormat:", CFSTR("%@/%@"), v51, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setName:", v53);

          objc_msgSend(v49, "setOverrideDisplayString:", 0);
          v54 = objc_msgSend(v40, "length");
          v55 = v36;
          if (v54 == 1)
          {
            v56 = objc_msgSend(v40, "characterAtIndex:", 0);
            v55 = v72;
            if (v56 != 170)
            {
              v57 = objc_msgSend(v40, "characterAtIndex:", 0);
              v55 = v36;
              if (v57 == 186)
                v55 = v72;
            }
          }
          objc_msgSend(v55, "addObject:", v49);

          v39 = v83;
        }

        goto LABEL_78;
      }
      v39 = 1;
LABEL_83:
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v60 = v72;
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v91, v119, 16);
      if (v61)
      {
        v62 = *(_QWORD *)v92;
        do
        {
          for (i = 0; i != v61; ++i)
          {
            if (*(_QWORD *)v92 != v62)
              objc_enumerationMutation(v60);
            objc_msgSend(v36, "addObject:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i));
          }
          v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v91, v119, 16);
        }
        while (v61);
      }

      if (objc_msgSend(v36, "count") >= v39)
      {
        objc_msgSend(v90, "updateVariantTypeForActions:", v86);
        objc_msgSend(v90, "setVariantPopupBias:", v71);
        objc_msgSend(v90, "setSubtrees:", v36);
        objc_msgSend(v90, "setState:", 16);
      }

    }
  }

  _Block_object_dispose(&v107, 8);
  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v115, 8);

LABEL_95:
}

void __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v2 = objc_msgSend(v8, "count");
  if (v2 >= 2)
  {
    v3 = 0;
    v4 = v2 >> 1;
    v5 = v2 - 1;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v3, v7);

      objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v5, v6);
      ++v3;
      --v5;
    }
    while (v4 != v3);
  }

}

uint64_t __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isShifted");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isAutoShifted");
  result = objc_msgSend(MEMORY[0x24BDF6B38], "isFloating");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __81__TypistKeyboardDataInProcess_showPopupVariantsForKey_key_plane_keyplaneKeycaps___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "autocorrectPrompt");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "removeAutocorrectPromptAndCandidateList");
}

+ (unint64_t)downActionFlagsForKey:(id)a3 plane:(id)a4 keyplaneKeycaps:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  int v12;
  unint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  CGRect v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "visible"))
  {
    v11 = objc_msgSend(v8, "interactionType");
    v12 = objc_msgSend(v8, "variantType");
    v13 = 5;
    if (v11 != 15 && v11 != 13)
    {
      if (v11 == 4)
      {
        v13 = 69;
      }
      else if ((v11 - 1) > 1)
      {
        v13 = 5;
        switch(v11)
        {
          case 3:
            goto LABEL_24;
          case 4:
          case 5:
          case 8:
          case 13:
          case 15:
            goto LABEL_22;
          case 6:
            if (objc_msgSend(MEMORY[0x24BDF6B38], "rivenTranslationPreference"))
              v13 = 133;
            else
              v13 = 5;
            break;
          case 7:
            v13 = 1048581;
            break;
          case 9:
            v13 = 4229;
            break;
          case 10:
            v13 = 536870916;
            break;
          case 11:
            v13 = 36;
            break;
          case 12:
          case 16:
          case 17:
            break;
          case 14:
            v13 = 20;
            break;
          default:
            if (v11 == 38)
            {
LABEL_24:
              v13 = 128;
              break;
            }
            if (v11 == 40)
              break;
LABEL_22:
            if ((v11 & 0xFFFFFFFE) == 0x14)
            {
              v13 = 5;
              break;
            }
            if ((v11 - 24) > 0xD)
              goto LABEL_50;
            v13 = qword_2494B1D40[v11 - 24];
            break;
        }
      }
      else
      {
        v14 = v12;
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v28 = 0;
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __75__TypistKeyboardDataInProcess_downActionFlagsForKey_plane_keyplaneKeycaps___block_invoke;
        v24[3] = &unk_251A7C9D8;
        v24[4] = &v25;
        +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v24);
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_referenceBounds");
        if (CGRectGetHeight(v29) <= 1194.0
          || *((_BYTE *)v26 + 24)
          || objc_msgSend(v8, "displayType") != 7)
        {

          v16 = 5;
        }
        else
        {

          if (v14 == 3)
            v16 = 5;
          else
            v16 = 32901;
        }
        v13 = 32901;
        switch(v14)
        {
          case 1:
            goto LABEL_33;
          case 3:
            v17 = 262272;
            goto LABEL_32;
          case 4:
            v17 = 131200;
            goto LABEL_32;
          case 5:
          case 10:
            v17 = 8421376;
            goto LABEL_32;
          case 7:
            v17 = 65664;
            goto LABEL_32;
          case 8:
            v13 = 557189;
            goto LABEL_33;
          case 9:
            v17 = 2155872261;
            goto LABEL_32;
          default:
            if ((v14 - 11) > 1)
            {
              if (objc_msgSend(a1, "keyHasAccentedVariants:plane:keyplaneKeycaps:", v8, v9, v10))
              {
                objc_msgSend(v8, "name");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "hasPrefix:", CFSTR("Assist"));

                if (v22)
                  v13 = v16;
                else
                  v13 = 32901;
              }
              else
              {
                v13 = v16;
              }
            }
            else
            {
              v17 = 0x100000080;
LABEL_32:
              v13 = v16 | v17;
            }
LABEL_33:
            objc_msgSend(v8, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v18, "hasPrefix:", CFSTR("NumberPad-")) & 1) != 0)
            {
              objc_msgSend(v8, "name");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "hasSuffix:", CFSTR("-0-Plus"));

              if (v20)
                v13 |= 0x80uLL;
            }
            else
            {

            }
            _Block_object_dispose(&v25, 8);
            break;
        }
      }
    }
  }
  else
  {
LABEL_50:
    v13 = 0;
  }

  return v13;
}

uint64_t __75__TypistKeyboardDataInProcess_downActionFlagsForKey_plane_keyplaneKeycaps___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDF6B38], "isFloating");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)_variantsByAppendingDualStringKey:(id)a3 toVariants:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v29;
  id v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "displayType") == 7)
  {
    objc_msgSend(v6, "secondaryDisplayStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v30 = v9;
    }
    else
    {
      objc_msgSend(v6, "displayString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "substringFromIndex:", 1);
      v30 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "secondaryRepresentedStrings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = a1;
    if (v13)
    {
      v29 = v13;
    }
    else
    {
      objc_msgSend(v6, "representedString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "substringFromIndex:", 1);
      v29 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = *MEMORY[0x24BDF7B60];
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDF7B60]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x24BDF7B68];
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDF7B68]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BDF7B58];
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDF7B58]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendingSecondaryStringToVariantsTop:secondaryString:withDirection:", v18, v30, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendingSecondaryStringToVariantsTop:secondaryString:withDirection:", v20, v29, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = v21;
    objc_msgSend(v7, "objectForKey:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v26;
    v32[1] = v23;
    v31[1] = v17;
    v31[2] = v19;
    v32[2] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
    v27 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v27;
  }

  return v7;
}

+ (id)appendingSecondaryStringToVariantsTop:(id)a3 secondaryString:(id)a4 withDirection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(a3, "mutableCopy");
  v10 = objc_msgSend(v9, "indexOfObject:", v7);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v9, "removeObjectAtIndex:", v10);
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDF7950]))
    objc_msgSend(v9, "addObject:", v7);
  else
    objc_msgSend(v9, "insertObject:atIndex:", v7, 0);

  return v9;
}

+ (BOOL)keyHasAccentedVariants:(id)a3 plane:(id)a4 keyplaneKeycaps:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("NumberPad"));

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    objc_msgSend(v7, "representedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "variantType") == 8)
    {
      objc_msgSend(v8, "componentName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("-%@"), v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v17;
    }
    if (objc_msgSend(v7, "displayType") == 7)
    {
      objc_msgSend(v7, "secondaryRepresentedStrings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19)
      {
        objc_msgSend(v7, "secondaryRepresentedStrings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingString:", v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v22;
      }
    }
    if (v15 && (objc_msgSend(v13, "containsObject:", v15) & 1) == 0)
    {
      objc_msgSend(v13, "addObject:", v15);
      UIKeyboardGetCurrentInputMode();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      UIKeyboardRomanAccentVariants();
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "objectForKey:", *MEMORY[0x24BDF7B68]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __76__TypistKeyboardDataInProcess_keyHasAccentedVariants_plane_keyplaneKeycaps___block_invoke;
      v29[3] = &unk_251A7D328;
      v30 = v9;
      objc_msgSend(v25, "indexesOfObjectsPassingTest:", v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectsAtIndexes:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v27, "count"))
        objc_msgSend(v14, "addObject:", v15);

    }
    v12 = objc_msgSend(v14, "containsObject:", v15);

  }
  return v12;
}

uint64_t __76__TypistKeyboardDataInProcess_keyHasAccentedVariants_plane_keyplaneKeycaps___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

+ (id)setOneHandedKeyboardHandBias:(id)a3
{
  id v3;
  void *v4;
  char v5;
  __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  __CFString *v37;
  void *v38;
  void *v39;
  BOOL v40;

  v3 = a3;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("left"));

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("Left");
  }
  else
  {
    objc_msgSend(v3, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("right"));

    if (v8)
      v6 = CFSTR("Right");
    else
      v6 = CFSTR("None");
  }
  objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BEB5068];
  objc_msgSend(v9, "valueForPreferenceKey:", *MEMORY[0x24BEB5068]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  TYLog(CFSTR("Changing HandBias for One-Handed Keyboard: Current=%@ ChangeTo=%@"), v12, v13, v14, v15, v16, v17, v18, (char)v11);
  if ((objc_msgSend(v11, "isEqualToString:", v6) & 1) != 0)
  {
    TYLog(CFSTR("HandBias for One-Handed Keyboard is already set to %@"), v19, v20, v21, v22, v23, v24, v25, (char)v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "updateKeyboardHandBias:", v6);

    objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "synchronizePreferences");

    objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "valueForPreferenceKey:", v10);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString isEqualToString:](v6, "isEqualToString:", v11))
    {
      v36 = 0.0;
      do
      {
        v37 = v6;
        +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.2);
        objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "synchronizePreferences");

        objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "valueForPreferenceKey:", v10);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v36 = v36 + 0.2;
        if (-[__CFString isEqualToString:](v6, "isEqualToString:", v11))
          v40 = v36 < 10.0;
        else
          v40 = 0;
      }
      while (v40);
    }
    TYLog(CFSTR("HandBias for One-Handed Keyboard is changed to %@  %@"), v29, v30, v31, v32, v33, v34, v35, (char)v6);
  }

  return v6;
}

+ (BOOL)_activeInputModesContainsInputMode:(id)a3
{
  id v3;
  double v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  v36 = 0;
  v4 = 10.0;
  do
  {
    +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.2);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __66__TypistKeyboardDataInProcess__activeInputModesContainsInputMode___block_invoke;
    v30[3] = &unk_251A7C9D8;
    v30[4] = &v31;
    +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v30);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = (id)v32[5];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", v3);

          if (v10)
          {
            TYLog(CFSTR("Active input mode list now contains %@"), v11, v12, v13, v14, v15, v16, v17, (char)v3);

            v24 = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
        if (v6)
          continue;
        break;
      }
    }

    v4 = v4 + -0.2;
  }
  while (v4 > 0.0);
  TYLogl(OS_LOG_TYPE_ERROR, CFSTR("Timed out while waiting for activeInputMode to contain %@"), v18, v19, v20, v21, v22, v23, (char)v3);
  v24 = 0;
LABEL_13:
  _Block_object_dispose(&v31, 8);

  return v24;
}

void __66__TypistKeyboardDataInProcess__activeInputModesContainsInputMode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeInputModes");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (int)getWubiEnumeration:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  int v6;

  v3 = getWubiEnumeration__wubiOnceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&getWubiEnumeration__wubiOnceToken, &__block_literal_global_368);
  objc_msgSend((id)getWubiEnumeration__wubiDictionary, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "intValue");
  return v6;
}

void __50__TypistKeyboardDataInProcess_getWubiEnumeration___block_invoke()
{
  void *v0;

  v0 = (void *)getWubiEnumeration__wubiDictionary;
  getWubiEnumeration__wubiDictionary = (uint64_t)&unk_251A99510;

}

+ (int)getShuangpinEnumeration:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  int v6;

  v3 = getShuangpinEnumeration__shuangpinOnceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&getShuangpinEnumeration__shuangpinOnceToken, &__block_literal_global_380);
  objc_msgSend((id)getShuangpinEnumeration__shuangpinSchemaDictionary, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "intValue");
  return v6;
}

void __55__TypistKeyboardDataInProcess_getShuangpinEnumeration___block_invoke()
{
  void *v0;

  v0 = (void *)getShuangpinEnumeration__shuangpinSchemaDictionary;
  getShuangpinEnumeration__shuangpinSchemaDictionary = (uint64_t)&unk_251A99538;

}

+ (BOOL)shouldShowDictationKey
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__TypistKeyboardDataInProcess_shouldShowDictationKey__block_invoke;
  v4[3] = &unk_251A7C9D8;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __53__TypistKeyboardDataInProcess_shouldShowDictationKey__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "shouldShowDictationKey");

}

+ (BOOL)shouldShowGlobeKey
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__TypistKeyboardDataInProcess_shouldShowGlobeKey__block_invoke;
  v4[3] = &unk_251A7C9D8;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __49__TypistKeyboardDataInProcess_shouldShowGlobeKey__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "shouldShowInternationalKey");

}

+ (id)getRepresentedStringFromKey:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__TypistKeyboardDataInProcess_getRepresentedStringFromKey___block_invoke;
  v7[3] = &unk_251A7D288;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __59__TypistKeyboardDataInProcess_getRepresentedStringFromKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseKeyForString:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "representedString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

+ (CGPoint)floatingKeyboardDraggablePoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[5];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  CGPoint result;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x3010000000;
  v10 = &unk_2494BA09E;
  v11 = *MEMORY[0x24BDBEFB0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__TypistKeyboardDataInProcess_floatingKeyboardDraggablePoint__block_invoke;
  v6[3] = &unk_251A7C9D8;
  v6[4] = &v7;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v6);
  v2 = v8[4];
  v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  v4 = v2;
  v5 = v3;
  result.y = v5;
  result.x = v4;
  return result;
}

void __61__TypistKeyboardDataInProcess_floatingKeyboardDraggablePoint__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_floatingKeyboardDraggableRect");
  UIRectGetCenter();
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertPoint:toView:", v11, v4, v6);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v12 + 32) = v13;
  *(_QWORD *)(v12 + 40) = v14;

}

+ (BOOL)isCandidateCellVisible:(id)a3
{
  id v4;
  void *v6;

  v4 = a3;
  if (v4)
  {
    NSClassFromString(CFSTR("UIKeyboardCandidateBarCell"));
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (NSClassFromString(CFSTR("UIKeyboardCandidateGridCell")), (objc_opt_isKindOfClass() & 1) != 0)
      || (NSClassFromString(CFSTR("TUICandidateCell")), (objc_opt_isKindOfClass() & 1) != 0))
    {
      LODWORD(a1) = objc_msgSend(v4, "isHidden") ^ 1;
    }
    else
    {
      objc_msgSend(v4, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(a1) = objc_msgSend(a1, "isCandidateCellVisible:", v6);

    }
  }
  else
  {
    LOBYTE(a1) = 0;
  }

  return (char)a1;
}

@end
