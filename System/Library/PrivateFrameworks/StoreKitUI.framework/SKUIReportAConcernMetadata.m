@implementation SKUIReportAConcernMetadata

- (NSURL)reportConcernURL
{
  return self->_reportConcernURL;
}

- (void)setReportConcernURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (SKUIReportAConcernReason)selectedReason
{
  return self->_selectedReason;
}

- (void)setSelectedReason:(id)a3
{
  objc_storeStrong((id *)&self->_selectedReason, a3);
}

- (NSString)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_selectedReason, 0);
  objc_storeStrong((id *)&self->_reportConcernURL, 0);
}

@end
