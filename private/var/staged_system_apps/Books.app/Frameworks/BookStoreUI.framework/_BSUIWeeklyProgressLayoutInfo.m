@implementation _BSUIWeeklyProgressLayoutInfo

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIWeeklyProgressLayoutInfo day](self, "day"));
  objc_msgSend(v8, "setFrame:", x, y, width, height);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIWeeklyProgressLayoutInfo separator](self, "separator"));
  objc_msgSend(v9, "setFrame:", x, y, width, height);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIWeeklyProgressLayoutInfo separator](self, "separator"));
  objc_msgSend(v10, "configureWithType:", -[_BSUIWeeklyProgressLayoutInfo layoutType](self, "layoutType"));

  self->_frame.origin.x = x;
  self->_frame.origin.y = y;
  self->_frame.size.width = width;
  self->_frame.size.height = height;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[_BSUIWeeklyProgressLayoutInfo layoutType](self, "layoutType")));
  v4 = objc_claimAutoreleasedReturnValue(-[_BSUIWeeklyProgressLayoutInfo day](self, "day"));
  v5 = (void *)v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    layoutType = %@: data: %@"), v3, v4));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIWeeklyProgressLayoutInfo separator](self, "separator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    layoutType = %@: data: %@"), v3, v7));

  }
  return v6;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (NSString)dayLabel
{
  return self->_dayLabel;
}

- (void)setDayLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BSUIProgressSingleDayController)day
{
  return self->_day;
}

- (void)setDay:(id)a3
{
  objc_storeStrong((id *)&self->_day, a3);
}

- (BSUIProgressSeparatorController)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_day, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
}

@end
