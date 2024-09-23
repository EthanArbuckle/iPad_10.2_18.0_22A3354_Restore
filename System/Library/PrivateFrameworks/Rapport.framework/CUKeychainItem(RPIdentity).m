@implementation CUKeychainItem(RPIdentity)

- (uint64_t)updateWithRPIdentity:()RPIdentity error:
{
  return objc_msgSend(a1, "updateWithRPIdentity:revisionUpdate:error:", a3, 0, a4);
}

- (uint64_t)updateWithRPIdentity:()RPIdentity revisionUpdate:error:
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  char v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  char v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  char v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t Int64;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  void *v123;
  char v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  id v129;
  void *v130;
  char v131;
  void *v132;
  id v133;
  id v134;
  char v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  id v141;
  void *v142;
  char v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  id v149;
  void *v150;
  char v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  id v157;
  void *v158;
  char v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  id v164;
  id v165;
  void *v166;
  char v167;
  void *v168;
  void *v169;
  id v170;
  id v171;
  void *v172;
  char v173;
  void *v174;
  void *v175;
  void *v176;
  id v177;
  id v178;
  void *v179;
  char v180;
  void *v181;
  void *v182;
  unsigned int v183;
  __CFString *v184;
  __CFString *v185;
  __CFString *v186;
  char v187;
  _BOOL4 v188;
  uint64_t v189;
  id v190;
  uint64_t v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  id v197;
  id v198;
  void *v199;
  char v200;
  void *v201;
  void *v202;
  id v203;
  void *v204;
  void *v205;
  id v206;
  id v207;
  void *v208;
  char v209;
  void *v210;
  void *v211;
  id v212;
  int Int64Ranged;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  void *v217;
  void *v218;
  void *v220;
  void *v221;
  int v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  id v232;
  id v233;
  void *v234;
  _QWORD *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  id v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;

  v8 = a3;
  objc_msgSend(a1, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v254 = a1;
  objc_msgSend(a1, "secrets");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessGroups");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v12;
  v250 = v12;
  v222 = a4;
  v235 = a5;
  if (v11 == v12)
  {

    goto LABEL_6;
  }
  if ((v12 != 0) != (v11 == 0))
  {
    v14 = objc_msgSend(v11, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_8;
LABEL_6:
    v15 = 0;
    v16 = 0;
    goto LABEL_12;
  }

LABEL_8:
  v17 = (void *)objc_msgSend(v9, "mutableCopy");
  v18 = v17;
  if (v17)
  {
    v15 = v17;
  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

  }
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("accessGroups"));
  v16 = 0x80000;
LABEL_12:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountAltDSID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v249 = v19;
  v252 = v20;
  if (!objc_msgSend(v20, "length"))
    goto LABEL_25;
  v21 = v20;
  v22 = v19;
  v23 = v22;
  if (v21 == v22)
  {

    goto LABEL_25;
  }
  if ((v22 != 0) != (v21 == 0))
  {
    v24 = objc_msgSend(v21, "isEqual:", v22);

    if ((v24 & 1) != 0)
      goto LABEL_25;
    if (v15)
      goto LABEL_24;
    goto LABEL_20;
  }

  if (!v15)
  {
LABEL_20:
    v25 = (void *)objc_msgSend(v9, "mutableCopy");
    v26 = v25;
    if (v25)
    {
      v15 = v25;
    }
    else
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

    }
  }
LABEL_24:
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("accountAltDSID"));
  v16 = v16 | 0x2000000;
LABEL_25:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v248 = v27;
  if (!objc_msgSend(v28, "length"))
    goto LABEL_39;
  v29 = v28;
  v30 = v28;
  v31 = v27;
  v32 = v31;
  if (v30 == v31)
  {

  }
  else
  {
    if ((v31 != 0) == (v30 == 0))
    {

      if (!v15)
      {
LABEL_33:
        v34 = (void *)objc_msgSend(v9, "mutableCopy");
        v35 = v34;
        if (v34)
        {
          v15 = v34;
        }
        else
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

        }
      }
LABEL_37:
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, CFSTR("accountID"));
      v16 = v16 | 0x2000;
      goto LABEL_38;
    }
    v33 = objc_msgSend(v30, "isEqual:", v31);

    if ((v33 & 1) == 0)
    {
      if (!v15)
        goto LABEL_33;
      goto LABEL_37;
    }
  }
LABEL_38:
  v28 = v29;
LABEL_39:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v246 = v37;
  v247 = v28;
  v251 = v36;
  if (!objc_msgSend(v37, "length"))
    goto LABEL_52;
  v38 = v37;
  v39 = v36;
  v40 = v39;
  if (v38 == v39)
  {

    goto LABEL_52;
  }
  if ((v39 != 0) != (v38 == 0))
  {
    v41 = objc_msgSend(v38, "isEqual:", v39);

    if ((v41 & 1) != 0)
      goto LABEL_52;
    if (v15)
      goto LABEL_51;
    goto LABEL_47;
  }

  if (!v15)
  {
LABEL_47:
    v42 = (void *)objc_msgSend(v9, "mutableCopy");
    v43 = v42;
    if (v42)
    {
      v15 = v42;
    }
    else
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

    }
  }
LABEL_51:
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v38, CFSTR("contactID"));
  v16 = v16 | 0x8000;
LABEL_52:
  objc_msgSend(v8, "dateAcknowledged");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  CFDateGetTypeID();
  CFDictionaryGetTypedValue();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v44;
  v47 = v45;
  v244 = v47;
  if (v46 == v47)
  {

    goto LABEL_64;
  }
  v48 = v47;
  if ((v46 == 0) != (v47 != 0))
  {
    v49 = objc_msgSend(v46, "isEqual:", v47);

    if ((v49 & 1) != 0)
      goto LABEL_64;
    if (v15)
      goto LABEL_63;
    goto LABEL_59;
  }

  if (!v15)
  {
LABEL_59:
    v50 = (void *)objc_msgSend(v9, "mutableCopy");
    v51 = v50;
    if (v50)
    {
      v15 = v50;
    }
    else
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

    }
  }
LABEL_63:
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v46, CFSTR("dateAck"));
  v16 = v16 | 2;
LABEL_64:
  objc_msgSend(v8, "dateAdded");
  v52 = objc_claimAutoreleasedReturnValue();
  v237 = (void *)v52;
  if (!v52)
    goto LABEL_79;
  v53 = (void *)v52;
  CFDateGetTypeID();
  CFDictionaryGetTypedValue();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v53;
  v56 = v54;
  v57 = v56;
  if (v55 != v56)
  {
    v58 = v46;
    if (v56)
    {
      v59 = objc_msgSend(v55, "isEqual:", v56);

      if ((v59 & 1) != 0)
      {
LABEL_77:
        v46 = v58;
        goto LABEL_78;
      }
      if (!v15)
        goto LABEL_72;
    }
    else
    {

      if (!v15)
      {
LABEL_72:
        v60 = (void *)objc_msgSend(v9, "mutableCopy");
        v61 = v60;
        if (v60)
        {
          v15 = v60;
        }
        else
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

        }
      }
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v55, CFSTR("dateAdded"));
    v16 = v16 | 2;
    goto LABEL_77;
  }

LABEL_78:
LABEL_79:
  objc_msgSend(v8, "dateRemoved");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  CFDateGetTypeID();
  CFDictionaryGetTypedValue();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v62;
  v65 = v63;
  v66 = v64;
  v245 = v46;
  v242 = v65;
  v243 = v64;
  if (v64 == v65)
  {

    if (v64)
      goto LABEL_83;
LABEL_85:
    v253 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v253, "addObject:", CFSTR("dateRemoved"));
    goto LABEL_96;
  }
  v67 = v65;
  if ((v64 == 0) != (v65 != 0))
  {
    v68 = objc_msgSend(v64, "isEqual:", v65);

    if ((v68 & 1) != 0)
    {
      if (v66)
      {
LABEL_83:
        v253 = 0;
        goto LABEL_96;
      }
      goto LABEL_85;
    }
  }
  else
  {

  }
  if (v66)
  {
    if (!v15)
    {
      v69 = (void *)objc_msgSend(v9, "mutableCopy");
      v70 = v69;
      if (v69)
      {
        v15 = v69;
      }
      else
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

      }
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v66, CFSTR("dateRemoved"));
    v253 = 0;
  }
  else
  {
    v253 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v253, "addObject:", CFSTR("dateRemoved"));
  }
  v16 = v16 | 2;
LABEL_96:
  objc_msgSend(v8, "dateRequested");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  CFDateGetTypeID();
  CFDictionaryGetTypedValue();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v71;
  v74 = v72;
  v241 = v74;
  if (v73 == v74)
  {

    if (v73)
      goto LABEL_117;
    goto LABEL_102;
  }
  v75 = v74;
  if ((v73 == 0) != (v74 != 0))
  {
    v76 = objc_msgSend(v73, "isEqual:", v74);

    if ((v76 & 1) != 0)
    {
      if (v73)
        goto LABEL_117;
LABEL_102:
      v77 = v253;
      if (!v253)
        v77 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v253 = v77;
      objc_msgSend(v77, "addObject:", CFSTR("dateReq"));
      goto LABEL_117;
    }
  }
  else
  {

  }
  if (v73)
  {
    if (!v15)
    {
      v78 = (void *)objc_msgSend(v9, "mutableCopy");
      v79 = v78;
      if (v78)
      {
        v15 = v78;
      }
      else
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

      }
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v73, CFSTR("dateReq"));
  }
  else
  {
    v80 = v253;
    if (!v253)
      v80 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v253 = v80;
    objc_msgSend(v80, "addObject:", CFSTR("dateReq"));
  }
  v16 = v16 | 2;
LABEL_117:
  objc_msgSend(v8, "deviceIRKData");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = v81;
  if (objc_msgSend(v81, "length") != 16)
  {
    v255 = 0;
    goto LABEL_131;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v81;
  v84 = v82;
  v85 = v84;
  if (v83 == v84)
  {

  }
  else
  {
    if ((v83 == 0) == (v84 != 0))
    {

LABEL_126:
      v87 = (void *)objc_msgSend(v258, "mutableCopy");
      v88 = v87;
      if (v87)
      {
        v89 = v87;
      }
      else
      {
        v89 = objc_alloc_init(MEMORY[0x1E0C99E08]);

      }
      v255 = v89;
      objc_msgSend(v89, "setObject:forKeyedSubscript:", v83, CFSTR("dIRK"));
      v16 = v16 | 4;
      goto LABEL_130;
    }
    v86 = objc_msgSend(v83, "isEqual:", v84);

    if ((v86 & 1) == 0)
      goto LABEL_126;
  }
  v255 = 0;
LABEL_130:

LABEL_131:
  objc_msgSend(v8, "edPKData");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v239 = v90;
  if (objc_msgSend(v90, "length") != 32)
    goto LABEL_145;
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v90;
  v93 = v91;
  v94 = v93;
  if (v92 != v93)
  {
    if ((v92 == 0) != (v93 != 0))
    {
      v95 = objc_msgSend(v92, "isEqual:", v93);

      if ((v95 & 1) != 0)
        goto LABEL_144;
    }
    else
    {

    }
    v96 = v255;
    if (!v255)
    {
      v97 = (void *)objc_msgSend(v258, "mutableCopy");
      v98 = v97;
      if (v97)
      {
        v99 = v97;
      }
      else
      {
        v99 = objc_alloc_init(MEMORY[0x1E0C99E08]);

      }
      v96 = v99;
    }
    v255 = v96;
    objc_msgSend(v96, "setObject:forKeyedSubscript:", v92, CFSTR("edPK"));
    v16 = v16 | 8;
    goto LABEL_144;
  }

LABEL_144:
LABEL_145:
  objc_msgSend(v8, "edSKData");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v238 = v100;
  if (objc_msgSend(v100, "length") == 32)
  {
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v100;
    v103 = v101;
    v104 = v103;
    if (v102 != v103)
    {
      if ((v102 == 0) != (v103 != 0))
      {
        v105 = objc_msgSend(v102, "isEqual:", v103);

        if ((v105 & 1) != 0)
          goto LABEL_158;
      }
      else
      {

      }
      v106 = v255;
      if (!v255)
      {
        v107 = (void *)objc_msgSend(v258, "mutableCopy");
        v108 = v107;
        if (v107)
        {
          v109 = v107;
        }
        else
        {
          v109 = objc_alloc_init(MEMORY[0x1E0C99E08]);

        }
        v106 = v109;
      }
      v255 = v106;
      objc_msgSend(v106, "setObject:forKeyedSubscript:", v102, CFSTR("edSK"));
      v16 = v16 | 0x10;
      goto LABEL_158;
    }

LABEL_158:
  }
  Int64 = CFDictionaryGetInt64();
  v111 = objc_msgSend(v8, "featureFlags");
  if (v111)
  {
    v112 = v111;
    if (v111 != Int64)
    {
      if (!v15)
      {
        v113 = (void *)objc_msgSend(v9, "mutableCopy");
        v114 = v113;
        if (v113)
        {
          v15 = v113;
        }
        else
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v112);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v115, CFSTR("ff"));

      v16 = v16 | 0x400;
    }
  }
  v117 = v251;
  v116 = v252;
  objc_msgSend(v8, "identifier");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = v118;
    objc_msgSend(v254, "identifier");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v232 = v119;
    v121 = v119;
    v122 = v120;
    if (v121 == v122)
    {

      goto LABEL_178;
    }
    v123 = v122;
    if (v122)
    {
      v124 = objc_msgSend(v121, "isEqual:", v122);

      if ((v124 & 1) != 0)
      {
LABEL_178:
        objc_msgSend(v8, "idsDeviceID");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = v126;
        if (!v126)
          goto LABEL_195;
        v128 = v126;
        v129 = v121;
        v130 = v129;
        if (v128 == v129)
        {

        }
        else
        {
          v131 = objc_msgSend(v128, "isEqual:", v129);

          if ((v131 & 1) != 0)
            goto LABEL_195;
          CFStringGetTypeID();
          CFDictionaryGetTypedValue();
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = v128;
          v134 = v132;
          v130 = v134;
          if (v133 != v134)
          {
            if (v134)
            {
              v135 = objc_msgSend(v133, "isEqual:", v134);

              if ((v135 & 1) != 0)
                goto LABEL_194;
            }
            else
            {

            }
            if (!v15)
            {
              v136 = (void *)objc_msgSend(v9, "mutableCopy");
              v137 = v136;
              if (v136)
              {
                v15 = v136;
              }
              else
              {
                v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

              }
            }
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v133, CFSTR("idsDeviceID"));
            v16 = v16 | 0x40;
            goto LABEL_194;
          }

        }
LABEL_194:

LABEL_195:
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mediaRemoteID");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v234 = v138;
        v231 = v139;
        if (!objc_msgSend(v139, "length"))
          goto LABEL_208;
        v140 = v139;
        v141 = v138;
        v142 = v141;
        if (v140 == v141)
        {

        }
        else
        {
          if ((v141 != 0) != (v140 == 0))
          {
            v143 = objc_msgSend(v140, "isEqual:", v141);

            if ((v143 & 1) != 0)
            {
              v138 = v234;
              goto LABEL_208;
            }
          }
          else
          {

          }
          v138 = v234;
          if (!v15)
          {
            v144 = (void *)objc_msgSend(v9, "mutableCopy");
            v145 = v144;
            if (v144)
            {
              v15 = v144;
            }
            else
            {
              v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

            }
          }
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v140, CFSTR("mediaRemoteID"));
          v16 = v16 | 0x10000;
        }
LABEL_208:
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mediaRouteID");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v229 = v147;
        v230 = v146;
        if (!objc_msgSend(v147, "length"))
          goto LABEL_221;
        v148 = v147;
        v149 = v146;
        v150 = v149;
        if (v148 == v149)
        {

        }
        else
        {
          if ((v149 != 0) != (v148 == 0))
          {
            v151 = objc_msgSend(v148, "isEqual:", v149);

            if ((v151 & 1) != 0)
            {
              v138 = v234;
              goto LABEL_221;
            }
          }
          else
          {

          }
          v138 = v234;
          if (!v15)
          {
            v152 = (void *)objc_msgSend(v9, "mutableCopy");
            v153 = v152;
            if (v152)
            {
              v15 = v152;
            }
            else
            {
              v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

            }
          }
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v148, CFSTR("mediaRouteID"));
          v16 = v16 | 0x20000;
        }
LABEL_221:
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "model");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v227 = v155;
        v228 = v154;
        if (!objc_msgSend(v155, "length"))
          goto LABEL_234;
        v156 = v155;
        v157 = v154;
        v158 = v157;
        if (v156 == v157)
        {

        }
        else
        {
          if ((v157 != 0) != (v156 == 0))
          {
            v159 = objc_msgSend(v156, "isEqual:", v157);

            if ((v159 & 1) != 0)
            {
              v138 = v234;
              goto LABEL_234;
            }
          }
          else
          {

          }
          v138 = v234;
          if (!v15)
          {
            v160 = (void *)objc_msgSend(v9, "mutableCopy");
            v161 = v160;
            if (v160)
            {
              v15 = v160;
            }
            else
            {
              v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

            }
          }
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v156, CFSTR("model"));
          v16 = v16 | 0x80;
        }
LABEL_234:
        objc_msgSend(v254, "name");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v225 = v163;
        v226 = v162;
        if (!objc_msgSend(v163, "length"))
          goto LABEL_243;
        v164 = v163;
        v165 = v162;
        v166 = v165;
        if (v164 == v165)
        {

          goto LABEL_243;
        }
        if ((v165 != 0) != (v164 == 0))
        {
          v167 = objc_msgSend(v164, "isEqual:", v165);

          if ((v167 & 1) != 0)
            goto LABEL_242;
        }
        else
        {

        }
        objc_msgSend(v254, "setName:", v164);
        v16 = v16 | 0x100;
LABEL_242:
        v138 = v234;
LABEL_243:
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sendersKnownAlias");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        v233 = v11;
        v223 = v169;
        v224 = v168;
        if (!objc_msgSend(v169, "length"))
          goto LABEL_256;
        v170 = v169;
        v171 = v168;
        v172 = v171;
        if (v170 == v171)
        {

        }
        else
        {
          if ((v171 != 0) != (v170 == 0))
          {
            v173 = objc_msgSend(v170, "isEqual:", v171);

            if ((v173 & 1) != 0)
            {
              v11 = v233;
              goto LABEL_256;
            }
          }
          else
          {

          }
          v11 = v233;
          if (!v15)
          {
            v174 = (void *)objc_msgSend(v9, "mutableCopy");
            v175 = v174;
            if (v174)
            {
              v15 = v174;
            }
            else
            {
              v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

            }
          }
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v170, CFSTR("ska"));
          v16 = v16 | 0x40000;
        }
LABEL_256:
        objc_opt_class();
        NSDictionaryGetNSArrayOfClass();
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allUsedSendersKnownAliases");
        v177 = (id)objc_claimAutoreleasedReturnValue();
        v178 = v176;
        v179 = v178;
        if (v177 == v178)
        {

LABEL_269:
          v183 = objc_msgSend(v8, "type") - 1;
          if (v183 >= 0xC || ((0x8FFu >> v183) & 1) == 0)
          {
            if (v235)
            {
              objc_msgSend(v8, "type");
              RPErrorF();
              *v235 = (id)objc_claimAutoreleasedReturnValue();
            }
            v16 = 1;
LABEL_330:

            v117 = v251;
            v116 = v252;
            v125 = v237;
            v118 = v232;
            goto LABEL_331;
          }
          v236 = v127;
          v184 = off_1E5F506C0[v183];
          objc_msgSend(v254, "type");
          v185 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          if (v184 != v185)
          {
            v186 = v185;
            if (!v185
              || (v187 = -[__CFString isEqual:](v184, "isEqual:", v185),
                  v186,
                  v186,
                  (v187 & 1) == 0))
            {
              objc_msgSend(v254, "setType:", v184);
              v16 = v16 | 0x200;
            }
          }
          v188 = CFDictionaryGetInt64() == 0;
          v189 = objc_msgSend(v8, "userAdded");
          v190 = v253;
          if (((v188 ^ v189) & 1) == 0)
          {
            v191 = v189;
            if (!v15)
            {
              v192 = (void *)objc_msgSend(v9, "mutableCopy");
              v193 = v192;
              if (v192)
              {
                v15 = v192;
              }
              else
              {
                v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

              }
              v190 = v253;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v191);
            v194 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v194, CFSTR("userAdded"));

            v16 = v16 | 0x4000;
          }
          objc_msgSend(v8, "btIRKData");
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          v221 = v195;
          if (objc_msgSend(v195, "length") != 16)
          {
LABEL_299:
            objc_msgSend(v8, "btAddress");
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            v220 = v204;
            if (objc_msgSend(v204, "length") != 7)
              goto LABEL_313;
            CFDataGetTypeID();
            CFDictionaryGetTypedValue();
            v205 = (void *)objc_claimAutoreleasedReturnValue();
            v206 = v204;
            v207 = v205;
            v208 = v207;
            if (v206 != v207)
            {
              if ((v206 == 0) != (v207 != 0))
              {
                v209 = objc_msgSend(v206, "isEqual:", v207);

                if ((v209 & 1) != 0)
                  goto LABEL_312;
              }
              else
              {

              }
              v210 = v255;
              if (!v255)
              {
                v211 = (void *)objc_msgSend(v258, "mutableCopy");
                v257 = v211;
                if (v211)
                {
                  v212 = v211;
                }
                else
                {
                  v212 = objc_alloc_init(MEMORY[0x1E0C99E08]);

                }
                v210 = v212;
              }
              v255 = v210;
              objc_msgSend(v210, "setObject:forKeyedSubscript:", v206, CFSTR("bAdd"));
              v16 = v16 | 0x800000;
              goto LABEL_312;
            }

LABEL_312:
            v190 = v253;

LABEL_313:
            if (v222 && (_DWORD)v16)
              objc_msgSend(v8, "setRevisionID:", objc_msgSend(v8, "revisionID") + 1);
            Int64Ranged = CFDictionaryGetInt64Ranged();
            v214 = objc_msgSend(v8, "revisionID");
            if ((_DWORD)v214 != Int64Ranged)
            {
              v215 = v214;
              if (!v15)
              {
                v216 = (void *)objc_msgSend(v9, "mutableCopy");
                v217 = v216;
                if (v216)
                {
                  v15 = v216;
                }
                else
                {
                  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

                }
                v190 = v253;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v215);
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v218, CFSTR("revisionID"));

            }
            v11 = v233;
            v138 = v234;
            if (v15)
              objc_msgSend(v254, "setMetadata:", v15);
            if (v190)
              objc_msgSend(v254, "setRemovedMetadata:", v190);
            if (v255)
              objc_msgSend(v254, "setSecrets:");

            v127 = v236;
            goto LABEL_330;
          }
          CFDataGetTypeID();
          CFDictionaryGetTypedValue();
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          v197 = v195;
          v198 = v196;
          v199 = v198;
          if (v197 != v198)
          {
            if ((v197 == 0) != (v198 != 0))
            {
              v200 = objc_msgSend(v197, "isEqual:", v198);

              if ((v200 & 1) != 0)
                goto LABEL_298;
            }
            else
            {

            }
            v201 = v255;
            if (!v255)
            {
              v202 = (void *)objc_msgSend(v258, "mutableCopy");
              v256 = v202;
              if (v202)
              {
                v203 = v202;
              }
              else
              {
                v203 = objc_alloc_init(MEMORY[0x1E0C99E08]);

              }
              v201 = v203;
            }
            v255 = v201;
            objc_msgSend(v201, "setObject:forKeyedSubscript:", v197, CFSTR("bIRK"));
            v16 = v16 | 0x400000;
            goto LABEL_298;
          }

LABEL_298:
          v190 = v253;

          goto LABEL_299;
        }
        if ((v178 != 0) != (v177 == 0))
        {
          v180 = objc_msgSend(v177, "isEqual:", v178);

          if ((v180 & 1) != 0)
          {
LABEL_268:
            v11 = v233;
            goto LABEL_269;
          }
          if (!v15)
            goto LABEL_263;
        }
        else
        {

          if (!v15)
          {
LABEL_263:
            v181 = (void *)objc_msgSend(v9, "mutableCopy");
            v182 = v181;
            if (v181)
            {
              v15 = v181;
            }
            else
            {
              v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);

            }
          }
        }
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v177, CFSTR("allUsedSKAs"));
        v16 = v16 | 0x1000000;
        goto LABEL_268;
      }
    }
    else
    {

    }
    objc_msgSend(v254, "setIdentifier:", v121);
    v16 = v16 | 0x20;
    goto LABEL_178;
  }
  if (v235)
  {
    RPErrorF();
    *v235 = (id)objc_claimAutoreleasedReturnValue();
    v118 = 0;
  }
  v16 = 1;
  v125 = v237;
LABEL_331:

  return v16;
}

@end
