@implementation TTSLHPhonemeToApplebetPhonemeMapper

+ (id)_retrieveRegularExpression:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v13;
  id v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a3;
  if (qword_1EE6D55C8 != -1)
    dispatch_once(&qword_1EE6D55C8, &unk_1E4A9F268);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1A3948D60;
  v21 = sub_1A3948D70;
  v22 = 0;
  v14[1] = (id)MEMORY[0x1E0C809B0];
  v14[2] = (id)3221225472;
  v14[3] = sub_1A3948D78;
  v14[4] = &unk_1E4A9F9A8;
  v16 = &v17;
  v4 = v3;
  v15 = v4;
  AX_PERFORM_WITH_LOCK();
  v6 = (void *)v18[5];
  if (!v6)
  {
    v14[0] = 0;
    objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E0CB38E8], v5, (uint64_t)v4, 0, (uint64_t)v14);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v14[0];
    v9 = (void *)v18[5];
    v18[5] = v7;

    if (v8)
    {
      AXTTSLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1A3AAF4B4((uint64_t)v8, v10);
    }
    else
    {
      v13 = v4;
      AX_PERFORM_WITH_LOCK();
      v10 = v13;
    }

    v6 = (void *)v18[5];
  }
  v11 = v6;

  _Block_object_dispose(&v17, 8);
  return v11;
}

+ (id)_phonoMatch:(id)a3 match:(id)a4 matchpos:(int)a5 count:(int)a6
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v53;
  id obj;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v53 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v53;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v56, (uint64_t)v60, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v57;
    while (2)
    {
      v20 = 0;
      v21 = a5;
      do
      {
        if (*(_QWORD *)v57 != v19)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v20);
        objc_msgSend_objectAtIndexedSubscript_(v55, v15, v21 + v20, v16, v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_phoneme(v23, v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v29, (uint64_t)CFSTR("^%@\\d?$"), v30, v31, v22);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__retrieveRegularExpression_(a1, v33, (uint64_t)v32, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = objc_msgSend_length(v28, v37, v38, v39, v40);
        objc_msgSend_firstMatchInString_options_range_(v36, v42, (uint64_t)v28, 0, 0, v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v22, v44, (uint64_t)CFSTR("()"), v45, v46) & 1) == 0
          && (!v43 || objc_msgSend_range(v43, v47, v48, v49, v50) == 0x7FFFFFFFFFFFFFFFLL))
        {

          v51 = 0;
          goto LABEL_13;
        }
        objc_msgSend_addObject_(v13, v47, (uint64_t)v28, v49, v50);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v56, (uint64_t)v60, 16);
      a5 = v21 + v20;
      if (v18)
        continue;
      break;
    }
  }

  v51 = v13;
LABEL_13:

  return v51;
}

+ (id)_phonemeArray:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  TTSApplebetMapperPhonemeInfo *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  void *v69;
  id v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v71 = a3;
  v8 = (void *)objc_msgSend_mutableCopy(v71, v4, v5, v6, v7);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11, v12);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_2:
  if (objc_msgSend_length(v8, v13, v14, v15, v16))
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v21 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E4ABB7C0, v17, (uint64_t)&v73, (uint64_t)v77, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v74;
      while (2)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v74 != v22)
            objc_enumerationMutation(&unk_1E4ABB7C0);
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v18, (uint64_t)CFSTR("^%@"), v19, v20, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__retrieveRegularExpression_(a1, v25, (uint64_t)v24, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = objc_msgSend_length(v8, v29, v30, v31, v32);
          objc_msgSend_firstMatchInString_options_range_(v28, v34, (uint64_t)v8, 0, 0, v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v35;
          if (v35)
          {
            v41 = objc_msgSend_range(v35, v36, v37, v38, v39);
            objc_msgSend_substringWithRange_(v8, v42, v41, (uint64_t)v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = [TTSApplebetMapperPhonemeInfo alloc];
            v50 = (void *)objc_msgSend_init(v45, v46, v47, v48, v49);

            objc_msgSend_setStartTime_(v50, v51, (uint64_t)&unk_1E4ABC708, v52, v53);
            objc_msgSend_setEndTime_(v50, v54, (uint64_t)&unk_1E4ABC708, v55, v56);
            objc_msgSend_setPhoneme_(v50, v57, (uint64_t)v44, v58, v59);
            objc_msgSend_addObject_(v72, v60, (uint64_t)v50, v61, v62);
            v67 = objc_msgSend_range(v40, v63, v64, v65, v66);
            objc_msgSend_replaceCharactersInRange_withString_(v8, v68, v67, (uint64_t)v68, (uint64_t)&stru_1E4AA5CE8);

            goto LABEL_2;
          }

        }
        v21 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E4ABB7C0, v18, (uint64_t)&v73, (uint64_t)v77, 16);
        if (v21)
          continue;
        break;
      }
    }
    v69 = v72;
  }
  else
  {
    v69 = v72;
    v21 = v72;
  }

  return v21;
}

+ (id)_phonemeRules
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A39493FC;
  block[3] = &unk_1E4A9F9C8;
  block[4] = a1;
  if (qword_1EE6D55E0 != -1)
    dispatch_once(&qword_1EE6D55E0, block);
  return (id)qword_1EE6D55D8;
}

+ (id)_acceptRule
{
  return &unk_1E4A9F4E8;
}

+ (id)_rightRaisingContextRule
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v15;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("^%@"), v2, v3, CFSTR("((t)|(d)|(n)|(T)|(D)|(s)|(z)|(S)|(Z)|(t&S)|(d&Z)|(j)|(i)|(I))"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__retrieveRegularExpression_(a1, v6, (uint64_t)v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A3949514;
  aBlock[3] = &unk_1E4A9FA10;
  v15 = v9;
  v10 = v9;
  v11 = _Block_copy(aBlock);
  v12 = _Block_copy(v11);

  return v12;
}

+ (id)_uberRightRaisingContextRule
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  id v20;
  id v21;

  objc_msgSend__retrieveRegularExpression_(a1, a2, (uint64_t)CFSTR("[h.']"), v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("^%@"), v7, v8, CFSTR("((t)|(d)|(n)|(T)|(D)|(s)|(z)|(S)|(Z)|(t&S)|(d&Z)|(j)|(i)|(I))"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__retrieveRegularExpression_(a1, v10, (uint64_t)v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A394970C;
  aBlock[3] = &unk_1E4A9FA38;
  v20 = v5;
  v21 = v13;
  v14 = v13;
  v15 = v5;
  v16 = _Block_copy(aBlock);
  v17 = _Block_copy(v16);

  return v17;
}

+ (id)_uberUberRightRaisingContextRule
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  id v20;
  id v21;

  objc_msgSend__retrieveRegularExpression_(a1, a2, (uint64_t)CFSTR("['h]"), v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("^%@$"), v7, v8, CFSTR("((t)|(d)|(n)|(T)|(D)|(s)|(z)|(S)|(Z)|(t&S)|(d&Z)|(j)|(i)|(I))"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__retrieveRegularExpression_(a1, v10, (uint64_t)v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A39499A8;
  aBlock[3] = &unk_1E4A9FA38;
  v20 = v5;
  v21 = v13;
  v14 = v13;
  v15 = v5;
  v16 = _Block_copy(aBlock);
  v17 = _Block_copy(v16);

  return v17;
}

+ (id)_uberUberUberRightRaisingContextRule
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v15;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("^%@$"), v2, v3, CFSTR("((t)|(d)|(n)|(T)|(D)|(s)|(z)|(S)|(Z)|(t&S)|(d&Z)|(j)|(i)|(I))"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__retrieveRegularExpression_(a1, v6, (uint64_t)v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A3949C10;
  aBlock[3] = &unk_1E4A9FA10;
  v15 = v9;
  v10 = v9;
  v11 = _Block_copy(aBlock);
  v12 = _Block_copy(v11);

  return v12;
}

+ (id)_leftRaisingContextRule
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v15;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("^%@$"), v2, v3, CFSTR("((i)|(I)|(e&I)|(a&I)|(O&I)|(n)|(j)|(s)|(z))"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__retrieveRegularExpression_(a1, v6, (uint64_t)v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A3949DD4;
  aBlock[3] = &unk_1E4A9FA10;
  v15 = v9;
  v10 = v9;
  v11 = _Block_copy(aBlock);
  v12 = _Block_copy(v11);

  return v12;
}

+ (id)_uberLeftRaisingContextRule
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  id v20;
  id v21;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("^%@$"), v2, v3, CFSTR("((i)|(I)|(e&I)|(a&I)|(O&I)|(n)|(j)|(s)|(z))"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__retrieveRegularExpression_(a1, v6, (uint64_t)v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__retrieveRegularExpression_(a1, v10, (uint64_t)CFSTR("[.]"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A3949FCC;
  aBlock[3] = &unk_1E4A9FA38;
  v20 = v9;
  v21 = v13;
  v14 = v13;
  v15 = v9;
  v16 = _Block_copy(aBlock);
  v17 = _Block_copy(v16);

  return v17;
}

+ (id)_initializeRules
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  const char *v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  const char *v311;
  uint64_t v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  const char *v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  const char *v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  const char *v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  const char *v341;
  uint64_t v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  const char *v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  const char *v353;
  uint64_t v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  const char *v359;
  uint64_t v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  const char *v365;
  uint64_t v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  const char *v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  const char *v389;
  uint64_t v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  const char *v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  const char *v401;
  uint64_t v402;
  const char *v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  const char *v407;
  uint64_t v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  const char *v413;
  uint64_t v414;
  void *v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  void *v420;
  const char *v421;
  uint64_t v422;
  void *v423;
  const char *v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  void *v428;
  const char *v429;
  uint64_t v430;
  void *v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  void *v436;
  const char *v437;
  uint64_t v438;
  void *v439;
  const char *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  void *v444;
  const char *v445;
  uint64_t v446;
  void *v447;
  const char *v448;
  uint64_t v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  void *v453;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  void *v475;
  void *v476;
  void *v477;
  void *v478;
  void *v479;
  void *v480;
  void *v481;
  void *v482;
  void *v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  void *v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  void *v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  void *v522;
  void *v523;
  void *v524;
  void *v525;
  void *v526;
  void *v527;
  void *v528;
  void *v529;
  void *v530;
  void *v531;
  void *v532;
  void *v533;
  void *v534;
  void *v535;
  void *v536;
  void *v537;
  void *v538;
  void *v539;
  void *v540;
  void *v541;
  void *v542;
  void *v543;
  void *v544;
  void *v545;
  void *v546;
  void *v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  void *v553;
  void *v554;
  void *v555;
  void *v556;
  void *v557;
  void *v558;
  void *v559;
  void *v560;
  void *v561;
  void *v562;
  void *v563;
  void *v564;
  void *v565;
  void *v566;
  void *v567;
  void *v568;
  void *v569;
  void *v570;
  void *v571;
  void *v572;
  void *v573;
  void *v574;
  void *v575;
  void *v576;
  void *v577;
  void *v578;
  void *v579;
  void *v580;
  void *v581;
  void *v582;
  void *v583;
  void *v584;
  void *v585;
  void *v586;
  void *v587;
  void *v588;
  void *v589;
  void *v590;
  _QWORD v591[5];
  _QWORD v592[5];
  _QWORD v593[5];
  _QWORD v594[5];
  _QWORD v595[5];
  _QWORD v596[5];
  _QWORD v597[5];
  _QWORD v598[5];
  _QWORD v599[5];
  _QWORD v600[5];
  _QWORD v601[5];
  _QWORD v602[5];
  _QWORD v603[5];
  _QWORD v604[5];
  _QWORD v605[5];
  _QWORD v606[5];
  _QWORD v607[5];
  _QWORD v608[5];
  _QWORD v609[5];
  _QWORD v610[5];
  _QWORD v611[5];
  _QWORD v612[5];
  _QWORD v613[5];
  _QWORD v614[5];
  _QWORD v615[5];
  _QWORD v616[5];
  _QWORD v617[5];
  _QWORD v618[5];
  _QWORD v619[5];
  _QWORD v620[5];
  _QWORD v621[5];
  _QWORD v622[5];
  _QWORD v623[5];
  _QWORD v624[5];
  _QWORD v625[5];
  _QWORD v626[5];
  _QWORD v627[5];
  _QWORD v628[5];
  _QWORD v629[5];
  _QWORD v630[5];
  _QWORD v631[5];
  _QWORD v632[5];
  _QWORD v633[5];
  _QWORD v634[5];
  _QWORD v635[5];
  _QWORD v636[5];
  _QWORD v637[5];
  _QWORD v638[5];
  _QWORD v639[5];
  _QWORD v640[5];
  _QWORD v641[5];
  _QWORD v642[5];
  _QWORD v643[5];
  _QWORD v644[5];
  _QWORD v645[5];
  _QWORD v646[5];
  _QWORD v647[5];
  _QWORD v648[5];
  _QWORD v649[5];
  _QWORD v650[5];
  _QWORD v651[5];
  _QWORD v652[5];
  _QWORD v653[5];
  _QWORD v654[5];
  _QWORD v655[5];
  _QWORD v656[5];
  _QWORD v657[5];
  _QWORD v658[5];
  _QWORD v659[5];
  _QWORD v660[5];
  _QWORD v661[72];

  v6 = MEMORY[0x1E0C9AA60];
  v661[70] = *MEMORY[0x1E0C80C00];
  v660[0] = MEMORY[0x1E0C9AA60];
  v660[1] = &unk_1E4ABB7D8;
  v660[2] = MEMORY[0x1E0C9AA60];
  objc_msgSend__acceptRule(a1, a2, v2, v3, v4);
  v590 = (void *)objc_claimAutoreleasedReturnValue();
  v660[3] = v590;
  v660[4] = &unk_1E4ABB7F0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v660, 5, v8);
  v589 = (void *)objc_claimAutoreleasedReturnValue();
  v661[0] = v589;
  v659[0] = v6;
  v659[1] = &unk_1E4ABB808;
  v659[2] = v6;
  objc_msgSend__acceptRule(a1, v9, v10, v11, v12);
  v588 = (void *)objc_claimAutoreleasedReturnValue();
  v659[3] = v588;
  v659[4] = &unk_1E4ABB820;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v13, (uint64_t)v659, 5, v14);
  v587 = (void *)objc_claimAutoreleasedReturnValue();
  v661[1] = v587;
  v658[0] = v6;
  v658[1] = &unk_1E4ABB838;
  v658[2] = v6;
  objc_msgSend__acceptRule(a1, v15, v16, v17, v18);
  v586 = (void *)objc_claimAutoreleasedReturnValue();
  v658[3] = v586;
  v658[4] = &unk_1E4ABB850;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)v658, 5, v20);
  v585 = (void *)objc_claimAutoreleasedReturnValue();
  v661[2] = v585;
  v657[0] = v6;
  v657[1] = &unk_1E4ABB868;
  v657[2] = v6;
  objc_msgSend__acceptRule(a1, v21, v22, v23, v24);
  v584 = (void *)objc_claimAutoreleasedReturnValue();
  v657[3] = v584;
  v657[4] = &unk_1E4ABB880;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v25, (uint64_t)v657, 5, v26);
  v583 = (void *)objc_claimAutoreleasedReturnValue();
  v661[3] = v583;
  v656[0] = v6;
  v656[1] = &unk_1E4ABB898;
  v656[2] = v6;
  objc_msgSend__acceptRule(a1, v27, v28, v29, v30);
  v582 = (void *)objc_claimAutoreleasedReturnValue();
  v656[3] = v582;
  v656[4] = &unk_1E4ABB8B0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v31, (uint64_t)v656, 5, v32);
  v581 = (void *)objc_claimAutoreleasedReturnValue();
  v661[4] = v581;
  v655[0] = v6;
  v655[1] = &unk_1E4ABB8C8;
  v655[2] = v6;
  objc_msgSend__acceptRule(a1, v33, v34, v35, v36);
  v580 = (void *)objc_claimAutoreleasedReturnValue();
  v655[3] = v580;
  v655[4] = &unk_1E4ABB8E0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v37, (uint64_t)v655, 5, v38);
  v579 = (void *)objc_claimAutoreleasedReturnValue();
  v661[5] = v579;
  v654[0] = v6;
  v654[1] = &unk_1E4ABB8F8;
  v654[2] = v6;
  objc_msgSend__acceptRule(a1, v39, v40, v41, v42);
  v578 = (void *)objc_claimAutoreleasedReturnValue();
  v654[3] = v578;
  v654[4] = &unk_1E4ABB910;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v43, (uint64_t)v654, 5, v44);
  v577 = (void *)objc_claimAutoreleasedReturnValue();
  v661[6] = v577;
  v653[0] = v6;
  v653[1] = &unk_1E4ABB928;
  v653[2] = v6;
  objc_msgSend__acceptRule(a1, v45, v46, v47, v48);
  v576 = (void *)objc_claimAutoreleasedReturnValue();
  v653[3] = v576;
  v653[4] = &unk_1E4ABB940;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v49, (uint64_t)v653, 5, v50);
  v575 = (void *)objc_claimAutoreleasedReturnValue();
  v661[7] = v575;
  v652[0] = v6;
  v652[1] = &unk_1E4ABB958;
  v652[2] = v6;
  objc_msgSend__acceptRule(a1, v51, v52, v53, v54);
  v574 = (void *)objc_claimAutoreleasedReturnValue();
  v652[3] = v574;
  v652[4] = &unk_1E4ABB970;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v55, (uint64_t)v652, 5, v56);
  v573 = (void *)objc_claimAutoreleasedReturnValue();
  v661[8] = v573;
  v651[0] = v6;
  v651[1] = &unk_1E4ABB988;
  v651[2] = &unk_1E4ABB9A0;
  objc_msgSend__acceptRule(a1, v57, v58, v59, v60);
  v572 = (void *)objc_claimAutoreleasedReturnValue();
  v651[3] = v572;
  v651[4] = &unk_1E4ABB9B8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v61, (uint64_t)v651, 5, v62);
  v571 = (void *)objc_claimAutoreleasedReturnValue();
  v661[9] = v571;
  v650[0] = v6;
  v650[1] = &unk_1E4ABB9D0;
  v650[2] = &unk_1E4ABB9E8;
  objc_msgSend__acceptRule(a1, v63, v64, v65, v66);
  v570 = (void *)objc_claimAutoreleasedReturnValue();
  v650[3] = v570;
  v650[4] = &unk_1E4ABBA00;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v67, (uint64_t)v650, 5, v68);
  v569 = (void *)objc_claimAutoreleasedReturnValue();
  v661[10] = v569;
  v649[0] = v6;
  v649[1] = &unk_1E4ABBA18;
  v649[2] = &unk_1E4ABBA30;
  objc_msgSend__acceptRule(a1, v69, v70, v71, v72);
  v568 = (void *)objc_claimAutoreleasedReturnValue();
  v649[3] = v568;
  v649[4] = &unk_1E4ABBA48;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v73, (uint64_t)v649, 5, v74);
  v567 = (void *)objc_claimAutoreleasedReturnValue();
  v661[11] = v567;
  v648[0] = v6;
  v648[1] = &unk_1E4ABBA60;
  v648[2] = &unk_1E4ABBA78;
  objc_msgSend__acceptRule(a1, v75, v76, v77, v78);
  v566 = (void *)objc_claimAutoreleasedReturnValue();
  v648[3] = v566;
  v648[4] = &unk_1E4ABBA90;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v79, (uint64_t)v648, 5, v80);
  v565 = (void *)objc_claimAutoreleasedReturnValue();
  v661[12] = v565;
  v647[0] = v6;
  v647[1] = &unk_1E4ABBAA8;
  v647[2] = &unk_1E4ABBAC0;
  objc_msgSend__acceptRule(a1, v81, v82, v83, v84);
  v564 = (void *)objc_claimAutoreleasedReturnValue();
  v647[3] = v564;
  v647[4] = &unk_1E4ABBAD8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v85, (uint64_t)v647, 5, v86);
  v563 = (void *)objc_claimAutoreleasedReturnValue();
  v661[13] = v563;
  v646[0] = v6;
  v646[1] = &unk_1E4ABBAF0;
  v646[2] = v6;
  objc_msgSend__acceptRule(a1, v87, v88, v89, v90);
  v562 = (void *)objc_claimAutoreleasedReturnValue();
  v646[3] = v562;
  v646[4] = &unk_1E4ABBB08;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v91, (uint64_t)v646, 5, v92);
  v561 = (void *)objc_claimAutoreleasedReturnValue();
  v661[14] = v561;
  v645[0] = v6;
  v645[1] = &unk_1E4ABBB20;
  v645[2] = &unk_1E4ABBB38;
  objc_msgSend__acceptRule(a1, v93, v94, v95, v96);
  v560 = (void *)objc_claimAutoreleasedReturnValue();
  v645[3] = v560;
  v645[4] = &unk_1E4ABBB50;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v97, (uint64_t)v645, 5, v98);
  v559 = (void *)objc_claimAutoreleasedReturnValue();
  v661[15] = v559;
  v644[0] = v6;
  v644[1] = &unk_1E4ABBB68;
  v644[2] = &unk_1E4ABBB80;
  objc_msgSend__rightRaisingContextRule(a1, v99, v100, v101, v102);
  v558 = (void *)objc_claimAutoreleasedReturnValue();
  v644[3] = v558;
  v644[4] = &unk_1E4ABBB98;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v103, (uint64_t)v644, 5, v104);
  v557 = (void *)objc_claimAutoreleasedReturnValue();
  v661[16] = v557;
  v643[0] = v6;
  v643[1] = &unk_1E4ABBBB0;
  v643[2] = &unk_1E4ABBBC8;
  objc_msgSend__uberRightRaisingContextRule(a1, v105, v106, v107, v108);
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  v643[3] = v556;
  v643[4] = &unk_1E4ABBBE0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v109, (uint64_t)v643, 5, v110);
  v555 = (void *)objc_claimAutoreleasedReturnValue();
  v661[17] = v555;
  v642[0] = v6;
  v642[1] = &unk_1E4ABBBF8;
  v642[2] = &unk_1E4ABBC10;
  objc_msgSend__uberUberRightRaisingContextRule(a1, v111, v112, v113, v114);
  v554 = (void *)objc_claimAutoreleasedReturnValue();
  v642[3] = v554;
  v642[4] = &unk_1E4ABBC28;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v115, (uint64_t)v642, 5, v116);
  v553 = (void *)objc_claimAutoreleasedReturnValue();
  v661[18] = v553;
  v641[0] = v6;
  v641[1] = &unk_1E4ABBC40;
  v641[2] = &unk_1E4ABBC58;
  objc_msgSend__uberUberUberRightRaisingContextRule(a1, v117, v118, v119, v120);
  v552 = (void *)objc_claimAutoreleasedReturnValue();
  v641[3] = v552;
  v641[4] = &unk_1E4ABBC70;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v121, (uint64_t)v641, 5, v122);
  v551 = (void *)objc_claimAutoreleasedReturnValue();
  v661[19] = v551;
  v640[0] = &unk_1E4ABBC88;
  v640[1] = &unk_1E4ABBCA0;
  v640[2] = &unk_1E4ABBCB8;
  objc_msgSend__leftRaisingContextRule(a1, v123, v124, v125, v126);
  v550 = (void *)objc_claimAutoreleasedReturnValue();
  v640[3] = v550;
  v640[4] = &unk_1E4ABBCD0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v127, (uint64_t)v640, 5, v128);
  v549 = (void *)objc_claimAutoreleasedReturnValue();
  v661[20] = v549;
  v639[0] = &unk_1E4ABBCE8;
  v639[1] = &unk_1E4ABBD00;
  v639[2] = &unk_1E4ABBD18;
  objc_msgSend__uberLeftRaisingContextRule(a1, v129, v130, v131, v132);
  v548 = (void *)objc_claimAutoreleasedReturnValue();
  v639[3] = v548;
  v639[4] = &unk_1E4ABBD30;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v133, (uint64_t)v639, 5, v134);
  v547 = (void *)objc_claimAutoreleasedReturnValue();
  v661[21] = v547;
  v638[0] = v6;
  v638[1] = &unk_1E4ABBD48;
  v638[2] = v6;
  objc_msgSend__acceptRule(a1, v135, v136, v137, v138);
  v546 = (void *)objc_claimAutoreleasedReturnValue();
  v638[3] = v546;
  v638[4] = &unk_1E4ABBD60;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v139, (uint64_t)v638, 5, v140);
  v545 = (void *)objc_claimAutoreleasedReturnValue();
  v661[22] = v545;
  v637[0] = v6;
  v637[1] = &unk_1E4ABBD78;
  v637[2] = v6;
  objc_msgSend__acceptRule(a1, v141, v142, v143, v144);
  v544 = (void *)objc_claimAutoreleasedReturnValue();
  v637[3] = v544;
  v637[4] = &unk_1E4ABBD90;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v145, (uint64_t)v637, 5, v146);
  v543 = (void *)objc_claimAutoreleasedReturnValue();
  v661[23] = v543;
  v636[0] = v6;
  v636[1] = &unk_1E4ABBDA8;
  v636[2] = v6;
  objc_msgSend__acceptRule(a1, v147, v148, v149, v150);
  v542 = (void *)objc_claimAutoreleasedReturnValue();
  v636[3] = v542;
  v636[4] = &unk_1E4ABBDC0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v151, (uint64_t)v636, 5, v152);
  v541 = (void *)objc_claimAutoreleasedReturnValue();
  v661[24] = v541;
  v635[0] = v6;
  v635[1] = &unk_1E4ABBDD8;
  v635[2] = v6;
  objc_msgSend__acceptRule(a1, v153, v154, v155, v156);
  v540 = (void *)objc_claimAutoreleasedReturnValue();
  v635[3] = v540;
  v635[4] = &unk_1E4ABBDF0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v157, (uint64_t)v635, 5, v158);
  v539 = (void *)objc_claimAutoreleasedReturnValue();
  v661[25] = v539;
  v634[0] = v6;
  v634[1] = &unk_1E4ABBE08;
  v634[2] = v6;
  objc_msgSend__acceptRule(a1, v159, v160, v161, v162);
  v538 = (void *)objc_claimAutoreleasedReturnValue();
  v634[3] = v538;
  v634[4] = &unk_1E4ABBE20;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v163, (uint64_t)v634, 5, v164);
  v537 = (void *)objc_claimAutoreleasedReturnValue();
  v661[26] = v537;
  v633[0] = v6;
  v633[1] = &unk_1E4ABBE38;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v165, v166, v167, v168);
  v536 = (void *)objc_claimAutoreleasedReturnValue();
  v633[2] = v536;
  objc_msgSend__acceptRule(a1, v169, v170, v171, v172);
  v535 = (void *)objc_claimAutoreleasedReturnValue();
  v633[3] = v535;
  v633[4] = &unk_1E4ABBE50;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v173, (uint64_t)v633, 5, v174);
  v534 = (void *)objc_claimAutoreleasedReturnValue();
  v661[27] = v534;
  v632[0] = v6;
  v632[1] = &unk_1E4ABBE68;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v175, v176, v177, v178);
  v533 = (void *)objc_claimAutoreleasedReturnValue();
  v632[2] = v533;
  objc_msgSend__acceptRule(a1, v179, v180, v181, v182);
  v532 = (void *)objc_claimAutoreleasedReturnValue();
  v632[3] = v532;
  v632[4] = &unk_1E4ABBE80;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v183, (uint64_t)v632, 5, v184);
  v531 = (void *)objc_claimAutoreleasedReturnValue();
  v661[28] = v531;
  v631[0] = v6;
  v631[1] = &unk_1E4ABBE98;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v185, v186, v187, v188);
  v530 = (void *)objc_claimAutoreleasedReturnValue();
  v631[2] = v530;
  objc_msgSend__acceptRule(a1, v189, v190, v191, v192);
  v529 = (void *)objc_claimAutoreleasedReturnValue();
  v631[3] = v529;
  v631[4] = &unk_1E4ABBEB0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v193, (uint64_t)v631, 5, v194);
  v528 = (void *)objc_claimAutoreleasedReturnValue();
  v661[29] = v528;
  v630[0] = v6;
  v630[1] = &unk_1E4ABBEC8;
  objc_msgSend_null(MEMORY[0x1E0C99E38], v195, v196, v197, v198);
  v527 = (void *)objc_claimAutoreleasedReturnValue();
  v630[2] = v527;
  objc_msgSend__acceptRule(a1, v199, v200, v201, v202);
  v526 = (void *)objc_claimAutoreleasedReturnValue();
  v630[3] = v526;
  v630[4] = &unk_1E4ABBEE0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v203, (uint64_t)v630, 5, v204);
  v525 = (void *)objc_claimAutoreleasedReturnValue();
  v661[30] = v525;
  v629[0] = v6;
  v629[1] = &unk_1E4ABBEF8;
  v629[2] = v6;
  objc_msgSend__acceptRule(a1, v205, v206, v207, v208);
  v524 = (void *)objc_claimAutoreleasedReturnValue();
  v629[3] = v524;
  v629[4] = &unk_1E4ABBF10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v209, (uint64_t)v629, 5, v210);
  v523 = (void *)objc_claimAutoreleasedReturnValue();
  v661[31] = v523;
  v628[0] = v6;
  v628[1] = &unk_1E4ABBF28;
  v628[2] = v6;
  objc_msgSend__acceptRule(a1, v211, v212, v213, v214);
  v522 = (void *)objc_claimAutoreleasedReturnValue();
  v628[3] = v522;
  v628[4] = &unk_1E4ABBF40;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v215, (uint64_t)v628, 5, v216);
  v521 = (void *)objc_claimAutoreleasedReturnValue();
  v661[32] = v521;
  v627[0] = v6;
  v627[1] = &unk_1E4ABBF58;
  v627[2] = v6;
  objc_msgSend__acceptRule(a1, v217, v218, v219, v220);
  v520 = (void *)objc_claimAutoreleasedReturnValue();
  v627[3] = v520;
  v627[4] = &unk_1E4ABBF70;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v221, (uint64_t)v627, 5, v222);
  v519 = (void *)objc_claimAutoreleasedReturnValue();
  v661[33] = v519;
  v626[0] = v6;
  v626[1] = &unk_1E4ABBF88;
  v626[2] = v6;
  objc_msgSend__acceptRule(a1, v223, v224, v225, v226);
  v518 = (void *)objc_claimAutoreleasedReturnValue();
  v626[3] = v518;
  v626[4] = &unk_1E4ABBFA0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v227, (uint64_t)v626, 5, v228);
  v517 = (void *)objc_claimAutoreleasedReturnValue();
  v661[34] = v517;
  v625[0] = v6;
  v625[1] = &unk_1E4ABBFB8;
  v625[2] = v6;
  objc_msgSend__acceptRule(a1, v229, v230, v231, v232);
  v516 = (void *)objc_claimAutoreleasedReturnValue();
  v625[3] = v516;
  v625[4] = &unk_1E4ABBFD0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v233, (uint64_t)v625, 5, v234);
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  v661[35] = v515;
  v624[0] = v6;
  v624[1] = &unk_1E4ABBFE8;
  v624[2] = v6;
  objc_msgSend__acceptRule(a1, v235, v236, v237, v238);
  v514 = (void *)objc_claimAutoreleasedReturnValue();
  v624[3] = v514;
  v624[4] = &unk_1E4ABC000;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v239, (uint64_t)v624, 5, v240);
  v513 = (void *)objc_claimAutoreleasedReturnValue();
  v661[36] = v513;
  v623[0] = v6;
  v623[1] = &unk_1E4ABC018;
  v623[2] = v6;
  objc_msgSend__acceptRule(a1, v241, v242, v243, v244);
  v512 = (void *)objc_claimAutoreleasedReturnValue();
  v623[3] = v512;
  v623[4] = &unk_1E4ABC030;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v245, (uint64_t)v623, 5, v246);
  v511 = (void *)objc_claimAutoreleasedReturnValue();
  v661[37] = v511;
  v622[0] = v6;
  v622[1] = &unk_1E4ABC048;
  v622[2] = v6;
  objc_msgSend__acceptRule(a1, v247, v248, v249, v250);
  v510 = (void *)objc_claimAutoreleasedReturnValue();
  v622[3] = v510;
  v622[4] = &unk_1E4ABC060;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v251, (uint64_t)v622, 5, v252);
  v509 = (void *)objc_claimAutoreleasedReturnValue();
  v661[38] = v509;
  v621[0] = v6;
  v621[1] = &unk_1E4ABC078;
  v621[2] = v6;
  objc_msgSend__acceptRule(a1, v253, v254, v255, v256);
  v508 = (void *)objc_claimAutoreleasedReturnValue();
  v621[3] = v508;
  v621[4] = &unk_1E4ABC090;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v257, (uint64_t)v621, 5, v258);
  v507 = (void *)objc_claimAutoreleasedReturnValue();
  v661[39] = v507;
  v620[0] = v6;
  v620[1] = &unk_1E4ABC0A8;
  v620[2] = v6;
  objc_msgSend__acceptRule(a1, v259, v260, v261, v262);
  v506 = (void *)objc_claimAutoreleasedReturnValue();
  v620[3] = v506;
  v620[4] = &unk_1E4ABC0C0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v263, (uint64_t)v620, 5, v264);
  v505 = (void *)objc_claimAutoreleasedReturnValue();
  v661[40] = v505;
  v619[0] = v6;
  v619[1] = &unk_1E4ABC0D8;
  v619[2] = v6;
  objc_msgSend__acceptRule(a1, v265, v266, v267, v268);
  v504 = (void *)objc_claimAutoreleasedReturnValue();
  v619[3] = v504;
  v619[4] = &unk_1E4ABC0F0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v269, (uint64_t)v619, 5, v270);
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  v661[41] = v503;
  v618[0] = v6;
  v618[1] = &unk_1E4ABC108;
  v618[2] = v6;
  objc_msgSend__acceptRule(a1, v271, v272, v273, v274);
  v502 = (void *)objc_claimAutoreleasedReturnValue();
  v618[3] = v502;
  v618[4] = &unk_1E4ABC120;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v275, (uint64_t)v618, 5, v276);
  v501 = (void *)objc_claimAutoreleasedReturnValue();
  v661[42] = v501;
  v617[0] = v6;
  v617[1] = &unk_1E4ABC138;
  v617[2] = v6;
  objc_msgSend__acceptRule(a1, v277, v278, v279, v280);
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  v617[3] = v500;
  v617[4] = &unk_1E4ABC150;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v281, (uint64_t)v617, 5, v282);
  v499 = (void *)objc_claimAutoreleasedReturnValue();
  v661[43] = v499;
  v616[0] = v6;
  v616[1] = &unk_1E4ABC168;
  v616[2] = v6;
  objc_msgSend__acceptRule(a1, v283, v284, v285, v286);
  v498 = (void *)objc_claimAutoreleasedReturnValue();
  v616[3] = v498;
  v616[4] = &unk_1E4ABC180;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v287, (uint64_t)v616, 5, v288);
  v497 = (void *)objc_claimAutoreleasedReturnValue();
  v661[44] = v497;
  v615[0] = v6;
  v615[1] = &unk_1E4ABC198;
  v615[2] = v6;
  objc_msgSend__acceptRule(a1, v289, v290, v291, v292);
  v496 = (void *)objc_claimAutoreleasedReturnValue();
  v615[3] = v496;
  v615[4] = &unk_1E4ABC1B0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v293, (uint64_t)v615, 5, v294);
  v495 = (void *)objc_claimAutoreleasedReturnValue();
  v661[45] = v495;
  v614[0] = v6;
  v614[1] = &unk_1E4ABC1C8;
  v614[2] = v6;
  objc_msgSend__acceptRule(a1, v295, v296, v297, v298);
  v494 = (void *)objc_claimAutoreleasedReturnValue();
  v614[3] = v494;
  v614[4] = &unk_1E4ABC1E0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v299, (uint64_t)v614, 5, v300);
  v493 = (void *)objc_claimAutoreleasedReturnValue();
  v661[46] = v493;
  v613[0] = v6;
  v613[1] = &unk_1E4ABC1F8;
  v613[2] = v6;
  objc_msgSend__acceptRule(a1, v301, v302, v303, v304);
  v492 = (void *)objc_claimAutoreleasedReturnValue();
  v613[3] = v492;
  v613[4] = &unk_1E4ABC210;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v305, (uint64_t)v613, 5, v306);
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  v661[47] = v491;
  v612[0] = v6;
  v612[1] = &unk_1E4ABC228;
  v612[2] = v6;
  objc_msgSend__acceptRule(a1, v307, v308, v309, v310);
  v490 = (void *)objc_claimAutoreleasedReturnValue();
  v612[3] = v490;
  v612[4] = &unk_1E4ABC240;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v311, (uint64_t)v612, 5, v312);
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  v661[48] = v489;
  v611[0] = v6;
  v611[1] = &unk_1E4ABC258;
  v611[2] = v6;
  objc_msgSend__acceptRule(a1, v313, v314, v315, v316);
  v488 = (void *)objc_claimAutoreleasedReturnValue();
  v611[3] = v488;
  v611[4] = &unk_1E4ABC270;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v317, (uint64_t)v611, 5, v318);
  v487 = (void *)objc_claimAutoreleasedReturnValue();
  v661[49] = v487;
  v610[0] = v6;
  v610[1] = &unk_1E4ABC288;
  v610[2] = v6;
  objc_msgSend__acceptRule(a1, v319, v320, v321, v322);
  v486 = (void *)objc_claimAutoreleasedReturnValue();
  v610[3] = v486;
  v610[4] = &unk_1E4ABC2A0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v323, (uint64_t)v610, 5, v324);
  v485 = (void *)objc_claimAutoreleasedReturnValue();
  v661[50] = v485;
  v609[0] = v6;
  v609[1] = &unk_1E4ABC2B8;
  v609[2] = v6;
  objc_msgSend__acceptRule(a1, v325, v326, v327, v328);
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  v609[3] = v484;
  v609[4] = &unk_1E4ABC2D0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v329, (uint64_t)v609, 5, v330);
  v483 = (void *)objc_claimAutoreleasedReturnValue();
  v661[51] = v483;
  v608[0] = v6;
  v608[1] = &unk_1E4ABC2E8;
  v608[2] = v6;
  objc_msgSend__acceptRule(a1, v331, v332, v333, v334);
  v482 = (void *)objc_claimAutoreleasedReturnValue();
  v608[3] = v482;
  v608[4] = &unk_1E4ABC300;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v335, (uint64_t)v608, 5, v336);
  v481 = (void *)objc_claimAutoreleasedReturnValue();
  v661[52] = v481;
  v607[0] = v6;
  v607[1] = &unk_1E4ABC318;
  v607[2] = v6;
  objc_msgSend__acceptRule(a1, v337, v338, v339, v340);
  v480 = (void *)objc_claimAutoreleasedReturnValue();
  v607[3] = v480;
  v607[4] = &unk_1E4ABC330;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v341, (uint64_t)v607, 5, v342);
  v479 = (void *)objc_claimAutoreleasedReturnValue();
  v661[53] = v479;
  v606[0] = v6;
  v606[1] = &unk_1E4ABC348;
  v606[2] = v6;
  objc_msgSend__acceptRule(a1, v343, v344, v345, v346);
  v478 = (void *)objc_claimAutoreleasedReturnValue();
  v606[3] = v478;
  v606[4] = &unk_1E4ABC360;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v347, (uint64_t)v606, 5, v348);
  v477 = (void *)objc_claimAutoreleasedReturnValue();
  v661[54] = v477;
  v605[0] = v6;
  v605[1] = &unk_1E4ABC378;
  v605[2] = v6;
  objc_msgSend__acceptRule(a1, v349, v350, v351, v352);
  v476 = (void *)objc_claimAutoreleasedReturnValue();
  v605[3] = v476;
  v605[4] = &unk_1E4ABC390;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v353, (uint64_t)v605, 5, v354);
  v475 = (void *)objc_claimAutoreleasedReturnValue();
  v661[55] = v475;
  v604[0] = v6;
  v604[1] = &unk_1E4ABC3A8;
  v604[2] = v6;
  objc_msgSend__acceptRule(a1, v355, v356, v357, v358);
  v474 = (void *)objc_claimAutoreleasedReturnValue();
  v604[3] = v474;
  v604[4] = &unk_1E4ABC3C0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v359, (uint64_t)v604, 5, v360);
  v473 = (void *)objc_claimAutoreleasedReturnValue();
  v661[56] = v473;
  v603[0] = v6;
  v603[1] = &unk_1E4ABC3D8;
  v603[2] = v6;
  objc_msgSend__acceptRule(a1, v361, v362, v363, v364);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  v603[3] = v472;
  v603[4] = &unk_1E4ABC3F0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v365, (uint64_t)v603, 5, v366);
  v471 = (void *)objc_claimAutoreleasedReturnValue();
  v661[57] = v471;
  v602[0] = v6;
  v602[1] = &unk_1E4ABC408;
  v602[2] = v6;
  objc_msgSend__acceptRule(a1, v367, v368, v369, v370);
  v470 = (void *)objc_claimAutoreleasedReturnValue();
  v602[3] = v470;
  v602[4] = &unk_1E4ABC420;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v371, (uint64_t)v602, 5, v372);
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  v661[58] = v469;
  v601[0] = v6;
  v601[1] = &unk_1E4ABC438;
  v601[2] = v6;
  objc_msgSend__acceptRule(a1, v373, v374, v375, v376);
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  v601[3] = v468;
  v601[4] = &unk_1E4ABC450;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v377, (uint64_t)v601, 5, v378);
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  v661[59] = v467;
  v600[0] = v6;
  v600[1] = &unk_1E4ABC468;
  v600[2] = v6;
  objc_msgSend__acceptRule(a1, v379, v380, v381, v382);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  v600[3] = v466;
  v600[4] = &unk_1E4ABC480;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v383, (uint64_t)v600, 5, v384);
  v465 = (void *)objc_claimAutoreleasedReturnValue();
  v661[60] = v465;
  v599[0] = v6;
  v599[1] = &unk_1E4ABC498;
  v599[2] = v6;
  objc_msgSend__acceptRule(a1, v385, v386, v387, v388);
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  v599[3] = v464;
  v599[4] = &unk_1E4ABC4B0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v389, (uint64_t)v599, 5, v390);
  v463 = (void *)objc_claimAutoreleasedReturnValue();
  v661[61] = v463;
  v598[0] = v6;
  v598[1] = &unk_1E4ABC4C8;
  v598[2] = v6;
  objc_msgSend__acceptRule(a1, v391, v392, v393, v394);
  v462 = (void *)objc_claimAutoreleasedReturnValue();
  v598[3] = v462;
  v598[4] = &unk_1E4ABC4E0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v395, (uint64_t)v598, 5, v396);
  v461 = (void *)objc_claimAutoreleasedReturnValue();
  v661[62] = v461;
  v597[0] = v6;
  v597[1] = &unk_1E4ABC4F8;
  v597[2] = v6;
  objc_msgSend__acceptRule(a1, v397, v398, v399, v400);
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  v597[3] = v460;
  v597[4] = &unk_1E4ABC510;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v401, (uint64_t)v597, 5, v402);
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  v661[63] = v459;
  v596[0] = v6;
  v596[1] = &unk_1E4ABC528;
  v596[2] = v6;
  objc_msgSend__acceptRule(a1, v403, v404, v405, v406);
  v458 = (void *)objc_claimAutoreleasedReturnValue();
  v596[3] = v458;
  v596[4] = &unk_1E4ABC540;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v407, (uint64_t)v596, 5, v408);
  v457 = (void *)objc_claimAutoreleasedReturnValue();
  v661[64] = v457;
  v595[0] = v6;
  v595[1] = &unk_1E4ABC558;
  v595[2] = v6;
  objc_msgSend__acceptRule(a1, v409, v410, v411, v412);
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  v595[3] = v456;
  v595[4] = &unk_1E4ABC570;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v413, (uint64_t)v595, 5, v414);
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  v661[65] = v415;
  v594[0] = v6;
  v594[1] = &unk_1E4ABC588;
  v594[2] = v6;
  objc_msgSend__acceptRule(a1, v416, v417, v418, v419);
  v420 = (void *)objc_claimAutoreleasedReturnValue();
  v594[3] = v420;
  v594[4] = &unk_1E4ABC5A0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v421, (uint64_t)v594, 5, v422);
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  v661[66] = v423;
  v593[0] = v6;
  v593[1] = &unk_1E4ABC5B8;
  v593[2] = v6;
  objc_msgSend__acceptRule(a1, v424, v425, v426, v427);
  v428 = (void *)objc_claimAutoreleasedReturnValue();
  v593[3] = v428;
  v593[4] = &unk_1E4ABC5D0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v429, (uint64_t)v593, 5, v430);
  v431 = (void *)objc_claimAutoreleasedReturnValue();
  v661[67] = v431;
  v592[0] = v6;
  v592[1] = &unk_1E4ABC5E8;
  v592[2] = v6;
  objc_msgSend__acceptRule(a1, v432, v433, v434, v435);
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  v592[3] = v436;
  v592[4] = &unk_1E4ABC600;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v437, (uint64_t)v592, 5, v438);
  v439 = (void *)objc_claimAutoreleasedReturnValue();
  v661[68] = v439;
  v591[0] = v6;
  v591[1] = &unk_1E4ABC618;
  v591[2] = v6;
  objc_msgSend__acceptRule(a1, v440, v441, v442, v443);
  v444 = (void *)objc_claimAutoreleasedReturnValue();
  v591[3] = v444;
  v591[4] = &unk_1E4ABC630;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v445, (uint64_t)v591, 5, v446);
  v447 = (void *)objc_claimAutoreleasedReturnValue();
  v661[69] = v447;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v448, (uint64_t)v661, 70, v449);
  v455 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_ax_mappedArrayUsingBlock_(v455, v450, (uint64_t)&unk_1E4A9D4E8, v451, v452);
  v453 = (void *)objc_claimAutoreleasedReturnValue();

  return v453;
}

+ (id)_phonoTranslation:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t i;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (**v40)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  float v87;
  float v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  float v107;
  float v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  float v123;
  float v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  float v146;
  float v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  float v151;
  TTSApplebetMapperPhonemeInfo *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  double v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  float v167;
  double v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  void *v188;
  void *v189;
  void *v190;
  id v191;
  void *v192;
  id obj;
  id v194;
  id v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  unsigned int v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  _BYTE v204[128];
  uint64_t v205;

  v205 = *MEMORY[0x1E0C80C00];
  v195 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5, v6, v7);
  v194 = (id)objc_claimAutoreleasedReturnValue();
  v191 = a1;
  objc_msgSend__phonemeRules(a1, v8, v9, v10, v11);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = 0;
  while (objc_msgSend_count(v195, v12, v13, v14, v15, v188) > (unint64_t)(int)v198)
  {
    v202 = 0u;
    v203 = 0u;
    v200 = 0u;
    v201 = 0u;
    obj = v188;
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v200, (uint64_t)v204, 16);
    if (!v17)
    {

      goto LABEL_43;
    }
    v22 = 0;
    v196 = v17;
    v197 = *(_QWORD *)v201;
    v199 = -1;
    do
    {
      for (i = 0; i != v196; ++i)
      {
        if (*(_QWORD *)v201 != v197)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * i);
        objc_msgSend_left(v24, v18, v19, v20, v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_match(v24, v26, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_right(v24, v31, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_matchRule(v24, v36, v37, v38, v39);
        v40 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend_substitution(v24, v41, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        ++v199;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((int)v198 > 0)
            goto LABEL_15;
        }
        else if (objc_msgSend_count(v25, v46, v47, v48, v49) > (unint64_t)(int)v198)
        {
          goto LABEL_15;
        }
        v50 = objc_msgSend_count(v195, v46, v47, v48, v49);
        v59 = v50 - v198 - objc_msgSend_count(v30, v51, v52, v53, v54);
        if (v59 < 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (objc_msgSend_count(v35, v55, v56, v57, v58) > (unint64_t)v59)
          {
LABEL_15:
            v60 = 5;
            goto LABEL_37;
          }
        }
        else if (v59)
        {
          goto LABEL_15;
        }
        objc_msgSend__phonoMatch_match_matchpos_count_(v191, v55, (uint64_t)v195, (uint64_t)v30, v198, v199);
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        if (v192)
        {
          v65 = objc_msgSend_count(v25, v61, v62, v63, v64);
          objc_msgSend__phonoMatch_match_matchpos_count_(v191, v66, (uint64_t)v195, (uint64_t)v25, (v198 - v65), v199);
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          if (v190)
          {
            v71 = objc_msgSend_count(v30, v67, v68, v69, v70);
            objc_msgSend__phonoMatch_match_matchpos_count_(v191, v72, (uint64_t)v195, (uint64_t)v35, (v198 + v71), v199);
            v73 = objc_claimAutoreleasedReturnValue();
            v189 = (void *)v73;
            if (v73
              && (((uint64_t (**)(_QWORD, void *, void *, uint64_t))v40)[2](v40, v190, v192, v73) & 1) != 0)
            {
              objc_msgSend_objectAtIndexedSubscript_(v195, v74, (int)v198, v75, v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_startTime(v77, v78, v79, v80, v81);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_floatValue(v82, v83, v84, v85, v86);
              v88 = v87;

              v93 = objc_msgSend_count(v30, v89, v90, v91, v92);
              objc_msgSend_objectAtIndexedSubscript_(v195, v94, (int)v198 + v93 - 1, v95, v96);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_endTime(v97, v98, v99, v100, v101);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_floatValue(v102, v103, v104, v105, v106);
              v108 = v107;

              v113 = objc_msgSend_count(v30, v109, v110, v111, v112);
              v122 = (void *)objc_msgSend_mutableCopy(v45, v114, v115, v116, v117);
              v123 = v108 - v88;
              v198 = (v198 + v113);
              v124 = v108 - v88;
              while (objc_msgSend_count(v122, v118, v119, v120, v121))
              {
                objc_msgSend_firstObject(v122, v125, v126, v127, v128);
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_removeObjectAtIndex_(v122, v130, 0, v131, v132);
                if (objc_msgSend_count(v122, v133, v134, v135, v136))
                {
                  objc_msgSend_firstObject(v122, v137, v138, v139, v140);
                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_floatValue(v141, v142, v143, v144, v145);
                  v147 = v146;

                  objc_msgSend_removeObjectAtIndex_(v122, v148, 0, v149, v150);
                }
                else
                {
                  v147 = 0.0;
                }
                if (objc_msgSend_count(v122, v137, v138, v139, v140))
                  v151 = v123 * v147;
                else
                  v151 = v124;
                v152 = [TTSApplebetMapperPhonemeInfo alloc];
                v157 = (void *)objc_msgSend_init(v152, v153, v154, v155, v156);

                *(float *)&v158 = v88;
                objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v159, v160, v161, v162, v158);
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setStartTime_(v157, v164, (uint64_t)v163, v165, v166);

                v167 = v151 + 0.5;
                v88 = v88 + v167;
                *(float *)&v168 = v88;
                objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v169, v170, v171, v172, v168);
                v173 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setEndTime_(v157, v174, (uint64_t)v173, v175, v176);

                objc_msgSend_setPhoneme_(v157, v177, (uint64_t)v129, v178, v179);
                objc_msgSend_addObject_(v194, v180, (uint64_t)v157, v181, v182);

                v124 = v124 - v167;
              }

              v22 = 1;
              v60 = 4;
            }
            else
            {
              v60 = 5;
            }

          }
          else
          {
            v60 = 5;
          }

        }
        else
        {
          v60 = 5;
        }

LABEL_37:
        if (v60 != 5)
          goto LABEL_40;
      }
      v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v200, (uint64_t)v204, 16);
    }
    while (v196);
LABEL_40:

    if ((v22 & 1) == 0)
    {
LABEL_43:
      objc_msgSend_objectAtIndexedSubscript_(v195, v12, (int)v198, v14, v15);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v194, v184, (uint64_t)v183, v185, v186);

      v198 = (v198 + 1);
    }
  }

  return v194;
}

+ (id)convertLHToApplebet:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  id v103;
  id v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t i;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  SEL v118;
  id v119;
  void *v120;
  uint64_t v121;
  void *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _QWORD v128[3];

  v128[1] = *MEMORY[0x1E0C80C00];
  v119 = a3;
  objc_msgSend__phonemeArray_(a1, v5, (uint64_t)v119, v6, v7);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v120, v8, v9, v10, v11))
  {
    objc_msgSend__phonoTranslation_(a1, v12, (uint64_t)v120, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_count(v15, v16, v17, v18, v19);
    v25 = v20;
    if (v20 >= 1)
    {
      v118 = a2;
      v26 = 0;
      v121 = v20;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v15, v21, v26, v23, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_phoneme(v27, v28, v29, v30, v31);
        v122 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend_isEqualToString_(v122, v32, (uint64_t)CFSTR("1"), v33, v34) & 1) != 0
          || (objc_msgSend_isEqualToString_(v122, v35, (uint64_t)CFSTR("2"), v37, v38) & 1) != 0)
        {
          v39 = v26 + 1;
          if ((int)v26 + 1 >= v25)
          {
            LODWORD(v40) = v26 + 1;
          }
          else
          {
            v40 = (int)v39;
            while (1)
            {
              objc_msgSend_objectAtIndexedSubscript_(v15, v35, v40, v37, v38);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_phoneme(v41, v42, v43, v44, v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend__retrieveRegularExpression_(a1, v47, (uint64_t)CFSTR("((AE)|(EY)|(AO)|(AX)|(IY)|(EH)|(IH)|(AY)|(IX)|(AA)|(UW)|(UH)|(UX)|(OW)|(AW)|(OY))"), v48, v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend_length(v46, v51, v52, v53, v54);
              objc_msgSend_firstMatchInString_options_range_(v50, v56, (uint64_t)v46, 0, 0, v55);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = v57;
              if (v57)
              {
                if (objc_msgSend_range(v57, v58, v59, v60, v61) != 0x7FFFFFFFFFFFFFFFLL)
                  break;
              }

              if ((int)++v40 >= v25)
                goto LABEL_15;
            }

          }
LABEL_15:
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v35, v36, v37, v38);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend_subarrayWithRange_(v15, v63, 0, v26, v64);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v66 = (void *)MEMORY[0x1E0C9AA60];
          }
          v67 = (v40 + ~(_DWORD)v26);
          if ((int)v67 < 1)
          {
            v68 = (void *)MEMORY[0x1E0C9AA60];
          }
          else
          {
            objc_msgSend_subarrayWithRange_(v15, v63, v26 + 1, v67, v64);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_objectAtIndex_(v15, v63, v26, v67, v64);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v128[0] = v69;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v70, (uint64_t)v128, 1, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_subarrayWithRange_(v15, v73, (int)v40, v25 - (int)v40, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v65, v76, (uint64_t)v66, v77, v78);
          objc_msgSend_addObjectsFromArray_(v65, v79, (uint64_t)v68, v80, v81);
          objc_msgSend_addObjectsFromArray_(v65, v82, (uint64_t)v72, v83, v84);
          objc_msgSend_addObjectsFromArray_(v65, v85, (uint64_t)v75, v86, v87);
          v92 = objc_msgSend_count(v15, v88, v89, v90, v91);
          if (v92 != objc_msgSend_count(v65, v93, v94, v95, v96))
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v97, v98, v99, v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v101, v102, (uint64_t)v118, (uint64_t)a1, (uint64_t)CFSTR("TTSLHPhonemeToApplebetPhonemeMapper.mm"), 680, CFSTR("updated phonemes and xlatedPhonemesArray"));

          }
          v26 = v39;
          v15 = v65;
        }
        else
        {
          ++v26;
        }

      }
      while (v26 != v121);
    }
    objc_msgSend_string(MEMORY[0x1E0CB37A0], v21, v22, v23, v24);
    v103 = (id)objc_claimAutoreleasedReturnValue();
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v104 = v15;
    v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v123, (uint64_t)v127, 16);
    if (v110)
    {
      v111 = *(_QWORD *)v124;
      do
      {
        for (i = 0; i != v110; ++i)
        {
          if (*(_QWORD *)v124 != v111)
            objc_enumerationMutation(v104);
          objc_msgSend_phoneme(*(void **)(*((_QWORD *)&v123 + 1) + 8 * i), v106, v107, v108, v109);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v103, v114, (uint64_t)v113, v115, v116);

        }
        v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v106, (uint64_t)&v123, (uint64_t)v127, 16);
      }
      while (v110);
    }

  }
  else
  {
    v103 = v119;
  }

  return v103;
}

@end
