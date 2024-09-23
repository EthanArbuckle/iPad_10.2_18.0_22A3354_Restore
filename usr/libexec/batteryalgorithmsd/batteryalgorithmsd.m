uint64_t start()
{
  void *v0;
  char *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_autoreleasePoolPush();
  v1 = sub_100003A48("main");
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_100008008;
  qword_100008008 = v2;

  objc_autoreleasePoolPop(v0);
  return 0;
}

char *sub_100003A48(char *category)
{
  if (category)
    category = (char *)os_log_create("com.apple.batteryalgorithms", category);
  return category;
}

id objc_msgSend_algorithmWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "algorithmWithData:");
}
