@implementation PFAIPackage

+ (BOOL)readWithState:(id)a3
{
  id v3;
  _BOOL4 v4;
  NSString *v5;
  xmlTextReader *v6;
  xmlTextReader *v7;
  double v8;
  int v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  const xmlChar *v20;
  int v21;
  int v22;
  const xmlChar *v23;
  int Attribute;
  char *v25;
  char *v26;
  char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const xmlChar *v31;
  const xmlChar *v32;
  int v33;
  xmlChar *v34;
  unsigned __int8 *v35;
  unsigned __int8 *v36;
  unsigned __int8 *v37;
  double v38;
  double v39;
  unsigned __int8 *v40;
  double v41;
  double v42;
  unsigned __int8 *v43;
  int k;
  const xmlChar *v45;
  int v46;
  int v47;
  const xmlChar *v48;
  int v49;
  const xmlChar *v50;
  const xmlChar *v51;
  const xmlChar *v52;
  const xmlChar *v53;
  char *v54;
  unsigned __int8 *v55;
  _QWORD *v56;
  char *v57;
  int v58;
  int v59;
  const xmlChar *v60;
  int v61;
  const xmlChar *v62;
  char *v63;
  const xmlChar *v64;
  const xmlChar *v65;
  const xmlChar *v66;
  const xmlChar *v67;
  int v68;
  int v69;
  NSString *v70;
  id v71;
  xmlChar *InnerXml;
  NSString *v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  int v79;
  int v80;
  const xmlChar *v81;
  int v82;
  char *v83;
  const xmlChar *v84;
  const xmlChar *v85;
  const xmlChar *v86;
  const xmlChar *v87;
  unsigned __int8 *v88;
  id v89;
  _QWORD *v90;
  id v91;
  id v92;
  id v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  unsigned __int8 *v105;
  _QWORD *v106;
  uint64_t v107;
  unsigned __int8 *v108;
  _QWORD *v109;
  uint64_t v110;
  unsigned __int8 *v111;
  _QWORD *v112;
  NSURL *v113;
  void *v114;
  unsigned __int8 *v115;
  _BOOL8 v116;
  unsigned __int8 *v117;
  _QWORD *v118;
  NSString *v119;
  id v120;
  uint64_t *i;
  id v122;
  _QWORD *v123;
  id v124;
  id v125;
  uint64_t *j;
  id v127;
  _QWORD *v128;
  id v129;
  THBookVersion *v130;
  THBookVersion *v131;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  NSString *v136;
  id v137;
  id v138;
  id v139;
  NSURL *v140;
  int v141;
  uint64_t v142;
  xmlChar *str;
  uint64_t v145;
  int v146;
  __int128 v147;
  uint64_t v148;
  std::string __str;
  char *__endptr[2];
  char *v151;
  void *__p;
  char *v153;
  char *v154;
  __int128 v155;
  __int128 v156;
  int v157;
  __int128 v158;
  __int128 v159;
  int v160;
  _OWORD v161[2];
  int v162;
  _OWORD v163[2];
  int v164;
  void *v165[2];
  char *v166;
  __int128 v167;
  char *v168;
  __int128 v169;
  char *v170;
  __int128 v171;
  char *v172;
  char **v173;
  _QWORD v174[2];

  v3 = objc_msgSend(a3, "archive");
  v174[0] = PFXCommonApubMimeType;
  v174[1] = PFXCommonEpubMimeType;
  v4 = +[PFAXPackage validateMimetypeInArchive:validMimetypes:](PFAXPackage, "validateMimetypeInArchive:validMimetypes:", v3, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v174, 2));
  if (v4)
  {
    v5 = +[PFAXPackage opfXmlUriFromPackage:](PFAXPackage, "opfXmlUriFromPackage:", v3);
    if (v5)
    {
      objc_msgSend(a3, "setOpfEntryUri:", v5);
      if (!-[NSString hasPrefix:](v5, "hasPrefix:", CFSTR("/")))
        v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@"), v5);
      v140 = +[NSURL URLWithString:](NSURL, "URLWithString:", v5);
      v137 = objc_alloc_init((Class)NSAutoreleasePool);
      v6 = (xmlTextReader *)objc_msgSend(objc_msgSend(v3, "entryWithName:", v5), "xmlReader");
      v7 = v6;
      if (v6)
      {
        v141 = xmlTextReaderDepth(v6);
        v171 = 0uLL;
        v172 = 0;
        v169 = 0uLL;
        v170 = 0;
        v167 = 0uLL;
        v168 = 0;
        v165[1] = 0;
        v165[0] = 0;
        v166 = 0;
        v139 = +[NSMutableArray array](NSMutableArray, "array");
        v133 = v3;
        v138 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
        v134 = 0;
        v136 = 0;
        memset(v163, 0, sizeof(v163));
        v164 = 1065353216;
        memset(v161, 0, sizeof(v161));
        v162 = 1065353216;
        v158 = 0u;
        v159 = 0u;
        v160 = 1065353216;
        v155 = 0u;
        v156 = 0u;
        v157 = 1065353216;
        __p = 0;
        v153 = 0;
        v154 = 0;
        v8 = -1.0;
        v142 = v141 + 1;
        v145 = v141 + 2;
        v135 = -1;
        while (1)
        {
LABEL_7:
          if (xmlTextReaderRead(v7) != 1)
          {
LABEL_218:
            v104 = HIBYTE(v172);
            if (SHIBYTE(v172) < 0)
              v104 = *((_QWORD *)&v171 + 1);
            if (v104)
            {
              v105 = sub_1D3C70(v161, (unsigned __int8 *)&v171);
              if (v105)
              {
                v106 = v105 + 40;
                if ((char)v105[63] < 0)
                  v106 = (_QWORD *)*v106;
                objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setSearchIndexEntry:", -[NSURL path](+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v106), v140), "path"));
              }
            }
            v107 = HIBYTE(v170);
            if (SHIBYTE(v170) < 0)
              v107 = *((_QWORD *)&v169 + 1);
            if (v107)
            {
              v108 = sub_1D3C70(v161, (unsigned __int8 *)&v169);
              if (v108)
              {
                v109 = v108 + 40;
                if ((char)v108[63] < 0)
                  v109 = (_QWORD *)*v109;
                objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setSearchRefTextEntry:", -[NSURL path](+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v109), v140), "path"));
              }
            }
            v110 = HIBYTE(v168);
            if (SHIBYTE(v168) < 0)
              v110 = *((_QWORD *)&v167 + 1);
            if (v110)
            {
              v111 = sub_1D3C70(v161, (unsigned __int8 *)&v167);
              if (v111)
              {
                v112 = v111 + 40;
                if ((char)v111[63] < 0)
                  v112 = (_QWORD *)*v112;
                v113 = +[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v112), v140);
                if (v113)
                  objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setEquationEnvironmentEntry:", -[NSURL path](v113, "path"));
              }
            }
            v114 = (void *)HIBYTE(v166);
            if (SHIBYTE(v166) < 0)
              v114 = v165[1];
            if (v114)
            {
              v115 = sub_1D3C70(v163, (unsigned __int8 *)v165);
              v116 = v115 && std::string::compare((const std::string *)(v115 + 40), 0, 6uLL, "video/") == 0;
              v117 = sub_1D3C70(v161, (unsigned __int8 *)v165);
              if (v117)
              {
                v118 = v117 + 40;
                if ((char)v117[63] < 0)
                  v118 = (_QWORD *)*v118;
                v119 = -[NSURL path](+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v118), v140), "path");
                if (-[NSString hasPrefix:](v119, "hasPrefix:", CFSTR("/")))
                  v119 = -[NSString substringFromIndex:](v119, "substringFromIndex:", 1);
                objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setIntroMediaUrl:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "zipPackage"), "URLByAppendingPathComponent:", v119));
                objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setIntroMediaIsVideo:", v116);
              }
            }
            if (*((_QWORD *)&v159 + 1))
            {
              v120 = objc_alloc_init((Class)NSMutableDictionary);
              for (i = (uint64_t *)v159; i; i = (uint64_t *)*i)
              {
                v122 = objc_alloc((Class)NSString);
                v123 = i + 2;
                if (*((char *)i + 39) < 0)
                  v123 = (_QWORD *)*v123;
                v124 = objc_msgSend(v122, "initWithXmlString:", v123);
                objc_msgSend(v120, "setObject:forKey:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", *((double *)i + 5), *((double *)i + 6)), objc_msgSend(+[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", v124, objc_msgSend(a3, "opfEntryUri")), "stringByRemovingPercentEncoding"));

              }
              objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setOriginalAssetSizes:", v120);

            }
            if (*((_QWORD *)&v156 + 1))
            {
              v125 = objc_alloc_init((Class)NSMutableDictionary);
              for (j = (uint64_t *)v156; j; j = (uint64_t *)*j)
              {
                v127 = objc_alloc((Class)NSString);
                v128 = j + 2;
                if (*((char *)j + 39) < 0)
                  v128 = (_QWORD *)*v128;
                v129 = objc_msgSend(v127, "initWithXmlString:", v128);
                objc_msgSend(v125, "setObject:forKey:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", *((double *)j + 5), *((double *)j + 6)), objc_msgSend(+[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", v129, objc_msgSend(a3, "opfEntryUri")), "stringByRemovingPercentEncoding"));

              }
              objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setThinnedAssetSizes:", v125);

            }
            objc_msgSend(a3, "setRequiredVersion:", v135);
            objc_msgSend(a3, "setSpineEntries:", v139);
            objc_msgSend(a3, "setSpineURLToCfi:", v138);
            objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setWasThinned:", v134 & 1);
            objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setIsPreview:", BYTE4(v134) & 1);
            if (v8 > 0.0)
              objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setApplePubVersion:", v8);
            if (v136)
              v130 = -[THBookVersion initWithString:]([THBookVersion alloc], "initWithString:", v136);
            else
              v130 = +[THBookVersion newUnversionedBookVersion](THBookVersion, "newUnversionedBookVersion");
            v131 = v130;
            objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setBookVersion:", v130);
            objc_msgSend(objc_msgSend(a3, "archive"), "setBookVersion:", v131);

            xmlFreeTextReader(v7);
            if (__p)
            {
              v153 = (char *)__p;
              operator delete(__p);
            }
            sub_1D3D70((uint64_t)&v155);
            sub_1D3D70((uint64_t)&v158);
            sub_1EA374((uint64_t)v161);
            sub_1EA374((uint64_t)v163);
            if (SHIBYTE(v166) < 0)
              operator delete(v165[0]);
            if (SHIBYTE(v168) < 0)
              operator delete((void *)v167);
            if (SHIBYTE(v170) < 0)
              operator delete((void *)v169);
            if (SHIBYTE(v172) < 0)
              operator delete((void *)v171);
            LODWORD(v7) = 0;
            break;
          }
          v146 = xmlTextReaderDepth(v7);
          v9 = xmlTextReaderNodeType(v7);
          if (v9 == 1)
          {
            if (xmlTextReaderIsEmptyElement(v7))
              goto LABEL_29;
            v10 = v153;
            if (v153 >= v154)
            {
              v12 = (char *)__p;
              v13 = (v153 - (_BYTE *)__p) >> 3;
              v14 = v13 + 1;
              if ((unint64_t)(v13 + 1) >> 61)
                sub_36C30();
              v15 = v154 - (_BYTE *)__p;
              if ((v154 - (_BYTE *)__p) >> 2 > v14)
                v14 = v15 >> 2;
              if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
                v16 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v16 = v14;
              if (v16)
              {
                v17 = (char *)sub_3CC38((uint64_t)&v154, v16);
                v12 = (char *)__p;
                v10 = v153;
              }
              else
              {
                v17 = 0;
              }
              v18 = &v17[8 * v13];
              *(_QWORD *)v18 = 0;
              v11 = v18 + 8;
              while (v10 != v12)
              {
                v19 = *((_QWORD *)v10 - 1);
                v10 -= 8;
                *((_QWORD *)v18 - 1) = v19;
                v18 -= 8;
              }
              __p = v18;
              v153 = v11;
              v154 = &v17[8 * v16];
              if (v12)
                operator delete(v12);
            }
            else
            {
              *(_QWORD *)v153 = 0;
              v11 = v10 + 8;
            }
            v153 = v11;
          }
          if (v146 == v141 && v9 == 15)
            goto LABEL_218;
LABEL_29:
          if (v142 == v146 && v9 == 1)
          {
            v20 = xmlTextReaderConstLocalName(v7);
            *((_QWORD *)__p + v141) += 2;
            if (xmlStrEqual(v20, (const xmlChar *)"manifest"))
            {
              while (xmlTextReaderRead(v7) == 1)
              {
                v21 = xmlTextReaderDepth(v7);
                v22 = xmlTextReaderNodeType(v7);
                if (v21 == v146 && v22 == 15)
                  goto LABEL_217;
                if (v145 == v21 && v22 == 1)
                {
                  v23 = xmlTextReaderConstLocalName(v7);
                  if (xmlStrEqual(v23, (const xmlChar *)"item"))
                  {
                    Attribute = xmlTextReaderMoveToFirstAttribute(v7);
                    v25 = 0;
                    v26 = 0;
                    v27 = 0;
                    v28 = 0;
                    v29 = 0;
                    v30 = 0;
                    str = 0;
                    while (Attribute == 1)
                    {
                      v31 = xmlTextReaderConstLocalName(v7);
                      v32 = xmlTextReaderConstValue(v7);
                      if (xmlStrEqual(v31, (const xmlChar *)"id"))
                      {
                        v25 = (char *)v32;
                      }
                      else if (xmlStrEqual(v31, (const xmlChar *)"href"))
                      {
                        v26 = (char *)v32;
                      }
                      else if (xmlStrEqual(v31, (const xmlChar *)"media-type"))
                      {
                        v27 = (char *)v32;
                      }
                      else if (xmlStrEqual(v31, (const xmlChar *)"original-width"))
                      {
                        v28 = (const char *)v32;
                      }
                      else if (xmlStrEqual(v31, (const xmlChar *)"original-height"))
                      {
                        v29 = (const char *)v32;
                      }
                      else if (xmlStrEqual(v31, (const xmlChar *)"width-1x"))
                      {
                        v30 = (const char *)v32;
                      }
                      else
                      {
                        v33 = xmlStrEqual(v31, (const xmlChar *)"height-1x");
                        v34 = str;
                        if (v33)
                          v34 = (xmlChar *)v32;
                        str = v34;
                      }
                      Attribute = xmlTextReaderMoveToNextAttribute(v7);
                    }
                    if (xmlStrlen((const xmlChar *)v25) >= 1 && xmlStrlen((const xmlChar *)v26) >= 1)
                    {
                      sub_1CEE44(__endptr, v25);
                      sub_1CEE44(&__str, v26);
                      *(_QWORD *)&v147 = __endptr;
                      v35 = sub_1EA3E8((uint64_t)v161, (unsigned __int8 *)__endptr, (uint64_t)&std::piecewise_construct, (__int128 **)&v147);
                      std::string::operator=((std::string *)(v35 + 40), &__str);
                      if (xmlStrlen((const xmlChar *)v27) >= 1)
                      {
                        sub_1CEE44(&v147, v27);
                        v173 = __endptr;
                        v36 = sub_1EA3E8((uint64_t)v163, (unsigned __int8 *)__endptr, (uint64_t)&std::piecewise_construct, (__int128 **)&v173);
                        v37 = v36 + 40;
                        if ((char)v36[63] < 0)
                          operator delete(*(void **)v37);
                        *(_OWORD *)v37 = v147;
                        *((_QWORD *)v37 + 2) = v148;
                      }
                      if (xmlStrlen((const xmlChar *)v28) >= 1 && xmlStrlen((const xmlChar *)v29) >= 1)
                      {
                        v38 = atof(v28);
                        v39 = atof(v29);
                        *(_QWORD *)&v147 = &__str;
                        v40 = sub_1EA7F0((uint64_t)&v158, (unsigned __int8 *)&__str, (uint64_t)&std::piecewise_construct, (__int128 **)&v147);
                        *((double *)v40 + 5) = v38;
                        *((double *)v40 + 6) = v39;
                      }
                      if (xmlStrlen((const xmlChar *)v30) >= 1 && xmlStrlen(str) >= 1)
                      {
                        v41 = atof(v30);
                        v42 = atof((const char *)str);
                        *(_QWORD *)&v147 = &__str;
                        v43 = sub_1EA7F0((uint64_t)&v155, (unsigned __int8 *)&__str, (uint64_t)&std::piecewise_construct, (__int128 **)&v147);
                        *((double *)v43 + 5) = v41;
                        *((double *)v43 + 6) = v42;
                      }
                      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                        operator delete(__str.__r_.__value_.__l.__data_);
                      if (SHIBYTE(v151) < 0)
                        operator delete(__endptr[0]);
                    }
                  }
                }
              }
            }
            else
            {
              if (xmlStrEqual(v20, (const xmlChar *)"spine"))
              {
                for (k = xmlTextReaderMoveToFirstAttribute(v7); ; k = xmlTextReaderMoveToNextAttribute(v7))
                {
                  if (k != 1)
                    goto LABEL_172;
                  v45 = xmlTextReaderConstLocalName(v7);
                  if (xmlStrEqual(v45, (const xmlChar *)"toc"))
                    break;
                }
                v54 = (char *)xmlTextReaderConstValue(v7);
                sub_1CEE44(__endptr, v54);
                v55 = sub_1D3C70(v161, (unsigned __int8 *)__endptr);
                if (v55)
                {
                  v56 = v55 + 40;
                  if ((char)v55[63] < 0)
                    v56 = (_QWORD *)*v56;
                  objc_msgSend(a3, "setNcxEntryUri:", -[NSURL path](+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v56), v140), "path"));
                }
                if (SHIBYTE(v151) < 0)
                {
                  v57 = __endptr[0];
                }
                else
                {
                  while (1)
                  {
LABEL_172:
                    if (xmlTextReaderRead(v7) != 1)
                      goto LABEL_7;
                    v79 = xmlTextReaderDepth(v7);
                    v80 = xmlTextReaderNodeType(v7);
                    if (v79 == v146 && v80 == 15)
                      goto LABEL_217;
                    if (v145 == v79 && v80 == 1)
                    {
                      *((_QWORD *)__p + v142) += 2;
                      v81 = xmlTextReaderConstLocalName(v7);
                      if (xmlStrEqual(v81, (const xmlChar *)"itemref"))
                      {
                        v82 = xmlTextReaderMoveToFirstAttribute(v7);
                        v83 = 0;
                        v84 = 0;
                        v85 = 0;
                        while (v82 == 1)
                        {
                          v86 = xmlTextReaderConstLocalName(v7);
                          v87 = xmlTextReaderConstValue(v7);
                          if (xmlStrEqual(v86, (const xmlChar *)"idref"))
                          {
                            v83 = (char *)v87;
                          }
                          else if (xmlStrEqual(v86, (const xmlChar *)"linear"))
                          {
                            v84 = v87;
                          }
                          else if (xmlStrEqual(v86, (const xmlChar *)"id"))
                          {
                            v85 = v87;
                          }
                          v82 = xmlTextReaderMoveToNextAttribute(v7);
                        }
                        if (xmlStrEqual(v84, (const xmlChar *)"yes") && xmlStrlen((const xmlChar *)v83) >= 1)
                        {
                          sub_1CEE44(__endptr, v83);
                          v88 = sub_1D3C70(v161, (unsigned __int8 *)__endptr);
                          if (SHIBYTE(v151) < 0)
                            operator delete(__endptr[0]);
                          if (v88)
                          {
                            v89 = objc_alloc((Class)NSString);
                            v90 = v88 + 40;
                            if ((char)v88[63] < 0)
                              v90 = (_QWORD *)*v90;
                            v91 = objc_msgSend(v89, "initWithXmlString:", v90);
                            v92 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:relativeToURL:", v91, v140);
                            v93 = objc_msgSend(v92, "path");
                            objc_msgSend(v139, "addObject:", v93);
                            __endptr[0] = 0;
                            __endptr[1] = 0;
                            v151 = 0;
                            if (v79 >= 1)
                            {
                              v94 = 0;
                              v95 = 0;
                              do
                              {
                                if (v94 >= v151)
                                {
                                  v96 = (v94 - __endptr[0]) >> 3;
                                  if ((unint64_t)(v96 + 1) >> 61)
                                    sub_36C30();
                                  v97 = (v151 - __endptr[0]) >> 2;
                                  if (v97 <= v96 + 1)
                                    v97 = v96 + 1;
                                  if ((unint64_t)(v151 - __endptr[0]) >= 0x7FFFFFFFFFFFFFF8)
                                    v98 = 0x1FFFFFFFFFFFFFFFLL;
                                  else
                                    v98 = v97;
                                  if (v98)
                                    v99 = (char *)sub_3CC38((uint64_t)&v151, v98);
                                  else
                                    v99 = 0;
                                  v100 = &v99[8 * v96];
                                  *(_QWORD *)v100 = 0;
                                  v94 = v100 + 8;
                                  v102 = __endptr[0];
                                  v101 = __endptr[1];
                                  if (__endptr[1] != __endptr[0])
                                  {
                                    do
                                    {
                                      v103 = *((_QWORD *)v101 - 1);
                                      v101 -= 8;
                                      *((_QWORD *)v100 - 1) = v103;
                                      v100 -= 8;
                                    }
                                    while (v101 != v102);
                                    v101 = __endptr[0];
                                  }
                                  __endptr[0] = v100;
                                  __endptr[1] = v94;
                                  v151 = &v99[8 * v98];
                                  if (v101)
                                    operator delete(v101);
                                }
                                else
                                {
                                  *(_QWORD *)v94 = 0;
                                  v94 += 8;
                                }
                                __endptr[1] = v94;
                                ++v95;
                              }
                              while (v95 != v145);
                            }
                            if (v85)
                              *(_QWORD *)&__endptr[0][8 * v142] = v85;
                            objc_msgSend(v138, "setObject:forKey:", +[PFXCommon cfiPathToNodeWithDepth:nodeArray:idArray:](PFXCommon, "cfiPathToNodeWithDepth:nodeArray:idArray:", v145, &__p, __endptr), v93);

                            v57 = __endptr[0];
                            if (__endptr[0])
                              break;
                          }
                        }
                      }
                    }
                  }
                  __endptr[1] = __endptr[0];
                }
                operator delete(v57);
                goto LABEL_172;
              }
              if (xmlStrEqual(v20, (const xmlChar *)"guide"))
              {
                while (xmlTextReaderRead(v7) == 1)
                {
                  v46 = xmlTextReaderDepth(v7);
                  v47 = xmlTextReaderNodeType(v7);
                  if (v46 == v146 && v47 == 15)
                    goto LABEL_217;
                  if (v145 == v46 && v47 == 1)
                  {
                    v48 = xmlTextReaderConstLocalName(v7);
                    if (xmlStrEqual(v48, (const xmlChar *)"reference"))
                    {
                      v49 = xmlTextReaderMoveToFirstAttribute(v7);
                      v50 = 0;
                      v51 = 0;
                      while (v49 == 1)
                      {
                        v52 = xmlTextReaderConstLocalName(v7);
                        v53 = xmlTextReaderConstValue(v7);
                        if (xmlStrEqual(v52, (const xmlChar *)"type"))
                        {
                          v50 = v53;
                        }
                        else if (xmlStrEqual(v52, (const xmlChar *)"href"))
                        {
                          v51 = v53;
                        }
                        v49 = xmlTextReaderMoveToNextAttribute(v7);
                      }
                      if (xmlStrEqual(v50, (const xmlChar *)"glossary") && xmlStrlen(v51) >= 1)
                        objc_msgSend(a3, "setGlossaryEntryUri:", -[NSURL path](+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v51), v140), "path"));
                      goto LABEL_7;
                    }
                  }
                }
              }
              else if (xmlStrEqual(v20, (const xmlChar *)"metadata"))
              {
                while (1)
                {
                  while (1)
                  {
                    do
                    {
LABEL_98:
                      if (xmlTextReaderRead(v7) != 1)
                        goto LABEL_7;
                      v58 = xmlTextReaderDepth(v7);
                      v59 = xmlTextReaderNodeType(v7);
                      if (v58 == v146 && v59 == 15)
                      {
LABEL_217:
                        v153 -= 8;
                        goto LABEL_7;
                      }
                    }
                    while (v145 != v58 || v59 != 1);
                    v60 = xmlTextReaderConstLocalName(v7);
                    if (xmlStrEqual(v60, (const xmlChar *)"meta"))
                      break;
                    if (xmlStrEqual(v60, (const xmlChar *)"language"))
                    {
                      v67 = xmlTextReaderConstNamespaceUri(v7);
                      if (xmlStrEqual(v67, (const xmlChar *)PFXCommonDublinCoreMetadataNS[0]))
                      {
                        while (xmlTextReaderRead(v7) == 1)
                        {
                          v68 = xmlTextReaderDepth(v7);
                          v69 = xmlTextReaderNodeType(v7);
                          if (v68 == v58 && v69 == 15)
                            break;
                          if (v141 + 3 == v68 && v69 == 3)
                          {
                            v70 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", xmlTextReaderConstValue(v7));
                            if (v70)
                            {
                              v71 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", v70);
                              objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setBookLocale:", v71);

                              goto LABEL_98;
                            }
                          }
                        }
                      }
                    }
                  }
                  v61 = xmlTextReaderMoveToFirstAttribute(v7);
                  v62 = 0;
                  v63 = 0;
                  v64 = 0;
                  while (1)
                  {
                    if (v61 != 1)
                      goto LABEL_98;
                    v65 = xmlTextReaderConstLocalName(v7);
                    v66 = xmlTextReaderConstValue(v7);
                    if (xmlStrEqual(v65, (const xmlChar *)"name"))
                    {
                      v62 = v66;
                      if (!v63)
                        goto LABEL_126;
                      goto LABEL_108;
                    }
                    if (!xmlStrEqual(v65, (const xmlChar *)"content"))
                      break;
                    v63 = (char *)v66;
                    if (!v66)
                      goto LABEL_126;
LABEL_108:
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:searchIndex") && *v63)
                    {
                      sub_1CEE44(__endptr, v63);
                      if (SHIBYTE(v172) < 0)
                        operator delete((void *)v171);
                      v171 = *(_OWORD *)__endptr;
                      v172 = v151;
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:searchReferenceText") && *v63)
                    {
                      sub_1CEE44(__endptr, v63);
                      if (SHIBYTE(v170) < 0)
                        operator delete((void *)v169);
                      v169 = *(_OWORD *)__endptr;
                      v170 = v151;
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:equationEnvironment") && *v63)
                    {
                      sub_1CEE44(__endptr, v63);
                      if (SHIBYTE(v168) < 0)
                        operator delete((void *)v167);
                      v167 = *(_OWORD *)__endptr;
                      v168 = v151;
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:introMedia") && *v63)
                    {
                      if ((objc_msgSend(v133, "isEPUB") & 1) == 0)
                      {
                        sub_1CEE44(__endptr, v63);
                        if (SHIBYTE(v166) < 0)
                          operator delete(v165[0]);
                        *(_OWORD *)v165 = *(_OWORD *)__endptr;
                        v166 = v151;
                      }
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:requiredVersion") && *v63)
                    {
                      __endptr[0] = 0;
                      v76 = strtol(v63, __endptr, 10);
                      v77 = v135;
                      if (__endptr[0] != v63)
                        v77 = v76;
                      v135 = v77;
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:currentVersion") && *v63)
                    {
                      __endptr[0] = 0;
                      v78 = strtod(v63, __endptr);
                      if (__endptr[0] != v63)
                        v8 = v78;
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:thinningversion") && *v63)
                    {
                      LOBYTE(v134) = 1;
                      goto LABEL_98;
                    }
                    if (xmlStrEqual(v62, (const xmlChar *)"ibooks:preview"))
                    {
                      BYTE4(v134) = -[NSString BOOLValue](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v63), "BOOLValue");
                      goto LABEL_98;
                    }
LABEL_128:
                    v61 = xmlTextReaderMoveToNextAttribute(v7);
                  }
                  if (xmlStrEqual(v65, (const xmlChar *)"property"))
                    v64 = v66;
                  if (v63)
                    goto LABEL_108;
LABEL_126:
                  if (xmlStrEqual(v64, (const xmlChar *)"ibooks:version"))
                  {
                    InnerXml = xmlTextReaderReadInnerXml(v7);
                    v136 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", InnerXml);
                    if (!InnerXml)
                      goto LABEL_98;
LABEL_152:
                    xmlFree(InnerXml);
                    goto LABEL_98;
                  }
                  if (!xmlStrEqual(v64, (const xmlChar *)"dcterms:modified"))
                    goto LABEL_128;
                  InnerXml = xmlTextReaderReadInnerXml(v7);
                  v73 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", InnerXml);
                  if (-[NSString length](v73, "length"))
                  {
                    v74 = objc_alloc_init((Class)NSDateFormatter);
                    v75 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
                    objc_msgSend(v74, "setLocale:", v75);

                    objc_msgSend(v74, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"));
                    objc_msgSend(v74, "setTimeZone:", +[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
                    objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "properties"), "setModificationDate:", objc_msgSend(v74, "dateFromString:", v73));

                  }
                  if (InnerXml)
                    goto LABEL_152;
                }
              }
            }
          }
        }
      }

      if ((_DWORD)v7)
        objc_exception_rethrow();
      LOBYTE(v4) = objc_msgSend(a3, "ncxEntryUri") != 0;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

@end
