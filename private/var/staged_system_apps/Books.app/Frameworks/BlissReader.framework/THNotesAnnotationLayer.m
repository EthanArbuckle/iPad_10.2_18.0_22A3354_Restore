@implementation THNotesAnnotationLayer

- (THNotesAnnotationLayer)initWithAnnotation:(id)a3 maxLines:(unint64_t)a4 showHighlight:(BOOL)a5
{
  _BOOL4 v5;
  THNotesAnnotationLayer *v8;
  AEHighlight *v9;
  objc_super v11;

  v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)THNotesAnnotationLayer;
  v8 = -[THNoteCardStorageLayer init](&v11, "init");
  if (v8)
  {
    if (v5)
    {
      v9 = (AEHighlight *)objc_alloc_init((Class)AEHighlight);
      v8->_highlight = v9;
      -[AEHighlight setAnnotation:](v9, "setAnnotation:", a3);
      v8->_renderingController = (AEHighlightRenderingController *)objc_alloc_init((Class)AEHighlightRenderingController);
    }
    v8->_annotation = (THAnnotation *)a3;
    v8->_maxLines = a4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesAnnotationLayer;
  -[THNoteCardStorageLayer dealloc](&v3, "dealloc");
}

- (id)annotation
{
  return self->_annotation;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (self->super._storage)
  {
    -[THNotesAnnotationLayer i_updateStorageImageWithSize:](self, "i_updateStorageImageWithSize:", result.width, result.height);
    return self->super._imageSize;
  }
  return result;
}

- (void)layoutSublayers
{
  id v3;
  id v4;
  AEHighlight *highlight;
  id v6;
  id v7;
  double v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[7];
  _QWORD v17[4];
  objc_super v18;
  _BYTE v19[128];

  v18.receiver = self;
  v18.super_class = (Class)THNotesAnnotationLayer;
  -[THNoteCardStorageLayer layoutSublayers](&v18, "layoutSublayers");
  if (self->_highlight)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v3 = +[NSMutableArray array](NSMutableArray, "array");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_119710;
    v16[3] = &unk_429CD8;
    v16[5] = v3;
    v16[6] = v17;
    v16[4] = self;
    -[THNoteCardStorageLayer i_performWithEachLine:](self, "i_performWithEachLine:", v16);
    -[AEHighlight setLines:](self->_highlight, "setLines:", v3);
    objc_msgSend(-[AEHighlightRenderingController highlightLayers](self->_renderingController, "highlightLayers"), "makeObjectsPerformSelector:", "removeFromSuperlayer");
    v4 = -[AEHighlightRenderingController highlightWithData:](self->_renderingController, "highlightWithData:", -[AEHighlight annotation](self->_highlight, "annotation"));
    highlight = self->_highlight;
    if (v4)
      -[AEHighlightRenderingController updatedHighlight:](self->_renderingController, "updatedHighlight:", highlight);
    else
      -[AEHighlightRenderingController addHighlight:forData:](self->_renderingController, "addHighlight:forData:", highlight, -[AEHighlight annotation](highlight, "annotation"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = -[AEHighlightRenderingController highlightLayers](self->_renderingController, "highlightLayers", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          LODWORD(v8) = 1.0;
          objc_msgSend(v11, "setOpacity:", v8);
          -[THNotesAnnotationLayer insertSublayer:atIndex:](self, "insertSublayer:atIndex:", v11, 0);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
      }
      while (v7);
    }
    _Block_object_dispose(v17, 8);
  }
}

- (double)p_verticalImageViewOffset
{
  return 0.0;
}

- (void)i_updateStorageImageWithSize:(CGSize)a3
{
  double width;
  char *v5;
  id v6;
  TSWPStorage *storage;
  unint64_t maxLines;
  double v9;
  id v10;
  CGFloat v11;
  CGFloat v12;
  _QWORD v13[2];
  id v14;

  width = a3.width;
  if (!self->super._storage)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3.width, a3.height), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesAnnotationLayer i_updateStorageImageWithSize:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesAnnotationLayer.mm"), 140, CFSTR("invalid nil value for '%s'"), "_storage");
  if (!self->super._storageImageValid)
  {
    v14 = 0;
    v5 = (char *)-[TSWPStorage characterCount](self->super._storage, "characterCount", a3.width, a3.height);
    v13[0] = 0;
    v13[1] = v5 - 1;
    v6 = -[TSWPStorage valueForProperty:atCharIndex:effectiveRange:](self->super._storage, "valueForProperty:atCharIndex:effectiveRange:", 18, 0, v13);
    if (!v6)
      v6 = +[TSUColor blackColor](TSUColor, "blackColor");
    -[THNoteCardStorageLayer setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:](self, "setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:", objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 15.0), "familyName"), v6, 0, 4, 0.0, 3.0);
    -[THNoteCardStorageLayer setFontSize:](self, "setFontSize:", 15.0);
    storage = self->super._storage;
    maxLines = self->_maxLines;
    -[THNotesAnnotationLayer contentsScale](self, "contentsScale");
    v10 = +[TSDImager imageForStorage:maxWidth:lines:layoutRect:useCullingRect:maxLines:allowsLastLineTruncation:contentsScale:documentRoot:](TSDImager, "imageForStorage:maxWidth:lines:layoutRect:useCullingRect:maxLines:allowsLastLineTruncation:contentsScale:documentRoot:", storage, &v14, 0, 0, maxLines, 1, width, v9, objc_msgSend(-[TSWPStorage context](self->super._storage, "context"), "documentRoot"));

    self->super._lines = (NSArray *)v14;
    -[CALayer setContents:](self->super._imageLayer, "setContents:", objc_msgSend(v10, "CGImage"));
    objc_msgSend(v10, "size");
    self->super._imageSize.width = v11;
    self->super._imageSize.height = v12;
    self->super._storageImageValid = 1;
  }
}

@end
