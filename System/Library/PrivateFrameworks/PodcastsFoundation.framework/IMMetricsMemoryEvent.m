@implementation IMMetricsMemoryEvent

- (IMMetricsMemoryEvent)init
{
  IMMetricsMemoryEvent *v2;
  IMMetricsMemoryEvent *v3;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[8];
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMMetricsMemoryEvent;
  v2 = -[IMAMSMetricsEvent init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IMAMSMetricsEvent setEventType:](v2, "setEventType:", CFSTR("memory"));
    v7 = 0;
    memset(task_info_out, 0, sizeof(task_info_out));
    task_info_outCnt = 40;
    if (!task_info(*MEMORY[0x1E0C83DA0], 0x12u, task_info_out, &task_info_outCnt))
    {
      -[IMMetricsMemoryEvent setUsedBytes:](v3, "setUsedBytes:", *(_QWORD *)&task_info_out[3]);
      -[IMMetricsMemoryEvent setTotalBytes:](v3, "setTotalBytes:", *(_QWORD *)&task_info_out[1]);
    }
  }
  return v3;
}

- (void)setUsedBytes:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent im_setProperty:forBodyKey:](self, "im_setProperty:forBodyKey:", v4, CFSTR("usedBytes"));

}

- (unint64_t)usedBytes
{
  void *v2;
  unint64_t v3;

  -[IMMetricsMemoryEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("usedBytes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");

  return v3;
}

- (void)setTotalBytes:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent im_setProperty:forBodyKey:](self, "im_setProperty:forBodyKey:", v4, CFSTR("totalBytes"));

}

- (unint64_t)totalBytes
{
  void *v2;
  unint64_t v3;

  -[IMMetricsMemoryEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("totalBytes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");

  return v3;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMMetricsMemoryEvent;
  -[AMSMetricsEvent shortDescription](&v7, sel_shortDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %lu, %lu"), v4, -[IMMetricsMemoryEvent usedBytes](self, "usedBytes"), -[IMMetricsMemoryEvent totalBytes](self, "totalBytes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
