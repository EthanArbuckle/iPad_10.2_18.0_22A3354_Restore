@implementation CRLPencilKitInkStroke

- (CRLPencilKitInkStroke)initWithInkType:(id)a3 color:(id)a4 adjustedWidth:(double)a5 isFountainPenInkV2:(BOOL)a6
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  double v15;
  CRLPencilKitInkStroke *v16;
  CRLPencilKitInkStroke *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern solidPattern](CRLStrokePattern, "solidPattern"));
  if ((objc_msgSend(v11, "isEqualToString:", PKInkTypePencil) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", PKInkTypeCrayon))
  {
    v14 = 0;
    v15 = 1.0;
  }
  else
  {
    v15 = 4.0;
    v14 = 1;
  }
  v19.receiver = self;
  v19.super_class = (Class)CRLPencilKitInkStroke;
  v16 = -[CRLStroke initWithColor:width:cap:join:pattern:miterLimit:](&v19, "initWithColor:width:cap:join:pattern:miterLimit:", v12, 1, v14, v13, a5, v15);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_inkType, a3);
    v17->_isFountainPenInkV2 = a6;
  }

  return v17;
}

- (CRLPencilKitInkStroke)initWithInkType:(id)a3 color:(id)a4 adjustedWidth:(double)a5
{
  id v8;
  id v9;
  CRLPencilKitInkStroke *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[CRLPencilKitInkStroke initWithInkType:color:adjustedWidth:isFountainPenInkV2:](self, "initWithInkType:color:adjustedWidth:isFountainPenInkV2:", v9, v8, objc_msgSend(v9, "isEqualToString:", PKInkTypeFountainPen), a5);

  return v10;
}

- (CRLPencilKitInkStroke)initWithInkType:(id)a3 color:(id)a4 unadjustedPencilKitWidth:(double)a5
{
  id v8;
  id v9;
  double v10;
  CRLPencilKitInkStroke *v11;

  v8 = a4;
  v9 = a3;
  +[CRLPencilKitInkStroke adjustedStrokeWidthFromWidth:forInkType:](CRLPencilKitInkStroke, "adjustedStrokeWidthFromWidth:forInkType:", v9, a5);
  v11 = -[CRLPencilKitInkStroke initWithInkType:color:adjustedWidth:isFountainPenInkV2:](self, "initWithInkType:color:adjustedWidth:isFountainPenInkV2:", v9, v8, objc_msgSend(v9, "isEqualToString:", PKInkTypeFountainPen), v10);

  return v11;
}

- (CRLPencilKitInkStroke)initWithInk:(id)a3 adjustedWidth:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  CRLPencilKitInkStroke *v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "color"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithUIColor:](CRLColor, "colorWithUIColor:", v7));

  v9 = objc_msgSend(v6, "_isFountainPenInkV2");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inkType"));

  v11 = -[CRLPencilKitInkStroke initWithInkType:color:adjustedWidth:isFountainPenInkV2:](self, "initWithInkType:color:adjustedWidth:isFountainPenInkV2:", v10, v8, v9, a4);
  return v11;
}

- (CRLPencilKitInkStroke)initWithInk:(id)a3 unadjustedPencilKitWidth:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  CRLPencilKitInkStroke *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inkType"));
  +[CRLPencilKitInkStroke adjustedStrokeWidthFromWidth:forInkType:](CRLPencilKitInkStroke, "adjustedStrokeWidthFromWidth:forInkType:", v7, a4);
  v9 = v8;

  v10 = -[CRLPencilKitInkStroke initWithInk:adjustedWidth:](self, "initWithInk:adjustedWidth:", v6, v9);
  return v10;
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class(CRLMutablePencilKitInkStroke, a2);
}

+ (BOOL)requiresCustomBoundsMeasurement
{
  return 1;
}

+ (BOOL)isMoreOptimalToDrawWithOtherStrokesIfPossible
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutablePencilKitInkStroke *v4;
  void *v5;
  void *v6;
  CRLMutablePencilKitInkStroke *v7;

  v4 = [CRLMutablePencilKitInkStroke alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPencilKitInkStroke inkType](self, "inkType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
  -[CRLStroke width](self, "width");
  v7 = -[CRLPencilKitInkStroke initWithInkType:color:adjustedWidth:](v4, "initWithInkType:color:adjustedWidth:", v5, v6);

  return v7;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPencilKitInkStroke inkType](self, "inkType"));
  -[CRLStroke width](self, "width");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p inkType='%@' width=%f>"), v5, self, v6, v7));

  return v8;
}

- (BOOL)shouldRender
{
  return 1;
}

- (BOOL)canDrawWithOtherStroke:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  v3 = a3;
  v5 = objc_opt_class(CRLPencilKitInkStroke, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

- (CRLSmartStroke)fallbackSmartStrokeForPersistence
{
  void *v3;
  unsigned int v4;
  __CFString **v5;
  void *v6;
  unsigned int v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPencilKitInkStroke inkType](self, "inkType"));
  v4 = objc_msgSend(v3, "isEqualToString:", PKInkTypePencil);

  if (v4)
  {
    v5 = &off_101243D00;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPencilKitInkStroke inkType](self, "inkType"));
    v7 = objc_msgSend(v6, "isEqualToString:", PKInkTypeCrayon);

    if (!v7)
    {
      v10 = 0;
      return (CRLSmartStroke *)v10;
    }
    v5 = &off_101243D08;
  }
  v8 = *v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
  -[CRLStroke i_width](self, "i_width");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSmartStroke strokeWithName:color:width:](CRLBrushStroke, "strokeWithName:color:width:", v8, v9));

  return (CRLSmartStroke *)v10;
}

- (double)widthForDefaultAndDowngradePersistence
{
  double v3;
  double v4;
  void *v5;
  unsigned int v6;
  double result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLPencilKitInkStroke;
  -[CRLStroke widthForDefaultAndDowngradePersistence](&v8, "widthForDefaultAndDowngradePersistence");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPencilKitInkStroke inkType](self, "inkType"));
  v6 = objc_msgSend(v5, "isEqualToString:", PKInkTypeWatercolor);

  result = v4 * 0.25;
  if (!v6)
    return v4;
  return result;
}

+ (double)adjustedStrokeWidthFromWidth:(double)a3 forInkType:(id)a4
{
  id v5;
  double v6;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", PKInkTypeMonoline))
  {
    a3 = a3 + a3;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", PKInkTypePen) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", PKInkTypeCrayon) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", PKInkTypeMarker))
  {
    v6 = sub_1003C65EC((a3 + -5.0) / 21.0, 0.0, 1.0);
    a3 = sub_1003C660C(1.0, 0.5, v6) * a3;
  }

  return a3;
}

+ (double)unadjustedStrokeWidthFromAdjustedWidth:(double)a3 forInkType:(id)a4
{
  id v5;
  double v6;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", PKInkTypeMonoline))
  {
    v6 = a3 * 0.5;
  }
  else
  {
    if ((objc_msgSend(v5, "isEqualToString:", PKInkTypePen) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", PKInkTypeCrayon) & 1) == 0
      && !objc_msgSend(v5, "isEqualToString:", PKInkTypeMarker))
    {
      goto LABEL_11;
    }
    v6 = 0.0;
    if (a3 < 0.0)
      goto LABEL_14;
    if (a3 <= 5.0)
    {
LABEL_11:
      v6 = a3;
      goto LABEL_14;
    }
    if (a3 <= 13.0)
    {
      v6 = (47.0 - sqrt(a3 * -168.0 + 2209.0)) * 0.5;
    }
    else if (a3 <= 13.1488095)
    {
      v6 = 23.5;
    }
    else
    {
      v6 = a3 + a3;
    }
  }
LABEL_14:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  objc_super v14;

  v4 = a3;
  v6 = objc_opt_class(CRLPencilKitInkStroke, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "inkType")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPencilKitInkStroke inkType](self, "inkType")),
        v11 = objc_msgSend(v9, "isEqual:", v10),
        v10,
        v9,
        v11))
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLPencilKitInkStroke;
    v12 = -[CRLStroke isEqual:](&v14, "isEqual:", v8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLPencilKitInkStroke;
  v3 = -[CRLStroke hash](&v7, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPencilKitInkStroke inkType](self, "inkType"));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

+ (CGRect)boundsOfStrokes:(id)a3
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  v3 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11), "renderBounds");
        v29.origin.x = v12;
        v29.origin.y = v13;
        v29.size.width = v14;
        v29.size.height = v15;
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v26 = CGRectUnion(v25, v29);
        x = v26.origin.x;
        y = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  if (CGRectIsNull(v27))
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  _QWORD block[4];
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100104594;
  block[3] = &unk_10122D7E0;
  v9 = &stru_1012383D0;
  if (qword_101414E08 != -1)
    dispatch_once(&qword_101414E08, block);

}

+ (void)drawStrokes:(id)a3 inContext:(CGContext *)a4 overTransparentCanvas:(BOOL)a5
{
  +[CRLPencilKitRenderer drawStrokes:inContext:overTransparentCanvas:](CRLPencilKitRenderer, "drawStrokes:inContext:overTransparentCanvas:", a3, a4, a5);
}

- (NSString)inkType
{
  return self->_inkType;
}

- (BOOL)isFountainPenInkV2
{
  return self->_isFountainPenInkV2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inkType, 0);
}

@end
