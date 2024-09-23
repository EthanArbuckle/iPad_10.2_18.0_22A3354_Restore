@implementation WebView(WebPrivate)

- (_QWORD)_commonInitializationWithFrameName:()WebPrivate groupName:
{
  _QWORD *result;

  result = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *result = &off_1E9D6B138;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  *a1 = result;
  return result;
}

- (_QWORD)initSimpleHTMLDocumentWithStyle:()WebPrivate frame:preferences:groupName:
{
  _QWORD *result;

  result = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *result = &off_1E9D6B138;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  *a1 = result;
  return result;
}

@end
