@implementation WBSUserMediaCapturePolicyEntry

- (WBSUserMediaCapturePolicyEntry)initWithPermission:(unint64_t)a3 expirationPolicy:(unint64_t)a4 forOrigin:(id)a5 topLevelOrigin:(id)a6
{
  id v11;
  id v12;
  WBSUserMediaCapturePolicyEntry *v13;
  WBSUserMediaCapturePolicyEntry *v14;
  WBSUserMediaCapturePolicyEntry *v15;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WBSUserMediaCapturePolicyEntry;
  v13 = -[WBSUserMediaCapturePolicyEntry init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_origin, a5);
    objc_storeStrong((id *)&v14->_topLevelOrigin, a6);
    v14->_permissionGrantDate = CFAbsoluteTimeGetCurrent();
    -[WBSUserMediaCapturePolicyEntry updatePermission:expirationPolicy:](v14, "updatePermission:expirationPolicy:", a3, a4);
    v15 = v14;
  }

  return v14;
}

- (WBSUserMediaCapturePolicyEntry)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  WBSUserMediaCapturePolicyEntry *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  WBSUserMediaCapturePolicyEntry *v12;
  void *v14;
  uint64_t v15;
  NSString *origin;
  void *v17;
  uint64_t v18;
  NSString *topLevelOrigin;
  void *v20;
  uint64_t v21;
  NSString *persistentSalt;
  void *v23;
  uint64_t v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WBSUserMediaCapturePolicyEntry;
  v5 = -[WBSUserMediaCapturePolicyEntry init](&v25, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "safari_numberForKey:", CFSTR("permissionExpirationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (CFAbsoluteTimeGetCurrent() > v8)
    goto LABEL_5;
  v5->_permissionExpirationDate = v8;
  objc_msgSend(v4, "safari_numberForKey:", CFSTR("permissionGrantDateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  if (v11 != 0.0 && v11 <= CFAbsoluteTimeGetCurrent())
  {
    v5->_permissionGrantDate = v11;
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("origin"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      v15 = objc_msgSend(v14, "copy");
      origin = v5->_origin;
      v5->_origin = (NSString *)v15;

      objc_msgSend(v4, "safari_stringForKey:", CFSTR("topLevelOrigin"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length"))
      {
        v18 = objc_msgSend(v17, "copy");
        topLevelOrigin = v5->_topLevelOrigin;
        v5->_topLevelOrigin = (NSString *)v18;

        objc_msgSend(v4, "safari_stringForKey:", CFSTR("salt"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length"))
        {
          v21 = objc_msgSend(v20, "copy");
          persistentSalt = v5->_persistentSalt;
          v5->_persistentSalt = (NSString *)v21;

        }
        objc_msgSend(v4, "safari_numberForKey:", CFSTR("permission"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "integerValue");

        if (-[WBSUserMediaCapturePolicyEntry _isValidUserMediaPermission:](v5, "_isValidUserMediaPermission:", v24))
          v5->_permission = v24;
        v12 = v5;

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
LABEL_5:
    v12 = 0;
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *persistentSalt;
  unint64_t permission;
  void *v8;
  NSString *origin;
  NSString *topLevelOrigin;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("permissionExpirationDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_permissionExpirationDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("permissionGrantDateKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_permissionGrantDate);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  persistentSalt = &stru_1E4B40D18;
  permission = self->_permission;
  if (self->_persistentSalt)
    persistentSalt = (const __CFString *)self->_persistentSalt;
  v14[1] = v4;
  v14[2] = persistentSalt;
  v13[2] = CFSTR("salt");
  v13[3] = CFSTR("permission");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", permission);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  origin = self->_origin;
  topLevelOrigin = self->_topLevelOrigin;
  v14[3] = v8;
  v14[4] = origin;
  v13[4] = CFSTR("origin");
  v13[5] = CFSTR("topLevelOrigin");
  v14[5] = topLevelOrigin;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isValid
{
  double permissionExpirationDate;

  permissionExpirationDate = self->_permissionExpirationDate;
  return permissionExpirationDate != 0.0
      && CFAbsoluteTimeGetCurrent() <= permissionExpirationDate
      && -[WBSUserMediaCapturePolicyEntry _isValidUserMediaPermission:](self, "_isValidUserMediaPermission:", self->_permission);
}

- (BOOL)permissionExpiresWithinOneDay
{
  CFAbsoluteTime v2;

  v2 = self->_permissionExpirationDate + -86400.0;
  return CFAbsoluteTimeGetCurrent() > v2;
}

- (void)updatePermission:(unint64_t)a3 expirationPolicy:(unint64_t)a4
{
  unint64_t v7;
  double v8;
  CFAbsoluteTime v9;

  if (-[WBSUserMediaCapturePolicyEntry _isValidUserMediaPermission:](self, "_isValidUserMediaPermission:"))
    v7 = a3;
  else
    v7 = 0;
  self->_permission = v7;
  if (a4)
  {
    if (a4 == 1)
    {
      v8 = 86400.0;
    }
    else
    {
      if (a4 != 2)
        return;
      v8 = 2592000.0;
    }
    v9 = CFAbsoluteTimeGetCurrent() + v8;
  }
  else
  {
    v9 = 0.0;
  }
  self->_permissionExpirationDate = v9;
}

- (BOOL)_isValidUserMediaPermission:(unint64_t)a3
{
  BOOL v3;

  if ((_BYTE)a3)
    v3 = a3 >= 0x100;
  else
    v3 = 1;
  return !v3;
}

- (double)permissionExpirationDate
{
  return self->_permissionExpirationDate;
}

- (void)setPermissionExpirationDate:(double)a3
{
  self->_permissionExpirationDate = a3;
}

- (double)permissionGrantDate
{
  return self->_permissionGrantDate;
}

- (void)setPermissionGrantDate:(double)a3
{
  self->_permissionGrantDate = a3;
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (NSString)topLevelOrigin
{
  return self->_topLevelOrigin;
}

- (void)setTopLevelOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelOrigin, a3);
}

- (NSString)persistentSalt
{
  return self->_persistentSalt;
}

- (void)setPersistentSalt:(id)a3
{
  objc_storeStrong((id *)&self->_persistentSalt, a3);
}

- (unint64_t)permission
{
  return self->_permission;
}

- (void)setPermission:(unint64_t)a3
{
  self->_permission = a3;
}

- (NSMutableDictionary)ephemeralSalts
{
  return self->_ephemeralSalts;
}

- (void)setEphemeralSalts:(id)a3
{
  objc_storeStrong((id *)&self->_ephemeralSalts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralSalts, 0);
  objc_storeStrong((id *)&self->_persistentSalt, 0);
  objc_storeStrong((id *)&self->_topLevelOrigin, 0);
  objc_storeStrong((id *)&self->_origin, 0);
}

@end
