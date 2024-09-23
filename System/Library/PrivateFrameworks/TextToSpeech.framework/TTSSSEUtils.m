@implementation TTSSSEUtils

+ (id)unescapeDelimeterBoundedSSMLInString:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  int isEqualToString;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  TTSSpeechString *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  void *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  void *v88;
  id obj;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v91 = a3;
  if (qword_1EE6D5838 != -1)
    dispatch_once(&qword_1EE6D5838, &unk_1E4A9F4C8);
  if (qword_1EE6D5840)
    v7 = qword_1EE6D5848 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend_copy(v91, v3, v4, v5, v6);
    v10 = (void *)qword_1EE6D5848;
    v15 = objc_msgSend_length(v91, v11, v12, v13, v14);
    objc_msgSend_matchesInString_options_range_(v10, v16, (uint64_t)v91, 0, 0, v15);
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v96, (uint64_t)v101, 16);
    v22 = v18;
    if (v18)
    {
      v23 = 0;
      v24 = *(_QWORD *)v97;
      do
      {
        v25 = 0;
        v26 = v23;
        do
        {
          if (*(_QWORD *)v97 != v24)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v25);
          v28 = objc_msgSend_rangeWithName_(v27, v19, (uint64_t)CFSTR("delimiter"), v20, v21);
          objc_msgSend_substringWithRange_(v91, v29, v28, (uint64_t)v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v31, v32, (uint64_t)CFSTR("[[SSMLESCAPED]]"), v33, v34);
          if (isEqualToString)
            v23 = v26 + 1;
          else
            v23 = v26 - 1;
          if (v26 > (isEqualToString ^ 1u))
          {
            v40 = objc_msgSend_range(v27, v36, v37, v38, v39);
            v42 = (uint64_t)v41;
            objc_msgSend_range(v27, v41, v43, v44, v45);
            objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(&stru_1E4AA5CE8, v46, (uint64_t)v46, (uint64_t)CFSTR(" "), 0);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByReplacingCharactersInRange_withString_(v9, v48, v40, v42, (uint64_t)v47);
            v49 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v49;
          }

          ++v25;
          v26 = v23;
        }
        while (v22 != v25);
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v96, (uint64_t)v101, 16);
      }
      while (v22);
    }

    v50 = [TTSSpeechString alloc];
    v8 = (void *)objc_msgSend_initWithOriginalString_(v50, v51, (uint64_t)v9, v52, v53);
    v54 = (void *)qword_1EE6D5840;
    v59 = objc_msgSend_length(v9, v55, v56, v57, v58);
    objc_msgSend_matchesInString_options_range_(v54, v60, (uint64_t)v9, 0, 0, v59);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    objc_msgSend_reverseObjectEnumerator(v88, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v92, (uint64_t)v100, 16);
    if (v70)
    {
      v71 = *(_QWORD *)v93;
      do
      {
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v93 != v71)
            objc_enumerationMutation(v65);
          v73 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
          v74 = objc_msgSend_rangeWithName_(v73, v67, (uint64_t)CFSTR("enclosedssml"), v68, v69, v88);
          objc_msgSend_substringWithRange_(v9, v75, v74, (uint64_t)v75, v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_performEscapeOrDeEscapeFor_escape_(a1, v78, (uint64_t)v77, 0, v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          v85 = objc_msgSend_range(v73, v81, v82, v83, v84);
          objc_msgSend_transformRange_to_(v8, v86, v85, (uint64_t)v86, (uint64_t)v80);

        }
        v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v67, (uint64_t)&v92, (uint64_t)v100, 16);
      }
      while (v70);
    }

  }
  return v8;
}

+ (id)performEscapeOrDeEscapeFor:(id)a3 escape:(BOOL)a4
{
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1A399FBA8;
  v27 = sub_1A399FBB8;
  v5 = a3;
  v28 = v5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E4ABC6F0, v6, (uint64_t)&v19, (uint64_t)v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(&unk_1E4ABC6F0);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        v17[0] = v12;
        v17[1] = 3221225472;
        v17[2] = sub_1A399FBC0;
        v17[3] = &unk_1E4AA1960;
        v18 = a4;
        v17[4] = &v23;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v14, v7, (uint64_t)v17, v8, v9);
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E4ABC6F0, v7, (uint64_t)&v19, (uint64_t)v29, 16);
    }
    while (v10);
  }
  v15 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v15;
}

+ (id)escapeSSML:(id)a3
{
  uint64_t v3;

  objc_msgSend_performEscapeOrDeEscapeFor_escape_(a1, a2, (uint64_t)a3, 1, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (_NSRange)nonSSMLSubstringRangeForRange:(_NSRange)a3 fromSSML:(id)a4
{
  NSUInteger length;
  uint64_t location;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  objc_msgSend_shared(SSMLServices, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convertRange_forSSML_(v11, v12, location, length, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_error(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    location = objc_msgSend_convertedRange(v13, v19, v20, v21, v22);
    length = v23;
  }

  v24 = location;
  v25 = length;
  result.length = v25;
  result.location = v24;
  return result;
}

+ (id)ttsMarkerForSSEMarker:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  TTSWordMarker *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
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
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;

  v6 = a3;
  v7 = a4;
  v12 = objc_msgSend_mark(v6, v8, v9, v10, v11);
  if (v12)
  {
    if (v12 == 1)
    {
      objc_msgSend_unescapedSpeechString(v7, v13, v14, v15, v16);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend_textRange(v6, v51, v52, v53, v54);
      v58 = objc_msgSend_translateRangeInTransformedString_(v50, v56, v55, (uint64_t)v56, v57);
      v60 = v59;

      objc_msgSend_speechString(v7, v61, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend_type(v65, v66, v67, v68, v69);

      if (!v70)
      {
        objc_msgSend_unescapedSpeechString(v7, v71, v72, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_originalString(v75, v76, v77, v78, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend_nonSSMLSubstringRangeForRange_fromSSML_(a1, v81, v58, v60, (uint64_t)v80);
        v60 = v82;

      }
      objc_msgSend_speechString(v7, v71, v72, v73, v74);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend_translateRangeInTransformedString_(v83, v84, v58, v60, v85);
      v88 = v87;

      v17 = objc_alloc_init(TTSWordMarker);
      objc_msgSend_setWordRange_(v17, v89, v86, v88, v90);
      v95 = objc_msgSend_byteSampleOffset(v6, v91, v92, v93, v94);
      objc_msgSend_setByteOffset_(v17, v96, v95, v97, v98);
    }
    else if (v12 == 4)
    {
      v17 = objc_alloc_init(TTSGenericMarker);
      objc_msgSend_bookmarkName(v6, v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setName_(v17, v23, (uint64_t)v22, v24, v25);

      v30 = objc_msgSend_byteSampleOffset(v6, v26, v27, v28, v29);
      objc_msgSend_setByteOffset_(v17, v31, v30, v32, v33);
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = objc_alloc_init(TTSPhonemeMarker);
    objc_msgSend_phoneme(v6, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPhoneme_(v17, v39, (uint64_t)v38, v40, v41);

    v46 = objc_msgSend_byteSampleOffset(v6, v42, v43, v44, v45);
    objc_msgSend_setByteOffset_(v17, v47, v46, v48, v49);
  }

  return v17;
}

+ (id)enclosedStringWithPhonemes:(id)a3 originalString:(id)a4
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_xmlEscaped(a4, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v12, (uint64_t)CFSTR("<phoneme alphabet=\"ipa\" ph=\"%@\">%@</phoneme>"), v13, v14, v5, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_escapeSSML_(TTSSSEUtils, v16, (uint64_t)v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("%@%@%@"), v21, v22, CFSTR("[[SSMLESCAPED]]"), v19, CFSTR("[[[SSMLESCAPED]]]"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)genericMarkerMarkupWithName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<mark name=\"%@\" />"), v3, v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_escapeSSML_(TTSSSEUtils, v6, (uint64_t)v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("%@%@%@"), v11, v12, CFSTR("[[SSMLESCAPED]]"), v9, CFSTR("[[[SSMLESCAPED]]]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_escapeSSML_(TTSSSEUtils, v14, (uint64_t)v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)speechMarkupStringForType:(int64_t)a3 string:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;

  v5 = a4;
  v10 = v5;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (!a3)
    {
      objc_msgSend_escapeSSML_(TTSSSEUtils, v6, (uint64_t)CFSTR("%@<break time=\"%%dms\" />%@"), v8, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v18, (uint64_t)v13, v19, v20, CFSTR("[[SSMLESCAPED]]"), CFSTR("[[[SSMLESCAPED]]]"));
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (a3 != 3)
    {
      v21 = &stru_1E4AA5CE8;
      goto LABEL_10;
    }
    if (objc_msgSend_length(v5, v6, v7, v8, v9) == 1)
    {
      objc_msgSend_lowercaseString(v10, v6, v11, v8, v9);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
  }
  objc_msgSend_escapeSSML_(TTSSSEUtils, v6, (uint64_t)CFSTR("%@<say-as interpret-as=\"characters\">%@</say-as>%@"), v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v14, (uint64_t)v13, v15, v16, CFSTR("[[SSMLESCAPED]]"), v10, CFSTR("[[[SSMLESCAPED]]]"));
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v21 = (__CFString *)v17;

LABEL_10:
  return v21;
}

+ (id)combinedProsodyMarkupForString:(id)a3 rate:(id)a4 pitch:(id)a5 volume:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc(MEMORY[0x1E0C89BA0]);
  v21 = (void *)objc_msgSend_initWithString_(v13, v14, (uint64_t)v9, v15, v16);
  if (v10)
  {
    objc_msgSend_floatValue(v10, v17, v18, v19, v20);
    objc_msgSend_setRate_(v21, v22, v23, v24, v25);
  }
  if (v12)
  {
    objc_msgSend_floatValue(v12, v17, v18, v19, v20);
    objc_msgSend_setVolume_(v21, v26, v27, v28, v29);
    if (!v11)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v11)
  {
LABEL_7:
    objc_msgSend_floatValue(v11, v17, v18, v19, v20);
    objc_msgSend_setPitchMultiplier_(v21, v30, v31, v32, v33);
    goto LABEL_8;
  }
  if (!v10)
  {
    v48 = v9;
    goto LABEL_12;
  }
LABEL_8:
  objc_msgSend_shared(SSMLServices, v17, v18, v19, v20);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_generateSSMLFromAVSpeechUtterance_(v34, v35, (uint64_t)v21, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_error(v38, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v48 = v9;
  }
  else
  {
    objc_msgSend_ssmlResult(v38, v44, v45, v46, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v49, v50, (uint64_t)CFSTR("<speak>"), (uint64_t)&stru_1E4AA5CE8, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v52, v53, (uint64_t)CFSTR("</speak>"), (uint64_t)&stru_1E4AA5CE8, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_escapeSSML_(TTSSSEUtils, v56, (uint64_t)v55, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v60, (uint64_t)CFSTR("%@%@%@"), v61, v62, CFSTR("[[SSMLESCAPED]]"), v59, CFSTR("[[[SSMLESCAPED]]]"));
    v48 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_12:

  return v48;
}

@end
