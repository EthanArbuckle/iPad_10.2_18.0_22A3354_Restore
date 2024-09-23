uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  FILE *v8;
  FILE *v9;
  id v10;
  id v12;
  id v13;

  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_opt_new(APMaintenanceHandle);
  v13 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "getStateDumpWithError:", &v13));
  v3 = v13;

  if (v2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleWithStandardOutput](NSFileHandle, "fileHandleWithStandardOutput"));
    v12 = v3;
    v5 = objc_msgSend(v2, "writeToFileHandle:error:", v4, &v12);
    v6 = v12;

    if ((v5 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v9 = __stderrp;
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description")));
      fprintf(v9, "could not dump: %s\n", (const char *)objc_msgSend(v10, "UTF8String"));

      v7 = 1;
    }
  }
  else
  {
    v8 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    fprintf(v8, "could not get dump: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));
    v7 = 1;
    v6 = v3;
  }

  objc_autoreleasePoolPop(v0);
  return v7;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_fileHandleWithStandardOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleWithStandardOutput");
}

id objc_msgSend_getStateDumpWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStateDumpWithError:");
}

id objc_msgSend_writeToFileHandle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFileHandle:error:");
}
