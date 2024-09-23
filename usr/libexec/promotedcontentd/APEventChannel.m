@implementation APEventChannel

- (APProtectedEventChannel)protectedEventChannel
{
  APProtectedEventChannel *v3;
  void *v4;
  APProtectedEventChannel *v5;

  v3 = [APProtectedEventChannel alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APEventChannel destination](self, "destination"));
  v5 = -[APProtectedEventChannel initWithDestination:purpose:](v3, "initWithDestination:purpose:", v4, -[APEventChannel purpose](self, "purpose"));

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APEventChannel destination](self, "destination"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = -[APEventChannel purpose](self, "purpose") ^ v4;

  return v5;
}

- (APDestination)destination
{
  return self->_destination;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (APEventChannel)initWithDestination:(id)a3 purpose:(int64_t)a4
{
  id v7;
  APEventChannel *v8;
  APEventChannel *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APEventChannel;
  v8 = -[APEventChannel init](&v11, "init");
  if (v8)
  {
    if (!v7 || !isExternalPurpose(a4))
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v8->_destination, a3);
    v8->_purpose = a4;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
}

+ (id)unused
{
  if (qword_100269A10 != -1)
    dispatch_once(&qword_100269A10, &stru_1002157A8);
  return (id)qword_100269A08;
}

- (BOOL)isEqualToEventChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APEventChannel destination](self, "destination"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  if (objc_msgSend(v5, "isEqualToDestination:", v6))
  {
    v7 = -[APEventChannel purpose](self, "purpose");
    v8 = v7 == objc_msgSend(v4, "purpose");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  APEventChannel *v4;
  APEventChannel *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (APEventChannel *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v7 = 1;
    goto LABEL_7;
  }
  v6 = objc_opt_class(APEventChannel);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = -[APEventChannel isEqualToEventChannel:](self, "isEqualToEventChannel:", v5);
  else
LABEL_5:
    v7 = 0;
LABEL_7:

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APEventChannel destination](self, "destination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[APEventChannel purpose](self, "purpose")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v3, v4));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APEventChannel)initWithCoder:(id)a3
{
  id v4;
  APEventChannel *v5;
  id v6;
  uint64_t v7;
  APDestination *destination;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APEventChannel;
  v5 = -[APEventChannel init](&v10, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(APDestination), CFSTR("destination"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    destination = v5->_destination;
    v5->_destination = (APDestination *)v7;

    v5->_purpose = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("purpose"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APEventChannel destination](self, "destination"));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("destination"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[APEventChannel purpose](self, "purpose"), CFSTR("purpose"));
}

@end
