@implementation SWTSettings

- (SWTSettings)initWithTransparencySettings:(id)a3
{
  id v4;
  SWTSettings *v5;
  SWTSettings *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SWTSettings;
  v5 = -[SWTSettings init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[SWTSettings setPccEnvironment:](v5, "setPccEnvironment:", 0);
    -[SWTSettings setAtEnvironment:](v6, "setAtEnvironment:", 0);
    -[SWTSettings setTransparencySettings:](v6, "setTransparencySettings:", v4);
  }

  return v6;
}

- (SWTSettings)init
{
  id v3;
  SWTSettings *v4;

  v3 = objc_alloc_init((Class)TransparencySettings);
  v4 = -[SWTSettings initWithTransparencySettings:](self, "initWithTransparencySettings:", v3);

  return v4;
}

- (BOOL)allowsInternalSecurityPolicies
{
  return os_variant_allows_internal_security_policies("com.apple.Transparency", a2);
}

- (void)readPCCPreferences:(id)a3
{
  void (**v4)(id, unint64_t);
  NSObject *v5;
  CFPropertyListRef v6;
  void *v7;
  CFTypeID v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = (void (**)(id, unint64_t))a3;
  if (qword_10012A7E0 != -1)
    dispatch_once(&qword_10012A7E0, &stru_1001066D8);
  v5 = qword_10012A7E8;
  if (os_log_type_enabled((os_log_t)qword_10012A7E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Using PrivateCloudCompute soft-link fallback", buf, 2u);
  }
  v6 = CFPreferencesCopyAppValue(CFSTR("environment"), CFSTR("com.apple.privateCloudCompute"));
  if (v6 && (v7 = (void *)v6, v8 = CFGetTypeID(v6), v8 == CFStringGetTypeID()))
  {
    -[SWTSettings determineATEnvironmentFromPCCEnvironment:completion:](self, "determineATEnvironmentFromPCCEnvironment:completion:", v7, v4);

  }
  else
  {
    if (qword_10012A7E0 != -1)
      dispatch_once(&qword_10012A7E0, &stru_1001066F8);
    v9 = qword_10012A7E8;
    if (os_log_type_enabled((os_log_t)qword_10012A7E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using PrivateCloudCompute environment (soft-link fallback): carry", v10, 2u);
    }
    -[SWTSettings setPccEnvironment:](self, "setPccEnvironment:", 6);
    -[SWTSettings setAtEnvironment:](self, "setAtEnvironment:", -[SWTSettings pccEnvironment](self, "pccEnvironment"));
    v4[2](v4, -[SWTSettings atEnvironment](self, "atEnvironment"));
  }

}

- (void)determineATEnvironmentFromPCCEnvironment:(id)a3 completion:(id)a4
{
  __CFString *v6;
  void (**v7)(id, unint64_t);
  uint64_t v8;
  NSObject *v9;
  int v10;
  __CFString *v11;

  v6 = (__CFString *)a3;
  v7 = (void (**)(id, unint64_t))a4;
  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("dev")) & 1) != 0)
  {
    v8 = 1;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("ephemeral")) & 1) != 0)
  {
    v8 = 2;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("perf")) & 1) != 0)
  {
    v8 = 3;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("qa")) & 1) != 0)
  {
    v8 = 4;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("staging")) & 1) != 0)
  {
    v8 = 5;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("production")) & 1) != 0)
  {
    v8 = 7;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("qa2Primary")) & 1) != 0)
  {
    v8 = 8;
  }
  else
  {
    if (!-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("qa2Internal")))
      goto LABEL_18;
    v8 = 9;
  }
  -[SWTSettings setPccEnvironment:](self, "setPccEnvironment:", v8);
LABEL_18:
  if (!-[SWTSettings pccEnvironment](self, "pccEnvironment"))
  {
    -[SWTSettings setPccEnvironment:](self, "setPccEnvironment:", 6);

    v6 = CFSTR("carry");
  }
  -[SWTSettings setAtEnvironment:](self, "setAtEnvironment:", -[SWTSettings pccEnvironment](self, "pccEnvironment"));
  if (qword_10012A7E0 != -1)
    dispatch_once(&qword_10012A7E0, &stru_100106718);
  v9 = qword_10012A7E8;
  if (os_log_type_enabled((os_log_t)qword_10012A7E8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using PrivateCloudCompute environment: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  v7[2](v7, -[SWTSettings atEnvironment](self, "atEnvironment"));

}

- (void)initializeATEnvironmentWithCompletion:(id)a3
{
  void (**v4)(id, unint64_t);
  void *v5;
  unsigned __int8 v6;
  CFPropertyListRef v7;
  void *v8;
  CFTypeID v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  id v15;
  _QWORD v16[5];
  void (**v17)(id, unint64_t);
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 buf;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;

  v4 = (void (**)(id, unint64_t))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWTSettings transparencySettings](self, "transparencySettings"));
  v6 = objc_msgSend(v5, "allowsInternalSecurityPolicies");

  if ((v6 & 1) != 0)
  {
    v7 = CFPreferencesCopyAppValue(CFSTR("ATEnvironment"), CFSTR("com.apple.swtransparency"));
    if (!v7 || (v8 = (void *)v7, v9 = CFGetTypeID(v7), v9 != CFStringGetTypeID()))
    {
LABEL_29:
      if (-[SWTSettings pccEnvironment](self, "pccEnvironment"))
      {
        -[SWTSettings setAtEnvironment:](self, "setAtEnvironment:", -[SWTSettings pccEnvironment](self, "pccEnvironment"));
        v4[2](v4, -[SWTSettings atEnvironment](self, "atEnvironment"));
      }
      else
      {
        v18 = 0;
        v19 = &v18;
        v20 = 0x2050000000;
        v13 = (void *)qword_10012A7F0;
        v21 = qword_10012A7F0;
        if (!qword_10012A7F0)
        {
          *(_QWORD *)&buf = _NSConcreteStackBlock;
          *((_QWORD *)&buf + 1) = 3221225472;
          v23 = sub_1000155BC;
          v24 = &unk_1001067E8;
          v25 = &v18;
          sub_1000155BC((uint64_t)&buf);
          v13 = (void *)v19[3];
        }
        v14 = objc_retainAutorelease(v13);
        _Block_object_dispose(&v18, 8);
        v15 = [v14 alloc];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100015424;
        v16[3] = &unk_1001067A0;
        v16[4] = self;
        v17 = v4;
        objc_msgSend(v15, "selectedEnvironmentNameWithCompletionHandler:", v16);

      }
      goto LABEL_34;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("prod")) & 1) != 0)
    {
      v10 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("carry")) & 1) != 0)
    {
      v10 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("QA1")) & 1) != 0)
    {
      v10 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("InternalQA1")) & 1) != 0)
    {
      v10 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("QA2")) & 1) != 0)
    {
      v10 = 8;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("InternalQA2")))
      {
LABEL_22:
        if (-[SWTSettings atEnvironment](self, "atEnvironment"))
        {
          if (qword_10012A7E0 != -1)
            dispatch_once(&qword_10012A7E0, &stru_100106758);
          v12 = qword_10012A7E8;
          if (os_log_type_enabled((os_log_t)qword_10012A7E8, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v8;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Using PrivateCloudCompute environment (swt override): %{public}@", (uint8_t *)&buf, 0xCu);
          }
          v4[2](v4, -[SWTSettings atEnvironment](self, "atEnvironment"));

          goto LABEL_34;
        }

        goto LABEL_29;
      }
      v10 = 9;
    }
    -[SWTSettings setAtEnvironment:](self, "setAtEnvironment:", v10);
    goto LABEL_22;
  }
  -[SWTSettings setAtEnvironment:](self, "setAtEnvironment:", 7);
  if (qword_10012A7E0 != -1)
    dispatch_once(&qword_10012A7E0, &stru_100106738);
  v11 = qword_10012A7E8;
  if (os_log_type_enabled((os_log_t)qword_10012A7E8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Customer build using PrivateCloudCompute environment: production", (uint8_t *)&buf, 2u);
  }
  v4[2](v4, -[SWTSettings atEnvironment](self, "atEnvironment"));
LABEL_34:

}

- (TransparencySettingsProtocol)transparencySettings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTransparencySettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)pccEnvironment
{
  return self->_pccEnvironment;
}

- (void)setPccEnvironment:(unint64_t)a3
{
  self->_pccEnvironment = a3;
}

- (unint64_t)atEnvironment
{
  return self->_atEnvironment;
}

- (void)setAtEnvironment:(unint64_t)a3
{
  self->_atEnvironment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencySettings, 0);
}

@end
