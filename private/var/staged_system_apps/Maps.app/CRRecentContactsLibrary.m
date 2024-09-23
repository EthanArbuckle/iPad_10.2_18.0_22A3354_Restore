@implementation CRRecentContactsLibrary

+ (id)messageSourcesBundleIdentifiers
{
  if (qword_1014D3028 != -1)
    dispatch_once(&qword_1014D3028, &stru_1011C5310);
  return (id)qword_1014D3020;
}

+ (id)mailSourcesBundleIdentifiers
{
  if (qword_1014D3038 != -1)
    dispatch_once(&qword_1014D3038, &stru_1011C5330);
  return (id)qword_1014D3030;
}

+ (id)webSourcesBundleIdentifiers
{
  if (qword_1014D3048 != -1)
    dispatch_once(&qword_1014D3048, &stru_1011C5350);
  return (id)qword_1014D3040;
}

@end
