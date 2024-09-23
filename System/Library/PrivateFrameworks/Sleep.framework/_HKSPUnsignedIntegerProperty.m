@implementation _HKSPUnsignedIntegerProperty

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
  v9 = objc_msgSend(v7, "decodeIntegerForKey:", v11);

  objc_msgSend(v6, "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hksp_setValue:forProperty:", v10, self);

}

- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4
{
  id v6;
  unint64_t v7;
  id v8;

  v6 = a4;
  v7 = -[_HKSPUnsignedIntegerProperty unsignedIntegerValueForObject:](self, "unsignedIntegerValueForObject:", a3);
  -[HKSPProperty identifier](self, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeInteger:forKey:", v7, v8);

}

- (unint64_t)unsignedIntegerValueForObject:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "hksp_valueForProperty:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)copyValueFromObject:(id)a3 toObject:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", -[_HKSPUnsignedIntegerProperty unsignedIntegerValueForObject:](self, "unsignedIntegerValueForObject:", a3));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hksp_setValue:forProperty:", v8, self);

}

@end
