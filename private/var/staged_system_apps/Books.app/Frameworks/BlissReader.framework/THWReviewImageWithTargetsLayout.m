@implementation THWReviewImageWithTargetsLayout

- (THWReviewImageWithTargetsLayout)initWithQuestion:(id)a3 index:(unint64_t)a4 delegate:(id)a5
{
  THWReviewImageWithTargetsLayout *v8;
  THWReviewImageWithTargetsLayout *v9;
  CGPoint origin;
  CGSize size;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)THWReviewImageWithTargetsLayout;
  v8 = -[THWReviewImageWithTargetsLayout initWithInfo:](&v13, "initWithInfo:", 0);
  v9 = v8;
  if (v8)
  {
    origin = CGRectNull.origin;
    size = CGRectNull.size;
    v8->_imageFrame.origin = CGRectNull.origin;
    v8->_imageFrame.size = size;
    v8->_drawerFrame.origin = origin;
    v8->_drawerFrame.size = size;
    v8->_placardTextSize = CGSizeZero;
    v8->_questionIndex = a4;
    v8->_question = (THWReviewQuestion *)a3;
    v9->_delegate = (THWReviewQuestionLayoutDelegate *)a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageWithTargetsLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWReviewImageWithTargetsRep, a2);
}

- (id)childInfosForLayout
{
  id result;

  result = -[THWReviewQuestion imageInfo](-[THWReviewImageWithTargetsLayout question](self, "question"), "imageInfo");
  if (result)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", result);
  return result;
}

- (id)dependentLayouts
{
  id v3;
  objc_super v5;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v5.receiver = self;
  v5.super_class = (Class)THWReviewImageWithTargetsLayout;
  objc_msgSend(v3, "addObjectsFromArray:", -[THWReviewImageWithTargetsLayout dependentLayouts](&v5, "dependentLayouts"));
  -[THWReviewImageWithTargetsLayout addDescendentLayoutsToArray:](self, "addDescendentLayoutsToArray:", v3);
  return v3;
}

- (void)updateChildrenFromInfo
{
  objc_super v3;

  -[THWReviewImageWithTargetsLayout p_setupPlacardLayouts](self, "p_setupPlacardLayouts");
  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageWithTargetsLayout;
  -[THWContainerLayout updateChildrenFromInfo](&v3, "updateChildrenFromInfo");
}

- (id)additionalLayouts
{
  NSMutableArray *v3;

  v3 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[THWReviewImageWithTargetsLayout targetLayouts](self, "targetLayouts"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", -[THWReviewImageWithTargetsLayout placardLayouts](self, "placardLayouts"));
  return v3;
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (void)invalidateSize
{
  CGPoint origin;
  CGSize size;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWReviewImageWithTargetsLayout;
  -[THWReviewImageWithTargetsLayout invalidateSize](&v5, "invalidateSize");
  origin = CGRectNull.origin;
  size = CGRectNull.size;
  self->_imageFrame.origin = CGRectNull.origin;
  self->_imageFrame.size = size;
  self->_drawerFrame.origin = origin;
  self->_drawerFrame.size = size;
  self->_placardTextSize = CGSizeZero;
}

- (CGSize)p_drawerFrameSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  char *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v25;
  double v26;
  CGSize result;

  v3 = TSDRectWithSize(objc_msgSend(-[THWReviewImageWithTargetsLayout geometry](self, "geometry"), "frame"));
  v5 = v4;
  v7 = v6;
  v8 = (char *)-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self, v3);
  if (v8 != (_BYTE *)&dword_0 + 2)
  {
    -[THWReviewImageWithTargetsLayout p_placardHorzPadding](self, "p_placardHorzPadding");
    v7 = v9 + 68.0;
  }
  if (objc_msgSend(-[NSMutableArray objectAtIndex:](self->_placardLayouts, "objectAtIndex:", 0), "contentImage"))
  {
    -[THWReviewImageWithTargetsLayout p_placardImageSize](self, "p_placardImageSize");
    v11 = v10;
    v13 = v12;
    -[THWReviewImageWithTargetsLayout p_placardImagePadding](self, "p_placardImagePadding");
    if (v8 == (_BYTE *)&dword_0 + 2)
    {
      v5 = floor(v14 + v14 + (v11 + 10.0) * 3.0);
    }
    else if (v8)
    {
      v20 = floor(v14 + (v13 + 10.0) * 2.0);
      if (v7 < v20)
        v7 = v20;
    }
  }
  else
  {
    v15 = -[NSArray count](-[THWReviewQuestion choices](-[THWReviewImageWithTargetsLayout question](self, "question"), "choices"), "count");
    v16 = v15;
    v17 = (double)v15;
    if (v8 == (_BYTE *)&dword_0 + 2)
    {
      v18 = ceil(v17 / 3.0);
      v19 = 80.0;
    }
    else
    {
      v19 = 185.0;
      v18 = (double)v15;
    }
    -[THWReviewImageWithTargetsLayout p_placardHorzPadding](self, "p_placardHorzPadding");
    v22 = (double)(uint64_t)v18;
    v23 = (v5 + v21) / v22 - v21;
    if (v8 != (_BYTE *)&dword_0 + 2 && v23 < v19 && v16 >= 3)
    {
      v22 = (double)(uint64_t)ceil(v17 * 0.5);
      v23 = (v5 + v21) / v22 - v21;
    }
    if (v23 >= v19)
      v23 = v19;
    v5 = -(v21 - v22 * (v21 + v23));
  }
  v25 = v5;
  v26 = v7;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)p_setupFrames
{
  CGRect *p_imageFrame;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect *p_drawerFrame;
  double v14;
  CGFloat v15;
  THWReviewQuestion *v16;
  CGFloat v17;
  CGFloat v18;
  char *v19;
  id v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double Width;
  double v40;
  double v41;
  double v42;
  double v43;
  double Height;
  double v45;
  double v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  p_imageFrame = &self->_imageFrame;
  if (CGRectIsNull(self->_imageFrame) || CGRectIsNull(self->_drawerFrame))
  {
    v4 = TSDRectWithSize(objc_msgSend(-[THWReviewImageWithTargetsLayout geometry](self, "geometry"), "frame"));
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[THWReviewImageWithTargetsLayout p_drawerFrameSize](self, "p_drawerFrameSize");
    v12 = v11;
    p_drawerFrame = &self->_drawerFrame;
    v15 = TSUClamp(v14, 10.0, 200.0);
    self->_drawerFrame.origin.x = 0.0;
    self->_drawerFrame.origin.y = 0.0;
    self->_drawerFrame.size.width = v12;
    self->_drawerFrame.size.height = v15;
    v16 = -[THWReviewImageWithTargetsLayout question](self, "question");
    v17 = v4;
    v18 = v6;
    if (v16)
      -[THWReviewQuestion imageSize](v16, "imageSize");
    v19 = (char *)-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self);
    v20 = -[THWReviewImageWithTargetsLayout p_placardVertPadding](self, "p_placardVertPadding");
    v46 = v21;
    v22 = TSDRectWithSize(v20);
    v26 = THIntegralCenterRectInRect(v22, v23, v24, v25, v17, v6, v8, v10);
    p_imageFrame->origin.x = v27;
    p_imageFrame->origin.y = v28;
    p_imageFrame->size.width = v29;
    p_imageFrame->size.height = v30;
    v31 = TSDRectWithSize(v26);
    THIntegralCenterRectInRect(v31, v32, v33, v34, v17, v6, v8, v10);
    p_drawerFrame->origin.x = v35;
    self->_drawerFrame.origin.y = v36;
    self->_drawerFrame.size.width = v37;
    self->_drawerFrame.size.height = v38;
    if (v19 == (_BYTE *)&dword_0 + 2)
    {
      Width = CGRectGetWidth(*(CGRect *)&v35);
      v40 = Width + CGRectGetWidth(*p_imageFrame);
      v47.origin.x = v17;
      v47.origin.y = v18;
      v47.size.width = v8;
      v47.size.height = v10;
      v41 = CGRectGetWidth(v47);
      v42 = floor((v41 - v40) / 3.0);
      if (v42 <= 15.0)
      {
        p_drawerFrame->origin.x = 0.0;
        v43 = v41 - CGRectGetWidth(*p_imageFrame);
      }
      else
      {
        p_drawerFrame->origin.x = v42;
        v48.origin.y = self->_drawerFrame.origin.y;
        v48.size.width = self->_drawerFrame.size.width;
        v48.size.height = self->_drawerFrame.size.height;
        v48.origin.x = v42;
        v43 = v42 + CGRectGetMaxX(v48);
      }
      p_imageFrame->origin.x = v43;
    }
    else
    {
      Height = CGRectGetHeight(*p_imageFrame);
      v49.origin.x = p_drawerFrame->origin.x;
      v49.origin.y = self->_drawerFrame.origin.y;
      v49.size.width = self->_drawerFrame.size.width;
      v49.size.height = self->_drawerFrame.size.height;
      v45 = v46 + Height + CGRectGetHeight(v49);
      v50.origin.x = v17;
      v50.origin.y = v18;
      v50.size.width = v8;
      v50.size.height = v10;
      v51.origin.y = floor((CGRectGetHeight(v50) - v45) * 0.5);
      p_imageFrame->origin.y = v51.origin.y;
      v51.origin.x = p_imageFrame->origin.x;
      v51.size.width = p_imageFrame->size.width;
      v51.size.height = p_imageFrame->size.height;
      self->_drawerFrame.origin.y = v46 + CGRectGetMaxY(v51);
    }
  }
}

- (CGRect)imageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[THWReviewImageWithTargetsLayout p_setupFrames](self, "p_setupFrames");
  x = self->_imageFrame.origin.x;
  y = self->_imageFrame.origin.y;
  width = self->_imageFrame.size.width;
  height = self->_imageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)drawerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[THWReviewImageWithTargetsLayout p_setupFrames](self, "p_setupFrames");
  x = self->_drawerFrame.origin.x;
  y = self->_drawerFrame.origin.y;
  width = self->_drawerFrame.size.width;
  height = self->_drawerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)p_positionForTargetAtIndex:(unint64_t)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  THWReviewQuestion *v15;
  double v16;
  id v17;
  double x;
  double y;
  CGPoint result;

  v4 = -[THWReviewQuestion choiceAtIndex:](-[THWReviewImageWithTargetsLayout question](self, "question"), "choiceAtIndex:", a3);
  if (v4)
  {
    v5 = v4;
    -[THWReviewImageWithTargetsLayout imageFrame](self, "imageFrame");
    v7 = v6;
    objc_msgSend(objc_msgSend(v5, "targetRegion"), "bounds");
    v12 = TSDCenterOfRect(v8, v9, v10, v11);
    v14 = v13;
    v15 = -[THWReviewImageWithTargetsLayout question](self, "question");
    if (!v15 || (-[THWReviewQuestion imageSize](v15, "imageSize"), v16 == 0.0))
      v17 = objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewImageWithTargetsLayout p_positionForTargetAtIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewImageWithTargetsLayout.m"), 323, CFSTR("Invalid image width."));
    else
      TSDMultiplyPointScalar(v12, v14, v7 / v16);
    x = TSDAddPoints(v17);
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  result.y = y;
  result.x = x;
  return result;
}

- (int)placardArrowPlacementforTarget:(unint64_t)a3
{
  unsigned int v3;

  v3 = objc_msgSend(-[THWReviewQuestion choiceAtIndex:](-[THWReviewImageWithTargetsLayout question](self, "question"), "choiceAtIndex:", a3), "placardPlacement")- 1;
  if (v3 > 3)
    return 0;
  else
    return dword_315270[v3];
}

- (void)updatePlacardLayouts
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSMutableArray *placardLayouts;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = -[THWReviewImageWithTargetsLayout p_responseController](self, "p_responseController");
  v4 = objc_msgSend(v3, "newTemporateReviewResponseMOC");
  v5 = objc_msgSend(v3, "responseForQuestionID:temporaryMOC:", -[THWReviewQuestion questionID](-[THWReviewImageWithTargetsLayout question](self, "question"), "questionID"), v4);
  v6 = objc_opt_class(TSWReviewMatchingAnswerState);
  TSUDynamicCast(v6, objc_msgSend(v5, "answerState"));
  v8 = v7;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  placardLayouts = self->_placardLayouts;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](placardLayouts, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(placardLayouts);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "invalidateFrame");
        if (objc_msgSend(v14, "placement") != 2)
        {
          if (v8)
            v15 = (uint64_t)objc_msgSend(v8, "targetForPlacard:", objc_msgSend(v14, "index"));
          else
            v15 = 0x7FFFFFFFFFFFFFFFLL;
          objc_msgSend(v14, "setPlacement:", v15 != 0x7FFFFFFFFFFFFFFFLL);
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](placardLayouts, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (id)layoutGeometryForLayout:(id)a3
{
  uint64_t v5;
  id v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = objc_opt_class(TSDImageLayout);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
  {
    v6 = objc_alloc((Class)TSDLayoutGeometry);
    -[THWReviewImageWithTargetsLayout imageFrame](self, "imageFrame");
    return objc_msgSend(v6, "initWithFrame:", v7);
  }
  v8 = objc_opt_class(THWReviewDragTargetLayout);
  if ((objc_opt_isKindOfClass(a3, v8) & 1) != 0)
  {
    -[THWReviewImageWithTargetsLayout p_positionForTargetAtIndex:](self, "p_positionForTargetAtIndex:", objc_msgSend(a3, "index"));
    v10 = v9;
    v12 = v11;
    v6 = objc_alloc((Class)TSDLayoutGeometry);
    v7 = TSDRectWithOriginAndSize(v6, v10, v12, CGSizeZero.width, CGSizeZero.height);
    return objc_msgSend(v6, "initWithFrame:", v7);
  }
  return 0;
}

- (id)layoutForChoiceIndex:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self->_placardLayouts, "count") <= a3)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](self->_placardLayouts, "objectAtIndex:", a3);
}

- (id)layoutForTargetIndex:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self->_targetLayouts, "count") <= a3)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](self->_targetLayouts, "objectAtIndex:", a3);
}

- (void)p_calculateTextPlacardNumRows:(unint64_t *)a3 numCols:(unint64_t *)a4 rowHeight:(double *)a5 colWidth:(double *)a6 lasRowNeedsCentering:(BOOL *)a7
{
  char *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  unint64_t v24;
  double v25;
  BOOL v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  double v33;
  double v34;

  v13 = (char *)-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self);
  -[THWReviewImageWithTargetsLayout drawerFrame](self, "drawerFrame");
  v15 = v14;
  v17 = v16;
  v18 = -[NSArray count](-[THWReviewQuestion choices](-[THWReviewImageWithTargetsLayout question](self, "question"), "choices"), "count");
  -[THWReviewImageWithTargetsLayout p_placardHorzPadding](self, "p_placardHorzPadding");
  v20 = v19;
  v21 = -[THWReviewImageWithTargetsLayout p_placardVertPadding](self, "p_placardVertPadding");
  v23 = v22;
  if (v13 == (_BYTE *)&dword_0 + 2)
  {
    v24 = v18 + 2;
    v25 = (double)v18;
    v26 = (v18 + 2 > 5) & v18;
    v18 = (v18 + 2) / 3;
    v27 = vcvtpd_u64_f64(v25 / (double)(v24 / 3));
  }
  else if (v18 == 2)
  {
    v26 = 0;
    if (v15 > v17)
      v27 = 1;
    else
      v27 = 2;
    if (v15 <= v17)
      v18 = 1;
    else
      v18 = 2;
  }
  else if ((v15 + v20) / (double)v18 - v20 >= 185.0)
  {
    v26 = 0;
    v27 = 1;
  }
  else
  {
    v28 = v18 - 3;
    v29 = 3;
    if (v18 == 9)
      v30 = 3;
    else
      v30 = 1;
    if (v18 != 9)
      v29 = v18;
    v31 = v18 & 1;
    if (v28 <= 5)
      v27 = 2;
    else
      v27 = v30;
    if (v28 <= 5)
      v18 = (v18 + 1) >> 1;
    else
      v18 = v29;
    v26 = v28 <= 5 && v31;
  }
  v33 = TSDFloorForMainScreen(v21, (v15 - (double)(v18 - 1) * v20) / (double)v18);
  if (v13 != (_BYTE *)&dword_0 + 2)
  {
    v34 = TSDFloorForMainScreen(v32, (v17 - (double)(v27 - 1) * v23) / (double)v27);
    if (!a3)
      goto LABEL_31;
    goto LABEL_30;
  }
  v34 = 34.0;
  if (a3)
LABEL_30:
    *a3 = v27;
LABEL_31:
  if (a4)
    *a4 = v18;
  if (a5)
    *a5 = v34;
  if (a6)
    *a6 = v33;
  if (a7)
    *a7 = v26;
}

- (CGSize)placardTextSize
{
  CGSize *p_placardTextSize;
  double width;
  double height;
  double v5;
  double v8;
  double v9;
  double v10;
  double v11;
  NSUInteger v12;
  char *v13;
  double v14;
  double v15;
  double v16;
  NSUInteger v17;
  uint64_t v18;
  CGSize result;

  p_placardTextSize = &self->_placardTextSize;
  width = self->_placardTextSize.width;
  height = self->_placardTextSize.height;
  v5 = CGSizeZero.height;
  if (width == CGSizeZero.width && height == v5)
  {
    -[THWReviewImageWithTargetsLayout drawerFrame](self, "drawerFrame");
    v9 = v8;
    v11 = v10;
    v12 = -[NSArray count](-[THWReviewQuestion choices](-[THWReviewImageWithTargetsLayout question](self, "question"), "choices"), "count");
    width = CGSizeZero.width;
    height = v5;
    if (v12 <= 9)
    {
      if (v12 >= 2)
      {
        v17 = v12;
        v18 = 1;
        v15 = 0.0;
        v16 = 0.0;
        -[THWReviewImageWithTargetsLayout p_calculateTextPlacardNumRows:numCols:rowHeight:colWidth:lasRowNeedsCentering:](self, "p_calculateTextPlacardNumRows:numCols:rowHeight:colWidth:lasRowNeedsCentering:", &v18, &v17, &v15, &v16, 0, CGSizeZero.width, v5);
        v13 = (char *)-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self);
        v14 = 185.0;
        if (v13 == (_BYTE *)&dword_0 + 2)
          v14 = 80.0;
        if (v16 < v14)
          v14 = v16;
        width = v14 + -10.0;
        height = v15 + -10.0;
        if (v15 >= 34.0)
          height = 24.0;
        p_placardTextSize->width = width;
        p_placardTextSize->height = height;
      }
      else
      {
        width = v9;
        height = v11;
      }
    }
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)p_drawerPositionForTextPlacard:(id)a3 withSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSUInteger v16;
  double y;
  CGFloat x;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  char v44;
  NSUInteger v45;
  unint64_t v46;
  CGPoint result;
  CGRect v48;

  height = a4.height;
  width = a4.width;
  -[THWReviewImageWithTargetsLayout drawerFrame](self, "drawerFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = -[NSArray count](-[THWReviewQuestion choices](-[THWReviewImageWithTargetsLayout question](self, "question"), "choices"), "count");
  if (v16 - 10 > 0xFFFFFFFFFFFFFFF6)
  {
    if (v16 == 1)
    {
      x = TSDCenterOfRect(v9, v11, v13, v15);
    }
    else
    {
      v41 = height;
      v45 = v16;
      v46 = 1;
      v44 = 0;
      v42 = 0.0;
      v43 = 0.0;
      -[THWReviewImageWithTargetsLayout p_calculateTextPlacardNumRows:numCols:rowHeight:colWidth:lasRowNeedsCentering:](self, "p_calculateTextPlacardNumRows:numCols:rowHeight:colWidth:lasRowNeedsCentering:", &v46, &v45, &v42, &v43, &v44);
      v19 = v43;
      v38 = v43 * 0.5;
      v39 = v42 * 0.5;
      -[THWReviewImageWithTargetsLayout p_placardHorzPadding](self, "p_placardHorzPadding");
      v21 = (v19 + v20) * 0.5;
      v22 = (unint64_t)objc_msgSend(a3, "index");
      v40 = width;
      if (v45)
      {
        v23 = v22 / v45;
        v24 = (double)(v22 % v45);
      }
      else
      {
        v23 = 0;
        v24 = 0.0;
      }
      -[THWReviewImageWithTargetsLayout p_placardVertPadding](self, "p_placardVertPadding");
      v26 = v25;
      if (v23 + 1 == v46)
        v27 = v21;
      else
        v27 = 0.0;
      if (v44)
        v28 = v27;
      else
        v28 = 0.0;
      v29 = v43;
      -[THWReviewImageWithTargetsLayout p_placardHorzPadding](self, "p_placardHorzPadding", v27);
      v31 = v28 + v38 + v9 + v24 * (v29 + v30) - v40 * 0.5;
      v32 = v39 + v11 + (double)v23 * (v26 + v42) - v41 * 0.5;
      v33 = -(v26 - (double)v46 * (v26 + v42));
      v48.origin.x = v9;
      v48.origin.y = v11;
      v48.size.width = v13;
      v48.size.height = v15;
      v34 = v32 + (CGRectGetHeight(v48) - v33) * 0.5;
      x = TSDFloorForMainScreen(v35, v31);
      y = TSDFloorForMainScreen(v36, v34);
    }
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  v37 = x;
  result.y = y;
  result.x = v37;
  return result;
}

- (CGPoint)p_drawerPositionForImagePlacard:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  unint64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  unint64_t v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGPoint result;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  height = a4.height;
  width = a4.width;
  v8 = -[NSArray count](-[THWReviewQuestion choices](-[THWReviewImageWithTargetsLayout question](self, "question"), "choices"), "count");
  -[THWReviewImageWithTargetsLayout drawerFrame](self, "drawerFrame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (unint64_t)objc_msgSend(a3, "index");
  -[THWReviewImageWithTargetsLayout p_placardImagePadding](self, "p_placardImagePadding");
  v19 = v18;
  if (-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self))
  {
    v20 = (v8 + 2) / 3;
    v21 = vcvtpd_u64_f64((double)v8 / (double)v20);
    v22 = (double)(v17 % v21);
    if (v21)
      v23 = v17 / v21;
    else
      v23 = 0;
    if (v21)
      v24 = v22;
    else
      v24 = 0.0;
    v25 = width + v19;
    v26 = height + v19;
    v27 = -(v19 - (double)v21 * v25);
    v41 = -(v19 - (double)v20 * v26);
    v42 = v24;
    if (((v8 + 2 > 5) & v8 & (v23 + 1 == v20)) != 0)
      v28 = v25 * 0.5;
    else
      v28 = 0.0;
    v44.origin.x = v10;
    v44.origin.y = v12;
    v44.size.width = v14;
    v44.size.height = v16;
    v29 = floor((CGRectGetWidth(v44) - v27) * 0.5);
    v45.origin.x = v10;
    v45.origin.y = v12;
    v45.size.width = v14;
    v45.size.height = v16;
    v30 = v28 + CGRectGetMinX(v45) + v29;
    v46.origin.x = v10;
    v46.origin.y = v12;
    v46.size.width = v14;
    v46.size.height = v16;
    v31 = floor((CGRectGetHeight(v46) - v41) * 0.5);
    v47.origin.x = v10;
    v47.origin.y = v12;
    v47.size.width = v14;
    v47.size.height = v16;
    v32 = CGRectGetMinY(v47) + v31;
    v33 = v30 + floor(v25) * v42;
    v34 = v32 + floor(v26) * (double)v23;
  }
  else
  {
    v35 = width + v19;
    v48.origin.x = v10;
    v48.origin.y = v12;
    v48.size.width = v14;
    v48.size.height = v16;
    v36 = floor((CGRectGetWidth(v48) - -(v19 - (double)v8 * v35)) * 0.5);
    v49.origin.x = v10;
    v49.origin.y = v12;
    v49.size.width = v14;
    v49.size.height = v16;
    v37 = CGRectGetMinX(v49) + v36;
    v50.origin.x = v10;
    v50.origin.y = v12;
    v50.size.width = v14;
    v50.size.height = v16;
    v38 = floor((CGRectGetHeight(v50) - height) * 0.5);
    v51.origin.x = v10;
    v51.origin.y = v12;
    v51.size.width = v14;
    v51.size.height = v16;
    v34 = CGRectGetMinY(v51) + v38;
    v39 = floor(v35);
    v40 = 0.0;
    if (v8)
      v40 = (double)(v17 % v8);
    v33 = v37 + v39 * v40;
  }
  result.y = v34;
  result.x = v33;
  return result;
}

- (CGPoint)p_drawerPositionForPlacard:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  double x;
  double y;
  CGPoint result;

  height = a4.height;
  width = a4.width;
  if (objc_msgSend(a3, "contentStorage"))
  {
    -[THWReviewImageWithTargetsLayout p_drawerPositionForTextPlacard:withSize:](self, "p_drawerPositionForTextPlacard:withSize:", a3, width, height);
  }
  else if (objc_msgSend(a3, "contentImage"))
  {
    -[THWReviewImageWithTargetsLayout p_drawerPositionForImagePlacard:withSize:](self, "p_drawerPositionForImagePlacard:withSize:", a3, width, height);
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  result.y = y;
  result.x = x;
  return result;
}

- (id)p_responseController
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(THDocumentRoot);
  TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THWReviewImageWithTargetsLayout layoutController](self, "layoutController"), "canvas"), "documentRoot"));
  return result;
}

- (CGPoint)draggablePlacardLayout:(id)a3 originForSize:(CGSize)a4
{
  double height;
  double width;
  THWReviewQuestion *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  id v15;
  double v16;
  double x;
  double v18;
  double y;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  CGPoint result;

  height = a4.height;
  width = a4.width;
  v8 = -[THWReviewImageWithTargetsLayout question](self, "question");
  v9 = -[THWReviewImageWithTargetsLayout p_responseController](self, "p_responseController");
  v10 = objc_msgSend(v9, "newTemporateReviewResponseMOC");
  v11 = objc_msgSend(v9, "responseForQuestionID:temporaryMOC:", -[THWReviewQuestion questionID](v8, "questionID"), v10);
  v12 = objc_opt_class(TSWReviewMatchingAnswerState);
  *(_QWORD *)&v14 = TSUDynamicCast(v12, objc_msgSend(v11, "answerState")).n128_u64[0];
  if (v13
    && (v15 = objc_msgSend(v13, "targetForPlacard:", objc_msgSend(a3, "index", v14)), v15 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v22 = v15;
    x = CGPointZero.x;
    y = CGPointZero.y;
    -[THWReviewImageWithTargetsLayout p_positionForTargetAtIndex:](self, "p_positionForTargetAtIndex:", v15);
    v24 = v23;
    v26 = v25;
    v27 = -[THWReviewQuestion choiceAtIndex:](-[THWReviewImageWithTargetsLayout question](self, "question"), "choiceAtIndex:", v22);
    switch(objc_msgSend(v27, "placardPlacement"))
    {
      case 0u:
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewImageWithTargetsLayout draggablePlacardLayout:originForSize:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewImageWithTargetsLayout.m"), 703, CFSTR("Invalid placardPlacement: %d"), objc_msgSend(v27, "placardPlacement"));
        break;
      case 1u:
        x = v24 + width * -0.5;
        y = v26 - height + -33.0;
        break;
      case 2u:
        x = v24 + 33.0;
        goto LABEL_11;
      case 3u:
        x = v24 + width * -0.5;
        v28 = 33.0;
        goto LABEL_12;
      case 4u:
        x = v24 - width + -33.0;
LABEL_11:
        v28 = height * -0.5;
LABEL_12:
        y = v26 + v28;
        break;
      default:
        break;
    }
  }
  else
  {
    -[THWReviewImageWithTargetsLayout p_drawerPositionForPlacard:withSize:](self, "p_drawerPositionForPlacard:withSize:", a3, width, height);
    x = v16;
    y = v18;
  }

  v20 = x;
  v21 = y;
  result.y = v21;
  result.x = v20;
  return result;
}

- (UIEdgeInsets)draggablePlacardLayoutInsets:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 5.0;
  v4 = 5.0;
  v5 = 5.0;
  v6 = 5.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)draggablePlacardLayoutTextInsets:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 5.0;
  v4 = 15.0;
  v5 = 5.0;
  v6 = 15.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)draggablePlacardLayoutTextMaxWidth:(id)a3
{
  id v5;
  unsigned int v6;
  BOOL v7;
  double result;

  v5 = -[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self);
  v6 = objc_msgSend(a3, "placement");
  if (v6)
  {
    v7 = v6 == 2 || v5 == 0;
    result = 80.0;
    if (v7)
      return 185.0;
  }
  else
  {
    -[THWReviewImageWithTargetsLayout placardTextSize](self, "placardTextSize");
  }
  return result;
}

- (double)draggablePlacardLayoutTextHeight:(id)a3
{
  double v3;

  -[THWReviewImageWithTargetsLayout placardTextSize](self, "placardTextSize", a3);
  return v3;
}

- (double)p_placardImagePadding
{
  id v3;
  double result;
  NSUInteger v5;

  v3 = -[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self);
  result = 9.0;
  if (!v3)
  {
    v5 = -[NSArray count](-[THWReviewQuestion choices](-[THWReviewImageWithTargetsLayout question](self, "question", 9.0), "choices"), "count");
    result = 9.0;
    if (v5 < 5)
      return 14.0;
  }
  return result;
}

- (CGSize)p_placardImageSize
{
  double v3;
  NSUInteger v4;
  double v5;
  CGSize result;

  if (-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self))
  {
    v3 = 43.0;
  }
  else
  {
    v4 = -[NSArray count](-[THWReviewQuestion choices](-[THWReviewImageWithTargetsLayout question](self, "question"), "choices"), "count");
    v3 = 43.0;
    if (v4 < 5)
      v3 = 58.0;
  }
  v5 = v3;
  result.height = v5;
  result.width = v3;
  return result;
}

- (double)p_placardHorzPadding
{
  char *v2;
  double result;

  v2 = (char *)-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self);
  result = 15.0;
  if (v2 == (_BYTE *)&dword_0 + 2)
    return 10.0;
  return result;
}

- (double)p_placardVertPadding
{
  char *v2;
  double result;

  v2 = (char *)-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self);
  result = 15.0;
  if (v2 == (_BYTE *)&dword_0 + 2)
    return 10.0;
  return result;
}

- (void)p_setupPlacardLayouts
{
  NSArray *v3;
  char *v4;
  char *i;
  id v6;
  THWReviewDraggablePlacardLayout *v7;
  id v8;
  THWReviewDragTargetLayout *v9;

  if (!self->_placardLayouts || !self->_targetLayouts)
  {
    v3 = -[THWReviewQuestion choices](-[THWReviewImageWithTargetsLayout question](self, "question"), "choices");
    v4 = -[NSArray count](v3, "count");

    self->_placardLayouts = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v4);
    self->_targetLayouts = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v4);
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = -[NSArray objectAtIndex:](v3, "objectAtIndex:", i);
        v7 = -[THWReviewDraggablePlacardLayout initWithIndex:choice:delegate:]([THWReviewDraggablePlacardLayout alloc], "initWithIndex:choice:delegate:", i, v6, self);
        v8 = objc_msgSend(v6, "contentType");
        if (objc_msgSend(v8, "isEqualToString:", TSWReviewChoiceDescriptionContentTypeTextValue))
        {
          -[THWReviewDraggablePlacardLayout setContentStorage:](v7, "setContentStorage:", objc_msgSend(v6, "contentStorage"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", TSWReviewChoiceDescriptionContentTypeImageValue))
        {
          -[THWReviewDraggablePlacardLayout setContentImage:](v7, "setContentImage:", objc_msgSend(v6, "contentImage"));
        }
        -[NSMutableArray addObject:](self->_placardLayouts, "addObject:", v7);

        v9 = -[THWReviewDragTargetLayout initWithIndex:]([THWReviewDragTargetLayout alloc], "initWithIndex:", i);
        -[NSMutableArray addObject:](self->_targetLayouts, "addObject:", v9);

      }
    }
    -[THWReviewImageWithTargetsLayout updatePlacardLayouts](self, "updatePlacardLayouts");
  }
}

- (unint64_t)questionIndex
{
  return self->_questionIndex;
}

- (THWReviewQuestion)question
{
  return self->_question;
}

- (THWReviewQuestionLayoutDelegate)delegate
{
  return self->_delegate;
}

- (NSMutableArray)placardLayouts
{
  return self->_placardLayouts;
}

- (NSMutableArray)targetLayouts
{
  return self->_targetLayouts;
}

@end
