@implementation CHOSLogForCategory

void __CHOSLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.TextRecognition", "General");
  v1 = (void *)CHOSLogForCategory_logObjects[0];
  CHOSLogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.TextRecognition", "Recognizer");
  v3 = (void *)qword_1EFF0FE80;
  qword_1EFF0FE80 = (uint64_t)v2;

  v4 = os_log_create("com.apple.TextRecognition", "RecognitionSession");
  v5 = (void *)qword_1EFF0FE88;
  qword_1EFF0FE88 = (uint64_t)v4;

  v6 = os_log_create("com.apple.TextRecognition", "StrokeGrouping");
  v7 = (void *)qword_1EFF0FE90;
  qword_1EFF0FE90 = (uint64_t)v6;

}

@end
