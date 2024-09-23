uint64_t start()
{
  void *v0;
  void *v1;

  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_opt_new(_DPServer);
  objc_msgSend(v1, "start");

  objc_autoreleasePoolPop(v0);
  return 0;
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}
