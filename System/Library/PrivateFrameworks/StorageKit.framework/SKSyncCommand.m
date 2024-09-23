@implementation SKSyncCommand

- (void)onCallbackWithError:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SKSyncCommand setError:](self, "setError:", v4);
  if (v4)
  {
    SKGetOSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[SKSyncCommand onCallbackWithError:]";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_22FE50000, v5, OS_LOG_TYPE_ERROR, "%s: Error details: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (BOOL)returnWithError:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;

  -[SKSyncCommand error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v5)
  {
    -[SKSyncCommand error](self, "error");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[SKSyncCommand error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  return v7;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
