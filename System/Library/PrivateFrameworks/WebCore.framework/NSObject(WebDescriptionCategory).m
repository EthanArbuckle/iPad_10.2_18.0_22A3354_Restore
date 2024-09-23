@implementation NSObject(WebDescriptionCategory)

- (uint64_t)_web_description
{
  pthread_key_t *v2;
  _DWORD *v3;
  void *v4;
  objc_class *v5;
  uint64_t result;
  _QWORD *v7;

  if (!qword_1ECE81340 || !pthread_getspecific(*(_QWORD *)qword_1ECE81340))
    return objc_msgSend(a1, "_web_description");
  v2 = (pthread_key_t *)qword_1ECE81340;
  v3 = pthread_getspecific(*(_QWORD *)qword_1ECE81340);
  if (v3)
  {
    if (*v3)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = (objc_class *)objc_opt_class();
      return objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@>"), NSStringFromClass(v5));
    }
    return objc_msgSend(a1, "_web_description");
  }
  if (!WTF::Thread::mayBeGCThread(0))
  {
    v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    v7[1] = v2;
    pthread_setspecific(*v2, v7);
    *(_DWORD *)v7 = 0;
    return objc_msgSend(a1, "_web_description");
  }
  result = 195;
  __break(0xC471u);
  return result;
}

@end
