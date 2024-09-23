@implementation MTAStopwatchLapTableViewController

- (void)setLapTimes:(id)a3
{
  objc_storeStrong((id *)&self->_lapTimes, a3);
}

- (MTAStopwatchLapTableViewController)initWithStyle:(int64_t)a3
{
  MTAStopwatchLapTableViewController *v3;
  NSMutableArray *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAStopwatchLapTableViewController;
  v3 = -[MTAStopwatchLapTableViewController initWithStyle:](&v6, "initWithStyle:", a3);
  if (v3)
  {
    v4 = objc_opt_new(NSMutableArray);
    -[MTAStopwatchLapTableViewController setLapTimes:](v3, "setLapTimes:", v4);

  }
  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  MTAStopwatchTableView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTAStopwatchLapTableViewController;
  -[MTAStopwatchLapTableViewController loadView](&v12, "loadView");
  v3 = -[MTAStopwatchTableView initWithFrame:style:]([MTAStopwatchTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MTAStopwatchLapTableViewController setTableView:](self, "setTableView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTAStopwatchLapCell), CFSTR("MTCurrentLapCell"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTAStopwatchLapCell), off_1000BEED0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setDelegate:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setDataSource:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setSeparatorInset:", 0.0, 15.0, 0.0, 15.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setCellLayoutMarginsFollowReadableWidth:", 0);

}

- (void)setCellStyle:(unint64_t)a3
{
  double v4;
  void *v5;
  id v6;

  if (self->_cellStyle != a3)
  {
    self->_cellStyle = a3;
    if (a3 - 2 > 2)
      v4 = 44.0;
    else
      v4 = dbl_10007A9A8[a3 - 2];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
    objc_msgSend(v5, "setEstimatedRowHeight:", v4);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
    objc_msgSend(v6, "reloadData");

  }
}

- (void)setShowsCurrentLap:(BOOL)a3
{
  id v3;

  if (self->_showsCurrentLap != a3)
  {
    self->_showsCurrentLap = a3;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
    objc_msgSend(v3, "reloadData");

  }
}

- (void)setCurrentInterval:(double)a3
{
  self->_currentInterval = a3;
  -[MTAStopwatchLapTableViewController _updateCurrentLapCell](self, "_updateCurrentLapCell");
}

- (void)_updateCurrentLapCell
{
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = -[MTAStopwatchLapTableViewController lapCount](self, "lapCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController currentLapCell](self, "currentLapCell"));
  objc_msgSend(v4, "setLap:", v3);

  -[MTAStopwatchLapTableViewController currentInterval](self, "currentInterval");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController currentLapCell](self, "currentLapCell"));
  objc_msgSend(v7, "setTime:", v6);

  -[MTAStopwatchLapTableViewController previousLapsTotalInterval](self, "previousLapsTotalInterval");
  v9 = v8;
  -[MTAStopwatchLapTableViewController currentInterval](self, "currentInterval");
  v11 = v9 + v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController currentLapCell](self, "currentLapCell"));
  objc_msgSend(v12, "setRunningTotal:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController currentLapCell](self, "currentLapCell"));
  objc_msgSend(v14, "setColor:", v13);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController currentLapCell](self, "currentLapCell"));
  objc_msgSend(v15, "setNeedsLayout");

}

- (void)addLap:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  objc_msgSend(v5, "addObject:", v6);

  -[MTAStopwatchLapTableViewController _updateLapExtrema](self, "_updateLapExtrema");
  -[MTAStopwatchLapTableViewController previousLapsTotalInterval](self, "previousLapsTotalInterval");
  -[MTAStopwatchLapTableViewController setPreviousLapsTotalInterval:](self, "setPreviousLapsTotalInterval:", v7 + a3);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
  objc_msgSend(v8, "reloadData");

}

- (void)setLaps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
  objc_msgSend(v5, "removeAllObjects");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
  objc_msgSend(v6, "addObjectsFromArray:", v4);

  -[MTAStopwatchLapTableViewController _updateLapExtrema](self, "_updateLapExtrema");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
  -[MTAStopwatchLapTableViewController runningTotalForLap:](self, "runningTotalForLap:", (char *)objc_msgSend(v7, "count") - 1);
  -[MTAStopwatchLapTableViewController setPreviousLapsTotalInterval:](self, "setPreviousLapsTotalInterval:");

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
  objc_msgSend(v8, "reloadData");

}

- (void)clearAllLaps
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
  objc_msgSend(v3, "removeAllObjects");

  -[MTAStopwatchLapTableViewController _updateLapExtrema](self, "_updateLapExtrema");
  -[MTAStopwatchLapTableViewController setPreviousLapsTotalInterval:](self, "setPreviousLapsTotalInterval:", 0.0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (unint64_t)lapCount
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4 + -[MTAStopwatchLapTableViewController showsCurrentLap](self, "showsCurrentLap");
}

- (double)runningTotalForLap:(int64_t)a3
{
  uint64_t v4;
  int64_t v5;
  double v6;
  void *v7;
  void *v8;
  double v9;

  if (a3 < 0)
    return 0.0;
  v4 = 0;
  v5 = a3 + 1;
  v6 = 0.0;
  do
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v4));
    objc_msgSend(v8, "doubleValue");
    v6 = v6 + v9;

    ++v4;
  }
  while (v5 != v4);
  return v6;
}

- (void)_updateLapExtrema
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  BOOL v24;
  void *v25;
  id v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 >= 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
    v14 = objc_msgSend(v13, "count");

    v15 = 0;
    v16 = 0;
    if ((unint64_t)v14 >= 2)
    {
      v16 = 0;
      v15 = 0;
      v17 = 1;
      do
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v17));
        objc_msgSend(v19, "doubleValue");
        v21 = v20;

        if (v21 < v8)
          v22 = v21;
        else
          v22 = v8;
        if (v21 < v8)
          v23 = v17;
        else
          v23 = v15;
        v24 = v21 <= v12;
        if (v21 <= v12)
          v8 = v22;
        else
          v12 = v21;
        if (v24)
          v15 = v23;
        if (!v24)
          v16 = v17;
        ++v17;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes", v22));
        v26 = objc_msgSend(v25, "count");

      }
      while (v17 < (unint64_t)v26);
    }
    -[MTAStopwatchLapTableViewController setLapExtrema:](self, "setLapExtrema:", v15, v16);
  }
  else
  {
    -[MTAStopwatchLapTableViewController setLapExtrema:](self, "setLapExtrema:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  +[MTAStopwatchLapCell cellHeightWithCellStyle:](MTAStopwatchLapCell, "cellHeightWithCellStyle:", -[MTAStopwatchLapTableViewController cellStyle](self, "cellStyle", a3, a4));
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  int64_t v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  v8 = -[MTAStopwatchLapTableViewController lapCount](self, "lapCount");
  v9 = v8 - (_QWORD)objc_msgSend(v6, "row");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
  v11 = objc_msgSend(v10, "count");

  if (v9 <= (uint64_t)v11)
    v12 = off_1000BEED0;
  else
    v12 = CFSTR("MTCurrentLapCell");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v12, v6));

  objc_msgSend(v13, "setLapStyle:", -[MTAStopwatchLapTableViewController cellStyle](self, "cellStyle"));
  if (v9 <= (uint64_t)v11)
  {
    v14 = (id)(v9 - 1);
    objc_msgSend(v13, "setLap:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableViewController lapTimes](self, "lapTimes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v14));
    objc_msgSend(v16, "doubleValue");
    objc_msgSend(v13, "setTime:");

    -[MTAStopwatchLapTableViewController runningTotalForLap:](self, "runningTotalForLap:", v14);
    objc_msgSend(v13, "setRunningTotal:");
    if (v14 == -[MTAStopwatchLapTableViewController lapExtrema](self, "lapExtrema"))
    {
      v17 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    }
    else
    {
      -[MTAStopwatchLapTableViewController lapExtrema](self, "lapExtrema");
      if (v14 == v18)
        v17 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      else
        v17 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
    }
    v19 = (void *)v17;
    objc_msgSend(v13, "setColor:", v17);

  }
  else
  {
    -[MTAStopwatchLapTableViewController setCurrentLapCell:](self, "setCurrentLapCell:", v13);
    -[MTAStopwatchLapTableViewController _updateCurrentLapCell](self, "_updateCurrentLapCell");
  }
  return v13;
}

- (double)currentInterval
{
  return self->_currentInterval;
}

- (BOOL)showsCurrentLap
{
  return self->_showsCurrentLap;
}

- (unint64_t)cellStyle
{
  return self->_cellStyle;
}

- (double)previousLapsTotalInterval
{
  return self->_previousLapsTotalInterval;
}

- (void)setPreviousLapsTotalInterval:(double)a3
{
  self->_previousLapsTotalInterval = a3;
}

- (NSMutableArray)lapTimes
{
  return self->_lapTimes;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)lapExtrema
{
  $2D0F6D2748D6811982654C412F18C8B0 *p_lapExtrema;
  int64_t fastestLapIndex;
  int64_t slowestLapIndex;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_lapExtrema = &self->_lapExtrema;
  fastestLapIndex = self->_lapExtrema.fastestLapIndex;
  slowestLapIndex = p_lapExtrema->slowestLapIndex;
  result.var1 = slowestLapIndex;
  result.var0 = fastestLapIndex;
  return result;
}

- (void)setLapExtrema:(id)a3
{
  self->_lapExtrema = ($2D0F6D2748D6811982654C412F18C8B0)a3;
}

- (MTAStopwatchLapCell)currentLapCell
{
  return self->_currentLapCell;
}

- (void)setCurrentLapCell:(id)a3
{
  objc_storeStrong((id *)&self->_currentLapCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLapCell, 0);
  objc_storeStrong((id *)&self->_lapTimes, 0);
}

@end
