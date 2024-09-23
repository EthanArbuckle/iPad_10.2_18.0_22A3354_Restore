@implementation RAPLayoutDownloader

- (RAPLayoutDownloader)initWithLayoutOptions:(id)a3
{
  id v5;
  RAPLayoutDownloader *v6;
  void *v7;
  uint64_t v8;
  GEOMapServiceTraits *traits;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RAPLayoutDownloader;
  v6 = -[RAPLayoutDownloader init](&v11, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultTraits"));
    traits = v6->_traits;
    v6->_traits = (GEOMapServiceTraits *)v8;

    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v6;
}

- (void)cancel
{
  GEOMapServiceFeedbackReportTicket *ticket;
  GEOMapServiceFeedbackReportTicket *v4;

  ticket = self->_ticket;
  if (ticket)
  {
    -[GEOMapServiceFeedbackReportTicket cancel](ticket, "cancel");
    v4 = self->_ticket;
    self->_ticket = 0;

  }
}

- (id)_generateRequestParams
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLayoutOptions initialLayoutParameters](self->_options, "initialLayoutParameters"));
  objc_msgSend(v3, "setLayoutConfigParameters:", v4);

  return v3;
}

- (void)fetchLayoutConfig:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  int BOOL;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GEOMapServiceFeedbackReportTicket *v12;
  GEOMapServiceFeedbackReportTicket *ticket;
  GEOMapServiceFeedbackReportTicket *v14;
  _QWORD v15[4];
  void (**v16)(id, uint64_t, _QWORD);
  id v17;
  char v18;
  id location;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  BOOL = GEOConfigGetBOOL(MapsConfig_RAPShouldCacheServerLayoutResults, off_1014B4158);
  v6 = BOOL;
  if (BOOL
    && (v7 = objc_claimAutoreleasedReturnValue(+[RAPLayoutCache configForLayoutType:](RAPLayoutCache, "configForLayoutType:", -[RAPLayoutOptions layoutType](self->_options, "layoutType")))) != 0)
  {
    v8 = (void *)v7;
    v4[2](v4, v7, 0);

  }
  else
  {
    if (self->_ticket)
      -[RAPLayoutDownloader cancel](self, "cancel");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLayoutDownloader _generateRequestParams](self, "_generateRequestParams"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLayoutOptions reportedMapItem](self->_options, "reportedMapItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geoMapItem"));
    v12 = (GEOMapServiceFeedbackReportTicket *)objc_claimAutoreleasedReturnValue(+[MSPFeedbackSubmissionTicket ticketForFeedbackRequestParameters:mapItem:traits:](MSPFeedbackSubmissionTicket, "ticketForFeedbackRequestParameters:mapItem:traits:", v9, v11, self->_traits));
    ticket = self->_ticket;
    self->_ticket = v12;

    objc_initWeak(&location, self);
    v14 = self->_ticket;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100599ED4;
    v15[3] = &unk_1011BBF98;
    objc_copyWeak(&v17, &location);
    v18 = v6;
    v16 = v4;
    -[GEOMapServiceFeedbackReportTicket submitWithHandler:networkActivity:](v14, "submitWithHandler:networkActivity:", v15, 0);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (id)_extractLayoutFormFromResponse:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = -[RAPLayoutDownloader _geoFormTypeForOptions](self, "_geoFormTypeForOptions");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "feedbackResult", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutConfigResult"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "forms"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "formType") == v5)
        {
          v14 = v13;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (int)_geoFormTypeForOptions
{
  unint64_t v2;

  v2 = -[RAPLayoutOptions layoutType](self->_options, "layoutType");
  if (v2 > 5)
    return 0;
  else
    return dword_100E391D8[v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
