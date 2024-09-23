@implementation PPSMetricMonitorConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMode:updateInterval:updateDelegate:", 0, 1, 0.2);
}

+ (id)instrumentsConfiguration
{
  return (id)objc_msgSend((id)objc_opt_class(), "defaultConfiguration");
}

- (PPSMetricMonitorConfiguration)initWithMode:(int64_t)a3 updateInterval:(double)a4 updateDelegate:(BOOL)a5
{
  PPSMetricMonitorConfiguration *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PPSMetricMonitorConfiguration;
  result = -[PPSMetricMonitorConfiguration init](&v9, sel_init);
  if (result)
  {
    result->_mode = a3;
    result->_updateInterval = a4;
    result->_updateDelegate = a5;
    *(_WORD *)&result->_includeBackBoardUsage = 256;
  }
  return result;
}

- (PPSMetricMonitorConfiguration)initWithCoder:(id)a3
{
  id v4;
  PPSMetricMonitorConfiguration *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSMetricMonitorConfiguration;
  v5 = -[PPSMetricMonitorConfiguration init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mode = (int)objc_msgSend(v6, "intValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateInterval"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v5->_updateInterval = v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateDelegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_updateDelegate = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("includeBackBoardUsage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includeBackBoardUsage = objc_msgSend(v10, "BOOLValue");

    v5->_emitSignposts = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[PPSMetricMonitorConfiguration mode](self, "mode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("mode"));

  v7 = (void *)MEMORY[0x24BDD16E0];
  -[PPSMetricMonitorConfiguration updateInterval](self, "updateInterval");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("updateInterval"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PPSMetricMonitorConfiguration updateDelegate](self, "updateDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("updateDelegate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PPSMetricMonitorConfiguration includeBackBoardUsage](self, "includeBackBoardUsage"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("includeBackBoardUsage"));

}

- (id)description
{
  void *v3;
  int64_t v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[PPSMetricMonitorConfiguration mode](self, "mode");
  -[PPSMetricMonitorConfiguration updateInterval](self, "updateInterval");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("PPSMetricMonitorConfig(mode: %ld updateInterval: %f updateDelegate: %d includeBackBoardUsage: %d))"), v4, v5, -[PPSMetricMonitorConfiguration updateDelegate](self, "updateDelegate"), -[PPSMetricMonitorConfiguration includeBackBoardUsage](self, "includeBackBoardUsage"));
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (BOOL)updateDelegate
{
  return self->_updateDelegate;
}

- (void)setUpdateDelegate:(BOOL)a3
{
  self->_updateDelegate = a3;
}

- (BOOL)includeBackBoardUsage
{
  return self->_includeBackBoardUsage;
}

- (void)setIncludeBackBoardUsage:(BOOL)a3
{
  self->_includeBackBoardUsage = a3;
}

- (BOOL)emitSignposts
{
  return self->_emitSignposts;
}

- (void)setEmitSignposts:(BOOL)a3
{
  self->_emitSignposts = a3;
}

@end
