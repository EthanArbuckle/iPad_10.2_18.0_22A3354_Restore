@implementation AnimationInfo

- (MonthViewOccurrence)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (MonthViewOccurrence)occurrenceView
{
  return self->_occurrenceView;
}

- (void)setOccurrenceView:(id)a3
{
  objc_storeStrong((id *)&self->_occurrenceView, a3);
}

- (EventSummaryData)summaryData
{
  return self->_summaryData;
}

- (void)setSummaryData:(id)a3
{
  objc_storeStrong((id *)&self->_summaryData, a3);
}

- (SingleDaySummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (NSString)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
  objc_storeStrong((id *)&self->_eventID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventID, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_summaryData, 0);
  objc_storeStrong((id *)&self->_occurrenceView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
