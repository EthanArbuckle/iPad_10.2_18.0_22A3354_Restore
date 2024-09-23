@implementation TSWPSearchReference

+ (id)searchReferenceWithStorage:(id)a3 range:(_NSRange)a4
{
  return -[TSWPSearchReference initWithStorage:range:]([TSWPSearchReference alloc], "initWithStorage:range:", a3, a4.location, a4.length);
}

+ (id)searchReferenceWithStorage:(id)a3 selection:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStorage:selection:", a3, a4);
}

- (TSWPSearchReference)initWithStorage:(id)a3 range:(_NSRange)a4
{
  return -[TSWPSearchReference initWithStorage:selection:](self, "initWithStorage:selection:", a3, +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a4.location, a4.length));
}

- (TSWPSearchReference)initWithStorage:(id)a3 selection:(id)a4
{
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSWPSearchReference;
  v6 = -[TSWPSearchReference init](&v8, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 1) = a3;
    objc_msgSend(v6, "setSelection:", a4);
    *(_OWORD *)(v6 + 24) = xmmword_217C27470;
    *((_QWORD *)v6 + 6) = 0;
    objc_msgSend(v6, "setSearchReferencePoint:", 1.79769313e308, 1.79769313e308);
  }
  return (TSWPSearchReference *)v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPSearchReference;
  -[TSWPSearchReference dealloc](&v3, sel_dealloc);
}

- (void)pUpdateSelection
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  TSWPSelection *selection;
  uint64_t v9;
  uint64_t v10;
  TSWPSelection *v11;

  if (-[TSWPSearchReference refersToSmartField](self, "refersToSmartField"))
    v3 = 6;
  else
    v3 = -[TSWPSelection type](-[TSWPSearchReference selection](self, "selection"), "type");
  if ((_DWORD)v3 != -[TSWPSelection type](-[TSWPSearchReference selection](self, "selection"), "type")
    || (v4 = -[TSWPSearchReference smartFieldRange](self, "smartFieldRange"),
        v6 = v5,
        v4 != -[TSWPSelection smartFieldRange](self->_selection, "smartFieldRange"))
    || v6 != v7)
  {
    selection = self->_selection;
    v9 = -[TSWPSearchReference smartFieldRange](self, "smartFieldRange");
    v11 = -[TSWPSelection copyWithNewType:smartFieldRange:](selection, "copyWithNewType:smartFieldRange:", v3, v9, v10);

    self->_selection = v11;
  }
}

- (void)setSmartFieldRange:(_NSRange)a3
{
  if (self->_smartFieldRange.location != a3.location || self->_smartFieldRange.length != a3.length)
  {
    self->_smartFieldRange = a3;
    -[TSWPSearchReference pUpdateSelection](self, "pUpdateSelection");
  }
}

- (_NSRange)smartFieldRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_smartFieldRange.length;
  location = self->_smartFieldRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)refersToSmartField
{
  return self->_refersToSmartField;
}

- (void)setRefersToSmartField:(BOOL)a3
{
  if (self->_refersToSmartField != a3)
  {
    self->_refersToSmartField = a3;
    -[TSWPSearchReference setSmartFieldRange:](self, "setSmartFieldRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    -[TSWPSearchReference setSmartField:](self, "setSmartField:", 0);
    -[TSWPSearchReference pUpdateSelection](self, "pUpdateSelection");
  }
}

- (TSWPSmartField)smartField
{
  return self->_smartField;
}

- (void)setSmartField:(id)a3
{
  id v5;

  if (self->_smartField != a3)
  {
    v5 = a3;

    self->_smartField = (TSWPSmartField *)a3;
    -[TSWPSearchReference pUpdateSelection](self, "pUpdateSelection");
  }
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  TSWPSmartField *v12;
  double v13;
  double v14;
  BOOL result;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  TSKAnnotation *v26;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!v4)
    goto LABEL_8;
  v5 = -[TSWPSearchReference storage](self, "storage");
  if (v5 != (id)objc_msgSend(v4, "storage"))
    goto LABEL_8;
  if (!-[TSWPSelection isEqual:](-[TSWPSearchReference selection](self, "selection"), "isEqual:", objc_msgSend(v4, "selection")))goto LABEL_8;
  v6 = -[TSWPSearchReference refersToSmartField](self, "refersToSmartField");
  if (v6 != objc_msgSend(v4, "refersToSmartField"))
    goto LABEL_8;
  v7 = -[TSWPSearchReference smartFieldRange](self, "smartFieldRange");
  v9 = v8;
  v11 = 0;
  if (v7 != objc_msgSend(v4, "smartFieldRange") || v9 != v10)
    goto LABEL_9;
  v12 = -[TSWPSearchReference smartField](self, "smartField");
  if (v12 == (TSWPSmartField *)objc_msgSend(v4, "smartField"))
  {
    v26 = -[TSWPSearchReference annotation](self, "annotation");
    v11 = v26 == (TSKAnnotation *)objc_msgSend(v4, "annotation");
  }
  else
  {
LABEL_8:
    v11 = 0;
  }
LABEL_9:
  -[TSWPSearchReference searchReferencePoint](self, "searchReferencePoint");
  if (v14 != 1.79769313e308 || v13 != 1.79769313e308)
    return v11;
  objc_msgSend(v4, "searchReferencePoint");
  v18 = v17 != 1.79769313e308;
  if (v19 != 1.79769313e308)
    v18 = 1;
  result = v18 && v11;
  if (!v18 && v11)
  {
    -[TSWPSearchReference searchReferencePoint](self, "searchReferencePoint");
    v21 = v20;
    v23 = v22;
    objc_msgSend(v4, "searchReferencePoint");
    return v23 == v25 && v21 == v24;
  }
  return result;
}

- (int64_t)compare:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v5 = -[TSWPSearchReference storage](self, "storage");
  v6 = objc_msgSend(a3, "storage");
  if (v5 == (id)v6)
  {
    v11 = -[TSWPSelection range](-[TSWPSearchReference selection](self, "selection"), "range");
    v13 = v12;
    v14 = objc_msgSend((id)objc_msgSend(a3, "selection"), "range");
    v16 = 1;
    v17 = -1;
    if (v13 >= v15)
      v17 = v15 < v13;
    if (v14 >= v11)
      v16 = v17;
    if (v11 >= v14)
      return v16;
    else
      return -1;
  }
  else
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(v5, "wpKind");
    if (v8 < (int)objc_msgSend(v7, "wpKind"))
      return -1;
    v9 = objc_msgSend(v7, "wpKind");
    if (v9 < (int)objc_msgSend(v5, "wpKind"))
      return 1;
    v18 = objc_msgSend(v5, "length");
    if (v18 >= objc_msgSend(v7, "length"))
    {
      v19 = objc_msgSend(v7, "length");
      return v19 < objc_msgSend(v5, "length");
    }
    else
    {
      return -1;
    }
  }
}

- (void)setRange:(_NSRange)a3
{
  TSWPSelection *v4;

  v4 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", a3.location, a3.length);
  -[TSWPSearchReference setSelection:](self, "setSelection:", v4);

}

- (void)setSelection:(id)a3
{
  TSWPSelection *selection;
  uint64_t v6;
  _BOOL4 v7;
  _NSRange *p_smartFieldRange;

  selection = self->_selection;
  if (selection != a3)
  {

    if (-[TSWPSearchReference refersToSmartField](self, "refersToSmartField"))
      v6 = 6;
    else
      v6 = objc_msgSend(a3, "type");
    v7 = -[TSWPSearchReference refersToSmartField](self, "refersToSmartField");
    p_smartFieldRange = &self->_smartFieldRange;
    if (!v7)
      p_smartFieldRange = (_NSRange *)MEMORY[0x24BEB3BF0];
    self->_selection = (TSWPSelection *)objc_msgSend(a3, "copyWithNewType:smartFieldRange:", v6, p_smartFieldRange->location, p_smartFieldRange->length);
  }
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[TSWPSelection range](-[TSWPSearchReference selection](self, "selection"), "range");
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)isInsertionPoint
{
  return -[TSWPSelection isInsertionPoint](-[TSWPSearchReference selection](self, "selection"), "isInsertionPoint");
}

- (NSString)description
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  TSWPSelection *v9;
  const __CFString *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[TSWPSearchReference storage](self, "storage");
  -[TSWPSearchReference searchReferencePoint](self, "searchReferencePoint");
  v6 = v5;
  -[TSWPSearchReference searchReferencePoint](self, "searchReferencePoint");
  v8 = v7;
  v9 = -[TSWPSearchReference selection](self, "selection");
  if (-[TSWPSearchReference refersToSmartField](self, "refersToSmartField"))
    v10 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Smart Field: %@"), NSStringFromRange(self->_smartFieldRange));
  else
    v10 = &stru_24D82FEB0;
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("[TSWPSearchReference %p] storage=%p, loc: %f,%f selection: %@, %@"), self, v4, v6, v8, v9, v10);
}

- (id)storage
{
  return self->_storage;
}

- (id)searchReferenceForReplacingWithString:(id)a3 options:(unint64_t)a4 authorCreatedWithCommand:(id *)a5
{
  return 0;
}

- (id)searchReferenceStart
{
  return +[TSWPSearchReference searchReferenceWithStorage:range:](TSWPSearchReference, "searchReferenceWithStorage:range:", self->_storage, -[TSWPSearchReference range](self, "range"), 0);
}

- (id)searchReferenceEnd
{
  TSWPStorage *storage;
  uint64_t v3;
  uint64_t v4;

  storage = self->_storage;
  v3 = -[TSWPSearchReference range](self, "range");
  return +[TSWPSearchReference searchReferenceWithStorage:range:](TSWPSearchReference, "searchReferenceWithStorage:range:", storage, v3 + v4, 0);
}

- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (BOOL)isReplaceable
{
  TSWPSelection *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v3 = -[TSWPSearchReference selection](self, "selection");
  v4 = objc_msgSend(-[TSWPSearchReference storage](self, "storage"), "parentInfo");
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v5, "isLocked") & 1) != 0)
        goto LABEL_12;
      v5 = (void *)objc_msgSend(v5, "parentInfo");
    }
    while (v5);
  }
  if (v3
    && (v6 = -[TSWPSelection range](v3, "range"),
        v8 = v7,
        objc_msgSend(-[TSWPSearchReference storage](self, "storage"), "hasSmartFieldsInRange:", v6, v7)))
  {
    v9 = objc_msgSend(-[TSWPSearchReference storage](self, "storage"), "smartFieldAtCharIndex:attributeKind:effectiveRange:", v6, 6, v11);
    if (v9)
    {
      if (v11[0] >= v6)
      {
LABEL_12:
        LOBYTE(v9) = 0;
        return v9;
      }
      LOBYTE(v9) = v11[1] + v11[0] >= v6 + v8;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)isSelectable
{
  TSWPSelection *v3;
  TSWPSelection *v4;
  int v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v3 = -[TSWPSearchReference selection](self, "selection");
  v4 = v3;
  v5 = *((unsigned __int8 *)v17 + 24);
  if (*((_BYTE *)v17 + 24))
    v6 = v3 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = -[TSWPSelection range](v3, "range");
    v9 = v8;
    v10 = -[TSWPSearchReference storage](self, "storage");
    v11 = -[TSWPSelection range](v4, "range");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __35__TSWPSearchReference_isSelectable__block_invoke;
    v15[3] = &unk_24D82E5C0;
    v15[5] = v7;
    v15[6] = v9;
    v15[4] = &v16;
    objc_msgSend(v10, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v11, v12, v15);
    v5 = *((unsigned __int8 *)v17 + 24);
  }
  v13 = v5 != 0;
  _Block_object_dispose(&v16, 8);
  return v13;
}

_QWORD *__35__TSWPSearchReference_isSelectable__block_invoke(_QWORD *result, uint64_t a2, unint64_t a3, uint64_t a4, _BYTE *a5)
{
  unint64_t v5;

  v5 = result[5];
  if (v5 > a3 || result[6] + v5 < a3 + a4)
  {
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 0;
    *a5 = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSWPSearchReference *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = -[TSWPSearchReference initWithStorage:selection:]([TSWPSearchReference alloc], "initWithStorage:selection:", self->_storage, -[TSWPSearchReference selection](self, "selection"));
  -[TSWPSearchReference searchReferencePoint](self, "searchReferencePoint");
  -[TSWPSearchReference setSearchReferencePoint:](v4, "setSearchReferencePoint:");
  -[TSWPSearchReference setRefersToSmartField:](v4, "setRefersToSmartField:", -[TSWPSearchReference refersToSmartField](self, "refersToSmartField"));
  v5 = -[TSWPSearchReference smartFieldRange](self, "smartFieldRange");
  -[TSWPSearchReference setSmartFieldRange:](v4, "setSmartFieldRange:", v5, v6);
  -[TSWPSearchReference setSmartField:](v4, "setSmartField:", -[TSWPSearchReference smartField](self, "smartField"));
  return v4;
}

- (TSWPSelection)selection
{
  return self->_selection;
}

- (NSArray)findHighlights
{
  return self->_findHighlights;
}

- (void)setFindHighlights:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)autohideHighlight
{
  return self->_autohideHighlight;
}

- (void)setAutohideHighlight:(BOOL)a3
{
  self->_autohideHighlight = a3;
}

- (BOOL)pulseHighlight
{
  return self->_pulseHighlight;
}

- (void)setPulseHighlight:(BOOL)a3
{
  self->_pulseHighlight = a3;
}

- (CGPoint)searchReferencePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->searchReferencePoint.x;
  y = self->searchReferencePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSearchReferencePoint:(CGPoint)a3
{
  self->searchReferencePoint = a3;
}

- (TSKAnnotation)annotation
{
  return self->annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
