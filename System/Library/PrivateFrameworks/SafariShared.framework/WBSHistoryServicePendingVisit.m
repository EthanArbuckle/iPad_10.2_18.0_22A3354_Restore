@implementation WBSHistoryServicePendingVisit

- (WBSHistoryServicePendingVisit)initWithWithVisitIdentifier:(id)a3
{
  id v5;
  WBSHistoryServicePendingVisit *v6;
  WBSHistoryServicePendingVisit *v7;
  WBSHistoryServicePendingVisit *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServicePendingVisit;
  v6 = -[WBSHistoryServicePendingVisit init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visitIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (void)setTitle:(id)a3
{
  self->_operation |= 2uLL;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setAttributes:(unint64_t)a3
{
  self->_operation |= 4uLL;
  self->_attributes = a3;
}

- (NSString)urlString
{
  return -[WBSHistoryVisitIdentifier urlString](self->_visitIdentifier, "urlString");
}

- (double)visitTime
{
  double result;

  -[WBSHistoryVisitIdentifier visitTime](self->_visitIdentifier, "visitTime");
  return result;
}

- (unint64_t)score
{
  float v2;

  v2 = WBHistoryVisitWeightForAttributesAndOrigin(self->_attributes, self->_origin);
  return (int)WBSHistoryVisitScoreForWeightedVisitCount(v2);
}

- (WBSHistoryVisitIdentifier)visitIdentifier
{
  return self->_visitIdentifier;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_operation = a3;
}

- (WBSHistoryVisitIdentifier)sourceVisitIdentifier
{
  return self->_sourceVisitIdentifier;
}

- (void)setSourceVisitIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceVisitIdentifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)wasHTTPNonGet
{
  return self->_wasHTTPNonGet;
}

- (void)setWasHTTPNonGet:(BOOL)a3
{
  self->_wasHTTPNonGet = a3;
}

- (BOOL)loadSuccessful
{
  return self->_loadSuccessful;
}

- (void)setLoadSuccessful:(BOOL)a3
{
  self->_loadSuccessful = a3;
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sourceVisitIdentifier, 0);
  objc_storeStrong((id *)&self->_visitIdentifier, 0);
}

@end
