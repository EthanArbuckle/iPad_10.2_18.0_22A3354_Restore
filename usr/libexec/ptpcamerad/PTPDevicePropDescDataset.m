@implementation PTPDevicePropDescDataset

- (PTPDevicePropDescDataset)init
{
  PTPDevicePropDescDataset *v2;
  NSMutableData *v3;
  NSMutableData *content;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTPDevicePropDescDataset;
  v2 = -[PTPDevicePropDescDataset init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 0);
    content = v2->_content;
    v2->_content = v3;

    *(_WORD *)&v2->_dirty = 1;
  }
  return v2;
}

- (void)setContent:(id)a3
{
  id v5;
  unsigned __int8 *v6;
  char *v7;
  int v8;
  unsigned __int8 *v9;
  id v10;
  id v11;
  id factoryDefaultValue;
  id v13;
  id v14;
  id currentValue;
  unsigned __int8 *v16;
  int v17;
  id v18;
  id v19;
  id minimumValue;
  id v21;
  id v22;
  id maximumValue;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  unsigned __int8 *v32;
  int v33;
  int v34;
  unsigned int v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  unsigned __int8 *v44;
  int v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  int v57;
  unsigned __int8 *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  int v67;
  unsigned __int8 *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  int v77;
  unsigned __int8 *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  int v87;
  unsigned __int8 *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  int v97;
  unsigned __int8 *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  int v107;
  unsigned __int8 *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  int v117;
  unsigned __int8 *v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  int v127;
  unsigned __int8 *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id stepSize;
  int v134;
  unsigned int v135;
  unsigned __int8 *v136;
  NSMutableArray *supportedValues;
  void *v138;
  int v139;
  unsigned int v140;
  unsigned __int8 *v141;
  NSMutableArray *v142;
  void *v143;
  int v144;
  unsigned int v145;
  uint64_t v146;
  NSMutableArray *v147;
  void *v148;
  int v149;
  unsigned int v150;
  uint64_t v151;
  NSMutableArray *v152;
  void *v153;
  int v154;
  unsigned int v155;
  uint64_t v156;
  NSMutableArray *v157;
  void *v158;
  int v159;
  unsigned int v160;
  uint64_t v161;
  NSMutableArray *v162;
  void *v163;
  int v164;
  unsigned int v165;
  uint64_t v166;
  NSMutableArray *v167;
  void *v168;
  int v169;
  unsigned int v170;
  uint64_t v171;
  NSMutableArray *v172;
  void *v173;
  int v174;
  unsigned int v175;
  uint64_t v176;
  NSMutableArray *v177;
  void *v178;
  int v179;
  unsigned int v180;
  uint64_t v181;
  NSMutableArray *v182;
  void *v183;
  unsigned __int8 *v184;

  v5 = a3;
  objc_storeStrong((id *)&self->_content, a3);
  v6 = (unsigned __int8 *)-[NSMutableData bytes](self->_content, "bytes");
  v7 = (char *)-[NSMutableData length](self->_content, "length") + (_QWORD)v6;
  v184 = v6;
  self->_devicePropertyCode = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
  v8 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
  self->_dataTypeCode = v8;
  v9 = v184 + 1;
  self->_readWriteAttribute = *v184;
  v184 = v9;
  switch(v8)
  {
    case 1:
      v10 = objc_alloc((Class)NSNumber);
      v11 = objc_msgSend(v10, "initWithChar:", (char)*v184);
      factoryDefaultValue = self->_factoryDefaultValue;
      self->_factoryDefaultValue = v11;

      ++v184;
      v13 = objc_alloc((Class)NSNumber);
      v14 = objc_msgSend(v13, "initWithChar:", (char)*v184);
      currentValue = self->_currentValue;
      self->_currentValue = v14;

      v16 = v184++;
      v17 = *v184;
      self->_formFlag = v17;
      v184 = v16 + 2;
      if (v17 == 2)
      {
        v134 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
        self->_numberOfValues = v134;
        if (v134)
        {
          v135 = 0;
          v136 = v184;
          do
          {
            supportedValues = self->_supportedValues;
            v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithChar:](NSNumber, "numberWithChar:", (char)*v136));
            -[NSMutableArray addObject:](supportedValues, "addObject:", v138);

            v136 = ++v184;
            ++v135;
          }
          while (v135 < self->_numberOfValues);
        }
      }
      else if (v17 == 1)
      {
        v18 = objc_alloc((Class)NSNumber);
        v19 = objc_msgSend(v18, "initWithChar:", (char)*v184);
        minimumValue = self->_minimumValue;
        self->_minimumValue = v19;

        ++v184;
        v21 = objc_alloc((Class)NSNumber);
        v22 = objc_msgSend(v21, "initWithChar:", (char)*v184);
        maximumValue = self->_maximumValue;
        self->_maximumValue = v22;

        ++v184;
        v24 = objc_alloc((Class)NSNumber);
        v25 = objc_msgSend(v24, "initWithChar:", (char)*v184);
        goto LABEL_40;
      }
      break;
    case 2:
      v38 = objc_alloc((Class)NSNumber);
      v39 = objc_msgSend(v38, "initWithUnsignedChar:", *v184);
      v40 = self->_factoryDefaultValue;
      self->_factoryDefaultValue = v39;

      ++v184;
      v41 = objc_alloc((Class)NSNumber);
      v42 = objc_msgSend(v41, "initWithUnsignedChar:", *v184);
      v43 = self->_currentValue;
      self->_currentValue = v42;

      v44 = v184++;
      v45 = *v184;
      self->_formFlag = v45;
      v184 = v44 + 2;
      if (v45 == 2)
      {
        v139 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
        self->_numberOfValues = v139;
        if (v139)
        {
          v140 = 0;
          v141 = v184;
          do
          {
            v142 = self->_supportedValues;
            v143 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *v141));
            -[NSMutableArray addObject:](v142, "addObject:", v143);

            v141 = ++v184;
            ++v140;
          }
          while (v140 < self->_numberOfValues);
        }
      }
      else if (v45 == 1)
      {
        v46 = objc_alloc((Class)NSNumber);
        v47 = objc_msgSend(v46, "initWithUnsignedChar:", *v184);
        v48 = self->_minimumValue;
        self->_minimumValue = v47;

        ++v184;
        v49 = objc_alloc((Class)NSNumber);
        v50 = objc_msgSend(v49, "initWithUnsignedChar:", *v184);
        v51 = self->_maximumValue;
        self->_maximumValue = v50;

        ++v184;
        v52 = objc_alloc((Class)NSNumber);
        v25 = objc_msgSend(v52, "initWithUnsignedChar:", *v184);
        goto LABEL_40;
      }
      break;
    case 3:
      v53 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithShort:", sub_100027310((unint64_t *)&v184, (unint64_t)v7));
      v54 = self->_factoryDefaultValue;
      self->_factoryDefaultValue = v53;

      v55 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithShort:", sub_100027310((unint64_t *)&v184, (unint64_t)v7));
      v56 = self->_currentValue;
      self->_currentValue = v55;

      v58 = v184 + 1;
      v57 = *v184;
      self->_formFlag = v57;
      v184 = v58;
      if (v57 == 2)
      {
        v144 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
        self->_numberOfValues = v144;
        if (v144)
        {
          v145 = 0;
          do
          {
            v146 = sub_100027310((unint64_t *)&v184, (unint64_t)v7);
            v147 = self->_supportedValues;
            v148 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v146));
            -[NSMutableArray addObject:](v147, "addObject:", v148);

            ++v145;
          }
          while (v145 < self->_numberOfValues);
        }
      }
      else if (v57 == 1)
      {
        v59 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithShort:", sub_100027310((unint64_t *)&v184, (unint64_t)v7));
        v60 = self->_minimumValue;
        self->_minimumValue = v59;

        v61 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithShort:", sub_100027310((unint64_t *)&v184, (unint64_t)v7));
        v62 = self->_maximumValue;
        self->_maximumValue = v61;

        v25 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithShort:", sub_100027310((unint64_t *)&v184, (unint64_t)v7));
        goto LABEL_40;
      }
      break;
    case 4:
      v63 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedShort:", sub_100027364((unint64_t *)&v184, (unint64_t)v7));
      v64 = self->_factoryDefaultValue;
      self->_factoryDefaultValue = v63;

      v65 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedShort:", sub_100027364((unint64_t *)&v184, (unint64_t)v7));
      v66 = self->_currentValue;
      self->_currentValue = v65;

      v68 = v184 + 1;
      v67 = *v184;
      self->_formFlag = v67;
      v184 = v68;
      if (v67 == 2)
      {
        v149 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
        self->_numberOfValues = v149;
        if (v149)
        {
          v150 = 0;
          do
          {
            v151 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
            v152 = self->_supportedValues;
            v153 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v151));
            -[NSMutableArray addObject:](v152, "addObject:", v153);

            ++v150;
          }
          while (v150 < self->_numberOfValues);
        }
      }
      else if (v67 == 1)
      {
        v69 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedShort:", sub_100027364((unint64_t *)&v184, (unint64_t)v7));
        v70 = self->_minimumValue;
        self->_minimumValue = v69;

        v71 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedShort:", sub_100027364((unint64_t *)&v184, (unint64_t)v7));
        v72 = self->_maximumValue;
        self->_maximumValue = v71;

        v25 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedShort:", sub_100027364((unint64_t *)&v184, (unint64_t)v7));
        goto LABEL_40;
      }
      break;
    case 5:
      v73 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", sub_10002738C((unint64_t *)&v184, (unint64_t)v7));
      v74 = self->_factoryDefaultValue;
      self->_factoryDefaultValue = v73;

      v75 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", sub_10002738C((unint64_t *)&v184, (unint64_t)v7));
      v76 = self->_currentValue;
      self->_currentValue = v75;

      v78 = v184 + 1;
      v77 = *v184;
      self->_formFlag = v77;
      v184 = v78;
      if (v77 == 2)
      {
        v154 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
        self->_numberOfValues = v154;
        if (v154)
        {
          v155 = 0;
          do
          {
            v156 = sub_10002738C((unint64_t *)&v184, (unint64_t)v7);
            v157 = self->_supportedValues;
            v158 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v156));
            -[NSMutableArray addObject:](v157, "addObject:", v158);

            ++v155;
          }
          while (v155 < self->_numberOfValues);
        }
      }
      else if (v77 == 1)
      {
        v79 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", sub_10002738C((unint64_t *)&v184, (unint64_t)v7));
        v80 = self->_minimumValue;
        self->_minimumValue = v79;

        v81 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", sub_10002738C((unint64_t *)&v184, (unint64_t)v7));
        v82 = self->_maximumValue;
        self->_maximumValue = v81;

        v25 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", sub_10002738C((unint64_t *)&v184, (unint64_t)v7));
        goto LABEL_40;
      }
      break;
    case 6:
      v83 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInt:", sub_10002738C((unint64_t *)&v184, (unint64_t)v7));
      v84 = self->_factoryDefaultValue;
      self->_factoryDefaultValue = v83;

      v85 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInt:", sub_10002738C((unint64_t *)&v184, (unint64_t)v7));
      v86 = self->_currentValue;
      self->_currentValue = v85;

      v88 = v184 + 1;
      v87 = *v184;
      self->_formFlag = v87;
      v184 = v88;
      if (v87 == 2)
      {
        v159 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
        self->_numberOfValues = v159;
        if (v159)
        {
          v160 = 0;
          do
          {
            v161 = sub_10002738C((unint64_t *)&v184, (unint64_t)v7);
            v162 = self->_supportedValues;
            v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v161));
            -[NSMutableArray addObject:](v162, "addObject:", v163);

            ++v160;
          }
          while (v160 < self->_numberOfValues);
        }
      }
      else if (v87 == 1)
      {
        v89 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInt:", sub_10002738C((unint64_t *)&v184, (unint64_t)v7));
        v90 = self->_minimumValue;
        self->_minimumValue = v89;

        v91 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInt:", sub_10002738C((unint64_t *)&v184, (unint64_t)v7));
        v92 = self->_maximumValue;
        self->_maximumValue = v91;

        v25 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInt:", sub_10002738C((unint64_t *)&v184, (unint64_t)v7));
        goto LABEL_40;
      }
      break;
    case 7:
      v93 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
      v94 = self->_factoryDefaultValue;
      self->_factoryDefaultValue = v93;

      v95 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
      v96 = self->_currentValue;
      self->_currentValue = v95;

      v98 = v184 + 1;
      v97 = *v184;
      self->_formFlag = v97;
      v184 = v98;
      if (v97 == 2)
      {
        v164 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
        self->_numberOfValues = v164;
        if (v164)
        {
          v165 = 0;
          do
          {
            v166 = sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
            v167 = self->_supportedValues;
            v168 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v166));
            -[NSMutableArray addObject:](v167, "addObject:", v168);

            ++v165;
          }
          while (v165 < self->_numberOfValues);
        }
      }
      else if (v97 == 1)
      {
        v99 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
        v100 = self->_minimumValue;
        self->_minimumValue = v99;

        v101 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
        v102 = self->_maximumValue;
        self->_maximumValue = v101;

        goto LABEL_35;
      }
      break;
    case 8:
      v103 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
      v104 = self->_factoryDefaultValue;
      self->_factoryDefaultValue = v103;

      v105 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
      v106 = self->_currentValue;
      self->_currentValue = v105;

      v108 = v184 + 1;
      v107 = *v184;
      self->_formFlag = v107;
      v184 = v108;
      if (v107 == 2)
      {
        v169 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
        self->_numberOfValues = v169;
        if (v169)
        {
          v170 = 0;
          do
          {
            v171 = sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
            v172 = self->_supportedValues;
            v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v171));
            -[NSMutableArray addObject:](v172, "addObject:", v173);

            ++v170;
          }
          while (v170 < self->_numberOfValues);
        }
      }
      else if (v107 == 1)
      {
        v109 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
        v110 = self->_minimumValue;
        self->_minimumValue = v109;

        v111 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
        v112 = self->_maximumValue;
        self->_maximumValue = v111;

        goto LABEL_39;
      }
      break;
    case 9:
      sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
      v113 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
      v114 = self->_factoryDefaultValue;
      self->_factoryDefaultValue = v113;

      sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
      v115 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
      v116 = self->_currentValue;
      self->_currentValue = v115;

      v118 = v184 + 1;
      v117 = *v184;
      self->_formFlag = v117;
      v184 = v118;
      if (v117 == 2)
      {
        v174 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
        self->_numberOfValues = v174;
        if (v174)
        {
          v175 = 0;
          do
          {
            sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
            v176 = sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
            v177 = self->_supportedValues;
            v178 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v176));
            -[NSMutableArray addObject:](v177, "addObject:", v178);

            ++v175;
          }
          while (v175 < self->_numberOfValues);
        }
      }
      else if (v117 == 1)
      {
        sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
        v119 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
        v120 = self->_minimumValue;
        self->_minimumValue = v119;

        sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
        v121 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
        v122 = self->_maximumValue;
        self->_maximumValue = v121;

        sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
LABEL_35:
        v25 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
        goto LABEL_40;
      }
      break;
    case 10:
      sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
      v123 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
      v124 = self->_factoryDefaultValue;
      self->_factoryDefaultValue = v123;

      sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
      v125 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
      v126 = self->_currentValue;
      self->_currentValue = v125;

      v128 = v184 + 1;
      v127 = *v184;
      self->_formFlag = v127;
      v184 = v128;
      if (v127 == 2)
      {
        v179 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
        self->_numberOfValues = v179;
        if (v179)
        {
          v180 = 0;
          do
          {
            sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
            v181 = sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
            v182 = self->_supportedValues;
            v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v181));
            -[NSMutableArray addObject:](v182, "addObject:", v183);

            ++v180;
          }
          while (v180 < self->_numberOfValues);
        }
      }
      else if (v127 == 1)
      {
        sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
        v129 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
        v130 = self->_minimumValue;
        self->_minimumValue = v129;

        sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
        v131 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
        v132 = self->_maximumValue;
        self->_maximumValue = v131;

        sub_1000273E0((unint64_t *)&v184, (unint64_t)v7);
LABEL_39:
        v25 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", sub_1000273E0((unint64_t *)&v184, (unint64_t)v7));
LABEL_40:
        stepSize = self->_stepSize;
        self->_stepSize = v25;

      }
      break;
    default:
      if (v8 == 0xFFFF)
      {
        v26 = sub_1000274E0((const void **)&v184, (unint64_t)v7);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v28 = self->_factoryDefaultValue;
        self->_factoryDefaultValue = v27;

        v29 = sub_1000274E0((const void **)&v184, (unint64_t)v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v31 = self->_currentValue;
        self->_currentValue = v30;

        v32 = v184 + 1;
        v33 = *v184;
        self->_formFlag = v33;
        v184 = v32;
        if (v33 == 2)
        {
          v34 = sub_100027364((unint64_t *)&v184, (unint64_t)v7);
          self->_numberOfValues = v34;
          if (v34)
          {
            v35 = 0;
            do
            {
              v36 = sub_1000274E0((const void **)&v184, (unint64_t)v7);
              v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
              -[NSMutableArray addObject:](self->_supportedValues, "addObject:", v37);

              ++v35;
            }
            while (v35 < self->_numberOfValues);
          }
        }
      }
      break;
  }

}

- (PTPDevicePropDescDataset)initWithData:(id)a3
{
  id v4;
  PTPDevicePropDescDataset *v5;
  NSMutableArray *v6;
  NSMutableArray *supportedValues;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTPDevicePropDescDataset;
  v5 = -[PTPDevicePropDescDataset init](&v10, "init");
  if (v5)
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    supportedValues = v5->_supportedValues;
    v5->_supportedValues = v6;

    if ((unint64_t)objc_msgSend(v4, "length") < 6)
    {

      v5 = 0;
    }
    else
    {
      v8 = objc_msgSend(v4, "mutableCopy");
      -[PTPDevicePropDescDataset setContent:](v5, "setContent:", v8);

      v5->_readOnlyObject = 1;
    }
  }

  return v5;
}

- (PTPDevicePropDescDataset)initWithMutableData:(id)a3
{
  id v4;
  PTPDevicePropDescDataset *v5;
  NSMutableArray *v6;
  NSMutableArray *supportedValues;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTPDevicePropDescDataset;
  v5 = -[PTPDevicePropDescDataset init](&v9, "init");
  if (v5)
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    supportedValues = v5->_supportedValues;
    v5->_supportedValues = v6;

    if ((unint64_t)objc_msgSend(v4, "length") < 6)
    {

      v5 = 0;
    }
    else
    {
      -[PTPDevicePropDescDataset setContent:](v5, "setContent:", v4);
      v5->_readOnlyObject = 0;
    }
  }

  return v5;
}

- (void)updateContent
{
  int formFlag;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  int v9;
  unint64_t v10;
  void *v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  _WORD *v20;
  int v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  unint64_t v26;
  void *v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  _WORD *v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  unint64_t v44;
  void *v45;
  unsigned __int8 v46;
  unint64_t v47;
  void *v48;
  unint64_t v49;
  void *v50;
  unint64_t v51;
  void *v52;
  unint64_t v53;
  void *v54;
  unint64_t v55;
  void *v56;
  unint64_t v57;
  void *v58;
  unint64_t v59;
  void *v60;
  unint64_t v61;
  void *v62;
  _WORD *v63;

  if (self->_dirty && !self->_readOnlyObject)
  {
    switch(self->_dataTypeCode)
    {
      case 1u:
      case 2u:
        formFlag = self->_formFlag;
        if (formFlag == 1)
        {
          v4 = 0;
          v5 = 11;
        }
        else
        {
          v4 = 0;
          if (formFlag == 2)
            v5 = self->_numberOfValues + 10;
          else
            v5 = 8;
        }
        break;
      case 3u:
      case 4u:
        v14 = self->_formFlag;
        if (v14 == 1)
        {
          v4 = 0;
          v5 = 16;
        }
        else
        {
          v4 = 0;
          if (v14 == 2)
            v5 = 2 * self->_numberOfValues + 12;
          else
            v5 = 10;
        }
        break;
      case 5u:
      case 6u:
        v15 = self->_formFlag;
        if (v15 == 1)
        {
          v4 = 0;
          v5 = 26;
        }
        else
        {
          v4 = 0;
          if (v15 == 2)
            v5 = 4 * self->_numberOfValues + 16;
          else
            v5 = 14;
        }
        break;
      case 7u:
      case 8u:
        v16 = self->_formFlag;
        if (v16 == 1)
        {
          v4 = 0;
          v5 = 46;
        }
        else
        {
          v4 = 0;
          if (v16 == 2)
            v5 = 8 * self->_numberOfValues + 24;
          else
            v5 = 22;
        }
        break;
      case 9u:
      case 0xAu:
        v17 = self->_formFlag;
        if (v17 == 1)
        {
          v4 = 0;
          v5 = 86;
        }
        else
        {
          v4 = 0;
          if (v17 == 2)
            v5 = 8 * self->_numberOfValues + 40;
          else
            v5 = 38;
        }
        break;
      default:
        if (self->_dataTypeCode == 0xFFFF)
        {
          v6 = objc_msgSend(self->_factoryDefaultValue, "length");
          if (v6)
            v7 = 2 * v6 + 10;
          else
            v7 = 8;
          v8 = objc_msgSend(self->_currentValue, "length");
          v9 = 2 * v8 + 2;
          if (!v8)
            v9 = 0;
          v5 = v9 + v7;
          if (self->_formFlag == 2 && (v5 += 2, self->_numberOfValues))
          {
            v10 = 0;
            v11 = 0;
            do
            {
              v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v10));

              v12 = objc_msgSend(v4, "length");
              v13 = 2 * v12 + 3;
              if (!v12)
                v13 = 1;
              v5 += v13;
              ++v10;
              v11 = v4;
            }
            while (v10 < self->_numberOfValues);
          }
          else
          {
            v4 = 0;
          }
        }
        else
        {
          v4 = 0;
          v5 = 6;
        }
        break;
    }
    -[NSMutableData setLength:](self->_content, "setLength:", v5);
    v63 = -[NSMutableData mutableBytes](self->_content, "mutableBytes");
    sub_100027338(&v63, self->_devicePropertyCode);
    sub_100027338(&v63, self->_dataTypeCode);
    *(_BYTE *)v63 = self->_readWriteAttribute;
    v63 = (_WORD *)((char *)v63 + 1);
    switch(self->_dataTypeCode)
    {
      case 1u:
        v18 = objc_msgSend(self->_factoryDefaultValue, "charValue");
        *(_BYTE *)v63 = v18;
        v63 = (_WORD *)((char *)v63 + 1);
        v19 = objc_msgSend(self->_currentValue, "charValue");
        *(_BYTE *)v63 = v19;
        v20 = v63;
        v63 = (_WORD *)((char *)v63 + 1);
        *((_BYTE *)v20 + 1) = self->_formFlag;
        v63 = (_WORD *)((char *)v63 + 1);
        v21 = self->_formFlag;
        if (v21 != 2)
          goto LABEL_57;
        sub_100027338(&v63, self->_numberOfValues);
        if (self->_numberOfValues)
        {
          v22 = 0;
          v23 = 0;
          do
          {
            v24 = v23;
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v22));

            v25 = objc_msgSend(v23, "charValue");
            *(_BYTE *)v63 = v25;
            v63 = (_WORD *)((char *)v63 + 1);
            ++v22;
          }
          while (v22 < self->_numberOfValues);
          goto LABEL_120;
        }
        break;
      case 2u:
        v28 = objc_msgSend(self->_factoryDefaultValue, "charValue");
        *(_BYTE *)v63 = v28;
        v63 = (_WORD *)((char *)v63 + 1);
        v29 = objc_msgSend(self->_currentValue, "charValue");
        *(_BYTE *)v63 = v29;
        v30 = v63;
        v63 = (_WORD *)((char *)v63 + 1);
        *((_BYTE *)v30 + 1) = self->_formFlag;
        v63 = (_WORD *)((char *)v63 + 1);
        v21 = self->_formFlag;
        if (v21 == 2)
        {
          sub_100027338(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            v44 = 0;
            v23 = 0;
            do
            {
              v45 = v23;
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v44));

              v46 = objc_msgSend(v23, "charValue");
              *(_BYTE *)v63 = v46;
              v63 = (_WORD *)((char *)v63 + 1);
              ++v44;
            }
            while (v44 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else
        {
LABEL_57:
          if (v21 == 1)
          {
            v31 = objc_msgSend(self->_minimumValue, "charValue");
            *(_BYTE *)v63 = v31;
            v63 = (_WORD *)((char *)v63 + 1);
            v32 = objc_msgSend(self->_maximumValue, "charValue");
            *(_BYTE *)v63 = v32;
            v63 = (_WORD *)((char *)v63 + 1);
            v33 = objc_msgSend(self->_stepSize, "charValue");
            *(_BYTE *)v63 = v33;
            v63 = (_WORD *)((char *)v63 + 1);
          }
        }
        break;
      case 3u:
        sub_100027338(&v63, (__int16)objc_msgSend(self->_factoryDefaultValue, "shortValue"));
        sub_100027338(&v63, (__int16)objc_msgSend(self->_currentValue, "shortValue"));
        *(_BYTE *)v63 = self->_formFlag;
        v63 = (_WORD *)((char *)v63 + 1);
        v34 = self->_formFlag;
        if (v34 == 2)
        {
          sub_100027338(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            v47 = 0;
            v23 = 0;
            do
            {
              v48 = v23;
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v47));

              sub_100027338(&v63, (__int16)objc_msgSend(v23, "shortValue"));
              ++v47;
            }
            while (v47 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v34 == 1)
        {
          goto LABEL_61;
        }
        break;
      case 4u:
        sub_100027338(&v63, (__int16)objc_msgSend(self->_factoryDefaultValue, "shortValue"));
        sub_100027338(&v63, (__int16)objc_msgSend(self->_currentValue, "shortValue"));
        *(_BYTE *)v63 = self->_formFlag;
        v63 = (_WORD *)((char *)v63 + 1);
        v35 = self->_formFlag;
        if (v35 == 2)
        {
          sub_100027338(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            v49 = 0;
            v23 = 0;
            do
            {
              v50 = v23;
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v49));

              sub_100027338(&v63, (__int16)objc_msgSend(v23, "shortValue"));
              ++v49;
            }
            while (v49 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v35 == 1)
        {
LABEL_61:
          sub_100027338(&v63, (__int16)objc_msgSend(self->_minimumValue, "shortValue"));
          sub_100027338(&v63, (__int16)objc_msgSend(self->_maximumValue, "shortValue"));
          sub_100027338(&v63, (__int16)objc_msgSend(self->_stepSize, "shortValue"));
        }
        break;
      case 5u:
        sub_1000273B4((_DWORD **)&v63, (int)objc_msgSend(self->_factoryDefaultValue, "intValue"));
        sub_1000273B4((_DWORD **)&v63, (int)objc_msgSend(self->_currentValue, "intValue"));
        *(_BYTE *)v63 = self->_formFlag;
        v63 = (_WORD *)((char *)v63 + 1);
        v36 = self->_formFlag;
        if (v36 == 2)
        {
          sub_100027338(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            v51 = 0;
            v23 = 0;
            do
            {
              v52 = v23;
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v51));

              sub_1000273B4((_DWORD **)&v63, (int)objc_msgSend(v23, "intValue"));
              ++v51;
            }
            while (v51 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v36 == 1)
        {
          sub_1000273B4((_DWORD **)&v63, (int)objc_msgSend(self->_minimumValue, "intValue"));
          sub_1000273B4((_DWORD **)&v63, (int)objc_msgSend(self->_maximumValue, "intValue"));
          sub_1000273B4((_DWORD **)&v63, (int)objc_msgSend(self->_stepSize, "intValue"));
        }
        break;
      case 6u:
        sub_1000273B4((_DWORD **)&v63, (int)objc_msgSend(self->_factoryDefaultValue, "unsignedIntValue"));
        sub_1000273B4((_DWORD **)&v63, (int)objc_msgSend(self->_currentValue, "unsignedIntValue"));
        *(_BYTE *)v63 = self->_formFlag;
        v63 = (_WORD *)((char *)v63 + 1);
        v37 = self->_formFlag;
        if (v37 == 2)
        {
          sub_100027338(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            v53 = 0;
            v23 = 0;
            do
            {
              v54 = v23;
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v53));

              sub_1000273B4((_DWORD **)&v63, (int)objc_msgSend(v23, "unsignedIntValue"));
              ++v53;
            }
            while (v53 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v37 == 1)
        {
          sub_1000273B4((_DWORD **)&v63, (int)objc_msgSend(self->_minimumValue, "unsignedIntValue"));
          sub_1000273B4((_DWORD **)&v63, (int)objc_msgSend(self->_maximumValue, "unsignedIntValue"));
          sub_1000273B4((_DWORD **)&v63, (int)objc_msgSend(self->_stepSize, "unsignedIntValue"));
        }
        break;
      case 7u:
        sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_factoryDefaultValue, "longLongValue"));
        sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_currentValue, "longLongValue"));
        *(_BYTE *)v63 = self->_formFlag;
        v63 = (_WORD *)((char *)v63 + 1);
        v38 = self->_formFlag;
        if (v38 == 2)
        {
          sub_100027338(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            v55 = 0;
            v23 = 0;
            do
            {
              v56 = v23;
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v55));

              sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(v23, "longLongValue"));
              ++v55;
            }
            while (v55 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v38 == 1)
        {
          sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_minimumValue, "longLongValue"));
          v39 = (uint64_t)objc_msgSend(self->_maximumValue, "longLongValue");
          goto LABEL_80;
        }
        break;
      case 8u:
        sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_factoryDefaultValue, "unsignedLongLongValue"));
        sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_currentValue, "unsignedLongLongValue"));
        *(_BYTE *)v63 = self->_formFlag;
        v63 = (_WORD *)((char *)v63 + 1);
        v40 = self->_formFlag;
        if (v40 == 2)
        {
          sub_100027338(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            v57 = 0;
            v23 = 0;
            do
            {
              v58 = v23;
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v57));

              sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(v23, "unsignedLongLongValue"));
              ++v57;
            }
            while (v57 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v40 == 1)
        {
          sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_minimumValue, "unsignedLongLongValue"));
          v41 = (uint64_t)objc_msgSend(self->_maximumValue, "unsignedLongLongValue");
          goto LABEL_84;
        }
        break;
      case 9u:
        sub_100027408((_QWORD **)&v63, 0x4170706C65496E63);
        sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_factoryDefaultValue, "longLongValue"));
        sub_100027408((_QWORD **)&v63, 0x4170706C65496E63);
        sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_currentValue, "longLongValue"));
        *(_BYTE *)v63 = self->_formFlag;
        v63 = (_WORD *)((char *)v63 + 1);
        v42 = self->_formFlag;
        if (v42 == 2)
        {
          sub_100027338(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            v59 = 0;
            v23 = 0;
            do
            {
              v60 = v23;
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v59));

              sub_100027408((_QWORD **)&v63, 0x4170706C65496E63);
              sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(v23, "longLongValue"));
              ++v59;
            }
            while (v59 < self->_numberOfValues);
            goto LABEL_120;
          }
        }
        else if (v42 == 1)
        {
          sub_100027408((_QWORD **)&v63, 0x4170706C65496E63);
          sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_minimumValue, "longLongValue"));
          sub_100027408((_QWORD **)&v63, 0x4170706C65496E63);
          sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_maximumValue, "longLongValue"));
          v39 = 0x4170706C65496E63;
LABEL_80:
          sub_100027408((_QWORD **)&v63, v39);
          sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_stepSize, "longLongValue"));
        }
        break;
      case 0xAu:
        sub_100027408((_QWORD **)&v63, 0x4170706C65496E63);
        sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_factoryDefaultValue, "unsignedLongLongValue"));
        sub_100027408((_QWORD **)&v63, 0x4170706C65496E63);
        sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_currentValue, "unsignedLongLongValue"));
        *(_BYTE *)v63 = self->_formFlag;
        v63 = (_WORD *)((char *)v63 + 1);
        v43 = self->_formFlag;
        if (v43 == 2)
        {
          sub_100027338(&v63, self->_numberOfValues);
          if (self->_numberOfValues)
          {
            v61 = 0;
            v23 = 0;
            do
            {
              v62 = v23;
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v61));

              sub_100027408((_QWORD **)&v63, 0x4170706C65496E63);
              sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(v23, "unsignedLongLongValue"));
              ++v61;
            }
            while (v61 < self->_numberOfValues);
LABEL_120:

          }
        }
        else if (v43 == 1)
        {
          sub_100027408((_QWORD **)&v63, 0x4170706C65496E63);
          sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_minimumValue, "unsignedLongLongValue"));
          sub_100027408((_QWORD **)&v63, 0x4170706C65496E63);
          sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_maximumValue, "unsignedLongLongValue"));
          v41 = 0x4170706C65496E63;
LABEL_84:
          sub_100027408((_QWORD **)&v63, v41);
          sub_100027408((_QWORD **)&v63, (uint64_t)objc_msgSend(self->_stepSize, "unsignedLongLongValue"));
        }
        break;
      default:
        if (self->_dataTypeCode == 0xFFFF)
        {
          sub_100027514((_BYTE **)&v63, self->_factoryDefaultValue);
          sub_100027514((_BYTE **)&v63, self->_currentValue);
          *(_BYTE *)v63 = self->_formFlag;
          v63 = (_WORD *)((char *)v63 + 1);
          if (self->_formFlag == 2)
          {
            sub_100027338(&v63, self->_numberOfValues);
            if (self->_numberOfValues)
            {
              v26 = 0;
              v27 = v4;
              do
              {
                v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v26));

                sub_100027514((_BYTE **)&v63, v4);
                ++v26;
                v27 = v4;
              }
              while (v26 < self->_numberOfValues);
            }
          }
        }
        break;
    }
    self->_dirty = 0;

  }
}

- (NSMutableData)content
{
  -[PTPDevicePropDescDataset updateContent](self, "updateContent");
  return self->_content;
}

- (id)description
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  int formFlag;
  unint64_t v9;
  void *v10;

  v3 = sub_100028670(self->_devicePropertyCode);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)v4;
  v6 = "RW";
  if (!self->_readWriteAttribute)
    v6 = "RO";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<PTPDevicePropDescDataset %p>{\n  _devicePropertyCode:  %@\n  _dataTypeCode:        %u\n  _readWriteAttribute:  %s\n  _factoryDefaultValue: %@\n  _currentValue:        %@\n  _formFlag:            %u\n"), self, v4, self->_dataTypeCode, v6, self->_factoryDefaultValue, self->_currentValue, self->_formFlag));

  formFlag = self->_formFlag;
  if (formFlag == 2)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("  _numberOfValues:      %u\n"), self->_numberOfValues);
    if (self->_numberOfValues)
    {
      v9 = 0;
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_supportedValues, "objectAtIndex:", v9));
        objc_msgSend(v7, "appendFormat:", CFSTR("    _supportedValue %02d: %@\n"), v9, v10);

        ++v9;
      }
      while (v9 < self->_numberOfValues);
    }
  }
  else if (formFlag == 1)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("  _minimumValue:        %@\n  _maximumValue:        %@\n  _stepSize:            %@\n"), self->_minimumValue, self->_maximumValue, self->_stepSize);
  }
  objc_msgSend(v7, "appendString:", CFSTR("}"));
  return v7;
}

- (unsigned)devicePropertyCode
{
  return self->_devicePropertyCode;
}

- (void)setDevicePropertyCode:(unsigned __int16)a3
{
  self->_devicePropertyCode = a3;
  self->_dirty = 1;
}

- (unsigned)dataTypeCode
{
  return self->_dataTypeCode;
}

- (void)setDataTypeCode:(unsigned __int16)a3
{
  self->_dataTypeCode = a3;
  self->_dirty = 1;
}

- (unsigned)readWriteAttribute
{
  return self->_readWriteAttribute;
}

- (void)setReadWriteAttribute:(unsigned __int8)a3
{
  self->_readWriteAttribute = a3;
  self->_dirty = 1;
}

- (id)factoryDefaultValue
{
  return self->_factoryDefaultValue;
}

- (void)setFactoryDefaultValue:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_factoryDefaultValue != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_factoryDefaultValue, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (id)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_currentValue != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_currentValue, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (unsigned)formFlag
{
  return self->_formFlag;
}

- (void)setFormFlag:(unsigned __int8)a3
{
  self->_formFlag = a3;
  self->_dirty = 1;
}

- (id)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_minimumValue != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_minimumValue, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (id)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_maximumValue != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_maximumValue, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (id)stepSize
{
  return self->_stepSize;
}

- (void)setStepSize:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_stepSize != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_stepSize, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (unsigned)numberOfValues
{
  return self->_numberOfValues;
}

- (void)setNumberOfValues:(unsigned __int16)a3
{
  self->_numberOfValues = a3;
  self->_dirty = 1;
}

- (NSMutableArray)supportedValues
{
  return self->_supportedValues;
}

- (void)setSupportedValues:(id)a3
{
  NSMutableArray *v5;
  NSMutableArray *v6;

  v5 = (NSMutableArray *)a3;
  if (self->_supportedValues != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_supportedValues, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (BOOL)readOnlyObject
{
  return self->_readOnlyObject;
}

- (void)setReadOnlyObject:(BOOL)a3
{
  self->_readOnlyObject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_supportedValues, 0);
  objc_storeStrong(&self->_stepSize, 0);
  objc_storeStrong(&self->_maximumValue, 0);
  objc_storeStrong(&self->_minimumValue, 0);
  objc_storeStrong(&self->_currentValue, 0);
  objc_storeStrong(&self->_factoryDefaultValue, 0);
}

@end
