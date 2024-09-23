@implementation CRLSVGToBezierPathConverter

- (id)bezierPathFromSVGData:(id)a3
{
  id v4;
  CRLBezierPath *v5;
  CRLBezierPath *mFileBezierPath;
  NSString *mHiddenOnTag;
  __int128 v8;
  CGSize size;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  CRLBezierPath *v16;
  CRLBezierPath *v17;
  CRLBezierPath *v18;
  const CGPath *v20;
  void *v21;
  CRLBezierPath *v22;
  CRLBezierPath *v23;
  _QWORD v24[2];

  v4 = a3;
  v5 = objc_alloc_init(CRLBezierPath);
  mFileBezierPath = self->mFileBezierPath;
  self->mFileBezierPath = v5;

  mHiddenOnTag = self->mHiddenOnTag;
  self->mHiddenOnTag = 0;

  self->mHiddenOnTagNestedCount = 0;
  v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&self->mGroupedAffineTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&self->mGroupedAffineTransform.c = v8;
  *(_OWORD *)&self->mGroupedAffineTransform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  self->mGroupedAffineTransformNestedCount = 0;
  self->mViewBoxFound = 0;
  size = CGRectZero.size;
  self->mViewBox.origin = CGRectZero.origin;
  self->mViewBox.size = size;
  self->mUsesEvenOdd = 0;
  v10 = objc_msgSend(objc_alloc((Class)NSXMLParser), "initWithData:", v4);

  objc_msgSend(v10, "setDelegate:", self);
  if (objc_msgSend(v10, "parse")
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parserError")), v11, !v11))
  {
    if (!self->mViewBoxFound)
      goto LABEL_13;
    v20 = CGPathCreateWithRect(self->mViewBox, 0);
    v17 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v20));
    CGPathRelease(v20);
    v24[0] = self->mFileBezierPath;
    v24[1] = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
    v22 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath intersectBezierPaths:](CRLBezierPath, "intersectBezierPaths:", v21));

    v23 = self->mFileBezierPath;
    self->mFileBezierPath = v22;

  }
  else
  {
    v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E8F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E35228();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E910);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E337F8(v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter bezierPathFromSVGData:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 62, 0, "Unable to Parse SVG File");

    v16 = objc_alloc_init(CRLBezierPath);
    v17 = self->mFileBezierPath;
    self->mFileBezierPath = v16;
  }

LABEL_13:
  v18 = self->mFileBezierPath;

  return v18;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  CGFloat v58;
  void *v59;
  double v60;
  CGFloat v61;
  void *v62;
  double v63;
  CGFloat v64;
  void *v65;
  CGFloat v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  unsigned __int8 v76;
  NSString *v77;
  NSString *mHiddenOnTag;
  __int128 v79;
  __int128 v80;
  void *v81;
  void *v82;
  __int128 v83;
  unsigned int v84;
  void *v85;
  CGPath *v86;
  CGPath *Mutable;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  float v93;
  uint64_t v94;
  void *v95;
  void *v96;
  float v97;
  CGFloat v98;
  void *v99;
  float v100;
  void *v101;
  float v102;
  CGFloat v103;
  void *v104;
  float v105;
  void *v106;
  void *v107;
  void *v108;
  float v109;
  CGFloat v110;
  void *v111;
  float v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  double v121;
  id v122;
  const CGPath *v123;
  void *v124;
  float v125;
  double v126;
  void *v127;
  float v128;
  double v129;
  void *v130;
  float v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  float v147;
  id v148;
  __int128 v149;
  void *v150;
  void *v151;
  __int128 v152;
  CGPathRef v153;
  void *v154;
  CRLBezierPath **p_mFileBezierPath;
  CRLBezierPath *mFileBezierPath;
  void *v157;
  void *v158;
  double v159;
  double v160;
  void *v161;
  double v162;
  double v163;
  void *v164;
  float v165;
  double v166;
  void *v167;
  float v168;
  double v169;
  void *v170;
  float v171;
  double v172;
  void *v173;
  float v174;
  double v175;
  id v176;
  id v177;
  void *v178;
  id v179;
  CRLSVGToBezierPathConverter *v180;
  CRLSVGToBezierPathConverter *v181;
  id v182;
  id v183;
  id v184;
  void *v185;
  int v186;
  int v187;
  int v188;
  CGAffineTransform v189;
  CGAffineTransform t1;
  CGAffineTransform t2;
  id v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  _QWORD v197[2];
  CGAffineTransform buf;
  _BYTE v199[128];

  v184 = a3;
  v12 = a4;
  v183 = a5;
  v182 = a6;
  v13 = a7;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("style")));
  v185 = (void *)v14;
  if (v14)
  {
    v15 = (void *)v14;
    v178 = v13;
    v180 = self;
    v177 = v12;
    v16 = objc_msgSend(v13, "mutableCopy");
    v193 = 0u;
    v194 = 0u;
    v195 = 0u;
    v196 = 0u;
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(";")));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v193, v199, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v194;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v194 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * (_QWORD)v21);
          if (objc_msgSend(v22, "length"))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(":")));
            if (objc_msgSend(v23, "count") != (id)2)
            {
              v24 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10125E930);
              v25 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf.a) = 67109890;
                HIDWORD(buf.a) = v24;
                LOWORD(buf.b) = 2082;
                *(_QWORD *)((char *)&buf.b + 2) = "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qual"
                                                  "ifiedName:attributes:]";
                WORD1(buf.c) = 2082;
                *(_QWORD *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVG"
                                                  "ToBezierPathConverter.m";
                WORD2(buf.d) = 1024;
                *(_DWORD *)((char *)&buf.d + 6) = 90;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Style components in SVG <style> tag should have one key and one value.", (uint8_t *)&buf, 0x22u);
              }

              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10125E950);
              v26 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
              {
                v34 = (id)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                LODWORD(buf.a) = 67109378;
                HIDWORD(buf.a) = v24;
                LOWORD(buf.b) = 2114;
                *(_QWORD *)((char *)&buf.b + 2) = v34;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);

              }
              v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 90, 0, "Style components in SVG <style> tag should have one key and one value.");

            }
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", 0));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByTrimmingCharactersInSet:", v29));

            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", 1));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByTrimmingCharactersInSet:", v29));

            objc_msgSend(v16, "setObject:forKeyedSubscript:", v33, v31);
          }
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v193, v199, 16);
      }
      while (v19);
    }

    v35 = v16;
    v13 = v35;
    v12 = v177;
    self = v180;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("svg")))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("preserveAspectRatio")));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "componentsSeparatedByCharactersInSet:", v37));

    if (!objc_msgSend(v38, "count"))
    {
LABEL_58:
      v45 = v13;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("viewBox")));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "componentsSeparatedByCharactersInSet:", v55));

      if (objc_msgSend(v46, "count") == (id)4)
      {
        self->mViewBoxFound = 1;
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndexedSubscript:", 0));
        objc_msgSend(v56, "doubleValue");
        v58 = v57;
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndexedSubscript:", 1));
        objc_msgSend(v59, "doubleValue");
        v61 = v60;
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndexedSubscript:", 2));
        objc_msgSend(v62, "doubleValue");
        v64 = v63;
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndexedSubscript:", 3));
        objc_msgSend(v65, "doubleValue");
        self->mViewBox.origin.x = v58;
        self->mViewBox.origin.y = v61;
        self->mViewBox.size.width = v64;
        self->mViewBox.size.height = v66;

      }
      else
      {
        v67 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125EA30);
        v68 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_ERROR))
          sub_100E3545C(v46, v67, v68);

        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125EA50);
        v69 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_ERROR))
          sub_100E352B0();

        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v56, v59, 132, 0, "Unexpected number of viewBox components! (%zu)", objc_msgSend(v46, "count"));
      }

      goto LABEL_70;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectAtIndexedSubscript:", 0));
    v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("defer"));

    if (v40)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E970);
      v41 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
        sub_100E3562C();

      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E990);
      v42 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
        sub_100E352B0();

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v43, v44, 111, 0, "Unexpected 'defer' component");

    }
    if (objc_msgSend(v38, "count") == (id)1)
      goto LABEL_71;
    if (objc_msgSend(v38, "count") == (id)2)
    {
      v45 = v13;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectAtIndexedSubscript:", 1));
      if ((objc_msgSend(v46, "isEqualToString:", CFSTR("meet")) & 1) != 0)
      {
LABEL_70:

        v13 = v45;
LABEL_71:
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("style")));
        if (v70)
        {
          v192 = 0;
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("fill-rule:[ \t]*evenodd"), 1, &v192));
          v72 = v192;
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "matchesInString:options:range:", v70, 0, 0, objc_msgSend(v70, "length")));
          if (objc_msgSend(v73, "count"))
            self->mUsesEvenOdd = 1;

        }
        goto LABEL_76;
      }
      if ((objc_msgSend(v46, "isEqualToString:", CFSTR("slice")) & 1) != 0)
        goto LABEL_57;
      v186 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E9B0);
      v47 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
        sub_100E354FC((uint64_t)v46, v186);

      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E9D0);
      v48 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_ERROR))
        sub_100E352B0();

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v49, v50, 119, 0, "Unknown component %@", v46);

    }
    else
    {
      v51 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E9F0);
      v52 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_ERROR))
        sub_100E3558C(v38, v51, v52);

      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125EA10);
      v45 = v13;
      v53 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR))
        sub_100E352B0();

      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v46, v49, 122, 0, "Unexpected number of preserveAspectRatio components! (%zu)", objc_msgSend(v38, "count"));
    }

LABEL_57:
    v13 = v45;
    goto LABEL_58;
  }
LABEL_76:
  v74 = v185;
  if (-[NSString isEqualToString:](self->mHiddenOnTag, "isEqualToString:", v12))
    ++self->mHiddenOnTagNestedCount;
  if (!self->mHiddenOnTag)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("display")));
    if ((objc_msgSend(v75, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {

LABEL_82:
      v77 = (NSString *)objc_msgSend(v12, "copy");
      mHiddenOnTag = self->mHiddenOnTag;
      self->mHiddenOnTag = v77;

      goto LABEL_156;
    }
    v76 = objc_msgSend(v12, "isEqualToString:", CFSTR("pattern"));

    if ((v76 & 1) != 0)
      goto LABEL_82;
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("g")))
    {
      v79 = *(_OWORD *)&self->mGroupedAffineTransform.c;
      *(_OWORD *)&buf.a = *(_OWORD *)&self->mGroupedAffineTransform.a;
      *(_OWORD *)&buf.c = v79;
      *(_OWORD *)&buf.tx = *(_OWORD *)&self->mGroupedAffineTransform.tx;
      v80 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&t2.c = v80;
      *(_OWORD *)&t2.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
      if (CGAffineTransformEqualToTransform(&buf, &t2))
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("transform")));

        if (v81)
        {
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("transform")));
          +[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:](CRLSVGToBezierPathConverter, "transformFromSVGTransformAttributeString:", v82);
          v83 = *(_OWORD *)&buf.c;
          *(_OWORD *)&self->mGroupedAffineTransform.a = *(_OWORD *)&buf.a;
          *(_OWORD *)&self->mGroupedAffineTransform.c = v83;
          *(_OWORD *)&self->mGroupedAffineTransform.tx = *(_OWORD *)&buf.tx;

        }
      }
      else
      {
        ++self->mGroupedAffineTransformNestedCount;
      }
    }
    v84 = objc_msgSend(v12, "isEqualToString:", CFSTR("line"));
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("path")))
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("d")));
      v86 = +[CRLSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:](CRLSVGToBezierPathConverter, "newPathFromSVGPathString:shouldClosePathAtEnd:", v85, v84 ^ 1);
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("polyline")))
      {
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("polygon")) & 1) != 0)
        {
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("points")));
          Mutable = +[CRLSVGToBezierPathConverter newPathFromSVGPolygonString:](CRLSVGToBezierPathConverter, "newPathFromSVGPolygonString:", v95);

          if (!v84)
            goto LABEL_143;
        }
        else
        {
          if (!v84)
          {
            if (objc_msgSend(v12, "isEqualToString:", CFSTR("rect")))
            {
              v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("width")));
              objc_msgSend(v106, "floatValue");
              v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("height")));
              objc_msgSend(v107, "floatValue");

              memset(&buf, 0, sizeof(buf));
              v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("x")));
              objc_msgSend(v108, "floatValue");
              v110 = v109;
              v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("y")));
              objc_msgSend(v111, "floatValue");
              CGAffineTransformMakeTranslation(&buf, v110, v112);

              v113 = sub_10005FDDC();
              v115 = v114;
              v117 = v116;
              v119 = v118;
              v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("rx")));
              objc_msgSend(v120, "crl_CGFloatValue");
              v122 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithLegacyRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithLegacyRoundedRect:cornerRadius:", v113, v115, v117, v119, v121)));
              v123 = CGPathRetain((CGPathRef)objc_msgSend(v122, "CGPath"));

              Mutable = CGPathCreateCopyByTransformingPath(v123, &buf);
              CGPathRelease(v123);
              goto LABEL_143;
            }
            if (objc_msgSend(v12, "isEqualToString:", CFSTR("circle")))
            {
              v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("r")));
              objc_msgSend(v124, "floatValue");
              v126 = v125;

              v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("cx")));
              objc_msgSend(v127, "floatValue");
              v129 = v128 - v126;

              v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("cy")));
              objc_msgSend(v130, "floatValue");
              v132 = v131 - v126;

              v133 = v126 + v126;
              v134 = v129;
              v135 = v132;
              v136 = v126 + v126;
            }
            else
            {
              if (!objc_msgSend(v12, "isEqualToString:", CFSTR("ellipse")))
              {
                Mutable = CGPathCreateMutable();
                goto LABEL_143;
              }
              v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("rx")));
              objc_msgSend(v164, "floatValue");
              v166 = v165;

              v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ry")));
              objc_msgSend(v167, "floatValue");
              v169 = v168;

              v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("cx")));
              objc_msgSend(v170, "floatValue");
              v172 = v171 - v166;

              v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("cy")));
              objc_msgSend(v173, "floatValue");
              v175 = v174 - v169;

              v133 = v166 + v166;
              v136 = v169 + v169;
              v134 = v172;
              v135 = v175;
            }
            v176 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", v134, v135, v133, v136)));
            Mutable = (CGPath *)objc_msgSend(v176, "CGPath");

            CGPathRetain(Mutable);
            goto LABEL_143;
          }
          Mutable = CGPathCreateMutable();
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("x1")));
          objc_msgSend(v96, "floatValue");
          v98 = v97;
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("y1")));
          objc_msgSend(v99, "floatValue");
          CGPathMoveToPoint(Mutable, 0, v98, v100);

          v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("x2")));
          objc_msgSend(v101, "floatValue");
          v103 = v102;
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("y2")));
          objc_msgSend(v104, "floatValue");
          CGPathAddLineToPoint(Mutable, 0, v103, v105);

        }
LABEL_93:
        v181 = self;
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("stroke-width")));
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("stroke-linecap")));
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("stroke-linejoin")));
        v179 = v13;
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("stroke-miterlimit")));
        v92 = 1.0;
        if (v88 && (objc_msgSend(v88, "isEqualToString:", &stru_1012A72B0) & 1) == 0)
        {
          objc_msgSend(v88, "floatValue");
          v92 = v93;
        }
        if (v89
          && (objc_msgSend(v89, "isEqualToString:", &stru_1012A72B0) & 1) == 0
          && (objc_msgSend(v89, "isEqualToString:", CFSTR("butt")) & 1) == 0)
        {
          if ((objc_msgSend(v89, "isEqualToString:", CFSTR("round")) & 1) != 0)
          {
            v94 = 1;
LABEL_122:
            if (v90
              && (objc_msgSend(v90, "isEqualToString:", &stru_1012A72B0) & 1) == 0
              && (objc_msgSend(v90, "isEqualToString:", CFSTR("miter")) & 1) == 0)
            {
              if ((objc_msgSend(v89, "isEqualToString:", CFSTR("round")) & 1) != 0)
              {
                v141 = 1;
                goto LABEL_139;
              }
              if ((objc_msgSend(v89, "isEqualToString:", CFSTR("bevel")) & 1) != 0)
              {
                v141 = 2;
                goto LABEL_139;
              }
              v188 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10125EAB0);
              v142 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v142, OS_LOG_TYPE_ERROR))
                sub_100E3533C((uint64_t)v90, v188);

              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10125EAD0);
              v143 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v143, OS_LOG_TYPE_ERROR))
                sub_100E352B0();

              v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"));
              v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v144, v145, 254, 0, "Unexpected Line Join Style: %@", v90);

            }
            v141 = 0;
LABEL_139:
            v146 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", Mutable));
            objc_msgSend(v146, "setLineWidth:", v92);
            objc_msgSend(v146, "setLineCapStyle:", v94);
            objc_msgSend(v146, "setLineJoinStyle:", v141);
            if (v91 && (objc_msgSend(v91, "isEqualToString:", &stru_1012A72B0) & 1) == 0)
            {
              objc_msgSend(v91, "floatValue");
              objc_msgSend(v146, "setMiterLimit:", v147);
            }
            v148 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "strokedCopy")));
            Mutable = (CGPath *)objc_msgSend(v148, "CGPath");

            CGPathRetain(Mutable);
            v13 = v179;
            self = v181;
LABEL_143:
            v149 = *(_OWORD *)&self->mGroupedAffineTransform.c;
            *(_OWORD *)&buf.a = *(_OWORD *)&self->mGroupedAffineTransform.a;
            *(_OWORD *)&buf.c = v149;
            *(_OWORD *)&buf.tx = *(_OWORD *)&self->mGroupedAffineTransform.tx;
            v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("transform")));

            if (v150)
            {
              memset(&t2, 0, sizeof(t2));
              v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("transform")));
              +[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:](CRLSVGToBezierPathConverter, "transformFromSVGTransformAttributeString:", v151);

              t1 = buf;
              v189 = t2;
              CGAffineTransformConcat(&buf, &t1, &v189);
            }
            t2 = buf;
            v152 = *(_OWORD *)&CGAffineTransformIdentity.c;
            *(_OWORD *)&t1.a = *(_OWORD *)&CGAffineTransformIdentity.a;
            *(_OWORD *)&t1.c = v152;
            *(_OWORD *)&t1.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
            if (!CGAffineTransformEqualToTransform(&t2, &t1))
            {
              v153 = CGPathCreateCopyByTransformingPath(Mutable, &buf);
              CGPathRelease(Mutable);
              Mutable = v153;
            }
            v154 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", Mutable));
            objc_msgSend(v154, "setWindingRule:", self->mUsesEvenOdd);
            CGPathRelease(Mutable);
            mFileBezierPath = self->mFileBezierPath;
            p_mFileBezierPath = &self->mFileBezierPath;
            v197[0] = mFileBezierPath;
            v197[1] = v154;
            v157 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v197, 2));
            v158 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath uniteBezierPaths:](CRLBezierPath, "uniteBezierPaths:", v157));

            if ((objc_msgSend(v158, "isEmpty") & 1) != 0)
            {
              v74 = v185;
              if ((objc_msgSend(v154, "isEmpty") & 1) != 0)
                goto LABEL_155;
              objc_msgSend(v154, "controlPointBounds");
              if (v160 <= 1.0)
                goto LABEL_155;
              v161 = v154;
              if (v159 <= 1.0)
                goto LABEL_155;
            }
            else
            {
              objc_msgSend(v158, "controlPointBounds");
              v74 = v185;
              if (v163 <= 1.0)
                goto LABEL_155;
              v161 = v158;
              if (v162 <= 1.0)
                goto LABEL_155;
            }
            objc_storeStrong((id *)p_mFileBezierPath, v161);
LABEL_155:

            goto LABEL_156;
          }
          if ((objc_msgSend(v89, "isEqualToString:", CFSTR("square")) & 1) != 0)
          {
            v94 = 2;
            goto LABEL_122;
          }
          v187 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125EA70);
          v137 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v137, OS_LOG_TYPE_ERROR))
            sub_100E353CC((uint64_t)v89, v187);

          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125EA90);
          v138 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v138, OS_LOG_TYPE_ERROR))
            sub_100E352B0();

          v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]"));
          v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v139, v140, 242, 0, "Unexpected Line Cap Style: %@", v89);

        }
        v94 = 0;
        goto LABEL_122;
      }
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("points")));
      v86 = +[CRLSVGToBezierPathConverter newPathFromSVGPolylineString:](CRLSVGToBezierPathConverter, "newPathFromSVGPolylineString:", v85);
    }
    Mutable = v86;

    if ((v84 & 1) == 0)
      goto LABEL_143;
    goto LABEL_93;
  }
LABEL_156:

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v7;
  unint64_t mHiddenOnTagNestedCount;
  NSString *mHiddenOnTag;
  __int128 v10;
  __int128 v11;
  unint64_t mGroupedAffineTransformNestedCount;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v7 = a4;
  if (-[NSString isEqualToString:](self->mHiddenOnTag, "isEqualToString:", v7))
  {
    mHiddenOnTagNestedCount = self->mHiddenOnTagNestedCount;
    if (mHiddenOnTagNestedCount)
    {
      self->mHiddenOnTagNestedCount = mHiddenOnTagNestedCount - 1;
    }
    else
    {
      mHiddenOnTag = self->mHiddenOnTag;
      self->mHiddenOnTag = 0;

    }
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("g")))
  {
    v10 = *(_OWORD *)&self->mGroupedAffineTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->mGroupedAffineTransform.a;
    *(_OWORD *)&t1.c = v10;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->mGroupedAffineTransform.tx;
    v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v15 = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    v13 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v14 = v11;
    *(_OWORD *)&t2.c = v11;
    *(_OWORD *)&t2.tx = v13;
    if (!CGAffineTransformEqualToTransform(&t1, &t2))
    {
      mGroupedAffineTransformNestedCount = self->mGroupedAffineTransformNestedCount;
      if (mGroupedAffineTransformNestedCount)
      {
        self->mGroupedAffineTransformNestedCount = mGroupedAffineTransformNestedCount - 1;
      }
      else
      {
        *(_OWORD *)&self->mGroupedAffineTransform.a = v15;
        *(_OWORD *)&self->mGroupedAffineTransform.c = v14;
        *(_OWORD *)&self->mGroupedAffineTransform.tx = v13;
      }
    }
  }

}

+ (CGPath)newPathFromSVGPathString:(id)a3
{
  return +[CRLSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:](CRLSVGToBezierPathConverter, "newPathFromSVGPathString:shouldClosePathAtEnd:", a3, 0);
}

+ (CGPath)newPathFromSVGPathString:(id)a3 shouldClosePathAtEnd:(BOOL)a4
{
  id v4;
  const CGPath *Mutable;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int16 v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  unsigned int v23;
  double v24;
  double v25;
  CGPoint CurrentPoint;
  void *v27;
  unsigned int v28;
  double v29;
  double v30;
  CGPoint v31;
  unsigned int v32;
  CGPath *v33;
  uint64_t v34;
  CGPath *v35;
  unsigned int v36;
  double v37;
  CGPath *v38;
  double v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  __int16 v43;
  double v44;
  double v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  double v50;
  double v51;
  CGPoint v52;
  CGPath *MutableCopy;
  unsigned int v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  _BOOL4 v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double x;
  CGPoint v67;
  CGPoint v68;
  CGPoint v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  CGFloat y[2];
  _BYTE buf[18];
  __int16 v77;
  const char *v78;
  __int16 v79;
  int v80;
  __int16 v81;
  id v82;
  uint64_t v83;
  int v84;

  v61 = a4;
  v4 = a3;
  Mutable = CGPathCreateMutable();
  v67 = CGPointZero;
  *(CGPoint *)y = CGPointZero;
  v62 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v4));
  v83 = *(_QWORD *)asc_100EF023C;
  v84 = 2883717;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v83, 6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", v7));
  objc_msgSend(v6, "setCharactersToBeSkipped:", v8);

  if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    goto LABEL_3;
  }
  v17 = 0;
  v10 = 0;
  v18 = CGPointZero.y;
  v65 = v18;
  x = CGPointZero.x;
  v19 = CGPointZero.x;
  v20 = v18;
  while (2)
  {
    v21 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet"));
    v74 = v10;
    v23 = objc_msgSend(v6, "scanCharactersFromSet:intoString:", v22, &v74);
    v10 = v74;

    if (v23)
      objc_msgSend(v6, "setScanLocation:", (_BYTE *)objc_msgSend(v6, "scanLocation") - (_BYTE *)objc_msgSend(v10, "length") + 1);
    v11 = objc_msgSend(v10, "characterAtIndex:", 0);
    v24 = v18;
    v25 = CGPointZero.x;
    if (!CGPathIsEmpty(Mutable))
    {
      CurrentPoint = CGPathGetCurrentPoint(Mutable);
      v25 = CurrentPoint.x;
      v24 = CurrentPoint.y;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet lowercaseLetterCharacterSet](NSCharacterSet, "lowercaseLetterCharacterSet"));
    v28 = objc_msgSend(v27, "characterIsMember:", v11);

    v29 = v18;
    v30 = CGPointZero.x;
    if (v28)
    {
      v31 = CGPathGetCurrentPoint(Mutable);
      v30 = v31.x;
      v29 = v31.y;
    }
    if ((int)v11 <= 96)
    {
      switch((int)v11)
      {
        case 'A':
          goto LABEL_26;
        case 'B':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'I':
        case 'J':
        case 'K':
        case 'N':
        case 'O':
        case 'P':
        case 'R':
        case 'U':
          goto LABEL_100;
        case 'C':
          goto LABEL_34;
        case 'H':
          goto LABEL_41;
        case 'L':
          goto LABEL_42;
        case 'M':
          goto LABEL_48;
        case 'Q':
          goto LABEL_50;
        case 'S':
          goto LABEL_55;
        case 'T':
          goto LABEL_66;
        case 'V':
          goto LABEL_76;
        default:
          if ((_DWORD)v11 != 90)
            goto LABEL_100;
          goto LABEL_80;
      }
    }
    switch((int)v11)
    {
      case 'a':
LABEL_26:
        *(_QWORD *)buf = 0;
        v69.x = 0.0;
        v68.x = 0.0;
        v72 = 0;
        v73 = 0;
        v70 = 0.0;
        v71 = 0.0;
        v32 = objc_msgSend(v6, "crl_scanCGFloat:", buf);
        if (v32)
        {
          v32 = objc_msgSend(v6, "crl_scanCGFloat:", &v69);
          if (v32)
          {
            v32 = objc_msgSend(v6, "crl_scanCGFloat:", &v68);
            if (v32)
            {
              v32 = objc_msgSend(v6, "scanInteger:", &v73);
              if (v32)
              {
                v32 = objc_msgSend(v6, "scanInteger:", &v72);
                if (v32)
                {
                  v32 = objc_msgSend(v6, "crl_scanCGFloat:", &v71);
                  if (v32)
                    v32 = objc_msgSend(v6, "crl_scanCGFloat:", &v70);
                }
              }
            }
          }
        }
        v9 = v32 ^ 1;
        v70 = v29 + v70;
        v71 = v30 + v71;
        v33 = sub_1000C7FE8(v73 != 0, v72 != 0, v25, v24, *(double *)buf, v69.x, v68.x, v71, v70);
        v34 = sub_100313990(v33);
        v35 = sub_1000C8308(Mutable, v33, 1, v34);
        CGPathRelease(v33);
        CGPathRelease(Mutable);
        Mutable = CGPathCreateMutableCopy(v35);
        CGPathRelease(v35);
        goto LABEL_94;
      case 'b':
      case 'd':
      case 'e':
      case 'f':
      case 'g':
      case 'i':
      case 'j':
      case 'k':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
      case 'u':
        goto LABEL_100;
      case 'c':
LABEL_34:
        *(CGPoint *)buf = v67;
        v68 = v67;
        v69 = v67;
        v36 = objc_msgSend(v6, "crl_scanCGFloat:", buf);
        if (v36)
        {
          v36 = objc_msgSend(v6, "crl_scanCGFloat:", &buf[8]);
          if (v36)
          {
            v36 = objc_msgSend(v6, "crl_scanCGFloat:", &v69);
            if (v36)
            {
              v36 = objc_msgSend(v6, "crl_scanCGFloat:", &v69.y);
              if (v36)
              {
                v36 = objc_msgSend(v6, "crl_scanCGFloat:", &v68);
                if (v36)
                  v36 = objc_msgSend(v6, "crl_scanCGFloat:", &v68.y);
              }
            }
          }
        }
        v9 = v36 ^ 1;
        *(double *)buf = v30 + *(double *)buf;
        *(double *)&buf[8] = v29 + *(double *)&buf[8];
        v69.x = v30 + v69.x;
        v69.y = v29 + v69.y;
        v68.x = v30 + v68.x;
        v68.y = v29 + v68.y;
        CGPathAddCurveToPoint(Mutable, 0, *(CGFloat *)buf, *(CGFloat *)&buf[8], v69.x, v69.y, v68.x, v68.y);
        v65 = v69.y;
        x = v69.x;
        goto LABEL_94;
      case 'h':
LABEL_41:
        v9 = objc_msgSend(v6, "crl_scanCGFloat:", y) ^ 1;
        v37 = v30 + y[0];
        v38 = Mutable;
        v39 = v24;
        goto LABEL_84;
      case 'l':
LABEL_42:
        v40 = objc_msgSend(v6, "crl_scanCGFloat:", y);
        if (v40)
          v40 = objc_msgSend(v6, "crl_scanCGFloat:", &y[1]);
        v9 = v40 ^ 1;
        if ((v28 & 1) != 0)
        {
          if (y[0] == CGPointZero.x && y[1] == v18)
            goto LABEL_94;
        }
        else if (y[0] == v25 && y[1] == v24)
        {
          goto LABEL_94;
        }
        v37 = v30 + y[0];
        v39 = v29 + y[1];
        v38 = Mutable;
LABEL_84:
        CGPathAddLineToPoint(v38, 0, v37, v39);
        goto LABEL_94;
      case 'm':
LABEL_48:
        if (objc_msgSend(v6, "crl_scanCGFloat:", y))
          v41 = objc_msgSend(v6, "crl_scanCGFloat:", &y[1]);
        else
          v41 = 0;
        v49 = sub_100313990(Mutable);
        v50 = y[0];
        if (v49 < 1)
        {
          v51 = y[1];
        }
        else
        {
          v50 = v30 + y[0];
          v51 = v29 + y[1];
        }
        CGPathMoveToPoint(Mutable, 0, v50, v51);
        if (objc_msgSend(v6, "crl_scanCGFloat:", y))
        {
          do
          {
            v41 = objc_msgSend(v6, "crl_scanCGFloat:", &y[1]);
            if (v28)
            {
              v52 = CGPathGetCurrentPoint(Mutable);
              v30 = v52.x;
              v29 = v52.y;
            }
            CGPathAddLineToPoint(Mutable, 0, v30 + y[0], v29 + y[1]);
          }
          while ((objc_msgSend(v6, "crl_scanCGFloat:", y) & 1) != 0);
        }
        v9 = v41 ^ 1;
        goto LABEL_94;
      case 'q':
LABEL_50:
        *(CGPoint *)buf = v67;
        v69 = v67;
        v42 = objc_msgSend(v6, "crl_scanCGFloat:", buf);
        if (v42)
        {
          v42 = objc_msgSend(v6, "crl_scanCGFloat:", &buf[8]);
          if (v42)
          {
            v42 = objc_msgSend(v6, "crl_scanCGFloat:", &v69);
            if (v42)
              v42 = objc_msgSend(v6, "crl_scanCGFloat:", &v69.y);
          }
        }
        v9 = v42 ^ 1;
        *(double *)buf = v30 + *(double *)buf;
        *(double *)&buf[8] = v29 + *(double *)&buf[8];
        v69.x = v30 + v69.x;
        v69.y = v29 + v69.y;
        CGPathAddQuadCurveToPoint(Mutable, 0, *(CGFloat *)buf, *(CGFloat *)&buf[8], v69.x, v69.y);
        v19 = *(double *)buf;
        v20 = *(double *)&buf[8];
        goto LABEL_94;
      case 's':
LABEL_55:
        v63 = v20;
        v64 = v19;
        v43 = (unsigned __int16)(v17 - 67) >> 4;
        if (v43 & 0xFFFC | (unsigned __int16)((v17 - 67) << 12))
          v44 = -0.0;
        else
          v44 = v25 - x;
        if (v43 & 0xFFFC | (unsigned __int16)((v17 - 67) << 12))
          v45 = -0.0;
        else
          v45 = v24 - v65;
        *(CGPoint *)buf = v67;
        v69 = v67;
        v46 = objc_msgSend(v6, "crl_scanCGFloat:", buf);
        if (v46)
        {
          v46 = objc_msgSend(v6, "crl_scanCGFloat:", &buf[8]);
          if (v46)
          {
            v46 = objc_msgSend(v6, "crl_scanCGFloat:", &v69);
            if (v46)
              v46 = objc_msgSend(v6, "crl_scanCGFloat:", &v69.y);
          }
        }
        v9 = v46 ^ 1;
        *(double *)buf = v30 + *(double *)buf;
        *(double *)&buf[8] = v29 + *(double *)&buf[8];
        v69.x = v30 + v69.x;
        v69.y = v29 + v69.y;
        CGPathAddCurveToPoint(Mutable, 0, v25 + v44, v24 + v45, *(CGFloat *)buf, *(CGFloat *)&buf[8], v69.x, v69.y);
        v65 = *(double *)&buf[8];
        x = *(double *)buf;
        v20 = v63;
        v19 = v64;
        goto LABEL_94;
      case 't':
LABEL_66:
        if (v17 - 81 > 0x23)
        {
          v19 = v25;
          v20 = v24;
        }
        else
        {
          v47 = 1 << (v17 - 81);
          if ((v47 & 0x900000009) != 0)
            v19 = v25 + v25 - v19;
          else
            v19 = v25;
          if ((v47 & 0x900000009) != 0)
            v20 = v24 + v24 - v20;
          else
            v20 = v24;
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        v48 = objc_msgSend(v6, "crl_scanCGFloat:", buf);
        if (v48)
          v48 = objc_msgSend(v6, "crl_scanCGFloat:", &buf[8]);
        v9 = v48 ^ 1;
        *(double *)buf = v30 + *(double *)buf;
        *(double *)&buf[8] = v29 + *(double *)&buf[8];
        CGPathAddQuadCurveToPoint(Mutable, 0, v19, v20, *(CGFloat *)buf, *(CGFloat *)&buf[8]);
        goto LABEL_94;
      case 'v':
LABEL_76:
        v9 = objc_msgSend(v6, "crl_scanCGFloat:", &y[1]) ^ 1;
        v39 = v29 + y[1];
        v38 = Mutable;
        v37 = v25;
        goto LABEL_84;
      default:
        if ((_DWORD)v11 == 122)
        {
LABEL_80:
          CGPathCloseSubpath(Mutable);
          v9 = 0;
LABEL_94:
          if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
            goto LABEL_3;
          v17 = (unsigned __int16)v11;
          if (v9)
            goto LABEL_3;
          continue;
        }
LABEL_100:
        v54 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125EAF0);
        v55 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v54;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = "+[CRLSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:]";
          v77 = 2082;
          v78 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m";
          v79 = 1024;
          v80 = 570;
          v81 = 2112;
          v82 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Cannot process path of type %@", buf, 0x2Cu);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125EB10);
        v56 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v59 = v56;
          v60 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v54;
          *(_WORD *)&buf[8] = 2114;
          *(_QWORD *)&buf[10] = v60;
          _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:]"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v57, v58, 570, 0, "Cannot process path of type %@", v10);

        objc_msgSend(v6, "isAtEnd");
        v9 = 1;
LABEL_3:
        if (v61 && (v11 | 0x20) != 0x7A)
        {
          MutableCopy = CGPathCreateMutableCopy(Mutable);
          CGPathRelease(Mutable);
          CGPathCloseSubpath(MutableCopy);
          Mutable = MutableCopy;
          if (v9)
          {
LABEL_6:
            v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125EB30);
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100E356B4(v12);
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125EB50);
            v13 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100E337F8(v13, v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:]"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 590, 0, "Bailing on operation %c", v11);

          }
        }
        else if (v9)
        {
          goto LABEL_6;
        }

        return Mutable;
    }
  }
}

+ (CGPath)newPathFromSVGPolylineString:(id)a3
{
  id v3;
  CGPath *Mutable;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  CGPoint v13;
  uint64_t v14;
  int v15;

  v3 = a3;
  Mutable = CGPathCreateMutable();
  v13 = CGPointZero;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v3));
  v14 = *(_QWORD *)asc_100EF023C;
  v15 = 2883717;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v14, 6));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", v6));
  objc_msgSend(v5, "setCharactersToBeSkipped:", v7);

  if (objc_msgSend(v5, "crl_scanCGFloat:", &v13)
    && (objc_msgSend(v5, "crl_scanCGFloat:", &v13.y) & 1) != 0)
  {
    CGPathMoveToPoint(Mutable, 0, v13.x, v13.y);
    if ((objc_msgSend(v5, "isAtEnd") & 1) == 0)
    {
      while (objc_msgSend(v5, "crl_scanCGFloat:", &v13)
           && (objc_msgSend(v5, "crl_scanCGFloat:", &v13.y) & 1) != 0)
      {
        CGPathAddLineToPoint(Mutable, 0, v13.x, v13.y);
        if (objc_msgSend(v5, "isAtEnd"))
          goto LABEL_18;
      }
      objc_msgSend(v5, "isAtEnd");
    }
LABEL_18:
    CGPathCloseSubpath(Mutable);
  }
  else
  {
    v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125EB70);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E35758();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125EB90);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E337F8(v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLSVGToBezierPathConverter newPathFromSVGPolylineString:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 607, 0, "No value for initial polyline point!");

  }
  return Mutable;
}

+ (CGPath)newPathFromSVGPolygonString:(id)a3
{
  CGPath *v3;
  CGPath *MutableCopy;

  v3 = +[CRLSVGToBezierPathConverter newPathFromSVGPolylineString:](CRLSVGToBezierPathConverter, "newPathFromSVGPolylineString:", a3);
  MutableCopy = CGPathCreateMutableCopy(v3);
  CGPathRelease(v3);
  CGPathCloseSubpath(MutableCopy);
  return MutableCopy;
}

+ (CGAffineTransform)transformFromSVGTransformAttributeString:(SEL)a3
{
  id v5;
  void *v6;
  void *v7;
  __int128 v8;
  CFArrayRef (__cdecl **v9)(CTFontDescriptorRef, CFSetRef);
  CGFloat tx;
  CGFloat ty;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  double a;
  void *v26;
  float v27;
  double v28;
  void *v29;
  float v30;
  double v31;
  void *v32;
  float v33;
  double v34;
  void *v35;
  float v36;
  double v37;
  CGAffineTransform *v38;
  void *v39;
  float v40;
  double v41;
  void *v42;
  unint64_t v43;
  unsigned __int8 v44;
  double v45;
  void *v46;
  unsigned int v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  float v54;
  CGFloat v55;
  float v56;
  char *v57;
  unsigned int v58;
  NSObject *v59;
  void *v60;
  void *v61;
  float v62;
  double v63;
  void *v64;
  uint64_t v65;
  float v66;
  float v67;
  void *v68;
  float v69;
  __int128 v70;
  unsigned int v71;
  NSObject *v72;
  void *v73;
  unsigned int v74;
  NSObject *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  id v83;
  CGAffineTransform *result;
  id v85;
  void *v86;
  id obj;
  CGFloat d;
  CGFloat c;
  CGFloat b;
  uint64_t v91;
  id v92;
  void *v93;
  char *v94;
  void *v95;
  CGAffineTransform t2;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id v101;
  CGAffineTransform buf;
  uint64_t v103;
  int v104;
  _BYTE v105[128];

  v5 = a4;
  v101 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("(matrix|translate|scale|rotate)\\((.*?)\\)"), 1, &v101));
  v85 = v101;
  v86 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length")));
  v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v7;
  v92 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
  if (v92)
  {
    v9 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    b = CGAffineTransformIdentity.b;
    tx = CGAffineTransformIdentity.tx;
    d = CGAffineTransformIdentity.d;
    c = CGAffineTransformIdentity.c;
    ty = CGAffineTransformIdentity.ty;
    v91 = *(_QWORD *)v98;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v98 != v91)
          objc_enumerationMutation(obj);
        v94 = (char *)v12;
        v13 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)v12);
        v14 = objc_msgSend(v13, "rangeAtIndex:", 1);
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v14, v15));
        v16 = objc_msgSend(v13, "rangeAtIndex:", 2);
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v16, v17));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:"));
        v103 = *(_QWORD *)asc_100EF023C;
        v104 = 2883717;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithCharacters:length:", &v103, 6));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", v19));
        objc_msgSend(v18, "setCharactersToBeSkipped:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        if ((objc_msgSend(v18, "isAtEnd") & 1) == 0)
        {
          v43 = 1;
          do
          {
            t2.a = 0.0;
            v44 = objc_msgSend(v18, "crl_scanCGFloat:", &t2);
            HIDWORD(v45) = HIDWORD(t2.a);
            *(float *)&v45 = t2.a;
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v45));
            objc_msgSend(v21, "addObject:", v46);
            if (v43 >= 7)
            {
              v47 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10125EBB0);
              v48 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf.a) = 67110146;
                HIDWORD(buf.a) = v47;
                LOWORD(buf.b) = 2082;
                *(_QWORD *)((char *)&buf.b + 2) = "+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]";
                WORD1(buf.c) = 2082;
                *(_QWORD *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVG"
                                                  "ToBezierPathConverter.m";
                WORD2(buf.d) = 1024;
                *(_DWORD *)((char *)&buf.d + 6) = 676;
                WORD1(buf.tx) = 2112;
                *(_QWORD *)((char *)&buf.tx + 4) = v5;
                _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Too many numbers for transform %@", (uint8_t *)&buf, 0x2Cu);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10125EBD0);
              v49 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                v52 = v49;
                v53 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                LODWORD(buf.a) = 67109378;
                HIDWORD(buf.a) = v47;
                LOWORD(buf.b) = 2114;
                *(_QWORD *)((char *)&buf.b + 2) = v53;
                _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);

              }
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v51, 676, 0, "Too many numbers for transform %@", v5);

              v44 = 0;
            }

            if (objc_msgSend(v18, "isAtEnd"))
              break;
            ++v43;
          }
          while ((v44 & 1) != 0);
        }
        v22 = v95;
        if (objc_msgSend(v95, "isEqualToString:", CFSTR("matrix")))
        {
          if (objc_msgSend(v21, "count") != (id)6)
          {
            v58 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125EBF0);
            v57 = v94;
            v59 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf.a) = 67110146;
              HIDWORD(buf.a) = v58;
              LOWORD(buf.b) = 2082;
              *(_QWORD *)((char *)&buf.b + 2) = "+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]";
              WORD1(buf.c) = 2082;
              *(_QWORD *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGTo"
                                                "BezierPathConverter.m";
              WORD2(buf.d) = 1024;
              *(_DWORD *)((char *)&buf.d + 6) = 694;
              WORD1(buf.tx) = 2112;
              *(_QWORD *)((char *)&buf.tx + 4) = v5;
              _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Not enough numbers for matrix transform! %@", (uint8_t *)&buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125EC10);
            v60 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v77 = v60;
              v78 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              LODWORD(buf.a) = 67109378;
              HIDWORD(buf.a) = v58;
              LOWORD(buf.b) = 2114;
              *(_QWORD *)((char *)&buf.b + 2) = v78;
              _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);

            }
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v42, v61, 694, 0, "Not enough numbers for matrix transform! %@", v5);
LABEL_38:

            v41 = ty;
            v37 = tx;
            v34 = d;
            v31 = c;
            v28 = b;
            a = CGAffineTransformIdentity.a;
            goto LABEL_47;
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));
          objc_msgSend(v23, "floatValue");
          a = v24;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 1));
          objc_msgSend(v26, "floatValue");
          v28 = v27;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 2));
          objc_msgSend(v29, "floatValue");
          v31 = v30;
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 3));
          objc_msgSend(v32, "floatValue");
          v34 = v33;
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 4));
          objc_msgSend(v35, "floatValue");
          v37 = v36;
          v38 = retstr;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 5));
          objc_msgSend(v39, "floatValue");
          v41 = v40;

          retstr = v38;
          v22 = v95;

          v42 = v23;
          v9 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
          goto LABEL_27;
        }
        if (!objc_msgSend(v95, "isEqualToString:", CFSTR("translate")))
        {
          v41 = ty;
          v37 = tx;
          v34 = d;
          v31 = c;
          v28 = b;
          a = CGAffineTransformIdentity.a;
          v57 = v94;
          if (!objc_msgSend(v95, "isEqualToString:", CFSTR("scale")))
            goto LABEL_48;
          if (objc_msgSend(v21, "count") == (id)2)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));
            objc_msgSend(v42, "floatValue");
            v63 = v62;
            v64 = v21;
            v65 = 1;
LABEL_46:
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectAtIndexedSubscript:", v65));
            objc_msgSend(v68, "floatValue");
            CGAffineTransformMakeScale(&buf, v63, v69);
            a = buf.a;
            v28 = buf.b;
            v31 = buf.c;
            v34 = buf.d;
            v37 = buf.tx;
            v41 = buf.ty;

            goto LABEL_47;
          }
          if (objc_msgSend(v21, "count") == (id)1)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));
            objc_msgSend(v42, "floatValue");
            v63 = v67;
            v64 = v21;
            v65 = 0;
            goto LABEL_46;
          }
          v74 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125EC70);
          v75 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf.a) = 67110146;
            HIDWORD(buf.a) = v74;
            LOWORD(buf.b) = 2082;
            *(_QWORD *)((char *)&buf.b + 2) = "+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]";
            WORD1(buf.c) = 2082;
            *(_QWORD *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBe"
                                              "zierPathConverter.m";
            WORD2(buf.d) = 1024;
            *(_DWORD *)((char *)&buf.d + 6) = 715;
            WORD1(buf.tx) = 2112;
            *(_QWORD *)((char *)&buf.tx + 4) = v5;
            _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Wrong number of numbers for scale transform! %@", (uint8_t *)&buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125EC90);
          v76 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v81 = v76;
            v82 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            LODWORD(buf.a) = 67109378;
            HIDWORD(buf.a) = v74;
            LOWORD(buf.b) = 2114;
            *(_QWORD *)((char *)&buf.b + 2) = v82;
            _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);

          }
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v42, v61, 715, 0, "Wrong number of numbers for scale transform! %@", v5);
          goto LABEL_38;
        }
        if (objc_msgSend(v21, "count") == (id)2)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));
          objc_msgSend(v42, "floatValue");
          v55 = v54;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 1));
          objc_msgSend(v26, "floatValue");
          CGAffineTransformMakeTranslation(&buf, v55, v56);
          a = buf.a;
          v28 = buf.b;
          v31 = buf.c;
          v34 = buf.d;
          v37 = buf.tx;
          v41 = buf.ty;
LABEL_27:

          goto LABEL_28;
        }
        if (objc_msgSend(v21, "count") != (id)1)
        {
          v71 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          v57 = v94;
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125EC30);
          v72 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf.a) = 67110146;
            HIDWORD(buf.a) = v71;
            LOWORD(buf.b) = 2082;
            *(_QWORD *)((char *)&buf.b + 2) = "+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]";
            WORD1(buf.c) = 2082;
            *(_QWORD *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBe"
                                              "zierPathConverter.m";
            WORD2(buf.d) = 1024;
            *(_DWORD *)((char *)&buf.d + 6) = 705;
            WORD1(buf.tx) = 2112;
            *(_QWORD *)((char *)&buf.tx + 4) = v5;
            _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Wrong number of numbers for translate transform! %@", (uint8_t *)&buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125EC50);
          v73 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v79 = v73;
            v80 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            LODWORD(buf.a) = 67109378;
            HIDWORD(buf.a) = v71;
            LOWORD(buf.b) = 2114;
            *(_QWORD *)((char *)&buf.b + 2) = v80;
            _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);

          }
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "+[CRLSVGToBezierPathConverter transformFromSVGTransformAttributeString:]"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSVGToBezierPathConverter.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v42, v61, 705, 0, "Wrong number of numbers for translate transform! %@", v5);
          goto LABEL_38;
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));
        objc_msgSend(v42, "floatValue");
        CGAffineTransformMakeTranslation(&buf, v66, 0.0);
        a = buf.a;
        v28 = buf.b;
        v31 = buf.c;
        v34 = buf.d;
        v37 = buf.tx;
        v41 = buf.ty;
LABEL_28:
        v57 = v94;
LABEL_47:

LABEL_48:
        v70 = *(_OWORD *)&retstr->c;
        *(_OWORD *)&buf.a = *(_OWORD *)&retstr->a;
        *(_OWORD *)&buf.c = v70;
        *(_OWORD *)&buf.tx = *(_OWORD *)&retstr->tx;
        t2.a = a;
        t2.b = v28;
        t2.c = v31;
        t2.d = v34;
        t2.tx = v37;
        t2.ty = v41;
        CGAffineTransformConcat(retstr, &buf, &t2);

        v12 = v57 + 1;
      }
      while (v12 != v92);
      v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
      v92 = v83;
    }
    while (v83);
  }

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHiddenOnTag, 0);
  objc_storeStrong((id *)&self->mFileBezierPath, 0);
}

@end
