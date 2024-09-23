@implementation PKLogForCategory

void __PKLogForCategory_block_invoke()
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

  v0 = os_log_create("com.apple.preferences", "Preferences");
  v1 = (void *)PKLogForCategory_logObjects[0];
  PKLogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.preferences", "LoadFirstPartyBundle");
  v3 = (void *)qword_1EE6CDA18;
  qword_1EE6CDA18 = (uint64_t)v2;

  v4 = os_log_create("com.apple.preferences", "LoadThirdPartyBundle");
  v5 = (void *)qword_1EE6CDA20;
  qword_1EE6CDA20 = (uint64_t)v4;

  v6 = os_log_create("com.apple.preferences", "Navigation");
  v7 = (void *)qword_1EE6CDA28;
  qword_1EE6CDA28 = (uint64_t)v6;

  v8 = os_log_create("com.apple.preferences", "Search");
  v9 = (void *)qword_1EE6CDA30;
  qword_1EE6CDA30 = (uint64_t)v8;

  v10 = os_log_create("com.apple.preferences", "Url");
  v11 = (void *)qword_1EE6CDA38;
  qword_1EE6CDA38 = (uint64_t)v10;

  v12 = os_log_create("com.apple.preferences", "Signposts");
  v13 = (void *)qword_1EE6CDA40;
  qword_1EE6CDA40 = (uint64_t)v12;

  v14 = os_log_create("com.apple.preferences", "Specifier Actions");
  v15 = (void *)qword_1EE6CDA48;
  qword_1EE6CDA48 = (uint64_t)v14;

}

@end
