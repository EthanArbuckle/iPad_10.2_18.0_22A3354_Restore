uint64_t start()
{
  void *v0;

  v0 = objc_autoreleasePoolPush();
  +[RBDaemon run](RBDaemon, "run");
  objc_autoreleasePoolPop(v0);
  CFRunLoopRun();
  return 0;
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}
