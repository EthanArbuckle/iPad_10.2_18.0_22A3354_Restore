@implementation TSTTableCellAccessibilityElement

- (TSTTableRepAccessibility)tableRep
{
  void *v3;
  TSTTableRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSTTableRepAccessibility);
  result = (TSTTableRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)self->_tableRep, 1, &v5);
  if (v5)
    abort();
  return result;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)editingCellIDInTable
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTTableRepAccessibility tsaxEditingCellID](-[TSTTableCellAccessibilityElement tableRep](self, "tableRep"), "tsaxEditingCellID");
}

- (id)tableModel
{
  return -[TSTTableRepAccessibility tsaxTableModel](-[TSTTableCellAccessibilityElement tableRep](self, "tableRep"), "tsaxTableModel");
}

- (id)tableEditor
{
  return -[TSTTableRepAccessibility tsaxTableEditor](-[TSTTableCellAccessibilityElement tableRep](self, "tableRep"), "tsaxTableEditor");
}

- (id)parentCanvas
{
  return -[TSDRepAccessibility tsaxCanvas](-[TSTTableCellAccessibilityElement tableRep](self, "tableRep"), "tsaxCanvas");
}

- (CGRect)frameInUnscaledCanvas
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  BOOL v6;
  TSTTableRepAccessibility *v7;
  TSTTableRepAccessibility *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v3 = TSTTableMergeRangeAtCellID(-[TSTTableRepAccessibility tsaxTableModel](-[TSTTableCellAccessibilityElement tableRep](self, "tableRep"), "tsaxTableModel"), -[TSTTableCellAccessibilityElement cellID](self, "cellID"));
  v4 = v3;
  if ((_WORD)v3 == 0xFFFF
    || ((v3 & 0xFF0000) != 0xFF0000 ? (v5 = HIWORD(v3) == 0) : (v5 = 1),
        !v5 ? (v6 = (v3 & 0xFFFF00000000) == 0) : (v6 = 1),
        v6))
  {
    v7 = -[TSTTableCellAccessibilityElement tableRep](self, "tableRep");
    v9 = -[TSTTableCellAccessibilityElement cellID](self, "cellID") | 0x1000100000000;
    v8 = v7;
  }
  else
  {
    v8 = -[TSTTableCellAccessibilityElement tableRep](self, "tableRep");
    v9 = v4;
  }
  -[TSTTableRepAccessibility tsaxUnscaledCanvasFrameForCellRange:](v8, "tsaxUnscaledCanvasFrameForCellRange:", v9);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (NSString)value
{
  unsigned int v3;
  NSString *v4;
  _QWORD v6[4];
  TSTTableRepAccessibility *v7;
  uint64_t *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_235790;
  v14 = sub_2357A0;
  v15 = 0;
  v3 = -[TSTTableCellAccessibilityElement cellID](self, "cellID");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2357AC;
  v6[3] = &unk_43BC48;
  v7 = -[TSTTableCellAccessibilityElement tableRep](self, "tableRep");
  v8 = &v10;
  v9 = v3;
  -[TSTTableRepAccessibility tsaxAccessModelForCellID:usingBlock:](v7, "tsaxAccessModelForCellID:usingBlock:", v3, v6);
  v4 = (NSString *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)activate
{
  -[TSTTableRepAccessibility tsaxBeginEditingCellForID:editingSelection:](-[TSTTableCellAccessibilityElement tableRep](self, "tableRep"), "tsaxBeginEditingCellForID:editingSelection:", -[TSTTableCellAccessibilityElement cellID](self, "cellID"), 0);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;

  v5 = objc_opt_class(TSTTableCellAccessibilityElement);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
  {
    v6 = objc_msgSend(-[TSAccessibilityElement parent](self, "parent"), "isEqual:", objc_msgSend(a3, "parent"));
    if (v6)
    {
      v6 = -[TSTTableRepAccessibility isEqual:](-[TSTTableCellAccessibilityElement tableRep](self, "tableRep"), "isEqual:", objc_msgSend(a3, "tableRep"));
      if (v6)
      {
        v7 = -[TSTTableCellAccessibilityElement cellID](self, "cellID");
        LOBYTE(v6) = ((objc_msgSend(a3, "cellID") ^ v7) & 0xFFFFFF) == 0;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (unint64_t)hash
{
  unsigned int v3;
  id v4;

  v3 = -[TSTTableCellAccessibilityElement cellID](self, "cellID");
  v4 = objc_msgSend(-[TSAccessibilityElement parent](self, "parent"), "hash");
  return (unint64_t)-[TSTTableRepAccessibility hash](-[TSTTableCellAccessibilityElement tableRep](self, "tableRep"), "hash")+ BYTE2(v3)+ (_QWORD)v4+ (unsigned __int16)v3;
}

- (NSString)description
{
  unsigned int v3;
  const __CFString *v4;
  objc_class *v5;
  NSString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  v3 = -[TSTTableCellAccessibilityElement cellID](self, "cellID");
  if (-[TSTTableCellAccessibilityElement tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "label", &OBJC_PROTOCOL___TSTTableCellAccessibilityElementExtras))v4 = -[TSTTableCellAccessibilityElement label](self, "label");
  else
    v4 = 0;
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = CFSTR("; label = \");
  v8 = &stru_43D7D8;
  if (v4)
  {
    v9 = v4;
  }
  else
  {
    v7 = &stru_43D7D8;
    v9 = &stru_43D7D8;
  }
  if (v4)
    v8 = CFSTR("\");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; column = %ld; row = %ld%@%@%@>"),
           v6,
           self,
           BYTE2(v3),
           (unsigned __int16)v3,
           v7,
           v9,
           v8);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->_cellID;
}

- (void)setCellID:(id)a3
{
  self->_cellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (void)setTableRep:(id)a3
{
  self->_tableRep = (TSTTableRepAccessibility *)a3;
}

- (BOOL)tsaxSelect
{
  TSTTableRepAccessibility *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = -[TSTTableCellAccessibilityElement tableRep](self, "tableRep");
  v4 = -[TSTTableCellAccessibilityElement cellID](self, "cellID");
  v5 = -[TSTTableRepAccessibility tsaxChildCellIsSelectedAtCellID:](v3, "tsaxChildCellIsSelectedAtCellID:", v4);
  if ((v5 & 1) == 0)
  {
    -[TSTTableRepAccessibility tsaxSelectCellForID:](v3, "tsaxSelectCellForID:", v4);
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }
  return v5 ^ 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  if (!-[TSTTableCellAccessibilityElement tsaxSelect](self, "tsaxSelect"))
  {
    -[TSTTableCellAccessibilityElement activate](self, "activate");
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }
  return 1;
}

- (id)accessibilityValue
{
  NSString *v2;

  v2 = -[TSTTableCellAccessibilityElement value](self, "value");
  if (-[NSString length](v2, "length"))
    return v2;
  else
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("cell.empty.value"));
}

- (id)accessibilityLabel
{
  NSString *v3;
  unsigned int v4;
  NSString *v5;
  NSString *v6;
  id v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = sub_24C170;
  v21 = sub_24C180;
  v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_24C18C;
  v16[3] = &unk_42BF18;
  v16[4] = self;
  v16[5] = &v17;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v16))
    abort();
  v3 = (NSString *)v18[5];
  _Block_object_dispose(&v17, 8);
  v4 = -[TSTTableCellAccessibilityElement cellID](self, "cellID");
  if (!-[NSString length](v3, "length"))
    v3 = TSAccessibilityLocalizedString((uint64_t)CFSTR("table"));
  if (((v4 ^ -[TSTTableCellAccessibilityElement editingCellIDInTable](self, "editingCellIDInTable")) & 0xFFFFFF) != 0)
    v5 = 0;
  else
    v5 = TSAccessibilityLocalizedString((uint64_t)CFSTR("is.editing"));
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v6 = TSAccessibilityLocalizedString((uint64_t)CFSTR("row.column.string %@ %@"));
    v7 = TSAccessibilityLocalizedUnsignedInteger((unsigned __int16)v4 + 1);
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7, TSAccessibilityLocalizedUnsignedInteger(BYTE2(v4) + 1));
    return __TSAccessibilityStringForVariables(1, v3, v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  }
  return v5;
}

- (id)accessibilityHint
{
  const __CFString *v2;

  if (-[TSTTableRepAccessibility tsaxChildCellIsSelectedAtCellID:](-[TSTTableCellAccessibilityElement tableRep](self, "tableRep"), "tsaxChildCellIsSelectedAtCellID:", -[TSTTableCellAccessibilityElement cellID](self, "cellID")))
  {
    v2 = CFSTR("edit.hint.iOS");
  }
  else
  {
    v2 = CFSTR("select.hint.iOS");
  }
  return TSAccessibilityLocalizedString((uint64_t)v2);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTTableCellAccessibilityElement;
  v3 = TSAccessibilityTraitContainedByTable | -[TSTTableCellAccessibilityElement accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[TSTTableRepAccessibility tsaxChildCellIsSelectedAtCellID:](-[TSTTableCellAccessibilityElement tableRep](self, "tableRep"), "tsaxChildCellIsSelectedAtCellID:", -[TSTTableCellAccessibilityElement cellID](self, "cellID"));
  v5 = UIAccessibilityTraitSelected;
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

- (id)accessibilityElements
{
  unsigned int v3;
  TSWPRepAccessibility *v5;

  v3 = -[TSTTableCellAccessibilityElement cellID](self, "cellID");
  if (((-[TSTTableCellAccessibilityElement editingCellIDInTable](self, "editingCellIDInTable") ^ v3) & 0xFFFFFF) != 0)
    return 0;
  v5 = -[TSTTableRepAccessibility tsaxContainedTextEditingRep](-[TSTTableCellAccessibilityElement tableRep](self, "tableRep"), "tsaxContainedTextEditingRep");
  if (!v5)
    return 0;
  else
    return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, 0);
}

@end
