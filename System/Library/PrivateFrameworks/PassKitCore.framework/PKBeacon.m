@implementation PKBeacon

- (void)setProximityUUIDWithString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithUUIDString:", v5);

  -[PKBeacon setProximityUUID:](self, "setProximityUUID:", v6);
}

- (id)proximityUUIDAsString
{
  void *v2;
  void *v3;

  -[PKBeacon proximityUUID](self, "proximityUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PKBeacon proximityUUID](self, "proximityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBeacon major](self, "major");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBeacon minor](self, "minor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(uuid:%@ major:%@ minor:%@)"), v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBeacon)initWithCoder:(id)a3
{
  id v4;
  PKBeacon *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKBeacon;
  v5 = -[PKBeacon init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proximityUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBeacon setProximityUUID:](v5, "setProximityUUID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("major"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBeacon setMajor:](v5, "setMajor:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBeacon setMinor:](v5, "setMinor:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBeacon setName:](v5, "setName:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relevantText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBeacon setRelevantText:](v5, "setRelevantText:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PKBeacon proximityUUID](self, "proximityUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("proximityUUID"));

  -[PKBeacon major](self, "major");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("major"));

  -[PKBeacon minor](self, "minor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("minor"));

  -[PKBeacon name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("name"));

  -[PKBeacon relevantText](self, "relevantText");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("relevantText"));

}

- (NSUUID)proximityUUID
{
  return self->_proximityUUID;
}

- (void)setProximityUUID:(id)a3
{
  objc_storeStrong((id *)&self->_proximityUUID, a3);
}

- (NSNumber)major
{
  return self->_major;
}

- (void)setMajor:(id)a3
{
  objc_storeStrong((id *)&self->_major, a3);
}

- (NSNumber)minor
{
  return self->_minor;
}

- (void)setMinor:(id)a3
{
  objc_storeStrong((id *)&self->_minor, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)relevantText
{
  return self->_relevantText;
}

- (void)setRelevantText:(id)a3
{
  objc_storeStrong((id *)&self->_relevantText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantText, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_minor, 0);
  objc_storeStrong((id *)&self->_major, 0);
  objc_storeStrong((id *)&self->_proximityUUID, 0);
}

@end
