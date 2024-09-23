@implementation CarCardsUpdate

- (CarCardsUpdate)init
{
  CarCardsUpdate *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *deletionsByKey;
  NSMutableDictionary *v5;
  NSMutableDictionary *reloadsByKey;
  NSMutableDictionary *v7;
  NSMutableDictionary *insertionsByKey;
  NSMutableArray *v9;
  NSMutableArray *completionBlocks;
  uint64_t v11;
  NSMapTable *updatesByConfiguration;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CarCardsUpdate;
  v2 = -[CarCardsUpdate init](&v14, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deletionsByKey = v2->_deletionsByKey;
    v2->_deletionsByKey = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    reloadsByKey = v2->_reloadsByKey;
    v2->_reloadsByKey = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    insertionsByKey = v2->_insertionsByKey;
    v2->_insertionsByKey = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    updatesByConfiguration = v2->_updatesByConfiguration;
    v2->_updatesByConfiguration = (NSMapTable *)v11;

  }
  return v2;
}

- (BOOL)hasUpdates
{
  return -[NSMutableDictionary count](self->_deletionsByKey, "count")
      || -[NSMutableDictionary count](self->_reloadsByKey, "count")
      || -[NSMutableDictionary count](self->_insertionsByKey, "count") != 0;
}

- (unint64_t)incrementNestCounter
{
  unint64_t v2;

  v2 = self->_nestCounter + 1;
  self->_nestCounter = v2;
  return v2;
}

- (unint64_t)decrementNestCounter
{
  unint64_t nestCounter;
  unint64_t result;

  nestCounter = self->_nestCounter;
  if (!nestCounter)
    return 0;
  result = nestCounter - 1;
  self->_nestCounter = nestCounter - 1;
  return result;
}

- (void)addCompletionBlock:(id)a3
{
  NSMutableArray *completionBlocks;
  id v4;
  id v5;

  if (a3)
  {
    completionBlocks = self->_completionBlocks;
    v5 = objc_msgSend(a3, "copy");
    v4 = objc_retainBlock(v5);
    -[NSMutableArray addObject:](completionBlocks, "addObject:", v4);

  }
}

- (void)runCompletionBlocks
{
  id v3;
  NSMutableArray *completionBlocks;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = -[NSMutableArray copy](self->_completionBlocks, "copy");
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deletionsByKey, "allValues", (_QWORD)v14));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_reloadsByKey, "allValues"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_insertionsByKey, "allValues"));
        (*(void (**)(uint64_t, void *, void *, void *))(v10 + 16))(v10, v11, v12, v13);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (id)pendingDeletedConfigurationForKey:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_deletionsByKey, "objectForKeyedSubscript:", a3);
}

- (id)pendingDeletedConfigurations
{
  return -[NSMutableDictionary allValues](self->_deletionsByKey, "allValues");
}

- (void)deleteCardConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  CarCardsUpdate *v8;
  CarCardsUpdate *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key"));
  if (v5)
  {
    v6 = sub_100A040E4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      -[NSMutableDictionary removeObjectForKey:](self->_insertionsByKey, "removeObjectForKey:", v5);
      -[NSMutableDictionary removeObjectForKey:](self->_reloadsByKey, "removeObjectForKey:", v5);
      -[NSMapTable removeObjectForKey:](self->_updatesByConfiguration, "removeObjectForKey:", v4);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deletionsByKey, "setObject:forKeyedSubscript:", v4, v5);
      goto LABEL_13;
    }
    v8 = self;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_9;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_9:

LABEL_11:
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key"));
    *(_DWORD *)buf = 138543618;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Adding deletion for \"%@\", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:

}

- (void)reloadCardConfiguration:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  CarCardsUpdate *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMapTable *updatesByConfiguration;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "key"));
  if (!v8)
    goto LABEL_12;
  -[NSMutableDictionary removeObjectForKey:](self->_deletionsByKey, "removeObjectForKey:", v8);
  -[NSMutableDictionary removeObjectForKey:](self->_insertionsByKey, "removeObjectForKey:", v8);
  v9 = sub_100A040E4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = self;
    v12 = (objc_class *)objc_opt_class(v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_8;
      }

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_8:

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "key"));
    *(_DWORD *)buf = 138543618;
    v22 = v17;
    v23 = 2112;
    v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Adding reload for \"%@\", buf, 0x16u);

  }
  if (v7)
  {
    updatesByConfiguration = self->_updatesByConfiguration;
    v20 = objc_retainBlock(v7);
    -[NSMapTable setObject:forKey:](updatesByConfiguration, "setObject:forKey:", v20, v6);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reloadsByKey, "setObject:forKeyedSubscript:", v6, v8);
LABEL_12:

}

- (void)insertCardConfiguration:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  CarCardsUpdate *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  NSMapTable *updatesByConfiguration;
  id v24;
  CarCardsUpdate *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "key"));
  if (!v8)
    goto LABEL_23;
  -[NSMutableDictionary removeObjectForKey:](self->_deletionsByKey, "removeObjectForKey:", v8);
  v9 = objc_msgSend(v6, "isHidden");
  v10 = sub_100A040E4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if ((v9 & 1) == 0)
  {
    if (!v12)
    {
LABEL_22:

      -[CarCardsUpdate reloadCardConfiguration:block:](self, "reloadCardConfiguration:block:", v6, v7);
      goto LABEL_23;
    }
    v25 = self;
    v26 = (objc_class *)objc_opt_class(v25);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
      v30 = v29;
      if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

        goto LABEL_21;
      }

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_21:

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "key"));
    *(_DWORD *)buf = 138543618;
    v34 = v31;
    v35 = 2112;
    v36 = (uint64_t)v32;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] Attempted insert of \"%@\" is already visible, assuming reload instead", buf, 0x16u);

    goto LABEL_22;
  }
  if (v12)
  {
    v13 = self;
    v14 = (objc_class *)objc_opt_class(v13);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_9;
      }

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_9:

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "key"));
    v21 = (void *)v20;
    v22 = CFSTR("block");
    *(_DWORD *)buf = 138543874;
    v34 = v19;
    v35 = 2112;
    if (!v7)
      v22 = CFSTR("no block");
    v36 = v20;
    v37 = 2112;
    v38 = v22;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] Adding insertion for \"%@\" with %@", buf, 0x20u);

  }
  if (v7)
  {
    updatesByConfiguration = self->_updatesByConfiguration;
    v24 = objc_retainBlock(v7);
    -[NSMapTable setObject:forKey:](updatesByConfiguration, "setObject:forKey:", v24, v6);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_insertionsByKey, "setObject:forKeyedSubscript:", v6, v8);
  -[NSMutableDictionary removeObjectForKey:](self->_reloadsByKey, "removeObjectForKey:", v8);
LABEL_23:

}

- (void)validateUpdatesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  if (v4)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deletionsByKey, "allValues"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100A04860;
    v16[3] = &unk_1011DF830;
    v6 = v4;
    v16[4] = self;
    v17 = v6;
    v18 = &v19;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v16);
    if (!*((_BYTE *)v20 + 24))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_reloadsByKey, "allValues"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100A04920;
      v13[3] = &unk_1011DF830;
      v8 = v6;
      v13[4] = self;
      v14 = v8;
      v15 = &v19;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
      if (!*((_BYTE *)v20 + 24))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_insertionsByKey, "allValues"));
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100A049F0;
        v10[3] = &unk_1011DF830;
        v10[4] = self;
        v11 = v8;
        v12 = &v19;
        objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

      }
    }

    _Block_object_dispose(&v19, 8);
  }

}

- (void)run
{
  id v3;
  NSObject *v4;
  CarCardsUpdate *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  int v13;
  id v14;
  NSObject *v15;
  CarCardsUpdate *v16;
  CarCardsUpdate *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  CarCardsUpdate *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  const __CFString *v37;
  id v38;
  id v39;
  id v40;
  NSObject *v41;
  CarCardsUpdate *v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  const __CFString *v50;
  id v51;
  id v52;
  _BOOL4 v53;
  id v54;
  id v55;
  id v56;
  id v57;
  NSObject *v58;
  CarCardsUpdate *v59;
  objc_class *v60;
  NSString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  CarCardsUpdate *v72;
  objc_class *v73;
  NSString *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  __CFString *v79;
  __CFString *v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  id v86;
  NSObject *v87;
  CarCardsUpdate *v88;
  objc_class *v89;
  NSString *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  __CFString *v95;
  const __CFString *v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  void *k;
  void *v102;
  id v103;
  NSObject *v104;
  CarCardsUpdate *v105;
  CarCardsUpdate *v106;
  objc_class *v107;
  NSString *v108;
  void *v109;
  void *v110;
  void *v111;
  __CFString *v112;
  id v113;
  NSObject *v114;
  CarCardsUpdate *v115;
  objc_class *v116;
  NSString *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  __CFString *v122;
  const __CFString *v123;
  id v124;
  NSObject *v125;
  CarCardsUpdate *v126;
  objc_class *v127;
  NSString *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  __CFString *v133;
  const __CFString *v134;
  void *v135;
  id v136;
  id v137;
  id v138;
  uint64_t v139;
  void *i;
  id v141;
  NSObject *v142;
  CarCardsUpdate *v143;
  CarCardsUpdate *v144;
  objc_class *v145;
  NSString *v146;
  void *v147;
  void *v148;
  void *v149;
  __CFString *v150;
  __CFString *v151;
  const __CFString *v152;
  void *v153;
  id v154;
  NSObject *v155;
  CarCardsUpdate *v156;
  CarCardsUpdate *v157;
  objc_class *v158;
  NSString *v159;
  void *v160;
  void *v161;
  void *v162;
  __CFString *v163;
  __CFString *v164;
  const __CFString *v165;
  id v166;
  id v167;
  id v168;
  uint64_t v169;
  void *m;
  void *v171;
  id v172;
  NSObject *v173;
  CarCardsUpdate *v174;
  CarCardsUpdate *v175;
  objc_class *v176;
  NSString *v177;
  void *v178;
  void *v179;
  void *v180;
  __CFString *v181;
  __CFString *v182;
  __CFString *v183;
  const __CFString *v184;
  id v185;
  NSObject *v186;
  CarCardsUpdate *v187;
  CarCardsUpdate *v188;
  objc_class *v189;
  NSString *v190;
  void *v191;
  void *v192;
  void *v193;
  __CFString *v194;
  __CFString *v195;
  const __CFString *v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  NSObject *v202;
  CarCardsUpdate *v203;
  CarCardsUpdate *v204;
  objc_class *v205;
  NSString *v206;
  void *v207;
  void *v208;
  void *v209;
  __CFString *v210;
  __CFString *v211;
  double v212;
  id v213;
  id v214;
  _QWORD *v215;
  void **p_vtable;
  void *v217;
  void *v218;
  double v219;
  double v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  uint64_t v225;
  void *v226;
  void *v227;
  unsigned __int8 v228;
  id v229;
  NSObject *v230;
  CarCardsUpdate *v231;
  CarCardsUpdate *v232;
  objc_class *v233;
  NSString *v234;
  void *v235;
  void *v236;
  void *v237;
  __CFString *v238;
  id v239;
  NSObject *v240;
  CarCardsUpdate *v241;
  CarCardsUpdate *v242;
  objc_class *v243;
  NSString *v244;
  void *v245;
  void *v246;
  void *v247;
  __CFString *v248;
  id v249;
  NSObject *v250;
  CarCardsUpdate *v251;
  CarCardsUpdate *v252;
  objc_class *v253;
  NSString *v254;
  void *v255;
  void *v256;
  void *v257;
  __CFString *v258;
  __CFString *v259;
  void *v260;
  __CFString *v261;
  __CFString *v262;
  id v263;
  id v264;
  id v265;
  uint64_t v266;
  void *j;
  uint64_t v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  id v275;
  id v276;
  id v277;
  void *v278;
  id v279;
  void *v280;
  id v281;
  void *v282;
  _QWORD v283[4];
  id v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  _QWORD v289[5];
  id v290;
  _QWORD v291[5];
  id v292;
  _QWORD v293[5];
  _QWORD v294[5];
  id v295;
  _QWORD v296[5];
  id v297;
  _QWORD v298[5];
  id v299;
  _QWORD v300[5];
  id v301;
  _QWORD v302[5];
  id v303;
  _QWORD v304[5];
  id v305;
  _QWORD v306[5];
  id v307;
  _QWORD v308[5];
  id v309;
  _QWORD v310[5];
  id v311;
  _QWORD v312[4];
  id v313;
  CarCardsUpdate *v314;
  id v315;
  id v316;
  id v317;
  id v318;
  id v319;
  id v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  id v333;
  id v334;
  id v335;
  id v336;
  uint8_t v337[128];
  uint8_t buf[4];
  __CFString *v339;
  __int16 v340;
  const __CFString *v341;
  __int16 v342;
  id v343;
  __int16 v344;
  id v345;
  __int16 v346;
  id v347;
  __int16 v348;
  id v349;
  _BYTE v350[128];
  _BYTE v351[128];
  _BYTE v352[128];

  if (!-[CarCardsUpdate hasUpdates](self, "hasUpdates"))
  {
    v14 = sub_100A040E4();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
LABEL_98:

      -[CarCardsUpdate runCompletionBlocks](self, "runCompletionBlocks");
      return;
    }
    v16 = self;
    v17 = v16;
    if (!v16)
    {
      v23 = CFSTR("<nil>");
      goto LABEL_97;
    }
    v18 = (objc_class *)objc_opt_class(v16);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_20;
      }

    }
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_20:

LABEL_97:
    *(_DWORD *)buf = 138543362;
    v339 = v23;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] Nothing to update, run completion blocks and exit", buf, 0xCu);

    goto LABEL_98;
  }
  if (!self->_animated)
  {
LABEL_12:
    v13 = 0;
    goto LABEL_22;
  }
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v3 = sub_100A040E4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_11:

      goto LABEL_12;
    }
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_10;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_10:

    v12 = v11;
    *(_DWORD *)buf = 138543362;
    v339 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Reduce motion enabled, running cards update without animation", buf, 0xCu);

    goto LABEL_11;
  }
  v13 = 1;
LABEL_22:
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deletionsByKey, "allValues"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_reloadsByKey, "allValues"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_insertionsByKey, "allValues"));
  v27 = sub_100A040E4();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  v282 = v26;
  if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    goto LABEL_29;
  v29 = self;
  v30 = (objc_class *)objc_opt_class(v29);
  v31 = NSStringFromClass(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  if ((objc_opt_respondsToSelector(v29, "accessibilityIdentifier") & 1) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v29, "performSelector:", "accessibilityIdentifier"));
    v34 = v33;
    if (v33 && !objc_msgSend(v33, "isEqualToString:", v32))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v32, v29, v34));

      goto LABEL_28;
    }

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v32, v29));
LABEL_28:

  v36 = v35;
  v37 = (const __CFString *)objc_msgSend(v24, "count");
  v38 = objc_msgSend(v25, "count");
  v26 = v282;
  v39 = objc_msgSend(v282, "count");
  *(_DWORD *)buf = 138544130;
  v339 = v36;
  v340 = 2048;
  v341 = v37;
  v342 = 2048;
  v343 = v38;
  v344 = 2048;
  v345 = v39;
  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%{public}@] %lu deletions, %lu reloads, %lu insertions", buf, 0x2Au);

LABEL_29:
  if (!objc_msgSend(v26, "count"))
    goto LABEL_38;
  v40 = sub_100A040E4();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = self;
    v43 = (objc_class *)objc_opt_class(v42);
    v44 = NSStringFromClass(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    if ((objc_opt_respondsToSelector(v42, "accessibilityIdentifier") & 1) != 0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v42, "performSelector:", "accessibilityIdentifier"));
      v47 = v46;
      if (v46 && !objc_msgSend(v46, "isEqualToString:", v45))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v45, v42, v47));

        goto LABEL_36;
      }

    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v45, v42));
LABEL_36:

    v49 = v48;
    v26 = v282;
    v50 = (const __CFString *)objc_msgSend(v282, "count");
    *(_DWORD *)buf = 138543618;
    v339 = v49;
    v340 = 2048;
    v341 = v50;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[%{public}@] %lu insertions, perform updates immediately", buf, 0x16u);

  }
  -[CarCardsUpdate _runUpdatesForConfigurations:allowAnimations:](self, "_runUpdatesForConfigurations:allowAnimations:", v26, 0);
LABEL_38:
  v336 = 0;
  v335 = 0;
  -[CarCardsUpdate _configurations:getVisible:hidden:](self, "_configurations:getVisible:hidden:", v24, &v336, &v335);
  v279 = v336;
  v51 = v335;
  v278 = v51;
  if (objc_msgSend(v51, "count"))
  {
    v52 = objc_msgSend(v51, "count");
    v53 = v52 == objc_msgSend(v24, "count");
  }
  else
  {
    v53 = 0;
  }
  v334 = 0;
  v333 = 0;
  -[CarCardsUpdate _configurations:getVisible:hidden:](self, "_configurations:getVisible:hidden:", v25, &v334, &v333);
  v281 = v334;
  v54 = v333;
  v280 = v54;
  if (objc_msgSend(v54, "count"))
  {
    v55 = objc_msgSend(v54, "count");
    v56 = objc_msgSend(v25, "count");
    if (v13)
    {
      if (v55 == v56 && v53 && !objc_msgSend(v26, "count"))
      {
        v57 = sub_100A040E4();
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
LABEL_53:

          v13 = 0;
          goto LABEL_54;
        }
        v59 = self;
        v60 = (objc_class *)objc_opt_class(v59);
        v61 = NSStringFromClass(v60);
        v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        if ((objc_opt_respondsToSelector(v59, "accessibilityIdentifier") & 1) != 0)
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v59, "performSelector:", "accessibilityIdentifier"));
          v64 = v63;
          if (v63 && !objc_msgSend(v63, "isEqualToString:", v62))
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v62, v59, v64));

            goto LABEL_52;
          }

        }
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v62, v59));
LABEL_52:

        v66 = v65;
        *(_DWORD *)buf = 138543362;
        v339 = v66;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "[%{public}@] Only updates are hidden reloads or deletions, not animating", buf, 0xCu);

        v26 = v282;
        goto LABEL_53;
      }
    }
  }
LABEL_54:
  if (objc_msgSend(v24, "count"))
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate delegate](self, "delegate"));
    objc_msgSend(v67, "cardsUpdate:prepareForUpdate:withCardConfigurations:", self, 0, v24);

  }
  if (objc_msgSend(v25, "count"))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate delegate](self, "delegate"));
    objc_msgSend(v68, "cardsUpdate:prepareForUpdate:withCardConfigurations:", self, 1, v25);

  }
  if (objc_msgSend(v26, "count"))
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate delegate](self, "delegate"));
    objc_msgSend(v69, "cardsUpdate:prepareForUpdate:withCardConfigurations:", self, 2, v26);

  }
  v70 = sub_100A040E4();
  v71 = objc_claimAutoreleasedReturnValue(v70);
  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
  {
    v72 = self;
    v73 = (objc_class *)objc_opt_class(v72);
    v74 = NSStringFromClass(v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
    if ((objc_opt_respondsToSelector(v72, "accessibilityIdentifier") & 1) != 0)
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v72, "performSelector:", "accessibilityIdentifier"));
      v77 = v76;
      if (v76 && !objc_msgSend(v76, "isEqualToString:", v75))
      {
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v75, v72, v77));

        goto LABEL_66;
      }

    }
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v75, v72));
LABEL_66:

    v79 = v78;
    v80 = v79;
    v81 = CFSTR("not ");
    if (v13)
      v81 = &stru_1011EB268;
    *(_DWORD *)buf = 138543618;
    v339 = v79;
    v340 = 2112;
    v341 = v81;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "[%{public}@] Updates will %@run animated", buf, 0x16u);

    v26 = v282;
  }

  if ((v13 & 1) != 0)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate parentAnimation](self, "parentAnimation"));
    if (v82)
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate parentAnimation](self, "parentAnimation"));
      objc_msgSend(v83, "duration");
      v85 = v84;

    }
    else
    {
      v85 = 1.0;
    }

    if (!objc_msgSend(v280, "count"))
    {
LABEL_109:
      if (!objc_msgSend(v278, "count"))
        goto LABEL_125;
      v124 = sub_100A040E4();
      v125 = objc_claimAutoreleasedReturnValue(v124);
      if (!os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
      {
LABEL_117:
        v135 = v24;

        v323 = 0u;
        v324 = 0u;
        v321 = 0u;
        v322 = 0u;
        v136 = v278;
        v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v321, v350, 16);
        if (v137)
        {
          v138 = v137;
          v139 = *(_QWORD *)v322;
          do
          {
            for (i = 0; i != v138; i = (char *)i + 1)
            {
              if (*(_QWORD *)v322 != v139)
                objc_enumerationMutation(v136);
              objc_msgSend(*(id *)(*((_QWORD *)&v321 + 1) + 8 * (_QWORD)i), "reset");
            }
            v138 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v321, v350, 16);
          }
          while (v138);
        }

        v24 = v135;
LABEL_125:
        if (!objc_msgSend(v26, "count"))
          goto LABEL_177;
        v141 = sub_100A040E4();
        v142 = objc_claimAutoreleasedReturnValue(v141);
        if (!os_log_type_enabled(v142, OS_LOG_TYPE_INFO))
        {
LABEL_176:

          -[CarCardsUpdate _applyAndPerformLayoutForConfigurations:allowAnimations:](self, "_applyAndPerformLayoutForConfigurations:allowAnimations:", v26, 0);
LABEL_177:
          v320 = 0;
          v319 = 0;
          v318 = 0;
          -[CarCardsUpdate _runUpdatesForConfigurations:allowAnimations:layoutReloads:contentReloads:otherReloads:](self, "_runUpdatesForConfigurations:allowAnimations:layoutReloads:contentReloads:otherReloads:", v281, 0, &v320, &v319, &v318);
          v276 = v320;
          v277 = v319;
          v275 = v318;
          if (!objc_msgSend(v25, "count"))
            goto LABEL_189;
          v185 = sub_100A040E4();
          v186 = objc_claimAutoreleasedReturnValue(v185);
          if (!os_log_type_enabled(v186, OS_LOG_TYPE_INFO))
          {
LABEL_188:

LABEL_189:
            v201 = sub_100A040E4();
            v202 = objc_claimAutoreleasedReturnValue(v201);
            if (!os_log_type_enabled(v202, OS_LOG_TYPE_INFO))
              goto LABEL_199;
            v203 = self;
            v204 = v203;
            if (!v203)
            {
              v210 = CFSTR("<nil>");
              goto LABEL_198;
            }
            v205 = (objc_class *)objc_opt_class(v203);
            v206 = NSStringFromClass(v205);
            v207 = (void *)objc_claimAutoreleasedReturnValue(v206);
            if ((objc_opt_respondsToSelector(v204, "accessibilityIdentifier") & 1) != 0)
            {
              v208 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v204, "performSelector:", "accessibilityIdentifier"));
              v209 = v208;
              if (v208 && !objc_msgSend(v208, "isEqualToString:", v207))
              {
                v210 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v207, v204, v209));

                goto LABEL_196;
              }

            }
            v210 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v207, v204));
LABEL_196:

LABEL_198:
            v211 = v210;
            *(_DWORD *)buf = 138543362;
            v339 = v211;
            _os_log_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_INFO, "[%{public}@] Starting animated update chain", buf, 0xCu);

            v26 = v282;
LABEL_199:
            v212 = v85 * 0.25;

            v312[0] = _NSConcreteStackBlock;
            v312[1] = 3221225472;
            v312[2] = sub_100A06D78;
            v312[3] = &unk_1011DF858;
            v213 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
            v313 = v213;
            v314 = self;
            v315 = v24;
            v316 = v25;
            v214 = v26;
            v317 = v214;
            v215 = objc_retainBlock(v312);
            p_vtable = NonFocusableSwitch.vtable;
            v274 = v215;
            if (objc_msgSend(v281, "count"))
            {
              v217 = (void *)objc_claimAutoreleasedReturnValue(+[GroupAnimation animation](GroupAnimation, "animation"));
              objc_msgSend(v217, "setDuration:", v85 * 0.25);
              objc_msgSend(v217, "setOptions:", 0x20000);
              v218 = v276;
              if (objc_msgSend(v277, "count"))
              {
                v310[0] = _NSConcreteStackBlock;
                v310[1] = 3221225472;
                v310[2] = sub_100A07270;
                v310[3] = &unk_1011AC8B0;
                v310[4] = self;
                v311 = v277;
                v308[0] = _NSConcreteStackBlock;
                v308[1] = 3221225472;
                v308[2] = sub_100A07420;
                v308[3] = &unk_1011ACCB8;
                v308[4] = self;
                v309 = v311;
                objc_msgSend(v217, "addAnimations:completion:", v310, v308);

              }
              if (objc_msgSend(v276, "count"))
              {
                v306[0] = _NSConcreteStackBlock;
                v306[1] = 3221225472;
                v306[2] = sub_100A075BC;
                v306[3] = &unk_1011AC8B0;
                v306[4] = self;
                v307 = v276;
                v304[0] = _NSConcreteStackBlock;
                v304[1] = 3221225472;
                v304[2] = sub_100A077B4;
                v304[3] = &unk_1011ACCB8;
                v304[4] = self;
                v305 = v307;
                objc_msgSend(v217, "addAnimations:completion:", v306, v304);

              }
              if (objc_msgSend(v275, "count"))
              {
                v302[0] = _NSConcreteStackBlock;
                v302[1] = 3221225472;
                v302[2] = sub_100A07960;
                v302[3] = &unk_1011ACCB8;
                v302[4] = self;
                v303 = v275;
                objc_msgSend(v217, "addAnimations:completion:", 0, v302);

              }
              objc_msgSend(v217, "addAnimations:completion:", 0, v215);
              objc_msgSend(v213, "addObject:", v217);

              v219 = v85;
              p_vtable = (void **)(NonFocusableSwitch + 24);
            }
            else
            {
              v219 = v85 - v212;
              v218 = v276;
            }
            v220 = v85 * 0.5;
            if (objc_msgSend(v279, "count") || objc_msgSend(v218, "count") || objc_msgSend(v214, "count"))
            {
              v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_vtable + 392, "animation"));
              objc_msgSend(v221, "setDuration:", v220);
              objc_msgSend(v221, "setSpringDamping:", 0.800000012);
              objc_msgSend(v221, "setInitialVelocity:", 0.100000001);
              objc_msgSend(v221, "setOptions:", 0);
              if (objc_msgSend(v279, "count"))
              {
                v300[0] = _NSConcreteStackBlock;
                v300[1] = 3221225472;
                v300[2] = sub_100A07AFC;
                v300[3] = &unk_1011AC8B0;
                v300[4] = self;
                v301 = v279;
                v298[0] = _NSConcreteStackBlock;
                v298[1] = 3221225472;
                v298[2] = sub_100A07D44;
                v298[3] = &unk_1011ACCB8;
                v298[4] = self;
                v299 = v301;
                objc_msgSend(v221, "addAnimations:completion:", v300, v298);

              }
              v218 = v276;
              if (objc_msgSend(v276, "count"))
              {
                v296[0] = _NSConcreteStackBlock;
                v296[1] = 3221225472;
                v296[2] = sub_100A07F6C;
                v296[3] = &unk_1011AC8B0;
                v296[4] = self;
                v297 = v276;
                objc_msgSend(v221, "addAnimations:completion:", v296, 0);

              }
              if (objc_msgSend(v214, "count"))
              {
                v294[0] = _NSConcreteStackBlock;
                v294[1] = 3221225472;
                v294[2] = sub_100A0812C;
                v294[3] = &unk_1011AC8B0;
                v294[4] = self;
                v295 = v214;
                objc_msgSend(v221, "addAnimations:completion:", v294, 0);

              }
              if (objc_msgSend(v221, "hasAnimations"))
              {
                v293[0] = _NSConcreteStackBlock;
                v293[1] = 3221225472;
                v293[2] = sub_100A08380;
                v293[3] = &unk_1011AC860;
                v293[4] = self;
                objc_msgSend(v221, "addAnimations:completion:", v293, v215);
              }
              objc_msgSend(v213, "addObject:", v221);

            }
            else
            {
              v219 = v219 - v220;
            }
            v222 = v277;
            if (objc_msgSend(v277, "count"))
            {
              v223 = (void *)objc_claimAutoreleasedReturnValue(+[GroupAnimation animation](GroupAnimation, "animation"));
              objc_msgSend(v223, "setDuration:", v212);
              objc_msgSend(v223, "setOptions:", 0x10000);
              if (objc_msgSend(v277, "count"))
              {
                v291[0] = _NSConcreteStackBlock;
                v291[1] = 3221225472;
                v291[2] = sub_100A0838C;
                v291[3] = &unk_1011AC8B0;
                v291[4] = self;
                v292 = v277;
                v289[0] = _NSConcreteStackBlock;
                v289[1] = 3221225472;
                v289[2] = sub_100A0853C;
                v289[3] = &unk_1011ACCB8;
                v289[4] = self;
                v290 = v292;
                objc_msgSend(v223, "addAnimations:completion:", v291, v289);

              }
              objc_msgSend(v223, "addAnimations:completion:", 0, v215);
              objc_msgSend(v213, "addObject:", v223);

            }
            else
            {
              v219 = v219 - v212;
            }
            v26 = v282;
            v224 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isEmpty == NO")));
            objc_msgSend(v213, "filterUsingPredicate:", v224);

            if (objc_msgSend(v213, "count"))
            {
              v225 = objc_claimAutoreleasedReturnValue(-[CarCardsUpdate parentAnimation](self, "parentAnimation"));
              if (!v225
                || (v226 = (void *)v225,
                    v227 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate parentAnimation](self, "parentAnimation")),
                    v228 = objc_msgSend(v227, "hasStarted"),
                    v227,
                    v226,
                    (v228 & 1) != 0))
              {
                v229 = sub_100A040E4();
                v230 = objc_claimAutoreleasedReturnValue(v229);
                v222 = v277;
                if (!os_log_type_enabled(v230, OS_LOG_TYPE_INFO))
                {
LABEL_256:

                  v260 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v213, "firstObject"));
                  objc_msgSend(v260, "runWithCurrentOptions");

LABEL_279:
                  goto LABEL_280;
                }
                v231 = self;
                v232 = v231;
                if (!v231)
                {
                  v238 = CFSTR("<nil>");
                  goto LABEL_255;
                }
                v233 = (objc_class *)objc_opt_class(v231);
                v234 = NSStringFromClass(v233);
                v235 = (void *)objc_claimAutoreleasedReturnValue(v234);
                if ((objc_opt_respondsToSelector(v232, "accessibilityIdentifier") & 1) != 0)
                {
                  v236 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v232, "performSelector:", "accessibilityIdentifier"));
                  v237 = v236;
                  if (v236 && !objc_msgSend(v236, "isEqualToString:", v235))
                  {
                    v238 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v235, v232, v237));

                    goto LABEL_235;
                  }

                }
                v238 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v235, v232));
LABEL_235:

                v222 = v277;
LABEL_255:

                v259 = v238;
                *(_DWORD *)buf = 138543362;
                v339 = v259;
                _os_log_impl((void *)&_mh_execute_header, v230, OS_LOG_TYPE_INFO, "[%{public}@] Running first animation", buf, 0xCu);

                v26 = v282;
                v218 = v276;
                goto LABEL_256;
              }
              v273 = v24;
              v249 = sub_100A040E4();
              v250 = objc_claimAutoreleasedReturnValue(v249);
              if (!os_log_type_enabled(v250, OS_LOG_TYPE_INFO))
              {
LABEL_271:

                v287 = 0u;
                v288 = 0u;
                v285 = 0u;
                v286 = 0u;
                v263 = v213;
                v264 = objc_msgSend(v263, "countByEnumeratingWithState:objects:count:", &v285, v337, 16);
                if (v264)
                {
                  v265 = v264;
                  v266 = *(_QWORD *)v286;
                  do
                  {
                    for (j = 0; j != v265; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v286 != v266)
                        objc_enumerationMutation(v263);
                      v268 = *(_QWORD *)(*((_QWORD *)&v285 + 1) + 8 * (_QWORD)j);
                      v269 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate parentAnimation](self, "parentAnimation"));
                      objc_msgSend(v269, "addChildAnimation:", v268);

                    }
                    v265 = objc_msgSend(v263, "countByEnumeratingWithState:objects:count:", &v285, v337, 16);
                  }
                  while (v265);
                }

                v270 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate parentAnimation](self, "parentAnimation"));
                objc_msgSend(v270, "setDuration:", v219);

                v271 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate parentAnimation](self, "parentAnimation"));
                v283[0] = _NSConcreteStackBlock;
                v283[1] = 3221225472;
                v283[2] = sub_100A0871C;
                v283[3] = &unk_1011AC860;
                v284 = v263;
                objc_msgSend(v271, "addPreparation:", v283);

                v24 = v273;
                v26 = v282;
                v218 = v276;
                v222 = v277;
                goto LABEL_279;
              }
              v251 = self;
              v252 = v251;
              if (!v251)
              {
                v258 = CFSTR("<nil>");
                goto LABEL_270;
              }
              v253 = (objc_class *)objc_opt_class(v251);
              v254 = NSStringFromClass(v253);
              v255 = (void *)objc_claimAutoreleasedReturnValue(v254);
              if ((objc_opt_respondsToSelector(v252, "accessibilityIdentifier") & 1) != 0)
              {
                v256 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v252, "performSelector:", "accessibilityIdentifier"));
                v257 = v256;
                if (v256 && !objc_msgSend(v256, "isEqualToString:", v255))
                {
                  v258 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v255, v252, v257));

                  goto LABEL_251;
                }

              }
              v258 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v255, v252));
LABEL_251:

LABEL_270:
              v262 = v258;
              *(_DWORD *)buf = 138543362;
              v339 = v262;
              _os_log_impl((void *)&_mh_execute_header, v250, OS_LOG_TYPE_INFO, "[%{public}@] Scheduling animation to run with parent", buf, 0xCu);

              goto LABEL_271;
            }
            v239 = sub_100A040E4();
            v240 = objc_claimAutoreleasedReturnValue(v239);
            if (!os_log_type_enabled(v240, OS_LOG_TYPE_ERROR))
            {
LABEL_260:

              -[CarCardsUpdate runCompletionBlocks](self, "runCompletionBlocks");
              goto LABEL_279;
            }
            v241 = self;
            v242 = v241;
            if (!v241)
            {
              v248 = CFSTR("<nil>");
              goto LABEL_259;
            }
            v243 = (objc_class *)objc_opt_class(v241);
            v244 = NSStringFromClass(v243);
            v245 = (void *)objc_claimAutoreleasedReturnValue(v244);
            if ((objc_opt_respondsToSelector(v242, "accessibilityIdentifier") & 1) != 0)
            {
              v246 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v242, "performSelector:", "accessibilityIdentifier"));
              v247 = v246;
              if (v246 && !objc_msgSend(v246, "isEqualToString:", v245))
              {
                v248 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v245, v242, v247));

                goto LABEL_243;
              }

            }
            v248 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v245, v242));
LABEL_243:

            v26 = v282;
LABEL_259:

            v261 = v248;
            *(_DWORD *)buf = 138543362;
            v339 = v261;
            _os_log_impl((void *)&_mh_execute_header, v240, OS_LOG_TYPE_ERROR, "[%{public}@] No animations were created, run completion blocks and exit", buf, 0xCu);

            v222 = v277;
            goto LABEL_260;
          }
          v187 = self;
          v188 = v187;
          if (!v187)
          {
            v194 = CFSTR("<nil>");
            goto LABEL_187;
          }
          v189 = (objc_class *)objc_opt_class(v187);
          v190 = NSStringFromClass(v189);
          v191 = (void *)objc_claimAutoreleasedReturnValue(v190);
          if ((objc_opt_respondsToSelector(v188, "accessibilityIdentifier") & 1) != 0)
          {
            v192 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v188, "performSelector:", "accessibilityIdentifier"));
            v193 = v192;
            if (v192 && !objc_msgSend(v192, "isEqualToString:", v191))
            {
              v194 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v191, v188, v193));

              goto LABEL_185;
            }

          }
          v194 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v191, v188));
LABEL_185:

LABEL_187:
          v195 = v194;
          v196 = (const __CFString *)objc_msgSend(v281, "count");
          v197 = objc_msgSend(v25, "count");
          v198 = objc_msgSend(v276, "count");
          v199 = objc_msgSend(v277, "count");
          v200 = objc_msgSend(v275, "count");
          *(_DWORD *)buf = 138544642;
          v339 = v195;
          v340 = 2048;
          v341 = v196;
          v342 = 2048;
          v343 = v197;
          v344 = 2048;
          v345 = v198;
          v346 = 2048;
          v347 = v199;
          v348 = 2048;
          v349 = v200;
          _os_log_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_INFO, "[%{public}@] %lu/%lu reloads are visible (%lu layout, %lu content, %lu other)", buf, 0x3Eu);

          v26 = v282;
          goto LABEL_188;
        }
        v143 = self;
        v144 = v143;
        if (!v143)
        {
          v150 = CFSTR("<nil>");
          goto LABEL_175;
        }
        v145 = (objc_class *)objc_opt_class(v143);
        v146 = NSStringFromClass(v145);
        v147 = (void *)objc_claimAutoreleasedReturnValue(v146);
        if ((objc_opt_respondsToSelector(v144, "accessibilityIdentifier") & 1) != 0)
        {
          v148 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v144, "performSelector:", "accessibilityIdentifier"));
          v149 = v148;
          if (v148 && !objc_msgSend(v148, "isEqualToString:", v147))
          {
            v150 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v147, v144, v149));

            goto LABEL_133;
          }

        }
        v150 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v147, v144));
LABEL_133:

LABEL_175:
        v183 = v150;
        v26 = v282;
        v184 = (const __CFString *)objc_msgSend(v282, "count");
        *(_DWORD *)buf = 138543618;
        v339 = v183;
        v340 = 2048;
        v341 = v184;
        _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_INFO, "[%{public}@] %lu insertions, perform layout immediately", buf, 0x16u);

        goto LABEL_176;
      }
      v126 = self;
      v127 = (objc_class *)objc_opt_class(v126);
      v128 = NSStringFromClass(v127);
      v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
      if ((objc_opt_respondsToSelector(v126, "accessibilityIdentifier") & 1) != 0)
      {
        v130 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v126, "performSelector:", "accessibilityIdentifier"));
        v131 = v130;
        if (v130 && !objc_msgSend(v130, "isEqualToString:", v129))
        {
          v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v129, v126, v131));

          goto LABEL_116;
        }

      }
      v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v129, v126));
LABEL_116:

      v133 = v132;
      v134 = (const __CFString *)objc_msgSend(v280, "count");
      *(_DWORD *)buf = 138543618;
      v339 = v133;
      v340 = 2048;
      v341 = v134;
      _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_INFO, "[%{public}@] %lu hidden deletions, remove immediately", buf, 0x16u);

      v26 = v282;
      goto LABEL_117;
    }
    v113 = sub_100A040E4();
    v114 = objc_claimAutoreleasedReturnValue(v113);
    if (!os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
    {
LABEL_108:

      -[CarCardsUpdate _runUpdatesForConfigurations:allowAnimations:](self, "_runUpdatesForConfigurations:allowAnimations:", v280, 0);
      -[CarCardsUpdate _applyAndPerformLayoutForConfigurations:allowAnimations:](self, "_applyAndPerformLayoutForConfigurations:allowAnimations:", v280, 0);
      goto LABEL_109;
    }
    v115 = self;
    v116 = (objc_class *)objc_opt_class(v115);
    v117 = NSStringFromClass(v116);
    v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
    if ((objc_opt_respondsToSelector(v115, "accessibilityIdentifier") & 1) != 0)
    {
      v119 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v115, "performSelector:", "accessibilityIdentifier"));
      v120 = v119;
      if (v119 && !objc_msgSend(v119, "isEqualToString:", v118))
      {
        v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v118, v115, v120));

        goto LABEL_107;
      }

    }
    v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v118, v115));
LABEL_107:

    v122 = v121;
    v123 = (const __CFString *)objc_msgSend(v280, "count");
    *(_DWORD *)buf = 138543618;
    v339 = v122;
    v340 = 2048;
    v341 = v123;
    _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_INFO, "[%{public}@] %lu hidden reloads, perform layout immediately", buf, 0x16u);

    v26 = v282;
    goto LABEL_108;
  }
  v86 = sub_100A040E4();
  v87 = objc_claimAutoreleasedReturnValue(v86);
  if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
  {
    v88 = self;
    v89 = (objc_class *)objc_opt_class(v88);
    v90 = NSStringFromClass(v89);
    v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
    if ((objc_opt_respondsToSelector(v88, "accessibilityIdentifier") & 1) != 0)
    {
      v92 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v88, "performSelector:", "accessibilityIdentifier"));
      v93 = v92;
      if (v92 && !objc_msgSend(v92, "isEqualToString:", v91))
      {
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v91, v88, v93));

        goto LABEL_78;
      }

    }
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v91, v88));
LABEL_78:

    v95 = v94;
    v96 = (const __CFString *)objc_msgSend(v24, "count");
    *(_DWORD *)buf = 138543618;
    v339 = v95;
    v340 = 2048;
    v341 = v96;
    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "[%{public}@] %lu deletions will reset immediately", buf, 0x16u);

    v26 = v282;
  }

  v331 = 0u;
  v332 = 0u;
  v329 = 0u;
  v330 = 0u;
  v272 = v24;
  v97 = v24;
  v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v329, v352, 16);
  if (v98)
  {
    v99 = v98;
    v100 = *(_QWORD *)v330;
    do
    {
      for (k = 0; k != v99; k = (char *)k + 1)
      {
        if (*(_QWORD *)v330 != v100)
          objc_enumerationMutation(v97);
        objc_msgSend(*(id *)(*((_QWORD *)&v329 + 1) + 8 * (_QWORD)k), "reset");
      }
      v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v329, v352, 16);
    }
    while (v99);
  }

  if (objc_msgSend(v97, "count"))
  {
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate delegate](self, "delegate"));
    objc_msgSend(v102, "cardsUpdate:finalizeUpdate:withCardConfigurations:", self, 0, v97);

  }
  v103 = sub_100A040E4();
  v104 = objc_claimAutoreleasedReturnValue(v103);
  if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
  {
    v105 = self;
    v106 = v105;
    if (!v105)
    {
      v112 = CFSTR("<nil>");
      goto LABEL_135;
    }
    v107 = (objc_class *)objc_opt_class(v105);
    v108 = NSStringFromClass(v107);
    v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
    if ((objc_opt_respondsToSelector(v106, "accessibilityIdentifier") & 1) != 0)
    {
      v110 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v106, "performSelector:", "accessibilityIdentifier"));
      v111 = v110;
      if (v110 && !objc_msgSend(v110, "isEqualToString:", v109))
      {
        v112 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v109, v106, v111));

        goto LABEL_95;
      }

    }
    v112 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v109, v106));
LABEL_95:

LABEL_135:
    v151 = v112;
    v152 = (const __CFString *)objc_msgSend(v25, "count");
    *(_DWORD *)buf = 138543618;
    v339 = v151;
    v340 = 2048;
    v341 = v152;
    _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_INFO, "[%{public}@] %lu reloads, will update immediately", buf, 0x16u);

    v26 = v282;
  }

  -[CarCardsUpdate _runUpdatesForConfigurations:allowAnimations:](self, "_runUpdatesForConfigurations:allowAnimations:", v25, 1);
  if (objc_msgSend(v25, "count"))
    -[CarCardsUpdate _applyAndPerformLayoutForConfigurations:allowAnimations:](self, "_applyAndPerformLayoutForConfigurations:allowAnimations:", v25, 1);
  if (objc_msgSend(v25, "count"))
  {
    v153 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate delegate](self, "delegate"));
    objc_msgSend(v153, "cardsUpdate:finalizeUpdate:withCardConfigurations:", self, 1, v25);

  }
  v154 = sub_100A040E4();
  v155 = objc_claimAutoreleasedReturnValue(v154);
  if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
  {
    v156 = self;
    v157 = v156;
    if (!v156)
    {
      v163 = CFSTR("<nil>");
      goto LABEL_149;
    }
    v158 = (objc_class *)objc_opt_class(v156);
    v159 = NSStringFromClass(v158);
    v160 = (void *)objc_claimAutoreleasedReturnValue(v159);
    if ((objc_opt_respondsToSelector(v157, "accessibilityIdentifier") & 1) != 0)
    {
      v161 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v157, "performSelector:", "accessibilityIdentifier"));
      v162 = v161;
      if (v161 && !objc_msgSend(v161, "isEqualToString:", v160))
      {
        v163 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v160, v157, v162));

        goto LABEL_147;
      }

    }
    v163 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v160, v157));
LABEL_147:

LABEL_149:
    v164 = v163;
    v26 = v282;
    v165 = (const __CFString *)objc_msgSend(v282, "count");
    *(_DWORD *)buf = 138543618;
    v339 = v164;
    v340 = 2048;
    v341 = v165;
    _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_INFO, "[%{public}@] %lu insertions, will unhide immediately", buf, 0x16u);

  }
  v327 = 0u;
  v328 = 0u;
  v325 = 0u;
  v326 = 0u;
  v166 = v26;
  v167 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v325, v351, 16);
  if (v167)
  {
    v168 = v167;
    v169 = *(_QWORD *)v326;
    do
    {
      for (m = 0; m != v168; m = (char *)m + 1)
      {
        if (*(_QWORD *)v326 != v169)
          objc_enumerationMutation(v166);
        objc_msgSend(*(id *)(*((_QWORD *)&v325 + 1) + 8 * (_QWORD)m), "setHidden:", 0);
      }
      v168 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v325, v351, 16);
    }
    while (v168);
  }

  if (objc_msgSend(v166, "count"))
    -[CarCardsUpdate _applyAndPerformLayoutForConfigurations:allowAnimations:](self, "_applyAndPerformLayoutForConfigurations:allowAnimations:", v166, 1);
  v24 = v272;
  if (objc_msgSend(v166, "count"))
  {
    v171 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate delegate](self, "delegate"));
    objc_msgSend(v171, "cardsUpdate:finalizeUpdate:withCardConfigurations:", self, 2, v166);

  }
  v172 = sub_100A040E4();
  v173 = objc_claimAutoreleasedReturnValue(v172);
  if (!os_log_type_enabled(v173, OS_LOG_TYPE_INFO))
    goto LABEL_171;
  v174 = self;
  v175 = v174;
  if (!v174)
  {
    v181 = CFSTR("<nil>");
    goto LABEL_170;
  }
  v176 = (objc_class *)objc_opt_class(v174);
  v177 = NSStringFromClass(v176);
  v178 = (void *)objc_claimAutoreleasedReturnValue(v177);
  if ((objc_opt_respondsToSelector(v175, "accessibilityIdentifier") & 1) != 0)
  {
    v179 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate performSelector:](v175, "performSelector:", "accessibilityIdentifier"));
    v180 = v179;
    if (v179 && !objc_msgSend(v179, "isEqualToString:", v178))
    {
      v181 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v178, v175, v180));

      goto LABEL_168;
    }

  }
  v181 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v178, v175));
LABEL_168:

LABEL_170:
  v182 = v181;
  *(_DWORD *)buf = 138543362;
  v339 = v182;
  _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_INFO, "[%{public}@] Updates completed, running completion blocks.", buf, 0xCu);

  v26 = v282;
LABEL_171:

  -[CarCardsUpdate runCompletionBlocks](self, "runCompletionBlocks");
LABEL_280:

}

- (void)_runUpdatesForConfigurations:(id)a3 allowAnimations:(BOOL)a4
{
  -[CarCardsUpdate _runUpdatesForConfigurations:allowAnimations:layoutReloads:contentReloads:otherReloads:](self, "_runUpdatesForConfigurations:allowAnimations:layoutReloads:contentReloads:otherReloads:", a3, a4, 0, 0, 0);
}

- (void)_runUpdatesForConfigurations:(id)a3 allowAnimations:(BOOL)a4 layoutReloads:(id *)a5 contentReloads:(id *)a6 otherReloads:(id *)a7
{
  _BOOL4 v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  CarCardsUpdate *v25;
  id v26;
  id v27;
  id v28;

  v10 = a4;
  v12 = a3;
  v13 = v12;
  if (a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v12, "count")));
    if (a5)
      goto LABEL_3;
LABEL_6:
    v15 = 0;
    if (a7)
      goto LABEL_4;
    goto LABEL_7;
  }
  v14 = 0;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v13, "count")));
  if (a7)
  {
LABEL_4:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v13, "count")));
    goto LABEL_8;
  }
LABEL_7:
  v16 = 0;
LABEL_8:
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100A08934;
  v23[3] = &unk_1011B04A8;
  v17 = v13;
  v24 = v17;
  v25 = self;
  v18 = v15;
  v26 = v18;
  v19 = v14;
  v27 = v19;
  v20 = v16;
  v28 = v20;
  v21 = objc_retainBlock(v23);
  v22 = v21;
  if (!v10)
  {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v21);
    if (!v19)
      goto LABEL_13;
    goto LABEL_12;
  }
  ((void (*)(_QWORD *))v21[2])(v21);
  if (v19)
LABEL_12:
    *a6 = objc_retainAutorelease(v19);
LABEL_13:
  if (v18)
    *a5 = objc_retainAutorelease(v18);
  if (v20)
    *a7 = objc_retainAutorelease(v20);

}

- (BOOL)_shouldClearConfiguration:(id)a3 beforeUpdate:(id)a4
{
  void (**v5)(id, CarCardConfiguration *);
  id v6;
  CarCardConfiguration *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v5 = (void (**)(id, CarCardConfiguration *))a4;
  v6 = a3;
  v7 = -[CarCardConfiguration initWithKey:carSceneType:]([CarCardConfiguration alloc], "initWithKey:carSceneType:", CFSTR("dummyConfiguration"), 0);
  v5[2](v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration content](v7, "content"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));

  if (v8 == v9)
    LOBYTE(v10) = 0;
  else
    v10 = (-[CarCardConfiguration invalidationState](v7, "invalidationState") >> 1) & 1;

  return v10;
}

- (void)_performLayoutAllowingAnimations:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100A08C1C;
  v6[3] = &unk_1011AC860;
  v6[4] = self;
  v4 = objc_retainBlock(v6);
  v5 = v4;
  if (v3)
    ((void (*)(_QWORD *))v4[2])(v4);
  else
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);

}

- (void)_applyAndPerformLayoutForConfigurations:(id)a3 allowAnimations:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void ***v6;
  void ***v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  CarCardsUpdate *v12;
  id v13;

  v4 = a4;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100A08D0C;
  v11 = &unk_1011AC8B0;
  v12 = self;
  v5 = a3;
  v13 = v5;
  v6 = objc_retainBlock(&v8);
  v7 = v6;
  if (v4)
    ((void (*)(void ***))v6[2])(v6);
  else
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6, v8, v9, v10, v11, v12);

}

- (void)_markConfigurations:(id)a3 asTransitioning:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a4;
  v5 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setTransitioning:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_configurations:(id)a3 getVisible:(id *)a4 hidden:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v7 = a3;
  if (!v7)
    goto LABEL_8;
  v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("hidden == YES")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", v8));
  if (!objc_msgSend(v9, "count"))
  {
    v11 = v12;
    if (!a4)
      goto LABEL_5;
    goto LABEL_4;
  }
  v10 = objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v10, "removeObjectsInArray:", v9);
  v11 = objc_msgSend(v10, "copy");

  if (a4)
LABEL_4:
    *a4 = objc_retainAutorelease(v11);
LABEL_5:
  if (a5)
    *a5 = objc_retainAutorelease(v9);

  v7 = v12;
LABEL_8:

}

- (CarCardsUpdateDelegate)delegate
{
  return (CarCardsUpdateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (GroupAnimation)parentAnimation
{
  return (GroupAnimation *)objc_loadWeakRetained((id *)&self->_parentAnimation);
}

- (void)setParentAnimation:(id)a3
{
  objc_storeWeak((id *)&self->_parentAnimation, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentAnimation);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_updatesByConfiguration, 0);
  objc_storeStrong((id *)&self->_insertionsByKey, 0);
  objc_storeStrong((id *)&self->_reloadsByKey, 0);
  objc_storeStrong((id *)&self->_deletionsByKey, 0);
}

@end
