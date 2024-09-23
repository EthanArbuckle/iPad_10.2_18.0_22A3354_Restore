@implementation TSWPShapeLayout

- (TSWPShapeLayout)initWithInfo:(id)a3
{
  void *v5;
  uint64_t v6;
  TSWPShapeLayout *v7;
  TSWPShapeLayout *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout initWithInfo:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 48, CFSTR("info is wrong class for layout"));
  }
  v12.receiver = self;
  v12.super_class = (Class)TSWPShapeLayout;
  v7 = -[TSDShapeLayout initWithInfo:](&v12, sel_initWithInfo_, a3);
  v8 = v7;
  if (v7 && !-[TSDInfo containedStorage](-[TSDLayout info](v7, "info"), "containedStorage"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout initWithInfo:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 51, CFSTR("invalid nil value for '%s'"), "self.info.containedStorage");
  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  if (self->_observingStorage)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 59, CFSTR("should have unregistered ourselves before dealloc"));
  }
  -[TSDLayout setParent:](self->_containedLayout, "setParent:", 0);

  self->_containedLayout = 0;
  self->_cachedInteriorWrapPolygon = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeLayout;
  -[TSDShapeLayout dealloc](&v5, sel_dealloc);
}

- (void)willBeAddedToLayoutController:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPShapeLayout;
  -[TSDLayout willBeAddedToLayoutController:](&v6, sel_willBeAddedToLayoutController_, a3);
  if (!self->_observingStorage
    || (v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout willBeAddedToLayoutController:]"), objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 73, CFSTR("already observing the storage")), !self->_observingStorage))
  {
    objc_msgSend((id)-[TSDInfo containedStorage](-[TSDLayout info](self, "info"), "containedStorage"), "addObserver:", self);
    self->_observingStorage = 1;
  }
}

- (void)willBeRemovedFromLayoutController:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPShapeLayout;
  -[TSDLayout willBeRemovedFromLayoutController:](&v6, sel_willBeRemovedFromLayoutController_, a3);
  if (self->_observingStorage
    || (v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout willBeRemovedFromLayoutController:]"), objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 86, CFSTR("not observing the storage")), self->_observingStorage))
  {
    objc_msgSend((id)-[TSDInfo containedStorage](-[TSDLayout info](self, "info"), "containedStorage"), "removeObserver:", self);
    self->_observingStorage = 0;
  }
}

- (id)children
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_containedLayout)
    return 0;
  v3[0] = self->_containedLayout;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
}

- (void)setChildren:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout setChildren:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 102, CFSTR("not supported"));
}

- (void)addChild:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout addChild:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 107, CFSTR("not supported"));
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout insertChild:atIndex:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 112, CFSTR("not supported"));
}

- (void)insertChild:(id)a3 below:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout insertChild:below:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 117, CFSTR("not supported"));
}

- (void)insertChild:(id)a3 above:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout insertChild:above:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 122, CFSTR("not supported"));
}

- (void)replaceChild:(id)a3 with:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout replaceChild:with:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 127, CFSTR("not supported"));
}

- (void)invalidateSize
{
  unsigned int v3;
  unsigned int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeLayout;
  -[TSDLayout invalidateSize](&v5, sel_invalidateSize);
  v3 = -[TSWPShapeLayout autosizeFlagsForTextLayout:](self, "autosizeFlagsForTextLayout:", self->_containedLayout);
  if ((~v3 & 0xF) != 0)
  {
    v4 = v3;
    -[TSWPLayout invalidateSize](self->_containedLayout, "invalidateSize");
    if (v4)
      -[TSWPShapeLayout invalidatePath](self, "invalidatePath");
  }
}

- (void)invalidatePath
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPShapeLayout;
  -[TSDShapeLayout invalidatePath](&v3, sel_invalidatePath);

  self->_cachedInteriorWrapPolygon = 0;
}

- (void)destroyContainedLayoutForInstructionalText
{
  void *v3;
  uint64_t v4;
  TSDInfo *v5;

  if ((-[TSDInfo displaysInstructionalText](-[TSDLayout info](self, "info"), "displaysInstructionalText") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout destroyContainedLayoutForInstructionalText]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 162, CFSTR("trying to destroy layout for instructional text when it is not present"));
  }
  if (-[TSDInfo displaysInstructionalText](-[TSDLayout info](self, "info"), "displaysInstructionalText"))
  {
    v5 = -[TSDLayout info](self->_containedLayout, "info");
    if (v5 != (TSDInfo *)-[TSDInfo containedStorage](-[TSDLayout info](self, "info"), "containedStorage"))
    {
      -[TSDLayout setParent:](self->_containedLayout, "setParent:", 0);

      self->_containedLayout = 0;
    }
  }
}

- (void)createContainedLayoutForInstructionalText
{
  void *v3;
  TSWPLayout *containedLayout;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  TSWPLayout *v9;

  v3 = (void *)-[TSDInfo containedStorage](-[TSDLayout info](self, "info"), "containedStorage");
  if (-[TSDInfo displaysInstructionalText](-[TSDLayout info](self, "info"), "displaysInstructionalText")
    && !objc_msgSend(v3, "length"))
  {
    containedLayout = self->_containedLayout;
    if ((!containedLayout || -[TSDLayout info](containedLayout, "info") == v3)
      && (!objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas")
       || objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "shouldShowInstructionalText")))
    {
      -[TSDDrawableLayout invalidate](self, "invalidate");
      -[TSDLayout setParent:](self->_containedLayout, "setParent:", 0);

      self->_containedLayout = 0;
      if (objc_msgSend(v3, "wpKind") == 5)
        v5 = 5;
      else
        v5 = 3;
      v6 = -[TSWPShapeLayout instructionalStorageForContainedStorage:storageKind:](self, "instructionalStorageForContainedStorage:storageKind:", v3, v5);
      objc_msgSend(v6, "setParentInfo:", objc_msgSend(v3, "parentInfo"));
      v7 = (void *)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
      v8 = objc_alloc((Class)objc_msgSend(v3, "layoutClass"));
      objc_msgSend(v7, "size");
      v9 = (TSWPLayout *)objc_msgSend(v8, "initWithInfo:frame:", v6, TSDRectWithSize());
      self->_containedLayout = v9;
      -[TSDLayout setParent:](v9, "setParent:", self);
      if (-[TSWPShapeLayout autosizes](self, "autosizes"))
        -[TSWPShapeLayout invalidateForAutosizingTextLayout:](self, "invalidateForAutosizingTextLayout:", self->_containedLayout);
    }
  }
  else
  {
    -[TSWPShapeLayout createContainedLayoutForEditing](self, "createContainedLayoutForEditing");
  }
}

- (id)instructionalStorageForContainedStorage:(id)a3 storageKind:(int)a4
{
  uint64_t v4;
  TSWPStorage *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = *(_QWORD *)&a4;
  v7 = [TSWPStorage alloc];
  v8 = objc_msgSend(a3, "context");
  v9 = -[TSDInfo instructionalText](-[TSDLayout info](self, "info"), "instructionalText");
  v10 = objc_msgSend(a3, "stylesheet");
  v11 = objc_msgSend(a3, "paragraphStyleAtParIndex:effectiveRange:", 0, 0);
  v12 = objc_msgSend(a3, "listStyleAtCharIndex:effectiveRange:", 0, 0);
  LODWORD(v14) = objc_msgSend(a3, "writingDirectionForParagraphAtCharIndex:", 0);
  return -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:](v7, "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:", v8, v9, v4, v10, v11, v12, 0, 0, v14);
}

- (BOOL)isInvisibleAutosizingShape
{
  uint64_t v3;
  BOOL result;
  objc_super v5;

  v3 = -[TSDInfo length](-[TSDLayout info](-[TSWPShapeLayout containedLayout](self, "containedLayout"), "info"), "length");
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeLayout;
  result = -[TSDShapeLayout isInvisibleAutosizingShape](&v5, sel_isInvisibleAutosizingShape);
  if (v3)
    return 0;
  return result;
}

- (id)childSearchTargets
{
  TSDInfo *v3;
  objc_super v5;

  v3 = -[TSDLayout info](self->_containedLayout, "info");
  if (v3 != (TSDInfo *)-[TSDInfo containedStorage](-[TSDLayout info](self, "info"), "containedStorage"))
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeLayout;
  return -[TSDLayout childSearchTargets](&v5, sel_childSearchTargets);
}

- (void)storage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6
{
  TSWPShapeLayoutDelegate *delegate;

  delegate = self->_delegate;
  if (!delegate
    || -[TSWPShapeLayoutDelegate shapeLayoutShouldUpdateInstructionalText:](delegate, "shapeLayoutShouldUpdateInstructionalText:", self, a4.location, a4.length, a5, *(_QWORD *)&a6))
  {
    if (-[TSDInfo displaysInstructionalText](-[TSDLayout info](self, "info", a3, a4.location, a4.length, a5, *(_QWORD *)&a6), "displaysInstructionalText"))-[TSWPShapeLayout destroyContainedLayoutForInstructionalText](self, "destroyContainedLayoutForInstructionalText");
    -[TSWPShapeLayout createContainedLayoutForInstructionalText](self, "createContainedLayoutForInstructionalText");
  }
  -[TSWPShapeLayoutDelegate shapeLayoutDidChangeContainedStorage:](self->_delegate, "shapeLayoutDidChangeContainedStorage:", self);
}

- (void)createContainedLayoutForEditing
{
  void *v3;
  TSWPLayout *containedLayout;
  id v5;
  TSWPLayout *v6;

  v3 = (void *)-[TSDInfo containedStorage](-[TSDLayout info](self, "info"), "containedStorage");
  containedLayout = self->_containedLayout;
  if (!containedLayout || -[TSDLayout info](containedLayout, "info") != v3)
  {
    -[TSDDrawableLayout invalidate](self, "invalidate");
    -[TSDLayout setParent:](self->_containedLayout, "setParent:", 0);

    self->_containedLayout = 0;
    v5 = objc_alloc((Class)objc_msgSend(v3, "layoutClass"));
    -[TSWPShapeLayout nonAutosizedFrameForTextLayout:](self, "nonAutosizedFrameForTextLayout:", self->_containedLayout);
    v6 = (TSWPLayout *)objc_msgSend(v5, "initWithInfo:frame:", v3);
    self->_containedLayout = v6;
    -[TSDLayout setParent:](v6, "setParent:", self);
    if (-[TSWPShapeLayout autosizes](self, "autosizes"))
      -[TSWPShapeLayout invalidateForAutosizingTextLayout:](self, "invalidateForAutosizingTextLayout:", self->_containedLayout);
  }
}

- (void)updateChildrenFromInfo
{
  TSWPLayout *containedLayout;

  containedLayout = self->_containedLayout;
  if (!containedLayout)
  {
    -[TSWPShapeLayout createContainedLayoutForInstructionalText](self, "createContainedLayoutForInstructionalText");
    containedLayout = self->_containedLayout;
  }
  -[TSDLayout updateChildrenFromInfo](containedLayout, "updateChildrenFromInfo");
}

- (id)interiorWrapPolygon
{
  id result;
  id v4;
  CGFloat v5;
  TSDWrapPolygon *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  result = self->_cachedInteriorWrapPolygon;
  if (!result)
  {
    v4 = -[TSWPShapeLayout interiorWrapPath](self, "interiorWrapPath");
    if (-[TSDInfo textIsVertical](-[TSDLayout info](self, "info"), "textIsVertical"))
    {
      -[TSDShapeLayout pathBoundsWithoutStroke](self, "pathBoundsWithoutStroke");
      memset(&v10, 0, sizeof(v10));
      CGAffineTransformMakeTranslation(&v10, 0.0, v5);
      v8 = v10;
      CGAffineTransformRotate(&v9, &v8, -1.57079633);
      v10 = v9;
      v7 = v9;
      objc_msgSend(v4, "transformUsingAffineTransform:", &v7);
    }
    v6 = -[TSDWrapPolygon initWithPath:]([TSDWrapPolygon alloc], "initWithPath:", v4);
    self->_cachedInteriorWrapPolygon = v6;
    -[TSDWrapPolygon setIntersectsSelf:](v6, "setIntersectsSelf:", 0);
    return self->_cachedInteriorWrapPolygon;
  }
  return result;
}

- (id)interiorWrapPath
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;

  v3 = (void *)objc_msgSend(-[TSWPShapeLayout pathSource](self, "pathSource"), "interiorWrapPath");
  objc_opt_class();
  objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "style");
  objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "valueForProperty:", 146), "leftInset");
  v5 = v4;
  v6 = (void *)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "stroke");
  v7 = v6;
  if (v6 && objc_msgSend(v6, "shouldRender"))
  {
    objc_msgSend(v7, "width");
    v5 = v5 + v8 * 0.5;
  }
  if (v5 <= 0.0)
    return +[TSDBezierPath outsideEdgeOfBezierPath:](TSDBezierPath, "outsideEdgeOfBezierPath:", v3);
  else
    return (id)objc_msgSend(v3, "bezierPathByOffsettingPath:joinStyle:withThreshold:", (int)objc_msgSend(v7, "join"), -v5, 1.0);
}

- (id)textWrapper
{
  if (-[TSWPShapeLayout autosizes](self, "autosizes")
    || (objc_msgSend(-[TSWPShapeLayout pathSource](self, "pathSource"), "isRectangular") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return +[TSWPInteriorTextWrapController sharedInteriorTextWrapController](TSWPInteriorTextWrapController, "sharedInteriorTextWrapController");
  }
}

- (unsigned)cropLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128]
{
  return +[TSWPTextWrapper splitLine:lineSegmentRects:polygon:type:skipHint:](TSWPTextWrapper, "splitLine:lineSegmentRects:polygon:type:skipHint:", a4, -[TSWPShapeLayout interiorWrapPolygon](self, "interiorWrapPolygon"), 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)autosizes
{
  return -[TSWPShapeLayout autosizeFlagsForTextLayout:](self, "autosizeFlagsForTextLayout:", self->_containedLayout) != 0;
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v4 = -[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry", a3);
  v5 = -[TSDInfo textIsVertical](-[TSDLayout info](self, "info"), "textIsVertical");
  v6 = objc_msgSend(v4, "heightValid");
  if (v5)
    v7 = 4;
  else
    v7 = 1;
  if (v5)
    v8 = 1;
  else
    v8 = 4;
  if (v6)
    v9 = 0;
  else
    v9 = v7;
  if (objc_msgSend(v4, "widthValid"))
    v10 = 0;
  else
    v10 = v8;
  return v10 | v9;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  void *v4;

  objc_opt_class();
  objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "style");
  v4 = (void *)TSUDynamicCast();
  if (v4)
    LODWORD(v4) = objc_msgSend(v4, "intValueForProperty:", 149);
  return v4;
}

- (void)invalidateForAutosizingTextLayout:(id)a3
{
  void *v4;
  uint64_t v5;

  if (!-[TSWPShapeLayout autosizes](self, "autosizes", a3))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout invalidateForAutosizingTextLayout:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 437, CFSTR("should call only when autosizing"));
  }
  -[TSDShapeLayout invalidateFrame](self, "invalidateFrame");
  -[TSWPShapeLayout invalidatePath](self, "invalidatePath");
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  void *v4;
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double width;
  double v11;
  double height;
  double v13;
  double v14;
  double v15;
  double v16;
  double x;
  double v18;
  CGFloat y;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  v4 = (void *)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo", a3), "stroke");
  if (!objc_msgSend(v4, "shouldRender"))
    v4 = 0;
  v5 = -[TSWPShapeLayout autosizeFlagsForTextLayout:](self, "autosizeFlagsForTextLayout:", self->_containedLayout);
  objc_msgSend(-[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"), "size");
  v6 = TSDRectWithSize();
  v8 = v7;
  width = v9;
  height = v11;
  if (!v5 && !-[TSDLayout invalidGeometry](self, "invalidGeometry"))
  {
    -[TSDShapeLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
    v6 = TSDRectWithSize();
    v8 = v13;
    width = v14;
    height = v15;
  }
  -[TSDShapeLayout pathBounds](self, "pathBounds");
  x = TSDSubtractPoints(v6, v8, v16);
  y = v18;
  if (v4 && objc_msgSend(-[TSWPShapeLayout pathSource](self, "pathSource"), "isRectangular"))
  {
    objc_msgSend(v4, "width");
    v21 = ceil(v20 * 0.5);
    v22 = fmin(v21, width * 0.5);
    v23 = fmin(v21, height * 0.5);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v29 = CGRectInset(v28, v22, v23);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
  }
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  if (!-[TSWPShapeLayout autosizes](self, "autosizes", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeLayout autosizedFrameForTextLayout:textSize:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeLayout.mm"), 478, CFSTR("should call only when autosizing"));
  }
  v7 = (void *)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "stroke");
  if (v7)
  {
    v8 = v7;
    if (objc_msgSend(v7, "shouldRender"))
      objc_msgSend(v8, "width");
  }
  v9 = -[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry");
  objc_msgSend(v9, "size");
  objc_msgSend(v9, "size");
  objc_msgSend(v9, "widthValid");
  objc_msgSend(v9, "heightValid");
  v10 = TSDRectWithSize();
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (!-[TSWPShapeLayout autosizes](self, "autosizes", a3))
    return 0;
  v5[0] = self;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (BOOL)textLayoutShouldWrapAroundExternalDrawables:(id)a3
{
  return 1;
}

- (BOOL)textLayoutShouldLayoutVertically:(id)a3
{
  return -[TSDInfo textIsVertical](-[TSDLayout info](self, "info", a3), "textIsVertical");
}

- (BOOL)allowsLastLineTruncation:(id)a3
{
  return -[TSDInfo allowsLastLineTruncation](-[TSDLayout info](self, "info", a3), "allowsLastLineTruncation");
}

- (unsigned)maxLineCountForTextLayout:(id)a3
{
  return -[TSDInfo maxLineCount](-[TSDLayout info](self, "info", a3), "maxLineCount");
}

- (BOOL)supportsRotation
{
  objc_super v4;

  if (!-[TSDAbstractLayout canRotateChildLayout:](-[TSDAbstractLayout parent](self, "parent"), "canRotateChildLayout:", self))
  {
    -[TSDAbstractLayout parent](self, "parent");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeLayout;
  return -[TSDShapeLayout supportsRotation](&v4, sel_supportsRotation);
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  objc_super v4;

  if (-[TSWPShapeLayout autosizes](self, "autosizes"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeLayout;
  return -[TSDLayout canAspectRatioLockBeChangedByUser](&v4, sel_canAspectRatioLockBeChangedByUser);
}

- (BOOL)resizeMayChangeAspectRatio
{
  objc_super v4;

  if (-[TSWPShapeLayout autosizes](self, "autosizes"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeLayout;
  return -[TSDLayout resizeMayChangeAspectRatio](&v4, sel_resizeMayChangeAspectRatio);
}

- (id)dependentLayouts
{
  id v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPShapeLayout;
  v3 = -[TSDLayout dependentLayouts](&v6, sel_dependentLayouts);
  if (self->_containedLayout && !-[TSWPShapeLayout autosizes](self, "autosizes"))
  {
    if (v3)
      v4 = (id)objc_msgSend(v3, "mutableCopy");
    else
      v4 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = v4;
    objc_msgSend(v4, "addObject:", self->_containedLayout);
  }
  return v3;
}

- (CGAffineTransform)computeLayoutTransform
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  objc_super v10;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;

  if (-[TSWPShapeLayout autosizes](self, "autosizes"))
  {
    memset(&v15, 0, sizeof(v15));
    if (self)
      -[TSWPShapeLayout autosizedTransform](self, "autosizedTransform");
    objc_msgSend(-[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"), "position");
    memset(&v14, 0, sizeof(v14));
    t1 = v15;
    CGAffineTransformMakeTranslation(&t2, v5, v6);
    CGAffineTransformConcat(&v14, &t1, &t2);
    -[TSDShapeLayout pathBounds](self, "pathBounds");
    *(_OWORD *)&retstr->a = 0u;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    v11 = v14;
    return CGAffineTransformTranslate(retstr, &v11, v7, v8);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TSWPShapeLayout;
    return (CGAffineTransform *)-[CGAffineTransform computeLayoutTransform](&v10, sel_computeLayoutTransform);
  }
}

- (CGAffineTransform)autosizedTransform
{
  CGAffineTransform *result;

  result = -[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry");
  if (self)
    return -[TSWPShapeLayout autosizedTransformForInfoGeometry:](self, "autosizedTransformForInfoGeometry:", result);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (CGAffineTransform)autosizedTransformForInfoGeometry:(SEL)a3
{
  TSDInfo *v7;
  CGAffineTransform *result;
  double v9;
  double v10;

  v7 = -[TSDLayout info](self, "info");
  result = (CGAffineTransform *)-[TSDShapeLayout pathBoundsWithoutStroke](self, "pathBoundsWithoutStroke");
  if (v7)
    return (CGAffineTransform *)-[TSDInfo autosizedTransformForInfoGeometry:size:](v7, "autosizedTransformForInfoGeometry:size:", a4, v9, v10);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (CGPoint)autosizePositionOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[TSWPShapeLayout autosizePositionOffsetForFixedWidth:height:](self, "autosizePositionOffsetForFixedWidth:height:", 1, 1);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)autosizePositionOffsetForFixedWidth:(BOOL)a3 height:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float64x2_t v17;
  double v18;
  double v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  CGPoint result;

  v4 = a4;
  v5 = a3;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  if (self)
    -[TSWPShapeLayout autosizedTransform](self, "autosizedTransform");
  -[TSDShapeLayout pathBoundsWithoutStroke](self, "pathBoundsWithoutStroke");
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_msgSend(-[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"), "mutableCopy");
  objc_msgSend(v11, "size");
  v13 = v12;
  v15 = v14;
  if ((objc_msgSend(v11, "widthValid") & 1) == 0 && v5)
  {
    objc_msgSend(v11, "setWidthValid:", 1);
    v13 = v8;
  }
  if ((objc_msgSend(v11, "heightValid") & 1) == 0 && v4)
  {
    objc_msgSend(v11, "setHeightValid:", 1);
    v15 = v10;
  }
  objc_msgSend(v11, "setSize:", v13, v15);
  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  if (self)
    -[TSWPShapeLayout autosizedTransformForInfoGeometry:](self, "autosizedTransformForInfoGeometry:", v11, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);

  v16 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v17 = vaddq_f64(v25, vmlaq_n_f64(vmulq_n_f64(v24, v16), v23, *MEMORY[0x24BDBEFB0]));
  v18 = TSDSubtractPoints(v17.f64[0], v17.f64[1], vaddq_f64(v22, vmlaq_n_f64(vmulq_n_f64(v21, v16), v20, *MEMORY[0x24BDBEFB0])).f64[0]);
  result.y = v19;
  result.x = v18;
  return result;
}

- (id)pathSource
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  objc_super v13;

  if (self->_containedLayout && -[TSWPShapeLayout autosizes](self, "autosizes"))
  {
    -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self->_containedLayout, "geometry"), "size");
    v4 = v3;
    v6 = v5;
    v7 = (void *)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "stroke");
    if (v7)
    {
      v8 = v7;
      if (objc_msgSend(v7, "shouldRender"))
      {
        objc_msgSend(v8, "width");
        v4 = v4 + v9;
        objc_msgSend(v8, "width");
        v6 = v6 + v10;
      }
    }
    v11 = (void *)objc_msgSend((id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource"), "copy");
    objc_msgSend(v11, "setNaturalSize:", v4, v6);
    return v11;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TSWPShapeLayout;
    return -[TSDShapeLayout pathSource](&v13, sel_pathSource);
  }
}

- (void)processChangedProperty:(int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeLayout;
  -[TSDShapeLayout processChangedProperty:](&v5, sel_processChangedProperty_);
  if (a3 == 517)
  {
LABEL_4:

    self->_cachedInteriorWrapPolygon = 0;
    -[TSWPLayout invalidateSize](self->_containedLayout, "invalidateSize");
    return;
  }
  if (a3 != 153)
  {
    if (a3 != 146)
      return;
    goto LABEL_4;
  }
  -[TSWPLayoutManager clearTypesetterCache](-[TSWPLayout layoutManager](self->_containedLayout, "layoutManager"), "clearTypesetterCache");
  -[TSWPLayout invalidateTextLayout](self->_containedLayout, "invalidateTextLayout");

  self->_cachedInteriorWrapPolygon = 0;
}

- (void)setGeometry:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  TSDLayoutGeometry *v18;
  TSDLayoutGeometry *v19;
  CGAffineTransform v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TSWPShapeLayout;
  -[TSDShapeLayout setGeometry:](&v21, sel_setGeometry_, a3);
  if (self->_containedLayout && -[TSWPShapeLayout autosizes](self, "autosizes"))
  {
    -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self->_containedLayout, "geometry"), "size");
    v5 = v4;
    v7 = v6;
    -[TSDShapeLayout pathBounds](self, "pathBounds");
    v9 = v8;
    v11 = v10;
    v12 = -v8;
    v13 = -v10;
    v14 = (void *)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "stroke");
    if (v14)
    {
      v15 = v14;
      if (objc_msgSend(v14, "shouldRender"))
      {
        objc_msgSend(v15, "width");
        v17 = v16 * 0.5;
        v12 = v17 - v9;
        v13 = v17 - v11;
      }
    }
    v18 = [TSDLayoutGeometry alloc];
    CGAffineTransformMakeTranslation(&v20, v12, v13);
    v19 = -[TSDLayoutGeometry initWithSize:transform:](v18, "initWithSize:transform:", &v20, v5, v7);
    -[TSDAbstractLayout setGeometry:](self->_containedLayout, "setGeometry:", v19);

  }
}

- (CGSize)adjustedInsets
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v4 = (void *)-[TSDInfo padding](-[TSDLayout info](self, "info"), "padding");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "leftInset");
    v2 = v6;
    objc_msgSend(v5, "topInset");
    v3 = v7;
  }
  v8 = v2;
  v9 = v3;
  result.height = v9;
  result.width = v8;
  return result;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  void *v2;

  v2 = (void *)-[TSDInfo columns](-[TSDLayout info](self, "info"), "columns");
  if (v2)
    return objc_msgSend(v2, "columnCount");
  else
    return 1;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  void *v6;
  double result;

  v6 = (void *)-[TSDInfo columns](-[TSDLayout info](self, "info"), "columns");
  if (!v6)
    return 0.0;
  objc_msgSend(v6, "widthForColumnIndex:bodyWidth:", a3, a4);
  return result;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  void *v6;
  double result;

  v6 = (void *)-[TSDInfo columns](-[TSDLayout info](self, "info"), "columns");
  if (!v6)
    return 0.0;
  objc_msgSend(v6, "gapForColumnIndex:bodyWidth:", a3, a4);
  return result;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;

  v11 = (void *)-[TSDInfo columns](-[TSDLayout info](self, "info"), "columns");
  v12 = (void *)-[TSDInfo padding](-[TSDLayout info](self, "info"), "padding");
  if (v12)
  {
    objc_msgSend(v12, "leftInset");
    v14 = v13;
    if (v11)
    {
LABEL_3:
      objc_msgSend(v11, "positionForColumnIndex:bodyWidth:outWidth:outGap:", a3, a5, a6, fmax(a4 + v14 * -2.0, 0.0));
      return v14 + v15;
    }
  }
  else
  {
    v14 = 0.0;
    if (v11)
      goto LABEL_3;
  }
  if (a5)
    *a5 = a4 + v14 * -2.0;
  if (a6)
    *a6 = 0.0;
  return v14;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return -[TSDInfo shrinkTextToFit](-[TSDLayout info](self, "info"), "shrinkTextToFit");
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (TSWPLayout)containedLayout
{
  return self->_containedLayout;
}

- (TSWPShapeLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSWPShapeLayoutDelegate *)a3;
}

@end
