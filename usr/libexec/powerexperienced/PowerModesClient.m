@implementation PowerModesClient

- (PowerModesClient)initWithConnection:(id)a3 identifier:(id)a4 interestedModes:(id)a5
{
  id v9;
  id v10;
  id v11;
  PowerModesClient *v12;
  PowerModesClient *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PowerModesClient;
  v12 = -[PowerModesClient init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v13->_identifer, a4);
    objc_storeStrong((id *)&v13->_interestedModes, a5);
  }

  return v13;
}

- (NSString)identifer
{
  return self->_identifer;
}

- (void)setIdentifer:(id)a3
{
  objc_storeStrong((id *)&self->_identifer, a3);
}

- (NSSet)interestedModes
{
  return self->_interestedModes;
}

- (void)setInterestedModes:(id)a3
{
  objc_storeStrong((id *)&self->_interestedModes, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_interestedModes, 0);
  objc_storeStrong((id *)&self->_identifer, 0);
}

@end
