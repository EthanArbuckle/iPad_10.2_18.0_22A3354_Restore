@implementation VIUserFeedback

- (VIUserFeedback)initWithImage:(id)a3 payload:(id)a4 reportIdentifier:(id)a5
{
  return -[VIUserFeedback initWithImage:userFeedbackPayload:sfReportData:reportIdentifier:](self, "initWithImage:userFeedbackPayload:sfReportData:reportIdentifier:", a3, a4, 0, a5);
}

- (VIUserFeedback)initWithImage:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5 reportIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VIUserFeedback *v15;
  VIUserFeedback *v16;
  uint64_t v17;
  NSData *userFeedbackPayload;
  uint64_t v19;
  NSData *sfReportData;
  uint64_t v21;
  NSString *reportIdentifier;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)VIUserFeedback;
  v15 = -[VIUserFeedback init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_image, a3);
    v17 = objc_msgSend(v12, "copy");
    userFeedbackPayload = v16->_userFeedbackPayload;
    v16->_userFeedbackPayload = (NSData *)v17;

    v19 = objc_msgSend(v13, "copy");
    sfReportData = v16->_sfReportData;
    v16->_sfReportData = (NSData *)v19;

    v21 = objc_msgSend(v14, "copy");
    reportIdentifier = v16->_reportIdentifier;
    v16->_reportIdentifier = (NSString *)v21;

  }
  return v16;
}

- (VIImageContent)image
{
  return self->_image;
}

- (NSData)userFeedbackPayload
{
  return self->_userFeedbackPayload;
}

- (NSData)sfReportData
{
  return self->_sfReportData;
}

- (NSString)reportIdentifier
{
  return self->_reportIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportIdentifier, 0);
  objc_storeStrong((id *)&self->_sfReportData, 0);
  objc_storeStrong((id *)&self->_userFeedbackPayload, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
