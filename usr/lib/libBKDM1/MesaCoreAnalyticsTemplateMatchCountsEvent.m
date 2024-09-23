@implementation MesaCoreAnalyticsTemplateMatchCountsEvent

- (MesaCoreAnalyticsTemplateMatchCountsEvent)initWithName:(id)a3
{
  MesaCoreAnalyticsTemplateMatchCountsEvent *v3;
  MesaCoreAnalyticsTemplateMatchCountsEvent *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)MesaCoreAnalyticsTemplateMatchCountsEvent;
  v3 = -[MesaCoreAnalyticsEvent initWithName:](&v10, sel_initWithName_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = (int)*MEMORY[0x24BE0CF50];
    objc_msgSend(*(id *)((char *)&v3->super.super.super.isa + v5), "arrayByAddingObjectsFromArray:", &unk_251CB3B98);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(Class *)((char *)&v4->super.super.super.isa + v5);
    *(Class *)((char *)&v4->super.super.super.isa + v5) = (Class)v6;

  }
  else
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "self = [super initWithName:eventName]";
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v19 = 1024;
      v20 = 327;
      _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v4;
}

- (MesaCoreAnalyticsTemplateMatchCountsEvent)init
{
  return -[MesaCoreAnalyticsTemplateMatchCountsEvent initWithName:](self, "initWithName:", CFSTR("com.apple.biometrickit.mesa.templateMatchCounts"));
}

- (NSNumber)enrolledUsersCount
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setEnrolledUsersCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSNumber)activeUsersCount
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setActiveUsersCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUsersCount, 0);
  objc_storeStrong((id *)&self->_enrolledUsersCount, 0);
}

@end
