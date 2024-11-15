@implementation CalendarsViewControllerPreservedState

- (EKCalendar)centeredCalendar
{
  return self->_centeredCalendar;
}

- (void)setCenteredCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_centeredCalendar, a3);
}

- (EKAbstractCalendarEditor)displayedEditor
{
  return self->_displayedEditor;
}

- (void)setDisplayedEditor:(id)a3
{
  objc_storeStrong((id *)&self->_displayedEditor, a3);
}

- (NSArray)presentedViewControllersState
{
  return self->_presentedViewControllersState;
}

- (void)setPresentedViewControllersState:(id)a3
{
  objc_storeStrong((id *)&self->_presentedViewControllersState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedViewControllersState, 0);
  objc_storeStrong((id *)&self->_displayedEditor, 0);
  objc_storeStrong((id *)&self->_centeredCalendar, 0);
}

@end
