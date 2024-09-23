@implementation PLCPLDownloadContext

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<PLCPLDownloadContext resourceTypeDescription=%@ taskIdentifier=%@>"), self->_resourceTypeDescription, self->_taskIdentifier);
}

- (void)updateFromDownloadStatusUserInfo:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("progress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
  }
  else
  {
    v7 = NAN;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("completed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 >= 0.0)
    -[PLCPLDownloadContext setProgress:](self, "setProgress:", v7);
  -[PLCPLDownloadContext setCompleted:](self, "setCompleted:", v9);
  if (v10)
    -[PLCPLDownloadContext setError:](self, "setError:", v10);

}

- (NSString)taskIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTaskIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)resourceTypeDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResourceTypeDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (double)updateLastQueuedTime
{
  return self->_updateLastQueuedTime;
}

- (void)setUpdateLastQueuedTime:(double)a3
{
  self->_updateLastQueuedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_resourceTypeDescription, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

@end
