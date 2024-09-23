uint64_t OSLogCopyFormattedString(const char *a1)
{
  int v1;
  id v2;
  const __CFString *v3;

  v1 = strncmp(a1, "metrics", 8uLL);
  v2 = objc_alloc(MEMORY[0x24BDD1458]);
  if (v1)
    v3 = CFSTR("[Unknown signpost data]");
  else
    v3 = CFSTR("[Performance Metrics]");
  return objc_msgSend(v2, "initWithString:", v3);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

