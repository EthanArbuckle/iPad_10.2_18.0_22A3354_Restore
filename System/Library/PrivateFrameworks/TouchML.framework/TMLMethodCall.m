@implementation TMLMethodCall

- (TMLMethodCall)initWithMethodDescriptor:(id)a3 forClass:(Class)a4
{
  id v7;
  TMLMethodCall *v8;
  TMLMethodCall *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  uint64_t v17;
  const char *v18;
  SEL v19;
  double v20;
  void *v21;
  id v22;
  const char *v23;
  double v24;
  void *v25;
  id v26;
  const char *v27;
  double v28;
  uint64_t v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  const char *v35;
  unint64_t v36;
  double v37;
  uint64_t i;
  id v39;
  const char *v40;
  double v41;
  uint64_t ArgumentTypeAtIndex;
  const char *v43;
  double v44;
  uint64_t v45;
  id block;
  const char *v47;
  double v48;
  uint64_t v49;
  NSInvocation *invocation;
  const char *v51;
  double v52;
  const char *v53;
  double v54;
  id v55;
  const char *v56;
  double v57;
  const char *v58;
  void *v59;
  double v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  double v64;
  void *v65;
  const char *v66;
  double v67;
  uint64_t v68;
  const char *v69;
  double v70;
  id v71;
  const char *v72;
  double v73;
  const char *v74;
  void *v75;
  const char *v76;
  double v77;
  uint64_t v78;
  NSArray *argTypes;
  void *v81;
  void *v82;
  void *v83;
  const char *v84;
  double v85;
  void *v86;
  const char *v87;
  double v88;
  void *v89;
  const char *v90;
  double v91;
  void *v92;
  const char *v93;
  double v94;
  id v95;
  void *v96;
  TMLMethodCall *v97;
  objc_super v98;
  const __CFString *v99;
  _QWORD v100[2];

  v100[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v98.receiver = self;
  v98.super_class = (Class)TMLMethodCall;
  v8 = -[TMLMethodCall init](&v98, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_methodDescriptor, a3);
    objc_msgSend_methodSelector(v7, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasPrefix_(v12, v13, v14, CFSTR("+")))
    {
      v9->_classSelector = 1;
      objc_msgSend_substringFromIndex_(v12, v15, v16, 1);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v17;
    }
    v19 = NSSelectorFromString((NSString *)v12);
    v9->_selector = v19;
    if (v9->_classSelector)
      objc_msgSend_methodSignatureForSelector_(a4, v18, v20, v19);
    else
      objc_msgSend_instanceMethodSignatureForSelector_(a4, v18, v20, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc(MEMORY[0x24BDD16A8]);
    v25 = v22;
    if (v21)
    {
      v26 = objc_retainAutorelease(v21);
      v29 = objc_msgSend_methodReturnType(v26, v27, v28);
      v32 = (void *)objc_msgSend_initWithCString_encoding_(v25, v30, v31, v29, 1);
      v36 = objc_msgSend_numberOfArguments(v26, v33, v34);
      if (v36 >= 3)
      {
        for (i = 2; i != v36; ++i)
        {
          v39 = objc_retainAutorelease(v26);
          ArgumentTypeAtIndex = objc_msgSend_getArgumentTypeAtIndex_(v39, v40, v41, i);
          objc_msgSend_appendFormat_(v32, v43, v44, CFSTR("%s"), ArgumentTypeAtIndex);
        }
      }
    }
    else
    {
      v32 = (void *)objc_msgSend_initWithString_(v22, v23, v24, CFSTR("optional"));
      v36 = 0;
    }
    if (qword_255B51B70 != -1)
      dispatch_once(&qword_255B51B70, &unk_24F5001C8);
    objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51B68, v35, v37, v32);
    v45 = objc_claimAutoreleasedReturnValue();
    block = v9->_block;
    v9->_block = (id)v45;

    if (!v9->_block)
    {
      if (v36 >= 0xB)
      {
        v81 = (void *)MEMORY[0x24BDBCE88];
        v82 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_methodSelector(v7, v47, v48);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_description(a4, v84, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v82, v87, v88, CFSTR("Unsupported number of arguments for method %@ in class %@"), v83, v86);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = CFSTR("method");
        v100[0] = v7;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v90, v91, v100, &v99, 1);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_exceptionWithName_reason_userInfo_(v81, v93, v94, CFSTR("TMLRuntimeException"), v89, v92);
        v95 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v95);
      }
      objc_msgSend_invocationWithMethodSignature_(MEMORY[0x24BDBCE98], v47, v48, v21);
      v49 = objc_claimAutoreleasedReturnValue();
      invocation = v9->_invocation;
      v9->_invocation = (NSInvocation *)v49;

      objc_msgSend_setSelector_(v9->_invocation, v51, v52, v9->_selector);
      if (v9->_classSelector)
        objc_msgSend_setTarget_(v9->_invocation, v53, v54, a4);
    }
    if (v36 >= 3)
    {
      v96 = v12;
      v97 = v9;
      v55 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v59 = (void *)objc_msgSend_initWithCapacity_(v55, v56, v57, v36 - 2);
      v61 = 2;
      while (1)
      {
        objc_msgSend_parameters(v7, v58, v60);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v62, v63, v64, v61 - 2);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend_type(v65, v66, v67);

        if (v68 != 3)
          goto LABEL_25;
        v71 = objc_retainAutorelease(v21);
        v74 = (const char *)objc_msgSend_getArgumentTypeAtIndex_(v71, v72, v73, v61);
        if (strcmp(v74, "d"))
          break;
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v69, v70, 4);
LABEL_26:
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v59, v76, v77, v75);

        if (v36 == ++v61)
        {
          v78 = objc_msgSend_copy(v59, v58, v60);
          v9 = v97;
          argTypes = v97->_argTypes;
          v97->_argTypes = (NSArray *)v78;

          v12 = v96;
          goto LABEL_28;
        }
      }
      v68 = 3;
LABEL_25:
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v69, v70, v68);
      goto LABEL_26;
    }
LABEL_28:

  }
  return v9;
}

- (NSString)methodName
{
  double v2;

  return (NSString *)objc_msgSend_methodName(self->_methodDescriptor, a2, v2);
}

- (TMLMethodCall)callWithArguments:(id)a3
{
  double v3;
  void *v5;
  TMLValue *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;

  objc_msgSend__callWithArguments_(self, a2, v3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [TMLValue alloc];
  v9 = objc_msgSend_returnType(self->_methodDescriptor, v7, v8);
  v12 = (void *)objc_msgSend_initWithValue_valueType_(v6, v10, v11, v5, v9);

  return (TMLMethodCall *)v12;
}

- (id)_callWithArguments:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  const char *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  unint64_t v20;
  const char *v21;
  double v22;
  unint64_t v23;
  uint64_t i;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  uint64_t v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  double v45;
  unint64_t v46;
  _BYTE *v47;
  _QWORD *v48;
  char *v49;
  void *v50;
  const char *v51;
  double v52;
  uint64_t v53;
  const char *v54;
  double v55;
  _BYTE *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  const char *v64;
  double v65;
  void *v66;
  const char *v67;
  double v68;
  void *v69;
  void *v70;
  const char *v71;
  double v72;
  uint64_t *v73;
  const char *v74;
  double v75;
  int v76;
  const char *v77;
  double v78;
  uint64_t v79;
  const char *v80;
  double v81;
  uint64_t v82;
  uint64_t *v83;
  const char *v84;
  double v85;
  const char *v86;
  double v87;
  const char *v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  double v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  double v99;
  void *v100;
  const char *v101;
  double v102;
  void *v103;
  void *v104;
  const char *v105;
  double v106;
  void *v107;
  const char *v108;
  double v109;
  const char *v110;
  double v111;
  uint64_t v112;
  void *v113;
  char *v114;
  const char *v115;
  double v116;
  void *v117;
  id v118;
  const char *v119;
  double v120;
  const char *v121;
  double v122;
  id v123;
  const char *v124;
  double v125;
  const char *v126;
  double v127;
  void *v128;
  const char *v129;
  double v130;
  const char *v131;
  double v132;
  _QWORD *v133;
  void *v134;
  const char *v135;
  double v136;
  double v137;
  const char *v138;
  const char *v139;
  double v140;
  const char *v141;
  double v142;
  const char *v143;
  double v144;
  __int128 v145;
  const char *v146;
  double v147;
  __int128 v148;
  __int128 *v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  const char *v153;
  double v154;
  void **v155;
  void *v156;
  const char *v157;
  double v158;
  const char *v159;
  double v160;
  void *v161;
  id v162;
  uint64_t j;
  uint64_t v164;
  const char *v166;
  double v167;
  double v168;
  const char *v169;
  const char *v170;
  const char *v171;
  double v172;
  const char *v173;
  double v174;
  const char *v175;
  double v176;
  const char *v177;
  __int128 v178;
  const char *v179;
  const char *v180;
  __int128 v181;
  const char *v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  const char *v187;
  __int128 v188;
  const char *v189;
  const char *v190;
  double v191;
  const char *v192;
  double v193;
  id v194;
  const char *v195;
  double v196;
  uint64_t v197;
  const char *v198;
  double v199;
  const char *v200;
  double v201;
  const char *v202;
  __int128 v203;
  const char *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  const char *v209;
  double v210;
  void *v211;
  uint64_t v212;
  const char *v213;
  double v214;
  void *v215;
  const char *v216;
  double v217;
  uint64_t v218;
  const char *v219;
  double v220;
  void *v221;
  const char *v222;
  double v223;
  id v224;
  unint64_t v225;
  char *__s2;
  void *v227;
  char *__s1;
  char *__s1a;
  uint64_t v230;
  void *v231;
  void **v232;
  _QWORD *v233;
  uint64_t v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  const __CFString *v251;
  uint64_t v252;
  _BYTE v253[672];
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  _BYTE v259[768];
  _QWORD v260[128];
  _BYTE v261[1200];
  uint64_t v262;
  uint64_t v263;
  _BYTE v264[200];
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  const __CFString *v270;
  _QWORD v271[3];

  v3 = MEMORY[0x24BDAC7A8](self, a2, a3);
  v271[1] = *MEMORY[0x24BDAC8D0];
  v5 = v4;
  v8 = objc_msgSend_count(v5, v6, v7);
  objc_msgSend_parameters(*(void **)(v3 + 8), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_count(v11, v12, v13) + 1;

  if (v8 != v14)
  {
    v205 = (void *)MEMORY[0x24BDBCE88];
    v206 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_methodSelector(*(void **)(v3 + 8), v15, v16);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(v3 + 16));
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v206, v209, v210, CFSTR("Argument count mismatch for method %@ with selector %@"), v207, v208);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = *(_QWORD *)(v3 + 8);
    v270 = CFSTR("method");
    v271[0] = v212;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v213, v214, v271, &v270, 1);
    goto LABEL_87;
  }
  objc_msgSend_firstObject(v5, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_count(v5, v18, v19);
  if (v20 >= 2)
  {
    v23 = v20;
    v227 = v17;
    for (i = 1; i != v23; ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v5, v21, v22, i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(v3 + 48), v26, v27, i - 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_unsignedIntegerValue(v28, v29, v30);
      objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, v32, v33, v25, v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v35, v36);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v25 != v34)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v39 = objc_msgSend_mutableCopy(v5, v37, v38);

          v5 = (id)v39;
        }
        objc_msgSend_replaceObjectAtIndex_withObject_(v5, v37, v38, i, v34);
      }

    }
    if (*(_QWORD *)(v3 + 40))
    {
      v231 = v5;
      v232 = (void **)(v3 + 40);
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0.0;
      v268 = 0u;
      v269 = 0u;
      v266 = 0u;
      v267 = 0u;
      v46 = v23 - 1;
      v265 = 0u;
      v258 = 0u;
      v47 = v253;
      v48 = v260;
      v257 = 0u;
      v256 = 0u;
      v49 = v261;
      v255 = 0u;
      v254 = 0u;
      v230 = v3;
      v225 = v46;
      while (1)
      {
        v233 = v48;
        v234 = v44 + 2;
        objc_msgSend_objectAtIndexedSubscript_(*(void **)(v3 + 48), v21, v45, v44);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend_unsignedIntegerValue(v50, v51, v52);

        switch(v53)
        {
          case 2:
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = (uint64_t *)&v264[v44 + 192];
            v264[v44 + 192] = objc_msgSend_BOOLValue(v70, v71, v72);
            goto LABEL_43;
          case 3:
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v70, v74, v75);
            v73 = (uint64_t *)&v264[v40 + 156];
            *(_DWORD *)&v264[4 * v44 + 156] = v76;
            goto LABEL_43;
          case 4:
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v70, v77, v78);
            v73 = (uint64_t *)&v264[v43 + 80];
            *(_QWORD *)&v264[8 * v44 + 80] = v79;
            goto LABEL_43;
          case 5:
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend_unsignedIntegerValue(v70, v80, v81);
            v83 = &v263;
            goto LABEL_23;
          case 6:
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend_integerValue(v70, v84, v85);
            v83 = (uint64_t *)v264;
            goto LABEL_23;
          case 7:
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend_unsignedLongLongValue(v70, v86, v87);
            v83 = &v262;
LABEL_23:
            v73 = &v83[v43 / 8];
            v83[v44] = v82;
            goto LABEL_43;
          case 8:
            v73 = (uint64_t *)&v261[v42 + 1056];
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_CGSizeValue(v70, v88, v89);
            goto LABEL_40;
          case 9:
            v73 = (uint64_t *)&v261[v41 + 768];
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_CGRectValue(v70, v92, v93);
            goto LABEL_42;
          case 10:
            v73 = (uint64_t *)&v261[v42 + 576];
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_CGPointValue(v70, v98, v99);
            goto LABEL_40;
          case 11:
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = v100;
            if (v100)
            {
              objc_msgSend_CGAffineTransformValue(v100, v101, v102);
            }
            else
            {
              v244 = 0u;
              v245 = 0u;
              v243 = 0u;
            }
            v3 = v230;
            v145 = v244;
            *(_OWORD *)v49 = v243;
            *((_OWORD *)v49 + 1) = v145;
            *((_OWORD *)v49 + 2) = v245;

            objc_msgSend_setArgument_atIndex_(*v232, v146, v147, v49, v234);
            goto LABEL_45;
          case 12:
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = v104;
            if (v104)
            {
              objc_msgSend_CATransform3DValue(v104, v105, v106);
            }
            else
            {
              v249 = 0u;
              v250 = 0u;
              v247 = 0u;
              v248 = 0u;
              v245 = 0u;
              v246 = 0u;
              v243 = 0u;
              v244 = 0u;
            }
            v3 = v230;
            v148 = v248;
            v149 = (__int128 *)&v260[v42];
            v149[4] = v247;
            v149[5] = v148;
            v150 = v250;
            v149[6] = v249;
            v149[7] = v150;
            v151 = v244;
            *v149 = v243;
            v149[1] = v151;
            v152 = v246;
            v149[2] = v245;
            v149[3] = v152;

            v133 = v233;
            objc_msgSend_setArgument_atIndex_(*v232, v153, v154, v233, v234);
            goto LABEL_46;
          case 13:
            v73 = (uint64_t *)&v259[v41 + 512];
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UIEdgeInsetsValue(v70, v108, v109);
            goto LABEL_42;
          case 14:
            v73 = (uint64_t *)&v259[v42];
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *v73 = objc_msgSend_rangeValue(v70, v110, v111);
            v73[1] = v112;
            goto LABEL_43;
          case 15:
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            v114 = (char *)&v255 + v43;
            *((_QWORD *)&v255 + v44) = v113;

            goto LABEL_35;
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
          case 23:
          case 24:
          case 25:
            __s1 = v49;
            v56 = v47;
            v57 = v46;
            v58 = v42;
            v59 = v41;
            v60 = v40;
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v61 = objc_claimAutoreleasedReturnValue();
            v62 = (void *)*((_QWORD *)&v266 + v44);
            *((_QWORD *)&v266 + v44) = v61;

            v63 = (void *)*((_QWORD *)&v266 + v44);
            objc_msgSend_null(MEMORY[0x24BDBCEF8], v64, v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            if (v63 == v66)
            {
              v69 = (void *)*((_QWORD *)&v266 + v44);
              *((_QWORD *)&v266 + v44) = 0;

            }
            objc_msgSend_setArgument_atIndex_(*v232, v67, v68, (char *)&v266 + v43, v234);
            v40 = v60;
            v41 = v59;
            v42 = v58;
            v46 = v57;
            v47 = v56;
            v49 = __s1;
            v3 = v230;
            goto LABEL_45;
          case 27:
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v118 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            __s1a = (char *)objc_msgSend_objCType(v118, v119, v120);

            objc_msgSend_methodSignature(*v232, v121, v122);
            v123 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            __s2 = (char *)objc_msgSend_getArgumentTypeAtIndex_(v123, v124, v125, v234);

            if (strcmp(__s1a, __s2))
            {
              v205 = (void *)MEMORY[0x24BDBCE88];
              v215 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend_methodSelector(*(void **)(v230 + 8), v126, v127);
              v207 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(v230 + 16));
              v208 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringWithFormat_(v215, v216, v217, CFSTR("Struct argument type mismatch for method %@ with selector %@"), v207, v208);
              v211 = (void *)objc_claimAutoreleasedReturnValue();
              v218 = *(_QWORD *)(v230 + 8);
              v251 = CFSTR("method");
              v252 = v218;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v219, v220, &v252, &v251, 1);
LABEL_87:
              v221 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_exceptionWithName_reason_userInfo_(v205, v222, v223, CFSTR("TMLRuntimeException"), v211, v221);
              v224 = (id)objc_claimAutoreleasedReturnValue();

              objc_exception_throw(v224);
            }
            objc_msgSend_objectAtIndexedSubscript_(v231, v126, v127, v44 + 1);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_getValue_(v128, v129, v130, v47);

            objc_msgSend_setArgument_atIndex_(*v232, v131, v132, v47, v234);
            v3 = v230;
            v133 = v233;
            v46 = v225;
LABEL_46:
            ++v44;
            v43 += 8;
            v42 += 16;
            v47 += 64;
            v48 = v133 + 16;
            v49 += 48;
            v41 += 32;
            v40 += 4;
            if (v46 == v44)
            {
              v5 = v231;
              v155 = v232;
              v17 = v227;
              goto LABEL_54;
            }
            break;
          case 28:
            v243 = 0uLL;
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_getValue_(v134, v135, v136, &v243);

            v137 = *(double *)&v243;
            *(_OWORD *)&v261[v42 + 416] = v243;
            objc_msgSend_setArgument_atIndex_(*v232, v138, v137, &v261[v42 + 416], v234);
            goto LABEL_44;
          case 29:
            v73 = (uint64_t *)&v253[v42 + 544];
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UIOffsetValue(v70, v139, v140);
LABEL_40:
            *v73 = v90;
            v73[1] = v91;
            goto LABEL_43;
          case 30:
            v73 = (uint64_t *)&v259[v41 + 192];
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_directionalEdgeInsetsValue(v70, v141, v142);
LABEL_42:
            *v73 = v94;
            v73[1] = v95;
            v73[2] = v96;
            v73[3] = v97;
LABEL_43:

            objc_msgSend_setArgument_atIndex_(*v232, v143, v144, v73, v234);
            goto LABEL_44;
          default:
            v114 = (char *)&v266 + v43;
            v117 = (void *)*((_QWORD *)&v266 + v44);
            *((_QWORD *)&v266 + v44) = 0;

LABEL_35:
            objc_msgSend_setArgument_atIndex_(*v232, v115, v116, v114, v234);
LABEL_44:
            v3 = v230;
LABEL_45:
            v133 = v233;
            goto LABEL_46;
        }
      }
    }
    v17 = v227;
    goto LABEL_64;
  }
  v155 = (void **)(v3 + 40);
  if (!*(_QWORD *)(v3 + 40))
  {
LABEL_64:
    if (*(_BYTE *)(v3 + 24))
    {
      objc_opt_class();
      v164 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v164;
    }
    (*(void (**)(void))(*(_QWORD *)(v3 + 32) + 16))();
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_67;
  }
  v45 = 0.0;
  v268 = 0u;
  v269 = 0u;
  v266 = 0u;
  v267 = 0u;
  v265 = 0u;
  v258 = 0u;
  v257 = 0u;
  v256 = 0u;
  v255 = 0u;
  v254 = 0u;
LABEL_54:
  v156 = *(void **)(v3 + 40);
  if (*(_BYTE *)(v3 + 24))
    objc_msgSend_invoke(v156, v21, v45);
  else
    objc_msgSend_invokeWithTarget_(v156, v21, v45, v17);
  v161 = 0;
  switch(objc_msgSend_returnType(*(void **)(v3 + 8), v157, v158))
  {
    case 2:
      LOBYTE(v243) = 0;
      objc_msgSend_getReturnValue_(*v155, v159, v160, &v243);
      objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v166, v167, v243);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 3:
      LODWORD(v243) = 0;
      objc_msgSend_getReturnValue_(*v155, v159, v160, &v243);
      LODWORD(v168) = v243;
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v169, v168);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 4:
      *(_QWORD *)&v243 = 0;
      objc_msgSend_getReturnValue_(*v155, v159, v160, &v243);
      objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v170, *(double *)&v243);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 5:
      *(_QWORD *)&v243 = 0;
      objc_msgSend_getReturnValue_(*v155, v159, v160, &v243);
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v171, v172, (_QWORD)v243);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 6:
      *(_QWORD *)&v243 = 0;
      objc_msgSend_getReturnValue_(*v155, v159, v160, &v243);
      objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v173, v174, (_QWORD)v243);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 7:
      *(_QWORD *)&v243 = 0;
      objc_msgSend_getReturnValue_(*v155, v159, v160, &v243);
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v175, v176, (_QWORD)v243);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 8:
      v243 = *MEMORY[0x24BDBF148];
      objc_msgSend_getReturnValue_(*v155, v159, *(double *)&v243, &v243);
      objc_msgSend_valueWithCGSize_(MEMORY[0x24BDD1968], v177, *(double *)&v243, *((double *)&v243 + 1));
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 9:
      v178 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
      v243 = *MEMORY[0x24BDBF090];
      v244 = v178;
      objc_msgSend_getReturnValue_(*v155, v159, *(double *)&v243, &v243);
      objc_msgSend_valueWithCGRect_(MEMORY[0x24BDD1968], v179, *(double *)&v243, *((double *)&v243 + 1), v244);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 10:
      v243 = *MEMORY[0x24BDBEFB0];
      objc_msgSend_getReturnValue_(*v155, v159, *(double *)&v243, &v243);
      objc_msgSend_valueWithCGPoint_(MEMORY[0x24BDD1968], v180, *(double *)&v243, *((double *)&v243 + 1));
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 11:
      v181 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      v243 = *MEMORY[0x24BDBD8B8];
      v244 = v181;
      v245 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      objc_msgSend_getReturnValue_(*v155, v159, *(double *)&v245, &v243);
      v235 = v243;
      v236 = v244;
      v237 = v245;
      objc_msgSend_valueWithCGAffineTransform_(MEMORY[0x24BDD1968], v182, *(double *)&v245, &v235);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 12:
      v183 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
      v247 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
      v248 = v183;
      v184 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
      v249 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
      v250 = v184;
      v185 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
      v243 = *MEMORY[0x24BDE5598];
      v244 = v185;
      v186 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
      v245 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
      v246 = v186;
      objc_msgSend_getReturnValue_(*v155, v159, *(double *)&v245, &v243);
      v239 = v247;
      v240 = v248;
      v241 = v249;
      v242 = v250;
      v235 = v243;
      v236 = v244;
      v237 = v245;
      v238 = v246;
      objc_msgSend_valueWithCATransform3D_(MEMORY[0x24BDD1968], v187, *(double *)&v245, &v235);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 13:
      v188 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
      v243 = *MEMORY[0x24BDF7718];
      v244 = v188;
      objc_msgSend_getReturnValue_(*v155, v159, *(double *)&v243, &v243);
      objc_msgSend_valueWithUIEdgeInsets_(MEMORY[0x24BDD1968], v189, *(double *)&v243, *((double *)&v243 + 1), v244);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 14:
      v243 = xmmword_22AD839D0;
      objc_msgSend_getReturnValue_(*v155, v159, NAN, &v243);
      objc_msgSend_valueWithRange_(MEMORY[0x24BDD1968], v190, v191, v243);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
      *(_QWORD *)&v243 = 0;
      objc_msgSend_getReturnValue_(*v155, v159, v160, &v243);
      v162 = (id)v243;
      goto LABEL_59;
    case 27:
      v245 = 0u;
      v246 = 0u;
      v243 = 0u;
      v244 = 0u;
      objc_msgSend_getReturnValue_(*v155, v159, 0.0, &v243);
      objc_msgSend_methodSignature(*v155, v192, v193);
      v194 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v197 = objc_msgSend_methodReturnType(v194, v195, v196);

      objc_msgSend_valueWithBytes_objCType_(MEMORY[0x24BDD1968], v198, v199, &v243, v197);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 28:
      v243 = 0uLL;
      objc_msgSend_getReturnValue_(*v155, v159, v160, &v243);
      objc_msgSend_value_withObjCType_(MEMORY[0x24BDD1968], v200, v201, &v243, "{CGVector=dd}");
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 29:
      v243 = *MEMORY[0x24BDF7BF0];
      objc_msgSend_getReturnValue_(*v155, v159, *(double *)&v243, &v243);
      objc_msgSend_valueWithUIOffset_(MEMORY[0x24BDD1968], v202, *(double *)&v243, *((double *)&v243 + 1));
      v162 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 30:
      v203 = *(_OWORD *)(MEMORY[0x24BDF65E8] + 16);
      v243 = *MEMORY[0x24BDF65E8];
      v244 = v203;
      objc_msgSend_getReturnValue_(*v155, v159, *(double *)&v243, &v243);
      objc_msgSend_valueWithDirectionalEdgeInsets_(MEMORY[0x24BDD1968], v204, *(double *)&v243, *((double *)&v243 + 1), v244);
      v162 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:
      v161 = v162;
      break;
    default:
      break;
  }
  for (j = 72; j != -8; j -= 8)

LABEL_67:
  return v161;
}

- (BOOL)classMethod
{
  return self->_classSelector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argTypes, 0);
  objc_storeStrong((id *)&self->_invocation, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_methodDescriptor, 0);
}

@end
