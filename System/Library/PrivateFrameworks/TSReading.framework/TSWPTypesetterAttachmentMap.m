@implementation TSWPTypesetterAttachmentMap

- (TSWPAttachment)attachment
{
  return self->_attachment;
}

- (TSDLayout)layout
{
  return self->_layout;
}

+ (id)mapWithAttachment:(id)a3 layout:(id)a4 pageNumber:(unint64_t)a5 pageCount:(unint64_t)a6 footnoteMarkProvider:(id)a7 styleProvider:(id)a8 colorOverride:(id)a9
{
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const __CFAllocator *v30;
  __CFDictionary *MutableCopy;
  __CFDictionary *v32;
  const __CFAttributedString *v33;
  const __CFAttributedString *v34;
  CTLineRef v35;
  void *v36;
  uint64_t v37;

  v15 = objc_alloc_init((Class)a1);
  v16 = v15;
  if (!v15)
    return v16;
  v15[1] = a3;
  v15[2] = a4;
  if ((objc_msgSend(a3, "elementKind") & 0x1E0) == 0)
    return v16;
  objc_opt_class();
  v17 = (void *)TSUDynamicCast();
  v18 = (void *)objc_msgSend(v17, "parentStorage");
  v19 = objc_msgSend(v17, "findCharIndex");
  if (!a7)
    goto LABEL_11;
  objc_opt_class();
  v20 = (void *)TSUDynamicCast();
  if (!v20)
  {
    if (objc_msgSend(v17, "elementKind") == 128)
    {
      if (objc_msgSend(v18, "wpKind") != 2)
      {
        v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CTLineRef createLineRefForAttachment(TSWPTextualAttachment *, NSUInteger, NSUInteger, id<TSWPFootnoteMarkProvider>, id<TSWPStyleProvider>, TSUColor *)");
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPCoreTextTypesetter.mm"), 4657, CFSTR("Footnote mark in non-footnote storage"));
      }
      v22 = a7;
      v21 = (uint64_t)v18;
      goto LABEL_10;
    }
LABEL_11:
    v25 = objc_msgSend(v17, "stringWithPageNumber:pageCount:charIndex:", a5, a6, v19);
    goto LABEL_12;
  }
  v21 = objc_msgSend(v20, "containedStorage");
  v22 = a7;
LABEL_10:
  v25 = objc_msgSend(v22, "markStringForFootnoteReferenceStorage:", v21);
LABEL_12:
  v26 = (const __CFString *)v25;
  if (!v25)
    goto LABEL_20;
  v27 = objc_msgSend(v18, "characterStyleAtCharIndex:left:effectiveRange:", v19, 0, 0);
  v28 = (void *)objc_msgSend(a8, "paragraphStyleAtParIndex:effectiveRange:", objc_msgSend(v18, "paragraphIndexAtCharIndex:", v19), 0);
  v29 = objc_msgSend(v18, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", v19);
  v30 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, (CFDictionaryRef)objc_msgSend(v28, "getTypesetterAttributes:scalePercent:isRightToLeft:", v27, 100, v29));
  if (!MutableCopy)
    goto LABEL_20;
  v32 = MutableCopy;
  CFDictionaryRemoveValue(MutableCopy, CFSTR("TSWPSuperscript"));
  if (a9)
    CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BDC4EE0], (const void *)objc_msgSend(a9, "CGColor"));
  v33 = CFAttributedStringCreate(v30, v26, v32);
  if (!v33)
  {
    CFRelease(v32);
LABEL_20:
    v16[3] = 0;
LABEL_21:
    v36 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPTypesetterAttachmentMap mapWithAttachment:layout:pageNumber:pageCount:footnoteMarkProvider:styleProvider:colorOverride:]");
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPCoreTextTypesetter.mm"), 161, CFSTR("invalid nil value for '%s'"), "result->_lineRef");
    return v16;
  }
  v34 = v33;
  v35 = CTLineCreateWithAttributedString(v33);
  CFRelease(v34);
  CFRelease(v32);
  v16[3] = v35;
  if (!v35)
    goto LABEL_21;
  return v16;
}

- (void)dealloc
{
  __CTLine *lineRef;
  objc_super v4;

  lineRef = self->_lineRef;
  if (lineRef)
    CFRelease(lineRef);
  v4.receiver = self;
  v4.super_class = (Class)TSWPTypesetterAttachmentMap;
  -[TSWPTypesetterAttachmentMap dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSWPTypesetterAttachmentMap *v4;
  TSWPTypesetterAttachmentMap *v5;

  v4 = objc_alloc_init(TSWPTypesetterAttachmentMap);
  v5 = v4;
  if (v4)
  {
    v4->_attachment = self->_attachment;
    v4->_layout = self->_layout;
    v5->_lineRef = (__CTLine *)CFRetain(self->_lineRef);
  }
  return v5;
}

- (void)setAttachment:(id)a3
{
  self->_attachment = (TSWPAttachment *)a3;
}

- (void)setLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (__CTLine)lineRef
{
  return self->_lineRef;
}

@end
