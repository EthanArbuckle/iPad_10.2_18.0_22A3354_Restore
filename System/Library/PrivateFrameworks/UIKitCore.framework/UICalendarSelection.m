@implementation UICalendarSelection

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICalendarSelection;
  return -[UICalendarSelection init](&v3, sel_init);
}

- (void)setView:(id)a3
{
  id v4;

  v4 = a3;
  -[UICalendarSelection willMoveToCalendarView:](self, "willMoveToCalendarView:", v4);
  objc_storeWeak((id *)&self->_view, v4);

  -[UICalendarSelection didMoveToCalendarView](self, "didMoveToCalendarView");
}

- (BOOL)canSelectDate:(id)a3
{
  return 0;
}

- (BOOL)shouldDeselectDate:(id)a3
{
  return 0;
}

- (unint64_t)roundedEdgeForDate:(id)a3
{
  return 3;
}

- (BOOL)highlightsToday
{
  return 1;
}

- (BOOL)renderOverhangDays
{
  return 0;
}

- (UICalendarView)view
{
  return (UICalendarView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
}

@end
