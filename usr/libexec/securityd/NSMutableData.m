@implementation NSMutableData

+ (NSMutableData)dataWithSpace:(unint64_t)a3 DEREncode:(id)a4
{
  uint64_t (**v5)(id, unint64_t, id);
  id v6;
  id v7;
  unint64_t v8;

  v5 = (uint64_t (**)(id, unint64_t, id))a4;
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", a3)));
  v7 = objc_msgSend(v6, "mutableBytes");
  v8 = v5[2](v5, a3, v7);

  if ((a3 & 0x8000000000000000) != 0 || (unint64_t)v7 > v8)
  {

    v6 = 0;
  }
  else
  {
    objc_msgSend(v6, "replaceBytesInRange:withBytes:length:", 0, v8 - (_QWORD)v7, 0, 0);
  }
  return (NSMutableData *)v6;
}

@end
