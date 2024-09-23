void start(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  +[NSError _setFileNameLocalizationEnabled:](NSError, "_setFileNameLocalizationEnabled:", 0);
  v4 = APRunServerUntilTheEndOfTime(a1, a2);
  APRunServerUntilTheEndOfTime(v4, v5);
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}
