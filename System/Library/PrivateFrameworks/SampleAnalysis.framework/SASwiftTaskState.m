@implementation SASwiftTaskState

- (void)baseFunctionAddress
{
  _QWORD *v1;
  _QWORD *i;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    objc_msgSend(result, "threadState");
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "leafUserFrame");
    for (i = (_QWORD *)objc_claimAutoreleasedReturnValue(); ; i = v6)
    {
      v3 = v1;
      v1 = i;

      v4 = v1 ? (void *)v1[4] : 0;
      v5 = v4;

      if (!v5)
        break;
      if (v1)
        v6 = (void *)v1[4];
      else
        v6 = 0;
    }
    v7 = objc_msgSend(v1, "address");

    return (void *)v7;
  }
  return result;
}

+ (id)classDictionaryKey
{
  return CFSTR("SASwiftTaskState");
}

@end
