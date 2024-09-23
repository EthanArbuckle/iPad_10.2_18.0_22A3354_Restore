@implementation TSWPShapeInfo

+ (void)setDefaultInstructionalText:(id)a3
{

  TSWPDefaultInstructionalText = (uint64_t)a3;
}

- (BOOL)isTextUserEditable
{
  return self->_textUserEditable;
}

- (void)setTextUserEditable:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->_textUserEditable = a3;
}

- (void)setContainedStorage:(id)a3
{
  void *v5;
  uint64_t v6;
  id v7;

  if (self->_containedStorage != a3)
  {
    if (!a3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeInfo setContainedStorage:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeInfo.mm"), 178, CFSTR("invalid nil value for '%s'"), "inStorage");
    }
    -[TSPObject willModify](self, "willModify");
    -[TSWPStorage clearBackPointerToParentInfoIfNeeded:](self->_containedStorage, "clearBackPointerToParentInfoIfNeeded:", self);
    v7 = a3;

    self->_containedStorage = (TSWPStorage *)a3;
    objc_msgSend(a3, "setParentInfo:", self);
  }
}

- (BOOL)supportsTextInset
{
  return 1;
}

- (BOOL)supportsShrinkTextToFit
{
  return 1;
}

- (BOOL)allowsLastLineTruncation
{
  return objc_msgSend(-[TSDShapeInfo style](self, "style"), "intValueForProperty:", 154) != 0;
}

- (void)setAllowsLastLineTruncation:(BOOL)a3
{
  -[TSDStyledInfo setBoxedValue:forProperty:](self, "setBoxedValue:forProperty:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), 154);
}

- (unsigned)maxLineCount
{
  unsigned int result;

  result = objc_msgSend(-[TSDShapeInfo style](self, "style"), "definesProperty:", 155);
  if (result)
    return objc_msgSend(-[TSDShapeInfo style](self, "style"), "intValueForProperty:", 155);
  return result;
}

- (void)setMaxLineCount:(unsigned int)a3
{
  -[TSDStyledInfo setBoxedValue:forProperty:](self, "setBoxedValue:forProperty:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3), 155);
}

- (BOOL)shrinkTextToFit
{
  return objc_msgSend(-[TSDShapeInfo style](self, "style"), "intValueForProperty:", 152) != 0;
}

- (void)setShrinkTextToFit:(BOOL)a3
{
  -[TSDStyledInfo setBoxedValue:forProperty:](self, "setBoxedValue:forProperty:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), 152);
}

- (BOOL)textIsVertical
{
  return objc_msgSend(-[TSDShapeInfo style](self, "style"), "intValueForProperty:", 153) != 0;
}

- (void)setTextIsVertical:(BOOL)a3
{
  -[TSDStyledInfo setBoxedValue:forProperty:](self, "setBoxedValue:forProperty:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), 153);
}

- (unsigned)verticalAlignment
{
  return objc_msgSend(-[TSDShapeInfo style](self, "style"), "intValueForProperty:", 149);
}

- (void)setVerticalAlignment:(unsigned int)a3
{
  -[TSDStyledInfo setBoxedValue:forProperty:](self, "setBoxedValue:forProperty:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3), 149);
}

- (TSWPColumns)columns
{
  return (TSWPColumns *)objc_msgSend(-[TSDShapeInfo style](self, "style"), "valueForProperty:", 148);
}

- (void)setColumns:(id)a3
{
  -[TSDStyledInfo setBoxedValue:forProperty:](self, "setBoxedValue:forProperty:", a3, 148);
}

- (TSWPPadding)padding
{
  return (TSWPPadding *)objc_msgSend(-[TSDShapeInfo style](self, "style"), "valueForProperty:", 146);
}

- (void)setPadding:(id)a3
{
  -[TSDStyledInfo setBoxedValue:forProperty:](self, "setBoxedValue:forProperty:", a3, 146);
}

- (TSWPShapeStyle)tswpShapeStyle
{
  objc_opt_class();
  -[TSDShapeInfo style](self, "style");
  return (TSWPShapeStyle *)TSUDynamicCast();
}

- (void)setContentWritingDirection:(int64_t)a3
{
  TSWPStorage *containedStorage;
  uint64_t v5;
  uint64_t v6;

  containedStorage = self->_containedStorage;
  v5 = -[TSWPStorage range](containedStorage, "range");
  -[TSWPStorage setParagraphWritingDirection:forCharRange:undoTransaction:](containedStorage, "setParagraphWritingDirection:forCharRange:undoTransaction:", a3, v5, v6, 0);
}

- (int64_t)contentWritingDirection
{
  return -[TSWPStorage writingDirectionForParagraphAtParIndex:](self->_containedStorage, "writingDirectionForParagraphAtParIndex:", 0);
}

- (Class)editorClass
{
  return 0;
}

- (Class)styleClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPStorage setParentInfo:](self->_containedStorage, "setParentInfo:", 0);

  self->mLineHints = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPShapeInfo;
  -[TSDShapeInfo dealloc](&v3, sel_dealloc);
}

- (TSWPShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 pathSource:(id)a6 wpStorage:(id)a7
{
  TSWPShapeInfo *v8;
  TSWPShapeInfo *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSWPShapeInfo;
  v8 = -[TSDShapeInfo initWithContext:geometry:style:pathSource:](&v11, sel_initWithContext_geometry_style_pathSource_, a3, a4, a5, a6);
  v9 = v8;
  if (v8)
  {
    -[TSWPShapeInfo setContainedStorage:](v8, "setContainedStorage:", a7);
    -[TSWPShapeInfo setTextUserEditable:](v9, "setTextUserEditable:", 1);
  }
  return v9;
}

- (TSWPShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 wpStorage:(id)a6
{
  double v11;
  double v12;

  objc_msgSend(a4, "size");
  return -[TSWPShapeInfo initWithContext:geometry:style:pathSource:wpStorage:](self, "initWithContext:geometry:style:pathSource:wpStorage:", a3, a4, a5, +[TSDScalarPathSource roundedRectangleWithScalar:naturalSize:](TSDScalarPathSource, "roundedRectangleWithScalar:naturalSize:", 0.0, v11, v12), a6);
}

- (TSWPShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 pathSource:(id)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TSWPStorage *v15;
  TSWPShapeInfo *v16;

  objc_opt_class();
  v11 = (void *)TSUDynamicCast();
  v12 = (void *)objc_msgSend(a3, "documentRoot");
  v13 = (void *)objc_msgSend(v11, "defaultParagraphStyle");
  if (!v13)
  {
    v14 = (void *)objc_msgSend((id)objc_msgSend(a3, "documentRoot"), "theme");
    objc_opt_class();
    objc_msgSend(v14, "presetOfKind:index:", String, 0);
    v13 = (void *)objc_msgSend((id)TSUDynamicCast(), "defaultParagraphStyle");
  }
  v15 = -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:]([TSWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", a3, 0, 3, objc_msgSend(v12, "stylesheet"), v13, objc_msgSend(v13, "initialListStyle"), 0, 0);
  v16 = -[TSWPShapeInfo initWithContext:geometry:style:pathSource:wpStorage:](self, "initWithContext:geometry:style:pathSource:wpStorage:", a3, a4, a5, a6, v15);

  return v16;
}

- (TSWPShapeInfo)initWithContext:(id)a3 geometry:(id)a4
{

  return 0;
}

- (id)presetKind
{
  void *v3;
  void *v4;

  v3 = (void *)String;
  objc_opt_class();
  -[TSDShapeInfo style](self, "style");
  v4 = (void *)TSUDynamicCast();
  if (v4)
    return (id)objc_msgSend(v4, "presetKind");
  else
    return v3;
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  objc_super v7;

  objc_msgSend(a4, "pushMappingContext:", self);
  v7.receiver = self;
  v7.super_class = (Class)TSWPShapeInfo;
  -[TSDStyledInfo adoptStylesheet:withMapper:](&v7, sel_adoptStylesheet_withMapper_, a3, a4);
  -[TSWPStorage adoptStylesheet:withMapper:](self->_containedStorage, "adoptStylesheet:withMapper:", a3, a4);
  objc_msgSend(a4, "popMappingContext:", self);
}

- (BOOL)displaysInstructionalText
{
  id v2;

  v2 = -[TSWPShapeInfo presetKind](self, "presetKind");
  return objc_msgSend(v2, "isEqual:", String);
}

- (NSString)instructionalText
{
  id v2;
  NSString *result;

  v2 = -[TSWPShapeInfo presetKind](self, "presetKind");
  if (!objc_msgSend(v2, "isEqual:", String))
    return (NSString *)&stru_24D82FEB0;
  result = (NSString *)TSWPDefaultInstructionalText;
  if (!TSWPDefaultInstructionalText)
    return (NSString *)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Text"), &stru_24D82FEB0, CFSTR("TSText"));
  return result;
}

- (double)pOffsetForParagraphAlignment:(CGSize)a3
{
  double height;
  double width;
  TSWPStorage *v6;
  _BOOL4 v7;
  double v8;
  id v9;
  int v10;
  _BOOL4 v11;
  double v12;
  double v13;

  height = a3.height;
  width = a3.width;
  v6 = -[TSWPShapeInfo containedStorage](self, "containedStorage");
  v7 = -[TSWPShapeInfo textIsVertical](self, "textIsVertical");
  v8 = 0.0;
  if (-[TSWPStorage paragraphCount](v6, "paragraphCount"))
  {
    v9 = -[TSWPStorage paragraphStyleAtParIndex:effectiveRange:](v6, "paragraphStyleAtParIndex:effectiveRange:", 0, 0);
    if (v9)
    {
      v10 = objc_msgSend(v9, "intValueForProperty:", 86);
      switch(v10)
      {
        case 1:
          if (v7)
            return height;
          else
            return width;
        case 2:
          if (v7)
            v13 = height;
          else
            v13 = width;
          return v13 * 0.5;
        case 4:
          v11 = -[TSWPStorage isWritingDirectionRightToLeftForParagraphAtParIndex:](v6, "isWritingDirectionRightToLeftForParagraphAtParIndex:", 0);
          if (v7)
            v12 = height;
          else
            v12 = width;
          if (v11)
            return v12;
          else
            return 0.0;
      }
    }
  }
  return v8;
}

- (double)pOffsetForVerticalAlignment:(CGSize)a3
{
  double height;
  double width;
  _BOOL4 v6;
  void *v7;
  int v8;
  double result;
  double v10;

  height = a3.height;
  width = a3.width;
  v6 = -[TSWPShapeInfo textIsVertical](self, "textIsVertical");
  objc_opt_class();
  -[TSDShapeInfo style](self, "style");
  v7 = (void *)TSUDynamicCast();
  if (!v7)
  {
LABEL_7:
    result = 0.0;
    if (v6)
      return width;
    return result;
  }
  v8 = objc_msgSend(v7, "intValueForProperty:", 149);
  if (v8 != 1)
  {
    if (v8 == 2)
    {
      result = 0.0;
      if (!v6)
        return height;
      return result;
    }
    goto LABEL_7;
  }
  if (v6)
    v10 = width;
  else
    v10 = height;
  return v10 * 0.5;
}

- (CGPoint)autosizePositionOffsetForGeometry:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  height = a4.height;
  width = a4.width;
  v8 = *MEMORY[0x24BDBEFB0];
  v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v10 = -[TSWPShapeInfo textIsVertical](self, "textIsVertical");
  if ((objc_msgSend(a3, "widthValid") & 1) != 0)
  {
    if ((objc_msgSend(a3, "heightValid") & 1) == 0)
    {
      if (!v10)
        goto LABEL_9;
LABEL_7:
      -[TSWPShapeInfo pOffsetForParagraphAlignment:](self, "pOffsetForParagraphAlignment:", width, height);
LABEL_10:
      v9 = v12;
    }
  }
  else if (v10)
  {
    -[TSWPShapeInfo pOffsetForVerticalAlignment:](self, "pOffsetForVerticalAlignment:", width, height);
    v8 = v11;
    if ((objc_msgSend(a3, "heightValid") & 1) == 0)
      goto LABEL_7;
  }
  else
  {
    -[TSWPShapeInfo pOffsetForParagraphAlignment:](self, "pOffsetForParagraphAlignment:", width, height);
    v8 = v13;
    if ((objc_msgSend(a3, "heightValid") & 1) == 0)
    {
LABEL_9:
      -[TSWPShapeInfo pOffsetForVerticalAlignment:](self, "pOffsetForVerticalAlignment:", width, height);
      goto LABEL_10;
    }
  }
  v14 = v8;
  v15 = v9;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGAffineTransform)autosizedTransformForInfoGeometry:(SEL)a3 size:(id)a4
{
  double height;
  double width;
  double v10;
  double v11;
  int v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGAffineTransform v19[2];

  height = a5.height;
  width = a5.width;
  v10 = *MEMORY[0x24BDBEFB0];
  v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v12 = objc_msgSend(a4, "widthValid");
  v13 = objc_msgSend(a4, "heightValid");
  memset(&v19[1], 0, sizeof(CGAffineTransform));
  if (a4)
  {
    if (v13)
      v14 = height;
    else
      v14 = 0.0;
    if (v12)
      v15 = width;
    else
      v15 = 0.0;
    objc_msgSend(a4, "transformBasedOnRect:", v10, v11, v15, v14);
  }
  -[TSWPShapeInfo autosizePositionOffsetForGeometry:size:](self, "autosizePositionOffsetForGeometry:size:", a4, width, height);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v19[0] = v19[1];
  return CGAffineTransformTranslate(retstr, v19, -v16, -v17);
}

- (CGPoint)autosizePositionOffset
{
  TSDInfoGeometry *v3;
  void *v4;
  double v5;
  float64x2_t v6;
  double v7;
  double v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  CGPoint result;

  v3 = -[TSDDrawableInfo geometry](self, "geometry");
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  -[TSDInfoGeometry size](v3, "size");
  if (self)
  {
    -[TSWPShapeInfo autosizedTransformForInfoGeometry:size:](self, "autosizedTransformForInfoGeometry:size:", v3);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }
  v4 = (void *)-[TSDInfoGeometry mutableCopy](v3, "mutableCopy");
  objc_msgSend(v4, "setWidthValid:", 1);
  objc_msgSend(v4, "setHeightValid:", 1);
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  objc_msgSend(v4, "size");
  if (self)
  {
    -[TSWPShapeInfo autosizedTransformForInfoGeometry:size:](self, "autosizedTransformForInfoGeometry:size:", v4);
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
  }

  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v6 = vaddq_f64(v11, vmlaq_n_f64(vmulq_n_f64(v10, v5), v9, *MEMORY[0x24BDBEFB0]));
  v7 = TSDSubtractPoints(v6.f64[0], v6.f64[1], vaddq_f64(v14, vmlaq_n_f64(vmulq_n_f64(v13, v5), v12, *MEMORY[0x24BDBEFB0])).f64[0]);
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)fixPositionOfImportedAutosizedShape
{
  TSDInfoGeometry *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = -[TSDDrawableInfo geometry](self, "geometry");
  if (!-[TSDInfoGeometry widthValid](v3, "widthValid") || !-[TSDInfoGeometry heightValid](v3, "heightValid"))
  {
    -[TSWPShapeInfo autosizePositionOffset](self, "autosizePositionOffset");
    v5 = v4;
    v8 = (id)-[TSDInfoGeometry mutableCopy](v3, "mutableCopy");
    objc_msgSend(v8, "position");
    objc_msgSend(v8, "setPosition:", TSDAddPoints(v6, v7, v5));
    -[TSDShapeInfo setGeometry:](self, "setGeometry:", v8);

  }
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPShapeInfo;
  -[TSDDrawableInfo willBeAddedToDocumentRoot:context:](&v7, sel_willBeAddedToDocumentRoot_context_);
  -[TSWPStorage willBeAddedToDocumentRoot:dolcContext:](-[TSWPShapeInfo containedStorage](self, "containedStorage"), "willBeAddedToDocumentRoot:dolcContext:", a3, a4);
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPShapeInfo;
  -[TSDDrawableInfo wasAddedToDocumentRoot:context:](&v7, sel_wasAddedToDocumentRoot_context_);
  -[TSWPStorage wasAddedToDocumentRoot:dolcContext:](-[TSWPShapeInfo containedStorage](self, "containedStorage"), "wasAddedToDocumentRoot:dolcContext:", a3, a4);
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeInfo;
  -[TSDDrawableInfo willBeRemovedFromDocumentRoot:](&v5, sel_willBeRemovedFromDocumentRoot_);
  -[TSWPStorage willBeRemovedFromDocumentRoot:](-[TSWPShapeInfo containedStorage](self, "containedStorage"), "willBeRemovedFromDocumentRoot:", a3);
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeInfo;
  -[TSDDrawableInfo wasRemovedFromDocumentRoot:](&v5, sel_wasRemovedFromDocumentRoot_);
  -[TSWPStorage wasRemovedFromDocumentRoot:](-[TSWPShapeInfo containedStorage](self, "containedStorage"), "wasRemovedFromDocumentRoot:", a3);
}

- (id)childEnumerator
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (-[TSWPShapeInfo containedStorage](self, "containedStorage"))
  {
    v5[0] = -[TSWPShapeInfo containedStorage](self, "containedStorage");
    v3 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return (id)objc_msgSend(v3, "objectEnumerator");
}

- (void)acceptVisitor:(id)a3
{
  objc_msgSend(a3, "visitTSWPShapeInfo:", self);
}

- (Class)layoutClass
{
  objc_super v3;

  if (self->_containedStorage)
    return (Class)objc_opt_class();
  v3.receiver = self;
  v3.super_class = (Class)TSWPShapeInfo;
  return -[TSDShapeInfo layoutClass](&v3, sel_layoutClass);
}

- (Class)repClass
{
  objc_super v3;

  if (self->_containedStorage)
    return (Class)objc_opt_class();
  v3.receiver = self;
  v3.super_class = (Class)TSWPShapeInfo;
  return -[TSDShapeInfo repClass](&v3, sel_repClass);
}

- (id)copyWithContext:(id)a3
{
  _QWORD *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSWPShapeInfo;
  v5 = -[TSDShapeInfo copyWithContext:](&v8, sel_copyWithContext_);
  if (v5)
  {
    v6 = -[TSWPStorage copyWithContext:](self->_containedStorage, "copyWithContext:", a3);
    v5[22] = v6;
    objc_msgSend(v6, "setParentInfo:", v5);
    v5[24] = self->mLineHints;
  }
  return v5;
}

- (id)childInfos
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_containedStorage)
    return 0;
  v3[0] = self->_containedStorage;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
}

- (id)textureDeliveryStylesLocalized:(BOOL)a3 animationFilter:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  TSWPStorage *containedStorage;
  id v9;
  const __CFString *v10;
  int v11;
  void *v12;
  BOOL v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  __int128 v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TSWPShapeInfo;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[TSDDrawableInfo textureDeliveryStylesLocalized:animationFilter:](&v19, sel_textureDeliveryStylesLocalized_animationFilter_, a3, a4));
  v7 = v6;
  if (v4)
  {
    v18 = xmmword_217C27AF0;
    containedStorage = self->_containedStorage;
    if (containedStorage)
    {
      v9 = -[TSWPStorage listStyleAtCharIndex:effectiveRange:](containedStorage, "listStyleAtCharIndex:effectiveRange:", 0, &v18);
      containedStorage = self->_containedStorage;
    }
    else
    {
      v9 = 0;
    }
    v11 = objc_msgSend(v9, "effectiveTypeForLevel:", -[TSWPStorage paragraphLevelAtParIndex:](containedStorage, "paragraphLevelAtParIndex:", 0, v18));
    v12 = (void *)TSWPBundle();
    v13 = v11 == 0;
    if (v11)
      v14 = CFSTR("By Bullet");
    else
      v14 = CFSTR("By Paragraph");
    if (v11)
      v15 = CFSTR("By Bullet Group");
    else
      v15 = CFSTR("By Paragraph Group");
    if (v13)
      v16 = CFSTR("By Highlighted Paragraph");
    else
      v16 = CFSTR("By Highlighted Bullet");
    objc_msgSend(v7, "addObject:", objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24D82FEB0, CFSTR("TSText")));
    objc_msgSend(v7, "addObject:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v15, &stru_24D82FEB0, CFSTR("TSText")));
    v10 = (const __CFString *)objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v16, &stru_24D82FEB0, CFSTR("TSText"));
  }
  else
  {
    objc_msgSend(v6, "addObject:", CFSTR("By Paragraph"));
    objc_msgSend(v7, "addObject:", CFSTR("By Bullet Group"));
    v10 = CFSTR("By Highlighted Bullet");
  }
  objc_msgSend(v7, "addObject:", v10);
  return v7;
}

- (CGPoint)transformableObjectAnchorPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  TSDInfoGeometry *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGPoint result;

  v12.receiver = self;
  v12.super_class = (Class)TSWPShapeInfo;
  -[TSDDrawableInfo transformableObjectAnchorPoint](&v12, sel_transformableObjectAnchorPoint);
  v4 = v3;
  v6 = v5;
  v7 = -[TSDDrawableInfo geometry](self, "geometry");
  if (!-[TSDInfoGeometry widthValid](v7, "widthValid"))
  {
    -[TSDInfoGeometry position](v7, "position");
    v4 = v8;
  }
  if (!-[TSDInfoGeometry heightValid](v7, "heightValid"))
  {
    -[TSDInfoGeometry position](v7, "position");
    v6 = v9;
  }
  v10 = v4;
  v11 = v6;
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)propertyMapForNewPreset
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)objc_msgSend(-[TSDShapeInfo style](self, "style"), "fullPropertyMap");
  v4 = (void *)objc_msgSend((id)objc_msgSend(-[TSPObjectContext documentRoot](-[TSPObject context](self, "context"), "documentRoot"), "theme"), "stylesheet");
  objc_msgSend(v4, "setIsLocked:", 0);
  v5 = -[TSWPStorage listStyleAtParIndex:effectiveRange:](-[TSWPShapeInfo containedStorage](self, "containedStorage"), "listStyleAtParIndex:effectiveRange:", 0, 0);
  v6 = objc_msgSend(v4, "variationOfStyleMatchingStyle:withNewParentStyle:", v5, objc_msgSend(v5, "firstIdentifiedAncestor"));
  v7 = -[TSWPStorage paragraphStyleAtParIndex:effectiveRange:](-[TSWPShapeInfo containedStorage](self, "containedStorage"), "paragraphStyleAtParIndex:effectiveRange:", 0, 0);
  v8 = (void *)objc_msgSend(v7, "fullPropertyMap");
  objc_msgSend(v8, "setObject:forProperty:", v6, 108);
  v9 = objc_msgSend(v4, "variationOfStyle:propertyMap:", objc_msgSend(v7, "firstIdentifiedAncestor"), v8);
  objc_msgSend(v4, "setIsLocked:", 1);
  objc_msgSend(v3, "setObject:forProperty:", v9, 212);
  return v3;
}

- (id)styleIdentifierTemplateForNewPreset
{
  void *v3;
  __CFString *v4;
  __CFString **v5;
  objc_super v7;

  objc_opt_class();
  -[TSDShapeInfo pathSource](self, "pathSource");
  v3 = (void *)TSUDynamicCast();
  v4 = -[TSWPShapeInfo presetKind](self, "presetKind");
  if (v4 != String)
  {
    if (!v3)
    {
      v7.receiver = self;
      v7.super_class = (Class)TSWPShapeInfo;
      return -[TSDStyledInfo styleIdentifierTemplateForNewPreset](&v7, sel_styleIdentifierTemplateForNewPreset);
    }
    if (objc_msgSend(v3, "isClosed"))
      v5 = &String;
    else
      v5 = &String;
    v4 = *v5;
  }
  return (id)TSWPShapeStyleIdentifierString((uint64_t)v4, 0);
}

- (id)stylesForCopyStyle
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeInfo;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[TSDStyledInfo stylesForCopyStyle](&v5, sel_stylesForCopyStyle));
  objc_msgSend(v3, "tsu_addObjects:", -[TSWPStorage paragraphStyleAtParIndex:effectiveRange:](-[TSWPShapeInfo containedStorage](self, "containedStorage"), "paragraphStyleAtParIndex:effectiveRange:", 0, 0), -[TSWPStorage listStyleAtParIndex:effectiveRange:](-[TSWPShapeInfo containedStorage](self, "containedStorage"), "listStyleAtParIndex:effectiveRange:", 0, 0), 0);
  return v3;
}

- (id)commandForPasteStyleWithContext:(id)a3 pasteboardStyles:(id)a4
{
  return 0;
}

- (BOOL)autoListRecognition
{
  return 1;
}

- (BOOL)autoListTermination
{
  return 1;
}

- (BOOL)p_hasContentForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  TSWPStorage *v5;
  NSUInteger v6;
  TSWPStorage *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  char v11;

  length = a3.length;
  location = a3.location;
  v5 = -[TSWPShapeInfo containedStorage](self, "containedStorage");
  v6 = location + length;
  if (location >= location + length)
    return 0;
  v7 = v5;
  if (!IsWhitespaceCharacter(-[TSWPStorage characterAtIndex:](v5, "characterAtIndex:", location)))
    return 1;
  v8 = location + 1;
  v9 = length - 1;
  do
  {
    v10 = v8;
    if (!v9)
      break;
    v11 = IsWhitespaceCharacter(-[TSWPStorage characterAtIndex:](v7, "characterAtIndex:", v8));
    v8 = v10 + 1;
    --v9;
  }
  while ((v11 & 1) != 0);
  return v10 < v6;
}

- (BOOL)p_hasListLabelOrContentForParagraphIndex:(unint64_t)a3
{
  TSWPStorage *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v5 = -[TSWPShapeInfo containedStorage](self, "containedStorage");
  v6 = -[TSWPStorage textRangeIgnoringTrailingLineBreaksForParagraphAtIndex:](v5, "textRangeIgnoringTrailingLineBreaksForParagraphAtIndex:", a3);
  v8 = v7;
  v9 = 0;
  if (-[TSWPStorage paragraphHasListLabelAtCharIndex:](v5, "paragraphHasListLabelAtCharIndex:", v6) && !v8)
    v9 = -[TSWPStorage paragraphCount](v5, "paragraphCount") - 1 == a3;
  return v9 | -[TSWPShapeInfo p_hasContentForRange:](self, "p_hasContentForRange:", v6, v8);
}

- (unint64_t)p_chunkCountForByBullet
{
  return -[TSWPStorage paragraphCount](-[TSWPShapeInfo containedStorage](self, "containedStorage"), "paragraphCount");
}

- (unint64_t)p_chunkCountForByBulletGroup
{
  TSWPStorage *v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;

  v2 = -[TSWPShapeInfo containedStorage](self, "containedStorage");
  v3 = 0;
  if (-[TSWPStorage paragraphCount](v2, "paragraphCount"))
  {
    v4 = 0;
    do
    {
      if (-[TSWPStorage paragraphLevelAtParIndex:](v2, "paragraphLevelAtParIndex:", v4))
        v5 = v4 == 0;
      else
        v5 = 1;
      if (v5)
        ++v3;
      ++v4;
    }
    while (v4 < -[TSWPStorage paragraphCount](v2, "paragraphCount"));
  }
  return v3;
}

- (unint64_t)chunkCountForTextureDeliveryStyle:(unint64_t)a3 byGlyphStyle:(int)a4 animationFilter:(id)a5
{
  TSWPStorage *v8;
  unint64_t v9;
  unint64_t result;

  v8 = -[TSWPShapeInfo containedStorage](self, "containedStorage", a3, *(_QWORD *)&a4, a5);
  if (a4 == 2)
  {
    result = -[TSWPStorage wordCount](v8, "wordCount");
  }
  else if (a4 == 1)
  {
    -[TSWPStorage range](v8, "range");
    result = v9;
  }
  else if (a3 == 2)
  {
    result = -[TSWPShapeInfo p_chunkCountForByBulletGroup](self, "p_chunkCountForByBulletGroup");
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    result = -[TSWPShapeInfo p_chunkCountForByBullet](self, "p_chunkCountForByBullet");
  }
  else
  {
    result = 0;
  }
  if (result <= 1)
    return 1;
  return result;
}

- (id)commandForTransformingByTransform:(CGAffineTransform *)a3 context:(id)a4 transformedObjects:(id)a5 inBounds:(CGRect)a6
{
  return 0;
}

- (void)processSelectedStoragesWithStatisticsController:(id)a3
{
  TSWPStorage *v4;

  v4 = -[TSWPShapeInfo containedStorage](self, "containedStorage");
  if (v4)
    objc_msgSend(a3, "processStorageForStatistics:processSelection:", v4, 0);
}

- (TSWPStorage)containedStorage
{
  return self->_containedStorage;
}

- (TSWPLineHintCollection)lineHints
{
  return self->mLineHints;
}

- (void)setLineHints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

@end
