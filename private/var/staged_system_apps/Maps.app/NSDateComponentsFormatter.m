@implementation NSDateComponentsFormatter

+ (id)_maps_stringFromTimeInterval:(double)a3
{
  if (qword_1014D28A8 != -1)
    dispatch_once(&qword_1014D28A8, &stru_1011BA970);
  return objc_msgSend((id)qword_1014D28A0, "stringFromTimeInterval:", a3);
}

+ (id)_maps_stringLongFromTimeInterval:(double)a3
{
  if (qword_1014D28B8 != -1)
    dispatch_once(&qword_1014D28B8, &stru_1011BA990);
  return objc_msgSend((id)qword_1014D28B0, "stringFromTimeInterval:", a3);
}

@end
