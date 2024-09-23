@implementation RAPRecord

- (RAPRecord)initWithReportID:(id)a3 reportType:(int)a4 reportSummary:(id)a5 reportTitle:(id)a6 dateOfReportCreation:(id)a7 countryCodeUponCreation:(id)a8 reportStatus:(signed __int16)a9 contentData:(id)a10 communityIdentifier:(id)a11 rapResponse:(id)a12
{
  id v18;
  id v19;
  id v20;
  RAPRecord *v21;
  RAPRecord *v22;
  NSString *v23;
  NSString *reportSummary;
  NSString *v25;
  NSString *reportTitle;
  NSString *v27;
  NSString *countryCodeUponCreation;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v34 = a3;
  v35 = a5;
  v18 = a6;
  v33 = a7;
  v19 = a8;
  v32 = a10;
  v31 = a11;
  v20 = a12;
  v36.receiver = self;
  v36.super_class = (Class)RAPRecord;
  v21 = -[RAPRecord init](&v36, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_reportID, a3);
    v22->_reportType = a4;
    v23 = (NSString *)objc_msgSend(v35, "copy");
    reportSummary = v22->_reportSummary;
    v22->_reportSummary = v23;

    v25 = (NSString *)objc_msgSend(v18, "copy");
    reportTitle = v22->_reportTitle;
    v22->_reportTitle = v25;

    objc_storeStrong((id *)&v22->_dateOfReportCreation, a7);
    v27 = (NSString *)objc_msgSend(v19, "copy");
    countryCodeUponCreation = v22->_countryCodeUponCreation;
    v22->_countryCodeUponCreation = v27;

    v22->_reportStatus = a9;
    objc_storeStrong((id *)&v22->_contentData, a10);
    objc_storeStrong((id *)&v22->_communityIdentifier, a11);
    objc_storeStrong((id *)&v22->_rapResponse, a12);
    v22->_clientRevision = 1;
  }

  return v22;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRecord reportID](self, "reportID"));
  v4 = -[RAPRecord reportType](self, "reportType");
  if (v4 >= 0x16)
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v4));
  else
    v5 = off_1011B32E0[(int)v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRecord reportSummary](self, "reportSummary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRecord reportTitle](self, "reportTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRecord dateOfReportCreation](self, "dateOfReportCreation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRecord countryCodeUponCreation](self, "countryCodeUponCreation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", -[RAPRecord reportStatus](self, "reportStatus")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Report ID: %@, Report type: %@, Report summary: %@, Report title: %@, Report creation cate: %@, Report country code: %@, Report status: %@"), v3, v5, v6, v7, v8, v9, v10));

  return v11;
}

- (int)reportType
{
  return self->_reportType;
}

- (NSString)reportID
{
  return self->_reportID;
}

- (NSString)reportSummary
{
  return self->_reportSummary;
}

- (NSString)reportTitle
{
  return self->_reportTitle;
}

- (NSDate)dateOfReportCreation
{
  return self->_dateOfReportCreation;
}

- (NSString)countryCodeUponCreation
{
  return self->_countryCodeUponCreation;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (RapUserProfileRecord)contentData
{
  return self->_contentData;
}

- (void)setContentData:(id)a3
{
  objc_storeStrong((id *)&self->_contentData, a3);
}

- (signed)reportStatus
{
  return self->_reportStatus;
}

- (void)setReportStatus:(signed __int16)a3
{
  self->_reportStatus = a3;
}

- (int)clientRevision
{
  return self->_clientRevision;
}

- (void)setClientRevision:(int)a3
{
  self->_clientRevision = a3;
}

- (NSString)communityIdentifier
{
  return self->_communityIdentifier;
}

- (GEORPRapResponse)rapResponse
{
  return self->_rapResponse;
}

- (void)setRapResponse:(id)a3
{
  objc_storeStrong((id *)&self->_rapResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapResponse, 0);
  objc_storeStrong((id *)&self->_communityIdentifier, 0);
  objc_storeStrong((id *)&self->_contentData, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_countryCodeUponCreation, 0);
  objc_storeStrong((id *)&self->_dateOfReportCreation, 0);
  objc_storeStrong((id *)&self->_reportTitle, 0);
  objc_storeStrong((id *)&self->_reportSummary, 0);
  objc_storeStrong((id *)&self->_reportID, 0);
}

@end
