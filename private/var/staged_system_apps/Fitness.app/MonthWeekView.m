@implementation MonthWeekView

- (MonthWeekView)initWithDateCache:(id)a3
{
  MonthWeekView *v3;
  MonthWeekView *v4;
  uint64_t v5;
  NSMutableArray *summaryIndexes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MonthWeekView;
  v3 = -[MonthWeekView initWithDateCache:](&v8, "initWithDateCache:", a3);
  v4 = v3;
  if (v3)
  {
    -[MonthWeekView setLeadingMargin:](v3, "setLeadingMargin:", 5.0);
    -[MonthWeekView setDateTopMargin:](v4, "setDateTopMargin:", 3.0);
    -[MonthWeekView setDateBottomMargin:](v4, "setDateBottomMargin:", 3.0);
    -[MonthWeekView setDateDiameter:](v4, "setDateDiameter:", 25.0);
    -[MonthWeekView setMonthTitleTopMargin:](v4, "setMonthTitleTopMargin:", 25.0);
    -[MonthWeekView setMonthTitleBottomMargin:](v4, "setMonthTitleBottomMargin:", 2.0);
    -[MonthWeekView setAdditionalSpacingPerRow:](v4, "setAdditionalSpacingPerRow:", 3.0 + 40.0);
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    summaryIndexes = v4->_summaryIndexes;
    v4->_summaryIndexes = (NSMutableArray *)v5;

  }
  return v4;
}

- (Class)cellClass
{
  return (Class)objc_opt_class(MonthDayCellLayer, a2);
}

- (Class)monthTitleClass
{
  return (Class)objc_opt_class(_FitnessMonthTitleLabel, a2);
}

- (BOOL)supportsRTL
{
  return 0;
}

- (double)heightForCellAtIndex:(int64_t)a3 oneTime:(BOOL)a4
{
  double v4;

  -[MonthWeekView _yValueForCellAtIndex:](self, "_yValueForCellAtIndex:", a3, a4);
  return v4 + 25.0 + 2.0;
}

- (double)_yValueForCellAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[MonthWeekView dateTopMargin](self, "dateTopMargin");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekView monthTitleView](self, "monthTitleView"));
  objc_msgSend(v7, "frame");
  v9 = v8;
  -[MonthWeekView monthTitleTopMargin](self, "monthTitleTopMargin");
  v11 = v10 + v9;
  -[MonthWeekView monthTitleBottomMargin](self, "monthTitleBottomMargin");
  v13 = v12 + v11;

  if (!-[MonthWeekView firstDayOfMonthCellIndex](self, "firstDayOfMonthCellIndex"))
  {
    -[MonthWeekView dateTopMargin](self, "dateTopMargin");
    return v6 + v13 + v15;
  }
  if ((uint64_t)-[MonthWeekView firstDayOfMonthCellIndex](self, "firstDayOfMonthCellIndex") >= 1
    && (uint64_t)-[MonthWeekView firstDayOfMonthCellIndex](self, "firstDayOfMonthCellIndex") <= a3)
  {
    -[MonthWeekView dateTopMargin](self, "dateTopMargin");
    v15 = 25.0 + 40.0 + v14 * 3.0;
    return v6 + v13 + v15;
  }
  return v6;
}

- (void)setMonthWeekStart:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *summaryIndexes;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];

  v17.receiver = self;
  v17.super_class = (Class)MonthWeekView;
  -[MonthWeekView setMonthWeekStart:](&v17, "setMonthWeekStart:", a3);
  -[NSMutableArray removeAllObjects](self->_summaryIndexes, "removeAllObjects");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekView dayCells](self, "dayCells", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8), "date"));
        v10 = sub_10008D710(v9);

        summaryIndexes = self->_summaryIndexes;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v10));
        -[NSMutableArray addObject:](summaryIndexes, "addObject:", v12);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)MonthWeekView;
  -[MonthWeekView layoutSubviews](&v27, "layoutSubviews");
  -[MonthWeekView bounds](self, "bounds");
  v4 = v3;
  -[MonthWeekView leadingMargin](self, "leadingMargin");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekView dayCells](self, "dayCells"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10005D980;
  v26[3] = &unk_100778008;
  v26[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v26);

  if (-[MonthWeekView containsMonthTitle](self, "containsMonthTitle"))
  {
    v8 = (v4 + v6 * -2.0) / 7.0;
    -[MonthWeekView dateTopMargin](self, "dateTopMargin");
    v10 = v9;
    -[MonthWeekView monthTitleTopMargin](self, "monthTitleTopMargin");
    v12 = v10 + v11;
    if ((uint64_t)-[MonthWeekView firstDayOfMonthCellIndex](self, "firstDayOfMonthCellIndex") >= 1)
    {
      -[MonthWeekView dateTopMargin](self, "dateTopMargin");
      v12 = v12 + v13 * 2.0 + 25.0 + 40.0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekView monthTitleView](self, "monthTitleView"));
    objc_msgSend(v14, "frame");
    v16 = v15;

    -[MonthWeekView leadingMargin](self, "leadingMargin");
    v18 = UIRoundToViewScale(self, v8 * 0.5+ v17+ (double)(uint64_t)-[MonthWeekView firstDayOfMonthCellIndex](self, "firstDayOfMonthCellIndex") * v8- v16 * 0.5);
    if (v18 < 0.0)
    {
      -[MonthWeekView leadingMargin](self, "leadingMargin");
      v18 = v19;
    }
    -[MonthWeekView bounds](self, "bounds");
    if (v16 + v18 > v20)
    {
      -[MonthWeekView bounds](self, "bounds");
      v22 = v21 - v16;
      -[MonthWeekView leadingMargin](self, "leadingMargin");
      v18 = v22 - v23;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekView monthTitleView](self, "monthTitleView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekView monthTitleView](self, "monthTitleView"));
    objc_msgSend(v25, "frame");
    objc_msgSend(v24, "setFrame:", v18, v12, v16);

  }
}

- (void)pressedOnCalendarDay:(int64_t)a3 cell:(id)a4 down:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;

  v5 = a5;
  v9 = a4;
  if ((objc_msgSend(v9, "isFutureDay") & 1) == 0)
  {
    objc_msgSend(v9, "pressToTransition:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekView delegate](self, "delegate"));
    objc_msgSend(v8, "week:pressedOnDay:down:", self, a3, v5);

  }
}

- (void)selectedCalendarDay:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isFutureDay") & 1) == 0)
  {
    objc_msgSend(v5, "pressToTransition:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekView delegate](self, "delegate"));
    objc_msgSend(v4, "week:cellSelected:", self, v5);

  }
}

- (void)setHasWorkout:(BOOL)a3 onDayIndex:(unint64_t)a4
{
  _BOOL8 v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekView dayCells](self, "dayCells"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", a4));

  objc_msgSend(v7, "setHasWorkout:", v5);
}

- (NSMutableArray)summaryIndexes
{
  return self->_summaryIndexes;
}

- (void)setSummaryIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_summaryIndexes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryIndexes, 0);
}

@end
