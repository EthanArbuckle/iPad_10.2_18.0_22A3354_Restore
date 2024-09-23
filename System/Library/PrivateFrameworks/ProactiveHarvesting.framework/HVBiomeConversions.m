@implementation HVBiomeConversions

+ (id)biomeEventFromSearchableItem:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  const char *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  int v74;
  void *v75;
  NSObject *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  uint64_t v97;
  double v98;
  double v99;
  uint64_t v100;
  const __CFString *v101;
  id v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  NSObject *v126;
  NSObject *v127;
  const char *v128;
  NSObject *v129;
  uint32_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  int v142;
  const __CFString *v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  void *v157;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  unsigned int v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void (**v183)(_QWORD);
  id v184;
  void *v185;
  id v186;
  id v187;
  id v188;
  id v189;
  void *v190;
  void *v191;
  void *v192;
  id v193;
  id v194;
  id v195;
  id v196;
  void *v197;
  void *v198;
  uint64_t v199;
  void *v200;
  __int128 buf;
  id (*v202)(uint64_t);
  void *v203;
  id v204;
  id v205;
  _BYTE v206[12];
  __int16 v207;
  uint64_t v208;
  __int16 v209;
  uint64_t v210;
  uint64_t v211;

  v211 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilemail")))
  {
    v10 = v8;
    v11 = objc_opt_self();
    objc_msgSend(v10, "attributeSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v202 = __64__HVBiomeConversions__mailContentEventFromSearchableItem_error___block_invoke;
    v203 = &unk_24DD7EFC0;
    v13 = v12;
    v204 = v13;
    v14 = v10;
    v205 = v14;
    v15 = (void (**)(_QWORD))MEMORY[0x22074FF64](&buf);
    objc_msgSend(v13, "accountIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      hv_default_log_handle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v15[2](v15);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v206 = 138543362;
        *(_QWORD *)&v206[4] = v131;
        _os_log_error_impl(&dword_21AA1D000, v45, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _mailContentEventFromSearchableItem: ignoring CSSI %{public}@ with no account identifier.", v206, 0xCu);

      }
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 5, 0);
        v30 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
      goto LABEL_80;
    }
    objc_msgSend(v13, "emailHeaders");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v13, "authors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19)
      {
        v183 = v15;
        v20 = objc_alloc(MEMORY[0x24BDD1650]);
        objc_msgSend(MEMORY[0x24BDD1650], "hv_headerKeyFunctions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1650], "hv_headerValueFunctions");
        v190 = v17;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v20, "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v21, v22, objc_msgSend(v190, "count"));

        v17 = v190;
        v24 = v23;
        objc_msgSend(v23, "hv_addEntriesFromHeadersDictionary:", v190);
        objc_msgSend(v13, "mailMessageID");
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25
          || (objc_msgSend(v23, "hv_firstHeaderForKey:", CFSTR("message-id")),
              (v25 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v178 = (void *)v25;
          objc_msgSend(v13, "HTMLContentDataNoCopy");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            +[HVSearchableItemHelper htmlContentDataNoCopyRetainingBackingBuffer:](HVSearchableItemHelper, "htmlContentDataNoCopyRetainingBackingBuffer:", v14);
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = 0;
          }
          else
          {
            +[HVSearchableItemHelper textContentNoCopyRetainingBackingBuffer:](HVSearchableItemHelper, "textContentNoCopyRetainingBackingBuffer:", v14);
            v28 = objc_claimAutoreleasedReturnValue();
            v27 = 0;
          }
          v177 = (void *)v27;
          v182 = (void *)v28;
          v196 = v8;
          if (v27 | v28)
          {
            objc_msgSend(v23, "objectForKey:", CFSTR("reply-to"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v154 = v80;
            if (objc_msgSend(v80, "count"))
            {
              v81 = objc_alloc(MEMORY[0x24BE0CC10]);
              objc_msgSend(v80, "firstObject");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v175 = (void *)objc_msgSend(v81, "initWithString:", v82);

              v24 = v23;
            }
            else
            {
              v175 = 0;
            }
            v155 = v24;
            objc_msgSend(v24, "objectForKey:", CFSTR("list-id"));
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v153 = v89;
            if (objc_msgSend(v89, "count"))
            {
              v90 = objc_alloc(MEMORY[0x24BE0CC10]);
              objc_msgSend(v89, "firstObject");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v173 = (void *)objc_msgSend(v90, "initWithString:", v91);

            }
            else
            {
              v173 = 0;
            }
            hv_default_log_handle();
            v95 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
            {
              v183[2](v183);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v206 = 138543362;
              *(_QWORD *)&v206[4] = v96;
              _os_log_impl(&dword_21AA1D000, v95, OS_LOG_TYPE_DEFAULT, "HVBiomeConversions: _mailContentEventFromSearchableItem: CSSI %{public}@ will be queued by ProactiveHarvesting", v206, 0xCu);

            }
            v147 = objc_alloc(MEMORY[0x24BE0CBF0]);
            objc_msgSend(v14, "uniqueIdentifier");
            v97 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "domainIdentifier");
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            +[HVBiomeConversions _generateRandomVersionString]();
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "contentCreationDate");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "timeIntervalSinceReferenceDate");
            v99 = v98;
            objc_msgSend(v13, "accountIdentifier");
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "authors");
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v151, "firstObject");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            +[HVBiomeConversions _bmNamedHandleFromCSPerson:](v11, v150);
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "primaryRecipients");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            +[HVBiomeConversions _bmNamedHandlesFromCSPersons:](v11, v149);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "additionalRecipients");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            +[HVBiomeConversions _bmNamedHandlesFromCSPersons:](v11, v148);
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "hiddenAdditionalRecipients");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            +[HVBiomeConversions _bmNamedHandlesFromCSPersons:](v11, v146);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "subject");
            v100 = objc_claimAutoreleasedReturnValue();
            v101 = &stru_24DD7F8A8;
            v145 = (void *)v100;
            if (v100)
              v101 = (const __CFString *)v100;
            v143 = v101;
            objc_msgSend(v13, "isPartiallyDownloaded");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            v142 = objc_msgSend(v144, "BOOLValue") ^ 1;
            objc_msgSend(v13, "securityMethod");
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "accountHandles");
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "mailboxIdentifiers");
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "accountType");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = v13;
            objc_opt_self();
            objc_msgSend(v102, "attachmentTypes");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = objc_msgSend(v103, "count");

            objc_msgSend(v102, "attachmentNames");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = objc_msgSend(v105, "count");

            objc_msgSend(v102, "attachmentPaths");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = objc_msgSend(v107, "count");

            v189 = v9;
            v156 = v14;
            v172 = (void *)v97;
            if (v104 == v106 && v104 == v108)
            {
              v109 = objc_opt_new();
              v157 = (void *)v109;
              if (v104)
              {
                v159 = v13;
                v110 = 0;
                v199 = v104;
                v111 = (void *)v109;
                do
                {
                  v112 = objc_alloc(MEMORY[0x24BE0CB60]);
                  objc_msgSend(v102, "attachmentTypes");
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v113, "objectAtIndexedSubscript:", v110);
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "attachmentNames");
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v115, "objectAtIndexedSubscript:", v110);
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "attachmentPaths");
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v117, "objectAtIndexedSubscript:", v110);
                  v118 = (void *)objc_claimAutoreleasedReturnValue();
                  v119 = (void *)objc_msgSend(v112, "initWithType:filename:path:", v114, v116, v118);
                  objc_msgSend(v111, "addObject:", v119);

                  ++v110;
                }
                while (v199 != v110);
                v13 = v159;
                v14 = v156;
              }
            }
            else
            {
              hv_default_log_handle();
              v120 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v206 = 134218496;
                *(_QWORD *)&v206[4] = v104;
                v207 = 2048;
                v208 = v106;
                v209 = 2048;
                v210 = v108;
                _os_log_error_impl(&dword_21AA1D000, v120, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _bmAttachmentsFromSearchableItemAttributes: attachment info length mismatch: %tu types, %tu names, %tu paths", v206, 0x20u);
              }

              v157 = 0;
            }

            objc_msgSend(v14, "protection");
            v200 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "mailConversationID");
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "mailDateReceived");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v102, "mailCategories"));
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "isNew");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "isTwoFactorCode");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "isFromMe");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "isLikelyJunk");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "mailRead");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "mailVIP");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "mailFlagged");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = v177;
            LOBYTE(v137) = v142;
            v17 = v190;
            v93 = v178;
            v30 = (void *)objc_msgSend(v147, "initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:", v172, v171, v170, v169, v178, v168, v99, v167, v166, v165, v190, v143, v177,
                            v182,
                            v137,
                            v164,
                            v163,
                            v175,
                            v162,
                            v173,
                            v161,
                            v157,
                            v200,
                            v160,
                            v158,
                            v141,
                            v140,
                            v121,
                            v139,
                            v122,
                            v138,
                            v123,
                            v124);

            v14 = v156;
            v94 = v182;
            v15 = v183;
            v9 = v189;
            v24 = v155;
          }
          else
          {
            hv_default_log_handle();
            v83 = objc_claimAutoreleasedReturnValue();
            v15 = v183;
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              v183[2](v183);
              v132 = v24;
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v206 = 138543362;
              *(_QWORD *)&v206[4] = v133;
              _os_log_error_impl(&dword_21AA1D000, v83, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _mailContentEventFromSearchableItem: ignoring CSSI %{public}@ missing html and text content.", v206, 0xCu);

              v24 = v132;
            }

            if (a5)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 4, 0);
              v30 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v30 = 0;
            }
            v92 = v177;
            v93 = v178;
            v94 = v182;
          }

          v8 = v196;
        }
        else
        {
          hv_default_log_handle();
          v126 = objc_claimAutoreleasedReturnValue();
          v15 = v183;
          if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
          {
            v183[2](v183);
            v134 = v24;
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v206 = 138543362;
            *(_QWORD *)&v206[4] = v135;
            _os_log_error_impl(&dword_21AA1D000, v126, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _mailContentEventFromSearchableItem: ignoring CSSI %{public}@ with missing message identifier.", v206, 0xCu);

            v24 = v134;
          }

          if (a5)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 5, 0);
            v30 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v30 = 0;
          }
        }

        goto LABEL_79;
      }
      hv_default_log_handle();
      v59 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
LABEL_28:

        if (a5)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 4, 0);
          v30 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = 0;
        }
LABEL_79:

LABEL_80:
        goto LABEL_81;
      }
      v15[2](v15);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v206 = 138543362;
      *(_QWORD *)&v206[4] = v60;
      v61 = "HVBiomeConversions: _mailContentEventFromSearchableItem: ignoring CSSI %{public}@ with no authors.";
    }
    else
    {
      hv_default_log_handle();
      v59 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      v15[2](v15);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v206 = 138543362;
      *(_QWORD *)&v206[4] = v60;
      v61 = "HVBiomeConversions: _mailContentEventFromSearchableItem: ignoring CSSI %{public}@ with no email headers.";
    }
    _os_log_error_impl(&dword_21AA1D000, v59, OS_LOG_TYPE_ERROR, v61, v206, 0xCu);

    goto LABEL_28;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.news")))
    {
      v31 = v8;
      objc_opt_self();
      +[HVSearchableItemHelper textContentNoCopyRetainingBackingBuffer:](HVSearchableItemHelper, "textContentNoCopyRetainingBackingBuffer:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        objc_msgSend(v31, "attributeSet");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v184 = objc_alloc(MEMORY[0x24BE0CC18]);
        objc_msgSend(v31, "uniqueIdentifier");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "domainIdentifier");
        v193 = v8;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[HVBiomeConversions _generateRandomVersionString]();
        v197 = v31;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "contentCreationDate");
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v191, "timeIntervalSinceReferenceDate");
        v37 = v36;
        objc_msgSend(v33, "title");
        v186 = v9;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "contentDescription");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v39;
        if (v39)
          v41 = (const __CFString *)v39;
        else
          v41 = &stru_24DD7F8A8;
        objc_msgSend(v33, "namedLocation");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v197, "protection");
        v43 = v32;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v184, "initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:summary:publication:contentProtection:", v180, v34, v35, v38, v43, v41, v37, v42, v44);

        v32 = v43;
        v9 = v186;

        v31 = v197;
        v8 = v193;

      }
      else
      {
        hv_default_log_handle();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v31;
          _os_log_impl(&dword_21AA1D000, v76, OS_LOG_TYPE_DEFAULT, "HVBiomeConversions: _newsArticleViewFromSearchableItem: received news item with no content: %@", (uint8_t *)&buf, 0xCu);
        }

        if (a5)
        {
          v77 = (void *)MEMORY[0x24BDD1540];
          *(_QWORD *)v206 = *MEMORY[0x24BDD0FC8];
          *(_QWORD *)&buf = CFSTR("received news item with no content");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &buf, v206, 1);
          v78 = v9;
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 4, v79);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          v9 = v78;
        }
        v30 = 0;
      }

      goto LABEL_56;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilenotes")))
    {
      v31 = v8;
      objc_opt_self();
      +[HVSearchableItemHelper textContentNoCopyRetainingBackingBuffer:](HVSearchableItemHelper, "textContentNoCopyRetainingBackingBuffer:", v31);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        objc_msgSend(v31, "attributeSet");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v46;
        v49 = objc_alloc(MEMORY[0x24BE0CC28]);
        objc_msgSend(v31, "uniqueIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "domainIdentifier");
        v194 = v8;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[HVBiomeConversions _generateRandomVersionString]();
        v187 = v9;
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "contentCreationDate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "timeIntervalSinceReferenceDate");
        v55 = v54;
        objc_msgSend(v47, "title");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "protection");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v49;
        v46 = v48;
        v30 = (void *)objc_msgSend(v58, "initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:contentProtection:", v50, v51, v52, v56, v48, v57, v55);

        v9 = v187;
        v8 = v194;

      }
      else
      {
        hv_default_log_handle();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v31;
          _os_log_impl(&dword_21AA1D000, v84, OS_LOG_TYPE_DEFAULT, "HVBiomeConversions: _notesContentEventFromSearchableItem: received notes item with no content: %@", (uint8_t *)&buf, 0xCu);
        }

        if (a5)
        {
          v85 = (void *)MEMORY[0x24BDD1540];
          *(_QWORD *)v206 = *MEMORY[0x24BDD0FC8];
          *(_QWORD *)&buf = CFSTR("received notes item with no content");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &buf, v206, 1);
          v86 = v9;
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = v85;
          v46 = 0;
          objc_msgSend(v88, "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 4, v87);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          v9 = v86;
        }
        v30 = 0;
      }

      goto LABEL_56;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.reminders")))
    {
      v62 = v8;
      objc_opt_self();
      objc_msgSend(v62, "attributeSet");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v63 = objc_alloc(MEMORY[0x24BE0CCB8]);
      objc_msgSend(v62, "uniqueIdentifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "domainIdentifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      +[HVBiomeConversions _generateRandomVersionString]();
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "contentCreationDate");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "timeIntervalSinceReferenceDate");
      v67 = v66;
      objc_msgSend(v31, "title");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "comment");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allDay");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v174 = objc_msgSend(v192, "BOOLValue");
      objc_msgSend(v31, "completionDate");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "timeIntervalSinceReferenceDate");
      v69 = v68;
      objc_msgSend(v31, "dueDate");
      v195 = v8;
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "timeIntervalSinceReferenceDate");
      v72 = v71;
      objc_msgSend(v31, "rankingHint");
      v188 = v9;
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "intValue");
      objc_msgSend(v62, "protection");
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v136) = v74;
      v30 = (void *)objc_msgSend(v63, "initWithUniqueId:domainId:personaId:absoluteTimestamp:title:notes:isAllDay:completionDateTimestamp:dueDateTimestamp:priority:contentProtection:", v64, v65, v185, v179, v176, v174, v67, v69, v72, v136, v75);

      v9 = v188;
      v8 = v195;

LABEL_56:
      goto LABEL_81;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
    {
      +[HVBiomeConversions _safariPageViewFromSearchableItem:error:]((uint64_t)a1, v8, a5);
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.usernotificationsd")))
    {
      hv_default_log_handle();
      v127 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        v128 = "HVBiomeConversions: biomeEventFromSearchableItem: harvesting notifications is no longer supported";
        v129 = v127;
        v130 = 2;
LABEL_92:
        _os_log_impl(&dword_21AA1D000, v129, OS_LOG_TYPE_INFO, v128, (uint8_t *)&buf, v130);
      }
    }
    else
    {
      if (!objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.")))
      {
        +[HVBiomeConversions _thirdPartyAppContentEventFromSearchableItem:error:]((uint64_t)a1, v8);
        v29 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      hv_default_log_handle();
      v127 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v9;
        v128 = "HVBiomeConversions: biomeEventFromSearchableItem: ignoring CSSI from unsupported first party app: %@.";
        v129 = v127;
        v130 = 12;
        goto LABEL_92;
      }
    }

    v30 = 0;
    goto LABEL_81;
  }
  objc_msgSend(a1, "_messagesContentEventFromSearchableItem:error:", v8, a5);
  v29 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v30 = (void *)v29;
LABEL_81:

  return v30;
}

+ (id)_messagesContentEventFromSearchableItem:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void (**v17)(_QWORD);
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  Class v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  Class v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  Class v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  Class v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  Class v59;
  id v60;
  void *v61;
  id v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  _QWORD v100[4];
  id v101;
  uint8_t buf[4];
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v100[0] = MEMORY[0x24BDAC760];
  v100[1] = 3221225472;
  v100[2] = __68__HVBiomeConversions__messagesContentEventFromSearchableItem_error___block_invoke;
  v100[3] = &unk_24DD7F010;
  v7 = v6;
  v101 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x22074FF64](v100);
  objc_msgSend(v7, "attributeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domainIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("attachmentDomain"));

  if (v11)
  {
    objc_msgSend(v9, "accountIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "length"))
    {
      v15 = objc_alloc(MEMORY[0x24BE0CB60]);
      objc_msgSend(v9, "contentURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "absoluteString");
      v17 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v15, "initWithType:filename:path:", CFSTR("application/octet-stream"), v14, v18);

      v8 = v17;
    }
    else
    {
      v19 = 0;
    }

    if (!v12)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(v7, "domainIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    if (!v12)
    {
LABEL_15:
      hv_default_log_handle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v8[2](v8);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v103 = v40;
        _os_log_error_impl(&dword_21AA1D000, v27, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _messagesContentEventFromSearchableItem: ignoring CSSI %{public}@ with missing conversation identifier.", buf, 0xCu);

      }
      if (a4)
      {
        v25 = (void *)MEMORY[0x24BDD1540];
        v26 = 5;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
  }
  objc_msgSend(v9, "authors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (!v21)
  {
    hv_default_log_handle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v8[2](v8);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v103 = v64;
      _os_log_error_impl(&dword_21AA1D000, v24, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _messagesContentEventFromSearchableItem: ignoring CSSI %{public}@ with no authors.", buf, 0xCu);

    }
    if (a4)
    {
      v25 = (void *)MEMORY[0x24BDD1540];
      v26 = 4;
LABEL_19:
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), v26, 0);
      v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_73;
    }
LABEL_20:
    v28 = 0;
    goto LABEL_73;
  }
  +[HVSearchableItemHelper textContentNoCopyRetainingBackingBuffer:](HVSearchableItemHelper, "textContentNoCopyRetainingBackingBuffer:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDC23C0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mobilesms_suggested_contact_photo"), 0, 0, 0, 0);
    v97 = (void *)v23;
    if (v23)
    {
      objc_msgSend(v9, "valueForCustomKey:", v23);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v99 = 0;
    }
    objc_msgSend(v9, "primaryRecipients");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[HVBiomeConversions _bmNamedHandlesFromCSPersons:]((uint64_t)a1, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v98 = v31;
    if (objc_msgSend(v31, "count"))
    {
      v74 = objc_alloc(MEMORY[0x24BE0CC00]);
      objc_msgSend(v7, "uniqueIdentifier");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "domainIdentifier");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      +[HVBiomeConversions _generateRandomVersionString]();
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentCreationDate");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "timeIntervalSinceReferenceDate");
      v33 = v32;
      objc_msgSend(v9, "authors");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "firstObject");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      +[HVBiomeConversions _bmNamedHandleFromCSPerson:]((uint64_t)a1, v76);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attributeForKey:", *MEMORY[0x24BDC2370]);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accountHandles");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accountType");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URL");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "protection");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "isNew");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "isTwoFactorCode");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "isFromMe");
      v81 = (id)objc_claimAutoreleasedReturnValue();
      v75 = v81;
      if (!v81)
      {
        v34 = v22;
        objc_msgSend(v9, "attributeForKey:", CFSTR("com_apple_mobilesms_fromMe"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = NSClassFromString(CFSTR("NSNumber"));
        v37 = v35;
        if (v36)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v38 = v37;
          else
            v38 = 0;
        }
        else
        {
          v38 = 0;
        }
        v81 = v38;

        v22 = v34;
      }
      v96 = v22;
      objc_msgSend(v9, "isGroupThread");
      v80 = (id)objc_claimAutoreleasedReturnValue();
      v73 = v80;
      if (!v80)
      {
        objc_msgSend(v9, "attributeForKey:", CFSTR("com_apple_mobilesms_isGroupChat"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = NSClassFromString(CFSTR("NSNumber"));
        v43 = v41;
        if (v42)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v44 = v43;
          else
            v44 = 0;
        }
        else
        {
          v44 = 0;
        }
        v80 = v44;

      }
      objc_msgSend(v9, "isLikelyJunk");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "messageRead");
      v46 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "isPinned");
      v47 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attributeForKey:", CFSTR("com_apple_mobilesms_businessChat"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = NSClassFromString(CFSTR("NSNumber"));
      v50 = v48;
      if (v49)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v51 = v50;
        else
          v51 = 0;
      }
      else
      {
        v51 = 0;
      }
      v83 = v51;

      objc_msgSend(v9, "tapbackAssociatedMessageID");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v9, "messageTapbackType"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "messageType");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "messageService");
      v52 = (id)objc_claimAutoreleasedReturnValue();
      v69 = v52;
      if (!v52)
      {
        objc_msgSend(v9, "attributeForKey:", CFSTR("com_apple_mobilesms_service"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = NSClassFromString(CFSTR("NSString"));
        v55 = v53;
        if (v54)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v56 = v55;
          else
            v56 = 0;
        }
        else
        {
          v56 = 0;
        }
        v52 = v56;

      }
      v79 = v52;
      v82 = (void *)v47;
      v84 = (void *)v46;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v9, "messageEffectType"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "isMessageFromKnownSender");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attributeForKey:", CFSTR("com_apple_mobilesms_chatUniqueIdentifier"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = NSClassFromString(CFSTR("NSString"));
      v60 = v58;
      if (v59)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v61 = v60;
        else
          v61 = 0;
      }
      else
      {
        v61 = 0;
      }
      v62 = v61;

      v28 = (void *)objc_msgSend(v74, "initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:", v95, v94, v93, v12, v92, v98, v33, v91, v99, v96, &stru_24DD7F8A8, v90, v89,
                      v19,
                      v88,
                      v87,
                      v86,
                      v85,
                      v81,
                      v80,
                      v45,
                      v84,
                      v82,
                      v83,
                      v72,
                      v71,
                      v70,
                      v79,
                      v68,
                      v57,
                      v62);

      if (!v69)
      if (!v73)

      v22 = v96;
      if (!v75)

    }
    else
    {
      hv_default_log_handle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v8[2](v8);
        v66 = v22;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v103 = v67;
        _os_log_error_impl(&dword_21AA1D000, v39, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _messagesContentEventFromSearchableItem: ignoring CSSI %{public}@ missing recipients.", buf, 0xCu);

        v22 = v66;
      }

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 4, 0);
        v28 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }
    }

  }
  else
  {
    hv_default_log_handle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v8[2](v8);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v103 = v65;
      _os_log_error_impl(&dword_21AA1D000, v29, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _messagesContentEventFromSearchableItem: ignoring CSSI %{public}@ missing text content.", buf, 0xCu);

      v22 = 0;
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 4, 0);
      v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
  }

LABEL_73:
  return v28;
}

id __68__HVBiomeConversions__messagesContentEventFromSearchableItem_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "domainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("bid:%@, uid:%@, did:%@"), v3, v4, v5);

  return v6;
}

+ (id)_bmNamedHandlesFromCSPersons:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];

  v2 = a2;
  v3 = objc_opt_self();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__HVBiomeConversions__bmNamedHandlesFromCSPersons___block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__CSPerson_8l;
  v6[4] = v3;
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_generateRandomVersionString
{
  objc_opt_self();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%08x"), arc4random());
}

+ (id)_bmNamedHandleFromCSPerson:(uint64_t)a1
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc(MEMORY[0x24BE0CC10]);
  objc_msgSend(v2, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v3, "initWithName:handleType:handle:contactIdentifier:", v4, v5, v7, v8);
  return v9;
}

id __51__HVBiomeConversions__bmNamedHandlesFromCSPersons___block_invoke(uint64_t a1, void *a2)
{
  return +[HVBiomeConversions _bmNamedHandleFromCSPerson:](*(_QWORD *)(a1 + 32), a2);
}

+ (id)_safariPageViewFromSearchableItem:(_QWORD *)a3 error:
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v34;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_opt_self();
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textContentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ReaderText"));

  objc_msgSend(v5, "contentURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    +[HVSearchableItemHelper textContentNoCopyRetainingBackingBuffer:](HVSearchableItemHelper, "textContentNoCopyRetainingBackingBuffer:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v35 = (void *)v11;
      objc_msgSend(v5, "lastUsedDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        hv_default_log_handle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_21AA1D000, v13, OS_LOG_TYPE_FAULT, "HVBiomeConversions: attributes.lastUsedDate nil on Safari event", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v14 = objc_alloc(MEMORY[0x24BE0CCE8]);
      objc_msgSend(v4, "uniqueIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "domainIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HVBiomeConversions _generateRandomVersionString]();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v18 = v17;
      objc_msgSend(v5, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "protection");
      v20 = v4;
      v21 = v5;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v14;
      v24 = v35;
      v25 = (void *)objc_msgSend(v23, "initWithUniqueId:domainId:personaId:absoluteTimestamp:title:content:contentIsReaderText:url:contentProtection:", v34, v15, v16, v19, v35, v7, v18, v8, v22);

      v5 = v21;
      v4 = v20;

      goto LABEL_17;
    }
    hv_default_log_handle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v4;
      _os_log_impl(&dword_21AA1D000, v31, OS_LOG_TYPE_DEFAULT, "HVBiomeConversions: _safariPageViewFromSearchableItem: received item with no content: %@", buf, 0xCu);
    }

    if (a3)
    {
      v32 = (void *)MEMORY[0x24BDD1540];
      v36 = *MEMORY[0x24BDD0FC8];
      v37 = CFSTR("received item with no content");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 4, v12);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      goto LABEL_16;
    }
    v24 = 0;
LABEL_19:
    v25 = 0;
    goto LABEL_20;
  }
  v26 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v4, "uniqueIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("ignoring CSSI %@ due to missing contentURL"), v27);

  hv_default_log_handle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v24;
    _os_log_error_impl(&dword_21AA1D000, v28, OS_LOG_TYPE_ERROR, "HVBiomeConversions: safariPageViewFromSearchableItem: %@", buf, 0xCu);
  }

  if (!a3)
    goto LABEL_19;
  v29 = (void *)MEMORY[0x24BDD1540];
  v38 = *MEMORY[0x24BDD0FC8];
  v39 = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 7, v12);
  v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v25 = 0;
  *a3 = v30;
LABEL_17:

LABEL_20:
  return v25;
}

+ (id)_thirdPartyAppContentEventFromSearchableItem:(uint64_t)a1 error:(void *)a2
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HVSearchableItemHelper textContentNoCopyRetainingBackingBuffer:](HVSearchableItemHelper, "textContentNoCopyRetainingBackingBuffer:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE0CDD0]);
  objc_msgSend(v2, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HVBiomeConversions _generateRandomVersionString]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentCreationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(v3, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "comment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "protection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v5, "initWithUniqueId:domainId:bundleId:personaId:absoluteTimestamp:title:desc:comment:content:contentProtection:", v17, v16, v15, v6, v9, v10, v8, v11, v4, v12);
  return v14;
}

id __64__HVBiomeConversions__mailContentEventFromSearchableItem_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "emailHeaders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (!objc_msgSend(CFSTR("message-id"), "caseInsensitiveCompare:", v7))
        {
          objc_msgSend(*(id *)(a1 + 32), "emailHeaders");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_pas_componentsJoinedByString:", CFSTR(", "));
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  v11 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "domainIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = CFSTR("UNKNOWN!");
  if (v8)
    v16 = v8;
  v17 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("bid:%@, uid:%@, did:%@, mid:%@"), v12, v13, v14, v16);

  return v17;
}

@end
