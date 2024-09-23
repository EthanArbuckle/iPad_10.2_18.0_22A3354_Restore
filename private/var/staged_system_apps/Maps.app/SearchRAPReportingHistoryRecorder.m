@implementation SearchRAPReportingHistoryRecorder

- (SearchRAPReportingHistoryRecorder)initWithTicket:(id)a3 auxiliaryControlsOrigin:(int64_t)a4
{
  id v7;
  SearchRAPReportingHistoryRecorder *v8;
  SearchRAPReportingHistoryRecorder *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchRAPReportingHistoryRecorder;
  v8 = -[SearchRAPReportingHistoryRecorder init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_ticket, a3);
    v9->_auxiliaryControlsOrigin = a4;
  }

  return v9;
}

- (void)recordItemInHistory
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)MSPMutableHistoryEntrySearch);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchRAPReportingHistoryRecorder ticket](self, "ticket"));
  v5 = objc_msgSend(v3, "initWithTicket:", v4);

  objc_msgSend(v5, "setTracksRAPReportingOnly:", 1);
  +[HistoryEntryRecentsItem saveSearch:completion:](HistoryEntryRecentsItem, "saveSearch:completion:", v5, &stru_1011E0A78);

}

- (MKMapServiceSearchTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
  objc_storeStrong((id *)&self->_ticket, a3);
}

- (int64_t)auxiliaryControlsOrigin
{
  return self->_auxiliaryControlsOrigin;
}

- (void)setAuxiliaryControlsOrigin:(int64_t)a3
{
  self->_auxiliaryControlsOrigin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
