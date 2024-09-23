@implementation SUInstallPolicy

- (SUInstallPolicy)init
{
  return -[SUInstallPolicy initWithInstallPolicyType:](self, "initWithInstallPolicyType:", 0);
}

- (SUInstallPolicy)initWithInstallPolicyType:(unint64_t)a3
{
  SUInstallPolicy *v4;
  SUInstallPolicy *v5;
  NSString *clientName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUInstallPolicy;
  v4 = -[SUInstallPolicy init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    clientName = v4->_clientName;
    v4->_clientName = 0;

    -[SUInstallPolicy _setType:](v5, "_setType:", a3);
    *(_WORD *)&v5->_autoUpdateEnabled = 0;
  }
  return v5;
}

- (void)_setClientName:(id)a3
{
  id v5;
  NSString **p_clientName;
  NSString *clientName;
  id v8;

  v5 = a3;
  clientName = self->_clientName;
  p_clientName = &self->_clientName;
  v8 = v5;
  if (!-[NSString isEqualToString:](clientName, "isEqualToString:"))
    objc_storeStrong((id *)p_clientName, a3);

}

- (void)_setType:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v12 = +[SUUtility currentReleaseTypeIsInternal](SUUtility, "currentReleaseTypeIsInternal");
  self->_type = a3;
  if (a3 == 1)
  {
    SULogInfo(CFSTR("Setting required install policy of 3 days"), v5, v6, v7, v8, v9, v10, v11, v36);
    -[SUInstallPolicy setSkipsAllowed:](self, "setSkipsAllowed:", 3);
    if (v12)
    {
      SULogInfo(CFSTR("[Apple Internal] Reducing required install policy to 1"), v21, v22, v23, v24, v25, v26, v27, v38);
      v20 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("Unknown InstallPolicyType provided: %@"), v29, v30, v31, v32, v33, v34, v35, (uint64_t)v28);

      v20 = -1;
      goto LABEL_9;
    }
    SULogInfo(CFSTR("Setting default install policy of 7 days"), v5, v6, v7, v8, v9, v10, v11, v36);
    -[SUInstallPolicy setSkipsAllowed:](self, "setSkipsAllowed:", 7);
    if (v12)
    {
      SULogInfo(CFSTR("[Apple Internal] Reducing required install policy to 3"), v13, v14, v15, v16, v17, v18, v19, v37);
      v20 = 3;
LABEL_9:
      -[SUInstallPolicy setSkipsAllowed:](self, "setSkipsAllowed:", v20);
    }
  }
}

- (void)_setAutoUpdateEnabled:(BOOL)a3
{
  if (self->_autoUpdateEnabled != a3)
    self->_autoUpdateEnabled = a3;
}

- (void)_setDarkBoolEnabled:(BOOL)a3
{
  if (self->_useDarkBoot != a3)
    self->_useDarkBoot = a3;
}

- (BOOL)isEqual:(id)a3
{
  SUInstallPolicy *v4;
  SUInstallPolicy *v5;
  SUInstallPolicy *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v13;

  v4 = (SUInstallPolicy *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[SUInstallPolicy clientName](self, "clientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUInstallPolicy clientName](v6, "clientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8)
      && (v9 = -[SUInstallPolicy type](self, "type"), v9 == -[SUInstallPolicy type](v6, "type"))
      && (v10 = -[SUInstallPolicy autoUpdateEnabled](self, "autoUpdateEnabled"),
          v10 == -[SUInstallPolicy autoUpdateEnabled](v6, "autoUpdateEnabled")))
    {
      v13 = -[SUInstallPolicy useDarkBoot](self, "useDarkBoot");
      v11 = v13 ^ -[SUInstallPolicy useDarkBoot](v6, "useDarkBoot") ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
LABEL_9:
    LOBYTE(v11) = 0;
  }
LABEL_11:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SUInstallPolicy type](self, "type") + 4;
  return v3 + -[SUInstallPolicy autoUpdateEnabled](self, "autoUpdateEnabled") + 3 * v3;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUInstallPolicy clientName](self, "clientName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_type)
    v5 = CFSTR("Required");
  else
    v5 = CFSTR("Default");
  v6 = v5;
  v7 = -[SUInstallPolicy skipsAllowed](self, "skipsAllowed");
  if (-[SUInstallPolicy autoUpdateEnabled](self, "autoUpdateEnabled"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[SUInstallPolicy useDarkBoot](self, "useDarkBoot"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n            clientName:%@\n            type: %@\n            skipsAllowed: %d\n            autoUpdateEnabled: %@\n            DarkBoot: %@"), v4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUInstallPolicy)initWithCoder:(id)a3
{
  id v4;
  SUInstallPolicy *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUInstallPolicy;
  v5 = -[SUInstallPolicy init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUInstallPolicy setClientName:](v5, "setClientName:", v6);

    -[SUInstallPolicy setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skipsAllowed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUInstallPolicy setSkipsAllowed:](v5, "setSkipsAllowed:", objc_msgSend(v7, "unsignedIntegerValue"));

    -[SUInstallPolicy _setAutoUpdateEnabled:](v5, "_setAutoUpdateEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoUpdateEnabled")));
    -[SUInstallPolicy _setDarkBoolEnabled:](v5, "_setDarkBoolEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("darkBootEnabled")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientName;
  void *v5;
  id v6;

  clientName = self->_clientName;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", clientName, CFSTR("clientName"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_skipsAllowed);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("skipsAllowed"));

  objc_msgSend(v6, "encodeBool:forKey:", self->_autoUpdateEnabled, CFSTR("autoUpdateEnabled"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_useDarkBoot, CFSTR("darkBootEnabled"));

}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (unint64_t)skipsAllowed
{
  return self->_skipsAllowed;
}

- (void)setSkipsAllowed:(unint64_t)a3
{
  self->_skipsAllowed = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)autoUpdateEnabled
{
  return self->_autoUpdateEnabled;
}

- (BOOL)useDarkBoot
{
  return self->_useDarkBoot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
}

@end
