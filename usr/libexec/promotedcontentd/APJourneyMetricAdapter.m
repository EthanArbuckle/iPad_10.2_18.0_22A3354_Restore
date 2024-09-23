@implementation APJourneyMetricAdapter

+ (id)translateWithPromotedContent:(int64_t)a3 placement:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  id v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = a3;
  v7 = 7030;
  switch(v8)
  {
    case 1:
      v7 = 7031;
      break;
    case 2:
      v7 = 7032;
      break;
    case 3:
      v7 = 7033;
      break;
    case 4:
      v7 = 7034;
      break;
    case 5:
      if (a4 - 7005 >= 4)
        v7 = 0;
      else
        v7 = qword_1001B8620[a4 - 7005];
      break;
    default:
      break;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("type"));

  v10 = objc_msgSend(v6, "copy");
  return v10;
}

@end
