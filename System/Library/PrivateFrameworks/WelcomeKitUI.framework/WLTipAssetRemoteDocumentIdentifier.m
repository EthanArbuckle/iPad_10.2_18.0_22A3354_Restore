@implementation WLTipAssetRemoteDocumentIdentifier

+ (void)initialize
{
  void *v2;

  v2 = (void *)documentIDs;
  documentIDs = (uint64_t)&unk_24E1542F8;

}

+ (id)documentIDs
{
  return (id)documentIDs;
}

+ (id)url:(id)a3
{
  return (id)objc_msgSend(CFSTR("https://ipcdn.apple.com/assets/v2/tips/"), "stringByAppendingString:", a3);
}

@end
