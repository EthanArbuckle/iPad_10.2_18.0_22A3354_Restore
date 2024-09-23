@implementation FMDAccessorySerialNumbers

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDAccessorySerialNumbers)initWithAccessoryInfo:(id)a3
{
  id v4;
  FMDAccessorySerialNumbers *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FMDAccessorySerialNumbers;
  v5 = -[FMDAccessorySerialNumbers init](&v14, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AACPVersionInfo")));
    if ((unint64_t)objc_msgSend(v6, "count") < 0xB)
    {
      v12 = sub_1000031B8();
      v11 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10022BEE8(v6, v11);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 3));
      -[FMDAccessorySerialNumbers setSystemSerialNumber:](v5, "setSystemSerialNumber:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 8));
      -[FMDAccessorySerialNumbers setLeftBudSerialNumber:](v5, "setLeftBudSerialNumber:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 9));
      -[FMDAccessorySerialNumbers setRightBudSerialNumber:](v5, "setRightBudSerialNumber:", v9);

      v10 = sub_1000031B8();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMDAccessorySerialNumbers info: %@", buf, 0xCu);
      }
    }

  }
  return v5;
}

- (NSDictionary)dictionaryValue
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessorySerialNumbers systemSerialNumber](self, "systemSerialNumber"));
  -[NSMutableDictionary fm_safeSetObject:forKey:](v3, "fm_safeSetObject:forKey:", v4, CFSTR("systemSerialNumber"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessorySerialNumbers leftBudSerialNumber](self, "leftBudSerialNumber"));
  -[NSMutableDictionary fm_safeSetObject:forKey:](v3, "fm_safeSetObject:forKey:", v5, CFSTR("leftSerialNumber"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessorySerialNumbers rightBudSerialNumber](self, "rightBudSerialNumber"));
  -[NSMutableDictionary fm_safeSetObject:forKey:](v3, "fm_safeSetObject:forKey:", v6, CFSTR("rightSerialNumber"));

  return (NSDictionary *)v3;
}

- (FMDAccessorySerialNumbers)initWithDictionary:(id)a3
{
  id v4;
  FMDAccessorySerialNumbers *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDAccessorySerialNumbers;
  v5 = -[FMDAccessorySerialNumbers init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemSerialNumber")));
    -[FMDAccessorySerialNumbers setSystemSerialNumber:](v5, "setSystemSerialNumber:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leftSerialNumber")));
    -[FMDAccessorySerialNumbers setLeftBudSerialNumber:](v5, "setLeftBudSerialNumber:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rightSerialNumber")));
    -[FMDAccessorySerialNumbers setRightBudSerialNumber:](v5, "setRightBudSerialNumber:", v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessorySerialNumbers systemSerialNumber](self, "systemSerialNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("systemSerialNumber"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessorySerialNumbers leftBudSerialNumber](self, "leftBudSerialNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("leftBudSerialNumber"));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FMDAccessorySerialNumbers rightBudSerialNumber](self, "rightBudSerialNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("rightBudSerialNumber"));

}

- (FMDAccessorySerialNumbers)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDAccessorySerialNumbers *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FMDAccessorySerialNumbers;
  v6 = -[FMDAccessorySerialNumbers init](&v16, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("systemSerialNumber"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[FMDAccessorySerialNumbers setSystemSerialNumber:](v6, "setSystemSerialNumber:", v8);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v9), CFSTR("leftBudSerialNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[FMDAccessorySerialNumbers setLeftBudSerialNumber:](v6, "setLeftBudSerialNumber:", v11);

    v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v12), CFSTR("rightBudSerialNumber"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[FMDAccessorySerialNumbers setRightBudSerialNumber:](v6, "setRightBudSerialNumber:", v14);

  }
  return v6;
}

- (NSString)systemSerialNumber
{
  return self->_systemSerialNumber;
}

- (void)setSystemSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)leftBudSerialNumber
{
  return self->_leftBudSerialNumber;
}

- (void)setLeftBudSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)rightBudSerialNumber
{
  return self->_rightBudSerialNumber;
}

- (void)setRightBudSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBudSerialNumber, 0);
  objc_storeStrong((id *)&self->_leftBudSerialNumber, 0);
  objc_storeStrong((id *)&self->_systemSerialNumber, 0);
}

@end
