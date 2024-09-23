@implementation LNValue(Serialization)

- (id)wfSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  WFSerializedIdentifierFromLinkValue(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFSerializedRepresentationFromLinkValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v2, CFSTR("identifier"));
  objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v4, CFSTR("value"));
  objc_msgSend(a1, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serializedRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v8, CFSTR("title"));
  objc_msgSend(a1, "displayRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serializedRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v11, CFSTR("subtitle"));
  objc_msgSend(a1, "displayRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v13, "serializedRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v14, CFSTR("symbol"));

  }
  else
  {

    objc_msgSend(a1, "displayRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = v17;

    objc_msgSend(v18, "serializedRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v13, CFSTR("image"));
  }

  return v5;
}

+ (uint64_t)valueFromSerializedRepresentation:()Serialization valueType:variableProvider:parameter:
{
  return objc_msgSend(a1, "valueFromSerializedRepresentation:valueType:variableProvider:parameter:bundleIdentifier:", a3, a4, a5, a6, 0);
}

+ (id)valueFromSerializedRepresentation:()Serialization valueType:variableProvider:parameter:bundleIdentifier:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Class *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  WFFileValue *v45;
  id v46;
  id v47;
  void *v48;
  objc_class *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  objc_class *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
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
  void *v100;
  WFLocationValue *v101;
  id v102;
  WFLocationValue *v103;
  WFLocationValue *v104;
  uint64_t v105;
  objc_class *v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  uint64_t v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  id v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  char v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  NSObject *v150;
  id v152;
  id v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  id v159;
  void *v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  id v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  _QWORD v191[4];
  id v192;
  _QWORD v193[4];
  id v194;
  id v195;
  id v196;
  uint8_t buf[4];
  const char *v198;
  __int16 v199;
  id v200;
  __int16 v201;
  id v202;
  uint64_t v203;

  v203 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v185 = a7;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v11;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("value"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
    v17 = v11;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("title"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18
    || (v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D43DF8]), "initWithSerializedRepresentation:variableProvider:parameter:", v18, v13, v14)) == 0)
  {
    objc_msgSend(v12, "wf_titleWithCustomIntentSerializedRepresentation:", v11);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v190 = (void *)v19;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = v11;
  if (v20)
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D43DF8]), "initWithSerializedRepresentation:variableProvider:parameter:", v20, v13, v14);
  else
    v21 = 0;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("image"));
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("symbol"));
  v23 = objc_claimAutoreleasedReturnValue();
  v181 = (void *)v23;
  if (v23)
  {
    v24 = (Class *)0x1E0D43E08;
    v25 = v23;
LABEL_18:
    v189 = (void *)objc_msgSend(objc_alloc(*v24), "initWithSerializedRepresentation:variableProvider:parameter:", v25, v13, v14);
    goto LABEL_19;
  }
  if (v22)
  {
    v24 = (Class *)0x1E0D43CF8;
    v25 = v22;
    goto LABEL_18;
  }
  v189 = 0;
LABEL_19:
  if (v190)
    v187 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43C50]), "initWithTitle:subtitle:image:", v190, v21, v189);
  else
    v187 = 0;
  v182 = (void *)v22;
  objc_opt_class();
  v188 = v13;
  v186 = v16;
  v183 = (void *)v21;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "memberValueType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v171 = v20;
      v176 = (void *)v18;
      v27 = v17;
      v28 = v17;
      if (v28)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = v28;
        else
          v29 = 0;
      }
      else
      {
        v29 = 0;
      }
      v33 = v29;

      v193[0] = MEMORY[0x1E0C809B0];
      v193[1] = 3221225472;
      v193[2] = __114__LNValue_Serialization__valueFromSerializedRepresentation_valueType_variableProvider_parameter_bundleIdentifier___block_invoke;
      v193[3] = &unk_1E7AF74B0;
      v34 = v26;
      v194 = v34;
      v195 = v13;
      v196 = v14;
      objc_msgSend(v33, "if_map:", v193);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
        v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D43E38]), "initWithValue:valueType:displayRepresentation:", v35, v12, v187);
      v17 = v27;

      v20 = v171;
      v30 = v176;
      if (v35)
        goto LABEL_168;
    }
    else
    {
      v31 = v17;
      v32 = v26;

      v12 = v32;
      v17 = v31;
      v30 = (void *)v18;
    }

    v16 = v186;
  }
  else
  {
    v30 = (void *)v18;
  }
  v36 = v17;
  v12 = v12;
  v37 = v13;
  v38 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    switch(objc_msgSend(v12, "typeIdentifier"))
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
        v39 = v36;
        goto LABEL_39;
      case 9:
        v75 = v36;
        v76 = v37;
        v77 = v38;
        v78 = v75;
        v160 = v76;
        v153 = v76;
        v157 = v77;
        v152 = v77;
        v79 = v78;
        v174 = v79;
        if (v79 && (v80 = v79, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v178 = v30;
          v169 = v17;
          v81 = objc_alloc_init(MEMORY[0x1E0C99D78]);
          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("era"), v152, v153);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v82, CFSTR("era"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("year"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v83, CFSTR("year"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("month"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v84, CFSTR("month"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("day"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v85, CFSTR("day"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("weekday"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v86, CFSTR("weekday"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("hour"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v87, CFSTR("hour"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("minute"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v88, CFSTR("minute"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("second"));
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v89, CFSTR("second"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("nanosecond"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v90, CFSTR("nanosecond"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("weekday"));
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v91, CFSTR("weekday"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("weekdayOrdinal"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v92, CFSTR("weekdayOrdinal"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("quarter"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v93, CFSTR("quarter"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("weekOfMonth"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v94, CFSTR("weekOfMonth"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("weekOfYear"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v95, CFSTR("weekOfYear"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("yearForWeekOfYear"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v96, CFSTR("yearForWeekOfYear"));

          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("calendar"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          if (v97)
          {
            objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v97);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v98, CFSTR("calendar"));

          }
          v180 = v81;
          objc_msgSend(v174, "objectForKeyedSubscript:", CFSTR("timeZone"));
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v160;
          if (v99)
          {
            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "if_setValueIfNonNil:forKey:", v100, CFSTR("timeZone"));

          }
          v17 = v169;
          v16 = v186;
          v30 = v178;
          v38 = v157;
        }
        else
        {
          v180 = 0;
          v38 = v157;
          v37 = v160;
        }

        goto LABEL_124;
      case 10:
        v101 = [WFLocationValue alloc];
        v158 = v37;
        v102 = v37;
        v42 = v38;
        v103 = -[WFLocationValue initWithSerializedRepresentation:variableProvider:parameter:](v101, "initWithSerializedRepresentation:variableProvider:parameter:", v36, v102, v38);
        v104 = v103;
        if (v103)
          -[WFLocationValue placemark](v103, "placemark");
        else
          WFCLPlacemarkFromSerializedIntentPlacemark(v36);
        v105 = objc_claimAutoreleasedReturnValue();
        goto LABEL_107;
      case 11:
        v158 = v37;
        v42 = v38;
        v104 = (WFLocationValue *)v36;
        if (!v104)
          goto LABEL_92;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_92;
        v106 = (objc_class *)MEMORY[0x1E0C99E98];
        goto LABEL_91;
      case 12:
        v158 = v37;
        v42 = v38;
        v104 = (WFLocationValue *)v36;
        if (v104 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v106 = (objc_class *)MEMORY[0x1E0CB3498];
LABEL_91:
          v105 = objc_msgSend([v106 alloc], "initWithString:", v104);
LABEL_107:
          v180 = (id)v105;
        }
        else
        {
LABEL_92:
          v180 = 0;
        }

        break;
      default:
        goto LABEL_124;
    }
    goto LABEL_109;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v12, "builtInType") == 2)
      {
        v154 = v38;
        v49 = (objc_class *)MEMORY[0x1E0D43D78];
        v172 = v20;
        v50 = v36;
        v51 = v16;
        v158 = v37;
        v52 = v17;
        v53 = v154;
        v54 = v158;
        v55 = v50;
        v180 = (id)objc_msgSend([v49 alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v55, v54, v53);

        v17 = v52;
        v56 = v51;
        v36 = v50;
        v20 = v172;

        v16 = v56;
        v38 = v154;

LABEL_123:
        v37 = v158;
        goto LABEL_124;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v155 = v38;
        v159 = v37;
        v57 = v30;
        v58 = v36;
        v59 = v17;
        if (v58)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v60 = v58;
          else
            v60 = 0;
        }
        else
        {
          v60 = 0;
        }
        v107 = v60;

        WFDeserializeNSMeasurement();
        v180 = (id)objc_claimAutoreleasedReturnValue();

        v17 = v59;
        v30 = v57;
        v38 = v155;
        v37 = v159;
        goto LABEL_124;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v12, "typeIdentifier"))
          goto LABEL_124;
        WFLNStringSearchCriteriaFromSerialization(v36, v37, v38);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      }
    }
    v180 = 0;
    goto LABEL_124;
  }
  v40 = objc_msgSend(v12, "typeIdentifier");
  v180 = 0;
  if (v40 <= 11)
  {
    if (v40)
    {
      if (v40 != 3)
        goto LABEL_124;
      v156 = v38;
      v61 = (objc_class *)MEMORY[0x1E0D13E78];
      v167 = v17;
      v62 = v156;
      v63 = v37;
      v64 = v36;
      v65 = (id)objc_msgSend([v61 alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v64, v63, v62);

      objc_msgSend(v65, "contact");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "INPersonRepresentation");
      v180 = (id)objc_claimAutoreleasedReturnValue();

      v17 = v167;
      v16 = v186;
    }
    else
    {
      v156 = v38;
      v65 = v36;
      if (v65)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v74 = v65;
        else
          v74 = 0;
      }
      else
      {
        v74 = 0;
      }
      v180 = v74;
    }

    v38 = v156;
    goto LABEL_124;
  }
  switch(v40)
  {
    case 14:
      WFINCurrencyAmountFromSerialization(v36, v37, v38);
      v39 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:
      v180 = v39;
      break;
    case 13:
      v162 = v14;
      v164 = v36;
      v67 = v38;
      v68 = v36;
      v158 = v37;
      v173 = v37;
      v69 = v67;
      v70 = v67;
      v71 = v68;
      if (v71 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("type"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = v17;
        if (v72)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v73 = v72;
          else
            v73 = 0;
        }
        else
        {
          v73 = 0;
        }
        v114 = v73;

        v115 = objc_msgSend(v114, "integerValue");
        objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("name"));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        if (v116)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v117 = v116;
          else
            v117 = 0;
        }
        else
        {
          v117 = 0;
        }
        v118 = v117;

        objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("identificationHint"));
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        if (v119)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v120 = v119;
          else
            v120 = 0;
        }
        else
        {
          v120 = 0;
        }
        v121 = v120;

        v180 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA50]), "initWithType:name:identificationHint:icon:", v115, v118, v121, 0);
        v17 = v168;
        v16 = v186;
      }
      else
      {
        v180 = 0;
      }
      v38 = v69;

      v14 = v162;
      v36 = v164;
      goto LABEL_123;
    case 12:
      v177 = v30;
      v166 = v17;
      v158 = v37;
      v41 = v37;
      v42 = v38;
      v43 = v38;
      v44 = v36;
      v45 = -[WFFileValue initWithSerializedRepresentation:variableProvider:parameter:]([WFFileValue alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v44, v41, v43);

      v46 = v41;
      v47 = v14;
      if (v46)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v48 = v46;
        else
          v48 = 0;
      }
      else
      {
        v48 = 0;
      }
      v108 = v48;

      objc_msgSend(v108, "workflow");
      v109 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v109, "workflowID");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFFileValue resolveURLWithWorkflowID:error:](v45, "resolveURLWithWorkflowID:error:", v110, 0);
      v111 = (void *)objc_claimAutoreleasedReturnValue();

      if (v111)
      {
        v112 = (void *)MEMORY[0x1E0CBD8A8];
        -[WFFileValue filename](v45, "filename");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "fileWithFileURL:filename:typeIdentifier:", v111, v113, 0);
        v180 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v180 = 0;
      }
      v14 = v47;
      v30 = v177;

      v17 = v166;
      v16 = v186;
LABEL_109:
      v38 = v42;
      goto LABEL_123;
  }
LABEL_124:

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v165 = v36;
    v175 = v20;
    v12 = v12;
    v122 = v37;
    v123 = v122;
    if (v122)
    {
      if (objc_msgSend(v122, "conformsToProtocol:", &unk_1EF71BF70))
        v124 = v123;
      else
        v124 = 0;
    }
    else
    {
      v124 = 0;
    }
    v161 = v124;

    v127 = v38;
    v163 = v14;
    v170 = v17;
    v179 = v30;
    if (v127)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v128 = v127;
      else
        v128 = 0;
    }
    else
    {
      v128 = 0;
    }
    v129 = v128;

    objc_msgSend(v129, "parameterMetadata");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "typeSpecificMetadata");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "objectForKey:", CFSTR("LNValueTypeSpecificMetadataKeyLinkEntityMetadata"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v132, "identifier");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend(v133, "isEqualToString:", v134);

    if ((v135 & 1) != 0)
    {
      v136 = v129;
      v30 = v179;
      v137 = v161;
      if (v132)
        goto LABEL_159;
    }
    else
    {
      v136 = v129;
      objc_msgSend(v129, "parameterMetadata");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "typeSpecificMetadata");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "objectForKey:", CFSTR("LNValueTypeSpecificMetadataKeyLinkReferencedEntityMetadata"));
      v140 = (void *)objc_claimAutoreleasedReturnValue();

      if (v140)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v141 = v140;
        else
          v141 = 0;
      }
      else
      {
        v141 = 0;
      }
      v137 = v161;
      v142 = v141;

      v191[0] = MEMORY[0x1E0C809B0];
      v191[1] = 3221225472;
      v191[2] = __114__LNValue_Serialization__valueFromSerializedRepresentation_valueType_variableProvider_parameter_bundleIdentifier___block_invoke_2;
      v191[3] = &unk_1E7AF9DE0;
      v192 = v12;
      objc_msgSend(v142, "if_firstObjectPassingTest:", v191);
      v143 = objc_claimAutoreleasedReturnValue();

      v132 = (void *)v143;
      v30 = v179;
      if (v143)
        goto LABEL_159;
    }
    objc_msgSend(v12, "identifier", v152);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "entityMetadataForIdentifier:", v144);
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    if (v185 && !v132)
    {
      +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v146 = v136;
      v147 = v30;
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "entityMetadataByAppBundleIdentifier:entityIdentifier:", v185, v148);
      v132 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v147;
      v136 = v146;

    }
    if (!v132)
    {
      v33 = 0;
      v20 = v175;
      v34 = v180;
LABEL_163:

      v14 = v163;
      v17 = v170;
      goto LABEL_168;
    }
LABEL_159:
    objc_msgSend(MEMORY[0x1E0D43C78], "valueFromSerializedRepresentation:metadata:variableProvider:parameter:", v165, v132, v123, v127, v152);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    if (v149)
      v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D43E38]), "initWithValue:valueType:displayRepresentation:", v149, v12, v187);
    else
      v33 = 0;
    v20 = v175;
    v34 = v180;

    goto LABEL_163;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = v180;
    if (v180)
    {
      if ((objc_msgSend(v12, "objectIsMemberOfType:", v180) & 1) != 0)
      {
        v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D43E38]), "initWithValue:valueType:displayRepresentation:", v180, v12, v187);
        goto LABEL_168;
      }
      getWFAppIntentsLogObject();
      v150 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v198 = "+[LNValue(Serialization) valueFromSerializedRepresentation:valueType:variableProvider:parameter:bundleIdentifier:]";
        v199 = 2112;
        v200 = v16;
        v201 = 2112;
        v202 = v12;
        _os_log_impl(&dword_1C15B3000, v150, OS_LOG_TYPE_ERROR, "%s Serialized value %@ does not match value type %@", buf, 0x20u);
      }

    }
    v33 = 0;
    goto LABEL_168;
  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("identifier"));
  v125 = (id)objc_claimAutoreleasedReturnValue();
  if (!v125 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v126 = v36;
    if (!v126 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v33 = 0;
      v34 = v180;
      goto LABEL_168;
    }
    v125 = v126;

  }
  v34 = v180;
  v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D43E38]), "initWithValue:valueType:displayRepresentation:", v125, v12, v187);

LABEL_168:
  return v33;
}

@end
