@implementation RTHangsMetrics

- (RTHangsMetrics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTHangsMetrics;
  return -[RTHangsMetrics init](&v3, sel_init);
}

- (void)submitToCoreAnalytics:(id)a3 type:(int64_t)a4 duration:(double)a5
{
  void *v8;
  const char *label;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v8 = (void *)MEMORY[0x24BDD17C8];
  label = dispatch_queue_get_label(0);
  v10 = a3;
  objc_msgSend(v8, "stringWithCString:encoding:", label, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("- "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("hungObject"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("hangType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("hangDuration"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("hungQueue"));
  v17 = objc_alloc(MEMORY[0x24BDD17C8]);
  v18 = (void *)objc_msgSend(v17, "initWithCString:encoding:", RTAnalyticsEventHangsMetrics, 1);
  log_analytics_submission(v18, v14);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

@end
