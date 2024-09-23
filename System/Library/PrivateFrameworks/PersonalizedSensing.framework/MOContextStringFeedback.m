@implementation MOContextStringFeedback

- (MOContextStringFeedback)initWithContextStringIdentifier:(id)a3
{
  id v5;
  MOContextStringFeedback *v6;
  MOContextStringFeedback *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOContextStringFeedback;
  v6 = -[MOContextStringFeedback init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stringIdentifier, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *stringIdentifier;
  id v5;

  stringIdentifier = self->_stringIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", stringIdentifier, CFSTR("stringIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_textString, CFSTR("textString"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_score, CFSTR("score"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_usage, CFSTR("usage"));

}

- (MOContextStringFeedback)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MOContextStringFeedback *v6;
  uint64_t v7;
  NSString *textString;
  uint64_t v9;
  NSDate *timestamp;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOContextStringFeedback initWithContextStringIdentifier:](self, "initWithContextStringIdentifier:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textString"));
    v7 = objc_claimAutoreleasedReturnValue();
    textString = v6->_textString;
    v6->_textString = (NSString *)v7;

    v6->_score = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("score"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v9 = objc_claimAutoreleasedReturnValue();
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v9;

    v6->_mode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
    v6->_usage = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("usage"));
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSUUID *stringIdentifier;
  void *v7;
  NSString *textString;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());
  stringIdentifier = self->_stringIdentifier;
  objc_msgSend(v4, "stringIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(stringIdentifier) = -[NSUUID isEqual:](stringIdentifier, "isEqual:", v7);

  textString = self->_textString;
  objc_msgSend(v4, "textString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(textString) = -[NSString isEqual:](textString, "isEqual:", v9);
  return v5 & stringIdentifier & textString;
}

- (id)describeFeedbackMode
{
  return +[MOContextStringFeedback describeFeedbackMode:](MOContextStringFeedback, "describeFeedbackMode:", -[MOContextStringFeedback mode](self, "mode"));
}

+ (id)describeFeedbackMode:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("System");
  if (a3 == 2)
    return CFSTR("User");
  else
    return (id)v3;
}

- (id)describeUsageFeedback
{
  return +[MOContextStringFeedback describeUsageFeedback:](MOContextStringFeedback, "describeUsageFeedback:", -[MOContextStringFeedback usage](self, "usage"));
}

+ (id)describeUsageFeedback:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("Unknown");
  else
    return off_251442618[a3 - 1];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MOContextStringFeedback stringIdentifier](self, "stringIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextStringFeedback textString](self, "textString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextStringFeedback timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOContextStringFeedback score](self, "score");
  -[MOContextStringFeedback describeFeedbackMode](self, "describeFeedbackMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextStringFeedback describeUsageFeedback](self, "describeUsageFeedback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("stringIdentifier, %@, string, %@, timestamp, %@, score ,%lu, mode, %@, usage, %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOContextStringFeedback *v4;
  void *v5;
  MOContextStringFeedback *v6;
  void *v7;
  void *v8;

  v4 = [MOContextStringFeedback alloc];
  -[MOContextStringFeedback stringIdentifier](self, "stringIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOContextStringFeedback initWithContextStringIdentifier:](v4, "initWithContextStringIdentifier:", v5);

  -[MOContextStringFeedback textString](self, "textString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextStringFeedback setTextString:](v6, "setTextString:", v7);

  -[MOContextStringFeedback timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextStringFeedback setTimestamp:](v6, "setTimestamp:", v8);

  -[MOContextStringFeedback setScore:](v6, "setScore:", -[MOContextStringFeedback score](self, "score"));
  -[MOContextStringFeedback setMode:](v6, "setMode:", -[MOContextStringFeedback mode](self, "mode"));
  -[MOContextStringFeedback setUsage:](v6, "setUsage:", -[MOContextStringFeedback usage](self, "usage"));
  return v6;
}

- (NSString)textString
{
  return self->_textString;
}

- (void)setTextString:(id)a3
{
  objc_storeStrong((id *)&self->_textString, a3);
}

- (NSUUID)stringIdentifier
{
  return self->_stringIdentifier;
}

- (void)setStringIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stringIdentifier, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (unint64_t)score
{
  return self->_score;
}

- (void)setScore:(unint64_t)a3
{
  self->_score = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(unint64_t)a3
{
  self->_usage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_stringIdentifier, 0);
  objc_storeStrong((id *)&self->_textString, 0);
}

@end
