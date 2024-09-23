@implementation TSTTableRowAccessibilityElement

- (unsigned)rowIndex
{
  return (unsigned __int16)-[TSTTableColumnOrRowAccessibilityElement cellID](self, "cellID");
}

- (void)setRowIndex:(unsigned __int16)a3
{
  -[TSTTableColumnOrRowAccessibilityElement _setCellID:](self, "_setCellID:", a3 | 0xFF0000);
}

- (int)direction
{
  return 0;
}

- (CGRect)_frameInCanvasWithTableRep:(id)a3
{
  unsigned int v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v4 = -[TSTTableRowAccessibilityElement rowIndex](self, "rowIndex");
  LODWORD(v5) = (unsigned __int16)objc_msgSend(a3, "tsaxColumnsCount");
  if (v5 >= 0xFF)
    v5 = 255;
  else
    v5 = v5;
  objc_msgSend(a3, "tsaxDeviceBoundsForCellRange:", v4 | (unint64_t)(v5 << 32) | 0x1000000000000);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

@end
