@implementation RSDNetworkInterface

- (RSDNetworkInterface)initWithName:(const char *)a3 error:(id *)a4
{
  RSDNetworkInterface *v6;
  unsigned int v7;
  int v8;
  int v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  NSErrorDomain v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  RSDNetworkInterface *v19;
  char *v20;
  in6_addr *v21;
  objc_super v23;
  in6_addr v24;
  uint64_t v25;
  NSErrorUserInfoKey v26;
  void *v27;
  NSErrorUserInfoKey v28;
  void *v29;
  _OWORD v30[5];

  *(_QWORD *)v24.__u6_addr8 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v24.__u6_addr32[2] = 0xAAAAAAAAAAAAAAAALL;
  v23.receiver = self;
  v23.super_class = (Class)RSDNetworkInterface;
  v6 = -[RSDNetworkInterface init](&v23, "init");
  if (!v6)
  {
    v12 = 0;
    v16 = 0;
LABEL_10:
    v19 = 0;
    goto LABEL_18;
  }
  v7 = if_nametoindex(a3);
  v6->_index = v7;
  if (v7)
  {
    v8 = sub_10001DF14(a3, &v24, 0);
    if (!v8)
    {
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          v20 = strdup(a3);
          if (v20)
            break;
          __os_temporary_resource_shortage();
        }
      }
      else
      {
        v20 = strdup(a3);
        if (!v20)
          sub_100039C04(a3, &v25, v30);
      }
      v6->_name = v20;
      v21 = (in6_addr *)malloc_type_calloc(1uLL, 0x10uLL, 0x61D5536CuLL);
      if (!v21)
        sub_100039B2C(&v25, v30);
      v12 = 0;
      v6->_local_address = v21;
      *v21 = v24;
      goto LABEL_17;
    }
    v9 = v8;
    v26 = NSLocalizedDescriptionKey;
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("network_copy_interface_address_in6: %s"), strerror(v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v27 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));

    v13 = objc_alloc((Class)NSError);
    v14 = NSPOSIXErrorDomain;
    v15 = v9;
  }
  else
  {
    v28 = NSLocalizedDescriptionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to find interface index for name %s"), a3));
    v29 = v17;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));

    v13 = objc_alloc((Class)NSError);
    v14 = NSPOSIXErrorDomain;
    v15 = 22;
  }
  v18 = objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, v15, v12);
  v16 = v18;
  if (!v18)
  {
LABEL_17:
    v19 = v6;
    v16 = 0;
    goto LABEL_18;
  }
  if (!a4)
    goto LABEL_10;
  v16 = objc_retainAutorelease(v18);
  v19 = 0;
  *a4 = v16;
LABEL_18:

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_name);
  self->_name = 0;
  free(self->_local_address);
  self->_local_address = 0;
  v3.receiver = self;
  v3.super_class = (Class)RSDNetworkInterface;
  -[RSDNetworkInterface dealloc](&v3, "dealloc");
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (char)name
{
  return self->_name;
}

- (in6_addr)local_address
{
  return self->_local_address;
}

@end
