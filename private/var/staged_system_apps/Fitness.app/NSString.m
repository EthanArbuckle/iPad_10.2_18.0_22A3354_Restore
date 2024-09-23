@implementation NSString

+ (id)_meridianStringFormatter
{
  if (qword_10083DF98 != -1)
    dispatch_once(&qword_10083DF98, &stru_100779270);
  return (id)qword_10083DF90;
}

+ (id)_twelveHourFormatter
{
  if (qword_10083DFA8 != -1)
    dispatch_once(&qword_10083DFA8, &stru_100779290);
  return (id)qword_10083DFA0;
}

+ (id)attrStringWithValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSAttributedStringKey v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 22.0));
  v8 = NSFontAttributeName;
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v6 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v3, v5);

  return v6;
}

+ (id)timeIntervalHourMinuteFormatter:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;

  LODWORD(v3) = vcvtmd_s64_f64(a3 / 60.0);
  v4 = ((int)a3 % 60);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v5, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v7, 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("HR"), &stru_1007AE1D0, CFSTR("Localizable")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_1007AE1D0, CFSTR("Localizable")));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ %@ %@"), v6, v10, v8, v12));
  v13 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 22.0));
  objc_msgSend(v13, "addAttribute:value:range:", NSFontAttributeName, v15, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v13, "addAttribute:value:range:", NSFontAttributeName, v14, (char *)objc_msgSend(v6, "length") + 1, objc_msgSend(v10, "length"));
  objc_msgSend(v13, "addAttribute:value:range:", NSFontAttributeName, v15, (char *)objc_msgSend(v10, "length") + (_QWORD)objc_msgSend(v6, "length") + 2, objc_msgSend(v8, "length"));
  objc_msgSend(v13, "addAttribute:value:range:", NSFontAttributeName, v14, (char *)objc_msgSend(v6, "length")+ (unint64_t)objc_msgSend(v8, "length")+ (_QWORD)objc_msgSend(v10, "length")+ 3, objc_msgSend(v12, "length"));

  return v13;
}

+ (id)attrStringWithValue:(id)a3 unit:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)NSMutableAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v6, v5));
  v9 = objc_msgSend(v7, "initWithString:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 22.0));
  objc_msgSend(v9, "addAttribute:value:range:", NSFontAttributeName, v10, 0, objc_msgSend(v6, "length"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
  v12 = objc_msgSend(v6, "length");

  v13 = objc_msgSend(v5, "length");
  objc_msgSend(v9, "addAttribute:value:range:", NSFontAttributeName, v11, v12, v13);

  return v9;
}

+ (id)goalProgressAttrStringWithCurrentValue:(id)a3 goalValue:(id)a4 unitString:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", a3, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v9, 1));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v10, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "attrStringWithValue:unit:", v12, v8));

  return v13;
}

- (BOOL)isPhoneNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableCharacterSet decimalDigitCharacterSet](NSMutableCharacterSet, "decimalDigitCharacterSet"));
  objc_msgSend(v3, "addCharactersInString:", CFSTR("+()-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet controlCharacterSet](NSCharacterSet, "controlCharacterSet"));
  objc_msgSend(v3, "formUnionWithCharacterSet:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  objc_msgSend(v3, "formUnionWithCharacterSet:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByCharactersInSet:](self, "componentsSeparatedByCharactersInSet:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", &stru_1007AE1D0));

  LOBYTE(v6) = objc_msgSend(v7, "length") == 0;
  return (char)v6;
}

- (BOOL)isEmail
{
  if (qword_10083E068 != -1)
    dispatch_once(&qword_10083E068, &stru_100779DB8);
  return _objc_msgSend((id)qword_10083E060, "evaluateWithObject:", self);
}

- (id)destinationStripped
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableCharacterSet whitespaceAndNewlineCharacterSet](NSMutableCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet controlCharacterSet](NSCharacterSet, "controlCharacterSet"));
  objc_msgSend(v3, "formUnionWithCharacterSet:", v4);

  objc_msgSend(v3, "addCharactersInString:", CFSTR("\uFFFC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](self, "stringByTrimmingCharactersInSet:", v3));

  return v5;
}

@end
