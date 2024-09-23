@implementation TTSRulesetRunner

- (TTSRulesetRunner)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  TTSRulesetRunner *v6;
  uint64_t v7;
  NSMutableArray *ruleReplacements;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *ruleSets;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *regexExecutionQueue;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TTSRulesetRunner;
  v6 = -[TTSRulesetRunner init](&v20, sel_init);
  if (v6)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    ruleReplacements = v6->_ruleReplacements;
    v6->_ruleReplacements = (NSMutableArray *)v7;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    ruleSets = v6->_ruleSets;
    v6->_ruleSets = (NSMutableArray *)v13;

    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INTERACTIVE, -1);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("ttsruleset.execution", v16);
    regexExecutionQueue = v6->_regexExecutionQueue;
    v6->_regexExecutionQueue = (OS_dispatch_queue *)v17;

  }
  return v6;
}

- (void)reset
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSMutableArray *v6;
  NSMutableArray *ruleReplacements;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  NSMutableArray *ruleSets;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4);
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  ruleReplacements = self->_ruleReplacements;
  self->_ruleReplacements = v6;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11);
  v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  ruleSets = self->_ruleSets;
  self->_ruleSets = v12;

}

- (void)loadRuleSet:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_addObject_(self->_ruleSets, a2, (uint64_t)a3, v3, v4);
  MEMORY[0x1E0DE7D20](self, sel__recomputeRuleOrdering, v6, v7, v8);
}

- (void)unloadRuleset:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_removeObject_(self->_ruleSets, a2, (uint64_t)a3, v3, v4);
  MEMORY[0x1E0DE7D20](self, sel__recomputeRuleOrdering, v6, v7, v8);
}

- (void)_recomputeRuleOrdering
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  id obj;
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
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend_removeAllObjects(self->_ruleReplacements, a2, v2, v3, v4);
  objc_msgSend_ruleSets(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortUsingComparator_(v10, v11, (uint64_t)&unk_1E4A9F368, v12, v13);

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend_ruleSets(self, v14, v15, v16, v17);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v61, (uint64_t)v66, 16);
  if (v19)
  {
    v24 = v19;
    v25 = *(_QWORD *)v62;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v62 != v25)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v26);
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        objc_msgSend_ruleReplacements(v27, v20, v21, v22, v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v57, (uint64_t)v65, 16);
        if (v30)
        {
          v35 = v30;
          v36 = *(_QWORD *)v58;
          do
          {
            v37 = 0;
            do
            {
              if (*(_QWORD *)v58 != v36)
                objc_enumerationMutation(v28);
              v38 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v37);
              objc_msgSend_ruleReplacements(self, v31, v32, v33, v34);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend_count(v39, v40, v41, v42, v43);
              objc_msgSend_setIndex_(v38, v45, v44, v46, v47);

              objc_msgSend_ruleReplacements(self, v48, v49, v50, v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v52, v53, (uint64_t)v38, v54, v55);

              ++v37;
            }
            while (v35 != v37);
            v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v57, (uint64_t)v65, 16);
          }
          while (v35);
        }

        ++v26;
      }
      while (v26 != v24);
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v61, (uint64_t)v66, 16);
    }
    while (v24);
  }

}

- (id)processText:(id)a3
{
  id v4;
  TTSRulesetRunner *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  TTSSpeechString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
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
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  TTSSpeechString *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  TTSSpeechString *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (**v53)(_QWORD, _QWORD);
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  TTSSpeechString *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v88[4];
  id v89;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    objc_msgSend_setExecuting_(v5, v6, 1, v7, v8);
    v9 = [TTSSpeechString alloc];
    v13 = (void *)objc_msgSend_initWithOriginalString_(v9, v10, (uint64_t)v4, v11, v12);
    objc_msgSend_preRuleWriter(v5, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend_preRuleWriter(v5, v19, v20, v21, v22);
      v23 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v23)[2](v23, v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_finalized(v24, v25, v26, v27, v28))
      {
        v29 = [TTSSpeechString alloc];
        v13 = (void *)objc_msgSend_initWithParentSpeechString_(v29, v30, (uint64_t)v24, v31, v32);

      }
      else
      {
        v13 = v24;
      }
    }
    objc_msgSend__processSpeechString_startingAt_currentRecursionDepth_(v5, v19, (uint64_t)v13, 0, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postRuleWriter(v5, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      if (objc_msgSend_finalized(v34, v40, v41, v42, v43))
      {
        v48 = [TTSSpeechString alloc];
        v52 = objc_msgSend_initWithParentSpeechString_(v48, v49, (uint64_t)v34, v50, v51);

        v34 = (void *)v52;
      }
      objc_msgSend_postRuleWriter(v5, v44, v45, v46, v47);
      v53 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v53)[2](v53, v34);
      v54 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v54;
    }
    if (objc_msgSend_finalized(v34, v40, v41, v42, v43))
    {
      v59 = [TTSSpeechString alloc];
      v63 = objc_msgSend_initWithParentSpeechString_(v59, v60, (uint64_t)v34, v61, v62);

      v34 = (void *)v63;
    }
    objc_msgSend_sharedInstance(TTSRegexCache, v55, v56, v57, v58);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_regexForString_atStart_(v64, v65, (uint64_t)CFSTR("__AXTTS_SHIELDS_(UP|DOWN)__"), 0, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_originalString(v34, v68, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_originalString(v34, v73, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend_length(v77, v78, v79, v80, v81);
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = sub_1A396F708;
    v88[3] = &unk_1E4AA02D8;
    v33 = v34;
    v89 = v33;
    objc_msgSend_enumerateMatchesInString_options_range_usingBlock_(v67, v83, (uint64_t)v72, 2, 0, v82, v88);

    objc_msgSend_setExecuting_(v5, v84, 0, v85, v86);
    objc_sync_exit(v5);

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)cancelProcessing
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  TTSRulesetRunner *obj;

  if (objc_msgSend_executing(self, a2, v2, v3, v4))
  {
    objc_msgSend_setShouldAbort_(self, v6, 1, v7, v8);
    obj = self;
    objc_sync_enter(obj);
    objc_msgSend_setShouldAbort_(obj, v9, 0, v10, v11);
    objc_sync_exit(obj);

  }
}

- (NSNumber)ruleCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_ruleReplacements(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v6, v7, v8, v9, v10);
  objc_msgSend_numberWithUnsignedInteger_(v5, v12, v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v15;
}

- (id)_ignoreRangesForString:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  unint64_t v27;
  const char *v28;
  const char *v29;
  unint64_t v30;
  _BOOL4 v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;

  v3 = a3;
  v7 = objc_msgSend_rangeOfString_(v3, v4, (uint64_t)CFSTR("__AXTTS_SHIELDS_UP__"), v5, v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_27;
  }
  v13 = v7;
  v14 = (unint64_t)&v8[v7];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 1;
  if (v14 < objc_msgSend_length(v3, v15, v16, v17, v18))
  {
    do
    {
      v24 = objc_msgSend_length(v3, v19, v20, v21, v22);
      v25 = v24 - v14;
      v27 = objc_msgSend_rangeOfString_options_range_(v3, v26, (uint64_t)CFSTR("__AXTTS_SHIELDS_UP__"), 2, v14, v24 - v14);
      v29 = v28;
      v30 = objc_msgSend_rangeOfString_options_range_(v3, v28, (uint64_t)CFSTR("__AXTTS_SHIELDS_DOWN__"), 2, v14, v25);
      v32 = v27 == 0x7FFFFFFFFFFFFFFFLL || v27 > v30;
      if (v30 == 0x7FFFFFFFFFFFFFFFLL || !v32)
      {
        if (v23)
          v33 = v13;
        else
          v33 = v27;
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          ++v23;
          v14 = (unint64_t)&v29[v27];
          v13 = v33;
        }
      }
      else
      {
        if (!--v23)
        {
          v14 = (unint64_t)&v19[v30];
          objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v19, v13, (uint64_t)&v19[v30 - v13], v22);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v47, v35, (uint64_t)v34, v36, v37);

          v13 = 0x7FFFFFFFFFFFFFFFLL;
          continue;
        }
        v14 = (unint64_t)&v19[v30];
      }
      if (v27 == 0x7FFFFFFFFFFFFFFFLL && v30 == 0x7FFFFFFFFFFFFFFFLL)
        break;
    }
    while (v14 < objc_msgSend_length(v3, v19, v20, v21, v22));
  }
  if (v23)
  {
    v38 = (void *)MEMORY[0x1E0CB3B18];
    v39 = objc_msgSend_length(v3, v19, v20, v21, v22);
    objc_msgSend_valueWithRange_(v38, v40, v13, v39 - v13, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v47;
    objc_msgSend_addObject_(v47, v43, (uint64_t)v42, v44, v45);

  }
  else
  {
    v12 = v47;
  }
LABEL_27:

  return v12;
}

- (id)_computeActiveRanges:(id)a3 withIgnoreRanges:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *length;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSUInteger v17;
  const char *v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  NSRange v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  id obj;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  NSRange v54;
  NSRange v55;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v10 = (void *)objc_msgSend_mutableCopy(a3, v6, v7, v8, v9);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v5;
  v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v48, (uint64_t)v52, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v49 != v46)
          objc_enumerationMutation(obj);
        v17 = objc_msgSend_rangeValue(*(void **)(*((_QWORD *)&v48 + 1) + 8 * i), length, v13, v14, v15);
        v19 = (NSUInteger)v18;
        if (objc_msgSend_count(v10, v18, v20, v21, v22))
        {
          v23 = 0;
          v24 = v19 + v17;
          while (1)
          {
            objc_msgSend_objectAtIndexedSubscript_(v10, length, v23, v14, v15);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend_rangeValue(v25, v26, v27, v28, v29);
            v32 = v31;

            v54.location = v30;
            v54.length = v32;
            v55.location = v17;
            v55.length = v19;
            v33 = NSIntersectionRange(v54, v55);
            length = (const char *)v33.length;
            if (v30 >= v24)
              goto LABEL_23;
            if (!v33.length)
              goto LABEL_21;
            v34 = v17 - v30;
            if (v17 > v30)
              break;
            if (v33.location != v30 || v32 != v33.length)
            {
              objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], (const char *)v33.length, v19 + v17, v30 + v32 - v24, v15);
LABEL_20:
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_atIndexedSubscript_(v10, v42, (uint64_t)v41, v23, v43);

LABEL_21:
              ++v23;
              goto LABEL_22;
            }
            objc_msgSend_removeObjectAtIndex_(v10, (const char *)v33.length, v23, v34, v15);
LABEL_22:
            if (v23 >= objc_msgSend_count(v10, length, v13, v14, v15))
              goto LABEL_23;
          }
          if (v33.location == v17 && v33.length == v19)
          {
            objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], (const char *)v33.length, v30, v34, v15);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_atIndexedSubscript_(v10, v36, (uint64_t)v35, v23, v37);

            v14 = v32 + v30 - v24;
            if (v32 + v30 != v24)
            {
              objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], length, v19 + v17, v14, v15);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_insertObject_atIndex_(v10, v39, (uint64_t)v38, ++v23, v40);

            }
            goto LABEL_22;
          }
          objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], (const char *)v33.length, v30, v32 - v33.length, v15);
          goto LABEL_20;
        }
LABEL_23:
        ;
      }
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, length, (uint64_t)&v48, (uint64_t)v52, 16);
    }
    while (v47);
  }

  return v10;
}

- (id)_processSpeechString:(id)a3 startingAt:(unint64_t)a4 currentRecursionDepth:(unint64_t)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  unint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
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
  id v81;
  const char *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  id v101;
  id v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  id v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  TTSSpeechString *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t j;
  void *v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void (**v185)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  id v202;
  void *v203;
  unint64_t iterations;
  void *v205;
  void *v206;
  id v207;
  unint64_t v208;
  uint64_t v209;
  unint64_t v210;
  void *v211;
  id v212;
  id v213;
  id obj;
  id obja;
  uint64_t v216;
  id v217;
  uint64_t v218;
  uint64_t v219;
  TTSRulesetRunner *v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  _QWORD v225[5];
  _QWORD block[5];
  id v227;
  id v228;
  id v229;
  unint64_t v230;
  uint64_t v231;
  uint64_t v232;
  _QWORD v233[4];
  id v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  _BYTE v239[128];
  void *v240;
  _BYTE v241[128];
  uint64_t v242;

  v242 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v220 = self;
  objc_msgSend_ruleCount(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_unsignedLongValue(v13, v14, v15, v16, v17);

  if (v18 > a4)
  {
    v210 = a5;
    v211 = v8;
    objc_msgSend_transformedString(v8, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__ignoreRangesForString_(v220, v24, (uint64_t)v23, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_retainAutorelease(v23);
    v218 = objc_msgSend_cStringUsingEncoding_(v28, v29, 4, v30, v31);
    v206 = v28;
    v219 = objc_msgSend_lengthOfBytesUsingEncoding_(v28, v32, 4, v33, v34);
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v35, v36, v37, v38);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ruleCount(v220, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v208 = a4;
    iterations = objc_msgSend_unsignedLongValue(v43, v44, v45, v46, v47) - a4;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v235 = 0u;
    v236 = 0u;
    v237 = 0u;
    v238 = 0u;
    objc_msgSend_ruleSets(v220, v53, v54, v55, v56);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v216 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v57, (uint64_t)&v235, (uint64_t)v241, 16);
    if (v216)
    {
      v61 = *(id *)v236;
      v62 = 0x1E0CB3000uLL;
      v212 = *(id *)v236;
      do
      {
        for (i = 0; i != v216; ++i)
        {
          if (*(id *)v236 != v61)
            objc_enumerationMutation(obj);
          v64 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * i);
          objc_msgSend_valueWithPointer_(*(void **)(v62 + 2840), v58, (uint64_t)v64, v59, v60);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v66, v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_activationRegex(v64, v71, v72, v73, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if (v75)
          {
            objc_msgSend_activationRegex(v64, v76, v77, v78, v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v233[0] = MEMORY[0x1E0C809B0];
            v233[1] = 3221225472;
            v233[2] = sub_1A3970420;
            v233[3] = &unk_1E4AA0208;
            v81 = v70;
            v234 = v81;
            objc_msgSend_enumerateMatchesInCString_length_usingBlock_(v80, v82, v218, v219, (uint64_t)v233);

            v83 = v234;
          }
          else
          {
            objc_msgSend_valueWithRange_(*(void **)(v62 + 2840), v76, 0, v219, v79);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v240 = v83;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v84, (uint64_t)&v240, 1, v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = (id)objc_msgSend_mutableCopy(v86, v87, v88, v89, v90);

            v61 = v212;
          }

          objc_msgSend__computeActiveRanges_withIgnoreRanges_(v220, v91, (uint64_t)v81, (uint64_t)v27, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v52, v94, (uint64_t)v93, (uint64_t)v65, v95);

          v62 = 0x1E0CB3000;
        }
        v216 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v58, (uint64_t)&v235, (uint64_t)v241, 16);
      }
      while (v216);
    }

    objc_msgSend_regexExecutionQueue(v220, v96, v97, v98, v99);
    v100 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A397047C;
    block[3] = &unk_1E4AA0328;
    block[4] = v220;
    v230 = v208;
    v101 = v52;
    v227 = v101;
    v231 = v219;
    v232 = v218;
    v217 = v206;
    v228 = v217;
    v102 = v205;
    v229 = v102;
    dispatch_apply(iterations, v100, block);

    if (!objc_msgSend_count(v102, v103, v104, v105, v106))
    {
      AXTTSLogCommon();
      v124 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v124, OS_LOG_TYPE_DEBUG))
        sub_1A3AB1108(v210, v124, v125, v126, v127);

      v8 = v211;
      v123 = v211;
      goto LABEL_42;
    }
    objc_msgSend_sortUsingComparator_(v102, v107, (uint64_t)&unk_1E4AA0368, v108, v109);
    v113 = objc_msgSend_indexOfObjectPassingTest_(v102, v110, (uint64_t)&unk_1E4A9DA50, v111, v112);
    v202 = v101;
    v203 = v27;
    v207 = v102;
    if (v113 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v117 = (uint64_t)v211;
      if (v210 <= 0x31)
      {
        v141 = v102;
        v209 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_26;
      }
      v118 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v128 = v113;
      objc_msgSend_objectAtIndexedSubscript_(v102, v114, v113, v115, v116);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ruleReplacement(v129, v130, v131, v132, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend_effectiveIndex(v134, v135, v136, v137, v138);

      v117 = (uint64_t)v211;
      if (v210 < 0x32)
      {
        objc_msgSend_subarrayWithRange_(v102, v139, 0, v128, v140);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v225[0] = MEMORY[0x1E0C809B0];
        v225[1] = 3221225472;
        v225[2] = sub_1A3970834;
        v225[3] = &unk_1E4AA03A8;
        v209 = v118;
        v225[4] = v118;
        objc_msgSend_ax_filteredArrayUsingBlock_(v102, v143, (uint64_t)v225, v144, v145);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_arrayByAddingObjectsFromArray_(v142, v147, (uint64_t)v146, v148, v149);
        v141 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_26;
      }
    }
    v209 = v118;
    v141 = v102;
LABEL_26:
    v150 = [TTSSpeechString alloc];
    v154 = (void *)objc_msgSend_initWithParentSpeechString_(v150, v151, v117, v152, v153);
    v221 = 0u;
    v222 = 0u;
    v223 = 0u;
    v224 = 0u;
    v213 = v141;
    v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v213, v155, (uint64_t)&v221, (uint64_t)v239, 16);
    if (v156)
    {
      v158 = v156;
      obja = *(id *)v222;
      do
      {
        for (j = 0; j != v158; ++j)
        {
          if (*(id *)v222 != obja)
            objc_enumerationMutation(v213);
          v160 = *(void **)(*((_QWORD *)&v221 + 1) + 8 * j);
          objc_msgSend__processTemplateReplacementTextForText_replacement_cString_(v220, v157, (uint64_t)v217, (uint64_t)v160, v218, v202, v203);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_match(v160, v162, v163, v164, v165);
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          v171 = objc_msgSend_utf8Range(v166, v167, v168, v169, v170);
          v173 = objc_msgSend_utf16RangeFromUTF8Range_chars_size_(TTSUnicodeUtils, v172, v171, (uint64_t)v172, v218, v219);
          v175 = v174;

          objc_msgSend_matchLogger(v220, v176, v177, v178, v179);
          v180 = (void *)objc_claimAutoreleasedReturnValue();

          if (v180)
          {
            objc_msgSend_matchLogger(v220, v181, v182, v183, v184);
            v185 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            objc_msgSend_originalString(v154, v186, v187, v188, v189);
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_ruleReplacement(v160, v191, v192, v193, v194);
            v195 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, uint64_t, uint64_t, void *, void *))v185)[2](v185, v190, v173, v175, v161, v195);

          }
          objc_msgSend_transformRange_to_(v154, v181, v173, v175, (uint64_t)v161);

        }
        v158 = objc_msgSend_countByEnumeratingWithState_objects_count_(v213, v157, (uint64_t)&v221, (uint64_t)v239, 16);
      }
      while (v158);
    }

    if (v210 > 0x31 || v209 == 0x7FFFFFFFFFFFFFFFLL)
    {
      AXTTSLogCommon();
      v197 = (char *)objc_claimAutoreleasedReturnValue();
      v101 = v202;
      v27 = v203;
      v102 = v207;
      if (os_log_type_enabled((os_log_t)v197, OS_LOG_TYPE_DEBUG))
        sub_1A3AB1108(v210, v197, v198, v199, v200);

      v123 = v154;
      v8 = v211;
    }
    else
    {
      objc_msgSend__processSpeechString_startingAt_currentRecursionDepth_(v220, v196, (uint64_t)v154, v209 + 1, v210 + 1);
      v123 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v211;
      v101 = v202;
      v27 = v203;
      v102 = v207;
    }

LABEL_42:
    goto LABEL_43;
  }
  AXTTSLogCommon();
  v119 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v119, OS_LOG_TYPE_DEBUG))
    sub_1A3AB1108(a5, v119, v120, v121, v122);

  v123 = v8;
LABEL_43:

  return v123;
}

- (id)_processTemplateReplacementTextForText:(id)a3 replacement:(id)a4 cString:(const char *)a5
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __CFString *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  id v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  BOOL v106;
  id v107;
  const char *v108;
  id v109;
  void *v111;
  id obj;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[4];
  id v122;
  id v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend_replacement(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_copy(v10, v11, v12, v13, v14);

  objc_msgSend_sharedInstance(TTSRegexCache, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_regexForString_atStart_(v20, v21, (uint64_t)CFSTR("\\$(?<num>\\d+)(?=\\D|$)|(\\$\\{(?<numbrack>\\d+)\\})"), 0, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_length(v15, v29, v30, v31, v32);
  v121[0] = MEMORY[0x1E0C809B0];
  v121[1] = 3221225472;
  v121[2] = sub_1A3970BEC;
  v121[3] = &unk_1E4AA03D0;
  v34 = v15;
  v122 = v34;
  v35 = v28;
  v123 = v35;
  v111 = v23;
  objc_msgSend_enumerateMatchesInString_options_range_usingBlock_(v23, v36, (uint64_t)v34, 2, 0, v33, v121);
  objc_msgSend_allKeys(v35, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v41, v42, (uint64_t)&unk_1E4AA0410, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  obj = v45;
  v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v46, (uint64_t)&v117, (uint64_t)v124, 16);
  if (v116)
  {
    v115 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v116; ++i)
      {
        v51 = v34;
        if (*(_QWORD *)v118 != v115)
          objc_enumerationMutation(obj);
        v52 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v35, v47, (uint64_t)v52, v48, v49);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend_unsignedLongValue(v53, v54, v55, v56, v57) - 1;

        v63 = objc_msgSend_rangeValue(v52, v59, v60, v61, v62);
        v65 = (uint64_t)v64;
        objc_msgSend_match(v5, v64, v66, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_captureGroups(v69, v70, v71, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend_count(v74, v75, v76, v77, v78);

        v84 = &stru_1E4AA5CE8;
        if (v58 < v79)
        {
          objc_msgSend_match(v5, v80, v81, v82, v83);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_captureGroups(v85, v86, v87, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndex_(v90, v91, v58, v92, v93);
          v114 = v51;
          v94 = v65;
          v95 = v63;
          v96 = v35;
          v97 = v5;
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend_utf8Range(v98, v99, v100, v101, v102);
          v105 = v104;

          v5 = v97;
          v35 = v96;
          v63 = v95;
          v65 = v94;
          v51 = v114;

          if (v105)
            v106 = v103 == 0x7FFFFFFFFFFFFFFFLL;
          else
            v106 = 1;
          v84 = &stru_1E4AA5CE8;
          if (!v106)
          {
            v107 = objc_alloc(MEMORY[0x1E0CB3940]);
            v84 = (__CFString *)objc_msgSend_initWithBytes_length_encoding_(v107, v108, (uint64_t)&a5[v103], v105, 4);
          }
        }
        objc_msgSend_stringByReplacingCharactersInRange_withString_(v51, v80, v63, v65, (uint64_t)v84);
        v34 = (id)objc_claimAutoreleasedReturnValue();

      }
      v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v117, (uint64_t)v124, 16);
    }
    while (v116);
  }

  v109 = v34;
  return v109;
}

- (id)preRuleWriter
{
  return self->_preRuleWriter;
}

- (void)setPreRuleWriter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)postRuleWriter
{
  return self->_postRuleWriter;
}

- (void)setPostRuleWriter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)matchLogger
{
  return self->_matchLogger;
}

- (void)setMatchLogger:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)regexExecutionQueue
{
  return self->_regexExecutionQueue;
}

- (void)setRegexExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_regexExecutionQueue, a3);
}

- (NSMutableArray)ruleReplacements
{
  return self->_ruleReplacements;
}

- (void)setRuleReplacements:(id)a3
{
  objc_storeStrong((id *)&self->_ruleReplacements, a3);
}

- (NSMutableArray)ruleSets
{
  return self->_ruleSets;
}

- (void)setRuleSets:(id)a3
{
  objc_storeStrong((id *)&self->_ruleSets, a3);
}

- (BOOL)executing
{
  return self->_executing;
}

- (void)setExecuting:(BOOL)a3
{
  self->_executing = a3;
}

- (BOOL)shouldAbort
{
  return self->_shouldAbort;
}

- (void)setShouldAbort:(BOOL)a3
{
  self->_shouldAbort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleSets, 0);
  objc_storeStrong((id *)&self->_ruleReplacements, 0);
  objc_storeStrong((id *)&self->_regexExecutionQueue, 0);
  objc_storeStrong(&self->_matchLogger, 0);
  objc_storeStrong(&self->_postRuleWriter, 0);
  objc_storeStrong(&self->_preRuleWriter, 0);
}

@end
