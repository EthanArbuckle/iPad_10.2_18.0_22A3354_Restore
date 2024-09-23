@implementation PPFlightAirport

- (PPFlightAirport)initWithName:(id)a3 iataCode:(id)a4 role:(unsigned __int8)a5
{
  id v9;
  id v10;
  PPFlightAirport *v11;
  PPFlightAirport *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PPFlightAirport;
  v11 = -[PPFlightAirport init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    objc_storeStrong((id *)&v12->_iataCode, a4);
    v12->_role = a5;
  }

  return v12;
}

- (BOOL)isEqualToPPFlightAirport:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PPFlightAirport iataCode](self, "iataCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iataCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)iataCode
{
  return self->_iataCode;
}

- (unsigned)role
{
  return self->_role;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iataCode, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
