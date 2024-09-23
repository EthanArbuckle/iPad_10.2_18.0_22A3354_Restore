@implementation SCUIReportMessage

- (SCUIReportMessage)initWithDate:(id)a3 senderDisplayName:(id)a4 body:(id)a5 sensitiveImageCount:(int64_t)a6 sensitiveVideoCount:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  SCUIReportMessage *v15;
  uint64_t v16;
  NSDate *date;
  uint64_t v18;
  NSString *senderDisplayName;
  uint64_t v20;
  NSString *body;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SCUIReportMessage;
  v15 = -[SCUIReportMessage init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    date = v15->_date;
    v15->_date = (NSDate *)v16;

    v18 = objc_msgSend(v13, "copy");
    senderDisplayName = v15->_senderDisplayName;
    v15->_senderDisplayName = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    body = v15->_body;
    v15->_body = (NSString *)v20;

    v15->_sensitiveImageCount = a6;
    v15->_sensitiveVideoCount = a7;
  }

  return v15;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)senderDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)body
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)sensitiveImageCount
{
  return self->_sensitiveImageCount;
}

- (int64_t)sensitiveVideoCount
{
  return self->_sensitiveVideoCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_senderDisplayName, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
