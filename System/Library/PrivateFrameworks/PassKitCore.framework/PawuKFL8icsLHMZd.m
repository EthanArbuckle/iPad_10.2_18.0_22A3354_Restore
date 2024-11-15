@implementation PawuKFL8icsLHMZd

- (PawuKFL8icsLHMZd)initWithSource:(unint64_t)a3
{
  PawuKFL8icsLHMZd *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PawuKFL8icsLHMZd;
  result = -[PawuKFL8icsLHMZd init](&v5, sel_init);
  result->_source = a3;
  return result;
}

- (PawuKFL8icsLHMZd)initWithEmailAddress:(id)a3 source:(unint64_t)a4
{
  NSString *v6;
  PawuKFL8icsLHMZd *v7;
  NSString *emailAddress;

  v6 = (NSString *)a3;
  v7 = -[PawuKFL8icsLHMZd initWithSource:](self, "initWithSource:", a4);
  emailAddress = v7->_emailAddress;
  v7->_emailAddress = v6;

  return v7;
}

- (PawuKFL8icsLHMZd)initWithPhoneNumber:(id)a3 source:(unint64_t)a4
{
  NSString *v6;
  PawuKFL8icsLHMZd *v7;
  NSString *phoneNumber;

  v6 = (NSString *)a3;
  v7 = -[PawuKFL8icsLHMZd initWithSource:](self, "initWithSource:", a4);
  phoneNumber = v7->_phoneNumber;
  v7->_phoneNumber = v6;

  return v7;
}

- (PawuKFL8icsLHMZd)initWithFullName:(id)a3 source:(unint64_t)a4
{
  NSString *v6;
  PawuKFL8icsLHMZd *v7;
  NSString *fullName;

  v6 = (NSString *)a3;
  v7 = -[PawuKFL8icsLHMZd initWithSource:](self, "initWithSource:", a4);
  fullName = v7->_fullName;
  v7->_fullName = v6;

  return v7;
}

- (PawuKFL8icsLHMZd)initWithFirstName:(id)a3 lastName:(id)a4 source:(unint64_t)a5
{
  NSString *v8;
  NSString *v9;
  PawuKFL8icsLHMZd *v10;
  NSString *firstName;
  NSString *v12;
  NSString *lastName;

  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  v10 = -[PawuKFL8icsLHMZd initWithSource:](self, "initWithSource:", a5);
  firstName = v10->_firstName;
  v10->_firstName = v8;
  v12 = v8;

  lastName = v10->_lastName;
  v10->_lastName = v9;

  return v10;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_storeStrong((id *)&self->_fullName, a3);
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddress, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
