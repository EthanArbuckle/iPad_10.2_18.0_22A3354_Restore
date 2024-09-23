@implementation RAPStorageHistoryContainer

+ (id)directionsRecordingStorage
{
  if (qword_1014D4470 != -1)
    dispatch_once(&qword_1014D4470, &stru_1011E9300);
  return (id)qword_1014D4468;
}

+ (id)searchRecordingStorage
{
  if (qword_1014D4480 != -1)
    dispatch_once(&qword_1014D4480, &stru_1011E9320);
  return (id)qword_1014D4478;
}

@end
