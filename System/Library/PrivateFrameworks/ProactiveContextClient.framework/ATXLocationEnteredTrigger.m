@implementation ATXLocationEnteredTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 1;
}

- (ATXLocationEnteredTrigger)initWithLocationIdentifier:(id)a3 namedLOI:(unint64_t)a4
{
  id v7;
  ATXLocationEnteredTrigger *v8;
  ATXLocationEnteredTrigger *v9;
  ATXLocationEnteredTrigger *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXLocationEnteredTrigger;
  v8 = -[ATXLocationEnteredTrigger init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locationIdentifier, a3);
    v9->_namedLOI = a4;
    v10 = v9;
  }

  return v9;
}

- (ATXLocationEnteredTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ATXLocationEnteredTrigger *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("namedLOI"));

  v7 = -[ATXLocationEnteredTrigger initWithLocationIdentifier:namedLOI:](self, "initWithLocationIdentifier:namedLOI:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *locationIdentifier;
  id v5;

  locationIdentifier = self->_locationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", locationIdentifier, CFSTR("location"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_namedLOI, CFSTR("namedLOI"));

}

- (unint64_t)namedLOI
{
  return self->_namedLOI;
}

- (NSString)locationIdentifier
{
  return self->_locationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationIdentifier, 0);
}

@end
