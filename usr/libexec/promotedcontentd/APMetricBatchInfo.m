@implementation APMetricBatchInfo

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setFileSystemToken:(id)a3
{
  objc_storeStrong(&self->_fileSystemToken, a3);
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)fileSystemToken
{
  return self->_fileSystemToken;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fileSystemToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unint64_t)metricsCount
{
  return self->_metricsCount;
}

- (void)setMetricsCount:(unint64_t)a3
{
  self->_metricsCount = a3;
}

@end
