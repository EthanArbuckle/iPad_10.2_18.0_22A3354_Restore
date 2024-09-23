@implementation TSWPChange

- (TSWPChangeSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->_session = (TSWPChangeSession *)a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->_date = (NSDate *)a3;
}

- (TSWPChange)initWithContext:(id)a3 kind:(int)a4 session:(id)a5
{
  TSWPChange *v8;
  TSWPChange *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSWPChange;
  v8 = -[TSPObject initWithContext:](&v12, sel_initWithContext_);
  v9 = v8;
  if (v8)
  {
    v8->_kind = a4;
    v8->_session = (TSWPChangeSession *)a5;
    v9->_date = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
    objc_opt_class();
    objc_msgSend(a3, "documentObject");
    v10 = (void *)TSUDynamicCast();
    if (v10)
      v9->_hidden = objc_msgSend((id)objc_msgSend(v10, "changeVisibility"), "shouldShowChangeKind:date:", v9->_kind, -[TSWPChangeSession date](v9->_session, "date")) ^ 1;
    else
      v9->_hidden = 1;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPChange;
  -[TSWPChange dealloc](&v3, sel_dealloc);
}

- (BOOL)isInsertion
{
  return self->_kind == 1;
}

- (BOOL)isDeletion
{
  return self->_kind == 2;
}

- (void)setHidden:(BOOL)a3
{
  void *v5;
  uint64_t v6;

  if (a3 && self->_kind != 2)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPChange setHidden:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPChange.mm"), 90, CFSTR("Only deletions may be hidden"));
  }
  -[TSPObject willModify](self, "willModify");
  self->_hidden = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)showsMarkup
{
  void *v3;

  v3 = (void *)objc_msgSend(-[TSPObject documentRoot](self, "documentRoot"), "changeVisibility");
  if (-[TSWPChange isHidden](self, "isHidden"))
    return 0;
  else
    return objc_msgSend(v3, "shouldShowMarkupForChangeKind:date:", self->_kind, -[TSWPChangeSession date](self->_session, "date"));
}

- (BOOL)showsHiddenDeletionMarkup
{
  void *v3;
  uint64_t v4;

  if ((self->_kind == 2
     || (v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
         v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPChange showsHiddenDeletionMarkup]"),
         objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPChange.mm"), 116, CFSTR("Only call this method for deletions")), self->_kind == 2))&& -[TSWPChange isHidden](self, "isHidden")&& !-[TSWPChange showsMarkup](self, "showsMarkup"))
  {
    return objc_msgSend((id)objc_msgSend(-[TSPObject documentRoot](self, "documentRoot"), "changeVisibility"), "shouldShowMarkupForChangeKind:date:", 1, -[TSWPChangeSession date](self->_session, "date"));
  }
  else
  {
    return 0;
  }
}

- (TSUColor)textMarkupColor
{
  return -[TSKAnnotationAuthor textMarkupColor](-[TSWPChangeSession author](self->_session, "author"), "textMarkupColor");
}

- (TSUColor)changeAdornmentsColor
{
  return -[TSKAnnotationAuthor changeAdornmentsColor](-[TSWPChangeSession author](self->_session, "author"), "changeAdornmentsColor");
}

- (void)trackedTextDidChange
{
  -[TSWPChange p_invalidateAnnotationResultsForDocumentRoot:](self, "p_invalidateAnnotationResultsForDocumentRoot:", -[TSPObject documentRoot](self, "documentRoot"));
}

- (void)p_invalidateAnnotationResultsForDocumentRoot:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("kTSDAnnotationInvalidatedNotification"), a3);
}

- (id)copyWithContext:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPChange zone](self, "zone")), "initWithContext:", a3);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 56) = self->_kind;
    *(_QWORD *)(v4 + 64) = self->_session;
    *(_QWORD *)(v5 + 72) = -[NSDate copy](self->_date, "copy");
    *(_BYTE *)(v5 + 80) = self->_hidden;
  }
  return (id)v5;
}

- (BOOL)canMergeWithKind:(int)a3 session:(id)a4
{
  if (self->_kind == a3)
    return objc_msgSend(a4, "isEqualToSession:", self->_session);
  else
    return 0;
}

- (BOOL)isFromChangeSession:(id)a3
{
  return objc_msgSend(a3, "isEqualToSession:", self->_session);
}

- (TSWPStorage)parentStorage
{
  return self->_parentStorage;
}

- (void)setParentStorage:(id)a3
{
  self->_parentStorage = (TSWPStorage *)a3;
}

@end
