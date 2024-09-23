@implementation WebAVAssetWriterDelegate

- (WebAVAssetWriterDelegate)initWithWriter:(void *)a3
{
  WebAVAssetWriterDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebAVAssetWriterDelegate;
  result = -[WebAVAssetWriterDelegate init](&v5, sel_init);
  if (result)
    result->m_writer = a3;
  return result;
}

- (void)assetWriter:(id)a3 didProduceFragmentedHeaderData:(id)a4
{
  char *m_writer;
  WTF *v6;
  WTF *v7;
  unsigned __int8 *v8;
  int v10;

  m_writer = (char *)self->m_writer;
  if (a4)
  {
    v6 = (WTF *)objc_msgSend(a4, "bytes", a3);
    v7 = (WTF *)objc_msgSend(a4, "length");
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = (unsigned __int8 *)(m_writer + 24);
  if (__ldaxr((unsigned __int8 *)m_writer + 24))
  {
    __clrex();
  }
  else if (!__stxr(1u, v8))
  {
    goto LABEL_8;
  }
  MEMORY[0x19AEA534C](m_writer + 24);
LABEL_8:
  WebCore::SharedBufferBuilder::ensureBuffer((uint64_t *)m_writer + 4);
  WebCore::FragmentedSharedBuffer::append(*((_QWORD *)m_writer + 4), v6, v7);
  v10 = __ldxr(v8);
  if (v10 != 1)
  {
    __clrex();
    goto LABEL_12;
  }
  if (__stlxr(0, v8))
LABEL_12:
    WTF::Lock::unlockSlow((WTF::Lock *)(m_writer + 24));
}

- (void)assetWriter:(id)a3 didProduceFragmentedMediaData:(id)a4 fragmentedMediaDataReport:(id)a5
{
  char *m_writer;
  WTF *v7;
  WTF *v8;
  unsigned __int8 *v9;
  int v11;

  m_writer = (char *)self->m_writer;
  if (a4)
  {
    v7 = (WTF *)objc_msgSend(a4, "bytes", a3);
    v8 = (WTF *)objc_msgSend(a4, "length");
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v9 = (unsigned __int8 *)(m_writer + 24);
  if (__ldaxr((unsigned __int8 *)m_writer + 24))
  {
    __clrex();
  }
  else if (!__stxr(1u, v9))
  {
    goto LABEL_8;
  }
  MEMORY[0x19AEA534C](m_writer + 24);
LABEL_8:
  WebCore::SharedBufferBuilder::ensureBuffer((uint64_t *)m_writer + 4);
  WebCore::FragmentedSharedBuffer::append(*((_QWORD *)m_writer + 4), v7, v8);
  v11 = __ldxr(v9);
  if (v11 != 1)
  {
    __clrex();
    goto LABEL_12;
  }
  if (__stlxr(0, v9))
LABEL_12:
    WTF::Lock::unlockSlow((WTF::Lock *)(m_writer + 24));
}

- (void)close
{
  self->m_writer = 0;
}

@end
