@implementation TSWPTrackedInsertion

- (TSWPTrackedInsertion)initWithSelection:(id)a3 string:(id)a4 changeSession:(id)a5
{
  TSWPTrackedInsertion *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSWPTrackedInsertion;
  v8 = -[TSWPTrackedInsertion init](&v14, sel_init);
  if (v8)
  {
    if (objc_msgSend(a4, "length"))
    {
      if (a3)
      {
LABEL_4:
        v8->_selection = (TSWPSelection *)a3;
        v8->_string = (NSString *)a4;
        v8->_changeSession = (TSWPChangeSession *)a5;
        return v8;
      }
    }
    else
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTrackedInsertion initWithSelection:string:changeSession:]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTrackedInsertion.mm"), 25, CFSTR("Can't track an insertion over an empty range"));
      if (a3)
        goto LABEL_4;
    }
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTrackedInsertion initWithSelection:string:changeSession:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTrackedInsertion.mm"), 26, CFSTR("invalid nil value for '%s'"), "selection");
    goto LABEL_4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTrackedInsertion;
  -[TSWPTrackedInsertion dealloc](&v3, sel_dealloc);
}

- (void)performWithStorage:(id)a3 delta:(int64_t)a4 undoTransaction:(void *)a5 replaceBlock:(id)a6
{
  TSWPSelection *selection;
  uint64_t v11;
  uint64_t v12;
  TSWPSelection *v13;
  TSWPAttributeArray *v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  objc_object *v21;
  NSUInteger v22;
  unint64_t i;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSUInteger v31;
  unint64_t j;
  void *v33;
  int v34;
  TSWPChange *v35;
  TSWPChange *v36;
  unint64_t Object;
  TSWPAttributeArray *v38;
  uint64_t v39;
  TSWPAttributeArray *v40;
  unint64_t v41;
  _NSRange v42;
  NSRange v43;

  if (a4)
  {
    selection = self->_selection;
    v11 = -[TSWPSelection range](selection, "range") + a4;
    -[TSWPSelection range](self->_selection, "range");
    v13 = -[TSWPSelection copyWithNewRange:](selection, "copyWithNewRange:", v11, v12);

    self->_selection = v13;
  }
  v14 = (TSWPAttributeArray *)objc_msgSend(a3, "insertionChangesTable");
  v15 = -[TSWPSelection range](self->_selection, "range");
  if (v16)
    v17 = 1;
  else
    v17 = v14 == 0;
  if (!v17)
  {
    objc_msgSend(a3, "range");
    v42.location = NSExpandedRange();
    v42.length = v22;
    TSWPAttributeArray::begin(v14, &v42, &v40);
    TSWPAttributeArray::end(v14, &v42, &v38);
    for (i = v41; ; i = ++v41)
    {
      if (i == v39)
        goto LABEL_8;
      if (objc_msgSend(*((id *)v40->var4 + 2 * i + 1), "canMergeWithKind:session:", 1, self->_changeSession))
      {
        v24 = TSWPAttributeArray::rangeForAttributeIndex(v40, v41);
        v26 = v24 + v25;
        if (v15 > v24 || v15 < v26)
          break;
      }
    }
    if (v26 == v15)
    {
      v34 = 1;
    }
    else
    {
      if (v24 != v15)
      {
LABEL_40:
        v18 = 1;
        goto LABEL_9;
      }
      v34 = 2;
    }
    TSWPChangeAttributeArray::setInsertionBehavior((uint64_t)v14, v34);
    goto LABEL_40;
  }
LABEL_8:
  v18 = 0;
LABEL_9:
  (*((void (**)(id, TSWPSelection *, NSString *))a6 + 2))(a6, self->_selection, self->_string);
  v19 = -[TSWPTrackedInsertion insertedRange](self, "insertedRange");
  objc_msgSend(a3, "p_handleChangeSplittingForInsertedRange:changeSession:undoTransaction:", v19, v20, self->_changeSession, a5);
  if (v18)
  {
    TSWPChangeAttributeArray::setInsertionBehavior((uint64_t)v14, 0);
    v21 = (objc_object *)objc_retain(*((id *)v14->var4
                                     + 2 * TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v14, v15)
                                     + 1));
    if (!v21)
      return;
    goto LABEL_32;
  }
  v28 = -[TSWPTrackedInsertion insertedRange](self, "insertedRange");
  v30 = v29;
  if (v14)
  {
    objc_msgSend(a3, "range");
    v42.location = NSExpandedRange();
    v42.length = v31;
    TSWPAttributeArray::begin(v14, &v42, &v40);
    TSWPAttributeArray::end(v14, &v42, &v38);
    for (j = v41; j != v39; j = ++v41)
    {
      v33 = (void *)*((_QWORD *)v40->var4 + 2 * j + 1);
      if (objc_msgSend(v33, "canMergeWithKind:session:", 1, self->_changeSession))
      {
        v43.location = TSWPAttributeArray::rangeForAttributeIndex(v40, v41);
        if (NSIntersectionRange(v43, v42).length)
        {
          v35 = v33;
          if (!v35)
            break;
          v36 = v35;
          v21 = v35;
          goto LABEL_31;
        }
      }
    }
  }
  v36 = -[TSWPChange initWithContext:kind:session:]([TSWPChange alloc], "initWithContext:kind:session:", objc_msgSend(a3, "context"), 1, self->_changeSession);
  v21 = 0;
LABEL_31:
  objc_msgSend(a3, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", v36, v28, v30, 15, 0, a5);

  if (v21)
  {
LABEL_32:
    if (a5)
    {
      if (v14)
      {
        Object = TSWPAttributeArray::findObject(v14, v21, 0);
        TSWPStorageTransaction::appendToTransaction((uint64_t *)a5, 10, 15, Object, (NSDate *)-[objc_object date](v21, "date"));
      }
    }
    -[objc_object setDate:](v21, "setDate:", objc_msgSend(MEMORY[0x24BDBCE60], "date"));
    -[objc_object trackedTextDidChange](v21, "trackedTextDidChange");

  }
}

- (unint64_t)targetCharIndex
{
  return -[TSWPSelection range](self->_selection, "range");
}

- (int64_t)delta
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString length](self->_string, "length");
  -[TSWPSelection range](self->_selection, "range");
  return v3 - v4;
}

- (_NSRange)insertedRange
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[TSWPSelection range](self->_selection, "range");
  v4 = -[NSString length](self->_string, "length");
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

@end
