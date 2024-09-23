@implementation TSDSVGToBezierPathConverter

- (id)bezierPathFromSVGData:(id)a3
{
  id v4;
  TSDBezierPath *v5;
  TSDBezierPath *mFileBezierPath;
  NSString *mHiddenOnTag;
  _OWORD *v8;
  __int128 v9;
  CGSize v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TSDBezierPath *v16;
  TSDBezierPath *v17;
  TSDBezierPath *v18;
  const CGPath *v20;
  void *v21;
  void *v22;
  TSDBezierPath *v23;
  TSDBezierPath *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(TSDBezierPath);
  mFileBezierPath = self->mFileBezierPath;
  self->mFileBezierPath = v5;

  mHiddenOnTag = self->mHiddenOnTag;
  self->mHiddenOnTag = 0;

  v8 = (_OWORD *)MEMORY[0x24BDBD8B8];
  self->mHiddenOnTagNestedCount = 0;
  v9 = v8[1];
  *(_OWORD *)&self->mGroupedAffineTransform.a = *v8;
  *(_OWORD *)&self->mGroupedAffineTransform.c = v9;
  *(_OWORD *)&self->mGroupedAffineTransform.tx = v8[2];
  self->mGroupedAffineTransformNestedCount = 0;
  self->mViewBoxFound = 0;
  v10 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->mViewBox.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->mViewBox.size = v10;
  self->mUsesEvenOdd = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1978]), "initWithData:", v4);

  objc_msgSend(v11, "setDelegate:", self);
  if (objc_msgSend(v11, "parse")
    && (objc_msgSend(v11, "parserError"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    if (self->mViewBoxFound)
    {
      v20 = CGPathCreateWithRect(self->mViewBox, 0);
      +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      CGPathRelease(v20);
      v25[0] = self->mFileBezierPath;
      v25[1] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[TSDBezierPath intersectBezierPaths:](TSDBezierPath, "intersectBezierPaths:", v22);
      v23 = (TSDBezierPath *)objc_claimAutoreleasedReturnValue();

      v24 = self->mFileBezierPath;
      self->mFileBezierPath = v23;

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSVGToBezierPathConverter bezierPathFromSVGData:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 62, CFSTR("Unable to Parse SVG File"));

    v16 = objc_alloc_init(TSDBezierPath);
    v17 = self->mFileBezierPath;
    self->mFileBezierPath = v16;

  }
  v18 = self->mFileBezierPath;

  return v18;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  CGFloat v45;
  void *v46;
  double v47;
  CGFloat v48;
  void *v49;
  double v50;
  CGFloat v51;
  void *v52;
  CGFloat v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  NSString *v61;
  NSString *mHiddenOnTag;
  int v63;
  _OWORD *v64;
  __int128 v65;
  __int128 v66;
  void *v67;
  void *v68;
  __int128 v69;
  int v70;
  void *v71;
  CGPath *v72;
  CGPath *Mutable;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  float v79;
  uint64_t v80;
  id v81;
  TSDSVGToBezierPathConverter *v82;
  uint64_t v83;
  void *v84;
  float v85;
  void *v86;
  __int128 v87;
  void *v88;
  void *v89;
  __int128 v90;
  uint64_t v91;
  void *v92;
  TSDBezierPath **p_mFileBezierPath;
  TSDBezierPath *mFileBezierPath;
  void *v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  float v104;
  CGFloat v105;
  void *v106;
  float v107;
  void *v108;
  float v109;
  CGFloat v110;
  void *v111;
  float v112;
  void *v113;
  void *v114;
  void *v115;
  float v116;
  CGFloat v117;
  void *v118;
  float v119;
  double v120;
  double v121;
  CGFloat v122;
  double v123;
  CGFloat v124;
  double v125;
  CGFloat v126;
  void *v127;
  float v128;
  CGPath *v129;
  void *v130;
  float v131;
  double v132;
  void *v133;
  float v134;
  double v135;
  void *v136;
  float v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  void *v143;
  id v144;
  TSDSVGToBezierPathConverter *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  float v151;
  double v152;
  void *v153;
  float v154;
  double v155;
  void *v156;
  float v157;
  double v158;
  void *v159;
  float v160;
  double v161;
  void *v162;
  void *v163;
  TSDSVGToBezierPathConverter *v164;
  void *v165;
  id v166;
  id v167;
  void *v168;
  CGAffineTransform v169;
  CGAffineTransform v170;
  CGAffineTransform t2;
  CGAffineTransform t1;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _QWORD v178[2];
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a7;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("style"));
  v11 = objc_claimAutoreleasedReturnValue();
  v168 = (void *)v11;
  if (v11)
  {
    v12 = (void *)v11;
    v164 = self;
    v166 = v9;
    v163 = v10;
    v10 = (id)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(";"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v177 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v174, v179, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v175;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v175 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * i);
          if (objc_msgSend(v18, "length"))
          {
            v19 = v10;
            objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(":"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "count") != 2)
            {
              objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, v23, 90, CFSTR("Style components in SVG <style> tag should have one key and one value."));

            }
            objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringByTrimmingCharactersInSet:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v24);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = v19;
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, v26);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v174, v179, 16);
      }
      while (v15);
    }

    self = v164;
    v9 = v166;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("svg")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("preserveAspectRatio"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "componentsSeparatedByCharactersInSet:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v31, "count"))
    {
LABEL_26:
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("viewBox"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsSeparatedByCharactersInSet:", v42);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v37, "count") == 4)
      {
        self->mViewBoxFound = 1;
        objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "doubleValue");
        v45 = v44;
        objc_msgSend(v37, "objectAtIndexedSubscript:", 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "doubleValue");
        v48 = v47;
        objc_msgSend(v37, "objectAtIndexedSubscript:", 2);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "doubleValue");
        v51 = v50;
        objc_msgSend(v37, "objectAtIndexedSubscript:", 3);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "doubleValue");
        self->mViewBox.origin.x = v45;
        self->mViewBox.origin.y = v48;
        self->mViewBox.size.width = v51;
        self->mViewBox.size.height = v53;

      }
      else
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v46, v49, 132, CFSTR("Unexpected number of viewBox components! (%zu)"), objc_msgSend(v37, "count"));
      }

      goto LABEL_30;
    }
    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("defer"));

    if (v33)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, v36, 111, CFSTR("Unexpected 'defer' component"));

    }
    if (objc_msgSend(v31, "count") == 1)
      goto LABEL_31;
    if (objc_msgSend(v31, "count") == 2)
    {
      objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v37, "isEqualToString:", CFSTR("meet")) & 1) != 0)
      {
LABEL_30:

LABEL_31:
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("style"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          v173 = 0;
          objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("fill-rule:[ \t]*evenodd"), 1, &v173);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v173;
          objc_msgSend(v55, "matchesInString:options:range:", v54, 0, 0, objc_msgSend(v54, "length"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v57, "count"))
            self->mUsesEvenOdd = 1;

        }
        goto LABEL_36;
      }
      if ((objc_msgSend(v37, "isEqualToString:", CFSTR("slice")) & 1) != 0)
        goto LABEL_25;
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, v40, 119, CFSTR("Unknown component %@"), v37);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, v39, 122, CFSTR("Unexpected number of preserveAspectRatio components! (%zu)"), objc_msgSend(v31, "count"));
    }

LABEL_25:
    goto LABEL_26;
  }
LABEL_36:
  v58 = v168;
  if (-[NSString isEqualToString:](self->mHiddenOnTag, "isEqualToString:", v9))
    ++self->mHiddenOnTagNestedCount;
  if (!self->mHiddenOnTag)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("display"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v59, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {

LABEL_42:
      v61 = (NSString *)objc_msgSend(v9, "copy");
      mHiddenOnTag = self->mHiddenOnTag;
      self->mHiddenOnTag = v61;

      goto LABEL_82;
    }
    v60 = objc_msgSend(v9, "isEqualToString:", CFSTR("pattern"));

    if ((v60 & 1) != 0)
      goto LABEL_42;
    v63 = objc_msgSend(v9, "isEqualToString:", CFSTR("g"));
    v64 = (_OWORD *)MEMORY[0x24BDBD8B8];
    if (v63)
    {
      v65 = *(_OWORD *)&self->mGroupedAffineTransform.c;
      *(_OWORD *)&t1.a = *(_OWORD *)&self->mGroupedAffineTransform.a;
      *(_OWORD *)&t1.c = v65;
      *(_OWORD *)&t1.tx = *(_OWORD *)&self->mGroupedAffineTransform.tx;
      v66 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&t2.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&t2.c = v66;
      *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      if (CGAffineTransformEqualToTransform(&t1, &t2))
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("transform"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (v67)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("transform"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          +[TSDSVGToBezierPathConverter transformFromSVGTransformAttributeString:](TSDSVGToBezierPathConverter, "transformFromSVGTransformAttributeString:", v68);
          v69 = *(_OWORD *)&t1.c;
          *(_OWORD *)&self->mGroupedAffineTransform.a = *(_OWORD *)&t1.a;
          *(_OWORD *)&self->mGroupedAffineTransform.c = v69;
          *(_OWORD *)&self->mGroupedAffineTransform.tx = *(_OWORD *)&t1.tx;

        }
      }
      else
      {
        ++self->mGroupedAffineTransformNestedCount;
      }
    }
    v70 = objc_msgSend(v9, "isEqualToString:", CFSTR("line"));
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("path")))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("d"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = +[TSDSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:](TSDSVGToBezierPathConverter, "newPathFromSVGPathString:shouldClosePathAtEnd:", v71, v70 ^ 1u);
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("polyline")))
      {
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("polygon")) & 1) != 0)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("points"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          Mutable = +[TSDSVGToBezierPathConverter newPathFromSVGPolygonString:](TSDSVGToBezierPathConverter, "newPathFromSVGPolygonString:", v102);

          if (!v70)
            goto LABEL_69;
        }
        else
        {
          if (!v70)
          {
            if (objc_msgSend(v9, "isEqualToString:", CFSTR("rect")))
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("width"));
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "floatValue");
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("height"));
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v114, "floatValue");

              memset(&t1, 0, sizeof(t1));
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("x"));
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "floatValue");
              v117 = v116;
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("y"));
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "floatValue");
              CGAffineTransformMakeTranslation(&t1, v117, v119);

              v120 = TSDRectWithSize();
              v122 = v121;
              v124 = v123;
              v126 = v125;
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rx"));
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "floatValue");
              v129 = TSDCreateRoundRectPathForRectWithRadius(v120, v122, v124, v126, v128);

              Mutable = (CGPath *)MEMORY[0x219A1465C](v129, &t1);
              CGPathRelease(v129);
              goto LABEL_69;
            }
            if (objc_msgSend(v9, "isEqualToString:", CFSTR("circle")))
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("r"));
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "floatValue");
              v132 = v131;

              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cx"));
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v133, "floatValue");
              v135 = v134 - v132;

              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cy"));
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v136, "floatValue");
              v138 = v137 - v132;

              v139 = v132 + v132;
              v140 = v135;
              v141 = v138;
              v142 = v132 + v132;
            }
            else
            {
              if (!objc_msgSend(v9, "isEqualToString:", CFSTR("ellipse")))
              {
                Mutable = CGPathCreateMutable();
                goto LABEL_69;
              }
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rx"));
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v150, "floatValue");
              v152 = v151;

              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ry"));
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v153, "floatValue");
              v155 = v154;

              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cx"));
              v156 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v156, "floatValue");
              v158 = v157 - v152;

              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cy"));
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v159, "floatValue");
              v161 = v160 - v155;

              v139 = v152 + v152;
              v142 = v155 + v155;
              v140 = v158;
              v141 = v161;
            }
            +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", v140, v141, v139, v142);
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            Mutable = (CGPath *)objc_msgSend(v162, "CGPath");

            CGPathRetain(Mutable);
            goto LABEL_69;
          }
          Mutable = CGPathCreateMutable();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("x1"));
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "floatValue");
          v105 = v104;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("y1"));
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "floatValue");
          CGPathMoveToPoint(Mutable, 0, v105, v107);

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("x2"));
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "floatValue");
          v110 = v109;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("y2"));
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "floatValue");
          CGPathAddLineToPoint(Mutable, 0, v110, v112);

        }
LABEL_53:
        v167 = v9;
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("stroke-width"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("stroke-linecap"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("stroke-linejoin"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("stroke-miterlimit"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = 1.0;
        if (v74 && (objc_msgSend(v74, "isEqualToString:", &stru_24D82FEB0) & 1) == 0)
        {
          objc_msgSend(v74, "floatValue");
          v78 = v79;
        }
        if (v75
          && (objc_msgSend(v75, "isEqualToString:", &stru_24D82FEB0) & 1) == 0
          && (objc_msgSend(v75, "isEqualToString:", CFSTR("butt")) & 1) == 0)
        {
          if ((objc_msgSend(v75, "isEqualToString:", CFSTR("round")) & 1) != 0)
          {
            v80 = 1;
            goto LABEL_60;
          }
          if ((objc_msgSend(v75, "isEqualToString:", CFSTR("square")) & 1) != 0)
          {
            v80 = 2;
            goto LABEL_60;
          }
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = v10;
          v145 = self;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "handleFailureInFunction:file:lineNumber:description:", v146, v147, 242, CFSTR("Unexpected Line Cap Style: %@"), v75);

          self = v145;
          v10 = v144;

        }
        v80 = 0;
LABEL_60:
        if (!v76
          || (objc_msgSend(v76, "isEqualToString:", &stru_24D82FEB0) & 1) != 0
          || (objc_msgSend(v76, "isEqualToString:", CFSTR("miter")) & 1) != 0)
        {
          v81 = v10;
          v82 = self;
LABEL_64:
          v83 = 0;
          goto LABEL_65;
        }
        v81 = v10;
        v82 = self;
        if ((objc_msgSend(v75, "isEqualToString:", CFSTR("round")) & 1) != 0)
        {
          v83 = 1;
        }
        else
        {
          if ((objc_msgSend(v75, "isEqualToString:", CFSTR("bevel")) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSVGToBezierPathConverter parser:didStartElement:namespaceURI:qualifiedName:attributes:]");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v165, "handleFailureInFunction:file:lineNumber:description:", v148, v149, 254, CFSTR("Unexpected Line Join Style: %@"), v76);

            goto LABEL_64;
          }
          v83 = 2;
        }
LABEL_65:
        +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", Mutable);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setLineWidth:", v78);
        objc_msgSend(v84, "setLineCapStyle:", v80);
        objc_msgSend(v84, "setLineJoinStyle:", v83);
        if (v77 && (objc_msgSend(v77, "isEqualToString:", &stru_24D82FEB0) & 1) == 0)
        {
          objc_msgSend(v77, "floatValue");
          objc_msgSend(v84, "setMiterLimit:", v85);
        }
        objc_msgSend(v84, "outlineStroke");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        Mutable = (CGPath *)objc_msgSend(v86, "CGPath");

        CGPathRetain(Mutable);
        v9 = v167;
        v58 = v168;
        self = v82;
        v10 = v81;
        v64 = (_OWORD *)MEMORY[0x24BDBD8B8];
LABEL_69:
        v87 = *(_OWORD *)&self->mGroupedAffineTransform.c;
        *(_OWORD *)&t1.a = *(_OWORD *)&self->mGroupedAffineTransform.a;
        *(_OWORD *)&t1.c = v87;
        *(_OWORD *)&t1.tx = *(_OWORD *)&self->mGroupedAffineTransform.tx;
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("transform"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        if (v88)
        {
          memset(&t2, 0, sizeof(t2));
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("transform"));
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          +[TSDSVGToBezierPathConverter transformFromSVGTransformAttributeString:](TSDSVGToBezierPathConverter, "transformFromSVGTransformAttributeString:", v89);

          v170 = t1;
          v169 = t2;
          CGAffineTransformConcat(&t1, &v170, &v169);
        }
        t2 = t1;
        v90 = v64[1];
        *(_OWORD *)&v170.a = *v64;
        *(_OWORD *)&v170.c = v90;
        *(_OWORD *)&v170.tx = v64[2];
        if (!CGAffineTransformEqualToTransform(&t2, &v170))
        {
          v91 = MEMORY[0x219A1465C](Mutable, &t1);
          CGPathRelease(Mutable);
          Mutable = (CGPath *)v91;
        }
        +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", Mutable);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setWindingRule:", self->mUsesEvenOdd);
        CGPathRelease(Mutable);
        mFileBezierPath = self->mFileBezierPath;
        p_mFileBezierPath = &self->mFileBezierPath;
        v178[0] = mFileBezierPath;
        v178[1] = v92;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v178, 2);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        +[TSDBezierPath uniteBezierPaths:](TSDBezierPath, "uniteBezierPaths:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v96, "isEmpty") & 1) != 0)
        {
          if ((objc_msgSend(v92, "isEmpty") & 1) != 0)
            goto LABEL_81;
          objc_msgSend(v92, "controlPointBounds");
          if (v98 <= 1.0)
            goto LABEL_81;
          v99 = v92;
          if (v97 <= 1.0)
            goto LABEL_81;
        }
        else
        {
          objc_msgSend(v96, "controlPointBounds");
          if (v101 <= 1.0)
            goto LABEL_81;
          v99 = v96;
          if (v100 <= 1.0)
            goto LABEL_81;
        }
        objc_storeStrong((id *)p_mFileBezierPath, v99);
LABEL_81:

        goto LABEL_82;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("points"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = +[TSDSVGToBezierPathConverter newPathFromSVGPolylineString:](TSDSVGToBezierPathConverter, "newPathFromSVGPolylineString:", v71);
    }
    Mutable = v72;

    if ((v70 & 1) == 0)
      goto LABEL_69;
    goto LABEL_53;
  }
LABEL_82:

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
    v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v15 = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&t2.a = *MEMORY[0x24BDBD8B8];
    v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
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
  return +[TSDSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:](TSDSVGToBezierPathConverter, "newPathFromSVGPathString:shouldClosePathAtEnd:", a3, 0);
}

+ (CGPath)newPathFromSVGPathString:(id)a3 shouldClosePathAtEnd:(BOOL)a4
{
  id v4;
  const CGPath *Mutable;
  double *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int16 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  int v25;
  double v26;
  double x;
  CGPoint CurrentPoint;
  void *v29;
  int v30;
  double v31;
  double v32;
  CGPoint v33;
  int v34;
  CGPath *v35;
  uint64_t ElementCount;
  CGPath *v37;
  int v38;
  double v39;
  CGPath *v40;
  double v41;
  int v42;
  int v43;
  int v44;
  __int16 v45;
  double v46;
  double v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  double v52;
  double v53;
  CGPoint v54;
  CGPath *MutableCopy;
  void *v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CGFloat v68[3];
  double v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  CGFloat y[2];
  uint64_t v75;
  int v76;
  uint64_t v77;

  v59 = a4;
  v77 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  Mutable = CGPathCreateMutable();
  v6 = (double *)MEMORY[0x24BDBEFB0];
  v65 = *MEMORY[0x24BDBEFB0];
  *(_OWORD *)y = *MEMORY[0x24BDBEFB0];
  v60 = v4;
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = *(_QWORD *)asc_217C2A808;
  v76 = 2883717;
  v8 = (void *)MEMORY[0x24BDD14A8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v75, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "characterSetWithCharactersInString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCharactersToBeSkipped:", v10);

  if ((objc_msgSend(v7, "isAtEnd") & 1) == 0)
  {
    v18 = 0;
    v12 = 0;
    v19 = *v6;
    v20 = v6[1];
    v63 = v20;
    v64 = *v6;
    v21 = *v6;
    v22 = v20;
    while (1)
    {
      v23 = v12;
      objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v12;
      v25 = objc_msgSend(v7, "scanCharactersFromSet:intoString:", v24, &v73);
      v12 = v73;

      if (v25)
        objc_msgSend(v7, "setScanLocation:", objc_msgSend(v7, "scanLocation") - objc_msgSend(v12, "length") + 1);
      v13 = objc_msgSend(v12, "characterAtIndex:", 0);
      v26 = v20;
      x = v19;
      if (!CGPathIsEmpty(Mutable))
      {
        CurrentPoint = CGPathGetCurrentPoint(Mutable);
        x = CurrentPoint.x;
        v26 = CurrentPoint.y;
      }
      objc_msgSend(MEMORY[0x24BDD14A8], "lowercaseLetterCharacterSet");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "characterIsMember:", v13);

      v31 = v20;
      v32 = v19;
      if (v30)
      {
        v33 = CGPathGetCurrentPoint(Mutable);
        v32 = v33.x;
        v31 = v33.y;
      }
      if ((int)v13 <= 96)
      {
        switch((int)v13)
        {
          case 'A':
            goto LABEL_18;
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
            goto LABEL_92;
          case 'C':
            goto LABEL_26;
          case 'H':
            goto LABEL_33;
          case 'L':
            goto LABEL_34;
          case 'M':
            goto LABEL_40;
          case 'Q':
            goto LABEL_42;
          case 'S':
            goto LABEL_47;
          case 'T':
            goto LABEL_58;
          case 'V':
            goto LABEL_68;
          default:
            if ((_DWORD)v13 != 90)
              goto LABEL_92;
            goto LABEL_72;
        }
      }
      switch((int)v13)
      {
        case 'a':
LABEL_18:
          v68[0] = 0.0;
          *(_QWORD *)&v67 = 0;
          *(_QWORD *)&v66 = 0;
          v71 = 0;
          v72 = 0;
          v69 = 0.0;
          v70 = 0.0;
          v34 = objc_msgSend(v7, "tsu_scanCGFloat:", v68);
          if (v34)
          {
            v34 = objc_msgSend(v7, "tsu_scanCGFloat:", &v67);
            if (v34)
            {
              v34 = objc_msgSend(v7, "tsu_scanCGFloat:", &v66);
              if (v34)
              {
                v34 = objc_msgSend(v7, "scanInteger:", &v72);
                if (v34)
                {
                  v34 = objc_msgSend(v7, "scanInteger:", &v71);
                  if (v34)
                  {
                    v34 = objc_msgSend(v7, "tsu_scanCGFloat:", &v70);
                    if (v34)
                      v34 = objc_msgSend(v7, "tsu_scanCGFloat:", &v69);
                  }
                }
              }
            }
          }
          v11 = v34 ^ 1;
          v69 = v31 + v69;
          v70 = v32 + v70;
          v35 = TSDCreatePathByComputingArc(v72 != 0, v71 != 0, x, v26, v68[0], *(double *)&v67, *(long double *)&v66, v70, v69);
          ElementCount = TSDPathGetElementCount(v35);
          v37 = TSDCreatePathByAppendingPathFromElementToElement(Mutable, v35, 1, ElementCount);
          CGPathRelease(v35);
          CGPathRelease(Mutable);
          Mutable = CGPathCreateMutableCopy(v37);
          CGPathRelease(v37);
          goto LABEL_86;
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
          goto LABEL_92;
        case 'c':
LABEL_26:
          v67 = v65;
          *(_OWORD *)v68 = v65;
          v66 = v65;
          v38 = objc_msgSend(v7, "tsu_scanCGFloat:", v68);
          if (v38)
          {
            v38 = objc_msgSend(v7, "tsu_scanCGFloat:", &v68[1]);
            if (v38)
            {
              v38 = objc_msgSend(v7, "tsu_scanCGFloat:", &v67);
              if (v38)
              {
                v38 = objc_msgSend(v7, "tsu_scanCGFloat:", (char *)&v67 + 8);
                if (v38)
                {
                  v38 = objc_msgSend(v7, "tsu_scanCGFloat:", &v66);
                  if (v38)
                    v38 = objc_msgSend(v7, "tsu_scanCGFloat:", (char *)&v66 + 8);
                }
              }
            }
          }
          v11 = v38 ^ 1;
          v68[0] = v32 + v68[0];
          v68[1] = v31 + v68[1];
          *(double *)&v67 = v32 + *(double *)&v67;
          *((double *)&v67 + 1) = v31 + *((double *)&v67 + 1);
          *(double *)&v66 = v32 + *(double *)&v66;
          *((double *)&v66 + 1) = v31 + *((double *)&v66 + 1);
          CGPathAddCurveToPoint(Mutable, 0, v68[0], v68[1], *(CGFloat *)&v67, *((CGFloat *)&v67 + 1), *(CGFloat *)&v66, *((CGFloat *)&v66 + 1));
          v63 = *((double *)&v67 + 1);
          v64 = *(double *)&v67;
          goto LABEL_86;
        case 'h':
LABEL_33:
          v11 = objc_msgSend(v7, "tsu_scanCGFloat:", y) ^ 1;
          v39 = v32 + y[0];
          v40 = Mutable;
          v41 = v26;
          goto LABEL_76;
        case 'l':
LABEL_34:
          v42 = objc_msgSend(v7, "tsu_scanCGFloat:", y);
          if (v42)
            v42 = objc_msgSend(v7, "tsu_scanCGFloat:", &y[1]);
          v11 = v42 ^ 1;
          if ((v30 & 1) != 0)
          {
            if (y[0] == v19 && y[1] == v20)
              goto LABEL_86;
          }
          else if (y[0] == x && y[1] == v26)
          {
            goto LABEL_86;
          }
          v39 = v32 + y[0];
          v41 = v31 + y[1];
          v40 = Mutable;
LABEL_76:
          CGPathAddLineToPoint(v40, 0, v39, v41);
          goto LABEL_86;
        case 'm':
LABEL_40:
          if (objc_msgSend(v7, "tsu_scanCGFloat:", y))
            v43 = objc_msgSend(v7, "tsu_scanCGFloat:", &y[1]);
          else
            v43 = 0;
          v51 = TSDPathGetElementCount(Mutable);
          v52 = y[0];
          if (v51 < 1)
          {
            v53 = y[1];
          }
          else
          {
            v52 = v32 + y[0];
            v53 = v31 + y[1];
          }
          CGPathMoveToPoint(Mutable, 0, v52, v53);
          if (objc_msgSend(v7, "tsu_scanCGFloat:", y))
          {
            do
            {
              v43 = objc_msgSend(v7, "tsu_scanCGFloat:", &y[1]);
              if (v30)
              {
                v54 = CGPathGetCurrentPoint(Mutable);
                v32 = v54.x;
                v31 = v54.y;
              }
              CGPathAddLineToPoint(Mutable, 0, v32 + y[0], v31 + y[1]);
            }
            while ((objc_msgSend(v7, "tsu_scanCGFloat:", y) & 1) != 0);
          }
          v11 = v43 ^ 1;
          goto LABEL_86;
        case 'q':
LABEL_42:
          v67 = v65;
          *(_OWORD *)v68 = v65;
          v44 = objc_msgSend(v7, "tsu_scanCGFloat:", v68);
          if (v44)
          {
            v44 = objc_msgSend(v7, "tsu_scanCGFloat:", &v68[1]);
            if (v44)
            {
              v44 = objc_msgSend(v7, "tsu_scanCGFloat:", &v67);
              if (v44)
                v44 = objc_msgSend(v7, "tsu_scanCGFloat:", (char *)&v67 + 8);
            }
          }
          v11 = v44 ^ 1;
          v68[0] = v32 + v68[0];
          v68[1] = v31 + v68[1];
          *(double *)&v67 = v32 + *(double *)&v67;
          *((double *)&v67 + 1) = v31 + *((double *)&v67 + 1);
          CGPathAddQuadCurveToPoint(Mutable, 0, v68[0], v68[1], *(CGFloat *)&v67, *((CGFloat *)&v67 + 1));
          v22 = v68[1];
          v21 = v68[0];
          goto LABEL_86;
        case 's':
LABEL_47:
          v61 = v22;
          v62 = v21;
          v45 = (unsigned __int16)(v18 - 67) >> 4;
          if (v45 & 0xFFFC | (unsigned __int16)((v18 - 67) << 12))
            v46 = -0.0;
          else
            v46 = x - v64;
          if (v45 & 0xFFFC | (unsigned __int16)((v18 - 67) << 12))
            v47 = -0.0;
          else
            v47 = v26 - v63;
          v67 = v65;
          *(_OWORD *)v68 = v65;
          v48 = objc_msgSend(v7, "tsu_scanCGFloat:", v68);
          if (v48)
          {
            v48 = objc_msgSend(v7, "tsu_scanCGFloat:", &v68[1]);
            if (v48)
            {
              v48 = objc_msgSend(v7, "tsu_scanCGFloat:", &v67);
              if (v48)
                v48 = objc_msgSend(v7, "tsu_scanCGFloat:", (char *)&v67 + 8);
            }
          }
          v11 = v48 ^ 1;
          v68[0] = v32 + v68[0];
          v68[1] = v31 + v68[1];
          *(double *)&v67 = v32 + *(double *)&v67;
          *((double *)&v67 + 1) = v31 + *((double *)&v67 + 1);
          CGPathAddCurveToPoint(Mutable, 0, x + v46, v26 + v47, v68[0], v68[1], *(CGFloat *)&v67, *((CGFloat *)&v67 + 1));
          v63 = v68[1];
          v64 = v68[0];
          v22 = v61;
          v21 = v62;
          goto LABEL_86;
        case 't':
LABEL_58:
          if (v18 - 81 > 0x23)
          {
            v21 = x;
            v22 = v26;
          }
          else
          {
            v49 = 1 << (v18 - 81);
            if ((v49 & 0x900000009) != 0)
              v21 = x + x - v21;
            else
              v21 = x;
            if ((v49 & 0x900000009) != 0)
              v22 = v26 + v26 - v22;
            else
              v22 = v26;
          }
          *(_OWORD *)v68 = 0uLL;
          v50 = objc_msgSend(v7, "tsu_scanCGFloat:", v68);
          if (v50)
            v50 = objc_msgSend(v7, "tsu_scanCGFloat:", &v68[1]);
          v11 = v50 ^ 1;
          v68[0] = v32 + v68[0];
          v68[1] = v31 + v68[1];
          CGPathAddQuadCurveToPoint(Mutable, 0, v21, v22, v68[0], v68[1]);
          goto LABEL_86;
        case 'v':
LABEL_68:
          v11 = objc_msgSend(v7, "tsu_scanCGFloat:", &y[1]) ^ 1;
          v41 = v31 + y[1];
          v40 = Mutable;
          v39 = x;
          goto LABEL_76;
        default:
          if ((_DWORD)v13 != 122)
          {
LABEL_92:
            objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:]");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, v58, 570, CFSTR("Cannot process path of type %@"), v12);

            objc_msgSend(v7, "isAtEnd");
            v11 = 1;
            goto LABEL_3;
          }
LABEL_72:
          CGPathCloseSubpath(Mutable);
          v11 = 0;
LABEL_86:
          if ((objc_msgSend(v7, "isAtEnd") & 1) != 0)
            goto LABEL_3;
          v18 = v13;
          if (v11)
            goto LABEL_3;
          break;
      }
    }
  }
  v11 = 0;
  v12 = 0;
  v13 = 0;
LABEL_3:
  if (v59 && (v13 | 0x20) != 0x7A)
  {
    MutableCopy = CGPathCreateMutableCopy(Mutable);
    CGPathRelease(Mutable);
    CGPathCloseSubpath(MutableCopy);
    Mutable = MutableCopy;
    if (!v11)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDSVGToBezierPathConverter newPathFromSVGPathString:shouldClosePathAtEnd:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 590, CFSTR("Bailing on operation %c"), v13);

  }
LABEL_7:

  return Mutable;
}

+ (CGPath)newPathFromSVGPolylineString:(id)a3
{
  id v3;
  CGPath *Mutable;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v13[3];
  uint64_t v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  Mutable = CGPathCreateMutable();
  *(_OWORD *)v13 = *MEMORY[0x24BDBEFB0];
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)asc_217C2A808;
  v15 = 2883717;
  v6 = (void *)MEMORY[0x24BDD14A8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v14, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "characterSetWithCharactersInString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCharactersToBeSkipped:", v8);

  if (objc_msgSend(v5, "tsu_scanCGFloat:", v13)
    && (objc_msgSend(v5, "tsu_scanCGFloat:", &v13[1]) & 1) != 0)
  {
    CGPathMoveToPoint(Mutable, 0, v13[0], v13[1]);
    if ((objc_msgSend(v5, "isAtEnd") & 1) == 0)
    {
      while (objc_msgSend(v5, "tsu_scanCGFloat:", v13)
           && (objc_msgSend(v5, "tsu_scanCGFloat:", &v13[1]) & 1) != 0)
      {
        CGPathAddLineToPoint(Mutable, 0, v13[0], v13[1]);
        if (objc_msgSend(v5, "isAtEnd"))
          goto LABEL_10;
      }
      objc_msgSend(v5, "isAtEnd");
    }
LABEL_10:
    CGPathCloseSubpath(Mutable);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDSVGToBezierPathConverter newPathFromSVGPolylineString:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 607, CFSTR("No value for initial polyline point!"));

  }
  return Mutable;
}

+ (CGPath)newPathFromSVGPolygonString:(id)a3
{
  CGPath *v3;
  CGPath *MutableCopy;

  v3 = +[TSDSVGToBezierPathConverter newPathFromSVGPolylineString:](TSDSVGToBezierPathConverter, "newPathFromSVGPolylineString:", a3);
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
  double *v8;
  __int128 v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  char v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  double a;
  float v34;
  double b;
  void *v36;
  float v37;
  double c;
  void *v39;
  float v40;
  double d;
  void *v42;
  float v43;
  double tx;
  CGAffineTransform *v45;
  void *v46;
  float v47;
  double ty;
  void *v49;
  uint64_t v50;
  float v51;
  CGFloat v52;
  void *v53;
  float v54;
  void *v55;
  void *v56;
  float v57;
  double v58;
  void *v59;
  uint64_t v60;
  float v61;
  float v62;
  float v63;
  void *v64;
  void *v65;
  __int128 v66;
  CGAffineTransform *result;
  id v68;
  void *v69;
  void *v70;
  id obj;
  double v72;
  double v73;
  double v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  CGAffineTransform t2;
  CGAffineTransform t1;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  uint64_t v88;
  int v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v87 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(matrix|translate|scale|rotate)\\((.*?)\\)"), 1, &v87);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v87;
  v69 = v6;
  objc_msgSend(v6, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double *)MEMORY[0x24BDBD8B8];
  v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v8 + 2);
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v7;
  v77 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
  if (v77)
  {
    v74 = v8[1];
    v75 = *v8;
    v10 = v8[4];
    v72 = v8[3];
    v73 = v8[2];
    v11 = v8[5];
    v76 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v77; i = v50 + 1)
      {
        if (*(_QWORD *)v84 != v76)
          objc_enumerationMutation(obj);
        v79 = i;
        v13 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "rangeAtIndex:", 1);
        objc_msgSend(v5, "substringWithRange:", v14, v15);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "rangeAtIndex:", 2);
        objc_msgSend(v5, "substringWithRange:", v16, v17);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = *(_QWORD *)asc_217C2A808;
        v89 = 2883717;
        v19 = (void *)MEMORY[0x24BDD14A8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v88, 6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "characterSetWithCharactersInString:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setCharactersToBeSkipped:", v21);

        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isAtEnd") & 1) == 0)
        {
          v23 = 1;
          do
          {
            t1.a = 0.0;
            v24 = objc_msgSend(v18, "tsu_scanCGFloat:", &t1);
            HIDWORD(v25) = HIDWORD(t1.a);
            *(float *)&v25 = t1.a;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v26);
            if (v23 >= 7)
            {
              objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDSVGToBezierPathConverter transformFromSVGTransformAttributeString:]");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 676, CFSTR("Too many numbers for transform %@"), v5);

              v24 = 0;
            }

            if (objc_msgSend(v18, "isAtEnd"))
              break;
            ++v23;
          }
          while ((v24 & 1) != 0);
        }
        v30 = v80;
        if (objc_msgSend(v80, "isEqualToString:", CFSTR("matrix")))
        {
          if (objc_msgSend(v22, "count") == 6)
          {
            objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "floatValue");
            a = v32;
            objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "floatValue");
            b = v34;
            objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "floatValue");
            c = v37;
            objc_msgSend(v22, "objectAtIndexedSubscript:", 3);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "floatValue");
            d = v40;
            objc_msgSend(v22, "objectAtIndexedSubscript:", 4);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "floatValue");
            tx = v43;
            objc_msgSend(v22, "objectAtIndexedSubscript:", 5);
            v45 = retstr;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "floatValue");
            ty = v47;

            retstr = v45;
            v49 = v31;

          }
          else
          {
            objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDSVGToBezierPathConverter transformFromSVGTransformAttributeString:]");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v55, v56, 694, CFSTR("Not enough numbers for matrix transform! %@"), v5);

            ty = v11;
            tx = v10;
            d = v72;
            c = v73;
            b = v74;
            a = v75;
          }
          v50 = v79;
          v30 = v80;
          goto LABEL_32;
        }
        v50 = v79;
        if (!objc_msgSend(v80, "isEqualToString:", CFSTR("translate")))
        {
          ty = v11;
          tx = v10;
          d = v72;
          c = v73;
          b = v74;
          a = v75;
          if (!objc_msgSend(v80, "isEqualToString:", CFSTR("scale")))
            goto LABEL_33;
          if (objc_msgSend(v22, "count") == 2)
          {
            objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "floatValue");
            v58 = v57;
            v59 = v22;
            v60 = 1;
          }
          else
          {
            if (objc_msgSend(v22, "count") != 1)
            {
              objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDSVGToBezierPathConverter transformFromSVGTransformAttributeString:]");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v64, v65, 715, CFSTR("Wrong number of numbers for scale transform! %@"), v5);
              goto LABEL_31;
            }
            objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "floatValue");
            v58 = v62;
            v59 = v22;
            v60 = 0;
          }
          objc_msgSend(v59, "objectAtIndexedSubscript:", v60);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "floatValue");
          CGAffineTransformMakeScale(&t1, v58, v63);
          goto LABEL_28;
        }
        if (objc_msgSend(v22, "count") == 2)
        {
          objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "floatValue");
          v52 = v51;
          objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "floatValue");
          CGAffineTransformMakeTranslation(&t1, v52, v54);
LABEL_28:
          a = t1.a;
          b = t1.b;
          c = t1.c;
          d = t1.d;
          tx = t1.tx;
          ty = t1.ty;

          goto LABEL_32;
        }
        if (objc_msgSend(v22, "count") != 1)
        {
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDSVGToBezierPathConverter transformFromSVGTransformAttributeString:]");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSVGToBezierPathConverter.m");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v64, v65, 705, CFSTR("Wrong number of numbers for translate transform! %@"), v5);
LABEL_31:

          v30 = v80;
          ty = v11;
          tx = v10;
          d = v72;
          c = v73;
          b = v74;
          a = v75;
          goto LABEL_32;
        }
        objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "floatValue");
        CGAffineTransformMakeTranslation(&t1, v61, 0.0);
        a = t1.a;
        b = t1.b;
        c = t1.c;
        d = t1.d;
        tx = t1.tx;
        ty = t1.ty;
LABEL_32:

LABEL_33:
        v66 = *(_OWORD *)&retstr->c;
        *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
        *(_OWORD *)&t1.c = v66;
        *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
        t2.a = a;
        t2.b = b;
        t2.c = c;
        t2.d = d;
        t2.tx = tx;
        t2.ty = ty;
        CGAffineTransformConcat(retstr, &t1, &t2);

      }
      v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
    }
    while (v77);
  }

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHiddenOnTag, 0);
  objc_storeStrong((id *)&self->mFileBezierPath, 0);
}

@end
