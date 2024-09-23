@implementation PCConfiguration

+ (void)fetchConfigurationForClass:(Class)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  PCSupportRequester *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(id, _QWORD);
  Class v14;
  uint8_t buf[16];

  v5 = (void (**)(id, _QWORD))a4;
  if (v5)
  {
    if ((Class)objc_opt_class() == a3)
    {
      APLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2153EB000, v9, OS_LOG_TYPE_ERROR, "Error: Configuration class method should be called from a subclass.", buf, 2u);
      }

      APSimulateCrash();
      v5[2](v5, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFD278], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class path](a3, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configurationForPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        ((void (**)(id, void *))v5)[2](v5, v8);
      }
      else
      {
        v10 = objc_alloc_init(PCSupportRequester);
        NSStringFromClass(a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = sub_2153ECA6C;
        v12[3] = &unk_24D33A7E0;
        v14 = a3;
        v13 = v5;
        -[PCSupportRequester fetchConfigurationForClass:completion:](v10, "fetchConfigurationForClass:completion:", v11, v12);

      }
    }
  }

}

@end
