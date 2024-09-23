@implementation THNoteCardStorageLayer

- (THNoteCardStorageLayer)init
{
  THNoteCardStorageLayer *v2;
  CALayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNoteCardStorageLayer;
  v2 = -[THNoteCardStorageLayer init](&v5, "init");
  if (v2)
  {
    v3 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v2->_imageLayer = v3;
    -[CALayer setContentsGravity:](v3, "setContentsGravity:", kCAGravityResizeAspect);
    -[THNoteCardStorageLayer addSublayer:](v2, "addSublayer:", v2->_imageLayer);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNoteCardStorageLayer;
  -[THNoteCardBodyLayer dealloc](&v3, "dealloc");
}

- (void)setStorage:(id)a3 range:(_NSRange)a4
{
  _BYTE *length;
  char *location;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  length = (_BYTE *)a4.length;
  location = (char *)a4.location;
  if (a4.location + a4.length > (unint64_t)objc_msgSend(a3, "length"))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardStorageLayer setStorage:range:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardStorageLayer.mm"), 111, CFSTR("Annotation out of range for storage."));
    if (objc_msgSend(a3, "length") < length)
      length = objc_msgSend(a3, "length");
    location = (char *)((_BYTE *)objc_msgSend(a3, "length") - length);
  }

  -[THNoteCardStorageLayer setContext:](self, "setContext:", +[THTemporaryObjectContext temporaryContextForDocumentContext:](THTemporaryObjectContext, "temporaryContextForDocumentContext:", objc_msgSend(a3, "context")));
  v8 = -[THWPStorage initTemporaryWithContext:storage:range:]([THWPStorage alloc], "initTemporaryWithContext:storage:range:", -[THNoteCardStorageLayer context](self, "context"), a3, location, length);
  objc_msgSend(v8, "setApplyTheme:", 0);
  self->_storage = (TSWPStorage *)v8;
  self->_hasGraphicalAttachments = 0;
  v9 = -[TSWPStorage attachmentCount](self->_storage, "attachmentCount");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    while ((objc_msgSend(-[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self->_storage, "attachmentAtAttachmentIndex:outCharIndex:", v11, 0), "elementKind") & 0x10000F) == 0)
    {
      if (v10 == (id)++v11)
        goto LABEL_11;
    }
    self->_hasGraphicalAttachments = 1;
  }
LABEL_11:
  self->_storageImageValid = 0;
  -[THNoteCardStorageLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setText:(id)a3 context:(id)a4
{
  id v7;

  v7 = -[THWPStorage initTemporaryWithContext:string:]([THWPStorage alloc], "initTemporaryWithContext:string:", a4, a3);
  objc_msgSend(v7, "setApplyTheme:", 0);
  self->_storage = (TSWPStorage *)v7;
  self->_hasGraphicalAttachments = 0;
  self->_storageImageValid = 0;
  -[THNoteCardStorageLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFontFamily:(id)a3 textColor:(id)a4 underlineColor:(id)a5 characterSpacing:(double)a6 lineSpacingMode:(int)a7 lineSpacingAmount:(double)a8
{
  -[THNoteCardStorageLayer setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:](self, "setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:", a3, a4, a5, *(_QWORD *)&a7, 0, a6, a8);
}

- (void)setFontFamily:(id)a3 textColor:(id)a4 underlineColor:(id)a5 characterSpacing:(double)a6 lineSpacingMode:(int)a7 lineSpacingAmount:(double)a8 alignment:(unsigned int)a9
{
  uint64_t v9;
  id v15;

  v9 = *(_QWORD *)&a9;
  v15 = objc_msgSend(objc_alloc((Class)TSWPLineSpacing), "initWithMode:amount:", *(_QWORD *)&a7, a8);
  -[TSWPStorage setFontFamily:fontSize:textColor:underlineColor:underlineWidth:lineSpacing:characterSpacing:alignment:stripOtherAttributes:](self->_storage, "setFontFamily:fontSize:textColor:underlineColor:underlineWidth:lineSpacing:characterSpacing:alignment:stripOtherAttributes:", a3, a4, a5, v15, v9, 1, 0.0, 0.0, a6);

  self->_storageImageValid = 0;
  -[THNoteCardStorageLayer setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)textFrame
{
  CGSize size;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[5];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  __n128 (*v15)(uint64_t, uint64_t);
  uint64_t (*v16)();
  const char *v17;
  CGPoint origin;
  CGSize v19;
  CGRect result;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x5012000000;
  v15 = sub_E723C;
  v16 = nullsub_22;
  v17 = "";
  size = CGRectNull.size;
  origin = CGRectNull.origin;
  v19 = size;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_E724C;
  v11[3] = &unk_4296E8;
  v11[4] = &v12;
  -[THNoteCardStorageLayer i_performWithEachLine:](self, "i_performWithEachLine:", v11);
  v3 = v13[6];
  v4 = v13[7];
  v5 = v13[8];
  v6 = v13[9];
  _Block_object_dispose(&v12, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (unint64_t)numberOfLines
{
  return -[NSArray count](self->_lines, "count");
}

- (void)setLayoutContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THNoteCardStorageLayer;
  -[THNoteCardBodyLayer setLayoutContext:](&v4, "setLayoutContext:", a3);
  self->_storageImageValid = 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self->_storage)
  {
    -[THNoteCardStorageLayer i_updateStorageImageWithSize:](self, "i_updateStorageImageWithSize:", a3.width, a3.height);
    height = self->_imageSize.height;
    -[THNoteCardLayoutContext noteCardBodyHeight](-[THNoteCardBodyLayer layoutContext](self, "layoutContext"), "noteCardBodyHeight");
    if (height <= v6)
    {
      -[THNoteCardLayoutContext noteCardBodyHeight](-[THNoteCardBodyLayer layoutContext](self, "layoutContext"), "noteCardBodyHeight");
      *(float *)&v7 = v7;
      height = floorf(*(float *)&v7);
    }
  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGRect)contentFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[THNoteCardStorageLayer layoutIfNeeded](self, "layoutIfNeeded");
  -[CALayer frame](self->_imageLayer, "frame");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)i_performWithEachLine:(id)a3
{
  NSArray *lines;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  lines = self->_lines;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](lines, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(lines);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if (v10)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "lineMetrics");
          v12 = *((double *)&v25 + 1);
          v11 = *(double *)&v25;
          v14 = *((double *)&v27 + 1);
          v13 = *(double *)&v27;
        }
        else
        {
          v29 = 0.0;
          v14 = 0.0;
          v13 = 0.0;
          v12 = 0.0;
          v11 = 0.0;
          v25 = 0u;
          v27 = 0u;
        }
        -[THNoteCardStorageLayer convertRect:fromLayer:](self, "convertRect:fromLayer:", self->_imageLayer, v11, v12, v13, v14, v25, v27);
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        if (v10)
        {
          objc_msgSend(v10, "lineMetrics");
          v23 = v29;
        }
        else
        {
          v29 = 0.0;
          v23 = 0.0;
          v26 = 0u;
          v28 = 0u;
        }
        -[THNoteCardStorageLayer convertPoint:fromLayer:](self, "convertPoint:fromLayer:", self->_imageLayer, 0.0, v23, v26, v28);
        (*((void (**)(id, double, double, double, double, double))a3 + 2))(a3, v16, v18, v20, v22, v24);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](lines, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }
}

- (void)layoutSublayers
{
  double v3;
  double v4;
  double v5;
  double height;
  double v7;
  double MidY;
  double v9;
  double MinX;
  objc_super v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v11.receiver = self;
  v11.super_class = (Class)THNoteCardStorageLayer;
  -[THNoteCardStorageLayer layoutSublayers](&v11, "layoutSublayers");
  if (self->_storage)
  {
    -[THNoteCardStorageLayer bounds](self, "bounds");
    -[THNoteCardStorageLayer i_updateStorageImageWithSize:](self, "i_updateStorageImageWithSize:", v3, v4);
    v5 = 0.0;
    if (self->_centerVertically)
    {
      height = self->_imageSize.height;
      -[THNoteCardLayoutContext noteCardBodyHeight](-[THNoteCardBodyLayer layoutContext](self, "layoutContext"), "noteCardBodyHeight");
      if (height < v7)
      {
        -[THNoteCardStorageLayer bounds](self, "bounds");
        MidY = CGRectGetMidY(v12);
        -[THNoteCardStorageLayer p_textVerticalCenter](self, "p_textVerticalCenter");
        v5 = MidY - v9;
      }
    }
    -[THNoteCardStorageLayer bounds](self, "bounds");
    MinX = CGRectGetMinX(v13);
    -[THNoteCardStorageLayer bounds](self, "bounds");
    -[CALayer setFrame:](self->_imageLayer, "setFrame:", MinX, v5, CGRectGetWidth(v14), self->_imageSize.height);
  }
}

- (double)p_textVerticalCenter
{
  id v3;
  void *v4;
  double v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = -[NSArray firstObject](self->_lines, "firstObject");
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "lineMetrics");
    objc_msgSend(v4, "lineMetrics");
    v5 = v16 - v15;
  }
  else
  {
    v5 = 0.0;
  }
  v6 = -[NSArray lastObject](self->_lines, "lastObject");
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "lineMetrics");
    v8 = v16;
  }
  else
  {
    v8 = 0.0;
  }
  -[THNoteCardLayoutContext textScale](-[THNoteCardBodyLayer layoutContext](self, "layoutContext"), "textScale");
  v10 = v9;
  if (v4)
  {
    objc_msgSend(v4, "lineMetrics");
    objc_msgSend(v4, "lineMetrics");
    if (v16 > v15 + v15)
      return self->_imageSize.height * 0.5;
  }
  v11 = (v5 + (v8 - v5) * 0.5) * v10;
  if (v7)
  {
    objc_msgSend(v7, "lineMetrics");
    objc_msgSend(v7, "lineMetrics");
    if (v14 > v13 + v13)
      return self->_imageSize.height * 0.5;
  }
  return v11;
}

- (void)setFontSize:(double)a3
{
  -[THNoteCardStorageLayer setFontSize:lineSpacing:](self, "setFontSize:lineSpacing:", 0, a3);
}

- (void)setFontSize:(double)a3 lineSpacingMode:(int)a4 lineSpacingAmount:(double)a5
{
  id v7;

  v7 = objc_msgSend(objc_alloc((Class)TSWPLineSpacing), "initWithMode:amount:", *(_QWORD *)&a4, a5);
  -[THNoteCardStorageLayer setFontSize:lineSpacing:](self, "setFontSize:lineSpacing:", v7, a3);

}

- (void)setFontSize:(double)a3 lineSpacing:(id)a4
{
  TSWPStorage *storage;
  TSWPStorage *v7;
  _QWORD v8[5];
  _QWORD v9[6];

  storage = self->_storage;
  if (storage)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_E7900;
    v9[3] = &unk_429710;
    *(double *)&v9[5] = a3;
    v9[4] = a4;
    -[TSWPStorage modifyEachParagraphStyleWithBlock:](storage, "modifyEachParagraphStyleWithBlock:", v9);
    v7 = self->_storage;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_E7990;
    v8[3] = &unk_429730;
    *(double *)&v8[4] = a3;
    -[TSWPStorage modifyEachCharacterStyleWithBlock:](v7, "modifyEachCharacterStyleWithBlock:", v8);
    -[TSWPStorage replaceListLabelTypeNumberWithBullet](self->_storage, "replaceListLabelTypeNumberWithBullet");
  }
}

- (void)i_updateStorageImageWithSize:(CGSize)a3
{
  double width;
  THNoteCardStorageLayer *v4;
  double v5;
  id v6;
  id v7;
  double v8;
  id v9;
  THNoteCardShapeInfo *v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  id v14;
  id v15;
  uint64_t v16;
  BOOL v17;
  CGFloat v18;
  CGFloat v19;
  id v20;

  width = a3.width;
  v4 = self;
  if (!self->_storage)
    self = (THNoteCardStorageLayer *)objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3.width, a3.height), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardStorageLayer i_updateStorageImageWithSize:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardStorageLayer.mm"), 352, CFSTR("invalid nil value for '%s'"), "_storage");
  if (!v4->_storageImageValid)
  {
    v5 = TSUScreenScale(self, a2);
    v6 = -[TSWPStorage context](v4->_storage, "context");
    v7 = +[TSWPShapeStyle defaultStyleWithContext:](TSWPShapeStyle, "defaultStyleWithContext:", v6);
    objc_msgSend(v7, "setValue:forProperty:", +[TSDStroke emptyStroke](TSDStroke, "emptyStroke"), 517);
    -[THNoteCardLayoutContext textScale](-[THNoteCardBodyLayer layoutContext](v4, "layoutContext"), "textScale");
    v9 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithWidth:", width / v8);
    v10 = -[THNoteCardShapeInfo initWithContext:geometry:style:wpStorage:]([THNoteCardShapeInfo alloc], "initWithContext:geometry:style:wpStorage:", v6, v9, v7, v4->_storage);
    -[THNoteCardShapeInfo setIgnoreEquationAlignment:](v10, "setIgnoreEquationAlignment:", -[TSWPStorage paragraphCount](v4->_storage, "paragraphCount") == (char *)&dword_0 + 1);
    v11 = 0;
    v20 = 0;
    do
    {
      v12 = *(_QWORD *)&byte_3147F0[v11 + 8];
      -[THNoteCardStorageLayer setFontSize:lineSpacingMode:lineSpacingAmount:](v4, "setFontSize:lineSpacingMode:lineSpacingAmount:", 1, *(double *)&byte_3147F0[v11], *(double *)&byte_3147F0[v11 + 24]);
      -[THNoteCardLayoutContext textScale](-[THNoteCardBodyLayer layoutContext](v4, "layoutContext"), "textScale");
      v14 = +[TSDImager imageForShapeInfo:viewScale:screenScale:lines:documentRoot:](TSDImager, "imageForShapeInfo:viewScale:screenScale:lines:documentRoot:", v10, &v20, objc_msgSend(v6, "documentRoot"), v13, v5);
      v15 = objc_msgSend(v20, "count");
      v16 = v11 + 32;
      if ((unint64_t)v15 >= v12)
        break;
      v17 = v11 == 128;
      v11 += 32;
    }
    while (!v17);
    v4->_centerVertically = byte_3147F0[v16 - 16] & 1;

    v4->_lines = (NSArray *)v20;
    -[CALayer setContents:](v4->_imageLayer, "setContents:", objc_msgSend(v14, "CGImage"));
    objc_msgSend(v14, "size");
    v4->_imageSize.width = v18;
    v4->_imageSize.height = v19;

    v4->_storageImageValid = 1;
  }
}

- (THTemporaryObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
