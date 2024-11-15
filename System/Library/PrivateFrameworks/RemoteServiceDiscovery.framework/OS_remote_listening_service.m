@implementation OS_remote_listening_service

- (BOOL)shouldEncryptSocketData
{
  return _remote_service_properties_should_encrypt_socket_data(self->properties);
}

- (void)dealloc
{
  char *service_name;
  objc_super v4;

  service_name = (char *)self->service_name;
  if (service_name)
    free(service_name);
  v4.receiver = self;
  v4.super_class = (Class)OS_remote_listening_service;
  -[OS_remote_listening_service dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->next, 0);
  objc_storeStrong((id *)&self->proxies, 0);
  objc_storeStrong(&self->accept_block, 0);
  objc_storeStrong((id *)&self->properties, 0);
  objc_storeStrong((id *)&self->queue, 0);
}

@end
