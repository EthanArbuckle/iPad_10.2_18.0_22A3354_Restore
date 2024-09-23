@implementation TSTTableColumnAccessibilityElement

- (unsigned)columnIndex
{
  return -[TSTTableColumnOrRowAccessibilityElement cellID](self, "cellID") >> 16;
}

- (void)setColumnIndex:(unsigned __int8)a3
{
  -[TSTTableColumnOrRowAccessibilityElement _setCellID:](self, "_setCellID:", ((unint64_t)a3 << 16) | 0xFFFF);
}

- (int)direction
{
  return 1;
}

- (CGRect)_frameInCanvasWithTableRep:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "tsaxDeviceBoundsForCellRange:", ((unint64_t)-[TSTTableColumnAccessibilityElement columnIndex](self, "columnIndex") << 16) | ((_QWORD)objc_msgSend(a3, "tsaxRowsCount") << 48) | 0x100000000);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end
