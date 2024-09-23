@implementation CMShapeUtils

+ (id)transformFromBounds:(CGRect)a3 toOrientedBounds:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  float v27;
  double v28;
  int v29;
  double v30;
  CGFloat v31;
  float v32;
  double v33;
  int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  float v45;
  id v46;
  int v47;
  double v48;
  double v49;
  id v50;
  uint64_t v52;
  CGFloat rect;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  objc_msgSend(v9, "bounds");
  rect = v10;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v9, "rotation");
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    v17 = NSTransposedRectWithSameCenter(v12, v14, v16, rect);
    rect = v18;
    v12 = v17;
    v14 = v19;
    v16 = v20;
  }
  v21 = x;
  v54.origin.x = x;
  v22 = y;
  v54.origin.y = y;
  v23 = width;
  v54.size.width = width;
  v24 = height;
  v54.size.height = height;
  v25 = CGRectGetWidth(v54);
  v55.origin.x = v12;
  v55.origin.y = v14;
  v55.size.width = v16;
  v55.size.height = rect;
  v26 = CGRectGetWidth(v55);
  v27 = v25;
  *(float *)&v28 = v26;
  *(float *)&v26 = v27;
  objc_msgSend(a1, "scaleFactorFromLength:toLength:", v26, v28);
  HIDWORD(v52) = v29;
  v56.origin.x = v21;
  v56.origin.y = v22;
  v56.size.width = v23;
  v56.size.height = v24;
  v30 = CGRectGetHeight(v56);
  v57.origin.x = v12;
  v57.origin.y = v14;
  v57.size.width = v16;
  v57.size.height = rect;
  v31 = CGRectGetHeight(v57);
  v32 = v30;
  *(float *)&v33 = v31;
  *(float *)&v31 = v32;
  objc_msgSend(a1, "scaleFactorFromLength:toLength:", v31, v33);
  LODWORD(v52) = v34;
  v35 = TSUCenterOfRect(v21, v22, v23, v24);
  v37 = v36;
  v38 = TSUCenterOfRect(v12, v14, v16, rect);
  v40 = v39;
  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_alloc_init(MEMORY[0x24BDD1438]);
  objc_msgSend(v42, "translateXBy:yBy:", -v35, -v37);
  objc_msgSend(v41, "appendTransform:", v42);
  v43 = objc_alloc_init(MEMORY[0x24BDD1438]);

  objc_msgSend(v43, "scaleXBy:yBy:", *((float *)&v52 + 1), *(float *)&v52);
  objc_msgSend(v41, "appendTransform:", v43);
  v44 = objc_alloc_init(MEMORY[0x24BDD1438]);

  objc_msgSend(v9, "rotation");
  objc_msgSend(v44, "rotateByDegrees:", v45);
  objc_msgSend(v41, "appendTransform:", v44);
  v46 = objc_alloc_init(MEMORY[0x24BDD1438]);

  LODWORD(v44) = objc_msgSend(v9, "flipX");
  v47 = objc_msgSend(v9, "flipY");
  v48 = 1.0;
  if ((_DWORD)v44)
    v49 = -1.0;
  else
    v49 = 1.0;
  if (v47)
    v48 = -1.0;
  objc_msgSend(v46, "scaleXBy:yBy:", v49, v48, v52);
  objc_msgSend(v41, "appendTransform:", v46);
  v50 = objc_alloc_init(MEMORY[0x24BDD1438]);

  objc_msgSend(v50, "translateXBy:yBy:", v38, v40);
  objc_msgSend(v41, "appendTransform:", v50);

  return v41;
}

+ (float)scaleFactorFromLength:(float)a3 toLength:(float)a4
{
  float v4;
  BOOL v5;
  float result;

  v4 = a4 / a3;
  v5 = a3 == 0.0;
  result = 0.0;
  if (!v5)
    return v4;
  return result;
}

+ (double)mapAdjustCoord:(OADAdjustCoord)a3 geometry:(id)a4
{
  id v5;
  double value;
  double v7;

  v5 = a4;
  if (a3.isFormulaResult)
  {
    +[CMShapeUtils getFormulaResultFromCustomGeometry:atIndex:](CMShapeUtils, "getFormulaResultFromCustomGeometry:atIndex:", v5, *(uint64_t *)&a3 >> 32);
    value = v7;
  }
  else
  {
    value = (double)a3.value;
  }

  return value;
}

+ (BOOL)isShapeALine:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "geometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "geometry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "pathCount") == 1)
    {
      objc_msgSend(v6, "pathAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "stroked") & 1) != 0 && objc_msgSend(v7, "elementCount") == 2)
      {
        objc_msgSend(v7, "elementAtIndex:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "elementAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v10 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v10 = 1;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (double)getFormulaResultFromCustomGeometry:(id)a3 atIndex:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  double v14;
  int v15;
  double v16;
  void *v18;
  SEL v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = objc_msgSend(v7, "isEscher");
  v9 = 0.0;
  if (objc_msgSend(v7, "formulaCount") > a4)
  {
    v19 = a2;
    objc_msgSend(v7, "formulaAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    memset(v20, 0, 24);
    do
    {
      v12 = objc_msgSend(v10, "argAtIndex:", v11);
      v13 = HIDWORD(v12);
      v14 = 0.0;
      switch((int)v12)
      {
        case 0:
          goto LABEL_11;
        case 1:
          v14 = (double)SHIDWORD(v12);
          goto LABEL_11;
        case 2:
          v15 = objc_msgSend(v7, "adjustValueAtIndex:", v13, 0.0);
          goto LABEL_7;
        case 3:
          if (v13 >= a4)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", 0.0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v19, a1, CFSTR("CMShapeUtils.mm"), 437, CFSTR("Forward reference to formula"));

          }
          +[CMShapeUtils getFormulaResultFromCustomGeometry:atIndex:](CMShapeUtils, "getFormulaResultFromCustomGeometry:atIndex:", v7, v12 >> 32);
          goto LABEL_11;
        case 4:
          v15 = objc_msgSend(a1, "mapFormulaKeywordValue:geometry:", v13, v7, 0.0);
LABEL_7:
          v14 = (double)v15;
LABEL_11:
          *(double *)&v20[v11] = v14;
          break;
        default:
          break;
      }
      ++v11;
    }
    while (v11 != 3);
    +[CMShapeUtils mapFormulaOfType:argValues:isEscher:](CMShapeUtils, "mapFormulaOfType:argValues:isEscher:", objc_msgSend(v10, "type", v13, v14), v20, v8);
    v9 = v16;

  }
  return v9;
}

+ (int)mapFormulaKeywordValue:(int)a3 geometry:(id)a4
{
  id v7;
  void *v8;
  double v9;
  void *v10;
  int v11;
  int32x2_t v13;
  int32x2_t v14;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "geometryCoordSpace");
    v9 = COERCE_DOUBLE(vcvt_f32_s32(vsub_s32(v14, v13)));
  }
  else
  {
    v9 = 0.0;
  }
  switch(a3)
  {
    case 320:
      *(float *)&v9 = *(float *)&v9 * 0.5;
      break;
    case 321:
      *(float *)&v9 = vmuls_lane_f32(0.5, *(float32x2_t *)&v9, 1);
      break;
    case 322:
      break;
    case 323:
LABEL_7:
      LODWORD(v9) = HIDWORD(v9);
      break;
    default:
      switch(a3)
      {
        case 1280:
        case 1281:
          goto LABEL_9;
        case 1282:
          goto LABEL_11;
        case 1283:
          goto LABEL_7;
        default:
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CMShapeUtils.mm"), 621, CFSTR("Unknown formula keyword"));

LABEL_9:
          LODWORD(v9) = 0;
          break;
      }
      break;
  }
LABEL_11:
  v11 = (int)*(float *)&v9;

  return v11;
}

+ (double)mapFormulaOfType:(int)a3 argValues:(double *)a4 isEscher:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double result;
  double v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  long double v14;
  double v15;
  long double v16;
  double v17;
  uint64_t v18;

  switch(a3)
  {
    case 0:
      v5 = *a4 + a4[1];
      v6 = a4[2];
      return v5 - v6;
    case 1:
      v7 = a4[2];
      if (v7 == 0.0)
      {
        a4[2] = 1.0;
        v7 = 1.0;
      }
      return *a4 * a4[1] / v7;
    case 2:
      v9 = *a4 + a4[1];
      v10 = 0.5;
      return v9 * v10;
    case 3:
      return fabs(*a4);
    case 4:
      result = *a4;
      if (*a4 >= a4[1])
        return a4[1];
      return result;
    case 5:
      result = *a4;
      if (*a4 <= a4[1])
        return a4[1];
      return result;
    case 6:
      v18 = 2;
      if (*a4 > 0.0)
        v18 = 1;
      return a4[v18];
    case 7:
      v11 = a4[1] * a4[1] + *a4 * *a4 + a4[2] * a4[2];
      return sqrt(v11);
    case 8:
      return (double)(int)objc_msgSend(a1, "radToNativeAngle:isEscher:", a5, (double)atan2(a4[1], *a4));
    case 9:
      v12 = *a4;
      objc_msgSend(a1, "nativeAngleToRad:isEscher:", (int)a4[1], a5);
      goto LABEL_15;
    case 10:
      v12 = *a4;
      objc_msgSend(a1, "nativeAngleToRad:isEscher:", (int)a4[1], a5);
      goto LABEL_34;
    case 11:
      v12 = *a4;
      v14 = atan2(a4[2], a4[1]);
LABEL_34:
      v15 = cos(v14);
      goto LABEL_35;
    case 12:
      v12 = *a4;
      v13 = atan2(a4[2], a4[1]);
LABEL_15:
      v15 = sin(v13);
      goto LABEL_35;
    case 13:
      v11 = *a4;
      return sqrt(v11);
    case 14:
      v5 = *a4 + (double)((int)a4[1] << 16);
      v6 = (double)((int)a4[2] << 16);
      return v5 - v6;
    case 15:
      v9 = a4[2];
      v10 = sqrt(1.0 - *a4 / a4[1] * (*a4 / a4[1]));
      return v9 * v10;
    case 16:
      v12 = *a4;
      objc_msgSend(a1, "nativeAngleToRad:isEscher:", (int)a4[1], a5);
      v15 = tan(v16);
LABEL_35:
      result = v12 * v15;
      break;
    case 17:
      v17 = a4[1];
      if (*a4 > v17)
        v17 = *a4;
      result = a4[2];
      if (v17 < result)
        result = v17;
      break;
    case 18:
      result = (*a4 + a4[1]) / a4[2];
      break;
    case 19:
      result = *a4;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

+ (void)setCoordSpaceForCustomeGeometry:(id)a3 fromSize:(CGSize)a4
{
  uint64_t v4;
  int width;
  int height;

  v4 = 0;
  width = (int)a4.width;
  height = (int)a4.height;
  objc_msgSend(a3, "setGeometryCoordSpace:", &v4);
}

+ (double)nativeAngleToRad:(int)a3 isEscher:(BOOL)a4
{
  double result;

  if (a4)
    objc_msgSend(a1, "fixedPointDegToRad:", *(_QWORD *)&a3);
  else
    objc_msgSend(a1, "milliMinutesToRad:", *(_QWORD *)&a3);
  return result;
}

+ (double)milliMinutesToRad:(int)a3
{
  return (double)a3 * 0.000000290888209;
}

+ (id)inscribedBoundsWithBounds:(id)a3 logicalBounds:(CGRect)a4
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  float v23;
  double v24;
  float v25;
  float v26;
  double v27;
  CGFloat v28;
  float v29;
  double v30;
  float v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  OADOrientedBounds *v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  OADOrientedBounds *v46;
  double v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v9, "rotation");
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    v11 = NSTransposedRectWithSameCenter(v11, v13, v15, v17);
    v13 = v18;
    v15 = v19;
    v17 = v20;
  }
  v49.size.height = height;
  v49.origin.x = x;
  v49.origin.y = y;
  v48 = width;
  v49.size.width = width;
  v21 = CGRectGetWidth(v49);
  v50.origin.x = v11;
  v50.origin.y = v13;
  v50.size.width = v15;
  v50.size.height = v17;
  v22 = CGRectGetWidth(v50);
  v23 = v21;
  *(float *)&v24 = v22;
  *(float *)&v22 = v23;
  objc_msgSend(a1, "scaleFactorFromLength:toLength:", v22, v24);
  v26 = v25;
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.height = height;
  v51.size.width = v48;
  v27 = CGRectGetHeight(v51);
  v52.origin.x = v11;
  v52.origin.y = v13;
  v52.size.width = v15;
  v52.size.height = v17;
  v28 = CGRectGetHeight(v52);
  v29 = v27;
  *(float *)&v30 = v28;
  *(float *)&v28 = v29;
  objc_msgSend(a1, "scaleFactorFromLength:toLength:", v28, v30);
  if (v26 >= v31)
    v26 = v31;
  v32 = TSUCenterOfRect(v11, v13, v15, v17);
  v34 = v33;
  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "scaleXBy:yBy:", v26, v26);
  objc_msgSend(v35, "transformSize:", v48, height);
  v37 = v36;
  v39 = v38;
  v40 = [OADOrientedBounds alloc];
  objc_msgSend(v9, "rotation");
  v42 = v41;
  v43 = objc_msgSend(v9, "flipX");
  v44 = objc_msgSend(v9, "flipY");
  LODWORD(v45) = v42;
  v46 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v40, "initWithBounds:rotation:flipX:flipY:", v43, v44, v32 - v37 * 0.5, v34 - v39 * 0.5, v37, v39, v45);

  return v46;
}

+ (id)relatvieBoundsWithAbsoluteInnerBounds:(id)a3 parentBounds:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double Width;
  double Height;
  OADOrientedBounds *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  float v26;
  double v27;
  OADOrientedBounds *v28;
  CGRect v30;
  CGRect v31;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "bounds");
  v16 = v15;
  v18 = v17;
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  Width = CGRectGetWidth(v30);
  v31.origin.x = v8;
  v31.origin.y = v10;
  v31.size.width = v12;
  v31.size.height = v14;
  Height = CGRectGetHeight(v31);
  v21 = [OADOrientedBounds alloc];
  objc_msgSend(v5, "rotation");
  LODWORD(v14) = v22;
  v23 = objc_msgSend(v5, "flipX");
  v24 = objc_msgSend(v5, "flipY");
  v25 = v8 - v16;
  v26 = v10 - v18;
  LODWORD(v27) = LODWORD(v14);
  v28 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v21, "initWithBounds:rotation:flipX:flipY:", v23, v24, v25, v26, Width, Height, v27);

  return v28;
}

+ (float)fontSizeForText:(id)a3 insideRectangle:(CGSize)a4
{
  double height;
  double width;
  unint64_t v6;
  float result;

  height = a4.height;
  width = a4.width;
  v6 = objc_msgSend(a3, "length");
  if (!v6)
    return 65.0;
  result = width / (double)v6 * 2.03999996;
  if (height * 0.600000024 < result)
    return height * 0.600000024 / result * result;
  return result;
}

+ (id)internalBoundsWithBounds:(id)a3 scaleBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  OADOrientedBounds *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  float v22;
  double v23;
  OADOrientedBounds *v24;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend(v8, "bounds");
  v9 = v30.origin.x;
  v10 = v30.origin.y;
  v11 = v30.size.width;
  v12 = v30.size.height;
  v29 = CGRectGetWidth(v30);
  v31.origin.x = v9;
  v31.origin.y = v10;
  v31.size.width = v11;
  v31.size.height = v12;
  v28 = CGRectGetHeight(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v27 = CGRectGetWidth(v32);
  v33.origin.x = v9;
  v33.origin.y = v10;
  v33.size.width = v11;
  v33.size.height = v12;
  v26 = CGRectGetWidth(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v13 = CGRectGetHeight(v34);
  v35.origin.x = v9;
  v35.origin.y = v10;
  v35.size.width = v11;
  v35.size.height = v12;
  v14 = CGRectGetHeight(v35);
  v15 = [OADOrientedBounds alloc];
  objc_msgSend(v8, "rotation");
  LODWORD(v11) = v16;
  v17 = objc_msgSend(v8, "flipX");
  v18 = objc_msgSend(v8, "flipY");
  v19 = x * v29;
  v20 = y * v28;
  v21 = v27 * v26;
  v22 = v13 * v14;
  LODWORD(v23) = LODWORD(v11);
  v24 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v15, "initWithBounds:rotation:flipX:flipY:", v17, v18, v19, v20, v21, v22, v23);

  return v24;
}

+ (CGRect)transformRect:(CGRect)a3 scale:(float)a4 offsetX:(float)a5 offsetY:(float)a6
{
  double height;
  double width;
  double y;
  double x;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v17.c = v11;
  *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGAffineTransformTranslate(&v18, &v17, a5, a6);
  v16 = v18;
  CGAffineTransformScale(&v18, &v16, a4, a4);
  v12 = height * v18.c + v18.a * width;
  v13 = height * v18.d + v18.b * width;
  v14 = v18.tx + y * v18.c + v18.a * x;
  v15 = v18.ty + y * v18.d + v18.b * x;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (id)transformedBoundsWithBounds:(id)a3 transform:(id)a4
{
  id v5;
  id v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  OADOrientedBounds *v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  OADOrientedBounds *v34;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "bounds");
  v11 = TSUCenterOfRect(v7, v8, v9, v10);
  v13 = v12;
  objc_msgSend(v6, "transformPoint:", *MEMORY[0x24BDD1400], *(double *)(MEMORY[0x24BDD1400] + 8));
  v15 = v14;
  v17 = v16;
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "transformSize:", v18, v19);
  v21 = TSURectWithCenterAndSize(v11 + v15, v13 + v17, v20);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = [OADOrientedBounds alloc];
  objc_msgSend(v5, "rotation");
  v30 = v29;
  v31 = objc_msgSend(v5, "flipX");
  v32 = objc_msgSend(v5, "flipY");
  LODWORD(v33) = v30;
  v34 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v28, "initWithBounds:rotation:flipX:flipY:", v31, v32, v21, v23, v25, v27, v33);

  return v34;
}

+ (float)intersectionAngleNextToAngle:(float)a3 isAfter:(BOOL)a4 nodeSize:(CGSize)a5
{
  double height;
  double width;
  float v8;
  __double2 v9;
  uint64_t v10;
  int v11;
  float v12;
  float v13;
  float v14;
  double v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  float v22;
  uint64_t v23;
  float v24;
  float v25;
  char v26;
  char v27;
  float v28;
  float v29;
  float v30;
  double v31;
  float v32;
  uint64_t v33;
  char v34;
  char v35;
  float v36;
  _BOOL4 v37;
  float result;
  void *v39;
  _BOOL4 v40;
  float v41;
  void *v43;
  int v44;
  _DWORD v45[4];
  _QWORD v46[2];

  height = a5.height;
  width = a5.width;
  v40 = a4;
  v46[1] = *MEMORY[0x24BDAC8D0];
  v46[0] = 0;
  objc_msgSend(a1, "normalizedAngle:");
  v41 = v8;
  v9 = __sincos_stret(v8 * 3.14159265 / 180.0);
  v10 = 0;
  v11 = 0;
  v12 = v9.__cosval * 0.5 - width * 0.5;
  v13 = v9.__sinval * 0.5 - height * 0.5;
  v14 = width * 0.5 + v9.__cosval * 0.5;
  v15 = height * 0.5 + v9.__sinval * 0.5;
  *(float *)&v15 = v15;
  v16 = 1;
  *(float *)v45 = v12;
  *(float *)&v45[1] = v13;
  *(float *)&v45[2] = v14;
  v45[3] = LODWORD(v15);
  do
  {
    v17 = 0;
    v44 = *((_DWORD *)&qword_22A4BE918 + v10);
    v18 = v16 & 1;
    if ((v16 & 1) != 0)
      v19 = 3;
    else
      v19 = 2;
    v20 = 1;
    do
    {
      v21 = v20;
      v22 = *(float *)&v45[2 * *((_DWORD *)&qword_22A4BE918 + v17) + v44];
      if (fabsf(v22) <= 0.5)
      {
        v23 = 0;
        v24 = sqrtf(0.25 - (float)(v22 * v22));
        v25 = *(float *)&v45[v18];
        v26 = 1;
        do
        {
          v27 = v26;
          v28 = v24 * (float)*((int *)&unk_22A4BE760 + v23);
          if (v28 > v25 && v28 < *(float *)&v45[v19])
          {
            if ((_DWORD)v18)
              v29 = v22;
            else
              v29 = v24 * (float)*((int *)&unk_22A4BE760 + v23);
            if ((_DWORD)v18)
              v30 = v24 * (float)*((int *)&unk_22A4BE760 + v23);
            else
              v30 = v22;
            if (v11 >= 2)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CMShapeUtils.mm"), 488, CFSTR("Unexpected intersection count"));

            }
            v31 = (float)(atan2f(v30, v29) * 180.0) / 3.14159265;
            *(float *)&v31 = v31;
            objc_msgSend(a1, "normalizedAngle:", v31);
            *((_DWORD *)v46 + v11++) = LODWORD(v15);
          }
          v26 = 0;
          v23 = 1;
        }
        while ((v27 & 1) != 0);
      }
      v20 = 0;
      v17 = 1;
    }
    while ((v21 & 1) != 0);
    v16 = 0;
    v10 = 1;
  }
  while ((v18 & 1) != 0);
  v32 = v41;
  if (v11 != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CMShapeUtils.mm"), 495, CFSTR("Unexpected intersection count"));

    v32 = v41;
  }
  v33 = 0;
  LODWORD(v15) = 1135869952;
  if (!v40)
    *(float *)&v15 = 0.0;
  v34 = 1;
  do
  {
    v35 = v34;
    v36 = *((float *)v46 + v33) - v32;
    if (v36 < 0.0)
      v36 = v36 + 360.0;
    v37 = v36 >= *(float *)&v15;
    if (!v40)
      v37 = v36 <= *(float *)&v15;
    if (!v37)
      *(float *)&v15 = v36;
    v33 = 1;
    v34 = 0;
  }
  while ((v35 & 1) != 0);
  *(float *)&v15 = v32 + *(float *)&v15;
  objc_msgSend(a1, "normalizedAngle:", v15);
  return result;
}

+ (float)normalizedAngle:(float)a3
{
  return (float)((float)(a3 / 360.0) - floorf(a3 / 360.0)) * 360.0;
}

+ (id)absoluteOrientedBoundsWithRelativeOrientedBounds:(id)a3 parentOrientedBounds:(id)a4 parentLogicalBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  double MidX;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  float v34;
  float v35;
  float v36;
  float v37;
  OADOrientedBounds *v38;
  double v39;
  int v40;
  OADOrientedBounds *v41;
  CGRect v43;
  CGRect v44;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3;
  v11 = a4;
  +[CMShapeUtils transformFromBounds:toOrientedBounds:](CMShapeUtils, "transformFromBounds:toOrientedBounds:", v11, x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  MidX = CGRectGetMidX(v43);
  objc_msgSend(v10, "bounds");
  objc_msgSend(v12, "transformPoint:", MidX, CGRectGetMidY(v44));
  v15 = v14;
  v17 = v16;
  objc_msgSend(v10, "bounds");
  objc_msgSend(v12, "transformSize:", v18, v19);
  v21 = TSURectWithCenterAndSize(v15, v17, v20);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = objc_msgSend(v11, "flipX");
  v29 = objc_msgSend(v10, "flipX");
  v30 = objc_msgSend(v11, "flipY");
  v31 = objc_msgSend(v10, "flipY");
  v32 = objc_msgSend(v10, "flipX");
  v33 = objc_msgSend(v10, "flipY");
  objc_msgSend(v10, "rotation");
  v35 = v34;
  objc_msgSend(v11, "rotation");
  v37 = v36;
  v38 = [OADOrientedBounds alloc];
  if (v33)
    v40 = -1;
  else
    v40 = 1;
  if (v32)
    v40 = -v40;
  *(float *)&v39 = v35 + (float)((float)v40 * v37);
  v41 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v38, "initWithBounds:rotation:flipX:flipY:", v28 ^ v29, v30 ^ v31, v21, v23, v25, v27, v39);

  return v41;
}

+ (double)fixedPointDegToRad:(int)a3
{
  return (double)a3 * 0.000000266316109;
}

+ (int)radToFixedPointDeg:(double)a3
{
  double v4;

  objc_msgSend(a1, "fixedPointDegToRad:", 1);
  return (int)(a3 / v4);
}

+ (int)radToNativeAngle:(double)a3 isEscher:(BOOL)a4
{
  if (a4)
    return objc_msgSend(a1, "radToFixedPointDeg:", a3);
  else
    return objc_msgSend(a1, "radToMilliMinutes:", a3);
}

+ (int)radToMilliMinutes:(double)a3
{
  double v4;

  objc_msgSend(a1, "milliMinutesToRad:", 1);
  return (int)(a3 / v4);
}

@end
