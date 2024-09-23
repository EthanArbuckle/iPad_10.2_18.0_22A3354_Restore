@implementation NFTagReadCALogger

- (NFTagReadCALogger)init
{
  char *v2;
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NFTagReadCALogger;
  v2 = -[NFTagReadCALogger init](&v7, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    v4 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v3;

    v5 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = 0;

    *((_QWORD *)v2 + 4) = 0;
    *((_QWORD *)v2 + 1) = 0;
    *((_QWORD *)v2 + 2) = 0;
    *((_DWORD *)v2 + 6) = 0;
    objc_msgSend(*((id *)v2 + 6), "removeAllObjects");
    objc_msgSend(*((id *)v2 + 6), "addEntriesFromDictionary:", &off_100306C40);
    *((_QWORD *)v2 + 7) = 0;
    *((_DWORD *)v2 + 16) = 0;
    *((_QWORD *)v2 + 9) = 0;
    *((_DWORD *)v2 + 20) = 0;
    *((_DWORD *)v2 + 37) = 0;
    v2[152] = 0;
    *(_WORD *)(v2 + 155) = 0;
    v2[157] = 0;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 116) = 0u;
  }
  return (NFTagReadCALogger *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_tagReadEventDict, 0);
  objc_storeStrong((id *)&self->_currentTag, 0);
}

@end
