@implementation CRLWPRenderer

- (CRLWPRenderer)initWithContext:(CGContext *)a3
{
  CRLWPRenderer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLWPRenderer;
  v4 = -[CRLWPRenderer init](&v6, "init");
  if (v4)
    v4->_context = CGContextRetain(a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGContextRelease(self->_context);
  v3.receiver = self;
  v3.super_class = (Class)CRLWPRenderer;
  -[CRLWPRenderer dealloc](&v3, "dealloc");
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if ((id)objc_opt_class(CRLWPRenderer, a2) == a1)
  {
    v2 = objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 1.0, 0.227, 0.188, 1.0));
    v3 = (void *)qword_101414B20;
    qword_101414B20 = v2;

    v4 = objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.35, 0.766, 0.405, 1.0));
    v5 = (void *)qword_101414B28;
    qword_101414B28 = v4;

    v6 = objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.0, 0.478, 1.0, 1.0));
    v7 = (void *)qword_101414B30;
    qword_101414B30 = v6;

  }
}

+ (id)spellingMarkColor
{
  return (id)qword_101414B20;
}

+ (id)grammarMarkColor
{
  return (id)qword_101414B28;
}

+ (id)correctionAndDictationMarkColor
{
  return (id)qword_101414B30;
}

- (CGRect)getClipBoundingBox
{
  return CGContextGetClipBoundingBox(self->_context);
}

- (CGSize)convertSizeToDeviceSpace:(CGSize)a3
{
  double width;
  double height;
  CGSize v5;
  CGSize result;

  v5 = CGContextConvertSizeToDeviceSpace(self->_context, a3);
  height = v5.height;
  width = v5.width;
  result.height = height;
  result.width = width;
  return result;
}

- (void)willRenderFragmentsWithDrawingState:(const CRLWPDrawingState *)a3
{
  CGContext *context;
  id var1;
  CGContext *v7;
  __int128 v8;
  CGAffineTransform v9;
  CGAffineTransform transform;

  CGContextSaveGState(self->_context);
  context = self->_context;
  var1 = a3->var1;
  if (var1)
    objc_msgSend(var1, "transformFromWP");
  else
    memset(&transform, 0, sizeof(transform));
  CGContextConcatCTM(context, &transform);
  v7 = self->_context;
  v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v9.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v9.c = v8;
  *(_OWORD *)&v9.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGContextSetTextMatrix(v7, &v9);
}

- (void)didRenderFragments
{
  CGContextRestoreGState(self->_context);
}

- (void)drawFragment:(const void *)a3 updateRect:(CGRect)a4 drawingState:(const CRLWPDrawingState *)a5 runState:(id *)a6 lineDrawFlags:(unint64_t)a7
{
  double height;
  double width;
  double y;
  double x;
  void *v15;
  id v16;
  void *v17;
  __int128 *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  __int128 *v23;
  __int128 *v24;
  __int128 *v25;
  __int128 *v26;
  CGSize size;
  unsigned int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *i;
  id v39;
  void *v40;
  unsigned int v41;
  id v42;
  uint64_t v43;
  void *j;
  void *v45;
  double v46;
  double v47;
  double v48;
  NSUInteger *v49;
  NSUInteger v50;
  NSUInteger v51;
  NSMutableArray *v52;
  __int128 *v53;
  id v54;
  void *v55;
  BOOL v56;
  __int128 *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 *v62;
  __int128 *v63;
  __int16 v64;
  unsigned __int8 v65;
  void *v67;
  _QWORD v68[8];
  BOOL v69;
  unsigned __int8 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CGRect v79;
  _BYTE v80[128];
  _BYTE v81[128];
  NSRange v82;
  CGRect v83;
  CGRect v84;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if ((a7 & 2) != 0)
  {
    v16 = sub_100411820((uint64_t)self->_context);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v15 = v17;
    if (*((uint64_t *)a3 + 3) < 0)
      v18 = &xmmword_100EEE418;
    else
      v18 = (__int128 *)a3;
    v65 = objc_msgSend(v17, "needsSeparateRunsForLineFragmentWithRange:", *(_QWORD *)v18, *((_QWORD *)v18 + 1));
  }
  else
  {
    v15 = 0;
    v65 = 0;
  }
  v67 = v15;
  if (!a5->var0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D800);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE9584();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D820);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawFragment:updateRect:drawingState:runState:lineDrawFlags:]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 186, 0, "storage is nil");

    v15 = v67;
  }
  v22 = *((_DWORD *)a3 + 6);
  v84.origin.x = x;
  v84.origin.y = y;
  v84.size.width = width;
  v84.size.height = height;
  v83 = CGRectIntersection(*(CGRect *)((char *)a3 + 72), v84);
  if (CGRectIsEmpty(v83))
  {
    if ((a7 & 2) != 0)
    {
      if (*((uint64_t *)a3 + 3) < 0)
        v23 = &xmmword_100EEE418;
      else
        v23 = (__int128 *)a3;
      objc_msgSend(v15, "beginLineFragmentWithRange:", *(_QWORD *)v23, *((_QWORD *)v23 + 1));
      if (*((uint64_t *)a3 + 3) < 0)
        v24 = &xmmword_100EEE418;
      else
        v24 = (__int128 *)a3;
      objc_msgSend(v15, "beginLineFragmentBodyWithRange:", *(_QWORD *)v24, *((_QWORD *)v24 + 1));
      if (*((uint64_t *)a3 + 3) < 0)
        v25 = &xmmword_100EEE418;
      else
        v25 = (__int128 *)a3;
      objc_msgSend(v15, "endLineFragmentBodyWithRange:", *(_QWORD *)v25, *((_QWORD *)v25 + 1));
      if (*((uint64_t *)a3 + 3) < 0)
        v26 = &xmmword_100EEE418;
      else
        v26 = (__int128 *)a3;
      objc_msgSend(v15, "endLineFragmentWithRange:", *(_QWORD *)v26, *((_QWORD *)v26 + 1));
    }
  }
  else
  {
    v64 = v22;
    size = CGRectZero.size;
    v79.origin = CGRectZero.origin;
    v79.size = size;
    v28 = -[CRLWPRenderer shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:](self, "shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:", a3, a5, a7, &v79, x, y, width, height);
    if (v28)
    {
      CGContextSaveGState(self->_context);
      CGContextClipToRect(self->_context, v79);
    }
    v29 = *((double *)a3 + 6);
    v30 = *((double *)a3 + 7);
    v31 = *((double *)a3 + 8);
    v33 = *((double *)a3 + 4);
    v32 = *((double *)a3 + 5);
    if ((a7 & 1) != 0)
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v34 = sub_10013E780((uint64_t)a3);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(_QWORD *)v76 != v37)
              objc_enumerationMutation(v35);
            -[CRLWPRenderer p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:](self, "p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i), a7, a5, v32, v29, v30, v31);
          }
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
        }
        while (v36);
      }

    }
    if ((a7 & 0x3000) != 0)
    {
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v39 = sub_10013E788((uint64_t)a3);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      v41 = v28;
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v72;
        do
        {
          for (j = 0; j != v42; j = (char *)j + 1)
          {
            if (*(_QWORD *)v72 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)j);
            if (objc_msgSend(v45, "shouldRenderForLineDrawFlags:", a7))
            {
              v46 = v29;
              v47 = v31;
              if ((*((_BYTE *)a3 + 28) & 1) == 0)
              {
                v48 = *((double *)a3 + 15);
                v47 = v48 + *((double *)a3 + 17);
                v46 = v33 - v48;
              }
              -[CRLWPRenderer p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:](self, "p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:", v45, a7, a5, v32, v46, v30, v47);
            }
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
        }
        while (v42);
      }

      v28 = v41;
    }
    if (*((uint64_t *)a3 + 3) < 0)
      v49 = (NSUInteger *)&xmmword_100EEE418;
    else
      v49 = (NSUInteger *)a3;
    v51 = *v49;
    v50 = v49[1];
    v52 = objc_opt_new(NSMutableArray);
    if ((a7 & 0x400) != 0)
    {
      v82.location = v51;
      v82.length = v50;
      if (NSIntersectionRange(v82, (NSRange)a5[192]).length)
        -[CRLWPRenderer p_calculateMarkAdornments:drawingState:lineFragment:](self, "p_calculateMarkAdornments:drawingState:lineFragment:", v52, a5, a3);
    }
    if ((a7 & 2) != 0)
    {
      if (*((uint64_t *)a3 + 3) < 0)
        v53 = &xmmword_100EEE418;
      else
        v53 = (__int128 *)a3;
      objc_msgSend(v67, "beginLineFragmentWithRange:", *(_QWORD *)v53, *((_QWORD *)v53 + 1));
      a6->var2 = v33;
      if ((a7 & 8) != 0)
        -[CRLWPRenderer p_drawMisspelledWordMarkingsFragment:drawingState:](self, "p_drawMisspelledWordMarkingsFragment:drawingState:", a3, a5);
      if ((a7 & 0x10) != 0)
        -[CRLWPRenderer p_drawUngrammaticMarkingsFragment:drawingState:](self, "p_drawUngrammaticMarkingsFragment:drawingState:", a3, a5);
      if ((a7 & 0x200) != 0)
        -[CRLWPRenderer p_drawDictationMarkingsFragment:drawingState:](self, "p_drawDictationMarkingsFragment:drawingState:", a3, a5);
      if ((a7 & 0x800) != 0)
        -[CRLWPRenderer p_drawAutocorrectionMarkingsFragment:drawingState:](self, "p_drawAutocorrectionMarkingsFragment:drawingState:", a3, a5);
      v54 = sub_10013E750((uint64_t)a3);
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      v56 = v55 == 0;

      if (!v56)
        -[CRLWPRenderer p_drawListLabelForFragment:drawingState:lineDrawFlags:](self, "p_drawListLabelForFragment:drawingState:lineDrawFlags:", a3, a5, a7);
      if (*((uint64_t *)a3 + 3) < 0)
        v57 = &xmmword_100EEE418;
      else
        v57 = (__int128 *)a3;
      objc_msgSend(v67, "beginLineFragmentBodyWithRange:", *(_QWORD *)v57, *((_QWORD *)v57 + 1));
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_1000256F4;
      v68[3] = &unk_10122D848;
      *(double *)&v68[6] = v33;
      v68[4] = self;
      v68[5] = a3;
      v68[7] = a5;
      v69 = (v64 & 0x2000) != 0;
      v70 = v65;
      v58 = objc_retainBlock(v68);
      if (((!a5->var4 || !a5->var23.length)
         && (v59 = sub_10013E674((uint64_t)a3),
             ((void (*)(_QWORD *, uint64_t, _QWORD, _QWORD))v58[2])(v58, v59, 0, 0),
             !a5->var4)
         || a5->var23.length)
        && (v60 = sub_10013E67C((uint64_t)a3),
            ((void (*)(_QWORD *, uint64_t, _QWORD, uint64_t))v58[2])(v58, v60, 0, 1),
            !a5->var4)
        || !a5->var23.length)
      {
        v61 = sub_10013E6F8((uint64_t)a3);
        ((void (*)(_QWORD *, uint64_t, uint64_t, _QWORD))v58[2])(v58, v61, 1, 0);
      }
      if (*((uint64_t *)a3 + 3) < 0)
        v62 = &xmmword_100EEE418;
      else
        v62 = (__int128 *)a3;
      objc_msgSend(v67, "endLineFragmentBodyWithRange:", *(_QWORD *)v62, *((_QWORD *)v62 + 1));
      if (*((uint64_t *)a3 + 3) < 0)
        v63 = &xmmword_100EEE418;
      else
        v63 = (__int128 *)a3;
      objc_msgSend(v67, "endLineFragmentWithRange:", *(_QWORD *)v63, *((_QWORD *)v63 + 1));

    }
    if (v28)
      CGContextRestoreGState(self->_context);

    v15 = v67;
  }

}

- (void)drawAdornmentsForFragment:(const void *)a3 updateRect:(CGRect)a4 drawingState:(const CRLWPDrawingState *)a5 runState:(id *)a6 lineDrawFlags:(unint64_t)a7
{
  double height;
  double width;
  double y;
  double x;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  CGSize size;
  unsigned int v21;
  double v22;
  double v23;
  NSUInteger *v24;
  NSUInteger v25;
  NSUInteger v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *i;
  NSMutableArray *v33;
  id v34;
  uint64_t v35;
  void *j;
  id v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *k;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *m;
  id v48;
  void *v49;
  NSMutableArray *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  CGRect v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  NSRange v72;
  CGRect v73;
  CGRect v74;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (!a5->var0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D868);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE9604();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D888);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawAdornmentsForFragment:updateRect:drawingState:runState:lineDrawFlags:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 522, 0, "storage is nil");

  }
  v19 = *((_QWORD *)a3 + 3);
  v74.origin.x = x;
  v74.origin.y = y;
  v74.size.width = width;
  v74.size.height = height;
  v73 = CGRectIntersection(*(CGRect *)((char *)a3 + 72), v74);
  if (!CGRectIsEmpty(v73))
  {
    size = CGRectZero.size;
    v67.origin = CGRectZero.origin;
    v67.size = size;
    v21 = -[CRLWPRenderer shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:](self, "shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:", a3, a5, a7, &v67, x, y, width, height);
    if (v21)
    {
      CGContextSaveGState(self->_context);
      CGContextClipToRect(self->_context, v67);
    }
    v22 = *((double *)a3 + 4);
    v23 = *((double *)a3 + 5);
    if (*((uint64_t *)a3 + 3) < 0)
      v24 = (NSUInteger *)&xmmword_100EEE418;
    else
      v24 = (NSUInteger *)a3;
    v26 = *v24;
    v25 = v24[1];
    v50 = objc_opt_new(NSMutableArray);
    if ((a7 & 0x400) != 0)
    {
      v72.location = v26;
      v72.length = v25;
      if (NSIntersectionRange(v72, (NSRange)a5[192]).length)
        -[CRLWPRenderer p_calculateMarkAdornments:drawingState:lineFragment:](self, "p_calculateMarkAdornments:drawingState:lineFragment:", v50, a5, a3);
    }
    if ((a7 & 2) != 0)
    {
      a6->var2 = v22;
      if (!a5->var4 || !a5->var23.length)
      {
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v27 = sub_10013E770((uint64_t)a3);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
        v30 = (v19 >> 13) & 1;
        if (v29)
        {
          v31 = *(_QWORD *)v64;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(_QWORD *)v64 != v31)
                objc_enumerationMutation(v28);
              -[CRLWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i), a5, a3, v30, v23, v22);
            }
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
          }
          while (v29);
        }

        if ((a7 & 0x400) != 0)
        {
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v33 = v50;
          v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
          if (v34)
          {
            v35 = *(_QWORD *)v60;
            do
            {
              for (j = 0; j != v34; j = (char *)j + 1)
              {
                if (*(_QWORD *)v60 != v35)
                  objc_enumerationMutation(v33);
                v37 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j);
                -[CRLWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", v37, a5, a3, v30, v23, v22);

              }
              v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
            }
            while (v34);
          }

        }
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v38 = sub_10013E778((uint64_t)a3);
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
        if (v40)
        {
          v41 = *(_QWORD *)v56;
          do
          {
            for (k = 0; k != v40; k = (char *)k + 1)
            {
              if (*(_QWORD *)v56 != v41)
                objc_enumerationMutation(v39);
              -[CRLWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)k), a5, a3, v30, v23, v22);
            }
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
          }
          while (v40);
        }

        CGContextSetTextDrawingMode(self->_context, kCGTextFill);
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v43 = sub_10013E790((uint64_t)a3);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
        if (v45)
        {
          v46 = *(_QWORD *)v52;
          do
          {
            for (m = 0; m != v45; m = (char *)m + 1)
            {
              if (*(_QWORD *)v52 != v46)
                objc_enumerationMutation(v44);
              -[CRLWPRenderer p_drawAdornments:lineFragment:state:](self, "p_drawAdornments:lineFragment:state:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)m), a3, a5);
            }
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
          }
          while (v45);
        }

        v48 = sub_10013E7A4((uint64_t)a3);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        if (v49)
          -[CRLWPRenderer p_drawInvisiblesBreakLine:lineFragment:state:](self, "p_drawInvisiblesBreakLine:lineFragment:state:", v49, a3, a5);

      }
    }
    if (v21)
      CGContextRestoreGState(self->_context);

  }
}

- (void)p_clipToInteriorClippingPath
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRenderer interiorClippingPath](self, "interiorClippingPath"));
  if (v3 && (objc_msgSend(v3, "isEmpty") & 1) == 0)
  {
    CGContextAddPath(self->_context, (CGPathRef)objc_msgSend(objc_retainAutorelease(v3), "CGPath"));
    CGContextClip(self->_context);
  }

}

- (void)drawCharacterFillAdornmentRects:(id)a3 forColumn:(id)a4 excludeRange:(_NSRange)a5 drawingState:(const CRLWPDrawingState *)a6
{
  NSUInteger location;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat x;
  double v17;
  CGFloat y;
  double v19;
  CGFloat width;
  double v21;
  CGFloat height;
  void *v23;
  _BOOL4 v24;
  unsigned int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  unsigned int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGContext *context;
  void *v45;
  BOOL v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id obj;
  NSUInteger length;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform transform;
  CGAffineTransform v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  CGAffineTransform buf;
  _BYTE v67[128];
  CGRect v68;
  CGRect v69;

  length = a5.length;
  location = a5.location;
  v10 = a3;
  v54 = a4;
  v53 = v10;
  if (objc_msgSend(v10, "count"))
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v63;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v63 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v13);
          objc_msgSend(v14, "rect");
          x = v15;
          y = v17;
          width = v19;
          height = v21;
          if (objc_msgSend(v14, "type") == 4)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fill"));
            v24 = v23 == 0;

            if (v24)
            {
              v25 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10122D8A8);
              v26 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf.a) = 67110146;
                HIDWORD(buf.a) = v25;
                LOWORD(buf.b) = 2082;
                *(_QWORD *)((char *)&buf.b + 2) = "-[CRLWPRenderer drawCharacterFillAdornmentRects:forColumn:excludeRange:drawingState:]";
                WORD1(buf.c) = 2082;
                *(_QWORD *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm";
                WORD2(buf.d) = 1024;
                *(_DWORD *)((char *)&buf.d + 6) = 625;
                WORD1(buf.tx) = 2082;
                *(_QWORD *)((char *)&buf.tx + 4) = "adornment.fill";
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", (uint8_t *)&buf, 0x2Cu);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10122D8C8);
              v27 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
              {
                v50 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                LODWORD(buf.a) = 67109378;
                HIDWORD(buf.a) = v25;
                LOWORD(buf.b) = 2114;
                *(_QWORD *)((char *)&buf.b + 2) = v50;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);

              }
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawCharacterFillAdornmentRects:forColumn:excludeRange:drawingState:]"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 625, 0, "invalid nil value for '%{public}s'", "adornment.fill");

            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
            v31 = v30 == 0;

            if (v31)
            {
              v32 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10122D8E8);
              v33 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf.a) = 67110146;
                HIDWORD(buf.a) = v32;
                LOWORD(buf.b) = 2082;
                *(_QWORD *)((char *)&buf.b + 2) = "-[CRLWPRenderer drawCharacterFillAdornmentRects:forColumn:excludeRange:drawingState:]";
                WORD1(buf.c) = 2082;
                *(_QWORD *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm";
                WORD2(buf.d) = 1024;
                *(_DWORD *)((char *)&buf.d + 6) = 626;
                WORD1(buf.tx) = 2082;
                *(_QWORD *)((char *)&buf.tx + 4) = "adornment.path";
                _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", (uint8_t *)&buf, 0x2Cu);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10122D908);
              v34 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
              {
                v51 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                LODWORD(buf.a) = 67109378;
                HIDWORD(buf.a) = v32;
                LOWORD(buf.b) = 2114;
                *(_QWORD *)((char *)&buf.b + 2) = v51;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);

              }
              v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawCharacterFillAdornmentRects:forColumn:excludeRange:drawingState:]"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 626, 0, "invalid nil value for '%{public}s'", "adornment.path");

            }
            if (a6->var4 || location != 0x7FFFFFFFFFFFFFFFLL || length)
              v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathFromExcludeRange:limitSelection:rubyGlyphRange:", location, length));
            else
              v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
            v38 = (void *)v37;
            if (v37)
            {
              CGContextSaveGState(self->_context);
              if (objc_msgSend(v54, "textIsVertical"))
              {
                v39 = sub_100061400(x, y, width, height);
                v41 = v40;
                memset(&buf, 0, sizeof(buf));
                CGAffineTransformMakeRotation(&v61, -1.57079633);
                v42 = sub_1000603DC(v39, v41, -1.0);
                sub_1000796D4(&v61, &buf, v42, v43);
                context = self->_context;
                transform = buf;
                CGContextConcatCTM(context, &transform);
                v58 = buf;
                CGAffineTransformInvert(&v59, &v58);
                objc_msgSend(v38, "transformUsingAffineTransform:", &v59);
                v57 = buf;
                v68.origin.x = x;
                v68.origin.y = y;
                v68.size.width = width;
                v68.size.height = height;
                v69 = CGRectApplyAffineTransform(v68, &v57);
                x = v69.origin.x;
                y = v69.origin.y;
                width = v69.size.width;
                height = v69.size.height;
              }
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "shadow"));
              v46 = v45 == 0;

              if (!v46)
              {
                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "shadow"));
                objc_msgSend(v47, "applyToContext:viewScale:flipped:", self->_context, self->_flipShadows, self->_viewScale);

                CGContextBeginTransparencyLayer(self->_context, 0);
              }
              v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fill"));
              objc_msgSend((id)v48, "paintPath:naturalBounds:inContext:isPDF:", objc_msgSend(objc_retainAutorelease(v38), "CGPath"), self->_context, 0, x, y, width, height);

              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "shadow"));
              LOBYTE(v48) = v49 == 0;

              if ((v48 & 1) == 0)
                CGContextEndTransparencyLayer(self->_context);
              CGContextRestoreGState(self->_context);
            }

          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        v11 = v52;
      }
      while (v52);
    }

  }
}

- (void)drawCharacterStrokeAdornmentRects:(id)a3 forColumn:(id)a4 excludeRange:(_NSRange)a5 drawingState:(const CRLWPDrawingState *)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  BOOL v34;
  char *v35;
  char *v36;
  id v37;
  id v38;
  id obj;
  NSUInteger length;
  NSUInteger location;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  unsigned int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  const char *v55;
  _BYTE v56[128];

  length = a5.length;
  location = a5.location;
  v38 = a3;
  if (objc_msgSend(v38, "count"))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v38;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v43;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v43 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v10);
          if (objc_msgSend(v11, "type") == 5)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stroke"));
            v13 = v12 == 0;

            if (v13)
            {
              v14 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10122D928);
              v15 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110146;
                v47 = v14;
                v48 = 2082;
                v49 = "-[CRLWPRenderer drawCharacterStrokeAdornmentRects:forColumn:excludeRange:drawingState:]";
                v50 = 2082;
                v51 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm";
                v52 = 1024;
                v53 = 676;
                v54 = 2082;
                v55 = "adornment.stroke";
                _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10122D948);
              v16 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
              {
                v35 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = 67109378;
                v47 = v14;
                v48 = 2114;
                v49 = v35;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawCharacterStrokeAdornmentRects:forColumn:excludeRange:drawingState:]"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 676, 0, "invalid nil value for '%{public}s'", "adornment.stroke");

            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
            v20 = v19 == 0;

            if (v20)
            {
              v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10122D968);
              v22 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110146;
                v47 = v21;
                v48 = 2082;
                v49 = "-[CRLWPRenderer drawCharacterStrokeAdornmentRects:forColumn:excludeRange:drawingState:]";
                v50 = 2082;
                v51 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm";
                v52 = 1024;
                v53 = 677;
                v54 = 2082;
                v55 = "adornment.path";
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10122D988);
              v23 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
              {
                v36 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = 67109378;
                v47 = v21;
                v48 = 2114;
                v49 = v36;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawCharacterStrokeAdornmentRects:forColumn:excludeRange:drawingState:]"));
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 677, 0, "invalid nil value for '%{public}s'", "adornment.path");

            }
            if (a6->var4 || location != 0x7FFFFFFFFFFFFFFFLL || length)
              v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathFromExcludeRange:limitSelection:rubyGlyphRange:", location, length));
            else
              v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
            v27 = (void *)v26;
            if (v26)
            {
              CGContextSaveGState(self->_context);
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shadow"));
              v29 = v28 == 0;

              if (!v29)
              {
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shadow"));
                objc_msgSend(v30, "applyToContext:viewScale:flipped:", self->_context, self->_flipShadows, self->_viewScale);

                CGContextBeginTransparencyLayer(self->_context, 0);
              }
              v31 = sub_100412B3C((uint64_t)self->_context);
              sub_100412A44((uint64_t)self->_context, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stroke"));
              objc_msgSend(v32, "paintPath:inContext:", objc_msgSend(objc_retainAutorelease(v27), "CGPath"), self->_context);

              sub_100412A44((uint64_t)self->_context, v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shadow"));
              v34 = v33 == 0;

              if (!v34)
                CGContextEndTransparencyLayer(self->_context);
              CGContextRestoreGState(self->_context);
            }

          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
        v8 = v37;
      }
      while (v37);
    }

  }
}

- (void)drawAdornmentRects:(id)a3 forColumn:(id)a4 foreground:(BOOL)a5 drawingState:(const CRLWPDrawingState *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  CGPath *Mutable;
  CGFloat MaxX;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  NSMutableArray *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v43;
  double v44;
  double v45;
  CGFloat MinY;
  CGFloat v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  unsigned int v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  char *v58;
  id v59;
  NSMutableArray *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  unsigned int v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  const char *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v7 = a5;
  v59 = a3;
  if (objc_msgSend(v59, "count"))
  {
    CGContextSaveGState(self->_context);
    -[CRLWPRenderer p_clipToInteriorClippingPath](self, "p_clipToInteriorClippingPath");
    v60 = objc_opt_new(NSMutableArray);
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v9 = v59;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v66 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "rect");
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v21 = v20;
          if (!a6->var4 && !v7)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fill"));
            if (v22)
            {
              v23 = objc_msgSend(v13, "type") == 1;

              if (v23)
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fill"));
                objc_msgSend(v24, "paintRect:inContext:", self->_context, v15, v17, v19, v21);

              }
            }
          }
          if (!a6->var4 && v7)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stroke"));
            if (v25)
            {
              v26 = objc_msgSend(v13, "type") == 2;

              if (v26)
              {
                CGContextSetShouldAntialias(self->_context, 1);
                if (v21 == 0.0)
                {
                  Mutable = CGPathCreateMutable();
                  CGPathMoveToPoint(Mutable, 0, v15, v17);
                  v81.origin.x = v15;
                  v81.origin.y = v17;
                  v81.size.width = v19;
                  v81.size.height = v21;
                  MaxX = CGRectGetMaxX(v81);
                  CGPathAddLineToPoint(Mutable, 0, MaxX, v17);
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stroke"));
                  objc_msgSend(v29, "paintPath:inContext:", Mutable, self->_context);

                  CGPathRelease(Mutable);
                }
                else
                {
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stroke"));
                  objc_msgSend(v30, "paintRect:inContext:", self->_context, v15, v17, v19, v21);

                }
              }
            }
          }
          if (v7)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fill"));
            if (v31)
            {
              v32 = objc_msgSend(v13, "type") == 3;

              if (v32)
                -[NSMutableArray addObject:](v60, "addObject:", v13);
            }
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
      }
      while (v10);
    }

    CGContextRestoreGState(self->_context);
    if (-[NSMutableArray count](v60, "count"))
    {
      CGContextSaveGState(self->_context);
      CGContextSetShouldAntialias(self->_context, 1);
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v33 = v60;
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v62;
        do
        {
          v36 = 0;
          do
          {
            if (*(_QWORD *)v62 != v35)
              objc_enumerationMutation(v33);
            v37 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v36);
            objc_msgSend(v37, "rect");
            x = v82.origin.x;
            y = v82.origin.y;
            width = v82.size.width;
            height = v82.size.height;
            MinX = CGRectGetMinX(v82);
            v43 = sub_10006309C(MinX, self->_viewScale);
            v83.origin.x = x;
            v83.origin.y = y;
            v83.size.width = width;
            v83.size.height = height;
            v44 = CGRectGetWidth(v83);
            v45 = sub_10006309C(v44, self->_viewScale);
            v84.origin.x = x;
            v84.origin.y = y;
            v84.size.width = width;
            v84.size.height = height;
            MinY = CGRectGetMinY(v84);
            v85.origin.x = x;
            v85.origin.y = y;
            v85.size.width = width;
            v85.size.height = height;
            v47 = CGRectGetHeight(v85);
            v49 = objc_opt_class(CRLColorFill, v48);
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "fill"));
            v51 = sub_100221D0C(v49, v50);
            v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

            if (v52)
            {
              CGContextSetFillColorWithColor(self->_context, (CGColorRef)objc_msgSend(v52, "CGColor"));
              v86.origin.x = v43;
              v86.origin.y = MinY;
              v86.size.width = v45;
              v86.size.height = v47;
              CGContextFillRect(self->_context, v86);
            }
            else
            {
              v53 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10122D9A8);
              v54 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110146;
                v70 = v53;
                v71 = 2082;
                v72 = "-[CRLWPRenderer drawAdornmentRects:forColumn:foreground:drawingState:]";
                v73 = 2082;
                v74 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm";
                v75 = 1024;
                v76 = 774;
                v77 = 2082;
                v78 = "colorFill";
                _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10122D9C8);
              v55 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_ERROR))
              {
                v58 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = 67109378;
                v70 = v53;
                v71 = 2114;
                v72 = v58;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v55, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawAdornmentRects:forColumn:foreground:drawingState:]"));
              v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v56, v57, 774, 0, "invalid nil value for '%{public}s'", "colorFill");

            }
            v36 = (char *)v36 + 1;
          }
          while (v34 != v36);
          v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
        }
        while (v34);
      }

      CGContextRestoreGState(self->_context);
    }

  }
}

- (BOOL)shouldClipFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4 lineDrawFlags:(unint64_t)a5 updateRect:(CGRect)a6 outClipRect:(CGRect *)a7
{
  double height;
  double width;
  double y;
  double x;
  char v12;
  void *v15;
  void *v16;
  void *v17;
  BOOL result;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  CFIndex v24;
  double MaxX;
  double v26;
  double MinX;
  int v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double MaxY;
  double v36;
  double MinY;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  CGFloat rect;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a5;
  if (!CGRectIsNull(a6))
  {
    v49.origin.x = a4->var2.origin.x;
    v19 = a4->var2.origin.y;
    v20 = a4->var2.size.width;
    v21 = a4->var2.size.height;
    rect = v49.origin.x;
    v49.origin.y = v19;
    v49.size.width = v20;
    v49.size.height = v21;
    v22 = CGRectGetWidth(v49);
    if (!a3)
    {
      if (!a4->var15)
      {
        v45 = height;
        v31 = v21;
        v32 = v20;
        v33 = v19;
        v47 = 10000000.0;
LABEL_32:
        a4->var27 = 1;
        v54.origin.x = rect;
        v54.origin.y = v33;
        v54.size.width = v32;
        v54.size.height = v31;
        v46 = v31;
        MaxY = CGRectGetMaxY(v54);
        v55.origin.x = x;
        v55.origin.y = y;
        v55.size.width = width;
        height = v45;
        v55.size.height = v45;
        v36 = CGRectGetMaxY(v55);
        if (v36 < MaxY)
          MaxY = v36;
        v56.origin.x = rect;
        v56.origin.y = v33;
        v56.size.width = v32;
        v56.size.height = v46;
        MinY = CGRectGetMinY(v56);
        if (MinY >= y)
          y = MinY;
        x = fmax(x, -10000000.0);
        goto LABEL_39;
      }
LABEL_45:
      result = 0;
LABEL_46:
      a7->origin.x = x;
      a7->origin.y = y;
      a7->size.width = width;
      a7->size.height = height;
      return result;
    }
    v23 = v22;
    v24 = sub_100145018((uint64_t)a3);
    v47 = 10000000.0;
    if ((v24 == 1 || v24 == 2 && (*((_BYTE *)a3 + 25) & 8) != 0) && rint(*((double *)a3 + 30)) > rint(v23))
    {
      objc_msgSend(a4->var1, "erasableBounds:", 0);
      v43 = v50.origin.y;
      v44 = v50.origin.x;
      v41 = v50.size.height;
      v42 = v50.size.width;
      MaxX = CGRectGetMaxX(v50);
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      v26 = CGRectGetMaxX(v51);
      if (v26 >= MaxX)
        v26 = MaxX;
      v47 = v26;
      v52.origin.y = v43;
      v52.origin.x = v44;
      v52.size.height = v41;
      v52.size.width = v42;
      MinX = CGRectGetMinX(v52);
      if (MinX >= x)
        x = MinX;
      y = fmax(y, -10000000.0);
      v28 = 1;
      if ((v12 & 2) != 0)
        goto LABEL_21;
    }
    else
    {
      v28 = 0;
      if ((v12 & 2) != 0)
      {
LABEL_21:
        if (*((_BYTE *)a3 + 488))
          v29 = *((double *)a3 + 20);
        else
          v29 = 0.0;
        v30 = *((double *)a3 + 4) + *((double *)a3 + 17) + v29;
        goto LABEL_29;
      }
    }
    v30 = CGRectGetMaxY(*(CGRect *)((char *)a3 + 40));
LABEL_29:
    v53.origin.x = rect;
    v53.origin.y = v19;
    v53.size.width = v20;
    v53.size.height = v21;
    v34 = CGRectGetMaxY(v53);
    if (!a4->var15 && rint(v30) > rint(v34))
    {
      v45 = height;
      v31 = v21;
      v32 = v20;
      v33 = v19;
      goto LABEL_32;
    }
    if (v28)
    {
      MaxY = 10000000.0;
LABEL_39:
      v57.origin.x = x;
      v57.origin.y = y;
      v57.size.width = width;
      v57.size.height = height;
      v38 = CGRectGetMaxX(v57);
      if (v38 >= v47)
        v39 = v47;
      else
        v39 = v38;
      v58.origin.x = x;
      v58.origin.y = y;
      v58.size.width = width;
      v58.size.height = height;
      v40 = CGRectGetMaxY(v58);
      if (v40 >= MaxY)
        v40 = MaxY;
      height = fmax(v40 - y, 0.0);
      width = fmax(v39 - x, 0.0);
      result = 1;
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122D9E8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE9684();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122DA08);
  v15 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 848, 0, "Should not try to clip with null update rect");

  return 0;
}

- (void)p_drawWordMarkingsForFragment:(const void *)a3 color:(id)a4 ranges:(id)a5 suppressRange:(_NSRange)a6 drawingState:(const CRLWPDrawingState *)a7
{
  NSUInteger *v11;
  NSUInteger length;
  NSUInteger location;
  void *v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  NSRange v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  int v22;
  NSRange var25;
  NSRange v24;
  _NSRange v25;
  id v26;
  id v27;
  _QWORD v28[5];
  NSRange v29;
  NSUInteger v30;
  NSUInteger v31;
  const void *v32;
  const CRLWPDrawingState *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char v40;
  BOOL v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CGFloat lengths[2];
  NSRange v49;
  NSRange v50;

  v25 = a6;
  v27 = a4;
  v26 = a5;
  if (*((uint64_t *)a3 + 3) < 0)
    v11 = (NSUInteger *)&xmmword_100EEE418;
  else
    v11 = (NSUInteger *)a3;
  location = *v11;
  length = v11[1];
  if (location + length > (unint64_t)objc_msgSend(a7->var0, "length", v25.location))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122DA28);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE9704();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122DA48);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 917, 0, "Invalid line fragment range");

    v50.location = (NSUInteger)objc_msgSend(a7->var0, "range");
    v50.length = v17;
    v49.location = location;
    v49.length = length;
    v18 = NSIntersectionRange(v49, v50);
    location = v18.location;
    length = v18.length;
  }
  CGContextSaveGState(self->_context);
  CGContextSetStrokeColorWithColor(self->_context, (CGColorRef)objc_msgSend(v27, "CGColor"));
  lengths[0] = 2.5;
  lengths[1] = 4.0 - 2.5;
  CGContextSetLineDash(self->_context, 0.0, lengths, 2uLL);
  v19 = *(_OWORD *)((char *)a3 + 152);
  v44 = *(_OWORD *)((char *)a3 + 136);
  v45 = v19;
  v20 = *(_OWORD *)((char *)a3 + 184);
  v46 = *(_OWORD *)((char *)a3 + 168);
  v47 = v20;
  v21 = *(_OWORD *)((char *)a3 + 120);
  v42 = *(_OWORD *)((char *)a3 + 104);
  v43 = v21;
  v22 = *((_DWORD *)a3 + 6);
  var25 = a7->var25;
  if (var25 == 0x7FFFFFFFFFFFFFFFuLL)
  {
    var25 = v25;
  }
  else
  {
    v24 = v25;
    if (v25.location != 0x7FFFFFFFFFFFFFFFLL || v25.length)
      var25 = NSUnionRange(v24, var25);
  }
  v28[1] = 3221225472;
  v36 = v44;
  v37 = v45;
  v38 = v46;
  v39 = v47;
  v34 = v42;
  v28[0] = _NSConcreteStackBlock;
  v28[2] = sub_100028230;
  v28[3] = &unk_10122DA70;
  v29 = var25;
  v30 = location;
  v31 = length;
  v32 = a3;
  v33 = a7;
  v40 = 0;
  v35 = v43;
  v41 = (v22 & 0x2000) != 0;
  v28[4] = self;
  objc_msgSend(v26, "enumerateRanges:", v28);
  CGContextRestoreGState(self->_context);

}

- (void)p_drawMisspelledWordMarkingsFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4
{
  __int128 *v7;
  void *v8;
  void *v9;
  id v10;

  if (*((uint64_t *)a3 + 3) < 0)
    v7 = &xmmword_100EEE418;
  else
    v7 = (__int128 *)a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4->var17, "rangesIntersecting:", *(_QWORD *)v7, *((_QWORD *)v7 + 1)));
  v10 = objc_msgSend(v8, "mutableCopy");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPRenderer spellingMarkColor](CRLWPRenderer, "spellingMarkColor"));
  -[CRLWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3, v9, v10, a4->var19.location, a4->var19.length, a4);

}

- (void)p_drawUngrammaticMarkingsFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4
{
  __int128 *v7;
  void *v8;
  __int128 *v9;
  void *v10;
  void *v11;
  id v12;

  if (*((uint64_t *)a3 + 3) < 0)
    v7 = &xmmword_100EEE418;
  else
    v7 = (__int128 *)a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4->var18, "rangesIntersecting:", *(_QWORD *)v7, *((_QWORD *)v7 + 1)));
  v12 = objc_msgSend(v8, "mutableCopy");

  if (*((uint64_t *)a3 + 3) < 0)
    v9 = &xmmword_100EEE418;
  else
    v9 = (__int128 *)a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4->var17, "rangesIntersecting:", *(_QWORD *)v9, *((_QWORD *)v9 + 1)));
  objc_msgSend(v12, "subtract:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPRenderer grammarMarkColor](CRLWPRenderer, "grammarMarkColor"));
  -[CRLWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3, v11, v12, 0x7FFFFFFFFFFFFFFFLL, 0, a4);

}

- (void)p_drawDictationMarkingsFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[CRLWPRenderer correctionAndDictationMarkColor](CRLWPRenderer, "correctionAndDictationMarkColor"));
  -[CRLWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3);

}

- (void)p_drawAutocorrectionMarkingsFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[CRLWPRenderer correctionAndDictationMarkColor](CRLWPRenderer, "correctionAndDictationMarkColor"));
  -[CRLWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3);

}

- (void)p_drawAdornmentLine:(id)a3 drawingState:(const CRLWPDrawingState *)a4 lineFragment:(const void *)a5 lineFragmentStart:(CGPoint)a6 vertical:(BOOL)a7
{
  double y;
  double x;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize v27;
  CGFloat v28;
  CGPoint v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id var4;
  NSRange v35;
  double v36;
  NSUInteger *v37;
  NSUInteger v38;
  unint64_t v39;
  NSRange v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  double MaxX;
  double v51;
  double v52;
  char v53;
  unsigned int v54;
  double v55;
  double v57;
  double v58;
  double v59;
  double v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  NSRange v63;
  CGSize v64;
  CGPoint v65;
  CGSize v66;
  CGRect v67;
  CGRect v68;

  y = a6.y;
  x = a6.x;
  v12 = a3;
  if (!objc_msgSend(v12, "color"))
    goto LABEL_39;
  objc_msgSend(v12, "thickness");
  v14 = v13;
  objc_msgSend(v12, "start");
  v16 = v15;
  v18 = v17;
  v19 = objc_msgSend(v12, "lineCount");
  objc_msgSend(v12, "length");
  v21 = v20;
  v22 = *((double *)a5 + 7);
  objc_msgSend(v12, "start");
  v23 = x + v16;
  v24 = y + v18;
  v26 = v22 - v25;
  if (v21 >= v26)
    v21 = v26;
  if (a4->var10)
  {
    memset(&v62, 0, sizeof(v62));
    CGContextGetCTM(&v62, self->_context);
    v61 = v62;
    if (sub_100079384(&v61.a))
    {
      v64.width = v14;
      v64.height = v14;
      v27 = CGContextConvertSizeToDeviceSpace(self->_context, v64);
      if (v27.height >= 0.5 && (objc_msgSend(v12, "allowAntialiasing") & 1) == 0)
      {
        CGContextConvertPointToDeviceSpace(self->_context, a4->var2.origin);
        CGContextConvertSizeToDeviceSpace(self->_context, a4->var2.size);
        v65.x = v23;
        v65.y = v24;
        v29 = CGContextConvertPointToDeviceSpace(self->_context, v65);
        v28 = v29.x;
        v30 = fmax(rint(v27.height), 1.0);
        v31 = rint(v29.y);
        v32 = 0.0;
        if (((int)v30 & 0x80000001) == 1)
          v32 = 0.5;
        v33 = v32 + v31;
        v24 = CGContextConvertPointToUserSpace((CGContextRef)self[16], *(CGPoint *)&v28).y;
        v66.width = v27.width;
        v66.height = v30;
        v14 = fabs(CGContextConvertSizeToUserSpace((CGContextRef)self[16], v66).height);
      }
    }
  }
  CGContextSetStrokeColorWithColor(self->_context, (CGColorRef)objc_msgSend(v12, "color"));
  var4 = a4->var4;
  if (var4)
  {
    v35.location = (NSUInteger)objc_msgSend(var4, "range");
  }
  else
  {
    v35.location = 0x7FFFFFFFFFFFFFFFLL;
    v35.length = 0;
  }
  v36 = v23 + fmax(v21, 0.0);
  if (v35.location == 0x7FFFFFFFFFFFFFFFLL && !v35.length)
    goto LABEL_31;
  if (*((uint64_t *)a5 + 3) < 0)
    v37 = (NSUInteger *)&xmmword_100EEE418;
  else
    v37 = (NSUInteger *)a5;
  v39 = *v37;
  v38 = v37[1];
  v63.location = *v37;
  v63.length = v38;
  v40 = NSIntersectionRange(v35, v63);
  if (!v40.length)
    goto LABEL_39;
  if (v40.length >= v38)
  {
LABEL_31:
    v53 = 0;
    if (!v19)
      goto LABEL_37;
    goto LABEL_32;
  }
  sub_10013E9D0((unint64_t *)a5, v39, v38, 1, 1, 0, 0, (char **)&v62);
  sub_1001B29B0((CGRect **)&v62);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  if (*(_QWORD *)&v62.a)
  {
    v62.b = v62.a;
    operator delete(*(void **)&v62.a);
  }
  if (v23 >= v42)
    v49 = v23;
  else
    v49 = v42;
  v60 = v49;
  v67.origin.x = v42;
  v67.origin.y = v44;
  v67.size.width = v46;
  v67.size.height = v48;
  MaxX = CGRectGetMaxX(v67);
  if (MaxX >= v36)
    v51 = v36;
  else
    v51 = MaxX;
  if (objc_msgSend(v12, "underline") == (id)3)
    v52 = sub_1001B2528(v14);
  else
    v52 = v14 * 0.5;
  v57 = v60 + -1.0;
  v58 = v52 + 1.0;
  if (v19 == (id)2)
    v59 = (v58 + v58) * 1.5;
  else
    v59 = v58 + v58;
  if (v51 > v57)
  {
    CGContextSaveGState(self->_context);
    v68.size.width = v51 - v57;
    v68.origin.y = v24 - v58;
    v68.origin.x = v60 + -1.0;
    v68.size.height = v59;
    CGContextClipToRect(self->_context, v68);
    v53 = 1;
    if (!v19)
    {
LABEL_37:
      if ((v53 & 1) != 0)
        CGContextRestoreGState(self->_context);
      goto LABEL_39;
    }
LABEL_32:
    v54 = 1;
    v55 = v24;
    do
    {
      if (objc_msgSend(v12, "underline") == (id)3)
        -[CRLWPRenderer p_strokeWavyLineFromPoint:toPoint:width:](self, "p_strokeWavyLineFromPoint:toPoint:width:", v23, v55, v36, v24, v14);
      else
        -[CRLWPRenderer p_strokeLineFromPoint:toPoint:width:](self, "p_strokeLineFromPoint:toPoint:width:", v23, v55, v36, v24, v14);
      v55 = v55 + v14 * 2.0;
      v24 = v24 + v14 * 2.0;
    }
    while ((unint64_t)v19 > v54++);
    goto LABEL_37;
  }
LABEL_39:

}

- (void)p_drawAdornmentLineBackgroundRect:(id)a3 lineDrawFlags:(unint64_t)a4 drawingState:(const CRLWPDrawingState *)a5 bounds:(CGRect)a6
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  char v10;
  CGColor *CopyWithAlpha;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGRect v20;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a4;
  v19 = a3;
  if (objc_msgSend(v19, "color"))
  {
    if ((v10 & 2) != 0)
    {
      CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)objc_msgSend(v19, "color"), 0.5);
      CGContextSetFillColorWithColor(self->_context, CopyWithAlpha);
      CGColorRelease(CopyWithAlpha);
    }
    else
    {
      CGContextSetFillColorWithColor(self->_context, (CGColorRef)objc_msgSend(v19, "color"));
    }
    objc_msgSend(v19, "length");
    v14 = v13;
    objc_msgSend(v19, "start");
    v16 = width - v15;
    if (v14 >= v16)
      v17 = v16;
    else
      v17 = v14;
    if (v17 > 0.0)
    {
      objc_msgSend(v19, "start");
      v20.origin.x = x + v18;
      v20.origin.y = y;
      v20.size.width = v17;
      v20.size.height = height;
      CGContextFillRect(self->_context, v20);
    }
  }

}

- (void)p_strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 width:(double)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  CGContextSetLineWidth(self->_context, a5);
  CGContextMoveToPoint(self->_context, v8, v7);
  CGContextAddLineToPoint(self->_context, x, y);
  CGContextStrokePath(self->_context);
}

- (void)p_strokeWavyLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 width:(double)a5
{
  double x;
  double y;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  CGRect v22;

  x = a4.x;
  y = a3.y;
  v8 = a3.x;
  v10 = sub_1001B2540();
  v11 = sub_1001B2528(a5);
  v12 = sub_1001B2534(a5);
  CGContextSaveGState(self->_context);
  v22.origin.y = y - (v11 + 1.0);
  v22.size.height = v11 + 1.0 + v11 + 1.0;
  v22.origin.x = v8;
  v22.size.width = x - v8;
  CGContextClipToRect(self->_context, v22);
  CGContextBeginPath(self->_context);
  CGContextMoveToPoint(self->_context, v8, y);
  CGContextSetLineWidth(self->_context, v12);
  v21 = fmax((x - v8) * v10, 1.0);
  if (v21 > 0.0)
  {
    v13 = (x - v8) / v21 * 0.5;
    v14 = v13 * 0.5;
    v15 = y - v11;
    v16 = y + v11;
    v17 = 0.0;
    do
    {
      v18 = v14 + v8;
      if (x < v14 + v8)
        v18 = x;
      v19 = v13 + v8;
      CGContextAddQuadCurveToPoint(self->_context, v18, v15, v19, y);
      v20 = v14 + v19;
      v8 = v13 + v19;
      CGContextAddQuadCurveToPoint(self->_context, v20, v16, v8, y);
      v17 = v17 + 1.0;
    }
    while (v17 < v21);
  }
  CGContextDrawPath(self->_context, kCGPathStroke);
  CGContextRestoreGState(self->_context);
}

- (void)p_calculateMarkAdornments:(id)a3 drawingState:(const CRLWPDrawingState *)a4 lineFragment:(const void *)a5
{
  NSUInteger *v7;
  NSUInteger v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  const __CTLine *v13;
  CFArrayRef GlyphRuns;
  void *v15;
  unint64_t v16;
  void *v17;
  CFRange StringRange;
  NSUInteger location;
  BOOL v20;
  unint64_t v21;
  CFDictionaryRef Attributes;
  void *v23;
  void *v24;
  uint64_t v25;
  NSAttributedStringKey v26;
  double v27;
  void *v28;
  void *v29;
  NSRange v30;
  void *length;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int v38;
  NSUInteger v39;
  double x;
  double v41;
  double v42;
  double v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  double width;
  CRLWPAdornmentLine *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  char v54;
  NSRange range2;
  void *v56;
  __int128 v57;
  __int128 v58;
  NSRange v59;
  NSRange v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v53 = a3;
  if (*((uint64_t *)a5 + 3) < 0)
    v7 = (NSUInteger *)&xmmword_100EEE418;
  else
    v7 = (NSUInteger *)a5;
  v8 = v7[1];
  range2.location = *v7;
  v9 = *((double *)a5 + 17);
  v10 = *((double *)a5 + 19);
  v11 = objc_msgSend(a4->var26, "length");
  v12 = sub_10013E664((uint64_t)a5, 0);
  v13 = (const __CTLine *)sub_10019FA78(v12);
  GlyphRuns = CTLineGetGlyphRuns(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(GlyphRuns);
  v16 = 0;
  v51 = v15;
  do
  {
    if (v16 >= (unint64_t)objc_msgSend(v15, "count"))
    {
      v52 = 0;
      if (!v11)
        goto LABEL_40;
      goto LABEL_15;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v16));

    StringRange = CTRunGetStringRange((CTRunRef)v17);
    location = a4->var25.location;
    ++v16;
    v20 = location >= StringRange.location;
    v21 = location - StringRange.location;
  }
  while (!v20 || v21 >= StringRange.length);
  Attributes = CTRunGetAttributes((CTRunRef)v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue(Attributes);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", kCTForegroundColorAttributeName));

  if (v24)
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithCGColor:](CRLColor, "colorWithCGColor:", v24));
  else
    v52 = 0;

  if (!v11)
    goto LABEL_40;
LABEL_15:
  v25 = 0;
  v26 = NSUnderlineStyleAttributeName;
  v27 = v9 + v10 * 0.5;
  v54 = 1;
  while (1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4->var26, "attribute:atIndex:longestEffectiveRange:inRange:", NSMarkedClauseSegmentAttributeName, v25, &v58, 0, v11));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4->var26, "attribute:atIndex:longestEffectiveRange:inRange:", v26, v25, &v57, 0, v11));
    if ((objc_msgSend(v28, "BOOLValue") & 1) == 0
      && (objc_msgSend(v29, "BOOLValue") & 1) == 0)
    {
      break;
    }
    if ((objc_msgSend(v28, "BOOLValue") & 1) == 0)
      v58 = v57;
    v59.length = *((_QWORD *)&v58 + 1);
    v59.location = a4->var25.location + v58;
    v60.location = range2.location;
    v60.length = v8;
    v30 = NSIntersectionRange(v59, v60);
    if (v30.length)
    {
      sub_10013E9D0((unint64_t *)a5, v30.location, v30.length, 1, 1, 0, 0, (char **)&range2.length);
      length = (void *)range2.length;
      if (v56 != (void *)range2.length)
      {
        v32 = *(double *)range2.length;
        v33 = *(double *)(range2.length + 8);
        v35 = *(double *)(range2.length + 16);
        v34 = *(double *)(range2.length + 24);
        v36 = *((double *)a5 + 5);
        v37 = *((double *)a5 + 19);
        v38 = objc_msgSend(v29, "intValue");
        if (v38 >= 1)
        {
          v39 = v8;
          x = v32 - v36;
          v41 = v34 + v37;
          v61.origin.x = x;
          v61.origin.y = v33;
          v61.size.width = v35;
          v61.size.height = v34 + v37;
          v42 = CGRectGetMaxY(v61) - *((double *)a5 + 4);
          if (v42 >= v27)
            v43 = v27;
          else
            v43 = v42;
          v44 = v52;
          v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4->var26, "attribute:atIndex:longestEffectiveRange:inRange:", NSUnderlineColorAttributeName, v25, 0, 0, v11)));
          v46 = objc_msgSend(v45, "CGColor");

          if (v46)
          {
            v47 = objc_claimAutoreleasedReturnValue(+[CRLColor colorWithCGColor:](CRLColor, "colorWithCGColor:", v46));

            v44 = (id)v47;
          }
          if (!v44)
            v44 = (id)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
          if ((v54 & 1) != 0)
          {
            width = v35 + -1.0;
          }
          else
          {
            v62.origin.x = x;
            v62.origin.y = v33;
            v62.size.width = v35;
            v62.size.height = v41;
            v63 = CGRectInset(v62, 1.0, 0.0);
            x = v63.origin.x;
            width = v63.size.width;
          }
          LOBYTE(v50) = 1;
          v49 = -[CRLWPAdornmentLine initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:]([CRLWPAdornmentLine alloc], "initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:", objc_msgSend(v44, "CGColor"), 1, 1, 2, 0, 0, x, v43, width, (double)v38, 0.0, v50);
          objc_msgSend(v53, "addObject:", v49);

          v54 = 0;
          v8 = v39;
          v26 = NSUnderlineStyleAttributeName;
        }
        length = (void *)range2.length;
      }
      if (length)
      {
        v56 = length;
        operator delete(length);
      }
    }

    v25 = *((_QWORD *)&v58 + 1) + v58;
    if (*((_QWORD *)&v58 + 1) + (_QWORD)v58 >= (unint64_t)v11)
      goto LABEL_40;
  }

LABEL_40:
}

- (void)p_drawRun:(const __CTRun *)a3 range:(id)a4 attributes:(id)a5 canvasIsInteractive:(BOOL)a6
{
  void *v7;
  CFStringRef v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  _BOOL4 v18;
  BOOL v19;
  int v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  id v24;
  void *v25;
  unsigned __int8 v26;
  char v27;
  CGColorRef CopyWithAlpha;
  CGColorRef v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  char v35;
  _BOOL4 v36;
  void *v39;
  id v40;

  LODWORD(v34) = a6;
  v40 = a5;
  CGContextSaveGState(self->_context);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", kCTFontAttributeName));

  v8 = CTFontCopyPostScriptName((CTFontRef)v7);
  v9 = CFEqual(v8, CFSTR("AppleColorEmoji"));
  CFRelease(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("CRLWPCharacterFillAttribute")));
  if (v11)
  {
    v12 = objc_opt_class(CRLColorFill, v10);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122DA90);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE9784();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122DAB0);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer p_drawRun:range:attributes:canvasIsInteractive:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1331, 0, "unexpected color fill");

    }
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("CRLWPCharacterStrokeAttribute"), v34));
  if (v11)
    v16 = objc_msgSend(v11, "fillType") == 0;
  else
    v16 = 1;
  v36 = v16;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", kCTForegroundColorAttributeName));

  if (v17)
  {
    v18 = sub_10001228C((CGColor *)v17);
    if (v11)
      goto LABEL_17;
LABEL_20:
    v19 = 0;
    goto LABEL_22;
  }
  v18 = 1;
  if (!v11)
    goto LABEL_20;
LABEL_17:
  if (objc_msgSend(v11, "fillType"))
    v19 = 1;
  else
    v19 = objc_msgSend(v11, "fillType") != (id)4;
LABEL_22:
  v20 = sub_100411FB8((uint64_t)self->_context);
  v22 = (objc_class *)objc_opt_class(NSNumber, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("CRLWPInvisibleTextAttribute")));
  v24 = sub_1002223BC(v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = objc_msgSend(v25, "BOOLValue");

  if (v9)
  {
    if (v39)
      v27 = 1;
    else
      v27 = v19;
    if ((v27 & 1) != 0)
    {
      if (v17)
      {
        CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)v17, 1.0);
        v17 = (id)CFAutorelease(CopyWithAlpha);
      }
      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
        v17 = objc_msgSend(v31, "CGColor");

      }
    }
LABEL_43:
    v30 = 0;
    if (v17)
      goto LABEL_45;
    goto LABEL_44;
  }
  if (v20)
  {
    if (v36 && !v18)
      goto LABEL_43;
    if (!v36 || !v18 || v39)
    {
      if (v17)
      {
        v29 = CGColorCreateCopyWithAlpha((CGColorRef)v17, 0.0);
        v17 = (id)CFAutorelease(v29);
      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor clearColor](CRLColor, "clearColor"));
        v17 = objc_msgSend(v32, "CGColor");

      }
      CGContextSetTextDrawingMode(self->_context, kCGTextInvisible);
      goto LABEL_43;
    }
  }
  else if (!v19)
  {
    v30 = v18 & (v35 ^ 1) & v26;
    if (v17)
      goto LABEL_45;
    goto LABEL_44;
  }
  v30 = 1;
  if (v17)
    goto LABEL_45;
LABEL_44:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
  v17 = objc_msgSend(v33, "CGColor");

LABEL_45:
  CGContextSetFillColorWithColor(self->_context, (CGColorRef)v17);
  if ((v30 & 1) == 0)
    CTRunDraw(a3, self->_context, (CFRange)a4);
  CGContextRestoreGState(self->_context);

}

- (void)p_drawTextInRunsForLine:(CRLWPLineRef *)a3 fragment:(const void *)a4 state:(const CRLWPDrawingState *)a5 listLabel:(BOOL)a6 tateChuYoko:(BOOL)a7 ruby:(BOOL)a8 baseRange:(_NSRange)a9 isFirstLineRef:(BOOL)a10
{
  id v11;
  const __CTLine *v12;
  CFArrayRef GlyphRuns;
  __int128 v14;
  BOOL v15;
  void *v16;
  uint64_t GlyphCount;
  CFDictionaryRef Attributes;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  CFRange StringRange;
  id v24;
  CFIndex v25;
  id v26;
  void *v27;
  CFIndex v28;
  id v29;
  void *v30;
  NSUInteger v31;
  int v32;
  double v33;
  char Status;
  double v35;
  double v36;
  CRLWPRenderer *v37;
  CGContext *v38;
  CGContext *v39;
  __int128 v40;
  void *v41;
  id var4;
  unint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  id v47;
  NSRange var23;
  NSUInteger v49;
  NSRange v50;
  CGContext *v51;
  __int128 v52;
  char v53;
  double TypographicBounds;
  void *v55;
  void *v56;
  BOOL v57;
  CGContext *context;
  __int128 *v59;
  void *v60;
  id v61;
  unsigned int i;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t var3;
  BOOL v71;
  char *v72;
  unsigned int v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  NSObject *v82;
  __int128 v83;
  CRLWPRangeArray *v84;
  _BOOL4 v85;
  void *v87;
  BOOL v88;
  void *v89;
  NSUInteger length;
  int v91;
  void *v92;
  char *location;
  void *v94;
  id v95;
  _BOOL4 v96;
  unint64_t v97;
  CGAffineTransform v101;
  CGFloat descent[3];
  CGAffineTransform v103;
  CGAffineTransform transform;
  CGAffineTransform v105;
  CGFloat leading;
  CGFloat ascent;
  __int16 v108;
  const char *v109;
  __int16 v110;
  const char *v111;
  __int16 v112;
  int v113;
  CGAffineTransform v114;
  CFRange v115;
  CFRange v116;
  NSRange v117;

  v85 = a8;
  v96 = a7;
  v11 = sub_100411820((uint64_t)self->_context);
  v89 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v12 = (const __CTLine *)sub_10019FA78((uint64_t)a3);
  GlyphRuns = CTLineGetGlyphRuns(v12);
  v94 = (void *)objc_claimAutoreleasedReturnValue(GlyphRuns);
  v97 = 0;
  v91 = a10 & ~(v96 || v85);
  if (v89)
    v15 = a6;
  else
    v15 = 1;
  v88 = v15;
  location = (char *)a9.location;
  length = a9.length;
  *(_QWORD *)&v14 = 67109378;
  v83 = v14;
  while (1)
  {
    if (v97 >= (unint64_t)objc_msgSend(v94, "count", v83))
      goto LABEL_107;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "objectAtIndexedSubscript:"));

    GlyphCount = CTRunGetGlyphCount((CTRunRef)v16);
    if ((unint64_t)(GlyphCount - 65537) <= 0xFFFFFFFFFFFEFFFFLL)
      break;
    Attributes = CTRunGetAttributes((CTRunRef)v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue(Attributes);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CRLWPRubySpacingRunAttribute")));
    v92 = v20;
    if (v20)
      v21 = objc_msgSend(v20, "BOOLValue");
    else
      v21 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("__wpAttachmentMap")));

    StringRange = CTRunGetStringRange((CTRunRef)v16);
    v24 = (id)StringRange.location;
    v25 = StringRange.length;
    if (v91)
    {
      v26 = sub_10013DFB8((uint64_t)a4);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v24 = objc_msgSend(v27, "charRangeMappedToStorage:", StringRange.location, StringRange.length);
      v25 = v28;

    }
    if (v96)
    {
      v29 = sub_10013DFB8((uint64_t)a4);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      location = (char *)objc_msgSend(v30, "charRangeMappedToStorage:", location, length);
      length = v31;

    }
    if (v22)
      v32 = 1;
    else
      v32 = v21;
    if (v32 == 1)
    {
      if (v22)
      {
        objc_msgSend(v89, "beginPrimaryTextRunWithRange:hasActualContents:", v24, v25, 0);
        objc_msgSend(v89, "endPrimaryTextRunWithRange:hasActualContents:", v24, v25, 0);
      }
      goto LABEL_70;
    }
    if (!v88)
    {
      if (v91)
      {
        objc_msgSend(v89, "beginPrimaryTextRunWithRange:hasActualContents:", v24, v25, 1);
      }
      else if (v85)
      {
        objc_msgSend(v89, "beginRubyRunWithRange:baseTextRange:", v24, v25, location, length);
      }
      else if (v96)
      {
        objc_msgSend(v89, "beginTateChuYokoRunWithRange:baseTextRange:", v24, v25, location, length);
      }
      else
      {
        objc_msgSend(v89, "beginAncillaryTextRunWithRange:baseTextRange:", v24, v25, location, length);
      }
    }
    CGContextSaveGState(self->_context);
    v33 = sub_10013E840(v19);
    memset(&v114, 0, sizeof(v114));
    CTRunGetTextMatrix(&v114, (CTRunRef)v16);
    Status = CTRunGetStatus((CTRunRef)v16);
    v35 = 0.0;
    if ((*((_BYTE *)a4 + 25) & 0x20) != 0)
    {
      if (v96)
      {
        v37 = self;
        CGContextRotateCTM(self->_context, -1.57079633);
        v36 = 0.0;
        goto LABEL_33;
      }
      v53 = Status;
      ascent = 0.0;
      descent[0] = 0.0;
      leading = 0.0;
      v115.location = 0;
      v115.length = 0;
      TypographicBounds = CTRunGetTypographicBounds((CTRunRef)v16, v115, &ascent, descent, &leading);
      if ((v53 & 4) != 0)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", kCTHorizontalInVerticalFormsAttributeName, TypographicBounds));
        v57 = v56 == 0;

        context = self->_context;
        if (v57)
        {
          CGContextRotateCTM(self->_context, -1.57079633);
        }
        else
        {
          CGAffineTransformMakeRotation(&v105, 1.57079633);
          CGContextSetTextMatrix(context, &v105);
        }
        v36 = 0.0;
        goto LABEL_30;
      }
      v35 = (ascent - descent[0]) * -0.5;
    }
    v36 = v33;
    v33 = 0.0;
LABEL_30:
    v37 = self;
LABEL_33:
    v114.tx = v33 + v114.tx;
    v114.ty = v36 + v114.ty;
    CGContextSetTextPosition(v37->_context, v114.tx, v35 + v114.ty);
    v38 = v37->_context;
    CGAffineTransformMakeScale(&transform, 1.0, -1.0);
    CGContextConcatCTM(v38, &transform);
    v39 = v37->_context;
    v40 = *(_OWORD *)&a3->var4.c;
    *(_OWORD *)&v103.a = *(_OWORD *)&a3->var4.a;
    *(_OWORD *)&v103.c = v40;
    *(_OWORD *)&v103.tx = *(_OWORD *)&a3->var4.tx;
    CGContextConcatCTM(v39, &v103);
    if (a5->var9
      || (v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CRLWPShadow")))) == 0)
    {
      v87 = 0;
    }
    else
    {
      v87 = v41;
      objc_msgSend(v41, "applyToContext:viewScale:flipped:", self->_context, self->_flipShadows, self->_viewScale);
    }
    var4 = a5->var4;
    if (var4)
    {
      v43 = (unint64_t)objc_msgSend(var4, "superRange");
      v45 = v44;
      var4 = a5->var4;
    }
    else
    {
      v43 = 0x7FFFFFFFFFFFFFFFLL;
      v45 = 0;
    }
    v46 = (char *)objc_msgSend(var4, "type");
    v47 = a5->var4;
    if (!v47)
    {
LABEL_48:
      var23 = a5->var23;
      if (var23 == 0x7FFFFFFFFFFFFFFFuLL)
      {
        v49 = 0;
      }
      else
      {
        v117.location = 0;
        v117.length = GlyphCount;
        v50 = NSIntersectionRange(var23, v117);
        v49 = v50.location;
        GlyphCount = v50.length;
      }
      -[CRLWPRenderer p_drawRun:range:attributes:canvasIsInteractive:](self, "p_drawRun:range:attributes:canvasIsInteractive:", v16, v49, GlyphCount, v19, a5->var10);
      goto LABEL_52;
    }
    if (v96)
    {
      if ((unint64_t)(v46 - 1) <= 1)
        goto LABEL_48;
    }
    else if ((unint64_t)location >= v43 && &location[-v43] < v45
           || location == (char *)v43 && v45 == (char *)length)
    {
      goto LABEL_48;
    }
    if (a5->var23.location == 0x7FFFFFFFFFFFFFFFLL && !a5->var23.length)
    {
      if ((unint64_t)objc_msgSend(v47, "visualRangeCount") < 2)
      {
        v84 = -[CRLWPRangeArray initWithRange:]([CRLWPRangeArray alloc], "initWithRange:", v43, v45);
      }
      else
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5->var4, "visualRanges"));
        v84 = (CRLWPRangeArray *)objc_msgSend(v55, "copy");

      }
      sub_10002B980(descent, GlyphCount);
      v116.location = 0;
      v116.length = GlyphCount;
      CTRunGetStringIndices((CTRunRef)v16, v116, *(CFIndex **)&descent[0]);
      v95 = objc_alloc_init((Class)NSMutableIndexSet);
      v59 = &xmmword_100EEE418;
      if (*((uint64_t *)a4 + 3) >= 0)
        v59 = (__int128 *)a4;
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRangeArray intersection:](v84, "intersection:", *(_QWORD *)v59, *((_QWORD *)v59 + 1)));
      v61 = objc_msgSend(v60, "mutableCopy");

      for (i = 0; (unint64_t)objc_msgSend(v61, "rangeCount") > i; ++i)
      {
        v63 = sub_10013DFB8((uint64_t)a4);
        v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
        v65 = objc_msgSend(v61, "rangeAtIndex:", i);
        v67 = objc_msgSend(v64, "charRangeMappedFromStorage:", v65, v66);
        objc_msgSend(v61, "replaceRangeAtIndex:withRange:", i, v67, v68);

      }
      if (GlyphCount >= 1)
      {
        v69 = 0;
        while (1)
        {
          if (!v96)
            goto LABEL_90;
          var3 = a3->var3;
          v71 = (unint64_t)location >= var3;
          v72 = &location[-var3];
          if (!v71)
            break;
LABEL_91:
          if (objc_msgSend(v61, "containsCharacterAtIndex:", &v72[*(_QWORD *)(*(_QWORD *)&descent[0] + 8 * v69)]))objc_msgSend(v95, "addIndex:", v69);
          if (GlyphCount == ++v69)
            goto LABEL_94;
        }
        v73 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122DAF0);
        v74 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          LODWORD(ascent) = 67109890;
          HIDWORD(ascent) = v73;
          v108 = 2082;
          v109 = "-[CRLWPRenderer p_drawTextInRunsForLine:fragment:state:listLabel:tateChuYoko:ruby:baseRange:isFirstLineRef:]";
          v110 = 2082;
          v111 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm";
          v112 = 1024;
          v113 = 1592;
          _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d unexpected string offset for tate chu yoko run", (uint8_t *)&ascent, 0x22u);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122DB10);
        v75 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_ERROR))
        {
          v78 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          ascent = COERCE_DOUBLE(__PAIR64__(v73, v83));
          v108 = 2114;
          v109 = v78;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v75, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&ascent, 0x12u);

        }
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer p_drawTextInRunsForLine:fragment:state:listLabel:tateChuYoko:ruby:baseRange:isFirstLineRef:]"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v76, v77, 1592, 0, "unexpected string offset for tate chu yoko run");

LABEL_90:
        v72 = 0;
        goto LABEL_91;
      }
LABEL_94:
      v79 = (char *)objc_msgSend(v95, "firstIndex");
      v80 = 0;
      v81 = v79;
      do
      {
        if (v81 == &v79[v80])
        {
          ++v80;
        }
        else
        {
          CGContextSaveGState(self->_context);
          -[CRLWPRenderer p_drawRun:range:attributes:canvasIsInteractive:](self, "p_drawRun:range:attributes:canvasIsInteractive:", v16, v79, v80, v19, a5->var10);
          CGContextRestoreGState(self->_context);
          v79 = v81;
          v80 = 1;
        }
        v81 = (char *)objc_msgSend(v95, "indexGreaterThanIndex:", v81);
      }
      while (v79 != (char *)0x7FFFFFFFFFFFFFFFLL);

      if (*(_QWORD *)&descent[0])
      {
        descent[1] = descent[0];
        operator delete(*(void **)&descent[0]);
      }

    }
LABEL_52:
    CGContextRestoreGState(self->_context);
    v51 = self->_context;
    v52 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v101.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v101.c = v52;
    *(_OWORD *)&v101.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGContextSetTextMatrix(v51, &v101);
    if (!v88)
    {
      if (v91)
      {
        objc_msgSend(v89, "endPrimaryTextRunWithRange:hasActualContents:", v24, v25, 1);
      }
      else if (v85)
      {
        objc_msgSend(v89, "endRubyRunWithRange:baseTextRange:", v24, v25, location, length);
      }
      else if (v96)
      {
        objc_msgSend(v89, "endTateChuYokoRunWithRange:baseTextRange:", v24, v25, location, length);
      }
      else
      {
        objc_msgSend(v89, "endAncillaryTextRunWithRange:baseTextRange:", v24, v25, location, length);
      }
    }

LABEL_70:
    ++v97;
  }
  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_10122DAD0);
  v82 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    LODWORD(v114.a) = 134217984;
    *(_QWORD *)((char *)&v114.a + 4) = GlyphCount;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "bad glyph count: %ld", (uint8_t *)&v114, 0xCu);
  }
LABEL_107:

}

- (void)p_drawAttachmentGlyphAtPosition:(id)a3 fragment:(const void *)a4
{
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGRect v8;

  v5 = floor(a3.var1) + 0.5;
  v6 = -*((double *)a4 + 15) - *((double *)a4 + 18);
  v7 = v5 - 4.80000019 * 0.5;
  -[CRLWPRenderer p_strokeLineFromPoint:toPoint:width:](self, "p_strokeLineFromPoint:toPoint:width:", a3.var0, v5, v6, v5, *((double *)a4 + 17) + *((double *)a4 + 19) + *((double *)a4 + 20), 1.0);
  v8.origin.x = v7;
  v8.origin.y = v6;
  v8.size.width = 4.80000019;
  v8.size.height = 4.80000019;
  CGContextFillEllipseInRect(self->_context, v8);
}

- (void)p_drawInvisiblesAdornments:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5
{
  id v8;
  _BOOL4 var12;
  const __CTFont *v10;
  double v11;
  double v12;
  CGContext *context;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  __int128 *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  CGContext *v23;
  id v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  unint64_t v28;
  double y;
  double height;
  CGFloat *v31;
  CGPoint *v32;
  const CGGlyph *v33;
  const __CTFont *v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  const __CTFont *font;
  size_t count;
  CGPoint *positions[3];
  CGAffineTransform transform;
  CGRect BoundingRectsForGlyphs;

  v8 = a3;
  var12 = a5->var12;
  font = (const __CTFont *)objc_msgSend(v8, "font");
  v10 = (const __CTFont *)objc_msgSend(v8, "flippedFont");
  v11 = *((double *)a4 + 4);
  v12 = *((double *)a4 + 5);
  CGContextSaveGState(self->_context);
  context = self->_context;
  if ((*((_BYTE *)a4 + 25) & 0x20) != 0)
  {
    v17 = sub_10013E664((uint64_t)a4, 0);
    CGContextTranslateCTM(context, v12 + *(double *)(v17 + 8), v11);
  }
  else
  {
    v14 = *((double *)a4 + 15);
    v15 = *((double *)a4 + 17);
    v16 = sub_10013E664((uint64_t)a4, 0);
    CGContextTranslateCTM(context, v12 + *(double *)(v16 + 8), v11 + (v15 - v14 + *(double *)&qword_1013DB6D0) * 0.5);
  }
  v37 = var12;
  CGContextSetTextPosition(self->_context, 0.0, 0.0);
  CGContextSetFillColorWithColor(self->_context, a5->var6);
  v34 = v10;
  if (*((uint64_t *)a4 + 3) < 0)
    v18 = &xmmword_100EEE418;
  else
    v18 = (__int128 *)a4;
  v35 = *(_QWORD *)v18;
  v36 = *((_QWORD *)v18 + 1);
  v19 = (unint64_t)objc_msgSend(v8, "positionCount");
  count = (size_t)objc_msgSend(v8, "flippedPositionCount");
  if (objc_msgSend(v8, "positionCount") != (id)v19 || objc_msgSend(v8, "flippedPositionCount") != (id)count)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122DB30);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE9804();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122DB50);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer p_drawInvisiblesAdornments:lineFragment:state:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 1693, 0, "Invisibles mismatch");

  }
  if (objc_msgSend(v8, "positionCount") == (id)v19 && objc_msgSend(v8, "flippedPositionCount") == (id)count)
  {
    if (!v37)
    {
      v24 = a5->var3;
      v25 = v24;
      if (!v36
        || !objc_msgSend(v24, "isValid")
        || !objc_msgSend(v25, "containsCharacterAtIndex:", v36 + v35 - 1))
      {

        goto LABEL_33;
      }
      v26 = objc_msgSend(v8, "type") == 2;

      if (!v26)
        goto LABEL_33;
    }
    if (v19 | count)
    {
      v23 = self->_context;
      CGAffineTransformMakeScale(&transform, 1.0, -1.0);
      CGContextConcatCTM(v23, &transform);
      if ((*((_BYTE *)a4 + 25) & 0x20) != 0)
      {
        if (v19)
        {
          sub_10002BA68(positions, v19);
          v27 = 0;
          v28 = v19;
          do
          {
            BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(font, kCTFontOrientationHorizontal, (const CGGlyph *)((char *)objc_msgSend(v8, "glyphs") + v27 * 2), 0, 1);
            y = BoundingRectsForGlyphs.origin.y;
            height = BoundingRectsForGlyphs.size.height;
            v31 = (CGFloat *)objc_msgSend(v8, "positions", BoundingRectsForGlyphs.origin.x);
            v32 = &positions[0][v27];
            v32->x = v31[v27 * 2];
            v32->y = -(y - height * -0.5);
            ++v27;
            --v28;
          }
          while (v28);
          v33 = (const CGGlyph *)objc_msgSend(v8, "glyphs");
          CTFontDrawGlyphs(font, v33, positions[0], v19, self->_context);
          if (positions[0])
          {
            positions[1] = positions[0];
            operator delete(positions[0]);
          }
        }
      }
      else
      {
        if (v19)
          CTFontDrawGlyphs(font, (const CGGlyph *)objc_msgSend(v8, "glyphs"), (const CGPoint *)objc_msgSend(v8, "positions"), v19, self->_context);
        if (count)
          CTFontDrawGlyphs(v34, (const CGGlyph *)objc_msgSend(v8, "flippedGlyphs"), (const CGPoint *)objc_msgSend(v8, "flippedPositions"), count, self->_context);
      }
    }
  }
LABEL_33:
  CGContextRestoreGState(self->_context);

}

- (void)p_drawHiddenDeletionsAdornments:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5
{
  id v7;
  const __CTFont *v8;
  CGFloat v9;
  double v10;
  CGContext *context;
  uint64_t v12;
  id v13;
  id v14;
  CGContext *v15;
  CGAffineTransform v16;

  v7 = a3;
  v8 = (const __CTFont *)objc_msgSend(v7, "font");
  v9 = *((double *)a4 + 4);
  v10 = *((double *)a4 + 5);
  CGContextSaveGState(self->_context);
  context = self->_context;
  v12 = sub_10013E664((uint64_t)a4, 0);
  CGContextTranslateCTM(context, v10 + *(double *)(v12 + 8), v9);
  CGContextSetTextPosition(self->_context, 0.0, 0.0);
  CGContextSetFillColorWithColor(self->_context, (CGColorRef)objc_msgSend(v7, "color"));
  v13 = objc_msgSend(v7, "positionCount");
  if (v13 == objc_msgSend(v7, "glyphCount"))
  {
    v14 = objc_msgSend(v7, "positionCount");
    if (v14)
    {
      v15 = self->_context;
      CGAffineTransformMakeScale(&v16, 1.0, -1.0);
      CGContextConcatCTM(v15, &v16);
      CTFontDrawGlyphs(v8, (const CGGlyph *)objc_msgSend(v7, "glyphs"), (const CGPoint *)objc_msgSend(v7, "positions"), (size_t)v14, self->_context);
    }
  }
  CGContextRestoreGState(self->_context);

}

- (BOOL)p_canvasSelectionIncludesDrawableOfAttachmentAtCharIndex:(unint64_t)a3 state:(const CRLWPDrawingState *)a4
{
  return 0;
}

- (void)p_drawAttachmentAdornments:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5
{
  _BOOL4 var12;
  _BOOL4 var11;
  CGFloat v10;
  double v11;
  CGContext *context;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  id i;
  id v17;

  v17 = a3;
  var12 = a5->var12;
  var11 = a5->var11;
  v10 = *((double *)a4 + 4);
  v11 = *((double *)a4 + 5);
  CGContextSaveGState(self->_context);
  context = self->_context;
  v13 = sub_10013E664((uint64_t)a4, 0);
  CGContextTranslateCTM(context, v11 + *(double *)(v13 + 8), v10);
  CGContextSetFillColorWithColor(self->_context, a5->var6);
  CGContextSetStrokeColorWithColor(self->_context, a5->var6);
  v14 = (char *)objc_msgSend(v17, "attachmentPositionCount");
  v15 = objc_msgSend(v17, "attachmentPositions");
  for (i = a5->var3; v14; --v14)
  {
    if (var12
      || (objc_msgSend(i, "containsCharacterAtIndex:", *v15), !var11)
      && -[CRLWPRenderer p_canvasSelectionIncludesDrawableOfAttachmentAtCharIndex:state:](self, "p_canvasSelectionIncludesDrawableOfAttachmentAtCharIndex:state:", *v15, a5))
    {
      -[CRLWPRenderer p_drawAttachmentGlyphAtPosition:fragment:](self, "p_drawAttachmentGlyphAtPosition:fragment:", *v15, v15[1], a4);
    }
    v15 += 2;
  }
  CGContextRestoreGState(self->_context);

}

- (void)p_drawAdornmentGlyphs:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5
{
  id v7;
  const __CTFont *v8;
  CGColor *v9;
  id v10;
  const CGPoint *v11;
  id v12;
  const CGGlyph *v13;
  const CGGlyph *v14;
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
  CGFloat v25;
  uint64_t v26;
  double v27;
  double v28;
  unsigned int v29;
  double *p_x;
  double v31;
  double v32;
  uint64_t v33;
  CGContext *context;
  CGContext *v35;
  CGContext *v36;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  CGContext *v42;
  void *v43;
  double v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform transform;
  CGPoint positions;

  v7 = a3;
  v43 = v7;
  v8 = (const __CTFont *)objc_msgSend(v7, "font");
  v9 = (CGColor *)objc_msgSend(v7, "color");
  v10 = objc_msgSend(v7, "positionCount");
  v11 = (const CGPoint *)objc_msgSend(v7, "positions");
  v12 = objc_msgSend(v7, "glyphCount");
  v13 = (const CGGlyph *)objc_msgSend(v7, "glyphs");
  if (v10 == v12)
  {
    v14 = v13;
    v15 = *((double *)a4 + 4);
    v44 = *((double *)a4 + 5);
    objc_msgSend(v7, "textPosition");
    v17 = v16;
    v19 = v18;
    if (objc_msgSend(v7, "shouldRotate"))
    {
      objc_msgSend(v7, "ascent");
      v21 = v20;
      objc_msgSend(v7, "descent");
      v23 = v22;
      objc_msgSend(v7, "ascent");
      objc_msgSend(v7, "advance");
      if (v10)
      {
        v25 = v24;
        v26 = 0;
        v27 = v21 + v23;
        v28 = v15 + v19;
        v29 = 1;
        do
        {
          CGContextSaveGState(self->_context);
          CGContextSetFillColorWithColor(self->_context, v9);
          p_x = &v11[v26].x;
          v32 = *p_x;
          v31 = p_x[1];
          v33 = sub_10013E664((uint64_t)a4, 0);
          CGContextTranslateCTM(self->_context, v32 + v17 + v44 + *(double *)(v33 + 8), v28 + v31 - v27);
          CGContextSetTextPosition(self->_context, 0.0, 0.0);
          context = self->_context;
          CGAffineTransformMakeScale(&transform, 1.0, -1.0);
          CGContextConcatCTM(context, &transform);
          v35 = self->_context;
          CGAffineTransformMakeTranslation(&v47, v25, -v27);
          CGContextConcatCTM(v35, &v47);
          v36 = self->_context;
          CGAffineTransformMakeRotation(&v46, 1.57079633);
          CGContextConcatCTM(v36, &v46);
          positions = CGPointZero;
          CTFontDrawGlyphs(v8, &v14[v26], &positions, 1uLL, self->_context);
          CGContextRestoreGState(self->_context);
          v26 = v29;
        }
        while ((unint64_t)v10 > v29++);
      }
    }
    else
    {
      CGContextSaveGState(self->_context);
      CGContextSetFillColorWithColor(self->_context, v9);
      v41 = sub_10013E664((uint64_t)a4, 0);
      CGContextTranslateCTM(self->_context, v17 + v44 + *(double *)(v41 + 8), v15 + v19);
      v42 = self->_context;
      CGAffineTransformMakeScale(&v45, 1.0, -1.0);
      CGContextConcatCTM(v42, &v45);
      CGContextSetTextPosition(self->_context, 0.0, 0.0);
      CTFontDrawGlyphs(v8, v14, v11, (size_t)v10, self->_context);
      CGContextRestoreGState(self->_context);
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122DB70);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE9884();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122DB90);
    v38 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer p_drawAdornmentGlyphs:lineFragment:state:]"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v39, v40, 1834, 0, "mismatched adornment counts");

  }
}

- (void)p_drawAdornments:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5
{
  unsigned int v8;
  id v9;

  v9 = a3;
  v8 = objc_msgSend(v9, "type");
  if (v8 - 1 < 2)
  {
    if (!a5->var8 && a5->var10 && sub_100145018((uint64_t)a4))
      -[CRLWPRenderer p_drawInvisiblesAdornments:lineFragment:state:](self, "p_drawInvisiblesAdornments:lineFragment:state:", v9, a4, a5);
  }
  else if (v8 == 3)
  {
    if (!a5->var8 && a5->var10 && sub_100145018((uint64_t)a4))
      -[CRLWPRenderer p_drawAttachmentAdornments:lineFragment:state:](self, "p_drawAttachmentAdornments:lineFragment:state:", v9, a4, a5);
  }
  else if (v8 == 6)
  {
    if (!a5->var8 && a5->var10)
      -[CRLWPRenderer p_drawHiddenDeletionsAdornments:lineFragment:state:](self, "p_drawHiddenDeletionsAdornments:lineFragment:state:", v9, a4, a5);
  }
  else
  {
    -[CRLWPRenderer p_drawAdornmentGlyphs:lineFragment:state:](self, "p_drawAdornmentGlyphs:lineFragment:state:", v9, a4, a5);
  }

}

- (void)p_drawInvisiblesBreakLine:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5
{
  _BOOL4 var12;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unsigned int v13;
  CGFloat v15;
  CGFloat v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v21 = a3;
  var12 = a5->var12;
  v9 = &xmmword_100EEE418;
  if (*((uint64_t *)a4 + 3) >= 0)
    v9 = (__int128 *)a4;
  v11 = *(_QWORD *)v9;
  v10 = *((_QWORD *)v9 + 1);
  v12 = a5->var3;
  v13 = v10 != 0;
  if (!var12 && v10 != 0)
  {
    if (!objc_msgSend(v12, "isValid"))
      goto LABEL_14;
    v13 = objc_msgSend(v12, "containsCharacterAtIndex:", v10 + v11 - 1);
  }
  if (v21 && v13)
  {
    v16 = *((double *)a4 + 4);
    v15 = *((double *)a4 + 5);
    CGContextSaveGState(self->_context);
    CGContextTranslateCTM(self->_context, v15, v16);
    v17 = sub_10013E7A4((uint64_t)a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    if (v18)
    {
      v20 = objc_msgSend(v18, "copyWithColor:", a5->var6);
      -[CRLWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", v20, a5, a4, 0, CGPointZero.x, CGPointZero.y);

    }
    CGContextRestoreGState(self->_context);

  }
LABEL_14:

}

- (void)p_drawListLabelForFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4 lineDrawFlags:(unint64_t)a5
{
  __int16 v5;
  __int128 *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  char *v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  CGFloat v23;
  void *v24;
  uint64_t v25;
  _BYTE v26[104];

  v5 = a5;
  if (*((uint64_t *)a3 + 3) < 0)
    v9 = &xmmword_100EEE418;
  else
    v9 = (__int128 *)a3;
  v10 = *(id *)v9;
  v11 = *((_QWORD *)v9 + 1);
  v12 = sub_10013E750((uint64_t)a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (char *)objc_msgSend(a4->var4, "type");
  if (objc_msgSend(a4->var4, "isValid")
    && ((v15 = objc_msgSend(a4->var4, "containsCharacterAtIndex:", v10), v14 == (char *)2)
      ? (v16 = v15)
      : (v16 = 0),
        (v16 & 1) == 0))
  {
    if (objc_msgSend(a4->var4, "start") != v10)
      goto LABEL_22;
    v17 = (unint64_t)(v14 - 1) < 2;
    if (!v13)
      goto LABEL_22;
  }
  else
  {
    v17 = 1;
    if (!v13)
      goto LABEL_22;
  }
  if (v17
    && (!a4->var14
     || (v5 & 0x100) != 0
     || v11 != 1
     || (sub_1001AE2A0((uint64_t)objc_msgSend(a4->var0, "characterAtIndex:", v10)) & 1) == 0))
  {
    v18 = sub_100411820((uint64_t)self->_context);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v19, "beginListLabel");
    CGContextSaveGState(self->_context);
    if (a4->var9)
    {
      v20 = 0;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shadow"));
      v20 = v24;
      if (v24 && objc_msgSend(v24, "isEnabled"))
        objc_msgSend(v20, "applyToContext:viewScale:flipped:", self->_context, self->_flipShadows, self->_viewScale);
    }
    v21 = objc_msgSend(v13, "textLine");
    if (v21)
    {
      v22 = sub_100144258((uint64_t)a3);
      CGContextTranslateCTM(self->_context, v22, v23);
      -[CRLWPRenderer p_setCTMAndTextPositionForFragment:state:](self, "p_setCTMAndTextPositionForFragment:state:", a3, a4);
      sub_10019F910((uint64_t)v26, v21, 0x7FFFFFFFFFFFFFFFLL, 0, 0, CGPointZero.x, CGPointZero.y);
      LOBYTE(v25) = 0;
      -[CRLWPRenderer p_drawTextInRunsForLine:fragment:state:listLabel:tateChuYoko:ruby:baseRange:isFirstLineRef:](self, "p_drawTextInRunsForLine:fragment:state:listLabel:tateChuYoko:ruby:baseRange:isFirstLineRef:", v26, a3, a4, 1, objc_msgSend(v13, "isLabelTateChuYoko"), 0, v10, 0, v25);
      sub_10019FA00(v26);
    }
    CGContextRestoreGState(self->_context);
    objc_msgSend(v19, "endListLabel");

  }
LABEL_22:

}

- (void)p_setCTMAndTextPositionForFragment:(const void *)a3 state:(const CRLWPDrawingState *)a4
{
  CGContext *context;
  float64x2_t v6;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform transform;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  if (a4->var10 && (*((_WORD *)a3 + 13) & 0x880) == 0)
  {
    memset(&v13, 0, sizeof(v13));
    CGContextGetCTM(&v13, self->_context);
    v12 = v13;
    if (sub_100079384(&v12.a))
    {
      memset(&v11, 0, sizeof(v11));
      v6 = vrndxq_f64(*(float64x2_t *)&v13.tx);
      v10 = v13;
      CGAffineTransformInvert(&v11, &v10);
      context = self->_context;
      *(_OWORD *)&t1.a = *(_OWORD *)&v13.a;
      *(_OWORD *)&t1.c = *(_OWORD *)&v13.c;
      *(float64x2_t *)&t1.tx = v6;
      t2 = v11;
      CGAffineTransformConcat(&transform, &t1, &t2);
      CGContextConcatCTM(context, &transform);
    }
  }
  CGContextSetTextPosition(self->_context, 0.0, 0.0);
}

- (CGContext)context
{
  return self->_context;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (BOOL)flipShadows
{
  return self->_flipShadows;
}

- (void)setFlipShadows:(BOOL)a3
{
  self->_flipShadows = a3;
}

- (CRLBezierPath)interiorClippingPath
{
  return self->_interiorClippingPath;
}

- (void)setInteriorClippingPath:(id)a3
{
  objc_storeStrong((id *)&self->_interiorClippingPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interiorClippingPath, 0);
}

@end
