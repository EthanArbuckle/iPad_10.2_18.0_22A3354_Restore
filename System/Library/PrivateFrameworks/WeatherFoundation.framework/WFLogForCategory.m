@implementation WFLogForCategory

void __WFLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;

  v0 = os_log_create("com.apple.weatherservice", "WeatherFoundation");
  v1 = (void *)WFLogForCategory_logObjects[0];
  WFLogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.weatherservice", "WF_Favorites");
  v3 = (void *)qword_253DBA050;
  qword_253DBA050 = (uint64_t)v2;

  v4 = os_log_create("com.apple.weatherservice", "WF_Forecasts");
  v5 = (void *)qword_253DBA058;
  qword_253DBA058 = (uint64_t)v4;

  v6 = os_log_create("com.apple.weatherservice", "WF_Location");
  v7 = (void *)qword_253DBA060;
  qword_253DBA060 = (uint64_t)v6;

  v8 = os_log_create("com.apple.weatherservice", "WF_Service");
  v9 = (void *)qword_253DBA068;
  qword_253DBA068 = (uint64_t)v8;

  v10 = os_log_create("com.apple.weatherservice", "WF_ResponseCache");
  v11 = (void *)qword_253DBA070;
  qword_253DBA070 = (uint64_t)v10;

  v12 = os_log_create("com.apple.weatherservice", "WF_GeocodeCache");
  v13 = (void *)qword_253DBA078;
  qword_253DBA078 = (uint64_t)v12;

  v14 = os_log_create("com.apple.weatherservice", "WF_Parser");
  v15 = (void *)qword_253DBA080;
  qword_253DBA080 = (uint64_t)v14;

  v16 = os_log_create("com.apple.weatherservice", "WF_Reachability");
  v17 = (void *)qword_253DBA088;
  qword_253DBA088 = (uint64_t)v16;

  v18 = os_log_create("com.apple.weatherservice", "WF_RemoteConfig");
  v19 = (void *)qword_253DBA090;
  qword_253DBA090 = (uint64_t)v18;

  v20 = os_log_create("com.apple.weatherservice", "WF_AppSettings");
  v21 = (void *)qword_253DBA098;
  qword_253DBA098 = (uint64_t)v20;

}

@end
