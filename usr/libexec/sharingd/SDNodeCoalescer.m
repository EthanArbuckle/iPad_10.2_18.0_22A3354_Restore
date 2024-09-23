@implementation SDNodeCoalescer

- (SDNodeCoalescer)init
{
  SDNodeCoalescer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *originalNodes;
  NSMutableDictionary *v5;
  NSMutableDictionary *contactIdentifierMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDNodeCoalescer;
  v2 = -[SDNodeCoalescer init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    originalNodes = v2->_originalNodes;
    v2->_originalNodes = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    contactIdentifierMap = v2->_contactIdentifierMap;
    v2->_contactIdentifierMap = v5;

  }
  return v2;
}

- (id)coalescedNodesForNewAvailableNodes:(id)a3
{
  SDNodeCoalescer *v5;
  NSMutableDictionary *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  _BOOL4 v15;
  id v16;
  id v17;
  uint64_t v18;
  int v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableDictionary *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  const void *Copy;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  int v62;
  NSObject *v63;
  id v64;
  uint64_t v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  id v70;
  char *v71;
  void *v72;
  id v73;
  NSObject *v74;
  const __CFString *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  NSMutableDictionary *v80;
  void *v81;
  id v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  NSObject *v86;
  uint64_t v87;
  void *v88;
  id v89;
  uint64_t v90;
  NSArray *coalescedNodes;
  NSArray *v92;
  id v94;
  NSMutableDictionary *v95;
  NSArray *obj;
  NSMutableDictionary *v97;
  NSMutableDictionary *v98;
  NSMutableDictionary *v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  NSMutableDictionary *v103;
  unsigned int v104;
  void *v105;
  NSMutableDictionary *v106;
  _BOOL4 v107;
  id v108;
  SDNodeCoalescer *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  void *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint8_t buf[4];
  const char *v125;
  __int16 v126;
  uint64_t v127;
  __int16 v128;
  NSObject *v129;
  __int16 v130;
  const __CFString *v131;
  _BYTE v132[128];
  _BYTE v133[128];

  v94 = a3;
  v99 = objc_opt_new(NSMutableDictionary);
  v106 = objc_opt_new(NSMutableDictionary);
  v98 = objc_opt_new(NSMutableDictionary);
  v95 = objc_opt_new(NSMutableDictionary);
  v97 = objc_opt_new(NSMutableDictionary);
  v5 = self;
  v6 = objc_opt_new(NSMutableDictionary);
  objc_storeStrong((id *)&self->_availableNodes, a3);
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  obj = self->_availableNodes;
  v109 = self;
  v103 = v6;
  v102 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
  if (v102)
  {
    v101 = *(_QWORD *)v121;
    v100 = kSFNodeKindRapport;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v121 != v101)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)SFNodeCopyKinds(v8);
        v11 = (void *)SFNodeCopyRealName(v8, v10);
        v12 = (void *)SFNodeCopyContactIdentifiers(v8);
        v13 = (void *)SFNodeCopyContactIdentifier(v8);
        v112 = SFNodeCopyUserName(v8);
        v104 = objc_msgSend(v9, "containsObject:", v100);
        v14 = sub_10004E26C(v8);
        if (v12)
        {
          if (v13)
            goto LABEL_8;
        }
        else
        {
          v16 = sub_10004E380(v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (v13)
          {
LABEL_8:
            v15 = 1;
LABEL_15:
            v107 = v15;
            v114 = v13;
            goto LABEL_16;
          }
        }
        v17 = sub_10004E3B8(v8);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v15 = v18 != 0;
        if (v18)
          v19 = 1;
        else
          v19 = v14;
        if (v19 == 1)
        {
          v13 = (void *)v18;
          goto LABEL_15;
        }
        v107 = 0;
        v114 = 0;
        v13 = (void *)v112;
LABEL_16:
        v20 = v13;
        v21 = airdrop_log(v20);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v57 = NSPrintF("kinds=%##@ realName=%@ cnId=%@ aTag=%@ id=%@ isRap=%d isMe=%d", v9, v11, v114, v112, v20, v104, v14, v94);
          v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
          *(_DWORD *)buf = 138412546;
          v125 = (const char *)v8;
          v126 = 2112;
          v127 = (uint64_t)v58;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Coalescing node %@: %@", buf, 0x16u);

          v6 = v103;
        }

        v110 = v20;
        if (v20)
        {
          v105 = v7;
          v24 = v14;
          v25 = v12;
          v26 = v11;
          v27 = v9;
          v28 = v6;
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v20));
          v30 = sub_100195DF4();
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          v32 = sub_100195CB8(v29, v31);
          v33 = objc_claimAutoreleasedReturnValue(v32);

          v34 = magic_head_log();
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v125 = "-[SDNodeCoalescer coalescedNodesForNewAvailableNodes:]";
            v126 = 2112;
            v127 = (uint64_t)v20;
            v128 = 2112;
            v129 = v33;
            _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%s identifier: %@, mostRevelant: %@", buf, 0x20u);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v33, v20);
          v6 = v28;
          v9 = v27;
          v11 = v26;
          v12 = v25;
          v14 = v24;
          v7 = v105;
        }
        else
        {
          v36 = airdrop_log(v23);
          v33 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v125 = (const char *)v8;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No identifier found for node %@", buf, 0xCu);
          }
        }

        if (v14)
        {
          v37 = SFNodeCopyIDSDeviceIdentifier(v8);
          if (v37 || (v37 = SFNodeCopyComputerName(v8)) != 0)
          {
            v5 = v109;
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v109->_originalNodes, "objectForKeyedSubscript:", v37));

            if (!v38)
            {
              Copy = (const void *)SFNodeCreateCopy(0, v8);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v109->_originalNodes, "setObject:forKeyedSubscript:", Copy, v37);
              CFRelease(Copy);
            }
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v109->_originalNodes, "objectForKeyedSubscript:", v37));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v99, "setObject:forKeyedSubscript:", v40, v37);

            v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v106, "objectForKeyedSubscript:", v37));
            if (v41)
            {
              v42 = v41;
              if ((objc_msgSend(v41, "containsObject:", v8) & 1) == 0)
                objc_msgSend(v42, "addObject:", v8);
            }
            else
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v8));
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](v106, "setObject:forKeyedSubscript:", v42, v37);
            v54 = (void *)SFNodeCopyModelIdentifier(v8);
            if (v54)
            {
              v55 = (void *)SFNodeCopyIconData(v8);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v97, "setObject:forKeyedSubscript:", v55, v37);

            }
            v6 = v103;
          }
          else
          {
            v56 = airdrop_log(0);
            v37 = objc_claimAutoreleasedReturnValue(v56);
            v5 = v109;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v125 = (const char *)v8;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "coalescedNodesForNewAvailableNodes: Device ID is not available for %@", buf, 0xCu);
            }
          }
LABEL_53:

          v48 = (void *)v112;
          goto LABEL_54;
        }
        if (v107)
        {
          v5 = v109;
          v37 = objc_claimAutoreleasedReturnValue(-[SDNodeCoalescer setMappedContactIdentifier:relatedContactIdentifiers:](v109, "setMappedContactIdentifier:relatedContactIdentifiers:", v114, v12));
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v109->_originalNodes, "objectForKeyedSubscript:", v37));

          if (!v43)
          {
            v44 = (const void *)SFNodeCreateCopy(0, v8);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v109->_originalNodes, "setObject:forKeyedSubscript:", v44, v37);
            CFRelease(v44);
          }
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v109->_originalNodes, "objectForKeyedSubscript:", v37));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v99, "setObject:forKeyedSubscript:", v45, v37);

          v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v98, "objectForKeyedSubscript:", v37));
          if (v46)
          {
            v47 = v46;
            if ((objc_msgSend(v46, "containsObject:", v8) & 1) == 0)
              objc_msgSend(v47, "addObject:", v8);
          }
          else
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v8));
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v98, "setObject:forKeyedSubscript:", v47, v37);

          goto LABEL_53;
        }
        v48 = (void *)v112;
        if (v112)
        {
          v5 = v109;
          if ((v104 & 1) == 0)
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v109->_originalNodes, "objectForKeyedSubscript:", v112));

            if (!v49)
            {
              v50 = (const void *)SFNodeCreateCopy(0, v8);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v109->_originalNodes, "setObject:forKeyedSubscript:", v50, v112);
              CFRelease(v50);
            }
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v109->_originalNodes, "objectForKeyedSubscript:", v112));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v99, "setObject:forKeyedSubscript:", v51, v112);

          }
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v95, "objectForKeyedSubscript:", v112));
          if (v52)
          {
            v53 = v52;
            if ((objc_msgSend(v52, "containsObject:", v8) & 1) == 0)
              objc_msgSend(v53, "addObject:", v8);
          }
          else
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v8));
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v53, v112);

        }
        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v99, "setObject:forKeyedSubscript:", v8, v11);
          v5 = v109;
        }
LABEL_54:

        v7 = (char *)v7 + 1;
      }
      while (v102 != v7);
      v59 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
      v102 = v59;
    }
    while (v59);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v108 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v99, "allValues"));
  v113 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
  if (!v113)
    goto LABEL_106;
  v111 = *(_QWORD *)v117;
  do
  {
    v60 = 0;
    do
    {
      if (*(_QWORD *)v117 != v111)
        objc_enumerationMutation(v108);
      v61 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)v60);
      v62 = sub_10004E26C(v61);
      v63 = SFNodeCopyContactIdentifier(v61);
      if (!v63)
      {
        v64 = sub_10004E3B8(v61);
        v63 = objc_claimAutoreleasedReturnValue(v64);
      }
      v65 = SFNodeCopyUserName(v61);
      v66 = (void *)v65;
      if (v63)
        v67 = v62;
      else
        v67 = 1;
      if (((v63 == 0) & ~v62) != 0)
        v68 = (void *)v65;
      else
        v68 = v63;
      if ((v67 & 1) != 0)
      {
        v69 = 0;
      }
      else
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeCoalescer mappedContactIdentifierForContactIdentifier:](v5, "mappedContactIdentifierForContactIdentifier:", v63));
        v68 = v63;
      }
      v70 = v68;
      if (v70)
      {
        v71 = (char *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v103, "objectForKeyedSubscript:", v70));
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v71, 1, 0));
      }
      else
      {
        v72 = 0;
        v71 = 0;
      }
      v73 = magic_head_log();
      v74 = objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v75 = CFSTR("mapped ID %@");
        if (!v69)
          v75 = CFSTR("no mapped ID");
        v125 = v71;
        v126 = 2112;
        v127 = v61;
        v128 = 2112;
        v129 = v63;
        v130 = 2112;
        v131 = v75;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "SDNodeBrowser: Setting score to %@ for node %@ with ID %@ and %@", buf, 0x2Au);
      }

      SFNodeSetRangingData(v61, v72);
      v76 = sub_10004E26C(v61);
      v115 = v66;
      if ((_DWORD)v76)
      {
        v77 = (void *)SFNodeCopyIDSDeviceIdentifier(v61);
        if (!v77)
          v77 = (void *)SFNodeCopyComputerName(v61);
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v106, "objectForKeyedSubscript:", v77));
        SFNodeSetSiblingNodes(v61, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v97, "objectForKeyedSubscript:", v77));
        if (v79)
          SFNodeSetIconData(v61, v79);

        v5 = v109;
        goto LABEL_96;
      }
      if (v69)
      {
        v80 = v98;
        v81 = v69;
LABEL_95:
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", v81));
        SFNodeSetSiblingNodes(v61, v78);
        goto LABEL_96;
      }
      if (v66)
      {
        v80 = v95;
        v81 = v66;
        goto LABEL_95;
      }
      v85 = airdrop_log(v76);
      v86 = objc_claimAutoreleasedReturnValue(v85);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v125 = (const char *)v61;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Coalesced node %@ not handled", buf, 0xCu);
      }

      v78 = 0;
LABEL_96:
      v82 = objc_msgSend(v78, "count");
      if ((unint64_t)v82 >= 2)
      {
        v83 = airdrop_log(v82);
        v84 = objc_claimAutoreleasedReturnValue(v83);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          v87 = NSPrintF("%##@", v78);
          v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
          *(_DWORD *)buf = 138412546;
          v125 = (const char *)v61;
          v126 = 2112;
          v127 = (uint64_t)v88;
          _os_log_debug_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "Coalesced node %@ represents nodes %@", buf, 0x16u);

          v5 = v109;
        }

      }
      v60 = (char *)v60 + 1;
    }
    while (v113 != v60);
    v89 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
    v113 = v89;
  }
  while (v89);
LABEL_106:

  v90 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v99, "allValues"));
  coalescedNodes = v5->_coalescedNodes;
  v5->_coalescedNodes = (NSArray *)v90;

  v92 = v5->_coalescedNodes;
  return v92;
}

- (id)setMappedContactIdentifier:(id)a3 relatedContactIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v6 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_contactIdentifierMap, "objectForKeyedSubscript:", v12));

      if (v13)
        break;
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_contactIdentifierMap, "objectForKeyedSubscript:", v12));

    if (v14)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v14 = v6;
LABEL_12:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_contactIdentifierMap, "objectForKeyedSubscript:", v20, (_QWORD)v23));

        if (!v21)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contactIdentifierMap, "setObject:forKeyedSubscript:", v14, v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  return v14;
}

- (id)mappedContactIdentifierForContactIdentifier:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_contactIdentifierMap, "objectForKeyedSubscript:", a3);
}

- (NSArray)availableNodes
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAvailableNodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)coalescedNodes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)originalNodes
{
  return self->_originalNodes;
}

- (void)setOriginalNodes:(id)a3
{
  objc_storeStrong((id *)&self->_originalNodes, a3);
}

- (NSMutableDictionary)contactIdentifierMap
{
  return self->_contactIdentifierMap;
}

- (void)setContactIdentifierMap:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifierMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifierMap, 0);
  objc_storeStrong((id *)&self->_originalNodes, 0);
  objc_storeStrong((id *)&self->_coalescedNodes, 0);
  objc_storeStrong((id *)&self->_availableNodes, 0);
}

@end
