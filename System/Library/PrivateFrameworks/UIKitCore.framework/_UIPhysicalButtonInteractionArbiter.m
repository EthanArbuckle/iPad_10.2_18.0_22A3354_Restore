@implementation _UIPhysicalButtonInteractionArbiter

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (id)_actionRespondersForScene:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_registerPhysicalButtonInteraction:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  unint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v51;
  _QWORD v53[5];
  id v54;
  id location;
  __int128 v56;
  __int128 v57;
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
  uint8_t buf[4];
  id v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a2, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_window");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)a1, "_scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "_hasInvalidated");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(v51, "_windowHostingScene");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

      if (v6 == WeakRetained)
      {
        -[_UIEvaluatedObjectCache sortedObjects](*(id **)(a1 + 72));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", a2);

        if (!v9)
        {
          if (!*(_QWORD *)(a1 + 24))
          {
            v13 = objc_opt_new();
            v14 = *(void **)(a1 + 24);
            *(_QWORD *)(a1 + 24) = v13;

          }
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          objc_msgSend(a2, "_configurationSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
          if (v16)
          {
            v49 = 0;
            v17 = *(_QWORD *)v65;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v65 != v17)
                  objc_enumerationMutation(v15);
                v19 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "_generation");
                v62 = 0u;
                v63 = 0u;
                v61 = 0u;
                v60 = 0u;
                v20 = *(id *)(a1 + 24);
                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
                if (v21)
                {
                  v22 = *(_QWORD *)v61;
                  while (2)
                  {
                    for (j = 0; j != v21; ++j)
                    {
                      if (*(_QWORD *)v61 != v22)
                        objc_enumerationMutation(v20);
                      if (objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "unsignedLongLongValue") == v19)
                      {

                        v41 = (void *)objc_opt_new();
                        v58 = 0u;
                        v59 = 0u;
                        v56 = 0u;
                        v57 = 0u;
                        v42 = *(id *)(a1 + 24);
                        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
                        if (v43)
                        {
                          v44 = 0;
                          v45 = *(_QWORD *)v57;
                          do
                          {
                            for (k = 0; k != v43; ++k)
                            {
                              if (*(_QWORD *)v57 != v45)
                                objc_enumerationMutation(v42);
                              if (v44 + k)
                                v47 = CFSTR(", ");
                              else
                                v47 = &stru_1E16EDF20;
                              objc_msgSend(v41, "appendFormat:", CFSTR("%@%llu"), v47, objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "unsignedLongLongValue"));
                            }
                            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
                            v44 += k;
                          }
                          while (v43);
                        }

                        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerPhysicalButtonInteraction_, "-[_UIPhysicalButtonInteractionArbiter _registerPhysicalButtonInteraction:]", a2, v41, a1);

                        goto LABEL_48;
                      }
                    }
                    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
                    if (v21)
                      continue;
                    break;
                  }
                }

                if (!v49)
                  v49 = (void *)objc_opt_new();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "addObject:", v24);

              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
            }
            while (v16);

            if (v49)
            {
              objc_msgSend(*(id *)(a1 + 24), "addObjectsFromArray:", v49);
              -[_UIPhysicalButtonInteractionArbiter _beginTrackingWindow:](a1, v51);
              -[_UIPhysicalButtonInteractionArbiter _addSystemShellWindowRequiringResolutionIfNeeded:](a1, (uint64_t)v51);
              -[_UIPhysicalButtonInteractionArbiter _createEvaluatedObjectCacheIfNeeded]((id)a1);
              objc_initWeak(&location, (id)a1);
              v25 = ++qword_1ECD80348;
              v26 = (objc_class *)objc_opt_class();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%p-%lu"), class_getName(v26), a2, v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)MEMORY[0x1E0CB3940];
              v29 = (id)a1;
              v30 = (void *)MEMORY[0x1E0CB3940];
              v31 = (objc_class *)objc_opt_class();
              NSStringFromClass(v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "stringWithFormat:", CFSTR("<%@: %p>"), v32, v29);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v28, "stringWithFormat:", CFSTR("Registering interaction with: %@"), v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              v35 = objc_alloc(MEMORY[0x1E0D01868]);
              v36 = MEMORY[0x1E0C80D38];
              v53[0] = MEMORY[0x1E0C809B0];
              v53[1] = 3221225472;
              v53[2] = __74___UIPhysicalButtonInteractionArbiter__registerPhysicalButtonInteraction___block_invoke;
              v53[3] = &unk_1E16C9090;
              objc_copyWeak(&v54, &location);
              v53[4] = a2;
              v37 = (void *)objc_msgSend(v35, "initWithIdentifier:forReason:queue:invalidationBlock:", v27, v34, MEMORY[0x1E0C80D38], v53);

              v38 = _MergedGlobals_1217;
              if (!_MergedGlobals_1217)
              {
                v38 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v38, (unint64_t *)&_MergedGlobals_1217);
              }
              v39 = *(id *)(v38 + 8);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(a2, "succinctDescription");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134349570;
                v69 = v29;
                v70 = 2112;
                v71 = v40;
                v72 = 2112;
                v73 = v37;
                _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: registered physical button interaction: %@; with registrationToken: %@",
                  buf,
                  0x20u);

              }
              -[_UIEvaluatedObjectCache addObject:](*(_QWORD *)(a1 + 72), (uint64_t)a2);
              -[_UIPhysicalButtonInteractionArbiter _resolveConfigurations]((uint64_t)v29);
              v11 = v37;
              objc_destroyWeak(&v54);

              objc_destroyWeak(&location);
              goto LABEL_8;
            }
          }
          else
          {

          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerPhysicalButtonInteraction_, "-[_UIPhysicalButtonInteractionArbiter _registerPhysicalButtonInteraction:]", a2, a1);
LABEL_48:
          v11 = 0;

          goto LABEL_8;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerPhysicalButtonInteraction_, "-[_UIPhysicalButtonInteractionArbiter _registerPhysicalButtonInteraction:]", a2, a1);

      }
    }
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (void)_resolveConfigurations
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  void *v6;
  __CFString *v7;
  unint64_t v8;
  char v9;
  id *v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  id v30;
  id v31;
  void *v32;
  char v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  objc_class *v39;
  void *v40;
  __CFString *v41;
  NSObject *v42;
  void *v43;
  id v44;
  objc_class *v45;
  __CFString *v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  uint64_t v79;
  unint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  char v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  __CFString *v100;
  unint64_t v101;
  __CFString *v102;
  __CFString *v103;
  __CFString *v104;
  void *v105;
  void *v106;
  char v107;
  uint64_t j;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  uint64_t k;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  id *v120;
  id *v121;
  id *v122;
  char v123;
  id v124;
  uint64_t v125;
  unint64_t v126;
  id *v127;
  void *v128;
  id v129;
  objc_class *v130;
  void *v131;
  void *v132;
  void *v133;
  id *v134;
  uint64_t v135;
  void *m;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  _BYTE *v142;
  void *v143;
  id *v144;
  BOOL v145;
  int v146;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  uint64_t v157;
  id v158;
  unint64_t v159;
  NSObject *v160;
  id v161;
  void *v162;
  objc_class *v163;
  const __CFString *v164;
  __CFString *v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  __CFString *v174;
  unint64_t v175;
  uint64_t v176;
  char v177;
  void *v178;
  void *v179;
  void *v180;
  NSObject *v181;
  NSObject *v182;
  uint64_t v183;
  void *v184;
  void *v185;
  id *v186;
  id v187;
  __CFString *v188;
  id *v189;
  id v190;
  void *v191;
  NSObject *log;
  id *v193;
  void *v194;
  void *v195;
  __CFString *v196;
  __CFString *v197;
  void *v198;
  char v199;
  id v200;
  id v201;
  void *v202;
  void *v203;
  id v204;
  id v205;
  NSObject *v206;
  id *v207;
  id *v208;
  id *v209;
  id *v210;
  void *v211;
  void *v212;
  uint64_t v213;
  char v214;
  id v215;
  id v216;
  id v217;
  char v218;
  uint64_t v219;
  void *v220;
  id *v221;
  id *location;
  id *locationa;
  id *locationb;
  NSObject *locationc;
  id obj;
  uint64_t obja;
  uint64_t objb;
  id *objc;
  uint64_t v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  _QWORD v235[4];
  __CFString *v236;
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
  __int128 v251;
  __int128 v252;
  _BYTE v253[128];
  _BYTE v254[128];
  _BYTE v255[128];
  _BYTE v256[128];
  id v257;
  void *v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  id v263;
  void *v264;
  id v265;
  void *v266;
  id v267;
  void *v268;
  uint8_t v269[32];
  __int128 v270;
  __int128 v271;
  uint64_t v272;
  id v273;
  uint8_t buf[4];
  uint64_t v275;
  __int16 v276;
  __CFString *v277;
  __int16 v278;
  void *v279;
  uint64_t v280;

  v280 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  *(_BYTE *)(a1 + 40) &= 0xF9u;
  objc_msgSend(*(id *)(a1 + 104), "setPaused:", 1);
  v230 = a1;
  objc_msgSend((id)a1, "_scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2 || (v3 = v2, v4 = objc_msgSend(v2, "_hasInvalidated"), v3, v4))
  {
    *(_BYTE *)(v230 + 40) &= ~0x20u;
    objc_msgSend(*(id *)(v230 + 120), "removeAllObjects");
    return;
  }
  v5 = *(_BYTE *)(v230 + 40);
  if ((v5 & 8) != 0)
  {
    *(_BYTE *)(v230 + 40) = v5 | 0x10;
    return;
  }
  v6 = *(void **)(v230 + 112);
  v208 = (id *)(v230 + 112);
  *(_BYTE *)(v230 + 40) = v5 | 8;
  v190 = v6;
  objc_msgSend(v190, "configurations");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = qword_1ECD80300;
  if (!qword_1ECD80300)
  {
    v8 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&qword_1ECD80300);
  }
  if ((*(_BYTE *)v8 & 1) != 0)
  {
    v54 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349314;
      v275 = v230;
      v276 = 2112;
      v277 = v7;
      _os_log_impl(&dword_185066000, v54, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: resolving configurations: current: %@", buf, 0x16u);
    }
  }
  kdebug_trace();
  v9 = *(_BYTE *)(v230 + 40);
  v10 = (id *)(v230 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(v230 + 56));
  if (!WeakRetained)
  {
    LODWORD(v13) = 0;
    goto LABEL_53;
  }
  v12 = WeakRetained;
  v13 = objc_msgSend(*(id *)(v230 + 120), "count");

  if (!v13)
    goto LABEL_53;
  v214 = v9;
  v196 = v7;
  objc_msgSend(*(id *)(v230 + 120), "setRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(v230 + 40) &= ~0x20u;
  objc_msgSend(*(id *)(v230 + 120), "removeAllObjects");
  v247 = 0u;
  v248 = 0u;
  v245 = 0u;
  v246 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v245, v256, 16);
  if (!v15)
  {
    v218 = 0;
    goto LABEL_52;
  }
  v16 = v15;
  v218 = 0;
  v17 = *(_QWORD *)v246;
  do
  {
    v18 = 0;
    do
    {
      v19 = v230;
      if (*(_QWORD *)v246 != v17)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v245 + 1) + 8 * v18);
      objc_msgSend(*(id *)(v230 + 128), "objectForKey:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "configurations");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = qword_1ECD80308;
      if (!qword_1ECD80308)
      {
        v23 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&qword_1ECD80308);
      }
      if ((*(_BYTE *)v23 & 1) != 0)
      {
        v36 = *(id *)(v23 + 8);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          if (v20)
          {
            v37 = (void *)MEMORY[0x1E0CB3940];
            v38 = v20;
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringWithFormat:", CFSTR("<%@: %p>"), v40, v38);
            v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v41 = CFSTR("(nil)");
          }
          *(_DWORD *)buf = 134349570;
          v275 = v230;
          v276 = 2112;
          v277 = v41;
          v278 = 2112;
          v279 = v22;
          _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: system shell resolving configurations for window: %@; current: %@",
            buf,
            0x20u);

          v19 = v230;
        }

      }
      -[_UIPhysicalButtonInteractionArbiter _performConfigurationResolutionForRequiredWindow:](v19, (uint64_t)v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "configurations");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(void **)(v19 + 128);
      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 517, 512);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *(void **)(v19 + 128);
        *(_QWORD *)(v19 + 128) = v27;

        v26 = *(void **)(v19 + 128);
      }
      objc_msgSend(v26, "setObject:forKey:", v24, v20);
      v29 = qword_1ECD80310;
      if (!qword_1ECD80310)
      {
        v29 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v29, (unint64_t *)&qword_1ECD80310);
      }
      if ((*(_BYTE *)v29 & 1) != 0)
      {
        v42 = *(id *)(v29 + 8);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          if (v20)
          {
            v43 = (void *)MEMORY[0x1E0CB3940];
            v206 = v42;
            v44 = v20;
            v45 = (objc_class *)objc_opt_class();
            NSStringFromClass(v45);
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringWithFormat:", CFSTR("<%@: %p>"), v203, v44);
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v42 = v206;
          }
          else
          {
            v46 = CFSTR("(nil)");
          }
          *(_DWORD *)buf = 134349570;
          v275 = v230;
          v276 = 2112;
          v277 = v46;
          v278 = 2112;
          v279 = v25;
          _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: system shell resolving configurations for window: %@; new: %@",
            buf,
            0x20u);

        }
      }
      v30 = v22;
      v31 = v25;
      v32 = v31;
      if (v30 == v31)
      {
        v34 = v30;
        v35 = v30;
        goto LABEL_32;
      }
      if (!v30 || !v31)
      {

LABEL_31:
        v35 = objc_loadWeakRetained((id *)(v230 + 56));
        v34 = (void *)objc_msgSend(v24, "copy");
        objc_msgSend(v35, "physicalButtonInteractionArbiter:resolvedConfigurationsInContext:forWindow:", v230, v34, v20);
        v218 = 1;
LABEL_32:

        goto LABEL_33;
      }
      v33 = objc_msgSend(v30, "isEqual:", v31);

      if ((v33 & 1) == 0)
        goto LABEL_31;
LABEL_33:

      ++v18;
    }
    while (v16 != v18);
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v245, v256, 16);
    v16 = v47;
  }
  while (v47);
LABEL_52:

  LODWORD(v13) = v218 & 1;
  v7 = v196;
  v10 = (id *)(v230 + 56);
  v9 = v214;
LABEL_53:
  v48 = objc_loadWeakRetained(v10);

  if (v48)
  {
    if ((v13 | ((v9 & 0x20) >> 5)) == 1)
    {
      v49 = objc_loadWeakRetained(v10);
      v50 = objc_loadWeakRetained((id *)(v230 + 48));
      objc_msgSend(v49, "physicalButtonInteractionArbiter:resolutionContextForScene:", v230, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        v52 = objc_msgSend(v51, "copy");

        goto LABEL_62;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_loadWeakRetained(v10);
      objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", sel__resolveConfigurations, v230, CFSTR("_UIPhysicalButtonInteractionArbiter.m"), 1415, CFSTR("Nil resolution context from system shell delegate: %@"), v56);

    }
    v52 = objc_opt_new();
LABEL_62:
    v53 = v230;
  }
  else
  {
    v53 = v230;
    -[_UIPhysicalButtonInteractionArbiter _performConfigurationResolutionForRequiredWindow:](v230, 0);
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v189 = (id *)(v53 + 48);
  v57 = objc_loadWeakRetained((id *)(v53 + 48));
  v58 = v57;
  v207 = (id *)v52;
  if (!v52)
  {

    v93 = 0;
    goto LABEL_221;
  }
  v59 = objc_msgSend(*(id *)(v52 + 8), "_count");
  if (v59 != objc_msgSend(*(id *)(v52 + 16), "count"))
  {
    v180 = (void *)MEMORY[0x1E0CB35C8];
    v272 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Count of configurations and configurationToInteractionMap do not match"));
    v60 = (id)objc_claimAutoreleasedReturnValue();
    v273 = v60;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v273, &v272, 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "errorWithDomain:code:userInfo:", CFSTR("_UIPhysicalButtonConfigurationResolutionErrorDomain"), 0, v66);
    v91 = (id)objc_claimAutoreleasedReturnValue();
LABEL_103:

    v92 = 0;
LABEL_104:

    v93 = v91;
    v94 = (void *)v52;
    if ((v92 & 1) != 0)
      goto LABEL_105;
LABEL_221:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", sel__resolveConfigurations, v230, CFSTR("_UIPhysicalButtonInteractionArbiter.m"), 1425, CFSTR("Invalid resolution context for reason: %@"), v93);
    v94 = 0;
    goto LABEL_97;
  }
  if (v59)
  {
    v271 = 0u;
    v270 = 0u;
    memset(v269, 0, sizeof(v269));
    v60 = *(id *)(v52 + 8);
    location = (id *)objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", v269, buf, 16);
    if (!location)
    {
      v91 = 0;
      v92 = 1;
      goto LABEL_104;
    }
    v197 = v7;
    v201 = 0;
    v61 = 0;
    v62 = **(_QWORD **)&v269[16];
    v215 = (id)*MEMORY[0x1E0CB2D68];
    v219 = **(_QWORD **)&v269[16];
    v199 = 1;
    v211 = v58;
    v204 = v60;
LABEL_68:
    v63 = 0;
    while (1)
    {
      if (**(_QWORD **)&v269[16] != v62)
        objc_enumerationMutation(v60);
      v64 = *(void **)(*(_QWORD *)&v269[8] + 8 * v63);
      objc_msgSend(*(id *)(v52 + 16), "objectForKey:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v65)
        break;
      v66 = v65;
      obja = v63;
      objc_msgSend(v65, "view");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "_window");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "_eventRoutingScene");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (v69 != v58)
      {
        v95 = (void *)MEMORY[0x1E0CB35C8];
        v265 = v215;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid interaction from wrong scene in configurationToInteractionMap: %@"), v66);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v266 = v96;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v266, &v265, 1);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "errorWithDomain:code:userInfo:", CFSTR("_UIPhysicalButtonConfigurationResolutionErrorDomain"), 2, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_101;
      }
      if ((objc_msgSend(v66, "_isEnabled") & 1) == 0)
      {
        v99 = (void *)MEMORY[0x1E0CB35C8];
        v263 = v215;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid disabled interaction in configurationToInteractionMap: %@"), v66);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v264 = v96;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v264, &v263, 1);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "errorWithDomain:code:userInfo:", CFSTR("_UIPhysicalButtonConfigurationResolutionErrorDomain"), 3, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v58;
LABEL_101:
        v91 = v98;

LABEL_102:
        v7 = v197;
        goto LABEL_103;
      }
      v70 = objc_msgSend(v64, "_button");
      v71 = 1 << v70;
      if (v70 >= 6)
        v71 = 0;
      if ((v71 & ~v61) != 0)
      {
        v72 = v70;
        v61 |= v71;
        _UIPhysicalButtonRequiredButtonsForButton(objc_msgSend(v64, "_button"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v249 = 0u;
        v250 = 0u;
        v251 = 0u;
        v252 = 0u;
        v74 = v73;
        v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v249, &v259, 16);
        if (v75)
        {
          v76 = v75;
          v77 = *(_QWORD *)v250;
          while (2)
          {
            for (i = 0; i != v76; ++i)
            {
              if (*(_QWORD *)v250 != v77)
                objc_enumerationMutation(v74);
              v79 = objc_msgSend(*(id *)(*((_QWORD *)&v249 + 1) + 8 * i), "unsignedIntegerValue");
              if (v79 != v72)
              {
                v80 = v79;
                objc_msgSend(v207[1], "_configurationForButton:", v79);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v207[2], "objectForKey:", v81);
                v82 = objc_claimAutoreleasedReturnValue();
                if (v66 != (void *)v82)
                {
                  v84 = (void *)v82;
                  v85 = (void *)MEMORY[0x1E0CB35C8];
                  v257 = v215;
                  v86 = (void *)MEMORY[0x1E0CB3940];
                  _NSStringFromUIPhysicalButton(v72);
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  _NSStringFromUIPhysicalButton(v80);
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v86, "stringWithFormat:", CFSTR("Configurations for required matching buttons do not have the same interaction: button: %@; requiredMatchingButton: %@"),
                    v87,
                    v88);
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  v258 = v89;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v258, &v257, 1);
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v85, "errorWithDomain:code:userInfo:", CFSTR("_UIPhysicalButtonConfigurationResolutionErrorDomain"), 4, v90);
                  v201 = (id)objc_claimAutoreleasedReturnValue();

                  v199 = 0;
                  goto LABEL_91;
                }
                v83 = 1 << v80;
                if (v80 >= 6)
                  v83 = 0;
                v61 |= v83;

              }
            }
            v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v249, &v259, 16);
            if (v76)
              continue;
            break;
          }
LABEL_91:
          v58 = v211;
          v60 = v204;
        }

        v52 = (uint64_t)v207;
        v62 = v219;
      }

      v63 = obja + 1;
      if ((id *)(obja + 1) == location)
      {
        location = (id *)objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", v269, buf, 16);
        if (location)
          goto LABEL_68;
        v7 = v197;
        v91 = v201;
        v92 = v199;
        goto LABEL_104;
      }
    }
    v178 = (void *)MEMORY[0x1E0CB35C8];
    v267 = v215;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No interaction present in configurationToInteractionMap for configuration found in set: %@"), v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = v66;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v268, &v267, 1);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "errorWithDomain:code:userInfo:", CFSTR("_UIPhysicalButtonConfigurationResolutionErrorDomain"), 1, v179);
    v91 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_102;
  }
  v93 = 0;
  v94 = (void *)v52;
LABEL_97:

LABEL_105:
  objc_storeStrong(v208, v94);
  objc_msgSend(*v208, "configurations");
  v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v101 = qword_1ECD80318;
  if (!qword_1ECD80318)
  {
    v101 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v101, (unint64_t *)&qword_1ECD80318);
  }
  if ((*(_BYTE *)v101 & 1) != 0)
  {
    v181 = *(NSObject **)(v101 + 8);
    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349314;
      v275 = v230;
      v276 = 2112;
      v277 = v100;
      _os_log_impl(&dword_185066000, v181, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: resolving configurations: new: %@", buf, 0x16u);
    }
  }
  v102 = v7;
  v103 = v100;
  v104 = v103;
  v105 = v102;
  v106 = v102;
  if (v102 == v103)
    goto LABEL_208;
  if (!v102 || !v103)
  {

LABEL_114:
    v187 = v93;
    v188 = v102;
    objc_msgSend(*v208, "configurationToInteractionMap");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v241 = 0u;
    v242 = 0u;
    v243 = 0u;
    v244 = 0u;
    _UIPhysicalButtonAllBKSHIDEventDeferringEnvironments();
    v216 = (id)objc_claimAutoreleasedReturnValue();
    objb = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v241, v255, 16);
    if (objb)
    {
      locationa = *(id **)v242;
      do
      {
        for (j = 0; j != objb; ++j)
        {
          if (*(id **)v242 != locationa)
            objc_enumerationMutation(v216);
          v109 = *(void **)(*((_QWORD *)&v241 + 1) + 8 * j);
          _UIPhysicalButtonsForBKSHIDEventDeferringEnvironment(v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v237 = 0u;
          v238 = 0u;
          v239 = 0u;
          v240 = 0u;
          v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v237, v254, 16);
          if (v111)
          {
            v112 = v111;
            v220 = v109;
            v113 = 0;
            v114 = *(_QWORD *)v238;
            do
            {
              for (k = 0; k != v112; ++k)
              {
                if (*(_QWORD *)v238 != v114)
                  objc_enumerationMutation(v110);
                -[__CFString _configurationForButton:](v104, "_configurationForButton:", objc_msgSend(*(id *)(*((_QWORD *)&v237 + 1) + 8 * k), "unsignedIntegerValue"));
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                if (v116)
                {
                  objc_msgSend(v106, "objectForKey:", v116);
                  v117 = (id)objc_claimAutoreleasedReturnValue();
                  v118 = v117;
                  if (v113)
                  {
                    if (v117 != v113)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                      v212 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v212, "handleFailureInMethod:object:file:lineNumber:description:", sel__resolveConfigurations, "-[_UIPhysicalButtonInteractionArbiter _resolveConfigurations]", v220, v230);

                    }
                  }
                  else
                  {
                    v113 = v117;
                  }

                }
              }
              v112 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v237, v254, 16);
            }
            while (v112);
          }
          else
          {
            v113 = 0;
          }

        }
        objb = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v241, v255, 16);
      }
      while (objb);
    }

    v205 = *v208;
    objc_msgSend(v205, "configurations");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v188;
    v120 = v188;
    v121 = v119;
    v122 = v121;
    if (v121 == v120)
    {
      v209 = v120;
    }
    else
    {
      if (v188 && v121)
      {
        v123 = objc_msgSend(v120, "isEqual:", v121);

        v93 = v187;
        if ((v123 & 1) != 0)
          goto LABEL_191;
      }
      else
      {

        v93 = v187;
      }
      v124 = objc_loadWeakRetained(v189);
      objc_msgSend(v124, "_eventDeferringManager");
      v125 = objc_claimAutoreleasedReturnValue();

      v209 = (id *)v125;
      if (!v125)
      {
LABEL_190:

LABEL_191:
        v166 = v230;
        v167 = *(_QWORD *)(v230 + 64);
        if (!v167)
        {
          v168 = objc_loadWeakRetained(v189);
          v235[0] = MEMORY[0x1E0C809B0];
          v235[1] = 3221225472;
          v235[2] = __61___UIPhysicalButtonInteractionArbiter__resolveConfigurations__block_invoke;
          v235[3] = &unk_1E16B2A58;
          v236 = v104;
          objc_msgSend(v168, "_updateUIClientSettingsWithBlock:", v235);

          v166 = v230;
          v167 = *(_QWORD *)(v230 + 64);
        }
        if (v167 != 1)
          goto LABEL_209;
        objc_msgSend(*(id *)(v166 + 112), "configurationToInteractionMap");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v231 = 0u;
        v232 = 0u;
        v233 = 0u;
        v234 = 0u;
        v169 = *(id *)(v166 + 144);
        v170 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v231, v253, 16);
        if (v170)
        {
          v171 = v170;
          v172 = *(_QWORD *)v232;
          do
          {
            v173 = 0;
            do
            {
              if (*(_QWORD *)v232 != v172)
                objc_enumerationMutation(v169);
              v174 = *(__CFString **)(*((_QWORD *)&v231 + 1) + 8 * v173);
              v175 = qword_1ECD80320;
              if (!qword_1ECD80320)
              {
                v175 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v175, (unint64_t *)&qword_1ECD80320);
              }
              if ((*(_BYTE *)v175 & 1) != 0)
              {
                locationc = *(NSObject **)(v175 + 8);
                if (os_log_type_enabled(locationc, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134349314;
                  v275 = v230;
                  v276 = 2112;
                  v277 = v174;
                  _os_log_impl(&dword_185066000, locationc, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: notifying view service observer of resolving configurations: %@", buf, 0x16u);
                }
              }
              -[__CFString _physicalButtonInteractionArbiter:didUpdateResolvedConfigurations:inActiveViewServiceSession:](v174, "_physicalButtonInteractionArbiter:didUpdateResolvedConfigurations:inActiveViewServiceSession:", v230, v105, *(_QWORD *)(v230 + 136));
              ++v173;
            }
            while (v171 != v173);
            v176 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v231, v253, 16);
            v171 = v176;
          }
          while (v176);
        }

        v93 = v187;
        v102 = v188;
LABEL_208:

LABEL_209:
        goto LABEL_210;
      }
      v126 = qword_1ECD802F0;
      if (!qword_1ECD802F0)
      {
        v126 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v126, (unint64_t *)&qword_1ECD802F0);
      }
      v193 = v120;
      v210 = v122;
      if ((*(_BYTE *)v126 & 1) != 0)
      {
        v182 = *(NSObject **)(v126 + 8);
        if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          v275 = v230;
          _os_log_impl(&dword_185066000, v182, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: handling event deferring updates for change in resolved configurations", buf, 0xCu);
        }
      }
      objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
      v127 = (id *)objc_claimAutoreleasedReturnValue();
      v128 = (void *)MEMORY[0x1E0CB3940];
      v129 = (id)v230;
      v130 = (objc_class *)objc_opt_class();
      NSStringFromClass(v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "stringWithFormat:", CFSTR("<%@: %p>"), v131, v129);
      v132 = (void *)objc_claimAutoreleasedReturnValue();

      v133 = v128;
      v134 = (id *)v129;
      objc_msgSend(v133, "stringWithFormat:", CFSTR("%@: updating physical button event deferring rules"), v132);
      v135 = objc_claimAutoreleasedReturnValue();

      v185 = (void *)v135;
      v186 = v127;
      objc_msgSend(v127, "transactionAssertionWithReason:", v135);
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v259 = 0u;
      v260 = 0u;
      v261 = 0u;
      v262 = 0u;
      _UIPhysicalButtonAllBKSHIDEventDeferringEnvironments();
      v200 = (id)objc_claimAutoreleasedReturnValue();
      v217 = (id)objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v259, buf, 16);
      if (v217)
      {
        v213 = *(_QWORD *)v260;
        v221 = (id *)v129;
        do
        {
          for (m = 0; m != v217; m = (char *)m + 1)
          {
            if (*(_QWORD *)v260 != v213)
              objc_enumerationMutation(v200);
            v137 = *(void **)(*((_QWORD *)&v259 + 1) + 8 * (_QWORD)m);
            _UIPhysicalButtonsForBKSHIDEventDeferringEnvironment(v137);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "firstObject");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            v140 = v139;
            if (v139)
            {
              v141 = objc_msgSend(v139, "unsignedIntegerValue");
              objc_msgSend(v134[19], "objectForKey:", v137);
              v142 = (_BYTE *)objc_claimAutoreleasedReturnValue();
              if (v142)
              {
                -[_UIEventDeferringManager currentLocalDeferringTargetWindowMatchingEnvironment:deferringToken:]((uint64_t)v209, (uint64_t)v137, v142);
                locationb = (id *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                locationb = 0;
              }
              objc_msgSend(v205, "configurationToInteractionMap");
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              _UIPhysicalButtonInteractionArbiterTargetWindowForButton(v210, v143);
              objc = (id *)objc_claimAutoreleasedReturnValue();

              if (v142)
              {
                v134 = v221;
                v144 = locationb;
                if (v142[16])
                  v145 = 0;
                else
                  v145 = locationb == 0;
                v146 = v145;
              }
              else
              {
                v146 = 0;
                v134 = v221;
                v144 = locationb;
              }
              if (v144 != objc || v146 != 0)
              {
                v202 = v138;
                objc_msgSend(v134[19], "objectForKey:", v137);
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                if (v148)
                {
                  objc_msgSend(v193, "_configurationForButton:", v141);
                  v149 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%p]: end %@ event deferring for generation: %llu"), v221, v137, objc_msgSend(v149, "_generation"));
                  v150 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_UIEventDeferringManager endLocalEventDeferringForToken:withReason:]((uint64_t)v209, (uint64_t)v148, v150);
                  objc_msgSend(v221[19], "removeObjectForKey:", v137);

                  v134 = v221;
                }
                if (objc)
                {
                  objc_msgSend(v210, "_configurationForButton:", v141);
                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                  v152 = (void *)MEMORY[0x1E0CB3940];
                  v198 = v151;
                  v183 = objc_msgSend(v151, "_generation");
                  v153 = v152;
                  v134 = v221;
                  objc_msgSend(v153, "stringWithFormat:", CFSTR("[%p]: begin %@ event deferring for generation: %llu"), v221, v137, v183);
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v137);
                  v194 = (void *)objc_claimAutoreleasedReturnValue();
                  v195 = v154;
                  -[_UIEventDeferringManager beginLocalEventDeferringInEnvironments:forOwningInterfaceElement:withReason:]((uint64_t)v209, v194, v221, v154);
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v155)
                  {
                    v156 = v221[19];
                    if (!v156)
                    {
                      v157 = objc_opt_new();
                      v158 = v221[19];
                      v221[19] = (id)v157;

                      v156 = v221[19];
                    }
                    objc_msgSend(v156, "setObject:forKey:", v155, v137);
                  }
                  else
                  {
                    v159 = qword_1ECD802F8;
                    if (!qword_1ECD802F8)
                    {
                      v159 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                      atomic_store(v159, (unint64_t *)&qword_1ECD802F8);
                    }
                    v160 = *(id *)(v159 + 8);
                    if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
                    {
                      log = v160;
                      v161 = v198;
                      if (v161)
                      {
                        v162 = (void *)MEMORY[0x1E0CB3940];
                        v163 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v163);
                        v191 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v162, "stringWithFormat:", CFSTR("<%@: %p>"), v191, v161);
                        v164 = (const __CFString *)objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        v164 = CFSTR("(nil)");
                      }

                      *(_DWORD *)v269 = 134349570;
                      *(_QWORD *)&v269[4] = v230;
                      *(_WORD *)&v269[12] = 2112;
                      *(_QWORD *)&v269[14] = v137;
                      *(_WORD *)&v269[22] = 2112;
                      v165 = (__CFString *)v164;
                      *(_QWORD *)&v269[24] = v164;
                      v160 = log;
                      _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: failed to begin %@ event deferring for configuration: %@", v269, 0x20u);

                      v134 = v221;
                    }

                  }
                }

                v138 = v202;
              }

            }
          }
          v217 = (id)objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v259, buf, 16);
        }
        while (v217);
      }

      objc_msgSend(v184, "invalidate");
      v120 = v186;
      v102 = v188;
      v122 = v210;
    }

    v93 = v187;
    goto LABEL_190;
  }
  v107 = -[__CFString isEqual:](v102, "isEqual:", v103);

  if ((v107 & 1) == 0)
    goto LABEL_114;
LABEL_210:

  v177 = *(_BYTE *)(v230 + 40);
  *(_BYTE *)(v230 + 40) = v177 & 0xE7;
  if ((v177 & 0x10) != 0)
  {
    -[_UIPhysicalButtonInteractionArbiter _scheduleDeferredConfigurationResolution](v230);
    *(_BYTE *)(v230 + 40) |= 4u;
  }

}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_createEvaluatedObjectCacheIfNeeded
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (!*((_QWORD *)val + 9))
  {
    objc_initWeak(&location, val);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74___UIPhysicalButtonInteractionArbiter__createEvaluatedObjectCacheIfNeeded__block_invoke;
    v6[3] = &unk_1E16E1440;
    objc_copyWeak(&v7, &location);
    v2 = _Block_copy(v6);
    v3 = (void *)*((_QWORD *)val + 2);
    *((_QWORD *)val + 2) = v2;

    v4 = -[_UIEvaluatedObjectCache initWithSortComparator:evaluationBlock:]([_UIEvaluatedObjectCache alloc], &__block_literal_global_487, 0);
    v5 = (void *)*((_QWORD *)val + 9);
    *((_QWORD *)val + 9) = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_beginTrackingWindow:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  __CFString *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 80);
  if (!v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 514, 2);
    v7 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v6;

    v5 = *(void **)(a1 + 80);
  }
  objc_msgSend(v5, "addObject:", a2);
  v8 = *(void **)(a1 + 88);
  if (!v8)
  {
    v9 = objc_opt_new();
    v10 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v9;

    v8 = *(void **)(a1 + 88);
  }
  objc_msgSend(v8, "addObject:", v4);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (!WeakRetained)
  {
    v12 = *(void **)(a1 + 96);
    if (!v12)
    {
      v13 = objc_opt_new();
      v14 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v13;

      v12 = *(void **)(a1 + 96);
    }
    v15 = objc_msgSend(v12, "containsObject:", v4);
    objc_msgSend(*(id *)(a1 + 96), "addObject:", v4);
    if ((v15 & 1) == 0)
    {
      objc_msgSend(a2, "_addWindowLevelChangedObserver:", a1);
      v16 = _beginTrackingWindow____s_category;
      if (!_beginTrackingWindow____s_category)
      {
        v16 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&_beginTrackingWindow____s_category);
      }
      if ((*(_BYTE *)v16 & 1) != 0)
      {
        v17 = *(id *)(v16 + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          if (a2)
          {
            v18 = (void *)MEMORY[0x1E0CB3940];
            v19 = a2;
            v20 = (objc_class *)objc_opt_class();
            NSStringFromClass(v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v19);
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v22 = CFSTR("(nil)");
          }
          *(_DWORD *)buf = 134349314;
          v24 = a1;
          v25 = 2112;
          v26 = v22;
          _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter began observing window level for window: %@", buf, 0x16u);

        }
      }
    }
  }

}

- (void)_addSystemShellWindowRequiringResolutionIfNeeded:(uint64_t)a1
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2 && WeakRetained)
  {
    v5 = *(_QWORD *)(a2 + 104);

    if ((v5 & 0x1000) == 0)
    {
      v6 = *(void **)(a1 + 120);
      if (!v6)
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 3);
        v8 = *(void **)(a1 + 120);
        *(_QWORD *)(a1 + 120) = v7;

        v6 = *(void **)(a1 + 120);
      }
      objc_msgSend(v6, "addObject:", a2);
    }
  }
  else
  {

  }
}

- (id)_performConfigurationResolutionForRequiredWindow:(uint64_t)a1
{
  void *v4;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = (void *)objc_opt_new();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__176;
  v19 = __Block_byref_object_dispose__176;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__176;
  v13 = __Block_byref_object_dispose__176;
  v14 = 0;
  v7[4] = &v9;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88___UIPhysicalButtonInteractionArbiter__performConfigurationResolutionForRequiredWindow___block_invoke;
  v8[3] = &unk_1E16E1500;
  v8[4] = &v15;
  v6[4] = &v15;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88___UIPhysicalButtonInteractionArbiter__performConfigurationResolutionForRequiredWindow___block_invoke_2;
  v7[3] = &unk_1E16E14B0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88___UIPhysicalButtonInteractionArbiter__performConfigurationResolutionForRequiredWindow___block_invoke_3;
  v6[3] = &unk_1E16E1528;
  -[_UIPhysicalButtonInteractionArbiter _enumerateAndValidateInteractionsInWindow:withRequiredBehaviorMask:configurationAcceptanceEvaluator:interactionAcceptanceHandler:shouldStopEvaluator:](a1, a2, 0, (uint64_t)v8, (uint64_t)v7, (uint64_t)v6);
  objc_msgSend(v4, "setConfigurations:", v16[5]);
  objc_msgSend(v4, "setConfigurationToInteractionMap:", v10[5]);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v4;
}

- (_UIPhysicalButtonInteractionArbiter)initWithScene:(id)a3
{
  _UIPhysicalButtonInteractionArbiter *v4;
  uint64_t v5;
  unint64_t v6;
  id WeakRetained;
  void *v8;
  _BOOL8 v9;
  id v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSObject *v24;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  __CFString *v29;
  id v30;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE location[12];
  __int16 v37;
  __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)_UIPhysicalButtonInteractionArbiter;
  v4 = -[_UIPhysicalButtonInteractionArbiter init](&v31, sel_init);
  v5 = (uint64_t)v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_scene, a3);
    v6 = initWithScene____s_category_1;
    if (!initWithScene____s_category_1)
    {
      v6 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&initWithScene____s_category_1);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v24 = *(id *)(v6 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        if (a3)
        {
          v25 = (void *)MEMORY[0x1E0CB3940];
          v26 = a3;
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@: %p>"), v28, v26);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v29 = CFSTR("(nil)");
        }
        *(_DWORD *)location = 134349314;
        *(_QWORD *)&location[4] = v5;
        v37 = 2112;
        v38 = v29;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: initializing with scene: %@", location, 0x16u);

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 48));
    objc_msgSend(WeakRetained, "_FBSScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    -[_UIPhysicalButtonInteractionArbiter _setResolutionStrategy:forInitialization:]((_QWORD *)v5, v9, 1);
    v10 = objc_loadWeakRetained((id *)(v5 + 48));
    objc_msgSend(v10, "_eventDeferringManager");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v11 && (*(_BYTE *)(v5 + 40) & 1) == 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      _UIPhysicalButtonAllBKSHIDEventDeferringEnvironments();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, location, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v33 != v14)
              objc_enumerationMutation(v12);
            -[_UIEventDeferringManager registerTargetProvider:forEnvironment:](v11, v5, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, location, 16);
        }
        while (v13);
      }

      *(_BYTE *)(v5 + 40) |= 1u;
    }

    objc_initWeak((id *)location, (id)v5);
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_loadWeakRetained((id *)(v5 + 48));
    objc_msgSend(v17, "_sceneIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("UIKit - PhysicalButtonInteractionArbiter - %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v30, (id *)location);
    BSLogAddStateCaptureBlockWithTitle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v21;

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
  }
  return (_UIPhysicalButtonInteractionArbiter *)v5;
}

- (void)_setResolutionStrategy:(int)a3 forInitialization:
{
  uint64_t v3;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD aBlock[4];
  id v25;
  uint8_t buf[4];
  _QWORD *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a1[8];
  if (v3 != a2 || a3 != 0)
  {
    a1[8] = a2;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      -[_UIPhysicalButtonInteractionArbiter _beginObservingWindowVisibilityChanges]((uint64_t)a1);
    if (v3 == 1)
    {
      objc_msgSend(v8, "removeObserver:name:object:", a1, CFSTR("_UIActiveViewServiceSessionDidChangeNotification"), 0);
      v9 = (void *)a1[17];
      a1[17] = 0;

      v10 = (void *)a1[1];
      a1[1] = 0;

    }
    if (a2 == 1)
    {
      objc_msgSend(v8, "addObserver:selector:name:object:", a1, sel__mostActiveViewServiceSessionDidChange_, CFSTR("_UIActiveViewServiceSessionDidChangeNotification"), 0);
      if (!a1[17])
      {
        -[_UIPhysicalButtonInteractionArbiter _mostActiveViewServiceSessionForScene]((uint64_t)a1);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)a1[17];
        a1[17] = v11;

        v13 = _setResolutionStrategy_forInitialization____s_category;
        if (!_setResolutionStrategy_forInitialization____s_category)
        {
          v13 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v13, (unint64_t *)&_setResolutionStrategy_forInitialization____s_category);
        }
        v14 = *(NSObject **)(v13 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = a1[8];
          v16 = &stru_1E16EDF20;
          if (v15 == 1)
            v16 = CFSTR("viewServices");
          if (v15)
            v17 = (__CFString *)v16;
          else
            v17 = CFSTR("sceneClientSettings");
          v18 = v17;
          v19 = (void *)a1[17];
          v20 = v14;
          objc_msgSend(v19, "succinctDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134349570;
          v27 = a1;
          v28 = 2112;
          v29 = v18;
          v30 = 2112;
          v31 = v21;
          _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: set %@ strategy; most active view service session: %@",
            buf,
            0x20u);

        }
      }
      objc_initWeak((id *)buf, a1);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __80___UIPhysicalButtonInteractionArbiter__setResolutionStrategy_forInitialization___block_invoke;
      aBlock[3] = &unk_1E16E1440;
      objc_copyWeak(&v25, (id *)buf);
      v22 = _Block_copy(aBlock);
      v23 = (void *)a1[1];
      a1[1] = v22;

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }

  }
}

- (void)_beginObservingWindowVisibilityChanges
{
  id v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__windowVisibilityDidChange_, CFSTR("UIWindowDidBecomeVisibleNotification"), 0);
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__windowVisibilityDidChange_, CFSTR("UIWindowDidBecomeHiddenNotification"), 0);

  }
}

- (void)_unregisterAllPhysicalButtonInteractionsForDetachingWindow:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 40) & 8) == 0)
      *(_BYTE *)(a1 + 40) |= 8u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[_UIEvaluatedObjectCache sortedObjects](*(id **)(a1 + 72));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy", 0);

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_window");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == (void *)a2)
            -[_UIPhysicalButtonInteraction _unregisterFromArbiter]((uint64_t)v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v13 = *(_BYTE *)(a1 + 40);
    *(_BYTE *)(a1 + 40) = v13 & 0xE7;
    if ((v13 & 0x10) != 0)
      -[_UIPhysicalButtonInteractionArbiter _resolveConfigurations](a1);
    -[_UIPhysicalButtonInteractionArbiter _removeAllSystemShellReferencesForDetachingWindow:]((id *)a1, a2);
  }
}

- (_UIPhysicalButtonInteractionArbiter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteractionArbiter.m"), 561, CFSTR("%s: init is not allowed on %@"), "-[_UIPhysicalButtonInteractionArbiter init]", objc_opt_class());

  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  -[CADisplayLink invalidate](self->_deferredConfigurationResolutionDisplayLink, "invalidate");
  -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIWindowFirstResponderDidChangeNotification");
  v6[1] = CFSTR("UIWindowDidBecomeVisibleNotification");
  v6[2] = CFSTR("UIWindowDidBecomeHiddenNotification");
  v6[3] = CFSTR("_UIActiveViewServiceSessionDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIPhysicalButtonInteractionArbiter;
  -[_UIPhysicalButtonInteractionArbiter dealloc](&v5, sel_dealloc);
}

- (void)_windowHostingScene:(id)a3 willMoveFromScreen:(id)a4 toScreen:(id)a5
{
  char arbiterFlags;
  CADisplayLink *deferredConfigurationResolutionDisplayLink;

  arbiterFlags = (char)self->_arbiterFlags;
  -[CADisplayLink invalidate](self->_deferredConfigurationResolutionDisplayLink, "invalidate", a3, a4);
  deferredConfigurationResolutionDisplayLink = self->_deferredConfigurationResolutionDisplayLink;
  self->_deferredConfigurationResolutionDisplayLink = 0;

  if ((arbiterFlags & 2) != 0)
    -[_UIPhysicalButtonInteractionArbiter _configureDeferredResolutionDisplayLinkForScreen:]((uint64_t)self, a5);
}

- (uint64_t)_configureDeferredResolutionDisplayLinkForScreen:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (result)
  {
    v2 = result;
    v3 = *(void **)(result + 104);
    if (!v3)
    {
      objc_msgSend(a2, "displayLinkWithTarget:selector:", v2, sel__deferredResolutionDisplayLinkTicked_);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(v2 + 104);
      *(_QWORD *)(v2 + 104) = v4;

      v6 = *(void **)(v2 + 104);
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

      v3 = *(void **)(v2 + 104);
    }
    result = objc_msgSend(v3, "isPaused");
    if ((_DWORD)result)
    {
      objc_msgSend(*(id *)(v2 + 104), "setPaused:", 0);
      return kdebug_trace();
    }
  }
  return result;
}

- (void)_sceneWillInvalidate:(id)a3
{
  unint64_t v5;
  UIScene **p_scene;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  _UIPhysicalButtonInteractionArbiter *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  CADisplayLink *deferredConfigurationResolutionDisplayLink;
  _UIViewServiceSessionActivityRecord *mostActiveViewServiceSession;
  NSHashTable *viewServiceObservers;
  id viewServiceValidationBlock;
  id interactionValidationBlock;
  NSCountedSet *countedWindowPointerValues;
  NSHashTable *trackedWindowPointers;
  _UIEvaluatedObjectCache *registeredAndSortedInteractions;
  NSHashTable *systemShellWindowsRequiringResolution;
  NSMapTable *systemShellWindowConfigurationResolutionContexts;
  _UIPhysicalButtonConfigurationResolutionContext *sceneConfigurationResolutionContext;
  NSMutableArray *uniqueConfigurationGenerationNumbers;
  id v33;
  void *v34;
  _BOOL8 v35;
  NSObject *v36;
  void *v37;
  id v38;
  objc_class *v39;
  void *v40;
  __CFString *v41;
  NSMutableDictionary *obj;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  _UIPhysicalButtonInteractionArbiter *v49;
  __int16 v50;
  __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "_hasInvalidated"))
    return;
  v5 = _sceneWillInvalidate____s_category_1;
  if (!_sceneWillInvalidate____s_category_1)
  {
    v5 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_sceneWillInvalidate____s_category_1);
  }
  if ((*(_BYTE *)v5 & 1) == 0)
  {
    if (!self)
      return;
    goto LABEL_6;
  }
  v36 = *(id *)(v5 + 8);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    if (a3)
    {
      v37 = (void *)MEMORY[0x1E0CB3940];
      v38 = a3;
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("<%@: %p>"), v40, v38);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v41 = CFSTR("(nil)");
    }
    *(_DWORD *)buf = 134349314;
    v49 = self;
    v50 = 2112;
    v51 = v41;
    _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: resetting state for invalidating scene: %@", buf, 0x16u);

  }
  if (self)
  {
LABEL_6:
    p_scene = &self->_scene;
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(WeakRetained, "_eventDeferringManager");
    v8 = objc_claimAutoreleasedReturnValue();

    v43 = (void *)v8;
    if (v8)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      obj = self->_eventDeferringTokenByEnvironment;
      v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, buf, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v45 != v11)
              objc_enumerationMutation(obj);
            v13 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            -[NSMutableDictionary objectForKey:](self->_eventDeferringTokenByEnvironment, "objectForKey:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)MEMORY[0x1E0CB3940];
            v16 = self;
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p>"), v18, v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: ending %@ event deferring for arbiter reset"), v19, v13);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            -[_UIEventDeferringManager endLocalEventDeferringForToken:withReason:]((uint64_t)v43, (uint64_t)v14, v20);
          }
          v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, buf, 16);
        }
        while (v10);
      }

      p_scene = &self->_scene;
    }
    *(_BYTE *)&self->_arbiterFlags &= 0xE1u;
    -[CADisplayLink invalidate](self->_deferredConfigurationResolutionDisplayLink, "invalidate");
    deferredConfigurationResolutionDisplayLink = self->_deferredConfigurationResolutionDisplayLink;
    self->_deferredConfigurationResolutionDisplayLink = 0;

    mostActiveViewServiceSession = self->_mostActiveViewServiceSession;
    self->_mostActiveViewServiceSession = 0;

    viewServiceObservers = self->_viewServiceObservers;
    self->_viewServiceObservers = 0;

    viewServiceValidationBlock = self->_viewServiceValidationBlock;
    self->_viewServiceValidationBlock = 0;

    interactionValidationBlock = self->_interactionValidationBlock;
    self->_interactionValidationBlock = 0;

    -[_UIPhysicalButtonInteractionArbiter _resetWindowLevelObservation]((uint64_t)self);
    countedWindowPointerValues = self->_countedWindowPointerValues;
    self->_countedWindowPointerValues = 0;

    trackedWindowPointers = self->_trackedWindowPointers;
    self->_trackedWindowPointers = 0;

    registeredAndSortedInteractions = self->_registeredAndSortedInteractions;
    self->_registeredAndSortedInteractions = 0;

    systemShellWindowsRequiringResolution = self->_systemShellWindowsRequiringResolution;
    self->_systemShellWindowsRequiringResolution = 0;

    systemShellWindowConfigurationResolutionContexts = self->_systemShellWindowConfigurationResolutionContexts;
    self->_systemShellWindowConfigurationResolutionContexts = 0;

    sceneConfigurationResolutionContext = self->_sceneConfigurationResolutionContext;
    self->_sceneConfigurationResolutionContext = 0;

    uniqueConfigurationGenerationNumbers = self->_uniqueConfigurationGenerationNumbers;
    self->_uniqueConfigurationGenerationNumbers = 0;

    v33 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v33, "_FBSScene");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34 == 0;

    -[_UIPhysicalButtonInteractionArbiter _setResolutionStrategy:forInitialization:](self, v35, 0);
  }
}

- (void)_removeAllSystemShellReferencesForDetachingWindow:(id *)a1
{
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 7);

    if (WeakRetained)
    {
      objc_msgSend(a1[15], "removeObject:", a2);
      objc_msgSend(a1[16], "removeObjectForKey:", a2);
    }
  }
}

- (int64_t)interfaceElementCategory
{
  return 1;
}

- (id)localEventDeferringTargetWindowForEnvironment:(id)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _UIPhysicalButtonConfigurationResolutionContext *v10;
  void *v11;
  void *v12;
  void *v13;

  _UIPhysicalButtonsForBKSHIDEventDeferringEnvironment(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  if (!v7 || (unint64_t)(v8 - 1) >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteractionArbiter.m"), 981, CFSTR("%s: Invalid state: asked for target window of unknown event deferring environment: %@"), "-[_UIPhysicalButtonInteractionArbiter localEventDeferringTargetWindowForEnvironment:]", a3);

  }
  v10 = self->_sceneConfigurationResolutionContext;
  -[_UIPhysicalButtonConfigurationResolutionContext configurations](v10, "configurations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPhysicalButtonConfigurationResolutionContext configurationToInteractionMap](v10, "configurationToInteractionMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _UIPhysicalButtonInteractionArbiterTargetWindowForButton(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_mostActiveViewServiceSessionForScene
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_screen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "_userInterfaceIdiom");

    v4 = _UIActiveViewServiceSessionEffectiveIdiomForIdiom(v3);
    +[_UIActiveViewServiceSessionTracker sharedTracker](_UIActiveViewServiceSessionTracker, "sharedTracker");
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[_UIActiveViewServiceSessionTracker mostActiveViewServiceSessionForUserInterfaceIdiom:](v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_enumerateAndValidateInteractionsInWindow:(uint64_t)a3 withRequiredBehaviorMask:(uint64_t)a4 configurationAcceptanceEvaluator:(uint64_t)a5 interactionAcceptanceHandler:(uint64_t)a6 shouldStopEvaluator:
{
  uint64_t v6;
  id WeakRetained;
  void *v14;
  void *v15;
  _QWORD v16[7];
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;

  v6 = *(_QWORD *)(a1 + 72);
  if (v6)
  {
    if (objc_msgSend(*(id *)(v6 + 24), "count"))
    {
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__176;
      v26[4] = __Block_byref_object_dispose__176;
      v27 = 0;
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x3032000000;
      v24[3] = __Block_byref_object_copy__176;
      v24[4] = __Block_byref_object_dispose__176;
      v25 = 0;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "_coordinateSpace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIEvaluatedObjectCache sortedObjects](*(id **)(a1 + 72));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __188___UIPhysicalButtonInteractionArbiter__enumerateAndValidateInteractionsInWindow_withRequiredBehaviorMask_configurationAcceptanceEvaluator_interactionAcceptanceHandler_shouldStopEvaluator___block_invoke_2;
      v16[3] = &unk_1E16E1488;
      v16[4] = a1;
      v16[5] = a2;
      v22 = v24;
      v23 = a3;
      v16[6] = v14;
      v17 = &__block_literal_global_110_5;
      v18 = a4;
      v19 = a5;
      v20 = a6;
      v21 = v26;
      objc_msgSend(v15, "enumerateObjectsWithOptions:usingBlock:", 2, v16);

      _Block_object_dispose(v24, 8);
      _Block_object_dispose(v26, 8);

    }
  }
}

- (id)_gestureViewsForWindow:(uint64_t)a3 physicalButton:
{
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  BOOL v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 112), "configurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_configurationForButton:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__176;
    v21 = __Block_byref_object_dispose__176;
    v22 = 0;
    v8 = objc_msgSend(v7, "_behavior");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77___UIPhysicalButtonInteractionArbiter__gestureViewsForWindow_physicalButton___block_invoke;
    v16[3] = &unk_1E16E14B0;
    if (v8 >= 3)
      v9 = 0;
    else
      v9 = 1 << v8;
    v16[4] = &v17;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77___UIPhysicalButtonInteractionArbiter__gestureViewsForWindow_physicalButton___block_invoke_2;
    v14[3] = &unk_1E16E14D8;
    v15 = v8 != 2;
    v14[4] = &v17;
    -[_UIPhysicalButtonInteractionArbiter _enumerateAndValidateInteractionsInWindow:withRequiredBehaviorMask:configurationAcceptanceEvaluator:interactionAcceptanceHandler:shouldStopEvaluator:](a1, a2, v9, 0, (uint64_t)v16, (uint64_t)v14);
    v10 = (void *)v18[5];
    if (v10)
      v11 = objc_msgSend(v10, "copy");
    else
      v11 = objc_opt_new();
    v12 = (void *)v11;
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    v12 = (void *)objc_opt_new();
  }

  return v12;
}

- (void)_scheduleDeferredConfigurationResolution
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPhysicalButtonInteractionArbiter _configureDeferredResolutionDisplayLinkForScreen:](a1, v3);

  *(_BYTE *)(a1 + 40) |= 2u;
}

- (void)_deferredResolutionDisplayLinkTicked:(id)a3
{
  char arbiterFlags;
  _UIEvaluatedObjectCache *registeredAndSortedInteractions;
  int v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;

  arbiterFlags = (char)self->_arbiterFlags;
  *(_BYTE *)&self->_arbiterFlags = arbiterFlags & 0xF9;
  -[CADisplayLink setPaused:](self->_deferredConfigurationResolutionDisplayLink, "setPaused:", 1);
  if ((arbiterFlags & 2) == 0)
    goto LABEL_11;
  registeredAndSortedInteractions = self->_registeredAndSortedInteractions;
  if (registeredAndSortedInteractions)
  {
    v6 = arbiterFlags & 4;
    if (-[NSMutableOrderedSet count](registeredAndSortedInteractions->_sortedObjects, "count"))
      v7 = 0;
    else
      v7 = v6 == 0;
    if (v7)
      goto LABEL_11;
  }
  else if ((arbiterFlags & 4) == 0)
  {
    goto LABEL_11;
  }
  -[_UIPhysicalButtonInteractionArbiter _scene](self, "_scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_11:
    kdebug_trace();
    return;
  }
  v9 = v8;
  v10 = objc_msgSend(v8, "_hasInvalidated");

  kdebug_trace();
  if ((v10 & 1) == 0)
    -[_UIPhysicalButtonInteractionArbiter _resolveConfigurations]((uint64_t)self);
}

- (void)_setNeedsResolutionOfPhysicalButtonConfigurationsInSceneForReason:(uint64_t)a1
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  int v6;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 72);
    if (v2)
    {
      if (objc_msgSend(*(id *)(v2 + 24), "count"))
      {
        objc_msgSend((id)a1, "_scene");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
        {
          v4 = v3;
          v5 = objc_msgSend(v3, "_hasInvalidated");

          if ((v5 & 1) == 0)
          {
            v6 = *(_BYTE *)(a1 + 40) & 2;
            kdebug_trace();
            if (!v6)
              -[_UIPhysicalButtonInteractionArbiter _scheduleDeferredConfigurationResolution](a1);
          }
        }
      }
    }
  }
}

- (void)_setNeedsResolutionOfPhysicalButtonConfigurationsInWindow:(unint64_t)a3 forReason:
{
  uint64_t v5;
  void *v7;
  void *v8;
  char v9;
  id v10;
  id WeakRetained;
  unint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2)
    {
      v5 = *(_QWORD *)(a1 + 72);
      if (v5)
      {
        if (objc_msgSend(*(id *)(v5 + 24), "count"))
        {
          objc_msgSend((id)a1, "_scene");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            v8 = v7;
            v9 = objc_msgSend(v7, "_hasInvalidated");

            if ((v9 & 1) == 0 && (a3 != 2 || objc_msgSend(*(id *)(a1 + 80), "containsObject:", a2)))
            {
              objc_msgSend(a2, "_windowHostingScene");
              v10 = (id)objc_claimAutoreleasedReturnValue();
              WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

              if (v10 == WeakRetained)
              {
                -[_UIPhysicalButtonInteractionArbiter _addSystemShellWindowRequiringResolutionIfNeeded:](a1, (uint64_t)a2);
                -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInSceneForReason:](a1);
              }
              else
              {
                v12 = _setNeedsResolutionOfPhysicalButtonConfigurationsInWindow_forReason____s_category;
                if (!_setNeedsResolutionOfPhysicalButtonConfigurationsInWindow_forReason____s_category)
                {
                  v12 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v12, (unint64_t *)&_setNeedsResolutionOfPhysicalButtonConfigurationsInWindow_forReason____s_category);
                }
                v13 = *(NSObject **)(v12 + 8);
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  if (a3 > 4)
                    v14 = &stru_1E16EDF20;
                  else
                    v14 = off_1E16E1598[a3];
                  v16 = 134349570;
                  v17 = a1;
                  v18 = 2112;
                  v19 = a2;
                  v20 = 2112;
                  v21 = v14;
                  v15 = v13;
                  _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: Invalid state: dropping request to resolve configurations due to invalid window in scene: %@; resolutionReason: %@",
                    (uint8_t *)&v16,
                    0x20u);

                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)_windowVisibilityDidChange:(id)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_systemShellDelegate);

  if (WeakRetained)
    return;
  objc_msgSend(a3, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(a3, "object");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (!v10)
  {
LABEL_8:

    return;
  }
  objc_msgSend(v10, "_windowHostingScene");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)&self->_scene);

  if (v8 == v9)
    -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInWindow:forReason:]((uint64_t)self, v10, 0);

}

- (void)window:(id)a3 changedFromLevel:(double)a4 toLevel:(double)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_systemShellDelegate);

  if (!WeakRetained)
  {
    -[_UIEvaluatedObjectCache sortAndEvaluateTopObject]((uint64_t)self->_registeredAndSortedInteractions);
    -[_UIPhysicalButtonInteractionArbiter _resolveConfigurations]((uint64_t)self);
  }
}

- (void)_resetWindowLevelObservation
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(a1 + 96);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "pointerValue", (_QWORD)v10);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          if (v7)
            objc_msgSend(v7, "_removeWindowLevelChangedObserver:", a1);

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

    v9 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

  }
}

- (void)setSystemShellDelegate:(id)a3
{
  char IsSpringBoard;
  char v7;
  char v8;
  char v9;
  id WeakRetained;
  id v11;
  id v12;
  void *v13;
  char v14;
  unint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  objc_class *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  __CFString *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint8_t buf[4];
  _UIPhysicalButtonInteractionArbiter *v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  IsSpringBoard = _UIApplicationProcessIsSpringBoard();
  v7 = IsSpringBoard;
  if (!a3)
  {
    if ((IsSpringBoard & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteractionArbiter.m"), 1709, CFSTR("%s: A system shell delegate is not allowed for this process"), "-[_UIPhysicalButtonInteractionArbiter setSystemShellDelegate:]", v31);
      goto LABEL_30;
    }
LABEL_6:
    WeakRetained = objc_loadWeakRetained((id *)&self->_systemShellDelegate);
    v11 = a3;
    v12 = WeakRetained;
    v13 = v12;
    if (v12 == v11)
    {
      v14 = 1;
    }
    else
    {
      v14 = 0;
      if (v11 && v12)
        v14 = objc_msgSend(v11, "isEqual:", v12);
    }

    v15 = setSystemShellDelegate____s_category;
    if (!setSystemShellDelegate____s_category)
    {
      v15 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&setSystemShellDelegate____s_category);
    }
    v16 = *(id *)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_loadWeakRetained((id *)&self->_systemShellDelegate);
      if (v17)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v17);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = CFSTR("(nil)");
      }

      v22 = v21;
      if (a3)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = v11;
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p>"), v26, v24);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v27 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 134349570;
      v34 = self;
      v35 = 2112;
      v36 = v22;
      v37 = 2112;
      v38 = v27;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: setting system shell delegate: existing: %@; new: %@",
        buf,
        0x20u);

    }
    objc_storeWeak((id *)&self->_systemShellDelegate, v11);
    if ((v14 & 1) == 0)
    {
      v28 = objc_loadWeakRetained((id *)&self->_systemShellDelegate);

      if (v28)
      {
        -[_UIPhysicalButtonInteractionArbiter _resetWindowLevelObservation]((uint64_t)self);
        if (self)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "removeObserver:name:object:", self, CFSTR("UIWindowDidBecomeVisibleNotification"), 0);
          objc_msgSend(v29, "removeObserver:name:object:", self, CFSTR("UIWindowDidBecomeHiddenNotification"), 0);

        }
      }
      else
      {
        -[_UIPhysicalButtonInteractionArbiter _beginObservingWindowVisibilityChanges]((uint64_t)self);
      }
    }
    return;
  }
  v8 = objc_msgSend(a3, "conformsToProtocol:", &unk_1EE0CEE88);
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    if ((v8 & 1) == 0)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteractionArbiter.m"), 1710, CFSTR("%s: Candidate system shell delegate does not conform to _UIPhysicalButtonInteractionArbiterSystemShellDelegate: %@"), "-[_UIPhysicalButtonInteractionArbiter setSystemShellDelegate:]", a3);
LABEL_30:

      return;
    }
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteractionArbiter.m"), 1709, CFSTR("%s: A system shell delegate is not allowed for this process"), "-[_UIPhysicalButtonInteractionArbiter setSystemShellDelegate:]");

  if ((v9 & 1) == 0)
    goto LABEL_4;
}

- (void)setNeedsResolutionOfPhysicalButtonConfigurationsForSystemShellDelegate:(id)a3
{
  _UIPhysicalButtonInteractionArbiterSystemShellDelegate **p_systemShellDelegate;
  id WeakRetained;
  void *v7;
  id v8;

  p_systemShellDelegate = &self->_systemShellDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemShellDelegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)p_systemShellDelegate);

    if (v8 == a3)
    {
      *(_BYTE *)&self->_arbiterFlags |= 0x20u;
      -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInSceneForReason:]((uint64_t)self);
    }
  }
}

- (id)configurationResolutionContextForSystemShellWindow:(id)a3
{
  void *v5;
  void *v6;

  -[NSMapTable objectForKey:](self->_systemShellWindowConfigurationResolutionContexts, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (void)_mostActiveViewServiceSessionDidChange:(id)a3
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _UIViewServiceSessionActivityRecord *v11;
  _UIViewServiceSessionActivityRecord *mostActiveViewServiceSession;
  unint64_t v13;
  NSObject *v14;
  _UIViewServiceSessionActivityRecord *v15;
  NSObject *v16;
  void *v17;
  int v18;
  _UIPhysicalButtonInteractionArbiter *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "_screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_userInterfaceIdiom");

  v8 = _UIActiveViewServiceSessionEffectiveIdiomForIdiom(v7);
  objc_msgSend(a3, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("_UIActiveViewServiceSessionChangingIdiomKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "integerValue") == v8)
  {
    -[_UIPhysicalButtonInteractionArbiter _mostActiveViewServiceSessionForScene]((uint64_t)self);
    v11 = (_UIViewServiceSessionActivityRecord *)objc_claimAutoreleasedReturnValue();
    mostActiveViewServiceSession = self->_mostActiveViewServiceSession;
    self->_mostActiveViewServiceSession = v11;

    v13 = _mostActiveViewServiceSessionDidChange____s_category;
    if (!_mostActiveViewServiceSessionDidChange____s_category)
    {
      v13 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&_mostActiveViewServiceSessionDidChange____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_mostActiveViewServiceSession;
      v16 = v14;
      -[_UIViewServiceSessionActivityRecord succinctDescription](v15, "succinctDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 134349314;
      v19 = self;
      v20 = 2112;
      v21 = v17;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: received new most active view service session: %@", (uint8_t *)&v18, 0x16u);

    }
    -[_UIPhysicalButtonInteractionArbiter _resolveConfigurations]((uint64_t)self);
  }

}

- (id)_registerViewServiceObserver:(id *)a1
{
  id *v2;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  id *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  objc_class *v25;
  void *v26;
  __CFString *v27;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id from;
  id location;
  uint8_t buf[4];
  id *v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v2 = a1;
  v42 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "_scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
      goto LABEL_18;
    v6 = objc_msgSend(v4, "_hasInvalidated");

    if ((v6 & 1) != 0)
      goto LABEL_18;
    if (objc_msgSend(v2[18], "containsObject:", a2))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerViewServiceObserver_, v2, CFSTR("_UIPhysicalButtonInteractionArbiter.m"), 1833, CFSTR("%s: View service observer is already registered with arbiter: viewServiceObserver: %@; arbiter: %@"),
        "-[_UIPhysicalButtonInteractionArbiter _registerViewServiceObserver:]",
        a2,
        v2);
LABEL_17:

LABEL_18:
      v2 = 0;
      return v2;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(a2, "isMemberOfClass:", objc_opt_class()) & 1) == 0
      && (objc_msgSend(a2, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerViewServiceObserver_, v2, CFSTR("_UIPhysicalButtonInteractionArbiter.m"), 1844, CFSTR("%s: Invalid view service observer attempting registration with arbiter: viewServiceObserver: %@; arbiter: %@"),
        "-[_UIPhysicalButtonInteractionArbiter _registerViewServiceObserver:]",
        a2,
        v2);
      goto LABEL_17;
    }
    if (!v2[18])
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v2[18];
      v2[18] = (id)v8;

    }
    objc_initWeak(&location, v2);
    objc_initWeak(&from, a2);
    v10 = ++qword_1ECD80360;
    v11 = (objc_class *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%p-%lu"), class_getName(v11), a2, v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = v2;
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p>"), v16, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "stringWithFormat:", CFSTR("Registering view service observer with: %@"), v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0D01868]);
    v19 = MEMORY[0x1E0C80D38];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __68___UIPhysicalButtonInteractionArbiter__registerViewServiceObserver___block_invoke;
    v31[3] = &unk_1E16CD530;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    v20 = (void *)objc_msgSend(v18, "initWithIdentifier:forReason:queue:invalidationBlock:", v30, v29, MEMORY[0x1E0C80D38], v31);

    v21 = qword_1ECD80330;
    if (!qword_1ECD80330)
    {
      v21 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&qword_1ECD80330);
    }
    v22 = *(id *)(v21 + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = a2;
      if (v23)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@: %p>"), v26, v23);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v27 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 134349570;
      v37 = v13;
      v38 = 2112;
      v39 = v27;
      v40 = 2112;
      v41 = v20;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: registered view service observer: %@ with registrationToken: %@", buf, 0x20u);

    }
    objc_msgSend(v2[18], "addObject:", a2);
    v2 = v20;
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)_handleBSAction:(uint64_t)a1
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *, void *);
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = qword_1ECD80338;
    if (!qword_1ECD80338)
    {
      v4 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&qword_1ECD80338);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v26 = a1;
      v27 = 2112;
      v28 = a2;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: received BSAction: %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 112), "configurations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __55___UIPhysicalButtonInteractionArbiter__handleBSAction___block_invoke;
    v24[3] = &unk_1E16E1550;
    v24[4] = a2;
    objc_msgSend(v6, "_configurationPassingTest:", v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 112), "configurationToInteractionMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v10, "_isProxyInteraction") & 1) != 0)
      {
        -[_UIPhysicalButtonInteraction _bsActionDriver](v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_handleBSAction:", a2);
LABEL_21:

LABEL_22:
LABEL_23:

        return;
      }
      if (objc_msgSend(a2, "behavior") == 2)
      {
        -[_UIEvaluatedObjectCache sortedObjects](*(id **)(a1 + 72));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v7;
        v18 = 3221225472;
        v19 = __55___UIPhysicalButtonInteractionArbiter__handleBSAction___block_invoke_202;
        v20 = &unk_1E16E1578;
        v21 = a1;
        v22 = v8;
        v23 = a2;
        objc_msgSend(v15, "enumerateObjectsWithOptions:usingBlock:", 2, &v17);

      }
      else
      {
        -[_UIPhysicalButtonInteraction _bsActionDriver](v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_handleBSAction:", a2);

      }
      if (!objc_msgSend(a2, "canSendResponse", v17, v18, v19, v20, v21))
        goto LABEL_22;
      objc_msgSend(MEMORY[0x1E0D016A8], "response");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = qword_1ECD80340;
      if (!qword_1ECD80340)
      {
        v12 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD80340);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349570;
        v26 = a1;
        v27 = 2112;
        v28 = a2;
        v29 = 2112;
        v30 = v6;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter: dropping action as there is no matching configuration in resolved configurations; action"
          ": %@; resolved configurations: %@",
          buf,
          0x20u);
      }
      if (!objc_msgSend(a2, "canSendResponse"))
        goto LABEL_23;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIPhysicalButtonBSActionErrorDomain"), 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D016A8], "responseForError:", v10);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v14;
    objc_msgSend(a2, "sendResponse:", v14);
    goto LABEL_21;
  }
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIPhysicalButtonInteractionArbiter debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIPhysicalButtonInteractionArbiter succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  unint64_t resolutionStrategy;
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  resolutionStrategy = self->_resolutionStrategy;
  v6 = &stru_1E16EDF20;
  if (resolutionStrategy == 1)
    v6 = CFSTR("viewServices");
  if (resolutionStrategy)
    v7 = v6;
  else
    v7 = CFSTR("sceneClientSettings");
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("resolutionStrategy"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", (*(_BYTE *)&self->_arbiterFlags >> 1) & 1, CFSTR("hasScheduledDeferredConfigurationResolution"));
  -[_UIPhysicalButtonConfigurationResolutionContext configurations](self->_sceneConfigurationResolutionContext, "configurations");
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  _UIPhysicalButtonSuccinctConfigurationsDescriptionForSet(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "appendObject:withName:", v10, CFSTR("resolvedConfigurations"));

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonInteractionArbiter descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonInteractionArbiter descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UIPhysicalButtonInteractionArbiter *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

- (_UIPhysicalButtonInteractionArbiterSystemShellDelegate)systemShellDelegate
{
  return (_UIPhysicalButtonInteractionArbiterSystemShellDelegate *)objc_loadWeakRetained((id *)&self->_systemShellDelegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDeferringTokenByEnvironment, 0);
  objc_storeStrong((id *)&self->_viewServiceObservers, 0);
  objc_storeStrong((id *)&self->_mostActiveViewServiceSession, 0);
  objc_storeStrong((id *)&self->_systemShellWindowConfigurationResolutionContexts, 0);
  objc_storeStrong((id *)&self->_systemShellWindowsRequiringResolution, 0);
  objc_storeStrong((id *)&self->_sceneConfigurationResolutionContext, 0);
  objc_storeStrong((id *)&self->_deferredConfigurationResolutionDisplayLink, 0);
  objc_storeStrong((id *)&self->_windowPointersObservedForLevelChanges, 0);
  objc_storeStrong((id *)&self->_countedWindowPointerValues, 0);
  objc_storeStrong((id *)&self->_trackedWindowPointers, 0);
  objc_storeStrong((id *)&self->_registeredAndSortedInteractions, 0);
  objc_destroyWeak((id *)&self->_systemShellDelegate);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_uniqueConfigurationGenerationNumbers, 0);
  objc_storeStrong(&self->_interactionValidationBlock, 0);
  objc_storeStrong(&self->_viewServiceValidationBlock, 0);
}

@end
