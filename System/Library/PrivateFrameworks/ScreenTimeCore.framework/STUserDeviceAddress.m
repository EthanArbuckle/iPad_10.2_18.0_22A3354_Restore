@implementation STUserDeviceAddress

+ (id)fetchOrCreateUserDeviceAddressWithUser:(id)a3 device:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  STUserDeviceAddress *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "fetchRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ && %K == %@"), CFSTR("user"), v10, CFSTR("device"), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v14);

  objc_msgSend(v13, "execute:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((unint64_t)objc_msgSend(v15, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 8, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[STLog persistence](STLog, "persistence");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[STUserDeviceAddress fetchOrCreateUserDeviceAddressWithUser:device:context:error:].cold.1((uint64_t)v17, v18);

      if (a6)
        *a6 = objc_retainAutorelease(v17);

    }
    objc_msgSend(v16, "firstObject");
    v19 = (STUserDeviceAddress *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v19 = -[STUserDeviceAddress initWithContext:]([STUserDeviceAddress alloc], "initWithContext:", v12);
      -[STUserDeviceAddress setUser:](v19, "setUser:", v10);
      -[STUserDeviceAddress setDevice:](v19, "setDevice:", v11);
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (void)fetchOrCreateUserDeviceAddressWithUser:(uint64_t)a1 device:(NSObject *)a2 context:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_ERROR, "Multiple user-device addresses for a user and device pairing in database: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
