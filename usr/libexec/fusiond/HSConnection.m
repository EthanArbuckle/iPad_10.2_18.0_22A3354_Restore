@implementation HSConnection

+ (unsigned)portForServiceName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int16 v6;
  _QWORD v8[3];
  _QWORD v9[3];

  v8[0] = off_100014C38;
  v8[1] = off_100014C40;
  v9[0] = &off_100011F18;
  v9[1] = &off_100011F30;
  v8[2] = off_100014C48;
  v9[2] = &off_100011F48;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));

  v6 = (unsigned __int16)objc_msgSend(v5, "integerValue");
  return v6;
}

@end
