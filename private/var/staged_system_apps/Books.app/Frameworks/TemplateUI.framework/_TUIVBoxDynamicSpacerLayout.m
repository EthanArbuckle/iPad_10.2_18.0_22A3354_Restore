@implementation _TUIVBoxDynamicSpacerLayout

- (double)computedHeightAbovePivot
{
  double v2;

  -[TUILayout computedNaturalSize](self, "computedNaturalSize");
  return v2;
}

- (void)computeLayout
{
  double v3;
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUILayout parent](self, "parent"));
  objc_msgSend(v5, "summaryForRange:", self->_range.location, self->_range.length);
  self->_summary.width = v3;
  self->_summary.height = v4;
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");

}

- (void)setRange:(_NSRange)a3
{
  if (a3.location != self->_range.location || a3.length != self->_range.length)
  {
    self->_range = a3;
    -[TUILayout invalidateLayout](self, "invalidateLayout");
    -[TUILayout invalidateIntrinsicSize](self, "invalidateIntrinsicSize");
  }
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  double width;
  unsigned int v5;
  uint64_t v7;

  -[TUILayout validateLayout](self, "validateLayout");
  width = self->_summary.width;
  if (width <= -3.40282347e38)
  {
    v7 = 4286578687;
  }
  else
  {
    if (width < 3.40282347e38)
    {
      *(float *)&v5 = width;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | 0x7FC0000000000000);
    }
    v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  double height;
  unsigned int v5;
  uint64_t v7;

  -[TUILayout validateLayout](self, "validateLayout");
  height = self->_summary.height;
  if (height <= -3.40282347e38)
  {
    v7 = 4286578687;
  }
  else
  {
    if (height < 3.40282347e38)
    {
      *(float *)&v5 = height;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | 0x7FC0000000000000);
    }
    v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (_TUIVBoxItemLayoutSummary)summary
{
  double width;
  double height;
  _TUIVBoxItemLayoutSummary result;

  width = self->_summary.width;
  height = self->_summary.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSummary:(_TUIVBoxItemLayoutSummary)a3
{
  self->_summary = a3;
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

@end
