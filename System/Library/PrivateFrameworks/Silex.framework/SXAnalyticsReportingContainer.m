@implementation SXAnalyticsReportingContainer

- (void)registerAnalyticsReporting:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsReporting, a3);
}

- (SXAnalyticsReporting)analyticsReporting
{
  return self->_analyticsReporting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReporting, 0);
}

@end
