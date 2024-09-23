@implementation TSWPStoragePasteRules

- (void)dealloc
{
  uint64_t i;
  objc_super v4;

  for (i = 0; i != 4; ++i)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPStoragePasteRules;
  -[TSWPStoragePasteRules dealloc](&v4, sel_dealloc);
}

- (void)addActionFlag:(int)a3
{
  unsigned int lastFlag;
  void *v6;
  uint64_t v7;

  lastFlag = self->_lastFlag;
  if (lastFlag < 4
    || (v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStoragePasteRules addActionFlag:]"),
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 45, CFSTR("addActionFlag: bad action flag count.")), lastFlag = self->_lastFlag, lastFlag <= 3))
  {
    self->_actionFlags[lastFlag] = a3;
    self->_lastFlag = lastFlag + 1;
  }
}

- (void)applyParagraph:(int)a3 toCharIndex:(unint64_t)a4 ioTransaction:(void *)a5
{
  $4F3D9AA6B0466C0CD3ABA6FD05DEB555 *v9;

  v9 = &self->_paragraphs[a3];
  -[TSWPStorage setParagraphStyle:forCharRange:undoTransaction:](self->_destStorage, "setParagraphStyle:forCharRange:undoTransaction:", v9->parStyle, a4, 1, a5);
  -[TSWPStorage setListStyle:forCharRange:undoTransaction:](self->_destStorage, "setListStyle:forCharRange:undoTransaction:", v9->listStyle, a4, 1, a5);
  -[TSWPStorage setParagraphFlags:level:forCharRange:undoTransaction:](self->_destStorage, "setParagraphFlags:level:forCharRange:undoTransaction:", v9->parData.var0.var1.flags, v9->parData.var0.var1.level, a4, 1, a5);
  -[TSWPStorage setListStart:forCharRange:undoTransaction:](self->_destStorage, "setListStart:forCharRange:undoTransaction:", v9->parStartData.var0.var0.listStart, a4, 0, a5);
  -[TSWPStorage setParagraphWritingDirection:forCharRange:undoTransaction:](self->_destStorage, "setParagraphWritingDirection:forCharRange:undoTransaction:", v9->parBidiData.var0.var0.listStart, a4, 0, a5);
  if (-[TSWPStorage supportsColumnStyles](self->_destStorage, "supportsColumnStyles"))
  {
    if (self->_sourceColumnStyleCount >= 2)
      -[TSWPStorage setColumnStyle:forCharRange:undoTransaction:](self->_destStorage, "setColumnStyle:forCharRange:undoTransaction:", self->_paragraphs[a3].columnStyle, a4, 1, a5);
  }
}

- (void)mapCharacterStyleProperties:(id)a3 toRange:(_NSRange)a4 ioTransaction:(void *)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  TSSPropertyMap *v12;
  id v13;
  NSRange v14;
  id v15;
  NSRange v17;
  NSRange v18;

  length = a4.length;
  location = a4.location;
  v15 = -[TSWPStorage stylesheet](self->_destStorage, "stylesheet");
  v9 = -[TSWPStorage length](self->_destStorage, "length");
  if (location + length >= v9)
    v10 = v9;
  else
    v10 = location + length;
  if (location < v10)
  {
    v11 = location;
    do
    {
      v12 = +[TSSPropertyMap propertyMapWithPropertyMap:](TSSPropertyMap, "propertyMapWithPropertyMap:", a3);
      v13 = -[TSWPStorage characterStyleAtCharIndex:effectiveRange:](self->_destStorage, "characterStyleAtCharIndex:effectiveRange:", v11, &v17);
      v18.location = location;
      v18.length = length;
      v14 = NSIntersectionRange(v18, v17);
      if (v14.length)
        -[TSWPStorage setCharacterStyle:range:undoTransaction:](self->_destStorage, "setCharacterStyle:range:undoTransaction:", objc_msgSend(v15, "variationOfCharacterStyle:paragraphStyle:propertyMap:", v13, -[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self->_destStorage, "paragraphStyleAtCharIndex:effectiveRange:", v11, 0), v12), v14.location, v14.length, a5);
      v11 = v17.length + v17.location;
    }
    while (v17.length + v17.location < v10);
  }
}

- (void)mapCharacterStyles:(int)a3 toRange:(_NSRange)a4 ioTransaction:(void *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;

  if (self->_paragraphs[a3].parStyle)
  {
    length = a4.length;
    location = a4.location;
    v9 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap");
    objc_msgSend(v9, "filterWithProperties:", +[TSWPCharacterStyle properties](TSWPCharacterStyle, "properties"));
    -[TSWPStoragePasteRules mapCharacterStyleProperties:toRange:ioTransaction:](self, "mapCharacterStyleProperties:toRange:ioTransaction:", v9, location, length, a5);
  }
}

- (void)setupFlagsForPastingSrcStorage:(id)a3 intoDestStorage:(id)a4 atDestRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unsigned int flags;
  int v20;
  int v21;
  int v23;
  int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  NSUInteger v31;
  BOOL v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  NSUInteger v58;

  length = a5.length;
  location = a5.location;
  self->_flags = 0;
  self->_destStorage = (TSWPStorage *)a4;
  v10 = objc_msgSend(a3, "length");
  self->_srcLeadRange.location = objc_msgSend(a3, "textRangeForParagraphAtCharIndex:", 0);
  self->_srcLeadRange.length = v11;
  self->_srcTrailRange.location = objc_msgSend(a3, "textRangeForParagraphAtCharIndex:", v10);
  self->_srcTrailRange.length = v12;
  v13 = objc_msgSend(a4, "textRangeForParagraphAtCharIndex:", location);
  v15 = v14;
  v58 = location + length;
  v57 = objc_msgSend(a4, "textRangeForParagraphAtCharIndex:");
  v17 = v16;
  self->_sourceColumnStyleCount = objc_msgSend(a3, "columnStyleCount");
  self->_sourceSectionCount = objc_msgSend(a3, "sectionCount");
  if (location == v13 && length == v15
    || v15 == 1 && IsParagraphBreakingCharacter(objc_msgSend(a4, "characterAtIndex:", v13)))
  {
    v18 = 8;
  }
  else
  {
    v18 = 0;
  }
  flags = self->_flags | v18;
  self->_flags = flags;
  if (v10 == 1)
  {
    v20 = 16 * (objc_msgSend(a3, "attachmentOrFootnoteAtCharIndex:", 0) != 0);
    flags = self->_flags;
  }
  else
  {
    v20 = 0;
  }
  v21 = v20 | (location == v13) | flags;
  if (self->_srcLeadRange.length == self->_srcTrailRange.length
    && self->_srcLeadRange.location == self->_srcTrailRange.location)
  {
    v23 = 0;
  }
  else
  {
    v23 = 64;
  }
  if (v15 == v17 && v13 == v57)
    v25 = 0;
  else
    v25 = 4;
  v26 = v25 | v23 | v21;
  self->_flags = v26;
  if (v10)
  {
    if (IsParagraphBreakingCharacter(objc_msgSend(a3, "characterAtIndex:", v10 - 1)))
      v27 = 32;
    else
      v27 = 0;
    v26 = self->_flags;
  }
  else
  {
    v27 = 0;
  }
  v28 = v26 | v27;
  self->_flags = v28;
  if (length)
  {
    if (IsParagraphBreakingCharacter(objc_msgSend(a4, "characterAtIndex:", v58 - 1)))
      v29 = 2;
    else
      v29 = 0;
    v28 = self->_flags;
  }
  else
  {
    v29 = 0;
  }
  v30 = v28 | v29;
  self->_flags = v30;
  if ((v28 & 1) == 0)
  {
    v31 = location;
    while (v31 > v13)
    {
      if ((objc_msgSend((id)objc_msgSend(a4, "attachmentOrFootnoteAtCharIndex:", --v31), "isAnchored") & 1) == 0)
      {
        v30 = self->_flags;
        goto LABEL_40;
      }
    }
    v30 = self->_flags | 1;
    self->_flags = v30;
  }
LABEL_40:
  v32 = (v30 & 0x44) != 0;
  if ((~v30 & 0x22) == 0)
    v32 = 0;
  self->_mapDestTrailCS = v32;
  self->_paragraphs[0].parStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a3, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0);
  self->_paragraphs[0].columnStyle = (TSWPColumnStyle *)(id)objc_msgSend(a3, "columnStyleAtCharIndex:effectiveRange:", 0, 0);
  self->_paragraphs[0].section = (TSPObject *)(id)objc_msgSend(a3, "sectionAtCharIndex:effectiveRange:", 0, 0);
  self->_paragraphs[0].listStyle = (TSWPListStyle *)(id)objc_msgSend(a3, "listStyleAtCharIndex:effectiveRange:", 0, 0);
  v33 = objc_msgSend(a3, "paragraphLevelAtCharIndex:", 0);
  if (v33 >= 0x10000)
  {
    v41 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v42 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]");
    objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 191, CFSTR("Out-of-bounds type assignment was clamped to max"));
    LOWORD(v33) = -1;
  }
  self->_paragraphs[0].parData.var0.var1.level = v33;
  self->_paragraphs[0].parData.var0.var1.flags = objc_msgSend(a3, "paragraphFlagsAtCharIndex:", 0);
  v34 = objc_msgSend(a3, "listStartAtCharIndex:", 0);
  if (HIDWORD(v34))
  {
    v43 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v44 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]");
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 193, CFSTR("Out-of-bounds type assignment was clamped to max"));
    LODWORD(v34) = -1;
  }
  self->_paragraphs[0].parStartData.var0.var0.listStart = v34;
  self->_paragraphs[0].parBidiData.var0.var0.listStart = objc_msgSend(a3, "writingDirectionForParagraphAtCharIndex:", 0);
  self->_paragraphs[1].parStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a3, "paragraphStyleAtCharIndex:effectiveRange:", v10, 0);
  self->_paragraphs[1].columnStyle = (TSWPColumnStyle *)(id)objc_msgSend(a3, "columnStyleAtCharIndex:effectiveRange:", v10, 0);
  self->_paragraphs[1].section = (TSPObject *)(id)objc_msgSend(a3, "sectionAtCharIndex:effectiveRange:", v10, 0);
  self->_paragraphs[1].listStyle = (TSWPListStyle *)(id)objc_msgSend(a3, "listStyleAtCharIndex:effectiveRange:", v10, 0);
  v35 = objc_msgSend(a3, "paragraphLevelAtCharIndex:", v10);
  if (v35 >= 0x10000)
  {
    v45 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v46 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]");
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 200, CFSTR("Out-of-bounds type assignment was clamped to max"));
    LOWORD(v35) = -1;
  }
  self->_paragraphs[1].parData.var0.var1.level = v35;
  self->_paragraphs[1].parData.var0.var1.flags = objc_msgSend(a3, "paragraphFlagsAtCharIndex:", v10);
  v36 = objc_msgSend(a3, "listStartAtCharIndex:", v10);
  if (HIDWORD(v36))
  {
    v47 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v48 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]");
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 202, CFSTR("Out-of-bounds type assignment was clamped to max"));
    LODWORD(v36) = -1;
  }
  self->_paragraphs[1].parStartData.var0.var0.listStart = v36;
  self->_paragraphs[1].parBidiData.var0.var0.listStart = objc_msgSend(a3, "writingDirectionForParagraphAtCharIndex:", v10);
  self->_paragraphs[2].parStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a4, "paragraphStyleAtCharIndex:effectiveRange:", location, 0);
  self->_paragraphs[2].columnStyle = (TSWPColumnStyle *)(id)objc_msgSend(a4, "columnStyleAtCharIndex:effectiveRange:", location, 0);
  self->_paragraphs[2].section = (TSPObject *)(id)objc_msgSend(a4, "sectionAtCharIndex:effectiveRange:", location, 0);
  self->_paragraphs[2].listStyle = (TSWPListStyle *)(id)objc_msgSend(a4, "listStyleAtCharIndex:effectiveRange:", location, 0);
  v37 = objc_msgSend(a4, "paragraphLevelAtCharIndex:", location);
  if (v37 >= 0x10000)
  {
    v49 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v50 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]");
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 209, CFSTR("Out-of-bounds type assignment was clamped to max"));
    LOWORD(v37) = -1;
  }
  self->_paragraphs[2].parData.var0.var1.level = v37;
  self->_paragraphs[2].parData.var0.var1.flags = objc_msgSend(a4, "paragraphFlagsAtCharIndex:", location);
  v38 = objc_msgSend(a4, "listStartAtCharIndex:", location);
  if (HIDWORD(v38))
  {
    v51 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v52 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]");
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 211, CFSTR("Out-of-bounds type assignment was clamped to max"));
    LODWORD(v38) = -1;
  }
  self->_paragraphs[2].parStartData.var0.var0.listStart = v38;
  self->_paragraphs[2].parBidiData.var0.var0.listStart = objc_msgSend(a4, "writingDirectionForParagraphAtCharIndex:", location);
  self->_paragraphs[3].parStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a4, "paragraphStyleAtCharIndex:effectiveRange:", v58, 0);
  self->_paragraphs[3].columnStyle = (TSWPColumnStyle *)(id)objc_msgSend(a4, "columnStyleAtCharIndex:effectiveRange:", v58, 0);
  self->_paragraphs[3].section = (TSPObject *)(id)objc_msgSend(a4, "sectionAtCharIndex:effectiveRange:", v58, 0);
  self->_paragraphs[3].listStyle = (TSWPListStyle *)(id)objc_msgSend(a4, "listStyleAtCharIndex:effectiveRange:", v58, 0);
  v39 = objc_msgSend(a4, "paragraphLevelAtCharIndex:", v58);
  if (v39 >= 0x10000)
  {
    v53 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v54 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]");
    objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 218, CFSTR("Out-of-bounds type assignment was clamped to max"));
    LOWORD(v39) = -1;
  }
  self->_paragraphs[3].parData.var0.var1.level = v39;
  self->_paragraphs[3].parData.var0.var1.flags = objc_msgSend(a4, "paragraphFlagsAtCharIndex:", v58);
  v40 = objc_msgSend(a4, "listStartAtCharIndex:", v58);
  if (HIDWORD(v40))
  {
    v55 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v56 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]");
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 220, CFSTR("Out-of-bounds type assignment was clamped to max"));
    LODWORD(v40) = -1;
  }
  self->_paragraphs[3].parStartData.var0.var0.listStart = v40;
  self->_paragraphs[3].parBidiData.var0.var0.listStart = objc_msgSend(a4, "writingDirectionForParagraphAtCharIndex:", v58);
}

- (void)willPasteStorage:(id)a3 intoDestStorage:(id)a4 atDestRange:(_NSRange)a5
{
  unsigned int flags;
  TSWPStoragePasteRules *v7;
  uint64_t v8;
  uint64_t v9;

  -[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:](self, "setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:", a3, a4, a5.location, a5.length);
  flags = self->_flags;
  if ((flags & 8) != 0)
  {
    if ((flags & 0x10) != 0)
      v8 = 1;
    else
      v8 = 3;
    goto LABEL_14;
  }
  v7 = self;
  if ((self->_flags & 0x41) <= 0x3F)
  {
    -[TSWPStoragePasteRules addActionFlag:](self, "addActionFlag:", 1);
    v8 = 6;
LABEL_14:
    -[TSWPStoragePasteRules addActionFlag:](self, "addActionFlag:", v8);
    goto LABEL_15;
  }
  if ((self->_flags & 0x41) == 0x40)
  {
    -[TSWPStoragePasteRules addActionFlag:](self, "addActionFlag:", 1);
    v7 = self;
    v9 = 6;
  }
  else
  {
    v9 = 3;
  }
  -[TSWPStoragePasteRules addActionFlag:](v7, "addActionFlag:", v9);
  if (self->_srcTrailRange.length)
    -[TSWPStoragePasteRules addActionFlag:](self, "addActionFlag:", 4);
  if (self->_mapDestTrailCS)
  {
    v8 = 5;
    goto LABEL_14;
  }
LABEL_15:
  if ((~self->_flags & 0x22) == 0)
    -[TSWPStoragePasteRules addActionFlag:](self, "addActionFlag:", 2);
}

- (void)didPasteWithIOTransaction:(void *)a3 atDestRange:(_NSRange)a4
{
  uint64_t v6;
  NSUInteger location;
  TSWPStoragePasteRules *v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger length;
  TSWPStoragePasteRules *v14;
  uint64_t v15;

  self->_srcLeadRange.location += a4.location;
  self->_srcTrailRange.location += a4.location;
  v6 = 12;
  while (2)
  {
    switch(*(_DWORD *)((char *)&self->super.isa + v6))
    {
      case 0:
        return;
      case 1:
        location = self->_srcLeadRange.location;
        v8 = self;
        v9 = 2;
        goto LABEL_7;
      case 2:
        location = self->_srcTrailRange.length + self->_srcTrailRange.location;
        v8 = self;
        v9 = 3;
        goto LABEL_7;
      case 3:
        location = self->_srcLeadRange.location;
        v8 = self;
        v9 = 0;
        goto LABEL_7;
      case 4:
        location = self->_srcTrailRange.location;
        v8 = self;
        v9 = 1;
LABEL_7:
        -[TSWPStoragePasteRules applyParagraph:toCharIndex:ioTransaction:](v8, "applyParagraph:toCharIndex:ioTransaction:", v9, location, a3);
        goto LABEL_12;
      case 5:
        v10 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_destStorage, "textRangeForParagraphAtCharIndex:", self->_srcTrailRange.length + self->_srcTrailRange.location);
        v11 = self->_srcTrailRange.length + self->_srcTrailRange.location;
        length = v10 + v12 - v11;
        if (v10 + v12 == v11)
          goto LABEL_12;
        v14 = self;
        v15 = 3;
LABEL_11:
        -[TSWPStoragePasteRules mapCharacterStyles:toRange:ioTransaction:](v14, "mapCharacterStyles:toRange:ioTransaction:", v15, v11, length, a3);
LABEL_12:
        v6 += 4;
        if (v6 != 28)
          continue;
        return;
      case 6:
        v11 = self->_srcLeadRange.location;
        length = self->_srcLeadRange.length;
        v14 = self;
        v15 = 0;
        goto LABEL_11;
      default:
        goto LABEL_12;
    }
  }
}

@end
