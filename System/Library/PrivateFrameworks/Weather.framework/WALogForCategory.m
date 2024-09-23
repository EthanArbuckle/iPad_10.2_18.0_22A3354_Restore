@implementation WALogForCategory

void __WALogForCategory_block_invoke()
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
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;
  os_log_t v26;
  void *v27;
  os_log_t v28;
  void *v29;

  v0 = os_log_create("com.apple.weather", "Weather");
  v1 = (void *)WALogForCategory_logObjects[0];
  WALogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.weather", "WeatherData");
  v3 = (void *)qword_253F33778;
  qword_253F33778 = (uint64_t)v2;

  v4 = os_log_create("com.apple.weather", "DUET");
  v5 = (void *)qword_253F33780;
  qword_253F33780 = (uint64_t)v4;

  v6 = os_log_create("com.apple.weather", "Left-Of-Home");
  v7 = (void *)qword_253F33788;
  qword_253F33788 = (uint64_t)v6;

  v8 = os_log_create("com.apple.weather", "Location");
  v9 = (void *)qword_253F33790;
  qword_253F33790 = (uint64_t)v8;

  v10 = os_log_create("com.apple.weather", "Routing");
  v11 = (void *)qword_253F337B8;
  qword_253F337B8 = (uint64_t)v10;

  v12 = os_log_create("com.apple.weather", "Preferences");
  v13 = (void *)qword_253F33798;
  qword_253F33798 = (uint64_t)v12;

  v14 = os_log_create("com.apple.weather", "PrefsMigration");
  v15 = (void *)qword_253F337E0;
  qword_253F337E0 = (uint64_t)v14;

  v16 = os_log_create("com.apple.weather", "Reachability");
  v17 = (void *)qword_253F337A0;
  qword_253F337A0 = (uint64_t)v16;

  v18 = os_log_create("com.apple.weather", "Privacy");
  v19 = (void *)qword_253F337D0;
  qword_253F337D0 = (uint64_t)v18;

  v20 = os_log_create("com.apple.weather", "Search");
  v21 = (void *)qword_253F337A8;
  qword_253F337A8 = (uint64_t)v20;

  v22 = os_log_create("com.apple.weather", "ORB");
  v23 = (void *)qword_253F337B0;
  qword_253F337B0 = (uint64_t)v22;

  v24 = os_log_create("com.apple.weather", "Today Notification Center");
  v25 = (void *)qword_253F337C0;
  qword_253F337C0 = (uint64_t)v24;

  v26 = os_log_create("com.apple.weather", "Watch");
  v27 = (void *)qword_253F337C8;
  qword_253F337C8 = (uint64_t)v26;

  v28 = os_log_create("com.apple.weather", "Next Hour");
  v29 = (void *)qword_253F337D8;
  qword_253F337D8 = (uint64_t)v28;

}

@end
