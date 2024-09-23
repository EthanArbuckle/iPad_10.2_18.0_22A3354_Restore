@implementation EligibilityOverrideData

- (EligibilityOverrideData)initWithAnswer:(unint64_t)a3 context:(id)a4
{
  id v6;
  EligibilityOverrideData *v7;
  EligibilityOverrideData *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EligibilityOverrideData;
  v7 = -[EligibilityOverrideData init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[EligibilityOverrideData setAnswer:](v7, "setAnswer:", a3);
    -[EligibilityOverrideData setContext:](v8, "setContext:", v6);
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[EligibilityOverrideData answer](self, "answer")));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("answer"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[EligibilityOverrideData context](self, "context"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("context"));

}

- (EligibilityOverrideData)initWithCoder:(id)a3
{
  id v4;
  EligibilityOverrideData *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *context;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EligibilityOverrideData;
  v5 = -[EligibilityOverrideData init](&v15, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("answer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_answer = (unint64_t)objc_msgSend(v7, "unsignedIntegerValue");

    v8 = objc_opt_class(NSDictionary);
    v9 = objc_opt_class(NSString);
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, objc_opt_class(NSNumber), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("context")));
    context = v5->_context;
    v5->_context = (NSDictionary *)v12;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAnswer:", -[EligibilityOverrideData answer](self, "answer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverrideData context](self, "context"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setContext:", v7);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[EligibilityOverrideData answer](self, "answer");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverrideData context](self, "context"));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  EligibilityOverrideData *v4;
  uint64_t v5;
  EligibilityOverrideData *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;

  v4 = (EligibilityOverrideData *)a3;
  v16.receiver = self;
  v16.super_class = (Class)EligibilityOverrideData;
  if (-[EligibilityOverrideData isEqual:](&v16, "isEqual:", v4))
  {
    if (v4 == self)
    {
      v11 = 1;
      goto LABEL_16;
    }
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = -[EligibilityOverrideData answer](self, "answer");
      if (v7 == (id)-[EligibilityOverrideData answer](v6, "answer"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverrideData context](self, "context"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverrideData context](v6, "context"));
        v10 = sub_1000163A4(v8, v9);

        if ((v10 & 1) != 0)
        {
          v11 = 1;
LABEL_15:

          goto LABEL_16;
        }
        v14 = sub_10000C5FC();
        v13 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "-[EligibilityOverrideData isEqual:]";
          v19 = 2080;
          v20 = "context";
          goto LABEL_13;
        }
      }
      else
      {
        v12 = sub_10000C5FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "-[EligibilityOverrideData isEqual:]";
          v19 = 2080;
          v20 = "answer";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
        }
      }

      v11 = 0;
      goto LABEL_15;
    }
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityOverrideData context](self, "context"));
  v4 = v3;
  if (v3)
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
  else
    v5 = CFSTR("<NULL>");
  v6 = objc_opt_class(self);
  v7 = sub_10000C4A8(-[EligibilityOverrideData answer](self, "answer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: answer: %@; context: %@>"),
                   v6,
                   v8,
                   v5));

  return v9;
}

- (unint64_t)answer
{
  return self->_answer;
}

- (void)setAnswer:(unint64_t)a3
{
  self->_answer = a3;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
