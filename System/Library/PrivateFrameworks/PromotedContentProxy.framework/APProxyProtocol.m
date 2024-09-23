@implementation APProxyProtocol

+ (void)start
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[16];

  objc_msgSend_registerClass_(MEMORY[0x24BDB7498], a2, (uint64_t)a1, v2, v3);
  objc_msgSend_registerSchemeForCustomProtocol_(MEMORY[0x24BDFA8C0], v4, (uint64_t)CFSTR("pc-x-tag-http"), v5, v6);
  objc_msgSend_registerSchemeForCustomProtocol_(MEMORY[0x24BDFA8C0], v7, (uint64_t)CFSTR("pc-x-tag-https"), v8, v9);
  objc_msgSend_registerSchemeForCustomProtocol_(MEMORY[0x24BDFA8C0], v10, (uint64_t)CFSTR("pc-video-http"), v11, v12);
  objc_msgSend_registerSchemeForCustomProtocol_(MEMORY[0x24BDFA8C0], v13, (uint64_t)CFSTR("pc-video-https"), v14, v15);
  *MEMORY[0x24BE022B8] = 1;
  APLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_22ACB2000, v16, OS_LOG_TYPE_DEFAULT, "Proxy has started.", v17, 2u);
  }

}

+ (void)setProxyURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7, v8))
  {
    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v9, (uint64_t)v4, v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend_properties(a1, v12, v13, v14, v15);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_proxySessionConfigurationProvider(v17, v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setProxyURL_(v22, v23, (uint64_t)v16, v24, v25);

    }
    else
    {
      APLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v26 = 138543362;
        v27 = v4;
        _os_log_impl(&dword_22ACB2000, v17, OS_LOG_TYPE_ERROR, "Could not form valid URL from %{public}@", (uint8_t *)&v26, 0xCu);
      }
    }

  }
}

+ (BOOL)canInitWithRequest:(id)a3
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
  char isEqualToString;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
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
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;

  v3 = a3;
  if ((objc_msgSend_recursiveRequestFlag(v3, v4, v5, v6, v7) & 1) != 0)
  {
    isEqualToString = 0;
  }
  else
  {
    objc_msgSend_URL(v3, v8, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scheme(v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v18, v19, (uint64_t)CFSTR("pc-x-tag-http"), v20, v21) & 1) != 0)
    {
      isEqualToString = 1;
    }
    else
    {
      objc_msgSend_URL(v3, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_scheme(v26, v27, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v31, v32, (uint64_t)CFSTR("pc-x-tag-https"), v33, v34) & 1) != 0)
      {
        isEqualToString = 1;
      }
      else
      {
        objc_msgSend_URL(v3, v35, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_scheme(v39, v40, v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v44, v45, (uint64_t)CFSTR("pc-video-http"), v46, v47) & 1) != 0)
        {
          isEqualToString = 1;
        }
        else
        {
          objc_msgSend_URL(v3, v48, v49, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_scheme(v52, v53, v54, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v57, v58, (uint64_t)CFSTR("pc-video-https"), v59, v60);

        }
      }

    }
  }

  return isEqualToString;
}

+ (APProxyProtocolProperties)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22ACB3444;
  block[3] = &unk_24F4E18B8;
  block[4] = a1;
  if (qword_253DE25A8 != -1)
    dispatch_once(&qword_253DE25A8, block);
  return (APProxyProtocolProperties *)(id)qword_253DE25B0;
}

+ (void)stop
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  *MEMORY[0x24BE022B8] = 0;
  objc_msgSend_unregisterClass_(MEMORY[0x24BDB7498], a2, (uint64_t)a1, v2, v3);
  objc_msgSend_unregisterSchemeForCustomProtocol_(MEMORY[0x24BDFA8C0], v4, (uint64_t)CFSTR("pc-x-tag-http"), v5, v6);
  objc_msgSend_unregisterSchemeForCustomProtocol_(MEMORY[0x24BDFA8C0], v7, (uint64_t)CFSTR("pc-x-tag-https"), v8, v9);
  objc_msgSend_unregisterSchemeForCustomProtocol_(MEMORY[0x24BDFA8C0], v10, (uint64_t)CFSTR("pc-video-http"), v11, v12);
  objc_msgSend_unregisterSchemeForCustomProtocol_(MEMORY[0x24BDFA8C0], v13, (uint64_t)CFSTR("pc-video-https"), v14, v15);
}

+ (void)invalidateProxyDemultiplexerSessionForId:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend_properties(v4, v5, v6, v7, v8);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sessionDemultiplexerManager(v17, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterSessionDemultiplexerWithIdentifier_(v13, v14, (uint64_t)v3, v15, v16);

}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  objc_msgSend_sessionDemux(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_task(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeTask_(v6, v12, (uint64_t)v11, v13, v14);

  v15.receiver = self;
  v15.super_class = (Class)APProxyProtocol;
  -[NSURLProtocol dealloc](&v15, sel_dealloc);
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
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
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;

  v3 = a3;
  v8 = (void *)objc_msgSend_mutableCopy(v3, v4, v5, v6, v7);
  objc_msgSend_URL(v3, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scheme(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_isEqualToString_(v18, v19, (uint64_t)CFSTR("pc-x-tag-http"), v20, v21))
  {
    objc_msgSend_URL(v3, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_changeSchemeToString_(v26, v27, (uint64_t)CFSTR("http"), v28, v29);
LABEL_7:
    v45 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    objc_msgSend_setRequestType_(v8, v46, 1, v47, v48);
    objc_msgSend_setURL_(v8, v49, (uint64_t)v45, v50, v51);
    goto LABEL_18;
  }
  if (objc_msgSend_isEqualToString_(v18, v22, (uint64_t)CFSTR("pc-video-http"), v24, v25))
  {
    objc_msgSend_URL(v3, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_changeSchemeToString_(v34, v35, (uint64_t)CFSTR("http"), v36, v37);
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v18, v30, (uint64_t)CFSTR("pc-x-tag-https"), v32, v33))
    {
      objc_msgSend_URL(v3, v38, v39, v40, v41);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_changeSchemeToString_(v26, v42, (uint64_t)CFSTR("https"), v43, v44);
      goto LABEL_7;
    }
    if (!objc_msgSend_isEqualToString_(v18, v38, (uint64_t)CFSTR("pc-video-https"), v40, v41))
    {
      v45 = 0;
      goto LABEL_8;
    }
    objc_msgSend_URL(v3, v46, v52, v47, v48);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_changeSchemeToString_(v34, v53, (uint64_t)CFSTR("https"), v54, v55);
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setRequestType_(v8, v56, 2, v57, v58);
  objc_msgSend_absoluteString(v45, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByRemovingPercentEncoding(v63, v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v69, (uint64_t)v68, v70, v71);
    v72 = objc_claimAutoreleasedReturnValue();
    v76 = (void *)v72;
    if (v72)
      objc_msgSend_setURL_(v8, v73, v72, v74, v75);
    else
      objc_msgSend_setURL_(v8, v73, (uint64_t)v45, v74, v75);

  }
  else
  {
    objc_msgSend_setURL_(v8, v69, (uint64_t)v45, v70, v71);
  }

LABEL_18:
  return v8;
}

- (void)startLoading
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
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
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  NSObject *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  const char *v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  void *v202;
  void *v203;
  uint8_t buf[4];
  const char *v205;
  __int16 v206;
  void *v207;
  __int16 v208;
  void *v209;
  __int16 v210;
  void *v211;
  uint64_t v212;

  v212 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_request(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_requestType(v6, v7, v8, v9, v10);
  objc_msgSend_setRequestType_(self, v12, v11, v13, v14);

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x24BDBCE60], v15, v16, v17, v18);
  objc_msgSend_setStartTime_(self, v19, v20, v21, v22);
  objc_msgSend_currentThread(MEMORY[0x24BDD17F0], v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientThread_(self, v28, (uint64_t)v27, v29, v30);

  v35 = objc_msgSend_requestType(self, v31, v32, v33, v34);
  objc_msgSend_request(self, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v40;
  if (v35 == 1)
  {
    objc_msgSend_adIdentifier(v40, v41, v42, v43, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_request(self, v47, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_maximumRequestCount(v51, v52, v53, v54, v55);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      v60 = (int)objc_msgSend_intValue(v45, v56, v57, v58, v59);
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend_URL(v40, v41, v42, v43, v44);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_videoAdIdentifier(v61, v62, v63, v64, v65);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v60 = -1;
LABEL_6:

  if (objc_msgSend_length(v46, v66, v67, v68, v69))
  {
    objc_msgSend_request(self, v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)objc_msgSend_mutableCopy(v74, v75, v76, v77, v78);

    if (objc_msgSend_requestType(self, v80, v81, v82, v83) == 2)
    {
      objc_msgSend_URL(v79, v84, v85, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeVideoAdIdentifier(v88, v89, v90, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setURL_(v79, v94, (uint64_t)v93, v95, v96);

    }
    objc_msgSend_setRecursiveRequestFlag(v79, v84, v85, v86, v87);
    objc_msgSend__currentRunLoopModes(self, v97, v98, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setModes_(self, v102, (uint64_t)v101, v103, v104);

    v105 = (void *)objc_opt_class();
    objc_msgSend_properties(v105, v106, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sessionDemultiplexerManager(v110, v111, v112, v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sessionDemultiplexerForAdByIdentifier_maximumRequestCount_(v115, v116, (uint64_t)v46, v60, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSessionDemux_(self, v119, (uint64_t)v118, v120, v121);

    objc_msgSend_sessionDemux(self, v122, v123, v124, v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modes(self, v127, v128, v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataTaskWithRequest_delegate_modes_(v126, v132, (uint64_t)v79, (uint64_t)self, (uint64_t)v131);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTask_(self, v134, (uint64_t)v133, v135, v136);

    objc_msgSend_task(self, v137, v138, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTaskDescription_(v141, v142, (uint64_t)v46, v143, v144);

    APLogForCategory();
    v145 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_task(self, v146, v147, v148, v149);
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_taskDescription(v202, v150, v151, v152, v153);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_task(self, v155, v156, v157, v158);
      v203 = v115;
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v159, v160, v161, v162, v163);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(v79, v165, v166, v167, v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v169, v170, v171, v172, v173);
      v174 = v46;
      v175 = v110;
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136643587;
      v205 = "-[APProxyProtocol startLoading]";
      v206 = 2114;
      v207 = v154;
      v208 = 2114;
      v209 = v164;
      v210 = 2114;
      v211 = v176;
      _os_log_impl(&dword_22ACB2000, v145, OS_LOG_TYPE_DEFAULT, "%{sensitive}s: %{public}@ starting request %{public}@ for %{public}@", buf, 0x2Au);

      v110 = v175;
      v46 = v174;

      v115 = v203;
    }

    objc_msgSend_task(self, v177, v178, v179, v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();

    if (v181)
    {
      objc_msgSend_task(self, v182, v183, v184, v185);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resume(v186, v187, v188, v189, v190);
    }
    else
    {
      objc_msgSend_client(self, v182, v183, v184, v185);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v198, *MEMORY[0x24BDD0B88], 3328, 0);
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLProtocol_didFailWithError_(v186, v200, (uint64_t)self, (uint64_t)v199, v201);

    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v70, *MEMORY[0x24BDD0B88], 3328, 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_client(self, v191, v192, v193, v194);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLProtocol_didFailWithError_(v195, v196, (uint64_t)self, (uint64_t)v79, v197);

  }
}

- (void)stopLoading
{
  NSObject *v3;
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
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
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
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  const char *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  double v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  APLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_task(self, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_taskDescription(v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x24BDBCE60], v14, v15, v16, v17);
    v19 = v18;
    objc_msgSend_startTime(self, v20, v21, v22, v23);
    v55 = 136643331;
    v56 = "-[APProxyProtocol stopLoading]";
    v57 = 2114;
    v58 = v13;
    v59 = 2048;
    v60 = v19 - v24;
    _os_log_impl(&dword_22ACB2000, v3, OS_LOG_TYPE_DEFAULT, "%{sensitive}s: %{public}@ Request stopped after: (elapsed %.1f)", (uint8_t *)&v55, 0x20u);

  }
  objc_msgSend_task(self, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_task(self, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancel(v34, v35, v36, v37, v38);

    objc_msgSend_sessionDemux(self, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_task(self, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeTask_(v43, v49, (uint64_t)v48, v50, v51);

    objc_msgSend_setTask_(self, v52, 0, v53, v54);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void (**v15)(id, uint64_t);

  v15 = (void (**)(id, uint64_t))a6;
  v8 = a5;
  objc_msgSend_client(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLProtocol_didReceiveResponse_cacheStoragePolicy_(v13, v14, (uint64_t)self, (uint64_t)v8, 2);

  v15[2](v15, 1);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v6 = a5;
  objc_msgSend_client(self, v7, v8, v9, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLProtocol_didLoadData_(v13, v11, (uint64_t)self, (uint64_t)v6, v12);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  const char *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v14 = a5;
  if (!v14)
  {
    objc_msgSend_response(v9, v10, v11, v12, v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_client(self, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLProtocolDidFinishLoading_(v49, v50, (uint64_t)self, v51, v52);

    if (v30 && objc_msgSend_statusCode(v30, v53, v54, v55, v56) != 200)
    {
      APLogForCategory();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_taskDescription(v9, v58, v59, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 136643331;
        v68 = "-[APProxyProtocol URLSession:task:didCompleteWithError:]";
        v69 = 2114;
        v70 = v62;
        v71 = 2050;
        v72 = objc_msgSend_statusCode(v30, v63, v64, v65, v66);
        _os_log_impl(&dword_22ACB2000, v57, OS_LOG_TYPE_DEFAULT, "%{sensitive}s: %{public}@ -- Finished load with HTTP error: %{public}ld", (uint8_t *)&v67, 0x20u);

      }
    }
    goto LABEL_12;
  }
  APLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_taskDescription(v9, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedDescription(v14, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 136643331;
    v68 = "-[APProxyProtocol URLSession:task:didCompleteWithError:]";
    v69 = 2114;
    v70 = v20;
    v71 = 2114;
    v72 = (uint64_t)v25;
    _os_log_impl(&dword_22ACB2000, v15, OS_LOG_TYPE_DEFAULT, "%{sensitive}s: %{public}@ -- Finished load with error: %{public}@", (uint8_t *)&v67, 0x20u);

  }
  objc_msgSend_domain(v14, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v30, v31, *MEMORY[0x24BDD1308], v32, v33) & 1) != 0)
  {
LABEL_12:

    goto LABEL_13;
  }
  v38 = objc_msgSend_code(v14, v34, v35, v36, v37);

  if (v38 != -999)
  {
    objc_msgSend_client(self, v39, v40, v41, v42);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLProtocol_didFailWithError_(v30, v43, (uint64_t)self, (uint64_t)v14, v44);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, id);
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
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
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  id v152;
  id v153;
  id v154;
  uint8_t buf[4];
  void *v156;
  __int16 v157;
  void *v158;
  __int16 v159;
  void *v160;
  __int16 v161;
  void *v162;
  uint64_t v163;

  v163 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, id))a7;
  v19 = objc_msgSend_requestType(self, v15, v16, v17, v18);
  APLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v19 == 2)
  {
    if (v21)
    {
      objc_msgSend_currentRequest(v11, v22, v23, v24, v25);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(v149, v26, v27, v28, v29);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_host(v147, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(v13, v35, v36, v37, v38);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_host(v145, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_currentRequest(v11, v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(v48, v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v53, v54, v55, v56, v57);
      v151 = v12;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(v13, v59, v60, v61, v62);
      v153 = v11;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v63, v64, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v156 = v34;
      v157 = 2114;
      v158 = v43;
      v159 = 2114;
      v160 = v58;
      v161 = 2114;
      v162 = v68;
      _os_log_impl(&dword_22ACB2000, v20, OS_LOG_TYPE_INFO, "APProxyProtocol: A redirect '%{public}@'->'%{public}@' has been received. Original URL:\n%{public}@\nRedirected URL:\n%{public}@", buf, 0x2Au);

      v11 = v153;
      v12 = v151;

    }
    if (v14)
      v14[2](v14, v13);
  }
  else
  {
    if (v21)
    {
      objc_msgSend_currentRequest(v11, v22, v23, v24, v25);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(v150, v69, v70, v71, v72);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_host(v148, v73, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(v13, v78, v79, v80, v81);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_host(v146, v82, v83, v84, v85);
      v152 = v12;
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_currentRequest(v11, v87, v88, v89, v90);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(v144, v91, v92, v93, v94);
      v154 = v11;
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v95, v96, v97, v98, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(v13, v101, v102, v103, v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v105, v106, v107, v108, v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v156 = v77;
      v157 = 2114;
      v158 = v86;
      v159 = 2114;
      v160 = v100;
      v161 = 2114;
      v162 = v110;
      _os_log_impl(&dword_22ACB2000, v20, OS_LOG_TYPE_INFO, "APProxyProtocol: Blocked redirect '%{public}@'->'%{public}@'. Original URL:\n%{public}@\nRedirected URL:\n%{public}@", buf, 0x2Au);

      v11 = v154;
      v12 = v152;

    }
    v115 = (void *)objc_msgSend_mutableCopy(v13, v111, v112, v113, v114);
    objc_msgSend_removeRecursiveRequestFlag(v115, v116, v117, v118, v119);
    objc_msgSend_client(self, v120, v121, v122, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLProtocol_wasRedirectedToRequest_redirectResponse_(v124, v125, (uint64_t)self, (uint64_t)v115, (uint64_t)v12);

    objc_msgSend_task(self, v126, v127, v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancel(v130, v131, v132, v133, v134);

    objc_msgSend_client(self, v135, v136, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v140, *MEMORY[0x24BDD0B88], 3072, 0);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLProtocol_didFailWithError_(v139, v142, (uint64_t)self, (uint64_t)v141, v143);

    if (v14)
      v14[2](v14, 0);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char isKindOfClass;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  int v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (void (**)(id, _QWORD, void *))a6;
  APLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_currentRequest(v8, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URL(v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 138543362;
    v67 = (uint64_t)v26;
    _os_log_impl(&dword_22ACB2000, v11, OS_LOG_TYPE_DEBUG, "Challenge received for url session with request to %{public}@.", (uint8_t *)&v66, 0xCu);

  }
  objc_msgSend_failureResponse(v9, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_11;
  objc_msgSend_failureResponse(v9, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_statusCode(v37, v38, v39, v40, v41);

  APLogForCategory();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    v66 = 134217984;
    v67 = v42;
    _os_log_impl(&dword_22ACB2000, v43, OS_LOG_TYPE_DEBUG, "Challenge failure is related to url response with status code: %ld.", (uint8_t *)&v66, 0xCu);
  }

  if (v42 == 407)
  {
    v44 = (void *)objc_opt_class();
    objc_msgSend_properties(v44, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_proxyURLCredentialService(v49, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_originalRequest(v8, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signedCredentialForRequest_withPersistence_(v54, v60, (uint64_t)v59, 1, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    APLogForCategory();
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v62)
    {
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v66) = 0;
        _os_log_impl(&dword_22ACB2000, v64, OS_LOG_TYPE_DEBUG, "Signed credential was received for challenge.", (uint8_t *)&v66, 2u);
      }

      v10[2](v10, 0, v62);
    }
    else
    {
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v66) = 0;
        _os_log_impl(&dword_22ACB2000, v64, OS_LOG_TYPE_ERROR, "Signed credential was not received for challenge.", (uint8_t *)&v66, 2u);
      }

      v10[2](v10, 2, 0);
    }

  }
  else
  {
LABEL_11:
    APLogForCategory();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v66) = 0;
      _os_log_impl(&dword_22ACB2000, v65, OS_LOG_TYPE_DEBUG, "Challenge does not require proxy authentication.", (uint8_t *)&v66, 2u);
    }

    v10[2](v10, 1, 0);
  }

}

- (id)_currentRunLoopModes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
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

  v4 = *MEMORY[0x24BDBCA90];
  objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCEB8], a2, *MEMORY[0x24BDBCA90], v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentRunLoop(MEMORY[0x24BDBCF18], v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentMode(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && (objc_msgSend_isEqualToString_(v15, v16, v4, v18, v19) & 1) == 0)
    objc_msgSend_addObject_(v5, v16, (uint64_t)v15, v18, v19);
  v20 = (void *)objc_msgSend_copy(v5, v16, v17, v18, v19);

  return v20;
}

- (NSThread)clientThread
{
  return (NSThread *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientThread:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)modes
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSURLSessionDataTask)task
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (APNSURLSessionDemultiplexer)sessionDemux
{
  return (APNSURLSessionDemultiplexer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionDemux:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDemux, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_modes, 0);
  objc_storeStrong((id *)&self->_clientThread, 0);
}

@end
