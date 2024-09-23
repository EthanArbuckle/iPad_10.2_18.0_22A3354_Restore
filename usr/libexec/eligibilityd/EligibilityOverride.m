@implementation EligibilityOverride

- (EligibilityOverride)init
{
  EligibilityOverride *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *overrideMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EligibilityOverride;
  v2 = -[EligibilityOverride init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    overrideMap = v2->_overrideMap;
    v2->_overrideMap = v3;

  }
  return v2;
}

- (void)forceDomain:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5
{
  id v8;
  const char *v9;
  EligibilityOverrideData *v10;
  void *v11;
  id v12;

  v8 = a5;
  if (a3 > 0x7D)
    v9 = "<Unknown Domain>";
  else
    v9 = off_1000305D8[a3];
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
  v10 = -[EligibilityOverrideData initWithAnswer:context:]([EligibilityOverrideData alloc], "initWithAnswer:context:", a4, v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

}

- (void)resetAnswerForDomain:(unint64_t)a3
{
  const char *v4;
  void *v5;
  id v6;

  if (a3 > 0x7D)
    v4 = "<Unknown Domain>";
  else
    v4 = off_1000305D8[a3];
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  objc_msgSend(v5, "removeObjectForKey:", v6);

}

- (void)resetAllAnswers
{
  NSMutableDictionary *v3;
  NSMutableDictionary *overrideMap;

  v3 = objc_opt_new(NSMutableDictionary);
  overrideMap = self->_overrideMap;
  self->_overrideMap = v3;

}

- (id)overrideResultDictionaryForDomain:(unint64_t)a3
{
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];
  _QWORD v16[3];

  if (a3 > 0x7D)
    v4 = "<Unknown Domain>";
  else
    v4 = off_1000305D8[a3];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));

    if (v8)
    {
      v15[0] = CFSTR("os_eligibility_answer_t");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "answer")));
      v16[0] = v9;
      v16[1] = &off_100033B30;
      v15[1] = CFSTR("os_eligibility_answer_source_t");
      v15[2] = CFSTR("context");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));
      v16[2] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));

    }
    else
    {
      v13[0] = CFSTR("os_eligibility_answer_t");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "answer")));
      v13[1] = CFSTR("os_eligibility_answer_source_t");
      v14[0] = v9;
      v14[1] = &off_100033B30;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("overrideMap"));

}

- (EligibilityOverride)initWithCoder:(id)a3
{
  id v4;
  EligibilityOverride *v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  NSMutableDictionary *v10;
  id v11;
  NSObject *v12;
  NSMutableDictionary *overrideMap;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EligibilityOverride;
  v5 = -[EligibilityOverride init](&v15, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSDictionary);
    v7 = objc_opt_class(NSString);
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(EligibilityOverrideData), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("overrideMap")));

    if (!v10)
    {
      v11 = sub_10000C5FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[EligibilityOverride initWithCoder:]";
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Failed to deserialize overrideMap, setting to default value", buf, 0xCu);
      }

      v10 = objc_opt_new(NSMutableDictionary);
    }
    overrideMap = v5->_overrideMap;
    v5->_overrideMap = v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setOverrideMap:", v7);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  EligibilityOverride *v4;
  uint64_t v5;
  EligibilityOverride *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;

  v4 = (EligibilityOverride *)a3;
  v13.receiver = self;
  v13.super_class = (Class)EligibilityOverride;
  if (!-[EligibilityOverride isEqual:](&v13, "isEqual:", v4))
    goto LABEL_9;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_11;
  }
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](v6, "overrideMap"));
    v9 = sub_1000163A4(v7, v8);

    if ((v9 & 1) == 0)
    {
      v10 = sub_10000C5FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[EligibilityOverride isEqual:]";
        v16 = 2080;
        v17 = "overrideMap";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }

    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
LABEL_11:

  return v9;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverride overrideMap](self, "overrideMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: overrides: %@>"), v3, v4));

  return v5;
}

- (NSMutableDictionary)overrideMap
{
  return self->_overrideMap;
}

- (void)setOverrideMap:(id)a3
{
  objc_storeStrong((id *)&self->_overrideMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMap, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
