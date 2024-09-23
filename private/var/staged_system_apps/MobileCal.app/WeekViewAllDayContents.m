@implementation WeekViewAllDayContents

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  double v10;
  double v11;
  double v12;
  double v13;
  id WeakRetained;
  id v15;

  v15 = a3;
  if (objc_msgSend(v15, "count") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anyObject"));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
      objc_opt_class(self);
      isKindOfClass = objc_opt_isKindOfClass(v7, v8);

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v6, "locationInView:", self);
        v11 = v10;
        v13 = v12;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "emptySpaceClickForCalendarWeekDayEventContent:atPoint:", self, v11, v13);

      }
    }
  }
  else
  {
    v6 = 0;
  }

}

- (WeekViewAllDayContentsDelegate)delegate
{
  return (WeekViewAllDayContentsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
