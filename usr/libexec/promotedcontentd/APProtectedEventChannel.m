@implementation APProtectedEventChannel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (APProtectedDestination)destination
{
  return self->_destination;
}

- (APProtectedEventChannel)initWithDestination:(id)a3 purpose:(int64_t)a4
{
  id v6;
  APProtectedEventChannel *v7;
  uint64_t v8;
  APProtectedDestination *destination;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APProtectedEventChannel;
  v7 = -[APProtectedEventChannel init](&v11, "init");
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "protectedDestination"));
    destination = v7->_destination;
    v7->_destination = (APProtectedDestination *)v8;

    v7->_purpose = a4;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APProtectedEventChannel destination](self, "destination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[APProtectedEventChannel purpose](self, "purpose")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v3, v4));

  return v5;
}

@end
