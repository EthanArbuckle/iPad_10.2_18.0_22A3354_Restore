@implementation TSWPDrawableAttachment

- (double)descent
{
  return 0.0;
}

- (BOOL)isDrawable
{
  return 1;
}

- (BOOL)isPartitioned
{
  if (-[TSWPDrawableAttachment isAnchored](self, "isAnchored"))
    return 0;
  else
    return objc_msgSend((id)objc_opt_class(), "canPartition");
}

- (BOOL)isAnchored
{
  TSDExteriorTextWrap *v2;

  v2 = -[TSDDrawableInfo exteriorTextWrap](self->_drawableInfo, "exteriorTextWrap");
  if (v2)
    LOBYTE(v2) = -[TSDExteriorTextWrap type](v2, "type") != 0;
  return (char)v2;
}

- (TSWPDrawableAttachment)initWithContext:(id)a3 drawable:(id)a4
{
  TSWPDrawableAttachment *v5;
  TSDDrawableInfo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSWPDrawableAttachment;
  v5 = -[TSWPAttachment initWithContext:](&v8, sel_initWithContext_, a3);
  if (v5)
  {
    v6 = (TSDDrawableInfo *)a4;
    v5->_drawableInfo = v6;
    -[TSDDrawableInfo setOwningAttachment:](v6, "setOwningAttachment:", v5);
    v5->_hOffsetType = 0;
    v5->_hOffset = NAN;
    v5->_vOffsetType = 0;
    v5->_vOffset = NAN;
    v5->_vAlignment = 0;
  }
  return v5;
}

- (void)setParentStorage:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPDrawableAttachment;
  -[TSWPAttachment setParentStorage:](&v5, sel_setParentStorage_);
  -[TSDDrawableInfo setParentInfo:](self->_drawableInfo, "setParentInfo:", a3);
}

- (TSDDrawableInfo)drawable
{
  return self->_drawableInfo;
}

- (int)elementKind
{
  return -[TSDDrawableInfo elementKind](self->_drawableInfo, "elementKind");
}

- (void)setHOffsetType:(int)a3
{
  -[TSPObject willModify](self, "willModify");
  self->_hOffsetType = a3;
}

- (void)setHOffset:(double)a3
{
  -[TSPObject willModify](self, "willModify");
  self->_hOffset = a3;
}

- (void)setVOffsetType:(int)a3
{
  -[TSPObject willModify](self, "willModify");
  self->_vOffsetType = a3;
}

- (void)setVOffset:(double)a3
{
  -[TSPObject willModify](self, "willModify");
  self->_vOffset = a3;
}

+ (void)setPositionerClass:(Class)a3
{
  void *v4;
  uint64_t v5;

  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_254FD9958) & 1) == 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPDrawableAttachment setPositionerClass:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPDrawableAttachment.mm"), 92, CFSTR("Invalid positioner class"));
  }
  _tswpDrawableAttachmentPositionerClass = (uint64_t)a3;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDDrawableInfo setOwningAttachment:](self->_drawableInfo, "setOwningAttachment:", 0);

  v3.receiver = self;
  v3.super_class = (Class)TSWPDrawableAttachment;
  -[TSWPDrawableAttachment dealloc](&v3, sel_dealloc);
}

- (TSWPDrawableAttachment)init
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Not using designated intializer"), 0));
}

- (id)copyWithContext:(id)a3
{
  _QWORD *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSWPDrawableAttachment;
  v5 = -[TSWPAttachment copyWithContext:](&v8, sel_copyWithContext_);
  if (v5)
  {
    v6 = -[TSDDrawableInfo copyWithContext:](self->_drawableInfo, "copyWithContext:", a3);
    v5[7] = v6;
    objc_msgSend(v6, "setOwningAttachment:", v5);
    *((_DWORD *)v5 + 16) = self->_hOffsetType;
    v5[9] = *(_QWORD *)&self->_hOffset;
    *((_DWORD *)v5 + 20) = self->_vOffsetType;
    v5[11] = *(_QWORD *)&self->_vOffset;
    *((_DWORD *)v5 + 24) = self->_vAlignment;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4;
  uint64_t v5;
  void *v6;
  int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSWPDrawableAttachment;
  v4 = -[TSWPAttachment isEqual:](&v9, sel_isEqual_);
  if (v4)
  {
    objc_opt_class();
    v5 = TSUDynamicCast();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = -[TSWPDrawableAttachment isAnchored](self, "isAnchored");
      if (v7 == objc_msgSend(v6, "isAnchored"))
        LOBYTE(v4) = -[TSDDrawableInfo isEqual:](self->_drawableInfo, "isEqual:", objc_msgSend(v6, "drawable"));
      else
        LOBYTE(v4) = 0;
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (void)invalidate
{
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](-[TSWPAttachment parentStorage](self, "parentStorage"), "p_didChangeRange:delta:broadcastKind:", -[TSWPAttachment findCharIndex](self, "findCharIndex"), 1, 0, 1);
}

- (id)detachDrawable
{
  TSDDrawableInfo *v3;

  -[TSPObject willModify](self, "willModify");
  v3 = self->_drawableInfo;
  -[TSDDrawableInfo setOwningAttachment:](self->_drawableInfo, "setOwningAttachment:", 0);
  self->_drawableInfo = 0;
  -[TSDDrawableInfo setParentInfo:](v3, "setParentInfo:", 0);
  return v3;
}

- (void)attachDrawable:(id)a3
{
  TSDDrawableInfo *v5;

  -[TSPObject willModify](self, "willModify");
  v5 = (TSDDrawableInfo *)a3;
  self->_drawableInfo = v5;
  -[TSDDrawableInfo setOwningAttachment:](v5, "setOwningAttachment:", self);
  -[TSDDrawableInfo setParentInfo:](self->_drawableInfo, "setParentInfo:", -[TSWPAttachment parentStorage](self, "parentStorage"));
}

- (BOOL)isHTMLWrap
{
  return -[TSDExteriorTextWrap isHTMLWrap](-[TSDDrawableInfo exteriorTextWrap](self->_drawableInfo, "exteriorTextWrap"), "isHTMLWrap");
}

- (Class)positionerClass
{
  if (!-[TSWPDrawableAttachment isAnchored](self, "isAnchored"))
    return 0;
  if (-[TSDExteriorTextWrap isHTMLWrap](-[TSDDrawableInfo exteriorTextWrap](self->_drawableInfo, "exteriorTextWrap"), "isHTMLWrap"))
  {
    return 0;
  }
  return (Class)_tswpDrawableAttachmentPositionerClass;
}

- (BOOL)isSearchable
{
  return 1;
}

- (BOOL)specifiesEnabledKnobMask
{
  _BOOL4 v3;

  if (-[TSDDrawableInfo isInlineWithText](self->_drawableInfo, "isInlineWithText"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[TSDDrawableInfo isAnchoredToText](self->_drawableInfo, "isAnchoredToText");
    if (v3)
      LOBYTE(v3) = -[TSDExteriorTextWrap isHTMLWrap](-[TSDDrawableInfo exteriorTextWrap](self->_drawableInfo, "exteriorTextWrap"), "isHTMLWrap");
  }
  return v3;
}

- (unint64_t)enabledKnobMask
{
  unint64_t result;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  if (!-[TSDDrawableInfo isInlineWithText](self->_drawableInfo, "isInlineWithText"))
  {
    if (-[TSDExteriorTextWrap type](-[TSDDrawableInfo exteriorTextWrap](self->_drawableInfo, "exteriorTextWrap"), "type")- 1 > 1)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPDrawableAttachment enabledKnobMask]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPDrawableAttachment.mm"), 436, CFSTR("Unexpected text wrap type (%d)."), -[TSDExteriorTextWrap type](-[TSDDrawableInfo exteriorTextWrap](self->_drawableInfo, "exteriorTextWrap"), "type"));
    }
    else
    {
      v9 = -[TSDExteriorTextWrap direction](-[TSDDrawableInfo exteriorTextWrap](self->_drawableInfo, "exteriorTextWrap"), "direction");
      if (v9 < 3)
        return qword_217C2ABF8[v9];
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPDrawableAttachment enabledKnobMask]");
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPDrawableAttachment.mm"), 429, CFSTR("Unexpected text wrap direction (%d)."), -[TSDExteriorTextWrap direction](-[TSDDrawableInfo exteriorTextWrap](self->_drawableInfo, "exteriorTextWrap"), "direction"));
    }
    return 0;
  }
  result = -[TSWPAttachment parentStorage](self, "parentStorage");
  if (!result)
    return result;
  v4 = (void *)result;
  v5 = -[TSWPAttachment findCharIndex](self, "findCharIndex");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v6 = v5;
  result = objc_msgSend(v4, "paragraphStyleAtCharIndex:effectiveRange:", v5, 0);
  if (!result)
    return result;
  v7 = objc_msgSend((id)result, "intValueForProperty:", 86);
  v8 = v7;
  if (v7 >= 5)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPDrawableAttachment enabledKnobMask]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPDrawableAttachment.mm"), 403, CFSTR("Invalid paragraph alignment value (%d)."), v8);
    return 0;
  }
  if ((_DWORD)v7 == 4)
    LODWORD(v8) = objc_msgSend(v4, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", v6);
  return -[TSWPDrawableAttachment enabledKnobMask]::sEnabledKnobMaskTable[v8];
}

- (void)infoChanged
{
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self->super._parentStorage, "p_didChangeRange:delta:broadcastKind:", -[TSWPAttachment findCharIndex](self, "findCharIndex"), 1, 0, 0);
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  objc_super v7;

  objc_msgSend(a4, "pushMappingContext:", self);
  v7.receiver = self;
  v7.super_class = (Class)TSWPDrawableAttachment;
  -[TSWPAttachment adoptStylesheet:withMapper:](&v7, sel_adoptStylesheet_withMapper_, a3, a4);
  -[TSDDrawableInfo adoptStylesheet:withMapper:](self->_drawableInfo, "adoptStylesheet:withMapper:", a3, a4);
  objc_msgSend(a4, "popMappingContext:", self);
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  objc_super v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "performSelector:withObject:", sel_willAddDrawable_, -[TSWPDrawableAttachment drawable](self, "drawable"));
  v7.receiver = self;
  v7.super_class = (Class)TSWPDrawableAttachment;
  -[TSWPAttachment willBeAddedToDocumentRoot:context:](&v7, sel_willBeAddedToDocumentRoot_context_, a3, a4);
  -[TSDDrawableInfo willBeAddedToDocumentRoot:context:](self->_drawableInfo, "willBeAddedToDocumentRoot:context:", a3, a4);
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPDrawableAttachment;
  -[TSWPAttachment wasAddedToDocumentRoot:context:](&v7, sel_wasAddedToDocumentRoot_context_);
  -[TSDDrawableInfo wasAddedToDocumentRoot:context:](self->_drawableInfo, "wasAddedToDocumentRoot:context:", a3, a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "performSelector:withObject:", sel_didAddDrawable_, -[TSWPDrawableAttachment drawable](self, "drawable"));
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  objc_super v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "performSelector:withObject:", sel_willRemoveDrawable_, -[TSWPDrawableAttachment drawable](self, "drawable"));
  -[TSDDrawableInfo willBeRemovedFromDocumentRoot:](self->_drawableInfo, "willBeRemovedFromDocumentRoot:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSWPDrawableAttachment;
  -[TSWPAttachment willBeRemovedFromDocumentRoot:](&v5, sel_willBeRemovedFromDocumentRoot_, a3);
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  objc_super v5;

  -[TSDDrawableInfo wasRemovedFromDocumentRoot:](self->_drawableInfo, "wasRemovedFromDocumentRoot:");
  v5.receiver = self;
  v5.super_class = (Class)TSWPDrawableAttachment;
  -[TSWPAttachment wasRemovedFromDocumentRoot:](&v5, sel_wasRemovedFromDocumentRoot_, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "performSelector:withObject:", sel_didRemoveDrawable_, -[TSWPDrawableAttachment drawable](self, "drawable"));
}

- (int)hOffsetType
{
  return self->_hOffsetType;
}

- (double)hOffset
{
  return self->_hOffset;
}

- (int)vOffsetType
{
  return self->_vOffsetType;
}

- (double)vOffset
{
  return self->_vOffset;
}

- (int)vAlignment
{
  return self->_vAlignment;
}

- (void)setVAlignment:(int)a3
{
  self->_vAlignment = a3;
}

- (double)attachmentAnchorY
{
  return self->_attachmentAnchorY;
}

- (void)setAttachmentAnchorY:(double)a3
{
  self->_attachmentAnchorY = a3;
}

- (id)textRepresentationForCopy
{
  id result;
  id v4;

  objc_opt_class();
  -[TSWPDrawableAttachment drawable](self, "drawable");
  result = (id)TSUDynamicCast();
  if (result)
  {
    result = (id)objc_msgSend(result, "containedStorage");
    if (result)
    {
      v4 = result;
      if (objc_msgSend(result, "length"))
        return v4;
      else
        return 0;
    }
  }
  return result;
}

- (id)textStorages
{
  id result;
  id v3;
  id v4;

  result = -[TSWPDrawableAttachment drawable](self, "drawable");
  if (result)
  {
    v3 = result;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      result = (id)objc_msgSend(v3, "textStorages");
      if (result)
      {
        v4 = result;
        if (objc_msgSend(result, "count"))
          return v4;
        else
          return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end
