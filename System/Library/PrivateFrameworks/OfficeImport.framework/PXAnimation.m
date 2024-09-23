@implementation PXAnimation

+ (void)readAnimationFromTimingXmlNode:(_xmlNode *)a3 tgtAnimation:(id)a4 drawingState:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  CXNamespace *v13;
  _xmlNode *v14;
  CXNamespace *v15;
  _xmlNode *v16;
  void *v17;
  void *v18;
  void *v19;
  CXNamespace *v20;
  _xmlNode *v21;
  _xmlNode *i;
  _xmlAttr *v23;
  void *v24;
  void *v25;
  PDDiagramBuild *v26;
  PDDiagramBuild *v27;
  BOOL v28;
  PDBuildMapKey *v29;
  void *v30;
  id v31;
  OITSUNoCopyDictionary *v32;

  v31 = a4;
  v7 = a5;
  v8 = v7;
  if (a3)
  {
    objc_msgSend(v7, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentationState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "PXPresentationMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = (_xmlNode *)OCXFindChild(a3, v11, "tnLst");

    if (v12)
    {
      objc_msgSend(v10, "PXPresentationMLNamespace");
      v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v14 = (_xmlNode *)OCXFindChild(v12, v13, "par");

      if (v14)
      {
        objc_msgSend(v10, "PXPresentationMLNamespace");
        v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v16 = (_xmlNode *)OCXFindChild(v14, v15, "cTn");

        if (v16)
        {
          CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"nodeType", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17 && objc_msgSend(v17, "isEqualToString:", CFSTR("tmRoot")))
          {
            objc_msgSend(v31, "addRootTimeNode");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "readCommonTimeNodeData:commonTimeNodeData:drawingState:", v16, v19, v8);

          }
        }
      }
    }
    objc_msgSend(v10, "PXPresentationMLNamespace");
    v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v21 = (_xmlNode *)OCXFindChild(a3, v20, "bldLst");

    if (v21)
    {
      v30 = v10;
      v32 = objc_alloc_init(OITSUNoCopyDictionary);
      for (i = OCXFirstChild(v21); ; i = OCXNextSibling(i))
      {
        if (!i)
        {
          objc_msgSend(v31, "setBuildMap:", v32);

          v10 = v30;
          goto LABEL_30;
        }
        if (i->type == XML_ELEMENT_NODE)
          break;
LABEL_27:
        ;
      }
      v23 = CXRequiredLongAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"spid");
      CXDefaultStringAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"grpId", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "drawableForShapeId:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (xmlStrEqual(i->name, (const xmlChar *)"bldP"))
      {
        v26 = (PDDiagramBuild *)objc_msgSend(a1, "readParagraphBuild:", i);
      }
      else if (xmlStrEqual(i->name, (const xmlChar *)"bldDgm"))
      {
        v26 = objc_alloc_init(PDDiagramBuild);
      }
      else if (xmlStrEqual(i->name, (const xmlChar *)"bldOleChart"))
      {
        v26 = (PDDiagramBuild *)objc_msgSend(a1, "readOleChartBuild:", i);
      }
      else
      {
        if (!xmlStrEqual(i->name, (const xmlChar *)"bldGraphic"))
        {
          v27 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = (PDDiagramBuild *)objc_msgSend(a1, "readGraphicBuild:drawingState:", i, v8);
      }
      v27 = v26;
      if (v25)
        v28 = v26 == 0;
      else
        v28 = 1;
      if (!v28)
      {
        v29 = -[PDBuildMapKey initWithDrawable:groupId:]([PDBuildMapKey alloc], "initWithDrawable:groupId:", v25, v24);
        -[OITSUNoCopyDictionary setObject:forUncopiedKey:](v32, "setObject:forUncopiedKey:", v27, v29);

      }
      goto LABEL_26;
    }
LABEL_30:

  }
}

+ (void)readCommonTimeNodeData:(_xmlNode *)a3 commonTimeNodeData:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  id v11;
  _BOOL4 v12;
  id v13;
  _BOOL4 v14;
  id v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  _xmlNode *i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;

  v8 = a4;
  v9 = a5;
  v38 = 0;
  v37 = 0;
  v10 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"nodeType", &v37);
  v11 = v37;
  if (v10)
    objc_msgSend(a1, "readTimeNodeType:commonTimeNodeData:", v11, v8);
  v36 = 0;
  v12 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"presetClass", &v36);
  v13 = v36;
  if (v12)
    objc_msgSend(a1, "readPresetClass:commonTimeNodeData:", v13, v8);
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"presetSubtype", &v38))
    objc_msgSend(v8, "setPresetSubType:", v38);
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"presetID", &v38))
    objc_msgSend(v8, "setPresetId:", v38);
  v35 = 0;
  v31 = v13;
  v14 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"grpId", &v35);
  v15 = v35;
  if (v14)
    objc_msgSend(v8, "setGroupId:", v15);
  v34 = 0;
  v30 = v15;
  v16 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"repeatCount", &v34);
  v17 = v34;
  v18 = v17;
  if (v16)
  {
    v38 = 0;
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("indefinite")))
      v19 = -1;
    else
      v19 = objc_msgSend(v18, "intValue");
    v38 = v19;
    objc_msgSend(v8, "setRepeatCount:");
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"repeatDur", &v38))
    objc_msgSend(v8, "setRepeatDuration:", v38);
  v28 = v18;
  v33 = 0;
  v20 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"restart", &v33);
  v21 = v33;
  if (v20)
    objc_msgSend(a1, "readRestartType:commonTimeNodeData:", v21, v8, v18, v30, v13);
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dur", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if (objc_msgSend(v22, "isEqualToString:", CFSTR("indefinite")))
    {
      v24 = -1;
    }
    else
    {
      v24 = objc_msgSend(v23, "intValue");
      v38 = v24;
    }
    objc_msgSend(v8, "setDuration:", (double)v24, v28);
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"spd", &v38))
    objc_msgSend(v8, "setSpeed:", (double)v38);
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"accel", &v38))
    objc_msgSend(v8, "setAcceleration:", (double)v38);
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"decel", &v38))
    objc_msgSend(v8, "setDeceleration:", (double)v38);
  v32 = 3;
  objc_msgSend(a1, "timeNodeFillTypeMap", v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(a1, "readOptionalStringAttribute:fromNode:attributeMap:toPDDomValue:", CFSTR("fill"), a3, v25, &v32);

  if (v26)
    objc_msgSend(v8, "setFillType:", v32);
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"childTnLst"))
    {
      objc_msgSend(a1, "readChildTimeNodeList:commonTimeNodeData:drawingState:", i, v8, v9);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"iterate"))
    {
      objc_msgSend(a1, "readIterate:commonTimeNodeData:drawingState:", i, v8, v9);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"stCondLst"))
    {
      objc_msgSend(a1, "readStConditionList:commonTimeNodeData:drawingState:", i, v8, v9);
    }
  }

}

+ (void)readTimeNodeType:(id)a3 commonTimeNodeData:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "timeNodeTypeMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "valueForString:", v9);

  if (v8 != -130883970)
    objc_msgSend(v6, "setType:", v8);

}

+ (void)readRestartType:(id)a3 commonTimeNodeData:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "restartTypeMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "valueForString:", v9);

  if (v8 != -130883970)
    objc_msgSend(v6, "setRestartType:", v8);

}

+ (void)readChildTimeNodeList:(_xmlNode *)a3 commonTimeNodeData:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  _xmlNode *v10;
  PDTimeNodeUnion *v11;
  PDTimeNodeUnion *v12;
  PDTimeNodeUnion *v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = OCXFirstChild(a3);
  v11 = 0;
  while (v10)
  {
    if (xmlStrEqual(v10->name, (const xmlChar *)"anim"))
    {
      v12 = objc_alloc_init(PDTimeNodeUnion);

      objc_msgSend(a1, "readAnimElement:timeNode:drawingState:", v10, v12, v8);
      objc_msgSend(v9, "addObject:", v12);
LABEL_11:

      v13 = 0;
      goto LABEL_12;
    }
    if (xmlStrEqual(v10->name, (const xmlChar *)"animEffect"))
    {
      v12 = objc_alloc_init(PDTimeNodeUnion);

      objc_msgSend(a1, "readAnimEffectElement:timeNode:drawingState:", v10, v12, v8);
      objc_msgSend(v9, "addObject:", v12);
      goto LABEL_11;
    }
    if (xmlStrEqual(v10->name, (const xmlChar *)"animMotion"))
    {
      v12 = objc_alloc_init(PDTimeNodeUnion);

      objc_msgSend(a1, "readAnimMotionElement:timeNode:drawingState:", v10, v12, v8);
      objc_msgSend(v9, "addObject:", v12);
      goto LABEL_11;
    }
    if (xmlStrEqual(v10->name, (const xmlChar *)"animRot"))
    {
      v12 = objc_alloc_init(PDTimeNodeUnion);

      objc_msgSend(a1, "readAnimRotationElement:timeNode:drawingState:", v10, v12, v8);
      objc_msgSend(v9, "addObject:", v12);
      goto LABEL_11;
    }
    if (xmlStrEqual(v10->name, (const xmlChar *)"animScale"))
    {
      v13 = objc_alloc_init(PDTimeNodeUnion);

      objc_msgSend(a1, "readAnimScaleElement:timeNode:drawingState:", v10, v13, v8);
      objc_msgSend(v9, "addObject:", v13);
    }
    else
    {
      if (xmlStrEqual(v10->name, (const xmlChar *)"audio"))
      {
        v12 = objc_alloc_init(PDTimeNodeUnion);

        objc_msgSend(a1, "readAnimAudioElement:timeNode:drawingState:", v10, v12, v8);
        objc_msgSend(v9, "addObject:", v12);
        goto LABEL_11;
      }
      if (xmlStrEqual(v10->name, (const xmlChar *)"video"))
      {
        v12 = objc_alloc_init(PDTimeNodeUnion);

        objc_msgSend(a1, "readAnimVideoElement:timeNode:drawingState:", v10, v12, v8);
        objc_msgSend(v9, "addObject:", v12);
        goto LABEL_11;
      }
      if (xmlStrEqual(v10->name, (const xmlChar *)"cmd"))
      {
        v12 = objc_alloc_init(PDTimeNodeUnion);

        objc_msgSend(a1, "readAnimCmdElement:timeNode:drawingState:", v10, v12, v8);
        objc_msgSend(v9, "addObject:", v12);
        goto LABEL_11;
      }
      if (xmlStrEqual(v10->name, (const xmlChar *)"par"))
      {
        v13 = objc_alloc_init(PDTimeNodeUnion);

        objc_msgSend(a1, "readAnimParallelElement:timeNode:drawingState:", v10, v13, v8);
        objc_msgSend(v9, "addObject:", v13);
      }
      else
      {
        if (xmlStrEqual(v10->name, (const xmlChar *)"seq"))
        {
          v12 = objc_alloc_init(PDTimeNodeUnion);

          objc_msgSend(a1, "readAnimSequentialElement:timeNode:drawingState:", v10, v12, v8);
          objc_msgSend(v9, "addObject:", v12);
          goto LABEL_11;
        }
        if (xmlStrEqual(v10->name, (const xmlChar *)"set"))
        {
          v12 = objc_alloc_init(PDTimeNodeUnion);

          objc_msgSend(a1, "readAnimSetElement:timeNode:drawingState:", v10, v12, v8);
          objc_msgSend(v9, "addObject:", v12);
          goto LABEL_11;
        }
        v13 = v11;
      }
    }
LABEL_12:
    v11 = v13;
    v10 = OCXNextSibling(v10);
  }
  objc_msgSend(v14, "setChildTimeNodeList:", v9);

}

+ (void)readAnimSequentialElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  PDSequentialTimeNode *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  CXNamespace *v17;
  uint64_t v18;
  CXNamespace *v19;
  uint64_t v20;
  void *v21;
  CXNamespace *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(PDSequentialTimeNode);
  objc_msgSend(v9, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentationState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDSequentialTimeNode setConcurrent:](v10, "setConcurrent:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"concurrent", 0));
  v26 = 0;
  objc_msgSend(a1, "sequentialPreviousActionMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(a1, "readOptionalStringAttribute:fromNode:attributeMap:toPDDomValue:", CFSTR("prevAc"), a3, v13, &v26);

  if (v14)
    -[PDSequentialTimeNode setPreviousAction:](v10, "setPreviousAction:", v26);
  objc_msgSend(a1, "sequentialNextActionMap", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(a1, "readOptionalStringAttribute:fromNode:attributeMap:toPDDomValue:", CFSTR("nextAc"), a3, v15, &v25);

  if (v16)
    -[PDSequentialTimeNode setNextAction:](v10, "setNextAction:", v25);
  objc_msgSend(v12, "PXPresentationMLNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = OCXFindChild(a3, v17, "cTn");

  if (v18)
    objc_msgSend(a1, "readCommonTimeNodeData:commonTimeNodeData:drawingState:", v18, v10, v9);
  objc_msgSend(v12, "PXPresentationMLNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = OCXFindChild(a3, v19, "prevCondLst");

  if (v20)
  {
    v21 = (void *)objc_opt_new();
    objc_msgSend(a1, "readConditionList:arrayOfConditions:drawingState:", v20, v21, v9);
    -[PDSequentialTimeNode setPreviousConditions:](v10, "setPreviousConditions:", v21);

  }
  objc_msgSend(v12, "PXPresentationMLNamespace");
  v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v23 = OCXFindChild(a3, v22, "nextCondLst");

  if (v23)
  {
    v24 = (void *)objc_opt_new();
    objc_msgSend(a1, "readConditionList:arrayOfConditions:drawingState:", v23, v24, v9);
    -[PDSequentialTimeNode setNextConditions:](v10, "setNextConditions:", v24);

  }
  objc_msgSend(v8, "setSequential:", v10);

}

+ (void)readAnimParallelElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8;
  PDParallelTimeNode *v9;
  void *v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = objc_alloc_init(PDParallelTimeNode);
  objc_msgSend(v8, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "PXPresentationMLNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "cTn");

  if (v13)
    objc_msgSend(a1, "readCommonTimeNodeData:commonTimeNodeData:drawingState:", v13, v9, v8);
  objc_msgSend(v14, "setParallel:", v9);

}

+ (void)readStConditionList:(_xmlNode *)a3 commonTimeNodeData:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a1, "readConditionList:arrayOfConditions:drawingState:", a3, v9, v8);
  objc_msgSend(v10, "setStartTimeConditions:", v9);

}

+ (void)readCondition:(_xmlNode *)a3 timeCondition:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  CXNamespace *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v8 = a4;
  v9 = a5;
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"delay", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("indefinite")))
      v12 = 0xFFFFFFFFLL;
    else
      v12 = objc_msgSend(v11, "intValue");
    objc_msgSend(v8, "setDelay:", v12);
  }
  v20 = 0;
  v13 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"evt", &v20);
  v14 = v20;
  if (v13)
    objc_msgSend(a1, "readTriggerEvent:timeCondition:", v14, v8);
  objc_msgSend(v9, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentationState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "PXPresentationMLNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = OCXFindChild(a3, v17, "tgtEl");

  if (v18)
  {
    v19 = (void *)objc_msgSend(a1, "newTarget:drawingState:", v18, v9);
    objc_msgSend(v8, "setTarget:", v19);

  }
}

+ (void)readPresetClass:(id)a3 commonTimeNodeData:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "presetClassMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "valueForString:", v9);

  if (v8 != -130883970)
    objc_msgSend(v6, "setAnimationPresetClass:", v8);

}

+ (void)readAnimMotionElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  PDAnimateMotionBehavior *v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  CXNamespace *v18;
  uint64_t v19;
  CXNamespace *v20;
  uint64_t v21;
  CXNamespace *v22;
  uint64_t v23;
  CXNamespace *v24;
  uint64_t v25;
  double v26;
  double v27;
  id v28;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(PDAnimateMotionBehavior);
  objc_msgSend(v9, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentationState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "PXPresentationMLNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = OCXFindChild(a3, v13, "cBhvr");

  if (v14)
    objc_msgSend(a1, "readCommonBehaviorData:tgtCommonBehaviorData:drawingState:", v14, v10, v9);
  v28 = 0;
  v15 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"path", &v28);
  v16 = v28;
  if (v15)
  {
    +[PDAnimateMotionBehavior bezierPathFromNSString:](PDAnimateMotionBehavior, "bezierPathFromNSString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDAnimateMotionBehavior setPath:](v10, "setPath:", v17);

  }
  v26 = 0.0;
  v27 = 0.0;
  objc_msgSend(v12, "PXPresentationMLNamespace");
  v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v19 = OCXFindChild(a3, v18, "by");

  if (v19)
  {
    objc_msgSend(a1, "readPointFromNode:tgtPoint:", v19, &v26);
    -[PDAnimateScaleBehavior setBy:](v10, "setBy:", v26, v27);
  }
  objc_msgSend(v12, "PXPresentationMLNamespace");
  v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v21 = OCXFindChild(a3, v20, "from");

  if (v21)
  {
    objc_msgSend(a1, "readPointFromNode:tgtPoint:", v21, &v26);
    -[PDAnimateScaleBehavior setFrom:](v10, "setFrom:", v26, v27);
  }
  objc_msgSend(v12, "PXPresentationMLNamespace");
  v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v23 = OCXFindChild(a3, v22, "to");

  if (v23)
  {
    objc_msgSend(a1, "readPointFromNode:tgtPoint:", v23, &v26);
    -[PDAnimateScaleBehavior setTo:](v10, "setTo:", v26, v27);
  }
  objc_msgSend(v12, "PXPresentationMLNamespace");
  v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v25 = OCXFindChild(a3, v24, "rCtr");

  if (v25)
  {
    objc_msgSend(a1, "readPointFromNode:tgtPoint:", v23, &v26);
    -[PDAnimateMotionBehavior setRotationCenter:](v10, "setRotationCenter:", v26, v27);
  }
  objc_msgSend(v8, "setMotionBehavior:", v10);

}

+ (void)readCommonBehaviorData:(_xmlNode *)a3 tgtCommonBehaviorData:(id)a4 drawingState:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  CXNamespace *v11;
  uint64_t v12;
  CXNamespace *v13;
  uint64_t v14;
  void *v15;
  CXNamespace *v16;
  _xmlNode *v17;
  void *v18;
  _xmlNode *v19;
  void *v20;
  id v21;

  v21 = a4;
  v8 = a5;
  objc_msgSend(v8, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentationState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "PXPresentationMLNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v11, "cTn");

  if (v12)
    objc_msgSend(a1, "readCommonTimeNodeData:commonTimeNodeData:drawingState:", v12, v21, v8);
  objc_msgSend(v10, "PXPresentationMLNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = OCXFindChild(a3, v13, "tgtEl");

  if (v14)
  {
    v15 = (void *)objc_msgSend(a1, "newTarget:drawingState:", v14, v8);
    objc_msgSend(v21, "setTarget:", v15);

  }
  objc_msgSend(v10, "PXPresentationMLNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = (_xmlNode *)OCXFindChild(a3, v16, "attrNameLst");

  if (v17)
  {
    v18 = (void *)objc_opt_new();
    v19 = OCXFirstChildNamed(v17, (xmlChar *)"attrName");
    while (v19)
    {
      CXDefaultStringContent(v19, (NSString *)&stru_24F3BFFF8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length"))
        objc_msgSend(v18, "addObject:", v20);
      v19 = OCXNextSiblingNamed(v19, (xmlChar *)"attrName");

    }
    objc_msgSend(v21, "setAttributeNames:", v18);

  }
}

+ (id)newTarget:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  uint64_t v10;
  __objc2_class **v11;
  CXNamespace *v12;
  uint64_t v13;
  PDAnimationShapeTarget *v14;
  PDAnimationShapeTarget *v15;
  CXNamespace *v17;
  uint64_t v18;
  CXNamespace *v19;
  _xmlNode *v20;
  _BOOL4 v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v6 = a4;
  objc_msgSend(v6, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "PXPresentationMLNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "sldTgt");

  if (v10)
  {
    v11 = off_24F399430;
LABEL_5:
    v14 = (PDAnimationShapeTarget *)objc_alloc_init(*v11);
LABEL_6:
    v15 = v14;
    goto LABEL_7;
  }
  objc_msgSend(v8, "PXPresentationMLNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "sndTgt");

  if (v13)
  {
    v11 = off_24F399410;
    goto LABEL_5;
  }
  objc_msgSend(v8, "PXPresentationMLNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = OCXFindChild(a3, v17, "spTgt");

  if (v18)
  {
    v14 = (PDAnimationShapeTarget *)objc_msgSend(a1, "newShapeTarget:drawingState:", v18, v6);
    goto LABEL_6;
  }
  objc_msgSend(v8, "PXPresentationMLNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = (_xmlNode *)OCXFindChild(a3, v19, "inkTgt");

  if (v20)
  {
    v25 = 0;
    v21 = CXOptionalStringAttribute(v20, (void *)CXNoNamespace, (xmlChar *)"spid", &v25);
    v22 = v25;
    if (v21)
    {
      objc_msgSend(v8, "oavState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "drawableForVmlShapeId:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v15 = objc_alloc_init(PDAnimationShapeTarget);
        -[PDAnimationShapeTarget setDrawable:](v15, "setDrawable:", v24);
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
LABEL_7:

  return v15;
}

+ (id)newShapeTarget:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  uint64_t v10;
  __objc2_class **v11;
  PDAnimationDiagramTarget *v12;
  PDAnimationChartTarget *v13;
  void *v14;
  void *v15;
  void *v16;
  CXNamespace *v18;
  _xmlNode *v19;
  CXNamespace *v20;
  uint64_t v21;
  CXNamespace *v22;
  _xmlNode *v23;
  _BOOL4 v24;
  id v25;
  CXNamespace *v26;
  _xmlNode *v27;
  _BOOL4 v28;
  CXNamespace *v29;
  _xmlNode *v30;
  CXNamespace *v31;
  _xmlNode *v32;
  CXNamespace *v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;

  v6 = a4;
  objc_msgSend(v6, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = -1;
  objc_msgSend(v8, "PXPresentationMLNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "bg");

  if (v10)
  {
    v11 = off_24F399400;
LABEL_3:
    v12 = (PDAnimationDiagramTarget *)objc_alloc_init(*v11);
LABEL_4:
    v13 = (PDAnimationChartTarget *)v12;
    goto LABEL_5;
  }
  objc_msgSend(v8, "PXPresentationMLNamespace");
  v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v19 = (_xmlNode *)OCXFindChild(a3, v18, "graphicEl");

  if (v19)
  {
    objc_msgSend(v6, "OAXMainNamespace");
    v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v21 = OCXFindChild(v19, v20, "dgm");

    if (v21)
    {
      v12 = objc_alloc_init(PDAnimationDiagramTarget);
      goto LABEL_4;
    }
    objc_msgSend(v6, "OAXMainNamespace");
    v26 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v27 = (_xmlNode *)OCXFindChild(v19, v26, "chart");

    if (v27)
    {
      v13 = objc_alloc_init(PDAnimationChartTarget);
      v36 = 0;
      v28 = CXOptionalStringAttribute(v27, (void *)CXNoNamespace, (xmlChar *)"bldStep", &v36);
      v25 = v36;
      if (v28)
        objc_msgSend(a1, "readChartBuildStep:chartTarget:", v25, v13);
      if (CXOptionalLongAttribute(v27, (CXNamespace *)CXNoNamespace, (xmlChar *)"categoryIdx", &v37))
        -[PDAnimationChartTarget setCatagoryIndex:](v13, "setCatagoryIndex:", v37);
      if (CXOptionalLongAttribute(v27, (CXNamespace *)CXNoNamespace, (xmlChar *)"seriesIdx", &v37))
        -[PDAnimationChartTarget setSeriesIndex:](v13, "setSeriesIndex:", v37);
LABEL_23:

      goto LABEL_5;
    }
    v13 = 0;
  }
  else
  {
    objc_msgSend(v8, "PXPresentationMLNamespace");
    v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v23 = (_xmlNode *)OCXFindChild(a3, v22, "oleChartEl");

    if (v23)
    {
      v13 = objc_alloc_init(PDAnimationOleChartTarget);
      if (CXOptionalLongAttribute(v23, (CXNamespace *)CXNoNamespace, (xmlChar *)"lvl", &v37))
        -[PDAnimationChartTarget setLevel:](v13, "setLevel:", v37);
      v35 = 0;
      v24 = CXOptionalStringAttribute(v23, (void *)CXNoNamespace, (xmlChar *)"type", &v35);
      v25 = v35;
      if (v24)
        objc_msgSend(a1, "readChartType:oleChartTarget:", v25, v13);
      goto LABEL_23;
    }
    objc_msgSend(v8, "PXPresentationMLNamespace");
    v29 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v30 = (_xmlNode *)OCXFindChild(a3, v29, "txEl");

    if (!v30)
    {
      v11 = off_24F399408;
      goto LABEL_3;
    }
    v13 = objc_alloc_init(PDAnimationTextTarget);
    objc_msgSend(v8, "PXPresentationMLNamespace");
    v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v32 = (_xmlNode *)OCXFindChild(v30, v31, "charRg");

    if (v32)
    {
      -[PDAnimationChartTarget setType:](v13, "setType:", 0);
    }
    else
    {
      objc_msgSend(v8, "PXPresentationMLNamespace");
      v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v32 = (_xmlNode *)OCXFindChild(v30, v33, "pRg");

      -[PDAnimationChartTarget setType:](v13, "setType:", 1);
      if (!v32)
        goto LABEL_5;
    }
    v34 = 0;
    CXOptionalLongAttribute(v32, (CXNamespace *)CXNoNamespace, (xmlChar *)"st", &v37);
    CXOptionalLongAttribute(v32, (CXNamespace *)CXNoNamespace, (xmlChar *)"end", &v34);
    -[PDAnimationChartTarget setRange:](v13, "setRange:");
  }
LABEL_5:
  v37 = (uint64_t)CXRequiredLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"spid");
  objc_msgSend(v6, "drawableForShapeId:", v37);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v6, "oavState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v37);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "drawableForVmlShapeId:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PDAnimationShapeTarget setDrawable:](v13, "setDrawable:", v14);

  return v13;
}

+ (void)readPointFromNode:(_xmlNode *)a3 tgtPoint:(CGPoint *)a4
{
  a4->x = (double)CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"x", 0);
  a4->y = (double)CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"y", 0);
}

+ (void)readTriggerEvent:(id)a3 timeCondition:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "triggerEventMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "valueForString:", v9);

  if (v8 != -130883970)
    objc_msgSend(v6, "setTriggerEvent:", v8);

}

+ (void)readAnimSetElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8;
  PDSetBehavior *v9;
  void *v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  CXNamespace *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a4;
  v8 = a5;
  v9 = objc_alloc_init(PDSetBehavior);
  objc_msgSend(v8, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "PXPresentationMLNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "cBhvr");

  if (v13)
    objc_msgSend(a1, "readCommonBehaviorData:tgtCommonBehaviorData:drawingState:", v13, v9, v8);
  objc_msgSend(v11, "PXPresentationMLNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = OCXFindChild(a3, v14, "to");

  if (v15)
  {
    objc_msgSend(a1, "readAnimVariant:drawingState:", v15, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      -[PDSetBehavior setValue:](v9, "setValue:", v16);

  }
  objc_msgSend(v17, "setBehavior:", v9);

}

+ (void)readAnimEffectElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  PDAnimateEffectBehavior *v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(PDAnimateEffectBehavior);
  objc_msgSend(v9, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentationState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "PXPresentationMLNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = OCXFindChild(a3, v13, "cBhvr");

  if (v14)
    objc_msgSend(a1, "readCommonBehaviorData:tgtCommonBehaviorData:drawingState:", v14, v10, v9);
  v19 = 0;
  v15 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"transition", &v19);
  v16 = v19;
  v17 = v16;
  if (v15)
  {
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {
      v18 = 0;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("in")) & 1) != 0)
    {
      v18 = 1;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("out")))
    {
      v18 = 2;
    }
    else
    {
      v18 = 0;
    }
    -[PDAnimateEffectBehavior setTransition:](v10, "setTransition:", v18);
  }
  objc_msgSend(v8, "setEffectBehavior:", v10);

}

+ (id)readParagraphBuild:(_xmlNode *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  PDParagraphBuild *v10;

  v4 = CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"advAuto", -1);
  v5 = CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"animBg", 0);
  v6 = CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bldLvl", 1);
  v7 = CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rev", 0);
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"build", (NSString *)CFSTR("whole"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("allAtOnce")) & 1) != 0)
  {
    v9 = 0;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("p")) & 1) != 0)
  {
    v9 = 2;
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("cust")))
  {
    v9 = 1;
  }
  else
  {
    v9 = 4;
  }
  v10 = objc_alloc_init(PDParagraphBuild);
  -[PDParagraphBuild setAutoAdvanceTime:](v10, "setAutoAdvanceTime:", (double)v4);
  -[PDBuild setIsAnimateBackground:](v10, "setIsAnimateBackground:", v5);
  -[PDParagraphBuild setBuildLevel:](v10, "setBuildLevel:", v6);
  -[PDParagraphBuild setIsReversedParagraphOrder:](v10, "setIsReversedParagraphOrder:", v7);
  -[PDParagraphBuild setType:](v10, "setType:", v9);

  return v10;
}

+ (void)readIterate:(_xmlNode *)a3 commonTimeNodeData:(id)a4 drawingState:(id)a5
{
  id v7;
  id v8;
  PDIterate *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  CXNamespace *v14;
  _xmlNode *v15;
  id *v16;
  uint64_t v17;
  CXNamespace *v18;
  _xmlNode *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(PDIterate);
  v22 = 0;
  v10 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"type", &v22);
  v11 = v22;
  if (!v10)
  {
    v17 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v8, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentationState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "PXPresentationMLNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = (_xmlNode *)OCXFindChild(a3, v14, "tmPct");

  if (v15)
  {
    v21 = 0;
    v16 = (id *)&v21;
    CXOptionalStringAttribute(v15, (void *)CXNoNamespace, (xmlChar *)"val", &v21);
LABEL_7:
    v19 = (_xmlNode *)*v16;
    goto LABEL_8;
  }
  objc_msgSend(v13, "PXPresentationMLNamespace");
  v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v19 = (_xmlNode *)OCXFindChild(a3, v18, "tmAbs");

  if (v19)
  {
    v20 = 0;
    v16 = (id *)&v20;
    CXOptionalStringAttribute(v19, (void *)CXNoNamespace, (xmlChar *)"val", &v20);
    goto LABEL_7;
  }
LABEL_8:
  if ((int)-[_xmlNode intValue](v19, "intValue") < 1)
  {
    v17 = 0;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("wd")) & 1) != 0)
  {
    v17 = 1;
  }
  else if (objc_msgSend(v11, "isEqualToString:", CFSTR("lt")))
  {
    v17 = 2;
  }
  else
  {
    v17 = 0;
  }

LABEL_16:
  -[PDIterate setType:](v9, "setType:", v17);
  objc_msgSend(v7, "setIterate:", v9);

}

+ (void)readAnimElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8;
  PDAnimateTimeBehavior *v9;
  void *v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  CXNamespace *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  v9 = objc_alloc_init(PDAnimateTimeBehavior);
  objc_msgSend(v8, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "PXPresentationMLNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "cBhvr");

  if (v13)
    objc_msgSend(a1, "readCommonBehaviorData:tgtCommonBehaviorData:drawingState:", v13, v9, v8);
  objc_msgSend(v11, "PXPresentationMLNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  OCXFindChild(a3, v14, "tavLst");

  objc_msgSend(v15, "setTimeBehavior:", v9);
}

+ (void)readAnimScaleElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  PDAnimateScaleBehavior *v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;
  CXNamespace *v15;
  uint64_t v16;
  CXNamespace *v17;
  uint64_t v18;
  CXNamespace *v19;
  uint64_t v20;
  double v21;
  double v22;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(PDAnimateScaleBehavior);
  objc_msgSend(v9, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentationState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "PXPresentationMLNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = OCXFindChild(a3, v13, "cBhvr");

  if (v14)
    objc_msgSend(a1, "readCommonBehaviorData:tgtCommonBehaviorData:drawingState:", v14, v10, v9);
  objc_msgSend(v12, "PXPresentationMLNamespace", 0, 0);
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = OCXFindChild(a3, v15, "by");

  if (v16)
  {
    objc_msgSend(a1, "readPointFromNode:tgtPoint:", v16, &v21);
    -[PDAnimateScaleBehavior setBy:](v10, "setBy:", v21, v22);
  }
  objc_msgSend(v12, "PXPresentationMLNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = OCXFindChild(a3, v17, "from");

  if (v18)
  {
    objc_msgSend(a1, "readPointFromNode:tgtPoint:", v18, &v21);
    -[PDAnimateScaleBehavior setFrom:](v10, "setFrom:", v21, v22);
  }
  objc_msgSend(v12, "PXPresentationMLNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = OCXFindChild(a3, v19, "to");

  if (v20)
  {
    objc_msgSend(a1, "readPointFromNode:tgtPoint:", v20, &v21);
    -[PDAnimateScaleBehavior setTo:](v10, "setTo:", v21, v22);
  }
  objc_msgSend(v8, "setScaleBehavior:", v10);

}

+ (void)readAnimRotationElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8;
  PDAnimateRotateBehavior *v9;
  void *v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = objc_alloc_init(PDAnimateRotateBehavior);
  objc_msgSend(v8, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "PXPresentationMLNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "cBhvr");

  if (v13)
    objc_msgSend(a1, "readCommonBehaviorData:tgtCommonBehaviorData:drawingState:", v13, v9, v8);
  -[PDAnimateRotateBehavior setBy:](v9, "setBy:", (double)CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"by", 1));
  objc_msgSend(v14, "setRotateBehavior:", v9);

}

+ (void)readAnimCmdElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8;
  PDCmdBehavior *v9;
  void *v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = objc_alloc_init(PDCmdBehavior);
  objc_msgSend(v8, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "PXPresentationMLNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "cBhvr");

  if (v13)
    objc_msgSend(a1, "readCommonBehaviorData:tgtCommonBehaviorData:drawingState:", v13, v9, v8);
  objc_msgSend(v14, "setCmdBehavior:", v9);

}

+ (void)readAnimAudioElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8;
  PDAudioNode *v9;
  void *v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = objc_alloc_init(PDAudioNode);
  objc_msgSend(v8, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDAudioNode setIsNarration:](v9, "setIsNarration:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"isNarration", 0));
  objc_msgSend(v11, "PXPresentationMLNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "cMediaNode");

  if (v13)
  {
    objc_msgSend(a1, "readCommonMediaNodeData:commonMediaData:drawingState:", v13, v9, v8);
    objc_msgSend(v14, "setAudio:", v9);
  }

}

+ (void)readCommonMediaNodeData:(_xmlNode *)a3 commonMediaData:(id)a4 drawingState:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  CXNamespace *v11;
  uint64_t v12;
  CXNamespace *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  id v20;

  v20 = a4;
  v8 = a5;
  objc_msgSend(v8, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentationState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "PXPresentationMLNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v11, "cTn");

  if (!v12)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(a1, "readCommonTimeNodeData:commonTimeNodeData:drawingState:", v12, v20, v8);
  objc_msgSend(v10, "PXPresentationMLNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = OCXFindChild(a3, v13, "tgtEl");

  v15 = (void *)objc_msgSend(a1, "newTarget:drawingState:", v14, v8);
  v16 = CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"mute", 0);
  v17 = CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showWhenStopped", 1);
  v18 = CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"numSld", 1);
  v19 = CXDefaultFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"vol", 0.5);
  objc_msgSend(v20, "setTarget:", v15);
  objc_msgSend(v20, "setIsMuted:", v16);
  objc_msgSend(v20, "setIsShowWhenStopped:", v17);
  objc_msgSend(v20, "setNumberOfSlides:", v18);
  objc_msgSend(v20, "setVolume:", (uint64_t)(v19 * 100000.0));

}

+ (void)readAnimVideoElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8;
  PDVideoNode *v9;
  void *v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = objc_alloc_init(PDVideoNode);
  objc_msgSend(v8, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDVideoNode setIsFullScreen:](v9, "setIsFullScreen:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fullScrn", 0));
  objc_msgSend(v11, "PXPresentationMLNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "cMediaNode");

  if (v13)
  {
    objc_msgSend(a1, "readCommonMediaNodeData:commonMediaData:drawingState:", v13, v9, v8);
    objc_msgSend(v14, "setVideo:", v9);
  }

}

+ (int)readChartBuildType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("series")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("category")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("seriesEl")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("categoryEl")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)writeAnimationFromSlideBase:(id)a3 to:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  PXAnimationWriteState *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v17, "animation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rootTimeNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "startElement:", CFSTR("timing"));
    v12 = -[PXAnimationWriteState initWithWriteState:file:]([PXAnimationWriteState alloc], "initWithWriteState:file:", v9, v8);
    objc_msgSend(a1, "writeTimeList:state:", v11, v12);
    objc_msgSend(v17, "animation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "buildMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v17, "animation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "buildMap");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "writeBuildList:state:", v16, v12);

    }
    objc_msgSend(v8, "endElement");

  }
}

+ (id)timeNodeFillTypeMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_49, 0, &dword_22A0CC000);
  }
  if (+[PXAnimation(Private) timeNodeFillTypeMap]::onceToken != -1)
    dispatch_once(&+[PXAnimation(Private) timeNodeFillTypeMap]::onceToken, &__block_literal_global_101);
  return (id)+[PXAnimation(Private) timeNodeFillTypeMap]::sEnumerationMap;
}

void __43__PXAnimation_Private__timeNodeFillTypeMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXAnimation(Private) timeNodeFillTypeMap]::sTimeNodeFillTypeStructs, 4, 1);
  v1 = (void *)+[PXAnimation(Private) timeNodeFillTypeMap]::sEnumerationMap;
  +[PXAnimation(Private) timeNodeFillTypeMap]::sEnumerationMap = (uint64_t)v0;

}

+ (BOOL)readOptionalStringAttribute:(id)a3 fromNode:(_xmlNode *)a4 attributeMap:(id)a5 toPDDomValue:(unint64_t *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v19;

  v9 = a3;
  v10 = a5;
  v11 = (void *)CXNoNamespace;
  v12 = objc_retainAutorelease(v9);
  v19 = 0;
  v13 = CXOptionalStringAttribute(a4, v11, (xmlChar *)objc_msgSend(v12, "UTF8String"), &v19);
  v14 = v19;
  if (v13)
  {
    v15 = objc_msgSend(v10, "valueForString:", v14);
    LOBYTE(v13) = v15 != -130883970;
    if (v15 == -130883970)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PXAnimation(Private) readOptionalStringAttribute:fromNode:attributeMap:toPDDomValue:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Xml/PXAnimation.mm");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 365, 0, "Located attribute for element but failed to resolve mapping %@ to %@", v12, v14);

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    *a6 = v15;
  }

  return v13;
}

+ (id)timeNodeTypeMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_123, 0, &dword_22A0CC000);
  }
  if (+[PXAnimation(Private) timeNodeTypeMap]::onceToken != -1)
    dispatch_once(&+[PXAnimation(Private) timeNodeTypeMap]::onceToken, &__block_literal_global_124);
  return (id)+[PXAnimation(Private) timeNodeTypeMap]::sEnumerationMap;
}

void __39__PXAnimation_Private__timeNodeTypeMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXAnimation(Private) timeNodeTypeMap]::sTimeNodeTypeMapStructs, 9, 1);
  v1 = (void *)+[PXAnimation(Private) timeNodeTypeMap]::sEnumerationMap;
  +[PXAnimation(Private) timeNodeTypeMap]::sEnumerationMap = (uint64_t)v0;

}

+ (id)presetClassMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_137_0, 0, &dword_22A0CC000);
  }
  if (+[PXAnimation(Private) presetClassMap]::onceToken != -1)
    dispatch_once(&+[PXAnimation(Private) presetClassMap]::onceToken, &__block_literal_global_138);
  return (id)+[PXAnimation(Private) presetClassMap]::sEnumerationMap;
}

void __38__PXAnimation_Private__presetClassMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXAnimation(Private) presetClassMap]::sPresetClassStructs, 6, 1);
  v1 = (void *)+[PXAnimation(Private) presetClassMap]::sEnumerationMap;
  +[PXAnimation(Private) presetClassMap]::sEnumerationMap = (uint64_t)v0;

}

+ (id)restartTypeMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_145, 0, &dword_22A0CC000);
  }
  if (+[PXAnimation(Private) restartTypeMap]::onceToken != -1)
    dispatch_once(&+[PXAnimation(Private) restartTypeMap]::onceToken, &__block_literal_global_146);
  return (id)+[PXAnimation(Private) restartTypeMap]::sEnumerationMap;
}

void __38__PXAnimation_Private__restartTypeMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXAnimation(Private) restartTypeMap]::sRestartTypeStructs, 3, 1);
  v1 = (void *)+[PXAnimation(Private) restartTypeMap]::sEnumerationMap;
  +[PXAnimation(Private) restartTypeMap]::sEnumerationMap = (uint64_t)v0;

}

+ (void)readConditionList:(_xmlNode *)a3 arrayOfConditions:(id)a4 drawingState:(id)a5
{
  id v8;
  _xmlNode *i;
  PDTimeCondition *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"cond"))
    {
      v10 = objc_alloc_init(PDTimeCondition);
      objc_msgSend(a1, "readCondition:timeCondition:drawingState:", i, v10, v8);
      objc_msgSend(v11, "addObject:", v10);

    }
  }

}

+ (id)triggerEventMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_193, 0, &dword_22A0CC000);
  }
  if (+[PXAnimation(Private) triggerEventMap]::onceToken != -1)
    dispatch_once(&+[PXAnimation(Private) triggerEventMap]::onceToken, &__block_literal_global_194);
  return (id)+[PXAnimation(Private) triggerEventMap]::sEnumerationMap;
}

void __39__PXAnimation_Private__triggerEventMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXAnimation(Private) triggerEventMap]::sTriggerEventStructs, 10, 1);
  v1 = (void *)+[PXAnimation(Private) triggerEventMap]::sEnumerationMap;
  +[PXAnimation(Private) triggerEventMap]::sEnumerationMap = (uint64_t)v0;

}

+ (id)chartBuildStepMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_239, 0, &dword_22A0CC000);
  }
  if (+[PXAnimation(Private) chartBuildStepMap]::onceToken != -1)
    dispatch_once(&+[PXAnimation(Private) chartBuildStepMap]::onceToken, &__block_literal_global_240);
  return (id)+[PXAnimation(Private) chartBuildStepMap]::sEnumerationMap;
}

void __41__PXAnimation_Private__chartBuildStepMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXAnimation(Private) chartBuildStepMap]::sChartBuildStepStructs, 8, 1);
  v1 = (void *)+[PXAnimation(Private) chartBuildStepMap]::sEnumerationMap;
  +[PXAnimation(Private) chartBuildStepMap]::sEnumerationMap = (uint64_t)v0;

}

+ (void)readChartBuildStep:(id)a3 chartTarget:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "chartBuildStepMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "valueForString:", v9);

  if (v8 != -130883970)
    objc_msgSend(v6, "setBuildStep:", v8);

}

+ (id)chartTypeMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_241, 0, &dword_22A0CC000);
  }
  if (+[PXAnimation(Private) chartTypeMap]::onceToken != -1)
    dispatch_once(&+[PXAnimation(Private) chartTypeMap]::onceToken, &__block_literal_global_242);
  return (id)+[PXAnimation(Private) chartTypeMap]::sEnumerationMap;
}

void __36__PXAnimation_Private__chartTypeMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXAnimation(Private) chartTypeMap]::sChartTypeStructs, 5, 1);
  v1 = (void *)+[PXAnimation(Private) chartTypeMap]::sEnumerationMap;
  +[PXAnimation(Private) chartTypeMap]::sEnumerationMap = (uint64_t)v0;

}

+ (void)readChartType:(id)a3 oleChartTarget:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "chartTypeMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "valueForString:", v9);

  if (v8 != -130883970)
    objc_msgSend(v6, "setChartSubElementType:", v8);

}

+ (id)readAnimVariant:(_xmlNode *)a3 drawingState:(id)a4
{
  void *v5;
  void *v6;
  CXNamespace *v7;
  _xmlNode *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  _xmlNode *v12;
  CXNamespace *v13;
  _xmlNode *v14;
  uint64_t v15;
  CXNamespace *v16;
  _xmlNode *v17;
  CXNamespace *v18;
  uint64_t v20;
  id v21;

  objc_msgSend(a4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "PXPresentationMLNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = (_xmlNode *)OCXFindChild(a3, v7, "strVal");

  if (!v8)
  {
    objc_msgSend(v6, "PXPresentationMLNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v14 = (_xmlNode *)OCXFindChild(a3, v13, "BOOLVal");

    if (v14)
    {
      LOBYTE(v20) = 0;
      if (CXOptionalBoolAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", (BOOL *)&v20))
      {
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v20, "B");
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v12 = (_xmlNode *)v15;
        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v6, "PXPresentationMLNamespace");
      v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v17 = (_xmlNode *)OCXFindChild(a3, v16, "intVal");

      if (v17)
      {
        v20 = 0;
        if (CXOptionalLongAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v20))
        {
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v20, "q");
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
      }
      else
      {
        objc_msgSend(v6, "PXPresentationMLNamespace");
        v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v12 = (_xmlNode *)OCXFindChild(a3, v18, "fltVal");

        if (!v12)
          goto LABEL_17;
        v20 = 0;
        if (CXOptionalDoubleAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", (double *)&v20))
        {
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v20, "d");
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
      }
    }
    v12 = 0;
    goto LABEL_17;
  }
  v21 = 0;
  v9 = CXOptionalStringAttribute(v8, (void *)CXNoNamespace, (xmlChar *)"val", &v21);
  v10 = v21;
  v11 = v10;
  if (v9)
    v12 = (_xmlNode *)v10;
  else
    v12 = 0;

LABEL_17:
  return v12;
}

+ (id)sequentialPreviousActionMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_291_0, 0, &dword_22A0CC000);
  }
  if (+[PXAnimation(Private) sequentialPreviousActionMap]::onceToken != -1)
    dispatch_once(&+[PXAnimation(Private) sequentialPreviousActionMap]::onceToken, &__block_literal_global_292);
  return (id)+[PXAnimation(Private) sequentialPreviousActionMap]::sEnumerationMap;
}

void __51__PXAnimation_Private__sequentialPreviousActionMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXAnimation(Private) sequentialPreviousActionMap]::sSequentialPreviousActionStructs, 2, 1);
  v1 = (void *)+[PXAnimation(Private) sequentialPreviousActionMap]::sEnumerationMap;
  +[PXAnimation(Private) sequentialPreviousActionMap]::sEnumerationMap = (uint64_t)v0;

}

+ (id)sequentialNextActionMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_295_0, 0, &dword_22A0CC000);
  }
  if (+[PXAnimation(Private) sequentialNextActionMap]::onceToken != -1)
    dispatch_once(&+[PXAnimation(Private) sequentialNextActionMap]::onceToken, &__block_literal_global_296);
  return (id)+[PXAnimation(Private) sequentialNextActionMap]::sEnumerationMap;
}

void __47__PXAnimation_Private__sequentialNextActionMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXAnimation(Private) sequentialNextActionMap]::sSequentialNextActionStructs, 2, 1);
  v1 = (void *)+[PXAnimation(Private) sequentialNextActionMap]::sEnumerationMap;
  +[PXAnimation(Private) sequentialNextActionMap]::sEnumerationMap = (uint64_t)v0;

}

+ (id)readOleChartBuild:(_xmlNode *)a3
{
  uint64_t v5;
  void *v6;
  PDChartBuild *v7;

  v5 = CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"animBg", 0);
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bld", (NSString *)CFSTR("allAtOnce"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PDChartBuild initWithBuildType:]([PDChartBuild alloc], "initWithBuildType:", objc_msgSend(a1, "readChartBuildType:", v6));
  -[PDBuild setIsAnimateBackground:](v7, "setIsAnimateBackground:", v5);

  return v7;
}

+ (id)readGraphicBuild:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  uint64_t v10;
  PDChartBuild *v11;
  CXNamespace *v12;
  _xmlNode *v13;
  CXNamespace *v14;
  uint64_t v15;
  CXNamespace *v16;
  _xmlNode *v17;
  uint64_t v18;
  void *v19;

  v6 = a4;
  objc_msgSend(v6, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "PXPresentationMLNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "bldAsOne");

  if (!v10 || (v11 = objc_alloc_init(PDBuild)) == 0)
  {
    objc_msgSend(v8, "PXPresentationMLNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v13 = (_xmlNode *)OCXFindChild(a3, v12, "bldSub");

    if (!v13)
      goto LABEL_8;
    objc_msgSend(v8, "PXPresentationMLNamespace");
    v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v15 = OCXFindChild(v13, v14, "bldDmg");

    if (!v15 || (v11 = objc_alloc_init(PDDiagramBuild)) == 0)
    {
      objc_msgSend(v6, "OAXMainNamespace");
      v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v17 = (_xmlNode *)OCXFindChild(v13, v16, "bldChart");

      if (v17)
      {
        v18 = CXDefaultLongAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"animBg", 1);
        CXDefaultStringAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"bld", (NSString *)CFSTR("allAtOnce"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[PDChartBuild initWithBuildType:]([PDChartBuild alloc], "initWithBuildType:", objc_msgSend(a1, "readChartBuildType:", v19));
        -[PDBuild setIsAnimateBackground:](v11, "setIsAnimateBackground:", v18 > 0);

        goto LABEL_9;
      }
LABEL_8:
      v11 = 0;
    }
  }
LABEL_9:

  return v11;
}

@end
