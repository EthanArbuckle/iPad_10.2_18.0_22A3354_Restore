@implementation OABShapeGeometry

+ (void)readFromShape:(void *)a3 toShape:(id)a4
{
  id v6;
  EshShapeProperties *v7;
  unsigned int ShapeType;
  EshPath *v9;
  uint64_t v10;
  char isPathTypeSet;
  char v12;
  int isCoordBottomSet;
  EshGeometryProperties *v14;
  uint64_t Vertices;
  EshPathParamTable *v16;
  uint64_t Segments;
  uint64_t *v18;
  uint64_t Formulas;
  uint64_t *v20;
  uint64_t Inscribes;
  uint64_t *v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t i;
  char v28;
  OADCustomShapeGeometry *v29;
  uint64_t *v30;
  uint64_t *TextBoxRects;
  int32x2_t v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  _DWORD v37[20];
  int v38;
  int v39;

  v6 = a4;
  v7 = (EshShapeProperties *)((char *)a3 + 424);
  ShapeType = EshShapeProperties::getShapeType((EshShapeProperties *)((char *)a3 + 424));
  v9 = (EshPath *)((char *)a3 + 528);
  if (ShapeType == 100)
    v10 = 99;
  else
    v10 = ShapeType;
  if ((EshPath::isParamsSet(v9) & 1) != 0
    || (EshPath::isCommandsSet(v9) & 1) != 0
    || ((isPathTypeSet = EshPath::isPathTypeSet(v9), (_DWORD)v10 != 20) ? (v12 = isPathTypeSet) : (v12 = 0),
        (v12 & 1) != 0
     || (EshPath::isFormulasSet(v9) & 1) != 0
     || (EshPath::isTextBoxRectsSet(v9) & 1) != 0
     || (EshPath::isLimoXSet(v9) & 1) != 0
     || (EshPath::isLimoYSet(v9) & 1) != 0
     || (EshShapeProperties::isCoordLeftSet(v7) & 1) != 0
     || (EshShapeProperties::isCoordTopSet(v7) & 1) != 0
     || (EshShapeProperties::isCoordRightSet(v7) & 1) != 0))
  {
    isCoordBottomSet = 1;
    if (!(_DWORD)v10)
      goto LABEL_51;
  }
  else
  {
    isCoordBottomSet = EshShapeProperties::isCoordBottomSet(v7);
    if (!(_DWORD)v10)
      goto LABEL_51;
  }
  if (isCoordBottomSet)
  {
    EshGeometryProperties::EshGeometryProperties((EshGeometryProperties *)&v32);
    if (EshShapeLib::cloneShapeProperties((EshShapeLib *)(unsigned __int16)v10, &v32, v14))
    {
      EshGeometryProperties::addImpliedSegments(&v32);
      if ((EshPath::isParamsSet(v9) & 1) == 0)
      {
        Vertices = EshGeometryProperties::getVertices((EshGeometryProperties *)&v32);
        v16 = (EshPathParamTable *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)Vertices + 16))(Vertices);
        EshPath::takeParams(v9, v16);
      }
      if ((EshPath::isCommandsSet(v9) & 1) == 0
        && (!EshPath::isPathTypeSet(v9) || EshPath::getPathType(v9) == 4)
        && EshGeometryProperties::getSegments((EshGeometryProperties *)&v32))
      {
        Segments = EshGeometryProperties::getSegments((EshGeometryProperties *)&v32);
        v18 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)Segments + 16))(Segments);
        EshPath::takeCommands((uint64_t)v9, v18);
      }
      if ((EshPath::isFormulasSet(v9) & 1) == 0)
      {
        Formulas = EshGeometryProperties::getFormulas((EshGeometryProperties *)&v32);
        v20 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)Formulas + 16))(Formulas);
        EshPath::takeFormulas((uint64_t)v9, v20);
      }
      if ((EshPath::isTextBoxRectsSet(v9) & 1) == 0
        && EshGeometryProperties::isInscribesSet((EshGeometryProperties *)&v32))
      {
        Inscribes = EshGeometryProperties::getInscribes((EshGeometryProperties *)&v32);
        v22 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)Inscribes + 16))(Inscribes);
        EshPath::takeTextBoxRects((uint64_t)v9, v22);
      }
      if ((EshPath::isLimoXSet(v9) & 1) == 0 && v38 != 0x7FFFFFFF)
        EshPath::setLimoX(v9, v38);
      if ((EshPath::isLimoYSet(v9) & 1) == 0 && v39 != 0x7FFFFFFF)
        EshPath::setLimoY(v9, v39);
      v24 = v33;
      v23 = v34;
      v26 = v35;
      v25 = v36;
      if ((EshShapeProperties::isCoordLeftSet(v7) & 1) == 0)
        EshShapeProperties::setCoordLeft(v7, v24);
      if ((EshShapeProperties::isCoordTopSet(v7) & 1) == 0)
        EshShapeProperties::setCoordTop(v7, v23);
      if ((EshShapeProperties::isCoordRightSet(v7) & 1) == 0)
        EshShapeProperties::setCoordRight(v7, v26);
      if ((EshShapeProperties::isCoordBottomSet(v7) & 1) == 0)
        EshShapeProperties::setCoordBottom(v7, v25);
      for (i = 0; i != 10; ++i)
      {
        if ((EshShapeProperties::isAdjSet(v7, (unsigned __int16)i) & 1) == 0)
          EshShapeProperties::setAdj(v7, (unsigned __int16)i, v37[i]);
      }
    }
    EshGeometryProperties::~EshGeometryProperties((EshGeometryProperties *)&v32);
  }
LABEL_51:
  if ((_DWORD)v10)
    v28 = isCoordBottomSet;
  else
    v28 = 1;
  if ((v28 & 1) != 0)
  {
    v29 = objc_alloc_init(OADCustomShapeGeometry);
    -[OADShapeGeometry setIsEscher:](v29, "setIsEscher:", 1);
    objc_msgSend(v6, "setGeometry:", v29);
    objc_msgSend(a1, "readAdjustValuesFromShapeProperties:toGeometry:", v7, v29);
    objc_msgSend(a1, "readGeometryCoordSpaceFromShapeProperties:toGeometry:", v7, v29);
    objc_msgSend(a1, "readLimoFromPath:toGeometry:", v9, v29);
    if (EshPath::isFormulasSet(v9))
    {
      v30 = EshPath::getFormulas(v9);
      if (v30)
        objc_msgSend(a1, "readFromFormulas:toGeometry:", v30, v29);
    }
    if (EshPath::isTextBoxRectsSet(v9))
    {
      TextBoxRects = EshPath::getTextBoxRects(v9);
      if (TextBoxRects)
        objc_msgSend(a1, "readFromTextBoxRects:toGeometry:", TextBoxRects, v29);
    }
    objc_msgSend(a1, "readPathCommandsAndParamsFromPath:toGeometry:", v9, v29);
  }
  else
  {
    v29 = objc_alloc_init(OADPresetShapeGeometry);
    -[OADShapeGeometry setIsEscher:](v29, "setIsEscher:", 1);
    objc_msgSend(v6, "setGeometry:", v29);
    -[OADCustomShapeGeometry setType:](v29, "setType:", v10);
    objc_msgSend(a1, "readAdjustValuesFromShapeProperties:toGeometry:", v7, v29);
  }

}

+ (void)readAdjustValuesFromShapeProperties:(const EshShapeProperties *)a3 toGeometry:(id)a4
{
  uint64_t v5;
  id v6;

  v6 = a4;
  v5 = 0;
  do
  {
    if (EshShapeProperties::isAdjSet((EshShapeProperties *)a3, (unsigned __int16)v5))
      objc_msgSend(v6, "setAdjustValue:atIndex:", EshShapeProperties::getAdj((EshShapeProperties *)a3, (unsigned __int16)v5), v5);
    v5 = (v5 + 1);
  }
  while ((_DWORD)v5 != 10);

}

+ (void)readFromPathCommands:(const void *)a3 pathParams:(const void *)a4 toGeometry:(id)a5
{
  uint64_t (**v8)(_QWORD);
  OADPath *v9;
  unsigned int v10;
  _WORD *v11;
  _WORD *v12;
  unsigned __int16 v13;
  int v14;
  uint64_t v15;
  OADPath *v16;
  OADLineToPathElement *v17;
  OADLineToPathElement *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  _QWORD *v44;
  unsigned int v45;
  uint64_t (**v46)(_QWORD);
  OADPath *v47;
  id v48;
  unsigned __int16 *v49;
  OADPath *v50;
  _QWORD aBlock[7];
  _QWORD v52[3];
  int v53;

  v43 = a5;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v53 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__OABShapeGeometry_readFromPathCommands_pathParams_toGeometry___block_invoke;
  aBlock[3] = &unk_24F39D548;
  aBlock[4] = v52;
  aBlock[5] = a4;
  v48 = a1;
  aBlock[6] = a1;
  v8 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
  v9 = objc_alloc_init(OADPath);
  if (((*((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1)) & 0x7FFFFFFF8) != 0)
  {
    v46 = v8;
    v47 = 0;
    v10 = 0;
    v44 = a3;
    do
    {
      v45 = v10;
      v11 = (_WORD *)EshBasicTablePropVal<EshComputedValue>::operator[]((uint64_t)a3, v10);
      v50 = v9;
      if (*v11)
      {
        v12 = v11;
        v13 = 0;
        v49 = v11;
        do
        {
          v14 = objc_msgSend(v48, "actualPathCommandForPathCommand:index:", *((unsigned int *)v12 + 1), v13);
          switch(v14)
          {
            case 0:
            case 29:
              v27 = v8[2](v8);
              v18 = -[OADToPointPathElement initWithToPoint:]([OADLineToPathElement alloc], "initWithToPoint:", v27, v8[2](v8));
              -[OADToPointPathElement setRelative:](v18, "setRelative:", v14 == 29);
              -[OADPath addElement:](v50, "addElement:", v18);
              goto LABEL_29;
            case 1:
            case 30:
              v28 = v8[2](v8);
              v29 = v8[2](v8);
              v30 = v8[2](v8);
              v31 = v8[2](v8);
              v32 = v8[2](v8);
              v18 = -[OADCubicBezierToPathElement initWithControlPoint1:controlPoint2:toPoint:]([OADCubicBezierToPathElement alloc], "initWithControlPoint1:controlPoint2:toPoint:", v28, v29, v30, v31, v32, v8[2](v8));
              -[OADToPointPathElement setRelative:](v18, "setRelative:", v14 == 30);
              -[OADPath addElement:](v50, "addElement:", v18);
              goto LABEL_29;
            case 2:
            case 28:
              v33 = v8[2](v8);
              v18 = -[OADToPointPathElement initWithToPoint:]([OADMoveToPathElement alloc], "initWithToPoint:", v33, v8[2](v8));
              -[OADToPointPathElement setRelative:](v18, "setRelative:", v14 == 28);
              -[OADPath addElement:](v50, "addElement:", v18);
              goto LABEL_29;
            case 3:
              v18 = objc_alloc_init(OADClosePathElement);
              -[OADPath addElement:](v50, "addElement:", v18);
              goto LABEL_29;
            case 4:

              if (-[OADPath elementCount](v50, "elementCount"))
              {
                objc_msgSend(v43, "addPath:", v50);
                v47 = v50;
              }
              else
              {
                v47 = 0;
              }
              v18 = (OADLineToPathElement *)v50;
              v50 = objc_alloc_init(OADPath);
              goto LABEL_29;
            case 6:
            case 7:
              v34 = v8[2](v8);
              v35 = v8[2](v8);
              v36 = v8[2](v8);
              v37 = v8[2](v8);
              v38 = v8[2](v8);
              LOBYTE(v41) = v14 == 6;
              v18 = -[OADAngleArcPathElement initWithCenter:semiaxes:startAngle:angleLength:connectedToPrevious:]([OADAngleArcPathElement alloc], "initWithCenter:semiaxes:startAngle:angleLength:connectedToPrevious:", v34, v35, v36, v37, v38, v8[2](v8), v41);
              -[OADPath addElement:](v50, "addElement:", v18);
              goto LABEL_29;
            case 8:
            case 9:
            case 10:
            case 11:
              v20 = v8[2](v8);
              v21 = v8[2](v8);
              v22 = v8[2](v8);
              v23 = v8[2](v8);
              v24 = v8[2](v8);
              v25 = v8[2](v8);
              v26 = v8[2](v8);
              BYTE1(v42) = (v14 & 0xFFFFFFFD) == 8;
              LOBYTE(v42) = (v14 & 0xFFFFFFFE) == 10;
              v18 = -[OADVectorArcPathElement initWithLeft:top:right:bottom:startVector:endVector:clockwise:connectedToPrevious:]([OADVectorArcPathElement alloc], "initWithLeft:top:right:bottom:startVector:endVector:clockwise:connectedToPrevious:", v20, v21, v22, v23, v24, v25, v26, v8[2](v8), v42);
              -[OADPath addElement:](v50, "addElement:", v18);
              v8 = v46;
              goto LABEL_29;
            case 12:
            case 13:
              v39 = v8[2](v8);
              v18 = -[OADQuarterEllipseToPathElement initWithToPoint:startsVertical:]([OADQuarterEllipseToPathElement alloc], "initWithToPoint:startsVertical:", v39, v8[2](v8), v14 == 13);
              -[OADPath addElement:](v50, "addElement:", v18);
              goto LABEL_29;
            case 14:
              v40 = v8[2](v8);
              v18 = -[OADQuadBezierControlPointPathElement initWithControlPoint:]([OADQuadBezierControlPointPathElement alloc], "initWithControlPoint:", v40, v8[2](v8));
              -[OADPath addElement:](v50, "addElement:", v18);
              goto LABEL_29;
            case 15:
            case 16:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
              v15 = -[OADPath elementCount](v50, "elementCount");
              v16 = v47;
              if (v15)
                v16 = v50;
              v17 = v16;
              v18 = v17;
              switch(v14)
              {
                case 31:
                  v19 = 1;
                  goto LABEL_28;
                case 32:
                  v19 = 3;
                  goto LABEL_28;
                case 33:
                  v19 = 2;
                  goto LABEL_28;
                case 34:
                  v19 = 5;
                  goto LABEL_28;
                case 35:
                  v19 = 4;
                  goto LABEL_28;
                default:
                  if (v14 == 15)
                  {
                    v19 = 0;
LABEL_28:
                    -[OADLineToPathElement setFillMode:](v17, "setFillMode:", v19);
                  }
                  else if (v14 == 16)
                  {
                    -[OADLineToPathElement setStroked:](v17, "setStroked:", 0);
                  }
                  break;
              }
LABEL_29:

              break;
            default:
              break;
          }
          ++v13;
          v12 = v49;
        }
        while (*v49 > v13);
      }
      v10 = v45 + 1;
      a3 = v44;
      v9 = v50;
    }
    while (v45 + 1 < ((v44[2] - v44[1]) >> 3));
  }
  else
  {
    v47 = 0;
  }
  if (-[OADPath elementCount](v9, "elementCount"))
    objc_msgSend(v43, "addPath:", v9);

  _Block_object_dispose(v52, 8);
}

+ (int)actualPathCommandForPathCommand:(int)a3 index:(unsigned __int16)a4
{
  int result;

  result = a3;
  switch(a3)
  {
    case 7:
      if (a4)
        result = 6;
      break;
    case 9:
      if (a4)
        result = 8;
      break;
    case 11:
      if (a4)
        result = 10;
      break;
    case 12:
      if ((a4 & 1) != 0)
        result = 13;
      break;
    case 13:
      if ((a4 & 1) != 0)
        result = 12;
      break;
    default:
      return result;
  }
  return result;
}

+ (OADAdjustCoord)adjustCoordWithComputedValue:(EshComputedValue)a3
{
  return (OADAdjustCoord)(*(unsigned __int8 *)a3.var0 | ((unint64_t)*(unsigned int *)(*(_QWORD *)&a3 + 4) << 32));
}

+ (void)readFromFormulas:(const void *)a3 toGeometry:(id)a4
{
  id v5;
  unsigned int v6;
  _DWORD *v7;
  uint64_t v8;
  _DWORD *v9;
  unint64_t v10;
  uint64_t v11;
  OADFormula *v12;
  OADFormula *v13;
  _DWORD v14[7];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (-1227133513 * ((*((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1)) >> 2))
  {
    v6 = 0;
    do
    {
      v7 = (_DWORD *)EshBasicTablePropVal<EshFormula>::operator[]((uint64_t)a3, v6);
      v8 = 1;
      do
      {
        v9 = &v14[v8];
        *v9 = 0;
        *((_WORD *)v9 + 2) = 0;
        v8 += 2;
      }
      while (v9 + 2 != (_DWORD *)v15);
      EshFormula::operator=(v14, v7);
      v10 = 0;
      v11 = v14[0];
      do
      {
        v15[v10 / 2] = v14[v10 + 1] | ((unint64_t)LOWORD(v14[v10 + 2]) << 32);
        v10 += 2;
      }
      while (v10 != 6);
      v12 = [OADFormula alloc];
      v13 = -[OADFormula initWithType:arg0:arg1:arg2:](v12, "initWithType:arg0:arg1:arg2:", v11, v15[0], v15[1], v15[2]);
      objc_msgSend(v5, "addFormula:", v13);

      ++v6;
    }
    while (v6 < -1227133513 * ((*((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1)) >> 2));
  }

}

+ (void)readFromTextBoxRects:(const void *)a3 toGeometry:(id)a4
{
  id v6;
  unsigned int v7;
  __int128 *v8;
  uint64_t i;
  char *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  OADAdjustRect *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  v6 = a4;
  if (((*((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1)) & 0x1FFFFFFFE0) != 0)
  {
    v7 = 0;
    do
    {
      v8 = (__int128 *)EshBasicTablePropVal<EshComputedRect>::operator[]((uint64_t)a3, v7);
      for (i = 0; i != 32; i += 8)
      {
        v10 = (char *)&v20 + i;
        *v10 = 0;
        *((_DWORD *)v10 + 1) = 0;
      }
      v11 = v8[1];
      v20 = *v8;
      v21 = v11;
      v19 = v20;
      v12 = objc_msgSend(a1, "adjustCoordWithComputedValue:", &v19);
      v18 = *((_QWORD *)&v20 + 1);
      v13 = objc_msgSend(a1, "adjustCoordWithComputedValue:", &v18);
      v17 = v21;
      v14 = objc_msgSend(a1, "adjustCoordWithComputedValue:", &v17);
      v16 = *((_QWORD *)&v21 + 1);
      v15 = -[OADAdjustRect initWithLeft:top:right:bottom:]([OADAdjustRect alloc], "initWithLeft:top:right:bottom:", v12, v13, v14, objc_msgSend(a1, "adjustCoordWithComputedValue:", &v16));
      objc_msgSend(v6, "addTextBodyRect:", v15);

      ++v7;
    }
    while (v7 < ((*((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1)) >> 5));
  }

}

+ (void)readFromLimo:(CsPoint<int>)a3 toGeometry:(id)a4
{
  uint64_t v4;

  v4 = **(_QWORD **)&a3;
  objc_msgSend(a4, "setLimo:", &v4);
}

+ (void)readGeometryCoordSpaceFromShapeProperties:(const EshShapeProperties *)a3 toGeometry:(id)a4
{
  id v5;
  EshContentProperties *isCoordLeftSet;
  int CoordLeft;
  int v8;
  EshContentProperties *isCoordTopSet;
  int CoordTop;
  int v11;
  EshShapeProperties *isCoordRightSet;
  int CoordRight;
  int v14;
  EshShapeProperties *isCoordBottomSet;
  int CoordBottom;
  _DWORD v17[4];

  v5 = a4;
  isCoordLeftSet = (EshContentProperties *)EshShapeProperties::isCoordLeftSet((EshShapeProperties *)a3);
  if ((_DWORD)isCoordLeftSet)
    CoordLeft = EshShapeProperties::getCoordLeft((EshShapeProperties *)a3);
  else
    CoordLeft = EshContentProperties::getDefaultPositionHorizontal(isCoordLeftSet);
  v8 = CoordLeft;
  isCoordTopSet = (EshContentProperties *)EshShapeProperties::isCoordTopSet((EshShapeProperties *)a3);
  if ((_DWORD)isCoordTopSet)
    CoordTop = EshShapeProperties::getCoordTop((EshShapeProperties *)a3);
  else
    CoordTop = EshContentProperties::getDefaultPositionHorizontal(isCoordTopSet);
  v11 = CoordTop;
  isCoordRightSet = (EshShapeProperties *)EshShapeProperties::isCoordRightSet((EshShapeProperties *)a3);
  if ((_DWORD)isCoordRightSet)
    CoordRight = EshShapeProperties::getCoordRight((EshShapeProperties *)a3);
  else
    CoordRight = EshShapeProperties::getDefaultCoordRight(isCoordRightSet);
  v14 = CoordRight;
  isCoordBottomSet = (EshShapeProperties *)EshShapeProperties::isCoordBottomSet((EshShapeProperties *)a3);
  if ((_DWORD)isCoordBottomSet)
    CoordBottom = EshShapeProperties::getCoordBottom((EshShapeProperties *)a3);
  else
    CoordBottom = EshShapeProperties::getDefaultCoordRight(isCoordBottomSet);
  v17[0] = v8;
  v17[1] = v11;
  v17[2] = v14;
  v17[3] = CoordBottom;
  objc_msgSend(v5, "setGeometryCoordSpace:", v17);

}

+ (void)readLimoFromPath:(const EshPath *)a3 toGeometry:(id)a4
{
  id v6;
  EshPath *isLimoXSet;
  int LimoX;
  int v9;
  EshPath *isLimoYSet;
  int LimoY;
  _DWORD v12[2];

  v6 = a4;
  isLimoXSet = (EshPath *)EshPath::isLimoXSet((EshPath *)a3);
  if ((_DWORD)isLimoXSet)
    LimoX = EshPath::getLimoX((EshPath *)a3);
  else
    LimoX = EshPath::getDefaultLimoX(isLimoXSet);
  v9 = LimoX;
  isLimoYSet = (EshPath *)EshPath::isLimoYSet((EshPath *)a3);
  if ((_DWORD)isLimoYSet)
    LimoY = EshPath::getLimoY((EshPath *)a3);
  else
    LimoY = EshPath::getDefaultLimoX(isLimoYSet);
  v12[0] = v9;
  v12[1] = LimoY;
  objc_msgSend(a1, "readFromLimo:toGeometry:", v12, v6);

}

+ (void)readPathCommandsAndParamsFromPath:(const EshPath *)a3 toGeometry:(id)a4
{
  uint64_t *Params;
  uint64_t *v7;
  _QWORD *Commands;
  _QWORD *v9;
  EshContentProperties *isPathTypeSet;
  __int16 PathType;
  id v12;

  v12 = a4;
  if (EshPath::isParamsSet((EshPath *)a3))
  {
    Params = EshPath::getParams((EshPath *)a3);
    v7 = Params;
    if (Params)
    {
      if (((Params[2] - Params[1]) & 0x7FFFFFFF8) != 0)
      {
        if (EshPath::isCommandsSet((EshPath *)a3)
          && (Commands = EshPath::getCommands((EshPath *)a3)) != 0)
        {
          v9 = 0;
        }
        else
        {
          Commands = operator new(0x20uLL);
          Commands[2] = 0;
          Commands[3] = 0;
          *Commands = &off_24F39D6E0;
          Commands[1] = 0;
          isPathTypeSet = (EshContentProperties *)EshPath::isPathTypeSet((EshPath *)a3);
          if ((_DWORD)isPathTypeSet)
            PathType = EshPath::getPathType((EshPath *)a3);
          else
            PathType = EshContentProperties::getDefaultAllowOverlap(isPathTypeSet);
          EshGeometryProperties::generateImpliedPath((unsigned __int16)((*((_DWORD *)v7 + 4) - *((_DWORD *)v7 + 2)) >> 3), PathType, (uint64_t)Commands);
          v9 = Commands;
        }
        objc_msgSend(a1, "readFromPathCommands:pathParams:toGeometry:", Commands, v7, v12);
        if (v9)
          (*(void (**)(_QWORD *))(*v9 + 8))(v9);
      }
    }
  }

}

uint64_t __63__OABShapeGeometry_readFromPathCommands_pathParams_toGeometry___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  void *v5;
  uint64_t result;
  uint64_t v7;

  v3 = a1[4];
  v2 = a1[5];
  v4 = *(_DWORD *)(*(_QWORD *)(v3 + 8) + 24);
  if (v4 >= ((*(_QWORD *)(v2 + 16) - *(_QWORD *)(v2 + 8)) >> 3))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("not enough parameters"));
    v2 = a1[5];
    v4 = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  }
  v5 = (void *)a1[6];
  v7 = *(_QWORD *)EshBasicTablePropVal<EshComputedValue>::operator[](v2, v4);
  result = objc_msgSend(v5, "adjustCoordWithComputedValue:", &v7);
  ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

+ (EshComputedValue)computedValueWithAdjustCoord:(OADAdjustCoord)a3
{
  uint64_t v3;

  *(_BYTE *)v3 = a3.isFormulaResult;
  *(_DWORD *)(v3 + 4) = a3.value;
  return (EshComputedValue)a1;
}

+ (void)writeAdjustValuesFromGeometry:(id)a3 toShapeProperties:(EshShapeProperties *)a4
{
  uint64_t v5;
  id v6;

  v6 = a3;
  v5 = 0;
  do
  {
    if (objc_msgSend(v6, "hasAdjustValueAtIndex:", v5))
      EshShapeProperties::setAdj(a4, (unsigned __int16)v5, objc_msgSend(v6, "adjustValueAtIndex:", v5));
    v5 = (v5 + 1);
  }
  while ((_DWORD)v5 != 10);

}

+ (void)writeCoordSpaceFromGeometry:(id)a3 toShape:(void *)a4
{
  id v5;
  EshContentProperties *v6;
  int v7;
  EshContentProperties *DefaultPositionHorizontal;
  EshShapeProperties *v9;
  EshShapeProperties *DefaultCoordRight;
  uint64_t *v11;
  int v12;
  char *v13;
  uint32x2_t v14;
  uint64_t i;
  int *v16;
  int64x2_t v17;
  int64x2_t v18;
  int v19[2];
  int v20[2];

  v5 = a3;
  v6 = (EshContentProperties *)objc_msgSend(v5, "isEscher");
  if ((_DWORD)v6)
  {
    if (v5)
    {
      v6 = (EshContentProperties *)objc_msgSend(v5, "geometryCoordSpace");
      v7 = v19[0];
    }
    else
    {
      v7 = 0;
      *(_QWORD *)v19 = 0;
      *(_QWORD *)v20 = 0;
    }
    DefaultPositionHorizontal = (EshContentProperties *)EshContentProperties::getDefaultPositionHorizontal(v6);
    if (v7 != (_DWORD)DefaultPositionHorizontal)
      EshShapeProperties::setCoordLeft((EshShapeProperties *)((char *)a4 + 424), v19[0]);
    v9 = (EshShapeProperties *)EshContentProperties::getDefaultPositionHorizontal(DefaultPositionHorizontal);
    if (v19[1] != (_DWORD)v9)
      EshShapeProperties::setCoordTop((EshShapeProperties *)((char *)a4 + 424), v19[1]);
    DefaultCoordRight = (EshShapeProperties *)EshShapeProperties::getDefaultCoordRight(v9);
    if (v20[0] != (_DWORD)DefaultCoordRight)
      EshShapeProperties::setCoordRight((EshShapeProperties *)((char *)a4 + 424), v20[0]);
    if (v20[1] != EshShapeProperties::getDefaultCoordRight(DefaultCoordRight))
      EshShapeProperties::setCoordBottom((EshShapeProperties *)((char *)a4 + 424), v20[1]);
    v11 = (uint64_t *)operator new();
    v12 = 0;
    v13 = (char *)a4 + 528;
    v14 = (uint32x2_t)vadd_s32(*(int32x2_t *)v20, *(int32x2_t *)v19);
    v11[2] = 0;
    v11[3] = 0;
    *v11 = (uint64_t)&off_24F39D640;
    v11[1] = 0;
    v17 = vshll_n_s32(vshr_n_s32((int32x2_t)vsra_n_u32(v14, v14, 0x1FuLL), 1uLL), 0x20uLL);
    do
    {
      for (i = 0; i != 4; i += 2)
      {
        v16 = &v18.i32[i];
        *(_BYTE *)v16 = 0;
        v16[1] = 0;
      }
      v18 = v17;
      EshBasicTablePropVal<EshComputedPoint>::append(v11, &v18);
      ++v12;
    }
    while (v12 != 4);
    EshPath::takeConnectLocs((uint64_t)v13, v11);
  }

}

+ (void)writeLimoFromGeometry:(id)a3 toPath:(EshPath *)a4
{
  id v5;
  EshPath *v6;
  int v7;
  EshContentProperties *DefaultCoordRight;
  int v9;
  int DefaultPositionHorizontal;
  int v11;
  EshShapeProperties *v12;
  EshContentProperties *v13;
  int v14;
  int v15;
  int v16;
  EshPath *DefaultLimoX;
  int v18;
  int v19[2];

  v5 = a3;
  v6 = (EshPath *)objc_msgSend(v5, "isEscher");
  if ((_DWORD)v6)
  {
    if (v5)
    {
      v6 = (EshPath *)objc_msgSend(v5, "limo");
      v7 = v19[0];
    }
    else
    {
      v7 = 0;
      *(_QWORD *)v19 = 0;
    }
    DefaultLimoX = (EshPath *)EshPath::getDefaultLimoX(v6);
    if (v7 != (_DWORD)DefaultLimoX)
      EshPath::setLimoX(a4, v19[0]);
    v18 = v19[1];
    if (v18 != EshPath::getDefaultLimoX(DefaultLimoX))
      EshPath::setLimoY(a4, v19[1]);
  }
  else
  {
    DefaultCoordRight = (EshContentProperties *)EshShapeProperties::getDefaultCoordRight((EshShapeProperties *)v6);
    v9 = (int)DefaultCoordRight;
    DefaultPositionHorizontal = EshContentProperties::getDefaultPositionHorizontal(DefaultCoordRight);
    v11 = v9 - DefaultPositionHorizontal;
    if (v9 < DefaultPositionHorizontal)
      ++v11;
    EshPath::setLimoX(a4, v11 >> 1);
    v13 = (EshContentProperties *)EshShapeProperties::getDefaultCoordRight(v12);
    v14 = (int)v13;
    v15 = EshContentProperties::getDefaultPositionHorizontal(v13);
    v16 = v14 - v15;
    if (v14 < v15)
      ++v16;
    EshPath::setLimoY(a4, v16 >> 1);
  }

}

+ (void)appendAdjustPoint:(OADAdjustPoint)a3 toPathParams:(void *)a4
{
  OADAdjustCoord y;
  uint64_t v7;
  uint64_t v8;

  y = a3.y;
  objc_msgSend(a1, "computedValueWithAdjustCoord:", *(_QWORD *)&a3.x);
  EshBasicTablePropVal<EshComputedValue>::append(a4, &v8);
  objc_msgSend(a1, "computedValueWithAdjustCoord:", y);
  EshBasicTablePropVal<EshComputedValue>::append(a4, &v7);
}

+ (void)writePathCommandsAndParamsFromGeometry:(id)a3 toPath:(EshPath *)a4
{
  uint64_t *v4;
  EshPathParamTable *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  id v24;
  uint64_t v26;

  v24 = a3;
  v23 = objc_msgSend(v24, "pathCount");
  if (!v23)
  {
    EshPath::takeCommands((uint64_t)a4, 0);
    EshPath::takeParams(a4, 0);
    goto LABEL_25;
  }
  v4 = (uint64_t *)operator new();
  v4[2] = 0;
  v4[3] = 0;
  *v4 = (uint64_t)&off_24F39D6E0;
  v4[1] = 0;
  v5 = (EshPathParamTable *)operator new();
  v6 = 0;
  *((_QWORD *)v5 + 2) = 0;
  *((_QWORD *)v5 + 3) = 0;
  *(_QWORD *)v5 = &off_24F39D578;
  *((_QWORD *)v5 + 1) = 0;
  do
  {
    objc_msgSend(v24, "pathAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "fillMode"))
    {
      LOWORD(v26) = 1;
      HIDWORD(v26) = 15;
      EshBasicTablePropVal<EshComputedValue>::append(v4, &v26);
    }
    if ((objc_msgSend(v7, "stroked") & 1) == 0)
    {
      LOWORD(v26) = 1;
      HIDWORD(v26) = 16;
      EshBasicTablePropVal<EshComputedValue>::append(v4, &v26);
    }
    v8 = objc_msgSend(v7, "elementCount");
    if (v8)
    {
      for (i = 0; v8 != i; ++i)
      {
        objc_msgSend(v7, "elementAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOWORD(v26) = 1;
          HIDWORD(v26) = 3;
          EshBasicTablePropVal<EshComputedValue>::append(v4, &v26);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v10;
            if ((objc_msgSend(v11, "relative") & 1) == 0)
            {
              LOWORD(v26) = 1;
              HIDWORD(v26) = 2;
              EshBasicTablePropVal<EshComputedValue>::append(v4, &v26);
              v12 = objc_msgSend(v11, "toPoint");
              objc_msgSend(a1, "appendAdjustPoint:toPathParams:", v12, v13, v5);
            }
LABEL_20:

            goto LABEL_21;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v10;
            if ((objc_msgSend(v11, "relative") & 1) == 0)
            {
              LOWORD(v26) = 1;
              HIDWORD(v26) = 0;
              EshBasicTablePropVal<EshComputedValue>::append(v4, &v26);
              v14 = objc_msgSend(v11, "toPoint");
              objc_msgSend(a1, "appendAdjustPoint:toPathParams:", v14, v15, v5);
            }
            goto LABEL_20;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v10;
            if ((objc_msgSend(v11, "relative") & 1) == 0)
            {
              LOWORD(v26) = 1;
              HIDWORD(v26) = 1;
              EshBasicTablePropVal<EshComputedValue>::append(v4, &v26);
              v16 = objc_msgSend(v11, "controlPoint1");
              objc_msgSend(a1, "appendAdjustPoint:toPathParams:", v16, v17, v5);
              v18 = objc_msgSend(v11, "controlPoint2");
              objc_msgSend(a1, "appendAdjustPoint:toPathParams:", v18, v19, v5);
              v20 = objc_msgSend(v11, "toPoint");
              objc_msgSend(a1, "appendAdjustPoint:toPathParams:", v20, v21, v5);
            }
            goto LABEL_20;
          }
        }
LABEL_21:

      }
    }
    LOWORD(v26) = 1;
    HIDWORD(v26) = 4;
    EshBasicTablePropVal<EshComputedValue>::append(v4, &v26);

    ++v6;
  }
  while (v6 != v23);
  EshPath::takeCommands((uint64_t)a4, v4);
  EshPath::takeParams(a4, v5);
LABEL_25:

}

+ (void)writeFormulasFromGeometry:(id)a3 toPath:(EshPath *)a4
{
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t i;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  _WORD *v12;
  unint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t *v22;
  uint64_t v23;
  id v24;
  _DWORD v25[2];
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _QWORD v31[4];

  v31[3] = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v23 = objc_msgSend(v24, "formulaCount");
  if (!v23)
  {
    EshPath::takeFormulas((uint64_t)a4, 0);
    goto LABEL_23;
  }
  v4 = (uint64_t *)operator new();
  v5 = 0;
  v4[2] = 0;
  v4[3] = 0;
  *v4 = (uint64_t)&off_24F39D780;
  v4[1] = 0;
  v22 = v4;
  do
  {
    objc_msgSend(v24, "formulaAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");
    for (i = 0; i != 3; ++i)
    {
      v9 = &v31[i];
      *(_DWORD *)v9 = 0;
      *((_WORD *)v9 + 2) = 0;
    }
    v10 = 0;
    if (v7 == 19)
      v11 = 0;
    else
      v11 = v7;
    v12 = (_WORD *)v31 + 2;
    do
    {
      v13 = objc_msgSend(v6, "argAtIndex:", v10);
      if ((_DWORD)v13)
      {
        if ((_DWORD)v13 == 4)
        {
          v14 = HIDWORD(v13) - 1280;
          if ((HIDWORD(v13) - 1280) < 4)
          {
            v15 = dword_22A4BE490[v14];
            LODWORD(v13) = dword_22A4BE4A0[v14];
            goto LABEL_17;
          }
          v15 = 4;
        }
        else
        {
          v15 = v13;
        }
        v13 >>= 32;
      }
      else
      {
        v15 = 1;
      }
LABEL_17:
      *((_DWORD *)v12 - 1) = v15;
      *v12 = v13;
      v12 += 4;
      ++v10;
    }
    while (v10 != 3);
    v17 = v31[0];
    v16 = v31[1];
    v18 = 1;
    v19 = v31[2];
    do
    {
      v20 = &v25[v18];
      *v20 = 0;
      *((_WORD *)v20 + 2) = 0;
      v18 += 2;
    }
    while (v20 + 2 != (_DWORD *)v31);
    v25[0] = v11;
    v25[1] = v17;
    v26 = WORD2(v17);
    v27 = v16;
    v28 = WORD2(v16);
    v29 = v19;
    v30 = WORD2(v19);
    EshBasicTablePropVal<EshFormula>::append(v22, v25);

    ++v5;
  }
  while (v5 != v23);
  EshPath::takeFormulas((uint64_t)a4, v22);
LABEL_23:

}

+ (void)writeTextBodyRectsFromGeometry:(id)a3 toPath:(EshPath *)a4
{
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD v17[8];

  v6 = a3;
  v7 = objc_msgSend(v6, "textBodyRectCount");
  if (v7)
  {
    v8 = (uint64_t *)operator new();
    v9 = 0;
    v8[2] = 0;
    v8[3] = 0;
    *v8 = (uint64_t)&off_24F39D820;
    v8[1] = 0;
    do
    {
      objc_msgSend(v6, "textBodyRectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "computedValueWithAdjustCoord:", objc_msgSend(v10, "left"));
      objc_msgSend(a1, "computedValueWithAdjustCoord:", objc_msgSend(v10, "top"));
      objc_msgSend(a1, "computedValueWithAdjustCoord:", objc_msgSend(v10, "right"));
      objc_msgSend(a1, "computedValueWithAdjustCoord:", objc_msgSend(v10, "bottom"));
      v11 = 0;
      v13 = v17[6];
      v12 = v17[7];
      v15 = v17[4];
      v14 = v17[5];
      do
      {
        v16 = &v17[v11];
        *(_BYTE *)v16 = 0;
        *((_DWORD *)v16 + 1) = 0;
        ++v11;
      }
      while (v11 != 4);
      v17[0] = v12;
      v17[1] = v13;
      v17[2] = v14;
      v17[3] = v15;
      EshBasicTablePropVal<EshComputedRect>::append(v8, (uint64_t)v17);

      ++v9;
    }
    while (v9 != v7);
    EshPath::takeTextBoxRects((uint64_t)a4, v8);
  }
  else
  {
    EshPath::takeTextBoxRects((uint64_t)a4, 0);
  }

}

+ (void)writeFromShape:(id)a3 toShape:(void *)a4
{
  void *v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "geometry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v11, "type");
  v8 = v7;
  if (v7 < 203)
  {
    if (v7)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(v6, "equivalentCustomGeometry");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  v8 = 100;
LABEL_5:
  EshShapeProperties::setShapeType((uint64_t)a4 + 424, v8);
  EshShapeProperties::setHasShapeType((EshShapeProperties *)((char *)a4 + 424), 1);
  objc_msgSend(a1, "writeAdjustValuesFromGeometry:toShapeProperties:", v6, (char *)a4 + 424);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v6;
    EshPath::takeConnectAngles((uint64_t)a4 + 528, 0);
    EshPath::takeHandles((uint64_t)a4 + 528, 0);
    objc_msgSend(a1, "writeCoordSpaceFromGeometry:toShape:", v10, a4);
    objc_msgSend(a1, "writeLimoFromGeometry:toPath:", v10, (char *)a4 + 528);
    objc_msgSend(a1, "writePathCommandsAndParamsFromGeometry:toPath:", v10, (char *)a4 + 528);
    objc_msgSend(a1, "writeFormulasFromGeometry:toPath:", v10, (char *)a4 + 528);
    objc_msgSend(a1, "writeTextBodyRectsFromGeometry:toPath:", v10, (char *)a4 + 528);

  }
  EshShapeProperties::setHidden((EshShapeProperties *)((char *)a4 + 424), objc_msgSend(v11, "hidden"));

}

@end
