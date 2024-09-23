uint64_t start()
{
  void *v0;

  v0 = (void *)objc_opt_new(PKDServer);
  objc_msgSend(v0, "run");

  return 0;
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}
