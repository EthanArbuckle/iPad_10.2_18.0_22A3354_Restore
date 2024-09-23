@implementation _HKSPBoolProperty

- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  v8 = a3;
  -[HKSPProperty identifier](self, "identifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "decodeBoolForKey:", v11);

  objc_msgSend(v6, "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hksp_setValue:forProperty:", v10, self);

}

- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4
{
  id v6;
  _BOOL8 v7;
  id v8;

  v6 = a4;
  v7 = -[_HKSPBoolProperty BOOLValueForObject:](self, "BOOLValueForObject:", a3);
  -[HKSPProperty identifier](self, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", v7, v8);

}

- (BOOL)BOOLValueForObject:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "hksp_valueForProperty:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)copyValueFromObject:(id)a3 toObject:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", -[_HKSPBoolProperty BOOLValueForObject:](self, "BOOLValueForObject:", a3));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hksp_setValue:forProperty:", v8, self);

}

@end
