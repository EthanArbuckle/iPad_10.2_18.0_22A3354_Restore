@implementation UGCSubmissionLookupTicket

- (void)fetchSubmissionForMuid:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  GEOMapServiceFeedbackReportTicket *v18;
  GEOMapServiceFeedbackReportTicket *ticket;
  GEOMapServiceFeedbackReportTicket *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24[2];
  id location;

  v8 = a4;
  v9 = a5;
  -[UGCSubmissionLookupTicket cancel](self, "cancel");
  v10 = v8;
  v11 = objc_alloc_init((Class)GEORPFilter);
  objc_msgSend(v11, "setPlaceMuid:", a3);
  v12 = objc_alloc_init((Class)GEORPFeedbackQueryParameters);
  objc_msgSend(v12, "setFilter:", v11);
  objc_msgSend(v12, "addFeedbackComponentType:", 4);
  v13 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  objc_msgSend(v13, "setQueryParameters:", v12);
  v14 = objc_alloc((Class)GEORPFeedbackRequest);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "defaultTraits"));
  v17 = objc_msgSend(v14, "initWithFeedbackRequestParameters:traits:", v13, v16);

  objc_msgSend(v17, "setUserInfo:", v10);
  v18 = (GEOMapServiceFeedbackReportTicket *)objc_claimAutoreleasedReturnValue(+[MSPFeedbackSubmissionTicket ticketForFeedbackRequest:](MSPFeedbackSubmissionTicket, "ticketForFeedbackRequest:", v17));
  ticket = self->_ticket;
  self->_ticket = v18;

  objc_initWeak(&location, self);
  v20 = self->_ticket;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100491018;
  v22[3] = &unk_1011B82C8;
  objc_copyWeak(v24, &location);
  v24[1] = (id)a3;
  v21 = v9;
  v23 = v21;
  -[GEOMapServiceFeedbackReportTicket submitWithHandler:networkActivity:](v20, "submitWithHandler:networkActivity:", v22, 0);

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

}

- (void)cancel
{
  -[GEOMapServiceFeedbackReportTicket cancel](self->_ticket, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
