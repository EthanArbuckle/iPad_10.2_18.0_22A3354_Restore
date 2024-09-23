@implementation TTSPhonemeSupport

+ (id)applebetPhonemesFromIPA:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_lhPhonemesFromIPA_language_(a1, a2, (uint64_t)a3, (uint64_t)CFSTR("en-US"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convertLHToApplebet_(TTSLHPhonemeToApplebetPhonemeMapper, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)applebetPhonemesFromLH:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_convertLHToApplebet_(TTSLHPhonemeToApplebetPhonemeMapper, a2, (uint64_t)a3, v3, v4);
}

+ (id)_getPhonemeMapForSynth:(id)a3 language:(id)a4
{
  char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;

  v5 = (char *)a3;
  v10 = a4;
  if (qword_1EE6D56E0 != -1)
    dispatch_once(&qword_1EE6D56E0, &unk_1E4A9F388);
  objc_msgSend_lock((void *)qword_1EE6D56D8, v6, v7, v8, v9);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_1EE6D56D0, v11, (uint64_t)v5, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v10, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    _TTSLoadIPAToNativePhonemeMapForLanguage((uint64_t)v10, v5, v20, v21, v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend_objectForKeyedSubscript_((void *)qword_1EE6D56D0, v19, (uint64_t)v5, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_((void *)qword_1EE6D56D0, v29, (uint64_t)v28, (uint64_t)v5, v30);

      }
      objc_msgSend_objectForKeyedSubscript_((void *)qword_1EE6D56D0, v24, (uint64_t)v5, v26, v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v31, v32, (uint64_t)v18, (uint64_t)v10, v33);

    }
  }
  objc_msgSend_unlock((void *)qword_1EE6D56D8, v19, v20, v21, v22);

  return v18;
}

+ (id)_ipaVectorFromString:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, (uint64_t)CFSTR("ˌ"), (uint64_t)&stru_1E4AA5CE8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_length(v4, v5, v6, v7, v8);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 >= 1)
  {
    v18 = 0;
    do
    {
      v19 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v4, v14, v18, v15, v16);
      v21 = v20;
      objc_msgSend_substringWithRange_(v4, v20, v19, (uint64_t)v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v23;
      if (v21 == (const char *)2
        && objc_msgSend_characterAtIndex_(v23, v24, 1, v25, v26) == 865
        && v9 >= v18 + 2)
      {
        objc_msgSend_substringWithRange_(v4, v24, v19, 3, v26);
        v28 = objc_claimAutoreleasedReturnValue();

        ++v18;
        v27 = (void *)v28;
      }
      objc_msgSend_addObject_(v17, v24, (uint64_t)v27, v25, v26);
      v18 += (uint64_t)v21;

    }
    while (v18 < v9);
  }

  return v17;
}

+ (id)_phonemesFromIPA:(id)a3 language:(id)a4 synth:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v55;
  id v56;

  v7 = a3;
  v8 = a4;
  v11 = a5;
  if (!v8)
    v8 = TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  objc_msgSend__getPhonemeMapForSynth_language_(TTSPhonemeSupport, v9, (uint64_t)v11, (uint64_t)v8, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v55 = v11;
    v56 = v7;
    objc_msgSend__ipaVectorFromString_(TTSPhonemeSupport, v12, (uint64_t)v7, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (objc_msgSend_count(v16, v18, v19, v20, v21))
    {
      v25 = 0;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v16, v22, v25, v23, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v15, v27, (uint64_t)v26, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v25 + 1;
        if (v25 + 1 < objc_msgSend_count(v16, v32, v33, v34, v35))
        {
          objc_msgSend_objectAtIndexedSubscript_(v16, v36, v25 + 1, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingString_(v26, v40, (uint64_t)v39, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_objectForKeyedSubscript_(v15, v44, (uint64_t)v43, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v47)
          {
            v49 = v47;

            v30 = v49;
            v25 = v31;
          }

        }
        if (v30)
          objc_msgSend_appendString_(v17, v36, (uint64_t)v30, v37, v38);
        else
          objc_msgSend_appendString_(v17, v36, (uint64_t)v26, v37, v38);

        ++v25;
      }
      while (v25 < objc_msgSend_count(v16, v50, v51, v52, v53));
    }

    v11 = v55;
    v7 = v56;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)lhPhonemesFromIPA:(id)a3 language:(id)a4
{
  return (id)objc_msgSend__phonemesFromIPA_language_synth_(a1, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)CFSTR("Vocalizer"));
}

+ (id)eloquencePhonemesFromIPA:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend_containsString_(v6, v8, (uint64_t)CFSTR("ˈ"), v9, v10) & 1) != 0
    || objc_msgSend_containsString_(v6, v11, (uint64_t)CFSTR("'"), v12, v13))
  {
    objc_msgSend__phonemesFromIPA_language_synth_(a1, v11, (uint64_t)v6, (uint64_t)v7, (uint64_t)CFSTR("Kona"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)supportedIPAPhonemeLanguages
{
  void *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
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
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB34D0];
  v3 = objc_opt_class();
  objc_msgSend_bundleForClass_(v2, v4, v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathsForResourcesOfType_inDirectory_(v7, v8, (uint64_t)CFSTR("json"), (uint64_t)CFSTR("PhonemeMaps"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_set(MEMORY[0x1E0C99E20], v11, v12, v13, v14);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v15 = v10;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v45, (uint64_t)v49, 16);
  if (v17)
  {
    v21 = v17;
    v22 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v46 != v22)
          objc_enumerationMutation(v15);
        v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (objc_msgSend_rangeOfString_(v24, v18, (uint64_t)CFSTR("Vocalizer"), v19, v20) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend_componentsSeparatedByString_(v24, v18, (uint64_t)CFSTR("Vocalizer-"), v19, v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lastObject(v25, v26, v27, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_componentsSeparatedByString_(v30, v31, (uint64_t)CFSTR("."), v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v34, v35, v36, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
            objc_msgSend_addObject_(v44, v40, (uint64_t)v39, v41, v42);

        }
      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v45, (uint64_t)v49, 16);
    }
    while (v21);
  }

  return v44;
}

@end
