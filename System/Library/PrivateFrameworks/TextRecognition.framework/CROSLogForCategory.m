@implementation CROSLogForCategory

void __CROSLogForCategory_block_invoke()
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

  v0 = os_log_create("com.apple.TextRecognition", "General");
  v1 = (void *)CROSLogForCategory_logObjects[0];
  CROSLogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.TextRecognition", "Tracking");
  v3 = (void *)qword_1ED0B4990;
  qword_1ED0B4990 = (uint64_t)v2;

  v4 = os_log_create("com.apple.TextRecognition", "Detection");
  v5 = (void *)qword_1ED0B4998;
  qword_1ED0B4998 = (uint64_t)v4;

  v6 = os_log_create("com.apple.TextRecognition", "Recognition");
  v7 = (void *)qword_1ED0B49A0;
  qword_1ED0B49A0 = (uint64_t)v6;

  v8 = os_log_create("com.apple.TextRecognition", "Layout");
  v9 = (void *)qword_1ED0B49A8;
  qword_1ED0B49A8 = (uint64_t)v8;

  v10 = os_log_create("com.apple.TextRecognition", "TSR");
  v11 = (void *)qword_1ED0B49B0;
  qword_1ED0B49B0 = (uint64_t)v10;

  v12 = os_log_create("com.apple.TextRecognition", "Form");
  v13 = (void *)qword_1ED0B49B8;
  qword_1ED0B49B8 = (uint64_t)v12;

  v14 = os_log_create("com.apple.TextRecognition", "DD");
  v15 = (void *)qword_1ED0B49C0;
  qword_1ED0B49C0 = (uint64_t)v14;

}

@end
