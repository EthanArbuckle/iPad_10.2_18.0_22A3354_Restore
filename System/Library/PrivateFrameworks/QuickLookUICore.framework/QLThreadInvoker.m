@implementation QLThreadInvoker

- (QLThreadInvoker)initWithConnection:(id)a3 data:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  QLThreadInvoker *v12;
  QLThreadInvoker *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)QLThreadInvoker;
  v12 = -[QLThreadInvoker init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v13->_data, a4);
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (void)connectionDidReceiveData:(id)a3
{
  objc_msgSend(a3, "connection:didReceiveData:", self->_connection, self->_data);
}

- (void)connectionDidReceiveDataLengthReceived:(id)a3
{
  NSURLConnection *connection;
  NSData *data;
  id v5;

  connection = self->_connection;
  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "connection:didReceiveData:lengthReceived:", connection, data, -[NSData length](data, "length"));

}

- (void)connectionDidFailWithError:(id)a3
{
  objc_msgSend(a3, "connection:didFailWithError:", self->_connection, self->_error);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
