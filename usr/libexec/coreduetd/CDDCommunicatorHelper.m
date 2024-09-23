@implementation CDDCommunicatorHelper

+ (id)sharedInstance
{
  void *v2;

  v2 = (void *)qword_100040E60;
  if (!qword_100040E60)
  {
    if (qword_100040E68 != -1)
      dispatch_once(&qword_100040E68, &stru_100038AB8);
    v2 = (void *)qword_100040E60;
  }
  return v2;
}

- (id)getNewThermalValueForOldValue:(id)a3
{
  return objc_msgSend((id)qword_100040E58, "objectForKeyedSubscript:", a3);
}

- (id)getOldThermalValueForNewValue:(id)a3
{
  return objc_msgSend((id)qword_100040E50, "objectForKeyedSubscript:", a3);
}

- (unint64_t)highestCommonVersionFor:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  unint64_t v12;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v16[0] = CFSTR("MaxVersion");
    v16[1] = CFSTR("MinVersion");
    v17[0] = &off_10003B110;
    v17[1] = &off_10003B110;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
    if (v7)
      goto LABEL_3;
  }
  v14[0] = CFSTR("MaxVersion");
  v14[1] = CFSTR("MinVersion");
  v15[0] = &off_10003B110;
  v15[1] = &off_10003B110;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
LABEL_3:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MaxVersion")));
  v9 = objc_msgSend(v8, "unsignedIntValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MaxVersion")));
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if (v9 >= v11)
    v12 = v11;
  else
    v12 = v9;

  return v12;
}

@end
