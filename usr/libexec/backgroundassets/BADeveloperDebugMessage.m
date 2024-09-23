@implementation BADeveloperDebugMessage

- (BADeveloperDebugMessage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  BADeveloperDebugMessage *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BADeveloperDebugMessage;
  v6 = -[BADeveloperDebugMessage init](&v10, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v5), CFSTR("BAMessageVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v6->_messageVersion = (unint64_t)objc_msgSend(v8, "unsignedIntegerValue");

  }
  return v6;
}

- (BADeveloperDebugMessage)init
{
  BADeveloperDebugMessage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BADeveloperDebugMessage;
  result = -[BADeveloperDebugMessage init](&v3, "init");
  if (result)
    result->_messageVersion = 1;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BADeveloperDebugMessage messageVersion](self, "messageVersion")));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("BAMessageVersion"));

}

- (id)archivedRepresentationWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v9));
  v5 = v9;
  v6 = v5;
  if (v4)
  {
    v7 = v4;
  }
  else if (a3)
  {
    *a3 = objc_retainAutorelease(v5);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(unint64_t)a3
{
  self->_messageVersion = a3;
}

@end
