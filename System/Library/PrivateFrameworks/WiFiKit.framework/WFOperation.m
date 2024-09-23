@implementation WFOperation

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isReady
{
  return 1;
}

- (void)start
{
  NSDate *v3;
  NSDate *start;

  self->_finished = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  start = self->_start;
  self->_start = v3;

}

- (void)finish
{
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      -[WFOperation name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate timeIntervalSinceNow](self->_start, "timeIntervalSinceNow");
      v8 = 138412546;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      _os_log_impl(&dword_219FC8000, v5, v4, "%@ finished.  Elapsed: %f seconds.", (uint8_t *)&v8, 0x16u);

    }
  }

  -[WFOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  self->_finished = 1;
  -[WFOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDate *start;
  double v10;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFOperation name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFOperation name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" %@"), v8);

  }
  start = self->_start;
  if (start)
  {
    -[NSDate timeIntervalSinceNow](start, "timeIntervalSinceNow");
    objc_msgSend(v6, "appendFormat:", CFSTR(" started: %f seconds"), -v10);
  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
