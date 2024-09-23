@implementation BKFirstBootKernelSemaphoreToken

- (BKFirstBootKernelSemaphoreToken)init
{
  BKFirstBootKernelSemaphoreToken *v2;
  sem_t *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKFirstBootKernelSemaphoreToken;
  v2 = -[BKFirstBootKernelSemaphoreToken init](&v6, "init");
  if (v2)
  {
    v3 = sem_open("backboardd.firstboot_check", 0);
    if (v3 == (sem_t *)-1)
    {
      v4 = 0;
    }
    else
    {
      sem_close(v3);
      v4 = 1;
    }
    v2->_semaphoreExists = v4;
  }
  return v2;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendBool:withName:", -[BKFirstBootKernelSemaphoreToken isTokenSet](self, "isTokenSet"), CFSTR("isTokenSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v5;
}

- (BOOL)isTokenSet
{
  return !self->_semaphoreExists;
}

- (void)unsetToken
{
  sem_t *v3;
  id v4;
  NSObject *v5;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;

  if (!self->_semaphoreExists)
  {
    v3 = sem_open("backboardd.firstboot_check", 512, 256, 0);
    if (v3 == (sem_t *)-1)
    {
      v4 = sub_1000597D0();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = *__error();
        *(_DWORD *)buf = 136446466;
        v8 = "backboardd.firstboot_check";
        v9 = 1024;
        v10 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to create semaphore %{public}s for first boot token. Error = %d", buf, 0x12u);
      }

    }
    else
    {
      self->_semaphoreExists = 1;
      sem_close(v3);
    }
  }
}

- (void)_revertToFirstBoot
{
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;

  if (self->_semaphoreExists)
  {
    if (sem_unlink("backboardd.firstboot_check"))
    {
      v3 = sub_1000597D0();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *__error();
        v6 = 136446466;
        v7 = "backboardd.firstboot_check";
        v8 = 1024;
        v9 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to delete semaphore %{public}s for first boot token. Error = %d", (uint8_t *)&v6, 0x12u);
      }

    }
    else
    {
      self->_semaphoreExists = 0;
    }
  }
}

+ (id)token
{
  return objc_alloc_init(BKFirstBootKernelSemaphoreToken);
}

@end
