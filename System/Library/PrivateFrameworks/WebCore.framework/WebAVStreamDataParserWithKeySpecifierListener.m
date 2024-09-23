@implementation WebAVStreamDataParserWithKeySpecifierListener

- (void)streamDataParser:(id)a3 didProvideContentKeySpecifier:(id)a4 forTrackID:(int)a5
{
  char *parent;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v13;
  unsigned int v14;
  WTF::String *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  WTF::String *v20;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    parent = (char *)self->super._parent;
    v9 = (const void *)objc_msgSend(a4, "initializationData");
    v20 = (WTF::String *)a5;
    v10 = *((_QWORD *)parent + 15);
    if (v10)
    {
      v11 = *((_QWORD *)parent + 16);
      v19[0] = "SourceBufferParserAVFObjC";
      v19[1] = 26;
      v19[2] = "didProvideContentKeyRequestSpecifierForTrackID";
      v19[3] = v11;
      if (*(_BYTE *)(v10 + 12))
      {
        if (WebCore::LogMedia && byte_1ECE7C490 >= 3u)
          WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [11],unsigned long long>((WTF::Logger::LogSiteIdentifier *)v19, &v20);
      }
    }
    v13 = (unsigned int *)(parent + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 + 1, v13));
    if (v9)
      CFRetain(v9);
    v15 = v20;
    v16 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
    *v16 = &off_1E320CE68;
    v16[1] = parent;
    v16[2] = parent;
    v16[3] = v9;
    v16[4] = v15;
    v18 = v16;
    (*(void (**)(_QWORD, _QWORD **))(**((_QWORD **)parent + 2) + 16))(*((_QWORD *)parent + 2), &v18);
    v17 = v18;
    v18 = 0;
    if (v17)
      (*(void (**)(_QWORD *))(*v17 + 8))(v17);
  }
}

@end
