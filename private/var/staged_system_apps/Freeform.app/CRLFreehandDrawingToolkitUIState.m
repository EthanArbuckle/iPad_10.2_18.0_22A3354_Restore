@implementation CRLFreehandDrawingToolkitUIState

- (CRLFreehandDrawingToolkitUIState)init
{
  CRLFreehandDrawingToolkitUIState *v2;
  CRLFreehandDrawingToolkitUIState *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingToolkitUIState;
  v2 = -[CRLFreehandDrawingToolkitUIState init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CRLFreehandDrawingToolkitUIState p_setupDefaultValues](v2, "p_setupDefaultValues");
  return v3;
}

- (void)p_setupDefaultValues
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = -[CRLFreehandDrawingToolkitUIState p_defaultToolType](self, "p_defaultToolType");
  self->_currentToolType = v3;
  self->_mostRecentRestorableToolType = v3;
  self->_monolineToolOpacity = 1.0;
  -[CRLFreehandDrawingToolkitUIState p_defaultStrokeWidthForToolType:](self, "p_defaultStrokeWidthForToolType:", 0);
  self->_monolineToolUnscaledWidth = v4;
  self->_penToolOpacity = 1.0;
  -[CRLFreehandDrawingToolkitUIState p_defaultStrokeWidthForToolType:](self, "p_defaultStrokeWidthForToolType:", 1);
  self->_penToolUnscaledWidth = v5;
  self->_pencilToolOpacity = 0.5;
  -[CRLFreehandDrawingToolkitUIState p_defaultStrokeWidthForToolType:](self, "p_defaultStrokeWidthForToolType:", 2);
  self->_pencilToolUnscaledWidth = v6;
  self->_crayonToolOpacity = 1.0;
  -[CRLFreehandDrawingToolkitUIState p_defaultStrokeWidthForToolType:](self, "p_defaultStrokeWidthForToolType:", 3);
  self->_crayonToolUnscaledWidth = v7;
  self->_watercolorToolOpacity = 1.0;
  -[CRLFreehandDrawingToolkitUIState p_defaultStrokeWidthForToolType:](self, "p_defaultStrokeWidthForToolType:", 4);
  self->_watercolorToolUnscaledWidth = v8;
  self->_fountainPenToolOpacity = 1.0;
  -[CRLFreehandDrawingToolkitUIState p_defaultStrokeWidthForToolType:](self, "p_defaultStrokeWidthForToolType:", 5);
  self->_fountainPenToolUnscaledWidth = v9;
  self->_markerToolOpacity = 0.800000012;
  -[CRLFreehandDrawingToolkitUIState p_defaultStrokeWidthForToolType:](self, "p_defaultStrokeWidthForToolType:", 6);
  self->_markerToolUnscaledWidth = v10;
  self->_fillToolOpacity = 1.0;
  -[CRLFreehandDrawingToolkitUIState p_defaultStrokeWidthForToolType:](self, "p_defaultStrokeWidthForToolType:", 8);
  self->_eraserToolScaledWidth = v11;
  self->_eraserToolErasesWholeObjects = 0;
  self->_currentLassoType = -[CRLFreehandDrawingToolkitUIState p_defaultLassoType](self, "p_defaultLassoType");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkitUIState p_defaultColorForToolType:](self, "p_defaultColorForToolType:", 0));
  -[CRLFreehandDrawingToolkitUIState setColor:forToolType:](self, "setColor:forToolType:", v12, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkitUIState p_defaultColorForToolType:](self, "p_defaultColorForToolType:", 1));
  -[CRLFreehandDrawingToolkitUIState setColor:forToolType:](self, "setColor:forToolType:", v13, 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkitUIState p_defaultColorForToolType:](self, "p_defaultColorForToolType:", 2));
  -[CRLFreehandDrawingToolkitUIState setColor:forToolType:](self, "setColor:forToolType:", v14, 2);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkitUIState p_defaultColorForToolType:](self, "p_defaultColorForToolType:", 3));
  -[CRLFreehandDrawingToolkitUIState setColor:forToolType:](self, "setColor:forToolType:", v15, 3);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkitUIState p_defaultColorForToolType:](self, "p_defaultColorForToolType:", 4));
  -[CRLFreehandDrawingToolkitUIState setColor:forToolType:](self, "setColor:forToolType:", v16, 4);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkitUIState p_defaultColorForToolType:](self, "p_defaultColorForToolType:", 5));
  -[CRLFreehandDrawingToolkitUIState setColor:forToolType:](self, "setColor:forToolType:", v17, 5);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkitUIState p_defaultColorForToolType:](self, "p_defaultColorForToolType:", 6));
  -[CRLFreehandDrawingToolkitUIState setColor:forToolType:](self, "setColor:forToolType:", v18, 6);

  v19 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkitUIState p_defaultColorForToolType:](self, "p_defaultColorForToolType:", 7));
  -[CRLFreehandDrawingToolkitUIState setColor:forToolType:](self, "setColor:forToolType:", v19, 7);

}

- (id)p_defaultColorForToolType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
    case 5uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
      break;
    case 2uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor pencilTrayBlueColor](CRLColor, "pencilTrayBlueColor"));
      break;
    case 3uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor pencilTrayRedColor](CRLColor, "pencilTrayRedColor"));
      break;
    case 6uLL:
    case 7uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor pencilTrayYellowColor](CRLColor, "pencilTrayYellowColor"));
      break;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239B28);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFCAE4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239B48);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState p_defaultColorForToolType:]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 139, 0, "Tool type %lu does not support color", a3);

      v4 = 0;
      break;
  }
  return v4;
}

- (double)p_defaultStrokeWidthForToolType:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  uint8_t buf[4];
  unsigned int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;

  v5 = -[CRLFreehandDrawingToolkitUIState p_indexOfDefaultStrokeWidthForFreehandDrawingToolType:](self, "p_indexOfDefaultStrokeWidthForFreehandDrawingToolType:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkitUIState strokeWidthsForFreehandDrawingToolType:](self, "strokeWidthsForFreehandDrawingToolType:", a3));
  if (v5 >= (unint64_t)objc_msgSend(v6, "count"))
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239B68);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      v17 = v7;
      v18 = 2082;
      v19 = "-[CRLFreehandDrawingToolkitUIState p_defaultStrokeWidthForToolType:]";
      v20 = 2082;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m";
      v22 = 1024;
      v23 = 149;
      v24 = 2048;
      v25 = v5 + 1;
      v26 = 2048;
      v27 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The app delegate must provide at least %lu widths for tool type: %lu", buf, 0x36u);
    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239B88);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState p_defaultStrokeWidthForToolType:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 149, 0, "The app delegate must provide at least %lu widths for tool type: %lu", v5 + 1, a3);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v5));
  objc_msgSend(v12, "floatValue");
  v14 = v13;

  return v14;
}

- (id)strokeWidthsForFreehandDrawingToolType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id result;

  switch(a3)
  {
    case 0uLL:
      result = &off_1012CABB8;
      break;
    case 1uLL:
      result = &off_1012CAC30;
      break;
    case 2uLL:
      result = &off_1012CABD0;
      break;
    case 3uLL:
      result = &off_1012CABE8;
      break;
    case 4uLL:
      result = &off_1012CAC00;
      break;
    case 5uLL:
      result = &off_1012CAC18;
      break;
    case 6uLL:
      result = &off_1012CAC48;
      break;
    case 7uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239BA8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFCB64();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239BC8);
      v4 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState strokeWidthsForFreehandDrawingToolType:]"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 183, 0, "Unknown tool type %lu when generating stroke widths.", a3);

      result = &__NSArray0__struct;
      break;
    case 8uLL:
      result = &off_1012CAC60;
      break;
    default:
      result = &__NSArray0__struct;
      break;
  }
  return result;
}

- (BOOL)isEqualToFreehandDrawingToolkitUIState:(id)a3
{
  unsigned __int8 *v4;
  CRLColor *monolineToolColor;
  double monolineToolOpacity;
  double v7;
  double monolineToolUnscaledWidth;
  double v9;
  CRLColor *penToolColor;
  double penToolOpacity;
  double v12;
  double penToolUnscaledWidth;
  double v14;
  CRLColor *pencilToolColor;
  double pencilToolOpacity;
  double v17;
  double pencilToolUnscaledWidth;
  double v19;
  CRLColor *crayonToolColor;
  double crayonToolOpacity;
  double v22;
  double crayonToolUnscaledWidth;
  double v24;
  CRLColor *watercolorToolColor;
  double watercolorToolOpacity;
  double v27;
  double watercolorToolUnscaledWidth;
  double v29;
  CRLColor *fountainPenToolColor;
  double fountainPenToolOpacity;
  double v32;
  double fountainPenToolUnscaledWidth;
  double v34;
  CRLColor *markerToolColor;
  double markerToolOpacity;
  double v37;
  double markerToolUnscaledWidth;
  double v39;
  CRLColor *fillToolColor;
  double fillToolOpacity;
  double v42;
  double eraserToolScaledWidth;
  double v44;
  BOOL v45;

  v4 = (unsigned __int8 *)a3;
  if (*(_OWORD *)&self->_currentToolType != *((_OWORD *)v4 + 13))
    goto LABEL_52;
  monolineToolColor = self->_monolineToolColor;
  if ((unint64_t)monolineToolColor | *((_QWORD *)v4 + 1))
  {
    if (!-[CRLColor isEqual:](monolineToolColor, "isEqual:"))
      goto LABEL_52;
  }
  monolineToolOpacity = self->_monolineToolOpacity;
  v7 = *((double *)v4 + 2);
  if (monolineToolOpacity != v7 && vabdd_f64(monolineToolOpacity, v7) >= fabs(v7 * 0.000000999999997))
    goto LABEL_52;
  monolineToolUnscaledWidth = self->_monolineToolUnscaledWidth;
  v9 = *((double *)v4 + 3);
  if (monolineToolUnscaledWidth != v9 && vabdd_f64(monolineToolUnscaledWidth, v9) >= fabs(v9 * 0.000000999999997))
    goto LABEL_52;
  penToolColor = self->_penToolColor;
  if ((unint64_t)penToolColor | *((_QWORD *)v4 + 4) && !-[CRLColor isEqual:](penToolColor, "isEqual:"))
    goto LABEL_52;
  penToolOpacity = self->_penToolOpacity;
  v12 = *((double *)v4 + 5);
  if (penToolOpacity != v12 && vabdd_f64(penToolOpacity, v12) >= fabs(v12 * 0.000000999999997))
    goto LABEL_52;
  penToolUnscaledWidth = self->_penToolUnscaledWidth;
  v14 = *((double *)v4 + 6);
  if (penToolUnscaledWidth != v14 && vabdd_f64(penToolUnscaledWidth, v14) >= fabs(v14 * 0.000000999999997))
    goto LABEL_52;
  pencilToolColor = self->_pencilToolColor;
  if ((unint64_t)pencilToolColor | *((_QWORD *)v4 + 7) && !-[CRLColor isEqual:](pencilToolColor, "isEqual:"))
    goto LABEL_52;
  pencilToolOpacity = self->_pencilToolOpacity;
  v17 = *((double *)v4 + 8);
  if (pencilToolOpacity != v17 && vabdd_f64(pencilToolOpacity, v17) >= fabs(v17 * 0.000000999999997))
    goto LABEL_52;
  pencilToolUnscaledWidth = self->_pencilToolUnscaledWidth;
  v19 = *((double *)v4 + 9);
  if (pencilToolUnscaledWidth != v19 && vabdd_f64(pencilToolUnscaledWidth, v19) >= fabs(v19 * 0.000000999999997))
    goto LABEL_52;
  crayonToolColor = self->_crayonToolColor;
  if ((unint64_t)crayonToolColor | *((_QWORD *)v4 + 10) && !-[CRLColor isEqual:](crayonToolColor, "isEqual:"))
    goto LABEL_52;
  crayonToolOpacity = self->_crayonToolOpacity;
  v22 = *((double *)v4 + 11);
  if (crayonToolOpacity != v22 && vabdd_f64(crayonToolOpacity, v22) >= fabs(v22 * 0.000000999999997))
    goto LABEL_52;
  crayonToolUnscaledWidth = self->_crayonToolUnscaledWidth;
  v24 = *((double *)v4 + 12);
  if (crayonToolUnscaledWidth != v24 && vabdd_f64(crayonToolUnscaledWidth, v24) >= fabs(v24 * 0.000000999999997))
    goto LABEL_52;
  watercolorToolColor = self->_watercolorToolColor;
  if ((unint64_t)watercolorToolColor | *((_QWORD *)v4 + 13)
    && !-[CRLColor isEqual:](watercolorToolColor, "isEqual:"))
  {
    goto LABEL_52;
  }
  watercolorToolOpacity = self->_watercolorToolOpacity;
  v27 = *((double *)v4 + 14);
  if (watercolorToolOpacity != v27 && vabdd_f64(watercolorToolOpacity, v27) >= fabs(v27 * 0.000000999999997))
    goto LABEL_52;
  watercolorToolUnscaledWidth = self->_watercolorToolUnscaledWidth;
  v29 = *((double *)v4 + 15);
  if (watercolorToolUnscaledWidth != v29
    && vabdd_f64(watercolorToolUnscaledWidth, v29) >= fabs(v29 * 0.000000999999997))
  {
    goto LABEL_52;
  }
  fountainPenToolColor = self->_fountainPenToolColor;
  if ((unint64_t)fountainPenToolColor | *((_QWORD *)v4 + 16)
    && !-[CRLColor isEqual:](fountainPenToolColor, "isEqual:"))
  {
    goto LABEL_52;
  }
  fountainPenToolOpacity = self->_fountainPenToolOpacity;
  v32 = *((double *)v4 + 17);
  if (fountainPenToolOpacity != v32 && vabdd_f64(fountainPenToolOpacity, v32) >= fabs(v32 * 0.000000999999997))
    goto LABEL_52;
  fountainPenToolUnscaledWidth = self->_fountainPenToolUnscaledWidth;
  v34 = *((double *)v4 + 18);
  if (fountainPenToolUnscaledWidth != v34
    && vabdd_f64(fountainPenToolUnscaledWidth, v34) >= fabs(v34 * 0.000000999999997))
  {
    goto LABEL_52;
  }
  markerToolColor = self->_markerToolColor;
  if ((unint64_t)markerToolColor | *((_QWORD *)v4 + 19) && !-[CRLColor isEqual:](markerToolColor, "isEqual:"))
    goto LABEL_52;
  markerToolOpacity = self->_markerToolOpacity;
  v37 = *((double *)v4 + 20);
  if (markerToolOpacity != v37 && vabdd_f64(markerToolOpacity, v37) >= fabs(v37 * 0.000000999999997))
    goto LABEL_52;
  if (((markerToolUnscaledWidth = self->_markerToolUnscaledWidth,
         v39 = *((double *)v4 + 21),
         markerToolUnscaledWidth == v39)
     || vabdd_f64(markerToolUnscaledWidth, v39) < fabs(v39 * 0.000000999999997))
    && ((fillToolColor = self->_fillToolColor, !((unint64_t)fillToolColor | *((_QWORD *)v4 + 22)))
     || -[CRLColor isEqual:](fillToolColor, "isEqual:"))
    && ((fillToolOpacity = self->_fillToolOpacity, v42 = *((double *)v4 + 23), fillToolOpacity == v42)
     || vabdd_f64(fillToolOpacity, v42) < fabs(v42 * 0.000000999999997))
    && ((eraserToolScaledWidth = self->_eraserToolScaledWidth, v44 = *((double *)v4 + 24), eraserToolScaledWidth == v44)
     || vabdd_f64(eraserToolScaledWidth, v44) < fabs(v44 * 0.000000999999997))
    && self->_eraserToolErasesWholeObjects == v4[200])
  {
    v45 = self->_currentLassoType == *((_QWORD *)v4 + 28);
  }
  else
  {
LABEL_52:
    v45 = 0;
  }

  return v45;
}

- (unint64_t)p_indexOfDefaultStrokeWidthForFreehandDrawingToolType:(unint64_t)a3
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      return v3;
    case 2uLL:
    case 8uLL:
      v3 = 0;
      break;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      v3 = 2;
      break;
    case 6uLL:
      v3 = 1;
      break;
    case 7uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239BE8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFCBE4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239C08);
      v4 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState p_indexOfDefaultStrokeWidthForFreehandDrawingToolType:]"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 262, 0, "Unknown tool type %lu when generating stroke widths.", v3);

      goto LABEL_13;
    default:
LABEL_13:
      v3 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }
  return v3;
}

- (unint64_t)p_defaultToolType
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("CRLFreehandDrawingToolkitUIStateDefaultToolKey")));

  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(NSNumber, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("CRLFreehandDrawingToolkitUIStateDefaultToolKey")));
    v7 = sub_1002223BC(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = (unint64_t)objc_msgSend(v8, "unsignedIntegerValue");
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (unint64_t)p_defaultLassoType
{
  void *v2;
  id v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("CRLFreehandDrawingToolkitUIStateDefaultLassoTypeKey")));

  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(NSNumber, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("CRLFreehandDrawingToolkitUIStateDefaultLassoTypeKey")));
    v7 = sub_1002223BC(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v3 = objc_msgSend(v8, "unsignedIntegerValue");
  }

  return (unint64_t)v3;
}

- (void)p_setDefaultToolType:(unint64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("CRLFreehandDrawingToolkitUIStateDefaultToolKey"));

}

- (void)p_setDefaultLassoType:(unint64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("CRLFreehandDrawingToolkitUIStateDefaultLassoTypeKey"));

}

- (void)setCurrentToolType:(unint64_t)a3
{
  if (self->_currentToolType != a3)
  {
    if (-[CRLFreehandDrawingToolkitUIState shouldRestoreToolType:](self, "shouldRestoreToolType:"))
      self->_mostRecentRestorableToolType = a3;
    if (-[CRLFreehandDrawingToolkitUIState shouldDefaultToToolType:](self, "shouldDefaultToToolType:", a3))
      -[CRLFreehandDrawingToolkitUIState p_setDefaultToolType:](self, "p_setDefaultToolType:", a3);
    self->_currentToolType = a3;
  }
}

- (BOOL)shouldRestoreToolType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 8;
}

- (BOOL)shouldDefaultToToolType:(unint64_t)a3
{
  return 1;
}

- (void)setCurrentLassoType:(unint64_t)a3
{
  if (self->_currentLassoType != a3)
  {
    self->_currentLassoType = a3;
    -[CRLFreehandDrawingToolkitUIState p_setDefaultLassoType:](self, "p_setDefaultLassoType:");
  }
}

- (void)setCurrentToolColor:(id)a3
{
  -[CRLFreehandDrawingToolkitUIState setColor:forToolType:](self, "setColor:forToolType:", a3, self->_currentToolType);
}

- (void)setCurrentToolOpacity:(double)a3
{
  -[CRLFreehandDrawingToolkitUIState setOpacity:forToolType:](self, "setOpacity:forToolType:", self->_currentToolType, a3);
}

- (void)setCurrentToolWidth:(double)a3
{
  -[CRLFreehandDrawingToolkitUIState setStrokeWidth:forToolType:](self, "setStrokeWidth:forToolType:", self->_currentToolType, a3);
}

- (id)currentToolForInteractiveCanvasController:(id)a3 pencilKitCanvasViewController:(id)a4
{
  id v6;
  id v7;
  CRLFreehandDrawingToolStroke *v8;
  unint64_t currentToolType;
  double monolineToolOpacity;
  double monolineToolUnscaledWidth;
  CRLFreehandDrawingToolFillAndLegacyStroke *v12;
  CRLFreehandDrawingToolFillAndLegacyStroke *v13;

  v6 = a3;
  v7 = a4;
  switch(self->_currentToolType)
  {
    case 0uLL:
      v8 = [CRLFreehandDrawingToolStroke alloc];
      currentToolType = self->_currentToolType;
      monolineToolOpacity = self->_monolineToolOpacity;
      monolineToolUnscaledWidth = self->_monolineToolUnscaledWidth;
      goto LABEL_10;
    case 1uLL:
      v8 = [CRLFreehandDrawingToolStroke alloc];
      currentToolType = self->_currentToolType;
      monolineToolOpacity = self->_penToolOpacity;
      monolineToolUnscaledWidth = self->_penToolUnscaledWidth;
      goto LABEL_10;
    case 2uLL:
      v8 = [CRLFreehandDrawingToolStroke alloc];
      currentToolType = self->_currentToolType;
      monolineToolOpacity = self->_pencilToolOpacity;
      monolineToolUnscaledWidth = self->_pencilToolUnscaledWidth;
      goto LABEL_10;
    case 3uLL:
      v8 = [CRLFreehandDrawingToolStroke alloc];
      currentToolType = self->_currentToolType;
      monolineToolOpacity = self->_crayonToolOpacity;
      monolineToolUnscaledWidth = self->_crayonToolUnscaledWidth;
      goto LABEL_10;
    case 4uLL:
      v8 = [CRLFreehandDrawingToolStroke alloc];
      currentToolType = self->_currentToolType;
      monolineToolOpacity = self->_watercolorToolOpacity;
      monolineToolUnscaledWidth = self->_watercolorToolUnscaledWidth;
      goto LABEL_10;
    case 5uLL:
      v8 = [CRLFreehandDrawingToolStroke alloc];
      currentToolType = self->_currentToolType;
      monolineToolOpacity = self->_fountainPenToolOpacity;
      monolineToolUnscaledWidth = self->_fountainPenToolUnscaledWidth;
      goto LABEL_10;
    case 6uLL:
      v8 = [CRLFreehandDrawingToolStroke alloc];
      currentToolType = self->_currentToolType;
      monolineToolOpacity = self->_markerToolOpacity;
      monolineToolUnscaledWidth = self->_markerToolUnscaledWidth;
LABEL_10:
      v13 = -[CRLFreehandDrawingToolStroke initWithInteractiveCanvasController:pencilKitCanvasViewController:strokeToolType:opacity:unscaledWidth:](v8, "initWithInteractiveCanvasController:pencilKitCanvasViewController:strokeToolType:opacity:unscaledWidth:", v6, v7, currentToolType, monolineToolOpacity, monolineToolUnscaledWidth);
      goto LABEL_11;
    case 7uLL:
      v13 = -[CRLFreehandDrawingToolFillAndLegacyStroke initWithInteractiveCanvasController:pencilKitCanvasViewController:insertionToolType:opacity:unscaledWidth:]([CRLFreehandDrawingToolFillAndLegacyStroke alloc], "initWithInteractiveCanvasController:pencilKitCanvasViewController:insertionToolType:opacity:unscaledWidth:", v6, v7, self->_currentToolType, self->_fillToolOpacity, 0.0);
      goto LABEL_11;
    case 8uLL:
      if (self->_eraserToolErasesWholeObjects)
        v13 = -[CRLFreehandDrawingToolEraser initWithInteractiveCanvasController:scaledWidthForSlicingEraser:wholeObject:]([CRLFreehandDrawingToolEraser alloc], "initWithInteractiveCanvasController:scaledWidthForSlicingEraser:wholeObject:", v6, self->_eraserToolErasesWholeObjects, self->_eraserToolScaledWidth);
      else
        v13 = -[CRLFreehandDrawingToolPixelEraser initWithInteractiveCanvasController:pencilKitCanvasViewController:scaledWidthForSlicingEraser:]([CRLFreehandDrawingToolPixelEraser alloc], "initWithInteractiveCanvasController:pencilKitCanvasViewController:scaledWidthForSlicingEraser:", v6, v7, self->_eraserToolScaledWidth);
      goto LABEL_11;
    case 9uLL:
      v13 = -[CRLFreehandDrawingToolMarquee initWithInteractiveCanvasController:]([CRLFreehandDrawingToolMarquee alloc], "initWithInteractiveCanvasController:", v6);
LABEL_11:
      v12 = v13;
      break;
    default:
      v12 = 0;
      break;
  }

  return v12;
}

- (id)colorForToolType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  CRLColor *v7;
  CRLColor *monolineToolColor;

  switch(a3)
  {
    case 0uLL:
      monolineToolColor = self->_monolineToolColor;
      goto LABEL_21;
    case 1uLL:
      monolineToolColor = self->_penToolColor;
      goto LABEL_21;
    case 2uLL:
      monolineToolColor = self->_pencilToolColor;
      goto LABEL_21;
    case 3uLL:
      monolineToolColor = self->_crayonToolColor;
      goto LABEL_21;
    case 4uLL:
      monolineToolColor = self->_watercolorToolColor;
      goto LABEL_21;
    case 5uLL:
      monolineToolColor = self->_fountainPenToolColor;
      goto LABEL_21;
    case 6uLL:
      monolineToolColor = self->_markerToolColor;
      goto LABEL_21;
    case 7uLL:
      monolineToolColor = self->_fillToolColor;
LABEL_21:
      v7 = monolineToolColor;
      break;
    case 8uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239C28);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFCC64();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239C48);
      v4 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState colorForToolType:]"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 469, 0, "Cannot get color for current tool (%zd)", self->_currentToolType);

      v7 = (CRLColor *)objc_claimAutoreleasedReturnValue(+[CRLColor clearColor](CRLColor, "clearColor"));
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

- (double)opacityForToolType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double result;

  switch(a3)
  {
    case 0uLL:
      result = self->_monolineToolOpacity;
      break;
    case 1uLL:
      result = self->_penToolOpacity;
      break;
    case 2uLL:
      result = self->_pencilToolOpacity;
      break;
    case 3uLL:
      result = self->_crayonToolOpacity;
      break;
    case 4uLL:
      result = self->_watercolorToolOpacity;
      break;
    case 5uLL:
      result = self->_fountainPenToolOpacity;
      break;
    case 6uLL:
      result = self->_markerToolOpacity;
      break;
    case 7uLL:
      result = self->_fillToolOpacity;
      break;
    case 8uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239C68);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFCCE4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239C88);
      v4 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState opacityForToolType:]"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 507, 0, "Cannot get opacity for current tool (%zd)", self->_currentToolType);

      result = 0.0;
      break;
    default:
      result = 1.0;
      break;
  }
  return result;
}

- (double)strokeWidthForToolType:(unint64_t)a3
{
  double monolineToolUnscaledWidth;
  void *v5;
  void *v6;
  void *v7;

  monolineToolUnscaledWidth = 0.0;
  switch(a3)
  {
    case 0uLL:
      monolineToolUnscaledWidth = self->_monolineToolUnscaledWidth;
      break;
    case 1uLL:
      monolineToolUnscaledWidth = self->_penToolUnscaledWidth;
      break;
    case 2uLL:
      monolineToolUnscaledWidth = self->_pencilToolUnscaledWidth;
      break;
    case 3uLL:
      monolineToolUnscaledWidth = self->_crayonToolUnscaledWidth;
      break;
    case 4uLL:
      monolineToolUnscaledWidth = self->_watercolorToolUnscaledWidth;
      break;
    case 5uLL:
      monolineToolUnscaledWidth = self->_fountainPenToolUnscaledWidth;
      break;
    case 6uLL:
      monolineToolUnscaledWidth = self->_markerToolUnscaledWidth;
      break;
    case 7uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239CA8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFCD64();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239CC8);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState strokeWidthForToolType:]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 545, 0, "Cannot get width for current tool (%zd)", self->_currentToolType);

      break;
    case 8uLL:
      monolineToolUnscaledWidth = self->_eraserToolScaledWidth;
      break;
    default:
      return monolineToolUnscaledWidth;
  }
  return monolineToolUnscaledWidth;
}

- (void)setColor:(id)a3 forToolType:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CRLColor *v10;
  CRLColor **p_monolineToolColor;
  CRLColor *monolineToolColor;
  CRLColor *penToolColor;
  CRLColor *pencilToolColor;
  CRLColor *crayonToolColor;
  CRLColor *watercolorToolColor;
  CRLColor *fountainPenToolColor;
  CRLColor *markerToolColor;
  CRLColor *fillToolColor;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "colorWithAlphaComponent:", 1.0));
  switch(a4)
  {
    case 0uLL:
      monolineToolColor = self->_monolineToolColor;
      p_monolineToolColor = &self->_monolineToolColor;
      v10 = monolineToolColor;
      goto LABEL_19;
    case 1uLL:
      penToolColor = self->_penToolColor;
      p_monolineToolColor = &self->_penToolColor;
      v10 = penToolColor;
      goto LABEL_19;
    case 2uLL:
      pencilToolColor = self->_pencilToolColor;
      p_monolineToolColor = &self->_pencilToolColor;
      v10 = pencilToolColor;
      goto LABEL_19;
    case 3uLL:
      crayonToolColor = self->_crayonToolColor;
      p_monolineToolColor = &self->_crayonToolColor;
      v10 = crayonToolColor;
      goto LABEL_19;
    case 4uLL:
      watercolorToolColor = self->_watercolorToolColor;
      p_monolineToolColor = &self->_watercolorToolColor;
      v10 = watercolorToolColor;
      goto LABEL_19;
    case 5uLL:
      fountainPenToolColor = self->_fountainPenToolColor;
      p_monolineToolColor = &self->_fountainPenToolColor;
      v10 = fountainPenToolColor;
      goto LABEL_19;
    case 6uLL:
      markerToolColor = self->_markerToolColor;
      p_monolineToolColor = &self->_markerToolColor;
      v10 = markerToolColor;
      goto LABEL_19;
    case 7uLL:
      fillToolColor = self->_fillToolColor;
      p_monolineToolColor = &self->_fillToolColor;
      v10 = fillToolColor;
LABEL_19:
      if (!-[CRLColor isEqual:](v10, "isEqual:", v6))
        objc_storeStrong((id *)p_monolineToolColor, v6);
      break;
    case 8uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239CE8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFCDE4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239D08);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState setColor:forToolType:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 601, 0, "Cannot set color for given tool (%zd)", a4);

      break;
    default:
      break;
  }

}

- (void)setOpacity:(double)a3 forToolType:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  switch(a4)
  {
    case 0uLL:
      self->_monolineToolOpacity = a3;
      break;
    case 1uLL:
      self->_penToolOpacity = a3;
      break;
    case 2uLL:
      self->_pencilToolOpacity = a3;
      break;
    case 3uLL:
      self->_crayonToolOpacity = a3;
      break;
    case 4uLL:
      self->_watercolorToolOpacity = a3;
      break;
    case 5uLL:
      self->_fountainPenToolOpacity = a3;
      break;
    case 6uLL:
      self->_markerToolOpacity = a3;
      break;
    case 7uLL:
      self->_fillToolOpacity = a3;
      break;
    case 8uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239D28);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFCE64();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239D48);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState setOpacity:forToolType:]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 634, 0, "Cannot set opacity for tool (%zd)", self->_currentToolType);

      break;
    default:
      return;
  }
}

- (void)setStrokeWidth:(double)a3 forToolType:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  switch(a4)
  {
    case 0uLL:
      self->_monolineToolUnscaledWidth = a3;
      break;
    case 1uLL:
      self->_penToolUnscaledWidth = a3;
      break;
    case 2uLL:
      self->_pencilToolUnscaledWidth = a3;
      break;
    case 3uLL:
      self->_crayonToolUnscaledWidth = a3;
      break;
    case 4uLL:
      self->_watercolorToolUnscaledWidth = a3;
      break;
    case 5uLL:
      self->_fountainPenToolUnscaledWidth = a3;
      break;
    case 6uLL:
      self->_markerToolUnscaledWidth = a3;
      break;
    case 7uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239D68);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFCEE4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239D88);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState setStrokeWidth:forToolType:]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 667, 0, "Cannot set width for tool (%zd)", self->_currentToolType);

      break;
    case 8uLL:
      self->_eraserToolScaledWidth = a3;
      break;
    default:
      return;
  }
}

- (int64_t)strokeWidthIndexForToolType:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  int64_t v8;
  unint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  CKRecordID v31;
  Swift::String v32;
  uint8_t buf[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkitUIState strokeWidthsForFreehandDrawingToolType:](self, "strokeWidthsForFreehandDrawingToolType:"));
  if (!objc_msgSend(v5, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239DA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFCF64();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239DC8);
    v21 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v21);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Should have at least one stroke width option.", v22, v23, v24, v25, v26, v27, v28, (uint64_t)"-[CRLFreehandDrawingToolkitUIState strokeWidthIndexForToolType:]");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState strokeWidthIndexForToolType:]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 676, 1, "Should have at least one stroke width option.");

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v31, v32);
    abort();
  }
  -[CRLFreehandDrawingToolkitUIState strokeWidthForToolType:](self, "strokeWidthForToolType:", a3);
  v7 = v6;
  v8 = 0;
  if (objc_msgSend(v5, "count"))
  {
    v9 = 0;
    v10 = 1.79769313e308;
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v9));
      objc_msgSend(v11, "crl_CGFloatValue");
      v13 = v12;

      v14 = vabdd_f64(v13, v7);
      if (v14 < v10)
      {
        v10 = v14;
        v8 = v9;
      }
      ++v9;
    }
    while (v9 < (unint64_t)objc_msgSend(v5, "count"));
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v8));
  objc_msgSend(v15, "crl_CGFloatValue");
  if (v16 == v7)
  {

  }
  else
  {
    v17 = fabs(v7 * 0.000000999999997);
    v18 = vabdd_f64(v16, v7);

    if (v18 >= v17)
    {
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_101239DE8);
      v19 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Should have been able to find exact match for stroke width. Returning closest match.", buf, 2u);
      }
    }
  }

  return v8;
}

- (void)setEraserToolErasesWholeObjects:(BOOL)a3
{
  if (self->_eraserToolErasesWholeObjects != a3)
    self->_eraserToolErasesWholeObjects = a3;
}

- (unint64_t)currentLassoType
{
  return self->_currentLassoType;
}

- (id)copy
{
  CRLFreehandDrawingToolkitUIState *v3;
  CRLColor *v4;
  CRLColor *monolineToolColor;
  CRLColor *v6;
  CRLColor *penToolColor;
  CRLColor *v8;
  CRLColor *pencilToolColor;
  CRLColor *v10;
  CRLColor *crayonToolColor;
  CRLColor *v12;
  CRLColor *watercolorToolColor;
  CRLColor *v14;
  CRLColor *fountainPenToolColor;
  CRLColor *v16;
  CRLColor *markerToolColor;
  CRLColor *v18;
  CRLColor *fillToolColor;

  v3 = objc_alloc_init(CRLFreehandDrawingToolkitUIState);
  v3->_currentToolType = self->_currentToolType;
  v3->_mostRecentRestorableToolType = self->_mostRecentRestorableToolType;
  v4 = (CRLColor *)-[CRLColor copy](self->_monolineToolColor, "copy");
  monolineToolColor = v3->_monolineToolColor;
  v3->_monolineToolColor = v4;

  v3->_monolineToolOpacity = self->_monolineToolOpacity;
  v3->_monolineToolUnscaledWidth = self->_monolineToolUnscaledWidth;
  v6 = (CRLColor *)-[CRLColor copy](self->_penToolColor, "copy");
  penToolColor = v3->_penToolColor;
  v3->_penToolColor = v6;

  v3->_penToolOpacity = self->_penToolOpacity;
  v3->_penToolUnscaledWidth = self->_penToolUnscaledWidth;
  v8 = (CRLColor *)-[CRLColor copy](self->_pencilToolColor, "copy");
  pencilToolColor = v3->_pencilToolColor;
  v3->_pencilToolColor = v8;

  v3->_pencilToolOpacity = self->_pencilToolOpacity;
  v3->_pencilToolUnscaledWidth = self->_pencilToolUnscaledWidth;
  v10 = (CRLColor *)-[CRLColor copy](self->_crayonToolColor, "copy");
  crayonToolColor = v3->_crayonToolColor;
  v3->_crayonToolColor = v10;

  v3->_crayonToolOpacity = self->_crayonToolOpacity;
  v3->_crayonToolUnscaledWidth = self->_crayonToolUnscaledWidth;
  v12 = (CRLColor *)-[CRLColor copy](self->_watercolorToolColor, "copy");
  watercolorToolColor = v3->_watercolorToolColor;
  v3->_watercolorToolColor = v12;

  v3->_watercolorToolOpacity = self->_watercolorToolOpacity;
  v3->_watercolorToolUnscaledWidth = self->_watercolorToolUnscaledWidth;
  v14 = (CRLColor *)-[CRLColor copy](self->_fountainPenToolColor, "copy");
  fountainPenToolColor = v3->_fountainPenToolColor;
  v3->_fountainPenToolColor = v14;

  v3->_fountainPenToolOpacity = self->_fountainPenToolOpacity;
  v3->_fountainPenToolUnscaledWidth = self->_fountainPenToolUnscaledWidth;
  v16 = (CRLColor *)-[CRLColor copy](self->_markerToolColor, "copy");
  markerToolColor = v3->_markerToolColor;
  v3->_markerToolColor = v16;

  v3->_markerToolOpacity = self->_markerToolOpacity;
  v3->_markerToolUnscaledWidth = self->_markerToolUnscaledWidth;
  v18 = (CRLColor *)-[CRLColor copy](self->_fillToolColor, "copy");
  fillToolColor = v3->_fillToolColor;
  v3->_fillToolColor = v18;

  v3->_fillToolOpacity = self->_fillToolOpacity;
  v3->_eraserToolScaledWidth = self->_eraserToolScaledWidth;
  v3->_eraserToolErasesWholeObjects = self->_eraserToolErasesWholeObjects;
  v3->_currentLassoType = self->_currentLassoType;
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  CRLFreehandDrawingToolkitUIState *v5;
  uint64_t v6;
  BOOL v7;

  v5 = (CRLFreehandDrawingToolkitUIState *)a3;
  if (self == v5)
  {
    v7 = 1;
  }
  else
  {
    v6 = objc_opt_class(CRLFreehandDrawingToolkitUIState, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = -[CRLFreehandDrawingToolkitUIState isEqualToFreehandDrawingToolkitUIState:](self, "isEqualToFreehandDrawingToolkitUIState:", v5);
    else
      v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_1000BBFE0((char *)&self->_currentToolType, 8);
  v4 = sub_1000BC018((char *)&self->_mostRecentRestorableToolType, 8, v3);
  v5 = sub_1000BC018((char *)&self->_eraserToolErasesWholeObjects, 1, v4);
  return sub_1000BC018((char *)&self->_currentLassoType, 8, v5);
}

- (unint64_t)currentToolType
{
  return self->_currentToolType;
}

- (unint64_t)mostRecentRestorableToolType
{
  return self->_mostRecentRestorableToolType;
}

- (BOOL)eraserToolErasesWholeObjects
{
  return self->_eraserToolErasesWholeObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillToolColor, 0);
  objc_storeStrong((id *)&self->_markerToolColor, 0);
  objc_storeStrong((id *)&self->_fountainPenToolColor, 0);
  objc_storeStrong((id *)&self->_watercolorToolColor, 0);
  objc_storeStrong((id *)&self->_crayonToolColor, 0);
  objc_storeStrong((id *)&self->_pencilToolColor, 0);
  objc_storeStrong((id *)&self->_penToolColor, 0);
  objc_storeStrong((id *)&self->_monolineToolColor, 0);
}

@end
