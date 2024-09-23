@implementation TUIWPLayout

- (TUIWPLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  TUIWPLayout *v5;
  TUIWPLayout *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUIWPLayout;
  v5 = -[TUILayout initWithModel:parent:controller:](&v12, "initWithModel:parent:controller:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[TUILayout specifiedWidth](v5, "specifiedWidth");
    if ((v7 & 0x6000000000000) == 0x2000000000000)
      -[TUILayout setSpecifiedWidthComputeInherited:](v6, "setSpecifiedWidthComputeInherited:", 1);
    v6->_scale = 1.0;
    v6->_cachedSingleLineTypographicMax = NAN;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v6, "box"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "paragraphStyleAtParIndex:effectiveRange:", 0, 0));

    v6->_flags.isFirstParagraphCentered = objc_msgSend(v10, "intValueForProperty:", 86) == 2;
  }
  return v6;
}

- (TUIWPStorage)storage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storage"));

  return (TUIWPStorage *)v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  double width;
  unsigned int v5;
  uint64_t v7;

  -[TUIWPLayout _computeIntrinsicContentSize](self, "_computeIntrinsicContentSize");
  width = self->_intrinsicContentSize.width;
  if (width <= -3.40282347e38)
  {
    v7 = 4286578687;
  }
  else
  {
    if (width < 3.40282347e38)
    {
      *(float *)&v5 = width;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | 0x7FC0000000000000);
    }
    v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  double height;
  unsigned int v5;
  uint64_t v7;

  -[TUIWPLayout _computeIntrinsicContentSize](self, "_computeIntrinsicContentSize");
  height = self->_intrinsicContentSize.height;
  if (height <= -3.40282347e38)
  {
    v7 = 4286578687;
  }
  else
  {
    if (height < 3.40282347e38)
    {
      *(float *)&v5 = height;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | 0x7FC0000000000000);
    }
    v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (void)_wpText:(id)a3 scaleFactorDidChange:(double)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  self->_scale = a4;
  -[TUILayout notifyChildrenScaleDidChange](self, "notifyChildrenScaleDidChange", a3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "validateLayout");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (double)computedScale
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIWPLayout;
  -[TUILayout computedScale](&v5, "computedScale");
  return v3 * self->_scale;
}

- (void)computeLayout
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  __int128 v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *wpColumns;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  char *v27;
  id v28;
  uint64_t v29;
  CGFloat MaxX;
  uint64_t v31;
  void *v32;
  char *v33;
  id v34;
  uint64_t v35;
  char *v36;
  int v37;
  void *v38;
  void *v39;
  NSArray *v40;
  NSArray *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  void *v61;
  unsigned int v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  _OWORD v75[2];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  CGRect v81;

  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v77 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i);
        -[TUILayout containingWidth](self, "containingWidth");
        objc_msgSend(v8, "setContainingWidth:");
        -[TUILayout containingHeight](self, "containingHeight");
        objc_msgSend(v8, "setContainingHeight:");
        objc_msgSend(v8, "validateLayout");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    }
    while (v5);
  }

  self->_scale = 1.0;
  v9 = -[TUIWPLayout _newWPTextForIntrinsic:](self, "_newWPTextForIntrinsic:", 0);
  -[TUILayout computeWidth](self, "computeWidth");
  v11 = fmax(v10, 1.0);
  -[TUIWPLayout _maxHeight](self, "_maxHeight");
  v13 = v12;
  if (v12 == 1.79769313e308)
    v14 = 4294967300.0;
  else
    v14 = v12;
  if (v12 != 1.79769313e308)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPLayout storage](self, "storage"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", v15, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 4099, CGSizeZero.width, CGSizeZero.height, v11, 4294967300.0, CGPointZero.x, CGPointZero.y));

    v17 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    v75[0] = *(_OWORD *)&UIEdgeInsetsZero.top;
    v75[1] = v17;
    -[TUIWPLayout _layoutSizeForColumns:withInsets:](self, "_layoutSizeForColumns:withInsets:", v16, v75);
    v14 = v14 - fmin(*(double *)v75, 0.0);

  }
  if (!self->_wpColumns || v13 != 1.79769313e308 || self->_cachedSingleLineTypographicMax >= v11)
  {
    v18 = objc_autoreleasePoolPush();
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPLayout storage](self, "storage"));
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", v19, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 4099, CGSizeZero.width, CGSizeZero.height, v11, v14, CGPointZero.x, CGPointZero.y));
    wpColumns = self->_wpColumns;
    self->_wpColumns = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_wpColumns, "lastObject"));
    v23 = (char *)objc_msgSend(v22, "logicalLineCount");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "instantiateContext"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "environment"));
    v27 = (char *)objc_msgSend(v26, "layoutDirection");

    if (v23 == (_BYTE *)&dword_0 + 1)
    {
      v28 = objc_msgSend(v22, "lineFragmentRangeForLogicalLineIndex:", 0);
      MaxX = NAN;
      if (v29 && v28 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v31 = (uint64_t)v28 + v29 - 1;
        if ((objc_msgSend(v22, "isTruncatedLineFragmentAtIndex:", v31, NAN) & 1) != 0)
        {
          MaxX = NAN;
        }
        else
        {
          MaxX = NAN;
          if (!self->_flags.isFirstParagraphCentered && v27 != (_BYTE *)&dword_0 + 2)
          {
            objc_msgSend(v22, "typographicBoundsOfLineFragmentAtIndex:", v31, NAN);
            MaxX = CGRectGetMaxX(v81);
            if (v11 < MaxX)
              MaxX = NAN;
          }
        }
      }
    }
    else
    {
      MaxX = NAN;
    }
    self->_cachedSingleLineTypographicMax = MaxX;

    objc_autoreleasePoolPop(v18);
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPLayout _columnStyle](self, "_columnStyle"));
  v33 = (char *)objc_msgSend(v32, "columnCount");

  v34 = objc_msgSend(v9, "maxLineCount");
  v35 = (uint64_t)v34;
  if (v34 >= 2)
  {
    v36 = v33 - 1;
    if (-[TUIWPLayout _isTruncatedLine:column:](self, "_isTruncatedLine:column:", ((_DWORD)v34 - 1), v36))
    {
      v35 = v35;
      while (1)
      {
        v37 = v35 - 1;
        if (!-[TUIWPLayout _isEmptyLine:column:](self, "_isEmptyLine:column:", (v35 - 1), v36)
          && !-[TUIWPLayout _isWhitespaceLine:column:](self, "_isWhitespaceLine:column:", (v35 - 1), v36))
        {
          break;
        }
        --v35;
        if ((v37 & 0xFFFFFFFE) == 0)
        {
          v35 = 1;
          break;
        }
      }
    }
  }
  if ((_DWORD)v35 != objc_msgSend(v9, "maxLineCount"))
  {
    objc_msgSend(v9, "setMaxLineCount:", v35);
    v38 = objc_autoreleasePoolPush();
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPLayout storage](self, "storage"));
    v40 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", v39, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 4099, CGSizeZero.width, CGSizeZero.height, v11, v14, CGPointZero.x, CGPointZero.y));
    v41 = self->_wpColumns;
    self->_wpColumns = v40;

    self->_cachedSingleLineTypographicMax = NAN;
    objc_autoreleasePoolPop(v38);
  }
  -[TUIWPLayout _layoutSizeForColumns:withInsets:](self, "_layoutSizeForColumns:withInsets:", self->_wpColumns, &self->_layoutFrameInsets);
  v43 = v42;
  -[TUIWPLayout _topAligmentOffsetForColumns:](self, "_topAligmentOffsetForColumns:", self->_wpColumns);
  v45 = v44;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_wpColumns, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v46, "erasableBounds:", 0);
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;

  v55 = v50 - v45;
  v56 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->_renderingInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->_renderingInsets.bottom = v56;
  self->_renderingInsets.top = fmin(v50 - v45, 0.0);
  v57 = v48;
  *(_QWORD *)&v56 = v52;
  v58 = v54;
  self->_renderingInsets.bottom = fmin(v43 - CGRectGetMaxY(*(CGRect *)(&v55 - 1)), 0.0);
  LODWORD(v59) = -[TUILayout specifiedHeight](self, "specifiedHeight");
  self->_renderingInsets.bottom = fmin(self->_renderingInsets.bottom- (v43- COERCE_FLOAT(-[TUILayout specifiedHeight](self, "specifiedHeight", v59))), 0.0);
  v60 = COERCE_FLOAT(-[TUILayout specifiedHeight](self, "specifiedHeight"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v62 = objc_msgSend(v61, "allowHangingPunctuation");

  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPLayout storage](self, "storage"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "fontMetricsAtCharacterIndex:", 0));

    objc_msgSend(v64, "pointSize");
    self->_renderingInsets.left = -v65;
    objc_msgSend(v64, "pointSize");
    self->_renderingInsets.right = -v66;

  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_wpColumns, "objectAtIndexedSubscript:", 0));
  v68 = (char *)objc_msgSend(v67, "logicalLineCount");
  v69 = 0x7FFFFFFFFFFFFFFFLL;
  if (v68)
  {
    v70 = (uint64_t)objc_msgSend(v67, "lineFragmentRangeForLogicalLineIndex:", v68 - 1);
  }
  else
  {
    v71 = 0;
    v70 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v70 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v71)
    {
      v72 = v71 + v70 - 1;
      if (v71 + v70 != 0x8000000000000000)
      {
        v69 = (uint64_t)objc_msgSend(v67, "truncatedCharIndexForLineFragmentAtIndex:", v72);
        if (v69 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v73 = objc_msgSend(v67, "rangeOfLineFragmentAtIndex:", v72);
          if (v73 == (id)0x7FFFFFFFFFFFFFFFLL)
            v69 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v69 = (uint64_t)v73 + v74;
        }
      }
    }
  }
  objc_msgSend(v9, "positionAttachmentLayoutsWithOffset:truncatedCharIndex:", v69, 0.0, -v45);
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v11, v60);

}

- (BOOL)shouldAppendChildRenderModels
{
  return 1;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5;
  double v6;
  double v7;
  int8x16_t v8;
  int8x16_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _TUIWPDraw *v18;
  NSArray *wpColumns;
  void *v20;
  void *v21;
  _TUIWPDraw *v22;
  TUIRenderModelDraw *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;

  v5 = a4;
  objc_msgSend(v5, "contentsScale");
  v7 = v6;
  v8.i64[0] = *(_QWORD *)&self->_renderingInsets.top;
  v10 = TUIInsetsExtendedForScale(v8, self->_renderingInsets.left, self->_renderingInsets.bottom, self->_renderingInsets.right, v7, v9);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = TUIFloatRoundedForScale(v10 - self->_layoutFrameInsets.top, v7);
  v18 = [_TUIWPDraw alloc];
  wpColumns = self->_wpColumns;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "blendMode"));
  v22 = -[_TUIWPDraw initWithColumns:yOffset:compositingFilterType:](v18, "initWithColumns:yOffset:compositingFilterType:", wpColumns, v21, v17);

  v23 = -[TUIRenderModelDraw initWithDraw:erasableInsets:]([TUIRenderModelDraw alloc], "initWithDraw:erasableInsets:", v22, v10, v12, v14, v16);
  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v5);
  v25 = v24;
  v27 = v26;

  -[TUIRenderModelDraw setSize:](v23, "setSize:", v25, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
  -[TUIRenderModelDraw setIdentifier:](v23, "setIdentifier:", v29);

  return v23;
}

- (CGRect)computedErasableBoundsPrimitive
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect result;

  v13.receiver = self;
  v13.super_class = (Class)TUIWPLayout;
  -[TUILayout computedErasableBoundsPrimitive](&v13, "computedErasableBoundsPrimitive");
  top = self->_renderingInsets.top;
  left = self->_renderingInsets.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_renderingInsets.right);
  v12 = v11 - (top + self->_renderingInsets.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (id)_newWPTextForIntrinsic:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  _TUIWPText *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  double v17;
  objc_super v19;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPLayout _columnStyle](self, "_columnStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instantiateContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "environment"));
  v9 = objc_msgSend(v8, "layoutDirection") == (char *)&dword_0 + 2;

  v10 = -[_TUIWPText initWithParagraphStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:]([_TUIWPText alloc], "initWithParagraphStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:", 0, v5, v9, v9);
  -[_TUIWPText setComputingIntrinsic:](v10, "setComputingIntrinsic:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  -[_TUIWPText updateWithAttachmentLayouts:](v10, "updateWithAttachmentLayouts:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  -[_TUIWPText setMaxLineCount:](v10, "setMaxLineCount:", objc_msgSend(v12, "maxLines"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  -[_TUIWPText setAllowsLastLineTruncation:](v10, "setAllowsLastLineTruncation:", objc_msgSend(v13, "hideEllipses") ^ 1);

  -[TUIWPLayout expandableMoreWidth](self, "expandableMoreWidth");
  -[_TUIWPText setReservedWidthWhenTruncating:](v10, "setReservedWidthWhenTruncating:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  -[_TUIWPText setUseShrinkToFit:](v10, "setUseShrinkToFit:", objc_msgSend(v14, "allowShrinkToFit"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v16 = objc_msgSend(v15, "allowShrinkToFit");
  v17 = 1.0;
  if ((v16 & 1) == 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)TUIWPLayout;
    -[TUILayout computedScale](&v19, "computedScale", 1.0);
  }
  -[_TUIWPText setTextScaleFactor:](v10, "setTextScaleFactor:", v17);

  -[_TUIWPText setLayout:](v10, "setLayout:", self);
  return v10;
}

- (id)_columnStyle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_msgSend(objc_alloc((Class)TSWPColumns), "initWithEqualColumnCount:gapFraction:", 1, 0.0500000007);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSSPropertyMap propertyMapWithPropertiesAndValues:](TSSPropertyMap, "propertyMapWithPropertiesAndValues:", 148, v3, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPLayout storage](self, "storage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stylesheet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPLayout storage](self, "storage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stylesheet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultColumnStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "variationOfStyle:propertyMap:", v9, v4));

  return v10;
}

- (double)_maxHeight
{
  double result;

  -[TUILayout specifiedHeight](self, "specifiedHeight");
  -[TUILayout flexedHeight](self, "flexedHeight");
  -[TUILayout flexedHeight](self, "flexedHeight");
  return result;
}

- (double)_topAligmentOffsetForColumns:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "firstObject"));
  if (objc_msgSend(v3, "logicalLineCount"))
  {
    objc_msgSend(v3, "topOfCapForLogicalLineIndex:", 0);
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)_bottomBaselineForColumns:(id)a3
{
  void *v3;
  char *v4;
  double v5;
  char *v6;
  uint64_t v7;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "firstObject"));
  v4 = (char *)objc_msgSend(v3, "logicalLineCount");
  v5 = 0.0;
  if (v4)
  {
    v6 = (char *)objc_msgSend(v3, "lineFragmentRangeForLogicalLineIndex:", v4 - 1);
    if (v6 != (char *)0x7FFFFFFFFFFFFFFFLL && v7 != 0)
    {
      objc_msgSend(v3, "baselineOfLineFragmentAtIndex:", &v6[v7 - 1]);
      v5 = v9;
    }
  }

  return v5;
}

- (CGSize)_contentSizeForColumns:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGSize result;
  CGRect v21;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  objc_msgSend(v4, "frameBounds");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
  objc_msgSend(v9, "frameBounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v21.origin.x = v11;
  v21.origin.y = v13;
  v21.size.width = v15;
  v21.size.height = v17;
  v18 = CGRectGetMaxX(v21) - v6;
  v19 = v8;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)_layoutSizeForColumns:(id)a3 withInsets:(UIEdgeInsets *)a4
{
  id v6;
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
  double v17;
  double v18;
  CGSize result;

  v6 = a3;
  -[TUIWPLayout _topAligmentOffsetForColumns:](self, "_topAligmentOffsetForColumns:", v6);
  v8 = v7;
  -[TUIWPLayout _bottomBaselineForColumns:](self, "_bottomBaselineForColumns:", v6);
  v10 = v9;
  -[TUIWPLayout _contentSizeForColumns:](self, "_contentSizeForColumns:", v6);
  v12 = v11;
  v14 = v13;

  v15 = fmin(-v8, 0.0);
  v16 = fmin(v10 - v14, 0.0);
  if (a4)
  {
    a4->top = v15;
    a4->left = 0.0;
    a4->bottom = v16;
    a4->right = 0.0;
  }
  v17 = v15 + v14 + v16;
  v18 = v12;
  result.height = v17;
  result.width = v18;
  return result;
}

- (void)_computeIntrinsicContentSize
{
  CGSize *p_intrinsicContentSize;
  double height;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  id v10;

  p_intrinsicContentSize = &self->_intrinsicContentSize;
  height = CGSizeZero.height;
  if (self->_intrinsicContentSize.width == CGSizeZero.width && self->_intrinsicContentSize.height == height)
  {
    v10 = -[TUIWPLayout _newWPTextForIntrinsic:](self, "_newWPTextForIntrinsic:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPLayout storage](self, "storage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", v6, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 4111, CGSizeZero.width, height, 4294967300.0, 4294967300.0, CGPointZero.x, CGPointZero.y));

    -[TUIWPLayout _layoutSizeForColumns:withInsets:](self, "_layoutSizeForColumns:withInsets:", v7, 0);
    p_intrinsicContentSize->width = v8;
    p_intrinsicContentSize->height = v9;

  }
}

- (BOOL)_isTruncatedLine:(unint64_t)a3 column:(unint64_t)a4
{
  void *v7;
  char *v8;
  uint64_t v9;
  unsigned __int8 v11;

  if (-[NSArray count](self->_wpColumns, "count") <= a4)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_wpColumns, "objectAtIndexedSubscript:", a4));
  v8 = (char *)objc_msgSend(v7, "lineFragmentRangeForLogicalLineIndex:", a3);
  if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL || v9 == 0)
    v11 = 0;
  else
    v11 = objc_msgSend(v7, "isTruncatedLineFragmentAtIndex:", &v8[v9 - 1]);

  return v11;
}

- (BOOL)_isEmptyLine:(unint64_t)a3 column:(unint64_t)a4
{
  void *v7;
  char *v8;
  uint64_t v9;
  unsigned __int8 v11;

  if (-[NSArray count](self->_wpColumns, "count") <= a4)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_wpColumns, "objectAtIndexedSubscript:", a4));
  v8 = (char *)objc_msgSend(v7, "lineFragmentRangeForLogicalLineIndex:", a3);
  if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL || v9 == 0)
    v11 = 0;
  else
    v11 = objc_msgSend(v7, "isEmptyLineFragmentAtIndex:", &v8[v9 - 1]);

  return v11;
}

- (BOOL)_isWhitespaceLine:(unint64_t)a3 column:(unint64_t)a4
{
  void *v7;
  char *v8;
  unint64_t v9;
  BOOL v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  BOOL v23;

  if (-[NSArray count](self->_wpColumns, "count") <= a4)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_wpColumns, "objectAtIndexedSubscript:", a4));
  v8 = (char *)objc_msgSend(v7, "lineFragmentRangeForLogicalLineIndex:", a3);
  if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL || v9 == 0)
  {
    v11 = 0;
  }
  else
  {
    v12 = v8;
    v13 = v9;
    v14 = 1;
    do
    {
      v15 = objc_msgSend(v7, "rangeOfLineFragmentAtIndex:", &v12[v14 - 1]);
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPLayout storage](self, "storage"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "substringWithRange:", v15, v17));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v20));

      v22 = objc_msgSend(v21, "length");
      v11 = v22 == 0;

      if (v22)
        v23 = 1;
      else
        v23 = v14 >= v13;
      ++v14;
    }
    while (!v23);
  }

  return v11;
}

- (void)onComputedScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIWPLayout;
  -[TUILayout onComputedScaleDidChange](&v3, "onComputedScaleDidChange");
  -[TUILayout invalidateLayout](self, "invalidateLayout");
  -[TUILayout invalidateIntrinsicSize](self, "invalidateIntrinsicSize");
}

- (void)onInvalidateIntrinsicSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIWPLayout;
  -[TUILayout onInvalidateIntrinsicSize](&v3, "onInvalidateIntrinsicSize");
  self->_intrinsicContentSize = CGSizeZero;
}

- (id)computedBoundsChildrenWithFlags:(unint64_t)a3
{
  return 0;
}

- (double)expandableMoreXOffset
{
  double MaxX;
  void *v4;
  id v5;
  void *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double MinX;
  double v17;

  MaxX = 0.0;
  if (-[NSArray count](self->_wpColumns, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_wpColumns, "objectAtIndexedSubscript:", 0));
    v5 = objc_msgSend(v4, "countLines");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_wpColumns, "objectAtIndexedSubscript:", (char *)-[NSArray count](self->_wpColumns, "count") - 1));
      if (objc_msgSend(v6, "countLines"))
      {
        v7 = (char *)objc_msgSend(v6, "countLines") - 1;
        v8 = (char *)objc_msgSend(v6, "rangeOfLineFragmentAtIndex:", v7);
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPLayout storage](self, "storage"));
        LODWORD(v8) = objc_msgSend(v11, "writingDirectionForParagraphAtCharIndex:", &v8[v10]);

        objc_msgSend(v6, "typographicBoundsOfLineFragmentAtIndex:", v7);
        if ((_DWORD)v8 == 1)
        {
          MinX = CGRectGetMinX(*(CGRect *)&v12);
          -[TUIWPLayout expandableMoreWidth](self, "expandableMoreWidth");
          MaxX = MinX - v17;
        }
        else
        {
          MaxX = CGRectGetMaxX(*(CGRect *)&v12);
        }
      }

    }
  }
  return MaxX;
}

- (BOOL)expandableContentIsTruncated
{
  TUIWPLayout *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_wpColumns, "lastObject"));
  LOBYTE(v2) = -[TUIWPLayout _isTruncatedLine:column:](v2, "_isTruncatedLine:column:", (char *)objc_msgSend(v3, "countLines") - 1, (char *)-[NSArray count](v2->_wpColumns, "count") - 1);

  return (char)v2;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  id v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUIWPLayout;
  v3 = -[TUILayout description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (char *)objc_msgSend(v5, "length") - 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "string"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" string='%@'>"), v8));
  objc_msgSend(v5, "replaceCharactersInRange:withString:", v6, 1, v9);

  return (NSString *)v5;
}

- (id)debugContentDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "string"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@'"), v4));

  return v5;
}

- (double)expandableMoreWidth
{
  return self->_expandableMoreWidth;
}

- (void)setExpandableMoreWidth:(double)a3
{
  self->_expandableMoreWidth = a3;
}

- (NSArray)wpColumns
{
  return self->_wpColumns;
}

- (void)setWpColumns:(id)a3
{
  objc_storeStrong((id *)&self->_wpColumns, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wpColumns, 0);
}

@end
