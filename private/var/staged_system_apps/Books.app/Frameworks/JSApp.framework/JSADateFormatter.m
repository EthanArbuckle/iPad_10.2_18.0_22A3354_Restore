@implementation JSADateFormatter

+ (id)stringFromDateValue:(id)a3 dateStyleValue:(id)a4 timeStyleValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "isDate"))
  {
    v11 = 0;
    goto LABEL_6;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toDate"));
  if (!v11)
  {
LABEL_6:
    v13 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isString"))
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "toString"));
  else
    v12 = 0;
  if (objc_msgSend(v10, "isString"))
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "toString"));
  else
    v14 = 0;
  v15 = sub_6930((uint64_t)a1, v12);
  v16 = objc_msgSend(a1, "stringFromDate:dateStyle:timeStyle:", v11, v15, sub_6930((uint64_t)a1, v14));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v16);

LABEL_12:
  return v13;
}

+ (id)stringFromDateValue:(id)a3 dateFormatValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isDate"))
  {
    v8 = 0;
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toDate"));
  if (!v8)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isString"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toString"));
  else
    v9 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringFromDate:dateFormat:", v8, v9));

LABEL_9:
  return v10;
}

+ (id)stringFromDate:(id)a3 dateStyle:(unint64_t)a4 timeStyle:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  if (qword_B9F08 != -1)
    dispatch_once(&qword_B9F08, &stru_9DDF8);
  v8 = (id)qword_B9F00;
  objc_sync_enter(v8);
  objc_msgSend((id)qword_B9F00, "setDateStyle:", a4);
  objc_msgSend((id)qword_B9F00, "setTimeStyle:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_B9F00, "stringFromDate:", v7));
  objc_sync_exit(v8);

  return v9;
}

+ (id)stringFromDate:(id)a3 dateFormat:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSCalendarIdentifier v9;
  NSCalendarIdentifier v10;
  unsigned int v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (qword_B9F18 != -1)
    dispatch_once(&qword_B9F18, &stru_9DE18);
  v7 = (id)qword_B9F10;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_B9F10, "calendar"));
  v9 = (NSCalendarIdentifier)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarIdentifier"));
  v10 = v9;
  if (v9 == NSCalendarIdentifierGregorian)
  {

    goto LABEL_7;
  }
  v11 = objc_msgSend(v6, "containsString:", CFSTR("y"));

  if (v11)
  {
    v8 = v6;
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("G")));
LABEL_7:

  }
  objc_msgSend((id)qword_B9F10, "setLocalizedDateFormatFromTemplate:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_B9F10, "stringFromDate:", v5));
  objc_sync_exit(v7);

  return v12;
}

@end
