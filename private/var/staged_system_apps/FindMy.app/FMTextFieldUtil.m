@implementation FMTextFieldUtil

+ (BOOL)updateTextView:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  int64_t location;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil unformatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "unformatWithPhoneNumber:", v11));

  if (!qword_1005E5DE0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableCharacterSet decimalDigitCharacterSet](NSMutableCharacterSet, "decimalDigitCharacterSet"));
    objc_msgSend(v13, "addCharactersInString:", CFSTR("+"));
    v14 = (void *)qword_1005E5DE0;
    qword_1005E5DE0 = (uint64_t)v13;

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByTrimmingCharactersInSet:"));
  v16 = objc_msgSend(v15, "length");

  if (v16 || objc_msgSend(v9, "isEqualToString:", CFSTR("+")) && objc_msgSend(v12, "length"))
    goto LABEL_4;
  if (objc_msgSend(v9, "length"))
  {
    v21 = objc_msgSend(v10, "length");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9));
    v22 = objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil unformatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "unformatWithPhoneNumber:", v19));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil formatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "formatWithPhoneNumber:", v22));
    objc_msgSend(v8, "setText:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "beginningOfDocument"));
    if (v21 == (id)location)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionFromPosition:offset:", v24, objc_msgSend(v25, "length")));

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionFromPosition:offset:", v24, location + 1));
    }
    goto LABEL_17;
  }
  if (length != 1 || objc_msgSend(v9, "length"))
  {
LABEL_4:
    v17 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_5;
  }
  if ((_BYTE *)location == (char *)objc_msgSend(v10, "length") - 1)
  {
    if (objc_msgSend(v12, "length"))
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringToIndex:", (char *)objc_msgSend(v12, "length") - 1));
    else
      v26 = v12;
    v19 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil formatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "formatWithPhoneNumber:", v26));
    objc_msgSend(v8, "setText:", v28);
    v17 = 0;
    v18 = 0;
    goto LABEL_21;
  }
  v29 = location;
  if (location >= 1)
  {
    v29 = location;
    while (1)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", v29, 1));
      v31 = objc_msgSend(v30, "rangeOfCharacterFromSet:", qword_1005E5DE0);

      if (v31 != (id)0x7FFFFFFFFFFFFFFFLL)
        break;
      if (v29-- <= 1)
      {
        v29 = 0;
        break;
      }
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v29, 1, &stru_100568E20));
  v22 = objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil unformatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "unformatWithPhoneNumber:", v19));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil formatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "formatWithPhoneNumber:", v22));
  objc_msgSend(v8, "setText:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "beginningOfDocument"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionFromPosition:offset:", v34, location));

  if (v18)
    goto LABEL_18;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FMTextFieldUtil.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("start != nil"));
LABEL_17:

LABEL_18:
  v12 = (void *)v22;
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionFromPosition:offset:", v18, 0));
  v17 = (void *)v27;
  if (v18 && v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textRangeFromPosition:toPosition:", v18, v27));
    objc_msgSend(v8, "setSelectedTextRange:", v28);
LABEL_21:

  }
LABEL_5:

  return 0;
}

+ (BOOL)updateTextField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  int64_t location;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil unformatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "unformatWithPhoneNumber:", v11));

  if (!qword_1005E5DE8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableCharacterSet decimalDigitCharacterSet](NSMutableCharacterSet, "decimalDigitCharacterSet"));
    objc_msgSend(v13, "addCharactersInString:", CFSTR("+"));
    v14 = (void *)qword_1005E5DE8;
    qword_1005E5DE8 = (uint64_t)v13;

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByTrimmingCharactersInSet:"));
  v16 = objc_msgSend(v15, "length");

  if (v16 || objc_msgSend(v9, "isEqualToString:", CFSTR("+")) && objc_msgSend(v12, "length"))
    goto LABEL_4;
  if (objc_msgSend(v9, "length"))
  {
    v21 = objc_msgSend(v10, "length");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9));
    v22 = objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil unformatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "unformatWithPhoneNumber:", v19));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil formatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "formatWithPhoneNumber:", v22));
    objc_msgSend(v8, "setText:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "beginningOfDocument"));
    if (v21 == (id)location)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionFromPosition:offset:", v24, objc_msgSend(v25, "length")));

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionFromPosition:offset:", v24, location + 1));
    }
    goto LABEL_17;
  }
  if (length != 1 || objc_msgSend(v9, "length"))
  {
LABEL_4:
    v17 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_5;
  }
  if ((_BYTE *)location == (char *)objc_msgSend(v10, "length") - 1)
  {
    if (objc_msgSend(v12, "length"))
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringToIndex:", (char *)objc_msgSend(v12, "length") - 1));
    else
      v26 = v12;
    v19 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil formatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "formatWithPhoneNumber:", v26));
    objc_msgSend(v8, "setText:", v28);
    v17 = 0;
    v18 = 0;
    goto LABEL_21;
  }
  v29 = location;
  if (location >= 1)
  {
    v29 = location;
    while (1)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", v29, 1));
      v31 = objc_msgSend(v30, "rangeOfCharacterFromSet:", qword_1005E5DE8);

      if (v31 != (id)0x7FFFFFFFFFFFFFFFLL)
        break;
      if (v29-- <= 1)
      {
        v29 = 0;
        break;
      }
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v29, 1, &stru_100568E20));
  v22 = objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil unformatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "unformatWithPhoneNumber:", v19));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil formatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "formatWithPhoneNumber:", v22));
  objc_msgSend(v8, "setText:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "beginningOfDocument"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionFromPosition:offset:", v34, location));

  if (v18)
    goto LABEL_18;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FMTextFieldUtil.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("start != nil"));
LABEL_17:

LABEL_18:
  v12 = (void *)v22;
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionFromPosition:offset:", v18, 0));
  v17 = (void *)v27;
  if (v18 && v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textRangeFromPosition:toPosition:", v18, v27));
    objc_msgSend(v8, "setSelectedTextRange:", v28);
LABEL_21:

  }
LABEL_5:

  return 0;
}

@end
