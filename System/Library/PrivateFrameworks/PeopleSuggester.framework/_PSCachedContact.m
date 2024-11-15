@implementation _PSCachedContact

- (_PSCachedContact)initWithExpirationDate:(id)a3 contact:(id)a4
{
  id v7;
  id v8;
  _PSCachedContact *v9;
  _PSCachedContact *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSCachedContact;
  v9 = -[_PSCachedContact init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_expirationDate, a3);
    objc_storeStrong((id *)&v10->_contact, a4);
  }

  return v10;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
