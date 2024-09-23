@implementation PXTransition

+ (void)readTransitionFromNode:(_xmlNode *)a3 tgtTransition:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  _xmlNode *v10;
  _xmlNode *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  _xmlNode *v16;
  PDOrientationOptions *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _xmlNode *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;

  v8 = a4;
  v9 = a5;
  v44 = v8;
  objc_msgSend(v8, "setType:", 0);
  v42 = a3;
  v43 = v9;
  v10 = OCXFirstChild(a3);
  v11 = 0;
  while (v10)
  {
    if (xmlStrEqual(v10->name, (const xmlChar *)"sndAc"))
    {
      v12 = 0;
    }
    else
    {
      if (xmlStrEqual(v10->name, (const xmlChar *)"prstTrans"))
        CXRequiredStringAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst");
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10->name, 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v12, "length", v42, v43))
    {
      objc_msgSend(a1, "transitionNodeMap");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "valueForString:", v12);

      if (v14 != -130883970)
      {
        objc_msgSend(v8, "setType:", v14);
        v11 = v10;
      }
    }

    v10 = OCXNextSibling(v10);
  }
  v15 = objc_msgSend(v8, "type");
  v16 = v42;
  v17 = 0;
  switch(v15)
  {
    case 0:
      break;
    case 2:
    case 3:
    case 5:
    case 14:
    case 38:
    case 51:
      v18 = objc_msgSend(a1, "readOrientation:attribute:defaultValue:", v11, "dir", 0);
      v17 = objc_alloc_init(PDOrientationOptions);
      -[PDOrientationOptions setOrientation:](v17, "setOrientation:", v18);
      break;
    case 6:
    case 18:
    case 23:
    case 30:
    case 36:
    case 44:
    case 52:
      v37 = objc_msgSend(a1, "readDirection:defaultValue:", v11, 1);
      v17 = objc_alloc_init(PDSideDirectionOptions);
      -[PDOrientationOptions setDirection:](v17, "setDirection:", v37);
      break;
    case 7:
    case 35:
    case 40:
    case 45:
      if (v15 == 40)
        v19 = 8;
      else
        v19 = 1;
      v20 = objc_msgSend(a1, "readDirection:defaultValue:", v11, v19, v42, v43);
      v17 = objc_alloc_init(PDEightDirectionOptions);
      -[PDOrientationOptions setDirection:](v17, "setDirection:", v20);
      break;
    case 9:
    case 34:
      v26 = objc_msgSend(a1, "readDirection:defaultValue:", v11, 1);
      v17 = objc_alloc_init(PDPrismOptions);
      -[PDOrientationOptions setDirection:](v17, "setDirection:", v26);
      v27 = CXDefaultBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"isContent", 0);
      v28 = CXDefaultBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"isInverted", 0);
      -[PDOrientationOptions setIsContent:](v17, "setIsContent:", v27);
      -[PDOrientationOptions setIsInverted:](v17, "setIsInverted:", v28);
      break;
    case 11:
    case 16:
      v29 = CXDefaultBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"thruBlk", 0);
      v17 = objc_alloc_init(PDBlackOptions);
      -[PDOrientationOptions setIsThroughBlack:](v17, "setIsThroughBlack:", v29);
      break;
    case 19:
      v17 = objc_alloc_init(PDInOutDirectionOptions);
      -[PDOrientationOptions setInOut:](v17, "setInOut:", 1);
      break;
    case 20:
      v30 = objc_msgSend(a1, "readDirection:defaultValue:", v11, 1);
      v17 = objc_alloc_init(PDEightDirectionOptions);
      -[PDOrientationOptions setDirection:](v17, "setDirection:", v30);
      break;
    case 21:
    case 41:
    case 46:
    case 53:
      v22 = v15 != 21 && v15 != 41;
      v23 = objc_msgSend(a1, "readInOut:defaultValue:", v11, v22, v42, v43);
      v17 = objc_alloc_init(PDInOutDirectionOptions);
      -[PDOrientationOptions setInOut:](v17, "setInOut:", v23);
      break;
    case 24:
      v31 = objc_msgSend(a1, "readReverseDirection:defaultValue:", v11, 3);
      v17 = objc_alloc_init(PDEightDirectionOptions);
      -[PDOrientationOptions setDirection:](v17, "setDirection:", v31);
      break;
    case 25:
    case 49:
      v17 = objc_alloc_init(PDRotationOptions);
      -[PDOrientationOptions setDirection:](v17, "setDirection:", 1);
      break;
    case 28:
    case 29:
    case 31:
    case 50:
      v24 = CXDefaultBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"invX", 0);
      v25 = CXDefaultBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"invY", 0);
      v17 = objc_alloc_init(PDInvertCoordinateOptions);
      -[PDOrientationOptions setIsInvX:](v17, "setIsInvX:", v24);
      -[PDOrientationOptions setIsInvY:](v17, "setIsInvY:", v25);
      break;
    case 39:
      v32 = objc_msgSend(a1, "readDirection:defaultValue:", v11, 1);
      v17 = objc_alloc_init(PDRevealOptions);
      -[PDOrientationOptions setDirection:](v17, "setDirection:", v32);
      -[PDOrientationOptions setIsThroughBlack:](v17, "setIsThroughBlack:", CXDefaultBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"thruBlk", 0));
      break;
    case 42:
      v33 = objc_msgSend(a1, "readOrientation:attribute:defaultValue:", v11, "orient", 0);
      v34 = objc_msgSend(a1, "readInOut:defaultValue:", v11, 1);
      v17 = objc_alloc_init(PDSplitDirectionOptions);
      -[PDOrientationOptions setInOut:](v17, "setInOut:", v34);
      -[PDOrientationOptions setOrientation:](v17, "setOrientation:", v33);
      break;
    case 43:
      v35 = objc_msgSend(a1, "readDirection:defaultValue:", v11, 4);
      v17 = objc_alloc_init(PDCornerDirectionOptions);
      -[PDOrientationOptions setDirection:](v17, "setDirection:", v35);
      break;
    case 48:
      v36 = CXDefaultLongAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"spokes", 4);
      v17 = objc_alloc_init(PDWheelDirectionOptions);
      -[PDOrientationOptions setSpokes:](v17, "setSpokes:", v36);
      break;
    default:
      v17 = objc_alloc_init(PDTransitionOptions);
      break;
  }
  v47 = 1;
  if (CXOptionalBoolAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"advClick", &v47))
    objc_msgSend(v44, "setIsAdvanceOnClick:", v47);
  CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"spd", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    if ((objc_msgSend(v38, "isEqualToString:", CFSTR("slow")) & 1) != 0)
    {
      v40 = 2;
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("med")) & 1) != 0)
    {
      v40 = 1;
    }
    else
    {
      objc_msgSend(v39, "isEqualToString:", CFSTR("fast"));
      v40 = 0;
    }
    objc_msgSend(v44, "setSpeed:", v40, v42);
  }
  v46 = 0;
  if (CXOptionalLongAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"advTm", &v46))
    objc_msgSend(v44, "setAdvanceAfterTime:", v46);
  v45 = 0;
  if (CXOptionalLongAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"dur", &v45))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v45 / 1000.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setDuration:", v41);

  }
  objc_msgSend(v44, "setOptions:", v17, v42);

}

+ (int)readDirection:(_xmlNode *)a3 defaultValue:(int)a4
{
  _BOOL4 v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  v6 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"dir", &v10);
  v7 = v10;
  if (v6)
  {
    objc_msgSend(a1, "directionAttributeMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = objc_msgSend(v8, "valueForString:", v7);

  }
  return a4;
}

+ (int)readInOut:(_xmlNode *)a3 defaultValue:(int)a4
{
  _BOOL4 v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  v5 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"dir", &v9);
  v6 = v9;
  v7 = v6;
  if (v5)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("out")) & 1) != 0)
    {
      a4 = 1;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("in")))
    {
      a4 = 0;
    }
  }

  return a4;
}

+ (int)readOrientation:(_xmlNode *)a3 attribute:(const char *)a4 defaultValue:(int)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  v6 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)a4, &v10);
  v7 = v10;
  v8 = v7;
  if (v6)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("horz")) & 1) != 0)
    {
      a5 = 0;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("vert")))
    {
      a5 = 1;
    }
  }

  return a5;
}

+ (TCEnumerationMap)transitionNodeMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_52, 0, &dword_22A0CC000);
  }
  if (+[PXTransition transitionNodeMap]::onceToken != -1)
    dispatch_once(&+[PXTransition transitionNodeMap]::onceToken, &__block_literal_global_104);
  return (TCEnumerationMap *)(id)+[PXTransition transitionNodeMap]::sTransitionNodeMap;
}

void __33__PXTransition_transitionNodeMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXTransition transitionNodeMap]::sTransitionNodeStructs, 53, 1);
  v1 = (void *)+[PXTransition transitionNodeMap]::sTransitionNodeMap;
  +[PXTransition transitionNodeMap]::sTransitionNodeMap = (uint64_t)v0;

}

+ (TCEnumerationMap)directionAttributeMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_122_0, 0, &dword_22A0CC000);
  }
  if (+[PXTransition directionAttributeMap]::onceToken != -1)
    dispatch_once(&+[PXTransition directionAttributeMap]::onceToken, &__block_literal_global_123_0);
  return (TCEnumerationMap *)(id)+[PXTransition directionAttributeMap]::sDirectionAttributeMap;
}

void __37__PXTransition_directionAttributeMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXTransition directionAttributeMap]::sDirectionAttributeStructs, 8, 1);
  v1 = (void *)+[PXTransition directionAttributeMap]::sDirectionAttributeMap;
  +[PXTransition directionAttributeMap]::sDirectionAttributeMap = (uint64_t)v0;

}

+ (TCEnumerationMap)reverseDirectionAttributeMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_124, 0, &dword_22A0CC000);
  }
  if (+[PXTransition reverseDirectionAttributeMap]::onceToken != -1)
    dispatch_once(&+[PXTransition reverseDirectionAttributeMap]::onceToken, &__block_literal_global_125);
  return (TCEnumerationMap *)(id)+[PXTransition reverseDirectionAttributeMap]::sReverseDirectionAttributeMap;
}

void __44__PXTransition_reverseDirectionAttributeMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXTransition reverseDirectionAttributeMap]::sReverseDirectionAttributeStructs, 8, 1);
  v1 = (void *)+[PXTransition reverseDirectionAttributeMap]::sReverseDirectionAttributeMap;
  +[PXTransition reverseDirectionAttributeMap]::sReverseDirectionAttributeMap = (uint64_t)v0;

}

+ (BOOL)isPowerPoint2010TransitionType:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  unsigned int v16;
  void *v17;
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
  void *v33;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)+[PXTransition isPowerPoint2010TransitionType:]::ppt2010TransitionTypes;
  if (!+[PXTransition isPowerPoint2010TransitionType:]::ppt2010TransitionTypes)
  {
    v5 = objc_alloc(MEMORY[0x24BDBCF20]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 14);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 51);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 40);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 45);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 41);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 46);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 53);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 44);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 39);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 34);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 49);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "initWithObjects:", v33, v25, v29, v24, v7, v8, v31, v30, v32, v23, v9, v22, v28, v27, v21, v20, v26,
            v19,
            v18,
            v17,
            v10,
            0);
    v12 = (void *)+[PXTransition isPowerPoint2010TransitionType:]::ppt2010TransitionTypes;
    +[PXTransition isPowerPoint2010TransitionType:]::ppt2010TransitionTypes = v11;

    v4 = (void *)+[PXTransition isPowerPoint2010TransitionType:]::ppt2010TransitionTypes;
    v3 = v16;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "containsObject:", v13);

  return v14;
}

+ (BOOL)isPowerPoint2013TransitionType:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)+[PXTransition isPowerPoint2013TransitionType:]::ppt2013TransitionTypes;
  if (!+[PXTransition isPowerPoint2013TransitionType:]::ppt2013TransitionTypes)
  {
    v5 = objc_alloc(MEMORY[0x24BDBCF20]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 17);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 50);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)v8;
    v21 = v8;
    v20 = v6;
    v13 = (void *)v6;
    v14 = v12;
    v15 = objc_msgSend(v5, "initWithObjects:", v29, v28, v20, v7, v27, v21, v9, v26, v25, v10, v24, v23, v11, 0);
    v16 = (void *)+[PXTransition isPowerPoint2013TransitionType:]::ppt2013TransitionTypes;
    +[PXTransition isPowerPoint2013TransitionType:]::ppt2013TransitionTypes = v15;

    v4 = (void *)+[PXTransition isPowerPoint2013TransitionType:]::ppt2013TransitionTypes;
    v3 = v22;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "containsObject:", v17);

  return v18;
}

+ (void)writeTransitionOptions:(id)a3 transitionType:(int)a4 file:(id)a5
{
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;

  v8 = a3;
  v9 = a5;
  v32 = 0;
  v10 = objc_msgSend(a1, "mapDirection:outDir:", v8, &v32);
  switch(a4)
  {
    case 2:
      v21 = objc_opt_class();
      TSUDynamicCast(v21, (uint64_t)v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v22;
      if (v22)
        objc_msgSend(a1, "writeReverseOrientation:withAttributeName:file:", objc_msgSend(v22, "orientation"), CFSTR("dir"), v9);
      goto LABEL_37;
    case 3:
    case 5:
    case 14:
    case 38:
    case 51:
      v12 = objc_opt_class();
      TSUDynamicCast(v12, (uint64_t)v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        objc_msgSend(a1, "writeOrientation:withAttributeName:file:", objc_msgSend(v13, "orientation"), CFSTR("dir"), v9);
      goto LABEL_37;
    case 6:
    case 7:
    case 9:
    case 18:
    case 23:
    case 30:
    case 35:
    case 36:
    case 40:
    case 43:
    case 44:
    case 45:
    case 52:
      if (!v10)
        break;
      v11 = v32;
      goto LABEL_4;
    case 11:
    case 16:
      v17 = objc_opt_class();
      TSUDynamicCast(v17, (uint64_t)v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v18;
      if (v18)
        goto LABEL_10;
      goto LABEL_37;
    case 19:
    case 41:
    case 53:
      v15 = objc_opt_class();
      TSUDynamicCast(v15, (uint64_t)v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16;
      if (v16)
        objc_msgSend(a1, "writeInOut:file:", objc_msgSend(v16, "inOut"), v9);
      goto LABEL_37;
    case 20:
      if (!v10)
        break;
      v11 = v32;
      if ((v32 & 0xFFFFFFFD) != 1)
      {
        v11 = 1;
        v32 = 1;
      }
LABEL_4:
      objc_msgSend(a1, "writeDirection:file:", v11, v9);
      break;
    case 21:
    case 46:
      v19 = objc_opt_class();
      TSUDynamicCast(v19, (uint64_t)v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v20;
      if (v20)
        objc_msgSend(a1, "writeReverseInOut:file:", objc_msgSend(v20, "inOut"), v9);
      goto LABEL_37;
    case 24:
      if (v10)
        objc_msgSend(a1, "writeReverseDirection:file:", v32, v9);
      break;
    case 31:
      v23 = objc_opt_class();
      TSUDynamicCast(v23, (uint64_t)v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      if (v24)
      {
        if (objc_msgSend(v24, "isInvX"))
          objc_msgSend(v9, "writeAttribute:BOOLContent:", CFSTR("invX"), 1);
        if (objc_msgSend(v14, "isInvY"))
          objc_msgSend(v9, "writeAttribute:BOOLContent:", CFSTR("invY"), 1);
      }
      goto LABEL_37;
    case 34:
      if (v10)
        objc_msgSend(a1, "writeDirection:file:", v32, v9);
      v25 = objc_opt_class();
      TSUDynamicCast(v25, (uint64_t)v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v26;
      if (v26)
      {
        objc_msgSend(v9, "writeAttribute:BOOLContent:", CFSTR("isContent"), objc_msgSend(v26, "isContent"));
        objc_msgSend(v9, "writeAttribute:BOOLContent:", CFSTR("isInverted"), objc_msgSend(v14, "isInverted"));
      }
      goto LABEL_37;
    case 39:
      if (v10)
        objc_msgSend(a1, "writeDirection:file:", v32, v9);
      v27 = objc_opt_class();
      TSUDynamicCast(v27, (uint64_t)v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v18;
      if (v18)
LABEL_10:
        objc_msgSend(v9, "writeAttribute:BOOLContent:", CFSTR("thruBlk"), objc_msgSend(v18, "isThroughBlack"));
      goto LABEL_37;
    case 42:
      v28 = objc_opt_class();
      TSUDynamicCast(v28, (uint64_t)v8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v29;
      if (v29)
      {
        objc_msgSend(a1, "writeOrientation:withAttributeName:file:", objc_msgSend(v29, "orientation"), CFSTR("orient"), v9);
        objc_msgSend(a1, "writeInOut:file:", objc_msgSend(v14, "inOut"), v9);
      }
      goto LABEL_37;
    case 48:
      v30 = objc_opt_class();
      TSUDynamicCast(v30, (uint64_t)v8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v31;
      if (v31)
        objc_msgSend(v9, "writeAttribute:intContent:", CFSTR("spokes"), (int)objc_msgSend(v31, "spokes"));
LABEL_37:

      break;
    default:
      break;
  }

}

+ (void)writeTransitionFromSlideBase:(id)a3 file:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v7 = a4;
  objc_msgSend(v26, "transition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "hasType") & 1) != 0)
  {
    v10 = objc_msgSend(v9, "type");
    if ((_DWORD)v10)
    {
      objc_msgSend(v7, "startElement:prefix:ns:", CFSTR("AlternateContent"), CFSTR("mc"), objc_msgSend((id)OCXMarkupCompatibilityNamespace, "uri"));
      v11 = objc_msgSend(v9, "hasTransitionOptions");
      if (objc_msgSend(a1, "isPowerPoint2013TransitionType:", v10))
      {
        objc_msgSend(v7, "startElement:prefix:ns:", CFSTR("Choice"), CFSTR("mc"), 0);
        objc_msgSend(v7, "writeNamespace:uri:", CFSTR("p15"), objc_msgSend((id)PXPowerPoint2012Namespace, "uri"));
        objc_msgSend(v7, "writeAttribute:content:prefix:ns:", CFSTR("Requires"), CFSTR("p15"), 0, 0);
        objc_msgSend(v7, "startElement:", CFSTR("transition"));
        objc_msgSend(v7, "writeNamespace:uri:", CFSTR("p14"), objc_msgSend((id)PXPowerPoint2010Namespace, "uri"));
        objc_msgSend(a1, "writeTransitionAttributes:attributePrefix:file:", v9, CFSTR("p14"), v7);
        objc_msgSend(v7, "startElement:prefix:ns:", CFSTR("prstTrans"), CFSTR("p15"), 0);
        objc_msgSend(a1, "transitionNodeMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringForValue:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "writeAttribute:content:", CFSTR("prst"), v13);

        if (v11)
        {
          objc_msgSend(v9, "options");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "writeTransitionOptions:transitionType:file:", v14, v10, v7);
        }
        else
        {
          v14 = 0;
        }
        objc_msgSend(v7, "endElement");
        objc_msgSend(v7, "endElement");
        objc_msgSend(v7, "endElement");
        objc_msgSend(v26, "ppt2011Transition");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16 || (objc_msgSend(v26, "ppt2011Transition"), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v15 = 0;
LABEL_26:
          objc_msgSend(v7, "startElement:prefix:ns:", CFSTR("Fallback"), CFSTR("mc"), 0);
          objc_msgSend(v7, "startElement:", CFSTR("transition"));
          objc_msgSend(v26, "transition");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "writeTransitionAttributes:attributePrefix:file:", v23, 0, v7);

          objc_msgSend(a1, "transitionNodeMap");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringForValue:", 16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "startElement:", v25);

          objc_msgSend(v7, "endElement");
          objc_msgSend(v7, "endElement");
          objc_msgSend(v7, "endElement");
          objc_msgSend(v7, "endElement");

          goto LABEL_27;
        }
        v15 = (id)v17;
      }
      else
      {
        v15 = v9;
        v14 = 0;
      }
      v18 = objc_msgSend(v15, "type");
      objc_msgSend(v7, "startElement:prefix:ns:", CFSTR("Choice"), CFSTR("mc"), 0);
      objc_msgSend(v7, "writeNamespace:uri:", CFSTR("p14"), objc_msgSend((id)PXPowerPoint2010Namespace, "uri"));
      objc_msgSend(v7, "writeAttribute:content:prefix:ns:", CFSTR("Requires"), CFSTR("p14"), 0, 0);
      objc_msgSend(v7, "startElement:", CFSTR("transition"));
      objc_msgSend(a1, "writeTransitionAttributes:attributePrefix:file:", v15, CFSTR("p14"), v7);
      if (objc_msgSend(a1, "isPowerPoint2010TransitionType:", v18))
      {
        if ((_DWORD)v18 == 53)
          v19 = 46;
        else
          v19 = v18;
        if (v19 == 9)
          v18 = 34;
        else
          v18 = v19;
        objc_msgSend(a1, "transitionNodeMap");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringForValue:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "startElement:prefix:ns:", v21, CFSTR("p14"), 0);
      }
      else
      {
        objc_msgSend(a1, "transitionNodeMap");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringForValue:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "startElement:", v21);
      }

      if (objc_msgSend(v15, "hasTransitionOptions"))
      {
        objc_msgSend(v15, "options");
        v22 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v22;
        objc_msgSend(a1, "writeTransitionOptions:transitionType:file:", v22, v18, v7);
      }
      objc_msgSend(v7, "endElement");
      objc_msgSend(v7, "endElement");
      objc_msgSend(v7, "endElement");
      goto LABEL_26;
    }
    objc_msgSend(v7, "startElement:", CFSTR("transition"));
    objc_msgSend(v7, "writeNamespace:uri:", CFSTR("p14"), objc_msgSend((id)PXPowerPoint2010Namespace, "uri"));
    objc_msgSend(a1, "writeTransitionAttributes:attributePrefix:file:", v9, CFSTR("p14"), v7);
    objc_msgSend(v7, "endElement");
  }
LABEL_27:

}

+ (int)readReverseDirection:(_xmlNode *)a3 defaultValue:(int)a4
{
  _BOOL4 v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  v6 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"dir", &v10);
  v7 = v10;
  if (v6)
  {
    objc_msgSend(a1, "reverseDirectionAttributeMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = objc_msgSend(v8, "valueForString:", v7);

  }
  return a4;
}

+ (void)writeDirection:(int)a3 file:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  objc_msgSend(a1, "directionAttributeMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForValue:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeAttribute:content:", CFSTR("dir"), v7);

}

+ (void)writeReverseDirection:(int)a3 file:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  objc_msgSend(a1, "reverseDirectionAttributeMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForValue:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeAttribute:content:", CFSTR("dir"), v7);

}

+ (void)writeOrientation:(int)a3 withAttributeName:(id)a4 file:(id)a5
{
  const __CFString *v6;

  if (a3 == 1)
    v6 = CFSTR("vert");
  else
    v6 = CFSTR("horz");
  objc_msgSend(a5, "writeAttribute:content:", a4, v6);
}

+ (void)writeReverseOrientation:(int)a3 withAttributeName:(id)a4 file:(id)a5
{
  const __CFString *v6;

  if (a3 == 1)
    v6 = CFSTR("horz");
  else
    v6 = CFSTR("vert");
  objc_msgSend(a5, "writeAttribute:content:", a4, v6);
}

+ (void)writeInOut:(int)a3 file:(id)a4
{
  const __CFString *v5;

  if (a3)
    v5 = CFSTR("out");
  else
    v5 = CFSTR("in");
  objc_msgSend(a4, "writeAttribute:content:", CFSTR("dir"), v5);
}

+ (void)writeReverseInOut:(int)a3 file:(id)a4
{
  const __CFString *v5;

  if (a3)
    v5 = CFSTR("in");
  else
    v5 = CFSTR("out");
  objc_msgSend(a4, "writeAttribute:content:", CFSTR("dir"), v5);
}

+ (BOOL)mapDirection:(id)a3 outDir:(int *)a4
{
  id v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = 0;
  if (v5 && a4)
  {
    v7 = objc_opt_class();
    TSUDynamicCast(v7, (uint64_t)v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      *a4 = objc_msgSend(v8, "direction");
      v6 = 1;
    }
    else
    {
      v10 = objc_opt_class();
      TSUDynamicCast(v10, (uint64_t)v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        *a4 = objc_msgSend(v11, "direction");
        v6 = 1;
      }
      else
      {
        v13 = objc_opt_class();
        TSUDynamicCast(v13, (uint64_t)v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v6 = v14 != 0;
        if (v14)
          *a4 = objc_msgSend(v14, "direction");

      }
    }

  }
  return v6;
}

+ (void)writeTransitionAttributes:(id)a3 attributePrefix:(id)a4 file:(id)a5
{
  id v7;
  id v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  id v19;

  v19 = a3;
  v7 = a4;
  v8 = a5;
  if (v19)
  {
    if (objc_msgSend(v19, "hasSpeed"))
    {
      v9 = objc_msgSend(v19, "speed");
      v10 = CFSTR("fast");
      if (v9 == 1)
        v10 = CFSTR("med");
      if (v9 == 2)
        v11 = CFSTR("slow");
      else
        v11 = v10;
      objc_msgSend(v8, "writeAttribute:content:", CFSTR("spd"), v11);
    }
    if (v7)
    {
      if (objc_msgSend(v19, "hasIsAdvanceOnClick"))
      {
        v12 = objc_msgSend(v19, "isAdvanceOnClick");
        objc_msgSend(v8, "writeAttribute:BOOLContent:", CFSTR("advClick"), v12);
        if ((v12 & 1) == 0)
        {
          if (objc_msgSend(v19, "hasAdvanceAfterTime"))
            objc_msgSend(v8, "writeAttribute:intContent:", CFSTR("advTm"), (int)objc_msgSend(v19, "advanceAfterTime"));
        }
      }
      objc_msgSend(v19, "duration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = objc_msgSend(v19, "type");

        if (v14)
        {
          objc_msgSend(v8, "currentElementPrefix");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (id)objc_msgSend(v8, "pushStateWithElementPrefix:attributePrefix:", v15, v7);

          objc_msgSend(v19, "duration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          objc_msgSend(v8, "writeAttribute:intContent:", CFSTR("dur"), (uint64_t)(v18 * 1000.0));

          objc_msgSend(v8, "popState");
        }
      }
    }
  }

}

@end
