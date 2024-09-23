@implementation PFXDrawablePlacement

- (PFXDrawablePlacement)initWithDrawable:(id)a3
{
  PFXDrawablePlacement *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFXDrawablePlacement;
  result = -[PFXDrawablePlacement init](&v5, "init");
  if (result)
    result->mDrawable = (PFXDrawablePlacementVendor *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXDrawablePlacement;
  -[PFXDrawablePlacement dealloc](&v3, "dealloc");
}

- (void)mapPlacementModeWithState:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(a3, "drawableReaderForCurrentMediaStateWithStackEntry:", objc_msgSend(v5, "parentHtmlStackEntry"));
  self->mMode = 0;
  v7 = objc_opt_class(PFXGroup);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0
    || (v8 = objc_opt_class(PFXSvg), (objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    || (v9 = objc_opt_class(PFXShapeWithText), (objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    || (v10 = objc_opt_class(PFXAside), (objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    || objc_msgSend(a3, "isInsideWidget"))
  {
    self->mMode = 4;
  }
  else
  {
    v11 = objc_msgSend(v5, "valueForAttribute:", "data-attachment-ref");
    if (v11)
    {
      self->mMode = 3;
      -[PFXDrawablePlacement setAttachmentId:](self, "setAttachmentId:", v11);
    }
    else
    {
      -[PFXDrawablePlacement mapNonChildPlacementModeWithState:](self, "mapNonChildPlacementModeWithState:", a3);
    }
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  __int128 v5;
  _OWORD v7[3];

  -[PFXDrawablePlacement mapPlacementModeWithState:](self, "mapPlacementModeWithState:");
  -[PFXDrawablePlacement setExteriorTextWrap:](self, "setExteriorTextWrap:", +[PFXDrawablePlacement exteriorTextWrapWithCssValue:readerState:](PFXDrawablePlacement, "exteriorTextWrapWithCssValue:readerState:", -[PFXDrawablePlacement wrapPropertyValueWithState:](self, "wrapPropertyValueWithState:", a3), a3));
  -[PFXDrawablePlacement mapBoundsWithState:](self, "mapBoundsWithState:", a3);
  -[PFXDrawablePlacement mapAffineTransformWithState:](self, "mapAffineTransformWithState:", a3);
  if (self->mBounds.size.width * self->mBounds.size.height != 0.0)
  {
    v5 = *(_OWORD *)&self->mAffineTransform.c;
    v7[0] = *(_OWORD *)&self->mAffineTransform.a;
    v7[1] = v5;
    v7[2] = *(_OWORD *)&self->mAffineTransform.tx;
    -[PFXDrawablePlacement setInfoGeometry:](self, "setInfoGeometry:", +[PFXDrawablePlacement affineGeometryWithAffineTransform:appliedToBounds:](PFXDrawablePlacement, "affineGeometryWithAffineTransform:appliedToBounds:", v7, self->mBounds.origin.x, self->mBounds.origin.y));
  }
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  NSArray *v10;
  NSArray *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t j;
  id v24;
  id v25;
  id v26;
  char *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v7 = objc_msgSend(v6, "result");
  v8 = objc_opt_class(NSArray);
  *(_QWORD *)&v9 = TSUDynamicCast(v8, v7).n128_u64[0];
  v11 = v10;
  if (!v10)
  {
    v12 = TSUProtocolCast(&OBJC_PROTOCOL___TSDInfo, v7);
    if (v12)
      v11 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v12);
    else
      v11 = 0;
  }
  if (-[NSArray count](v11, "count", v9))
  {
    v34 = v7;
    v35 = a3;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v17, "setExteriorTextWrap:") & 1) != 0)
            objc_msgSend(v17, "performSelector:withObject:", "setExteriorTextWrap:", self->mExteriorTextWrap);
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v14);
    }
    if ((self->mMode & 0xFFFFFFFE) == 2)
    {
      v18 = -[NSArray lastObject](v11, "lastObject");
      v19 = v35;
      if (-[NSArray count](v11, "count") >= 2)
      {
        v20 = objc_msgSend(objc_alloc((Class)TSDGroupInfo), "initWithContext:geometry:", objc_msgSend(v35, "tspContext"), self->mInfoGeometry);
        v21 = -[NSArray count](v11, "count");
        if (v21)
        {
          v22 = v21;
          for (j = 0; j != v22; ++j)
          {
            v24 = -[NSArray objectAtIndex:](v11, "objectAtIndex:", j);
            if (objc_msgSend(v24, "conformsToProtocol:", &OBJC_PROTOCOL___TSDInfo))
              objc_msgSend(v20, "addChildInfo:", v24);
          }
        }
        objc_msgSend(v20, "ensureGeometryFitsChildren");
        objc_msgSend(v20, "setExteriorTextWrap:", self->mExteriorTextWrap);
        v18 = v20;
        v19 = v35;
      }
      if (self->mMode == 2)
      {
        v25 = objc_msgSend(v6, "storage");
        v26 = objc_msgSend(objc_alloc((Class)TSWPDrawableAttachment), "initWithContext:drawable:", objc_msgSend(v19, "tspContext"), v18);
        objc_msgSend(v26, "setHOffsetType:", 0);
        objc_msgSend(v26, "setHOffset:", 0.0);
        objc_msgSend(v26, "setVOffsetType:", 0);
        objc_msgSend(v26, "setVOffset:", 0.0);
        v27 = (char *)objc_msgSend(v25, "length");
        objc_msgSend(v25, "insertAttachmentOrFootnote:range:", v26, v27, 0);

        objc_msgSend(v25, "setCharacterStyle:range:undoTransaction:", objc_msgSend(objc_msgSend(objc_msgSend(v5, "parentHtmlStackEntry"), "currentEntryMediaState"), "characterStyle"), v27, 1, 0);
        if (!+[PFXBlock isEntryInline:](PFXBlock, "isEntryInline:", v5))
        {
          v28 = objc_msgSend(v19, "readerForCurrentMediaStateWithStackEntry:", objc_msgSend(v5, "parentHtmlStackEntry"));
          v29 = objc_opt_class(PFXBody);
          if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0
            || (v30 = objc_opt_class(PFXTableCell), (objc_opt_isKindOfClass(v28, v30) & 1) != 0))
          {
            if (v27)
              v31 = objc_msgSend(v25, "characterAtIndex:", v27 - 1);
            else
              v31 = &dword_8 + 2;
            if (+[PFXCharacterRun isCharForcesLineBreak:](PFXCharacterRun, "isCharForcesLineBreak:", v31))
            {
              v36 = 0;
              +[PFXParagraphStyle map:stackEntry:](PFXParagraphStyle, "map:stackEntry:", &v36, v5);
              objc_msgSend(v25, "setParagraphStyle:forCharRange:undoTransaction:", v36, v27, 1, 0);
            }
          }
        }
      }
      else
      {
        objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v19, "currentHtmlDocMediaState"), "drawableAttachmentCache"), "objectForKey:", -[PFXDrawablePlacement attachmentId](self, "attachmentId")), "attachDrawable:", v18);
      }
    }
    else
    {
      v19 = v35;
      -[PFXDrawablePlacement mapNonChildResults:withState:](self, "mapNonChildResults:withState:", v11, v35);
    }
    v32 = objc_msgSend(v19, "drawableReaderForCurrentMediaStateWithStackEntry:", objc_msgSend(v5, "parentHtmlStackEntry"));
    v33 = objc_opt_class(PFXWidget);
    if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
      objc_msgSend(v5, "addChildAttributesToParentForResult:", v34);
  }
}

+ (id)exteriorTextWrapWithCssValue:(id)a3 readerState:(id)a4
{
  id v6;
  id v7;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = (id)qword_543780;
  if (!qword_543780)
  {
    v6 = objc_msgSend(objc_alloc((Class)TSDExteriorTextWrap), "initWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:", 0, 0, 2, 0, 0.0, 0.5);
    qword_543780 = (uint64_t)v6;
  }
  if (!qword_543788)
    qword_543788 = (uint64_t)v6;
  if (!objc_msgSend(a3, "count"))
    return (id)qword_543788;
  v7 = +[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", objc_msgSend(a3, "objectAtIndex:", 0));
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("disabled")))
  {
    if (objc_msgSend(a3, "count") != (char *)&dword_4 + 2)
      +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Bad wrap"));
    v9 = +[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", objc_msgSend(a3, "objectAtIndex:", 1));
    v10 = +[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", objc_msgSend(a3, "objectAtIndex:", 2));
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(a3, "objectAtIndex:", 3), a4);
    v12 = v11;
    objc_msgSend(+[PFXStyleUtilities numberStringInPair:](PFXStyleUtilities, "numberStringInPair:", objc_msgSend(a3, "objectAtIndex:", 4)), "doubleValue");
    v14 = v13;
    v15 = +[PFXStyleUtilities BOOLValueInPair:](PFXStyleUtilities, "BOOLValueInPair:", objc_msgSend(a3, "objectAtIndex:", 5));
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("directional")) & 1) != 0)
    {
      v16 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("neither")) & 1) != 0)
    {
      v16 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("largest")) & 1) != 0)
    {
      v16 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("automatic")) & 1) != 0)
    {
      v16 = 4;
    }
    else
    {
      +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Bad wrap type"));
      v16 = 0;
    }
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("rectangular")) & 1) == 0)
    {
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("contour")) & 1) != 0)
      {
        v17 = 1;
        goto LABEL_27;
      }
      +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Bad wrap fit"));
    }
    v17 = 0;
LABEL_27:
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("left")) & 1) == 0)
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("right")) & 1) != 0)
      {
        v18 = 1;
        return +[TSDExteriorTextWrap exteriorTextWrapWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:](TSDExteriorTextWrap, "exteriorTextWrapWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:", v15, v16, v18, v17, v12, v14);
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("both")) & 1) != 0)
      {
        v18 = 2;
        return +[TSDExteriorTextWrap exteriorTextWrapWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:](TSDExteriorTextWrap, "exteriorTextWrapWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:", v15, v16, v18, v17, v12, v14);
      }
      +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Bad wrap direction"));
    }
    v18 = 0;
    return +[TSDExteriorTextWrap exteriorTextWrapWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:](TSDExteriorTextWrap, "exteriorTextWrapWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:", v15, v16, v18, v17, v12, v14);
  }
  if (objc_msgSend(a3, "count") != (char *)&dword_0 + 1)
    +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Bad wrap"));
  return (id)qword_543780;
}

+ (CGRect)boundsWithProperties:(id)a3 readerState:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(a3, "valueForProperty:", "left"), a4);
  v7 = v6;
  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(a3, "valueForProperty:", "top"), a4);
  v9 = v8;
  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(a3, "valueForProperty:", "width"), a4);
  v11 = v10;
  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(a3, "valueForProperty:", "height"), a4);
  v13 = v12;
  v14 = v7;
  v15 = v9;
  v16 = v11;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (CGRect)boundsWithStackEntry:(id)a3 readerState:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  objc_msgSend(objc_msgSend(a3, "valueForAttribute:", "x", a4), "doubleValue");
  v6 = v5;
  objc_msgSend(objc_msgSend(a3, "valueForAttribute:", "y"), "doubleValue");
  v8 = v7;
  objc_msgSend(objc_msgSend(a3, "valueForAttribute:", "width"), "doubleValue");
  v10 = v9;
  objc_msgSend(objc_msgSend(a3, "valueForAttribute:", "height"), "doubleValue");
  v12 = v11;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (id)affineGeometryWithAffineTransform:(CGAffineTransform *)a3 appliedToBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  __int128 v9;
  id v10;
  TSDBezierPath *v11;
  __int128 v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double MidX;
  double MidY;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _OWORD v32[3];
  _OWORD v33[3];
  CGRect v34;
  CGRect v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = *(_OWORD *)&a3->c;
  v33[0] = *(_OWORD *)&a3->a;
  v33[1] = v9;
  v33[2] = *(_OWORD *)&a3->tx;
  v10 = objc_msgSend(+[TSDInfoGeometry geometryFromFullTransform:](TSDInfoGeometry, "geometryFromFullTransform:", v33), "mutableCopy");
  v11 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", x, y, width, height);
  v12 = *(_OWORD *)&a3->c;
  v32[0] = *(_OWORD *)&a3->a;
  v32[1] = v12;
  v32[2] = *(_OWORD *)&a3->tx;
  -[TSDBezierPath transformUsingAffineTransform:](v11, "transformUsingAffineTransform:", v32);
  -[TSDBezierPath bounds](v11, "bounds");
  v13 = v34.origin.x;
  v14 = v34.origin.y;
  v15 = v34.size.width;
  v16 = v34.size.height;
  MidX = CGRectGetMidX(v34);
  v35.origin.x = v13;
  v35.origin.y = v14;
  v35.size.width = v15;
  v35.size.height = v16;
  MidY = CGRectGetMidY(v35);
  b = a3->b;
  c = a3->c;
  d = a3->d;
  tx = a3->tx;
  ty = a3->ty;
  v24 = tx + c * 0.0 + a3->a * 0.0;
  v25 = ty + d * 0.0 + b * 0.0;
  v26 = tx + c * 0.0 + a3->a * width;
  v27 = ty + d * 0.0 + b * width;
  v28 = tx + height * c + a3->a * 0.0;
  v29 = ty + height * d + b * 0.0;
  v30 = hypot(v26 - v24, v27 - v25);
  objc_msgSend(v10, "setSize:", v30, (double)hypot(v28 - v24, v29 - v25));
  objc_msgSend(v10, "setCenter:", MidX, MidY);
  return v10;
}

- (int)mode
{
  return self->mMode;
}

- (void)setMode:(int)a3
{
  self->mMode = a3;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBounds.origin.x;
  y = self->mBounds.origin.y;
  width = self->mBounds.size.width;
  height = self->mBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->mBounds = a3;
}

- (CGAffineTransform)affineTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setAffineTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mAffineTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mAffineTransform.c = v4;
  *(_OWORD *)&self->mAffineTransform.a = v3;
}

- (TSDInfoGeometry)infoGeometry
{
  return self->mInfoGeometry;
}

- (void)setInfoGeometry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (TSDExteriorTextWrap)exteriorTextWrap
{
  return self->mExteriorTextWrap;
}

- (void)setExteriorTextWrap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSString)attachmentId
{
  return self->_attachmentId;
}

- (void)setAttachmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)wrapPropertyValueWithState:(id)a3
{
  id v3;

  v3 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "propertySet");
  return objc_msgSend(v3, "valueForProperty:", PFXPropNmApplePubBoxWrapExteriorPath[0]);
}

- (void)mapBoundsWithState:(id)a3
{
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGRect v14;
  CGRect v15;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v14.origin.x = CGRectZero.origin.x;
  v14.origin.y = CGRectZero.origin.y;
  v14.size.width = CGRectZero.size.width;
  v14.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(self->mBounds, v14))
  {
    +[PFXDrawablePlacement boundsWithProperties:readerState:](PFXDrawablePlacement, "boundsWithProperties:readerState:", objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "propertySet"), a3);
    self->mBounds.origin.x = x;
    self->mBounds.origin.y = y;
    self->mBounds.size.width = width;
    self->mBounds.size.height = height;
  }
  else
  {
    x = self->mBounds.origin.x;
    y = self->mBounds.origin.y;
    width = self->mBounds.size.width;
    height = self->mBounds.size.height;
  }
  v15.origin.x = CGRectZero.origin.x;
  v15.origin.y = CGRectZero.origin.y;
  v15.size.width = CGRectZero.size.width;
  v15.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(*(CGRect *)&x, v15))
  {
    +[PFXDrawablePlacement boundsWithStackEntry:readerState:](PFXDrawablePlacement, "boundsWithStackEntry:readerState:", v5, a3);
    self->mBounds.origin.x = v10;
    self->mBounds.origin.y = v11;
    self->mBounds.size.width = v12;
    self->mBounds.size.height = v13;
  }
}

- (void)mapAffineTransformWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  CGAffineTransform *p_mAffineTransform;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  __int128 v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  CGFloat v28;
  CGFloat v29;
  __int128 v30;
  __int128 v31;
  id v32;
  CGAffineTransform *v33;
  CGAffineTransform *v34;
  __int128 v35;
  _OWORD v36[3];
  _OWORD v37[3];
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform t2;
  CGAffineTransform t1;
  double v44;
  double v45;
  double v46;
  double v47;
  CGAffineTransform v48;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "propertySet");
  v7 = objc_msgSend(v5, "parentHtmlStackEntry");
  v8 = objc_msgSend(a3, "drawableReaderForCurrentMediaStateWithStackEntry:", v7);
  p_mAffineTransform = &self->mAffineTransform;
  v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&self->mAffineTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&self->mAffineTransform.c = v10;
  *(_OWORD *)&self->mAffineTransform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (objc_msgSend(a3, "ancestorEntryWithElementName:", "svg"))
    PFXAffineTransformWithSvgTransform((const char *)objc_msgSend(v5, "xmlValueForAttribute:", "transform"), &v48);
  else
    PFXAffineTransformWithCssTransformValue((NSArray *)objc_msgSend(v6, "valueForProperty:", "transform"), self->mBounds, (PFXHtmlReaderState *)a3, (uint64_t)&v48);
  v11 = *(_OWORD *)&v48.c;
  *(_OWORD *)&p_mAffineTransform->a = *(_OWORD *)&v48.a;
  *(_OWORD *)&self->mAffineTransform.c = v11;
  *(_OWORD *)&self->mAffineTransform.tx = *(_OWORD *)&v48.tx;
  v12 = objc_opt_class(PFXSvg);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) == 0)
  {
    v26 = objc_opt_class(PFXShapeWithText);
    if ((objc_opt_isKindOfClass(v8, v26) & 1) == 0)
      return;
    objc_msgSend(objc_msgSend(v8, "placement"), "bounds");
    v27 = *(_OWORD *)&self->mAffineTransform.c;
    *(_OWORD *)&v39.a = *(_OWORD *)&p_mAffineTransform->a;
    *(_OWORD *)&v39.c = v27;
    *(_OWORD *)&v39.tx = *(_OWORD *)&self->mAffineTransform.tx;
    CGAffineTransformMakeTranslation(&v38, v28, v29);
    CGAffineTransformConcat(&v48, &v39, &v38);
    v30 = *(_OWORD *)&v48.c;
    *(_OWORD *)&p_mAffineTransform->a = *(_OWORD *)&v48.a;
    *(_OWORD *)&self->mAffineTransform.c = v30;
    *(_OWORD *)&self->mAffineTransform.tx = *(_OWORD *)&v48.tx;
    v31 = *(_OWORD *)&self->mAffineTransform.c;
    v37[0] = *(_OWORD *)&p_mAffineTransform->a;
    v37[1] = v31;
    v37[2] = *(_OWORD *)&self->mAffineTransform.tx;
    v32 = objc_msgSend(v8, "placement");
    if (v32)
      objc_msgSend(v32, "affineTransform");
    else
      memset(v36, 0, sizeof(v36));
    v33 = (CGAffineTransform *)v37;
    v34 = (CGAffineTransform *)v36;
    goto LABEL_16;
  }
  v13 = objc_msgSend(v7, "valueForAttribute:", "viewBox");
  if (objc_msgSend(v13, "length"))
  {
    v46 = 0.0;
    v47 = 0.0;
    v44 = 0.0;
    v45 = 0.0;
    if (sscanf((const char *)objc_msgSend(v13, "UTF8String"), "%lg %lg %lg %lg", &v47, &v46, &v45, &v44) == 4)
    {
      v15 = v46;
      v14 = v47;
      v17 = v44;
      v16 = v45;
      v18 = *(_OWORD *)&self->mAffineTransform.c;
      *(_OWORD *)&t1.a = *(_OWORD *)&p_mAffineTransform->a;
      *(_OWORD *)&t1.c = v18;
      *(_OWORD *)&t1.tx = *(_OWORD *)&self->mAffineTransform.tx;
      objc_msgSend(objc_msgSend(v8, "placement"), "bounds");
      mapSrcRectOntoDstRect((uint64_t)&t2, v14, v15, v16, v17, v19, v20, v21, v22);
      CGAffineTransformConcat(&v48, &t1, &t2);
      v23 = *(_OWORD *)&v48.c;
      *(_OWORD *)&p_mAffineTransform->a = *(_OWORD *)&v48.a;
      *(_OWORD *)&self->mAffineTransform.c = v23;
      *(_OWORD *)&self->mAffineTransform.tx = *(_OWORD *)&v48.tx;
      v24 = *(_OWORD *)&self->mAffineTransform.c;
      *(_OWORD *)&v41.a = *(_OWORD *)&p_mAffineTransform->a;
      *(_OWORD *)&v41.c = v24;
      *(_OWORD *)&v41.tx = *(_OWORD *)&self->mAffineTransform.tx;
      v25 = objc_msgSend(v8, "placement");
      if (v25)
        objc_msgSend(v25, "affineTransform");
      else
        memset(&v40, 0, sizeof(v40));
      v33 = &v41;
      v34 = &v40;
LABEL_16:
      CGAffineTransformConcat(&v48, v33, v34);
      v35 = *(_OWORD *)&v48.c;
      *(_OWORD *)&p_mAffineTransform->a = *(_OWORD *)&v48.a;
      *(_OWORD *)&self->mAffineTransform.c = v35;
      *(_OWORD *)&self->mAffineTransform.tx = *(_OWORD *)&v48.tx;
    }
  }
}

@end
