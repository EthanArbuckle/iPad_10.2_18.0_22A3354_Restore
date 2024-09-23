@implementation TTSRuleset

- (TTSRuleset)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  TTSRuleset *v6;
  uint64_t v7;
  NSMutableArray *ruleReplacements;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TTSRuleset;
  v6 = -[TTSRuleset init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    ruleReplacements = v6->_ruleReplacements;
    v6->_ruleReplacements = (NSMutableArray *)v7;

  }
  return v6;
}

+ (TTSRuleset)rulesetWithData:(id)a3 identifier:(id)a4 priority:(unint64_t)a5
{
  id v7;
  id v8;
  TTSRuleset *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v7 = a4;
  v8 = a3;
  v9 = [TTSRuleset alloc];
  v14 = (void *)objc_msgSend_init(v9, v10, v11, v12, v13);
  objc_msgSend_addRulesFromData_(v14, v15, (uint64_t)v8, v16, v17);

  objc_msgSend_setPriority_(v14, v18, a5, v19, v20);
  objc_msgSend_setIdentifier_(v14, v21, (uint64_t)v7, v22, v23);

  return (TTSRuleset *)v14;
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

- (void)addRuleString:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend_arrayWithObjects_count_(v4, v6, (uint64_t)&v12, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addRules_(self, v9, (uint64_t)v8, v10, v11, v12, v13);
}

- (void)addRuleReplacement:(id)a3
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
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __CFString *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int isEqualToString;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  TTSRuleGroup *v67;
  const char *v68;
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
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  id v121;

  v121 = a3;
  objc_msgSend_ruleReplacements(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_group(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_replacement(v121, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_containsString_(v23, v24, (uint64_t)CFSTR("_HOMOGRAPH_START"), v25, v26);

  objc_msgSend_replacement(v121, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_containsString_(v32, v33, (uint64_t)CFSTR("_ENG_CORE"), v34, v35);

  if ((v36 & 1) != 0 || v27)
  {
    v40 = CFSTR("ENGCORE");
    if (v27)
      v40 = CFSTR("HOMOGRAPH");
    v45 = v40;
    if (v18
      && (objc_msgSend_key(v18, v41, v42, v43, v44),
          v46 = (void *)objc_claimAutoreleasedReturnValue(),
          isEqualToString = objc_msgSend_isEqualToString_(v46, v47, (uint64_t)v45, v48, v49),
          v46,
          isEqualToString))
    {
      objc_msgSend_ruleReplacements(self, v51, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend_count(v55, v56, v57, v58, v59);
      objc_msgSend_setEndIndex_(v18, v61, v60, v62, v63);

      objc_msgSend_setGroup_(v121, v64, (uint64_t)v18, v65, v66);
    }
    else
    {
      v67 = objc_alloc_init(TTSRuleGroup);
      objc_msgSend_setKey_(v67, v68, (uint64_t)v45, v69, v70);
      objc_msgSend_ruleReplacements(self, v71, v72, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend_count(v75, v76, v77, v78, v79);
      objc_msgSend_setStartIndex_(v67, v81, v80, v82, v83);

      objc_msgSend_ruleReplacements(self, v84, v85, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend_count(v88, v89, v90, v91, v92);
      objc_msgSend_setEndIndex_(v67, v94, v93, v95, v96);

      objc_msgSend_setGroup_(v121, v97, (uint64_t)v67, v98, v99);
    }

  }
  objc_msgSend_setRuleset_(v121, v37, (uint64_t)self, v38, v39);
  objc_msgSend_ruleReplacements(self, v100, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend_count(v104, v105, v106, v107, v108);
  objc_msgSend_setIndex_(v121, v110, v109, v111, v112);

  objc_msgSend_ruleReplacements(self, v113, v114, v115, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v117, v118, (uint64_t)v121, v119, v120);

}

- (void)addRules:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t i;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  TTSRegex *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  TTSRuleReplacement *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  void *v102;
  TTSRuleset *v103;
  void *v104;
  id obj;
  uint64_t v106;
  void *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t buf[4];
  void *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v103 = self;
  objc_sync_enter(v103);
  objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v5, v6, v7, v8);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E0CB38E8], v9, (uint64_t)CFSTR("\"(.*?)\"), 1, 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  obj = v4;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v108, (uint64_t)v114, 16);
  if (v14)
  {
    v106 = *(_QWORD *)v109;
    *(_QWORD *)&v15 = 138412290;
    v101 = v15;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v109 != v106)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
        objc_msgSend_stringByTrimmingCharactersInSet_(v17, v11, (uint64_t)v107, v12, v13, v101);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_hasPrefix_(v18, v19, (uint64_t)CFSTR("#"), v20, v21) & 1) == 0
          && objc_msgSend_length(v18, v22, v23, v24, v25))
        {
          objc_msgSend_componentsSeparatedByString_(v18, v26, (uint64_t)CFSTR("-->"), v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_containsString_(v18, v30, (uint64_t)CFSTR("-->"), v31, v32)
            && objc_msgSend_count(v29, v33, v34, v35, v36) == 2)
          {
            objc_msgSend_objectAtIndexedSubscript_(v29, v37, 0, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByTrimmingCharactersInSet_(v40, v41, (uint64_t)v107, v42, v43);
            v44 = objc_claimAutoreleasedReturnValue();

            objc_msgSend_objectAtIndexedSubscript_(v29, v45, 1, v46, v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByTrimmingCharactersInSet_(v48, v49, (uint64_t)v107, v50, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            v57 = objc_msgSend_length(v52, v53, v54, v55, v56);
            objc_msgSend_matchesInString_options_range_(v102, v58, (uint64_t)v52, 2, 0, v57);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_count(v104, v59, v60, v61, v62))
            {
              objc_msgSend_firstObject(v104, v63, v64, v65, v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = objc_msgSend_rangeAtIndex_(v67, v68, 1, v69, v70);
              objc_msgSend_substringWithRange_(v52, v72, v71, (uint64_t)v72, v73);
            }
            else
            {
              objc_msgSend_componentsSeparatedByString_(v52, v63, (uint64_t)CFSTR("#"), v65, v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_firstObject(v67, v74, v75, v76, v77);
            }
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            v79 = [TTSRegex alloc];
            v83 = (void *)objc_msgSend_initWithPerlPattern_(v79, v80, (uint64_t)v44, v81, v82);
            if (v83)
            {
              v84 = objc_alloc_init(TTSRuleReplacement);
              objc_msgSend_setRegex_(v84, v85, (uint64_t)v83, v86, v87);
              objc_msgSend_setRuleset_(v84, v88, (uint64_t)v103, v89, v90);
              objc_msgSend_processReplacementStringForSpecialCharacters_(TTSRuleset, v91, (uint64_t)v78, v92, v93);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setReplacement_(v84, v95, (uint64_t)v94, v96, v97);

              objc_msgSend_addRuleReplacement_(v103, v98, (uint64_t)v84, v99, v100);
            }
            else
            {
              AXTTSLogCommon();
              v84 = (TTSRuleReplacement *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v84->super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v101;
                v113 = v17;
                _os_log_error_impl(&dword_1A3940000, &v84->super, OS_LOG_TYPE_ERROR, "Invalid rule %@", buf, 0xCu);
              }
            }

          }
          else
          {
            AXTTSLogCommon();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v101;
              v113 = v18;
              _os_log_error_impl(&dword_1A3940000, v44, OS_LOG_TYPE_ERROR, "Invalid rule: %@", buf, 0xCu);
            }
          }

        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v108, (uint64_t)v114, 16);
    }
    while (v14);
  }

  objc_sync_exit(v103);
}

- (void)addRulesFromData:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
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
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = [v4 alloc];
  v9 = (void *)objc_msgSend_initWithData_encoding_(v6, v7, (uint64_t)v5, 4, v8);

  objc_msgSend_componentsSeparatedByString_(v9, v10, (uint64_t)CFSTR("[data]"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v13, v14, v15, v16, v17);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_componentsSeparatedByString_(v25, v18, (uint64_t)CFSTR("\n"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addRules_(self, v22, (uint64_t)v21, v23, v24);

}

+ (id)processReplacementStringForSpecialCharacters:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, (uint64_t)CFSTR("\\\\"), (uint64_t)CFSTR("\\"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v5, (uint64_t)CFSTR("\\e\\"), (uint64_t)CFSTR("\x1B\\"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v8, (uint64_t)CFSTR("\\e/+"), (uint64_t)CFSTR("\x1B/+"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v11, (uint64_t)CFSTR("\x1B\x1Bos"), (uint64_t)CFSTR("\x1B\\eos"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (TTSRegex)activationRegex
{
  return self->_activationRegex;
}

- (void)setActivationRegex:(id)a3
{
  objc_storeStrong((id *)&self->_activationRegex, a3);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSMutableArray)ruleReplacements
{
  return self->_ruleReplacements;
}

- (void)setRuleReplacements:(id)a3
{
  objc_storeStrong((id *)&self->_ruleReplacements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleReplacements, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activationRegex, 0);
}

@end
