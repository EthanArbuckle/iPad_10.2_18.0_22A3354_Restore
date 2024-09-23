@implementation TMLMarkdownParser

- (TMLMarkdownParser)init
{
  TMLMarkdownParser *v2;
  TMLMarkdownParser *v3;
  NSArray *rules;
  void *v5;
  const char *v6;
  double v7;
  uint64_t v8;
  NSArray *regex;
  const char *v10;
  double v11;
  uint64_t v12;
  NSMutableDictionary *attributes;
  const char *v14;
  double v15;
  uint64_t v16;
  NSMutableDictionary *tag;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TMLMarkdownParser;
  v2 = -[TMLMarkdownParser init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    rules = v2->_rules;
    v2->_rules = (NSArray *)&unk_24F534C80;

    v5 = (void *)objc_opt_class();
    objc_msgSend_regexFromRules_(v5, v6, v7, v3->_rules);
    v8 = objc_claimAutoreleasedReturnValue();
    regex = v3->_regex;
    v3->_regex = (NSArray *)v8;

    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    attributes = v3->_attributes;
    v3->_attributes = (NSMutableDictionary *)v12;

    v16 = objc_msgSend_mutableCopy(&unk_24F534A70, v14, v15);
    tag = v3->_tag;
    v3->_tag = (NSMutableDictionary *)v16;

  }
  return v3;
}

+ (id)regexFromRules:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  void *v10;
  id v11;
  const char *v12;
  double v13;
  _QWORD v15[4];
  id v16;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  v7 = objc_msgSend_count(v4, v5, v6);
  objc_msgSend_arrayWithCapacity_(v3, v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_22AD3CE68;
  v15[3] = &unk_24F4FFFF8;
  v11 = v10;
  v16 = v11;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v12, v13, v15);

  return v11;
}

+ (id)unescapeString:(id)a3
{
  double v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  __CFString *v22;
  const char *v23;
  double v24;
  uint64_t v25;

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, v3, CFSTR("\\n"), CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v5, v6, CFSTR("\\t"), CFSTR("\t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v8, v9, CFSTR("\\\\"), CFSTR("\\"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v11, v12, CFSTR("\\\"), CFSTR("\"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, v15, CFSTR("\n\n"), CFSTR("\n[emptyTag][/emptyTag]\n"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v16, v17, v18, CFSTR("\n\n"), CFSTR("\n[emptyTag][/emptyTag]\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (__CFString *)objc_msgSend_mutableCopy(v19, v20, v21);
  if (CFStringTransform(v22, 0, CFSTR("Any-Hex/Java"), 1u))
  {
    v25 = objc_msgSend_copy(v22, v23, v24);

    v19 = (void *)v25;
  }

  return v19;
}

+ (id)preProcessString:(id)a3
{
  double v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  __CFString *v19;
  const char *v20;
  double v21;
  uint64_t v22;

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, v3, CFSTR("\\_"), CFSTR("kTMLMarkdownParserEscapedUnderscore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v5, v6, CFSTR("\\*"), CFSTR("kTMLMarkdownParserEscapedStar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v8, v9, CFSTR("\\^"), CFSTR("kTMLMarkdownParserEscapedCarrot"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v11, v12, CFSTR("\\."), CFSTR("kTMLMarkdownParserEscapedPeriod"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, v15, CFSTR("\\+"), CFSTR("kTMLMarkdownParserEscapedPlus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (__CFString *)objc_msgSend_mutableCopy(v16, v17, v18);
  if (CFStringTransform(v19, 0, CFSTR("Any-Hex/Java"), 1u))
  {
    v22 = objc_msgSend_copy(v19, v20, v21);

    v16 = (void *)v22;
  }

  return v16;
}

+ (id)postProcessString:(id)a3
{
  double v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  __CFString *v19;
  const char *v20;
  double v21;
  uint64_t v22;

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, v3, CFSTR("kTMLMarkdownParserEscapedUnderscore"), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v5, v6, CFSTR("kTMLMarkdownParserEscapedStar"), CFSTR("*"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v8, v9, CFSTR("kTMLMarkdownParserEscapedCarrot"), CFSTR("^"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v11, v12, CFSTR("kTMLMarkdownParserEscapedPeriod"), CFSTR("."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, v15, CFSTR("kTMLMarkdownParserEscapedPlus"), CFSTR("+"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (__CFString *)objc_msgSend_mutableCopy(v16, v17, v18);
  if (CFStringTransform(v19, 0, CFSTR("Any-Hex/Java"), 1u))
  {
    v22 = objc_msgSend_copy(v19, v20, v21);

    v16 = (void *)v22;
  }

  return v16;
}

- (id)parse:(id)a3 tags:(id *)a4
{
  id v6;
  const char *v7;
  double v8;
  NSScanner *v9;
  NSScanner *scanner;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  id v16;
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSScanner *v25;
  int v26;
  id v27;
  const char *v28;
  double v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  int v46;
  const char *v47;
  double v48;
  void *v50;
  _QWORD v51[9];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  id v58;
  _QWORD v59[3];
  char v60;
  _QWORD v61[3];
  char v62;

  v6 = a3;
  objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], v7, v8, v6);
  v9 = (NSScanner *)objc_claimAutoreleasedReturnValue();
  scanner = self->_scanner;
  self->_scanner = v9;

  objc_msgSend_newlineCharacterSet(MEMORY[0x24BDD14A8], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCharactersToBeSkipped_(self->_scanner, v14, v15, v13);
  v16 = objc_alloc(MEMORY[0x24BDD16A8]);
  v50 = v6;
  v19 = objc_msgSend_length(v6, v17, v18);
  v22 = (void *)objc_msgSend_initWithCapacity_(v16, v20, (double)(unint64_t)v19 * 1.25, (unint64_t)((double)(unint64_t)v19 * 1.25));
  v23 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v24 = 0x2020000000;
  v61[2] = 0x2020000000;
  v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v60 = 0;
  while (1)
  {
    v25 = self->_scanner;
    v58 = v23;
    v26 = objc_msgSend_scanUpToCharactersFromSet_intoString_(v25, v21, *(double *)&v24, v13, &v58);
    v27 = v58;

    if (!v26)
      break;
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = sub_22AD3D55C;
    v56 = sub_22AD3D56C;
    v57 = (id)objc_msgSend_mutableCopy(v27, v28, v29);
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = sub_22AD3D574;
    v51[3] = &unk_24F500048;
    v51[4] = self;
    v51[5] = &v52;
    v51[6] = v59;
    v51[7] = v61;
    v51[8] = a4;
    v30 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22E2E7E44](v51);
    ((void (**)(_QWORD, NSArray *, _QWORD))v30)[2](v30, self->_rules, 0);
    ((void (**)(_QWORD, NSArray *, uint64_t))v30)[2](v30, self->_extraRules, 1);
    if (objc_msgSend_isListTagOpen_(self, v31, v32, v53[5]))
    {
      objc_msgSend_appendString_(v22, v33, v34, CFSTR("[/li]"));
      objc_msgSend_setObject_forKeyedSubscript_(self->_tag, v35, v36, MEMORY[0x24BDBD1C0], CFSTR("open"));
      objc_msgSend_setObject_forKeyedSubscript_(self->_tag, v37, v38, &unk_24F532A90, CFSTR("count"));
    }
    objc_msgSend_appendString_(v22, v33, v34, v53[5]);
    if (objc_msgSend_isAtEnd(self->_scanner, v39, v40))
    {
      objc_msgSend_objectForKeyedSubscript_(self->_tag, v41, v42, CFSTR("open"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend_BOOLValue(v43, v44, v45);

      if (v46)
        objc_msgSend_appendString_(v22, v41, v42, CFSTR("[/li]"));
    }
    if ((objc_msgSend_isAtEnd(self->_scanner, v41, v42) & 1) == 0)
      objc_msgSend_appendString_(v22, v47, v48, CFSTR("\n"));

    _Block_object_dispose(&v52, 8);
    v23 = v27;
  }
  objc_msgSend_addEntriesFromDictionary_(*a4, v28, v29, self->_attributes);
  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);

  return v22;
}

- (id)replacestring:(id)a3 usingRule:(id)a4 atIndex:(unint64_t)a5 additonalRules:(BOOL)a6
{
  _BOOL4 v6;
  const char *v10;
  id v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  id v34;
  const char *v35;
  double v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  double v40;
  unint64_t i;
  const char *v42;
  double v43;
  uint64_t v44;
  const char *v45;
  double v46;
  void *v47;
  unint64_t v48;
  const char *v49;
  double v50;
  void *v51;
  const char *v52;
  double v53;
  uint64_t v54;
  const char *v55;
  double v56;
  uint64_t j;
  void *v58;
  const char *v59;
  double v60;
  TMLMarkdownParser *v61;
  const char *v62;
  char isKindOfClass;
  double v64;
  TMLMarkdownParser *v65;
  int v66;
  const char *v67;
  double v68;
  void *v69;
  void *v70;
  const char *v71;
  double v72;
  const char *v73;
  double v74;
  void *v75;
  const char *v76;
  double v77;
  int v78;
  const char *v79;
  double v80;
  __CFString *v81;
  void *v82;
  uint64_t v83;
  const char *v84;
  double v85;
  uint64_t v86;
  NSMutableDictionary *attributes;
  const char *v88;
  double v89;
  void *v90;
  const char *v91;
  double v92;
  const char *v93;
  double v94;
  void *v95;
  const char *v96;
  double v97;
  void *v98;
  const char *v99;
  double v100;
  const char *v101;
  double v102;
  void *v103;
  const char *v104;
  double v105;
  int v106;
  const char *v107;
  double v108;
  const __CFString *v109;
  void *v110;
  const char *v111;
  double v112;
  void *v113;
  const char *v114;
  double v115;
  char isEqual;
  const char *v117;
  double v118;
  void *v119;
  void *v120;
  const char *v121;
  double v122;
  uint64_t v123;
  const char *v124;
  double v125;
  void *v126;
  const char *v127;
  double v128;
  const char *v129;
  double v130;
  const char *v131;
  double v132;
  const char *v133;
  double v134;
  void *v135;
  const char *v136;
  double v137;
  uint64_t v138;
  const char *v139;
  double v140;
  void *v141;
  const char *v142;
  double v143;
  _BOOL4 v144;
  const char *v145;
  double v146;
  void *v147;
  const char *v148;
  double v149;
  uint64_t v150;
  const char *v151;
  double v152;
  void *v153;
  const char *v154;
  double v155;
  const char *v156;
  double v157;
  const char *v158;
  double v159;
  void *v160;
  uint64_t v161;
  const char *v162;
  double v163;
  uint64_t v164;
  const char *v165;
  double v166;
  uint64_t v167;
  const char *v168;
  double v169;
  void *v170;
  uint64_t v171;
  const char *v172;
  double v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  double v177;
  void *v178;
  const char *v179;
  double v180;
  const char *v181;
  double v182;
  const char *v183;
  uint64_t v184;
  double v185;
  uint64_t v186;
  uint64_t k;
  void *v188;
  void *v189;
  const char *v190;
  double v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  double v197;
  id v199;
  void *v200;
  id obj;
  uint64_t v202;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  void (**v206)(_QWORD, _QWORD, _QWORD);
  TMLMarkdownParser *v207;
  id v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  _QWORD v213[6];
  uint64_t v214;
  uint64_t *v215;
  uint64_t v216;
  uint64_t (*v217)(uint64_t, uint64_t);
  void (*v218)(uint64_t);
  id v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  _BYTE v224[128];
  _QWORD v225[2];
  _QWORD v226[2];
  const __CFString *v227;
  void *v228;
  uint64_t v229;
  __CFString *v230;
  _BYTE v231[128];
  uint64_t v232;

  v6 = a6;
  v232 = *MEMORY[0x24BDAC8D0];
  v199 = a3;
  v11 = a4;
  v13 = 40;
  if (v6)
    v13 = 56;
  v207 = self;
  objc_msgSend_objectAtIndexedSubscript_(*(void **)((char *)&self->super.isa + v13), v10, v12, a5);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_mutableCopy(v199, v14, v15);
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v17, v18);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v222 = 0u;
  v223 = 0u;
  v220 = 0u;
  v221 = 0u;
  v20 = objc_msgSend_length(v16, v19, 0.0);
  objc_msgSend_matchesInString_options_range_(v200, v21, v22, v16, 0, 0, v20);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v204 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, v24, &v220, v231, 16);
  if (v204)
  {
    v202 = *(_QWORD *)v221;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v221 != v202)
        {
          v28 = v27;
          objc_enumerationMutation(obj);
          v27 = v28;
        }
        v205 = v27;
        v29 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * v27);
        objc_msgSend_array(MEMORY[0x24BDBCEB8], v25, v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_array(MEMORY[0x24BDBCEB8], v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v214 = 0;
        v215 = &v214;
        v216 = 0x3032000000;
        v217 = sub_22AD3D55C;
        v218 = sub_22AD3D56C;
        v34 = objc_alloc(MEMORY[0x24BDD16A8]);
        v37 = objc_msgSend_length(v16, v35, v36);
        v219 = (id)objc_msgSend_initWithCapacity_(v34, v38, (double)(unint64_t)v37 * 1.25, (unint64_t)((double)(unint64_t)v37 * 1.25));
        for (i = 1; i < objc_msgSend_numberOfRanges(v29, v39, v40); i = v48 + 2)
        {
          v44 = objc_msgSend_rangeAtIndex_(v29, v42, v43, i);
          objc_msgSend_substringWithRange_(v16, v45, v46, v44, v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = i - 1;
          objc_msgSend_setObject_atIndexedSubscript_(v30, v49, v50, v47, v48);

        }
        objc_msgSend_objectForKeyedSubscript_(v11, v42, v43, CFSTR("replace"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend_count(v51, v52, v53);

        if (v54)
        {
          for (j = 0; j != v54; ++j)
          {
            objc_msgSend_objectForKeyedSubscript_(v11, v55, v56, CFSTR("replace"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v58, v59, v60, j);
            v61 = (TMLMarkdownParser *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            v65 = v61;
            if ((isKindOfClass & 1) != 0)
            {
              v66 = objc_msgSend_intValue(v61, v62, v64, v61);
              objc_msgSend_objectAtIndexedSubscript_(v30, v67, v68, v66);
              self = (TMLMarkdownParser *)objc_claimAutoreleasedReturnValue();
              v65 = self;
            }
            objc_msgSend_setObject_atIndexedSubscript_(v33, v62, v64, v65, j);
            if ((isKindOfClass & 1) != 0)

          }
        }
        v69 = (void *)v215[5];
        objc_msgSend_componentsJoinedByString_(v33, v55, v56, &stru_24F505EA8);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v69, v71, v72, v70);

        v213[0] = MEMORY[0x24BDAC760];
        v213[1] = 3221225472;
        v213[2] = sub_22AD3E0B8;
        v213[3] = &unk_24F500070;
        v213[4] = v207;
        v213[5] = &v214;
        v206 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22E2E7E44](v213);
        objc_msgSend_objectForKeyedSubscript_(v11, v73, v74, CFSTR("tag"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend_intValue(v75, v76, v77);

        if ((v78 - 3) >= 2)
        {
          if (v78 == 1)
          {
            v135 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend_objectAtIndexedSubscript_(v30, v79, v80, 0);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v138 = objc_msgSend_length(v90, v136, v137);
            objc_msgSend_stringWithFormat_(v135, v139, v140, CFSTR("%lu"), v138);
            v86 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v81 = &stru_24F505EA8;
            if (v78 != 2)
              goto LABEL_34;
            v82 = (void *)MEMORY[0x24BDD17C8];
            v83 = objc_msgSend_count(v207->_attributes, v79, v80);
            objc_msgSend_stringWithFormat_(v82, v84, v85, CFSTR("%lu"), v83);
            v86 = objc_claimAutoreleasedReturnValue();
            attributes = v207->_attributes;
            v229 = v86;
            v227 = CFSTR("link");
            objc_msgSend_objectAtIndexedSubscript_(v30, v88, v89, 4);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v228 = v90;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v91, v92, &v228, &v227, 1);
            v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v230 = v81;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v93, v94, &v230, &v229, 1);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addEntriesFromDictionary_(attributes, v96, v97, v95);

LABEL_25:
          }

          v81 = (__CFString *)v86;
          goto LABEL_29;
        }
        objc_msgSend_objectForKeyedSubscript_(v207->_tag, v79, v80, CFSTR("count"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringValue(v98, v99, v100);
        v81 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKeyedSubscript_(v207->_tag, v101, v102, CFSTR("open"));
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_msgSend_BOOLValue(v103, v104, v105);

        v109 = CFSTR("[li]");
        if (v106)
        {
          objc_msgSend_objectForKeyedSubscript_(v207->_tag, v107, v108, CFSTR("type"));
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v11, v111, v112, CFSTR("tag"));
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v110, v114, v115, v113);

          v109 = CFSTR("[/li][li]");
          if ((isEqual & 1) != 0)
          {
            v119 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend_objectForKeyedSubscript_(v207->_tag, v117, v118, CFSTR("count"));
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v123 = objc_msgSend_integerValue(v120, v121, v122);
            objc_msgSend_numberWithInteger_(v119, v124, v125, v123 + 1);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v207->_tag, v127, v128, v126, CFSTR("count"));

            objc_msgSend_objectForKeyedSubscript_(v207->_tag, v129, v130, CFSTR("count"));
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringValue(v90, v131, v132);
            v86 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
        }
        ((void (**)(_QWORD, id, const __CFString *))v206)[2](v206, v11, v109);
LABEL_29:
        objc_msgSend_objectForKeyedSubscript_(v11, v133, v134, CFSTR("tag"));
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = objc_msgSend_intValue(v141, v142, v143) == 1;

        if (v144)
        {
          objc_msgSend_objectAtIndexedSubscript_(v30, v145, v146, 0);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          v150 = objc_msgSend_length(v147, v148, v149);
          objc_msgSend_stringOfTagType_andCount_(TMLMarkdownParser, v151, v152, CFSTR("#"), v150);
          v153 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_appendString_(v153, v154, v155, CFSTR("[/h<TagCount>]"));
          if (objc_msgSend_hasSuffix_((void *)v215[5], v156, v157, v153))
          {
            v160 = (void *)v215[5];
            v161 = objc_msgSend_length(v160, v158, v159);
            v164 = objc_msgSend_length(v153, v162, v163);
            v167 = objc_msgSend_length(v153, v165, v166);
            objc_msgSend_replaceCharactersInRange_withString_(v160, v168, v169, v161 - v164, v167, CFSTR("[/h<TagCount>]"));
          }

        }
        v170 = (void *)v215[5];
        v171 = objc_msgSend_length(v170, v145, v146);
        objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v170, v172, v173, CFSTR("<TagCount>"), v81, 1, 0, v171);
LABEL_34:
        v174 = v215[5];
        v225[0] = CFSTR("rs");
        v225[1] = CFSTR("ms");
        v226[0] = v174;
        objc_msgSend_componentsJoinedByString_(v30, v79, v80, &stru_24F505EA8);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v226[1] = v175;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v176, v177, v226, v225, 2);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v203, v179, v180, v178);

        _Block_object_dispose(&v214, 8);
        v27 = v205 + 1;
      }
      while (v205 + 1 != v204);
      v204 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, v26, &v220, v231, 16);
    }
    while (v204);
  }

  v211 = 0u;
  v212 = 0u;
  v209 = 0u;
  v210 = 0u;
  v208 = v203;
  v184 = objc_msgSend_countByEnumeratingWithState_objects_count_(v208, v181, v182, &v209, v224, 16);
  if (v184)
  {
    v186 = *(_QWORD *)v210;
    do
    {
      for (k = 0; k != v184; ++k)
      {
        if (*(_QWORD *)v210 != v186)
          objc_enumerationMutation(v208);
        v188 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * k);
        objc_msgSend_objectForKeyedSubscript_(v188, v183, v185, CFSTR("ms"));
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v192 = objc_msgSend_rangeOfString_(v16, v190, v191, v189);
        v194 = v193;

        if (v192 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend_objectForKeyedSubscript_(v188, v183, v185, CFSTR("rs"));
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_replaceCharactersInRange_withString_(v16, v196, v197, v192, v194, v195);

        }
      }
      v184 = objc_msgSend_countByEnumeratingWithState_objects_count_(v208, v183, v185, &v209, v224, 16);
    }
    while (v184);
  }

  return v16;
}

- (id)tagFromType:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("[/unknown]");
  if (a3 == 4)
    v3 = CFSTR("[/ul]");
  if (a3 == 3)
    return CFSTR("[/ol]");
  else
    return (id)v3;
}

- (BOOL)isListTagOpen:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  int v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  int v15;
  __CFString *v16;
  void *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;

  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_tag, v5, v6, CFSTR("open"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_BOOLValue(v7, v8, v9);

  if (v10)
  {
    if ((int)objc_msgSend_length(v4, v11, v12) < 6 || (v15 = objc_msgSend_length(v4, v13, v14), v15 < 6))
    {
      v16 = &stru_24F505EA8;
    }
    else
    {
      objc_msgSend_substringWithRange_(v4, v13, v14, (v15 - 5), 5);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_objectForKeyedSubscript_(self->_tag, v13, v14, CFSTR("type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_intValue(v17, v18, v19);
    objc_msgSend_tagFromType_(self, v21, v22, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v23, v24, v25))
      v10 = objc_msgSend_isEqualToString_(v23, v26, v27, v16) ^ 1;
    else
      LOBYTE(v10) = 0;

  }
  return v10;
}

+ (id)parse:(id)a3 tags:(id *)a4 withRules:(id)a5
{
  id v8;
  id v9;
  TMLMarkdownParser *v10;
  void *v11;
  const char *v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  void *v17;
  NSArray *v18;
  const char *v19;
  double v20;
  NSArray *extraRules;
  NSArray *v22;
  const char *v23;
  double v24;
  uint64_t v25;
  NSArray *extraRegex;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  void *v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  void *v41;
  _QWORD v43[4];
  NSArray *v44;

  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(TMLMarkdownParser);
  v11 = (void *)MEMORY[0x24BDBCEB8];
  v14 = objc_msgSend_count(v8, v12, v13);
  objc_msgSend_arrayWithCapacity_(v11, v15, v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = sub_22AD3E438;
  v43[3] = &unk_24F4FFFF8;
  v18 = v17;
  v44 = v18;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v19, v20, v43);

  extraRules = v10->_extraRules;
  v10->_extraRules = v18;
  v22 = v18;

  objc_msgSend_regexFromRules_(a1, v23, v24, v22);
  v25 = objc_claimAutoreleasedReturnValue();
  extraRegex = v10->_extraRegex;
  v10->_extraRegex = (NSArray *)v25;

  v27 = (void *)objc_opt_class();
  objc_msgSend_unescapeString_(v27, v28, v29, v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)objc_opt_class();
  objc_msgSend_preProcessString_(v31, v32, v33, v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_opt_class();
  objc_msgSend_parse_tags_(v10, v36, v37, v34, a4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postProcessString_(v35, v39, v40, v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

+ (id)stringOfTagType:(id)a3 andCount:(unint64_t)a4
{
  id v5;
  id v6;
  const char *v7;
  const char *v8;
  void *i;
  double v10;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x24BDD16A8]);
  for (i = (void *)objc_msgSend_initWithCapacity_(v6, v7, (double)a4 * 1.25, (unint64_t)((double)a4 * 1.25));
        a4;
        --a4)
  {
    objc_msgSend_appendString_(i, v8, v10, v5);
  }

  return i;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraRegex, 0);
  objc_storeStrong((id *)&self->_extraRules, 0);
  objc_storeStrong((id *)&self->_regex, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

@end
