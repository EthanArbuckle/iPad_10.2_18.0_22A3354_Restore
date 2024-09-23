@implementation STUEnrollmentRecordDeleterResult

- (STUEnrollmentRecordDeleterResult)init
{
  return -[STUEnrollmentRecordDeleterResult initWithRemainingRecordsByIdentifier:error:](self, "initWithRemainingRecordsByIdentifier:error:", &__NSDictionary0__struct, 0);
}

- (STUEnrollmentRecordDeleterResult)initWithRemainingRecordsByIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  STUEnrollmentRecordDeleterResult *v8;
  NSDictionary *v9;
  NSDictionary *remainingRecordsByIdentifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STUEnrollmentRecordDeleterResult;
  v8 = -[STUEnrollmentRecordDeleterResult init](&v12, "init");
  if (v8)
  {
    v9 = (NSDictionary *)objc_msgSend(v6, "copy");
    remainingRecordsByIdentifier = v8->_remainingRecordsByIdentifier;
    v8->_remainingRecordsByIdentifier = v9;

    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v8;
}

- (NSDictionary)remainingRecordsByIdentifier
{
  return self->_remainingRecordsByIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_remainingRecordsByIdentifier, 0);
}

@end
