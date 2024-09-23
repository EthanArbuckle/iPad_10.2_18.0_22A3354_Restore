@implementation PNPDeviceState

- (PNPDeviceState)init
{
  PNPDeviceState *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PNPDeviceState;
  v2 = -[PNPDeviceState init](&v4, sel_init);
  -[PNPDeviceState setEdge:](v2, "setEdge:", 4);
  -[PNPDeviceState setBatteryLevelUnknown:](v2, "setBatteryLevelUnknown:", 1);
  v2->_isCharging = 1;
  v2->_deviceType = 0;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PNPDeviceState name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  -[PNPDeviceState batteryLevel](self, "batteryLevel");
  objc_msgSend(v4, "setBatteryLevel:");
  objc_msgSend(v4, "setEdge:", -[PNPDeviceState edge](self, "edge"));
  objc_msgSend(v4, "setOrientation:", -[PNPDeviceState orientation](self, "orientation"));
  objc_msgSend(v4, "setBatteryLevelUnknown:", -[PNPDeviceState batteryLevelUnknown](self, "batteryLevelUnknown"));
  -[PNPDeviceState identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v6);

  objc_msgSend(v4, "setIsCharging:", -[PNPDeviceState isCharging](self, "isCharging"));
  objc_msgSend(v4, "setDeviceType:", -[PNPDeviceState deviceType](self, "deviceType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  BOOL v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPDeviceState name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      objc_msgSend(v5, "batteryLevel");
      v10 = v9;
      -[PNPDeviceState batteryLevel](self, "batteryLevel");
      if (v10 == v11)
      {
        v12 = objc_msgSend(v5, "edge");
        if (v12 == -[PNPDeviceState edge](self, "edge"))
        {
          v13 = objc_msgSend(v5, "orientation");
          if (v13 == -[PNPDeviceState orientation](self, "orientation"))
          {
            v14 = objc_msgSend(v5, "batteryLevelUnknown");
            if (v14 == -[PNPDeviceState batteryLevelUnknown](self, "batteryLevelUnknown"))
            {
              v15 = objc_msgSend(v5, "isCharging");
              if (v15 == -[PNPDeviceState isCharging](self, "isCharging"))
              {
                objc_msgSend(v5, "identifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v16)
                {
                  -[PNPDeviceState identifier](self, "identifier");
                  v7 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v7)
                    goto LABEL_12;
                }
                objc_msgSend(v5, "identifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[PNPDeviceState identifier](self, "identifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v17, "isEqual:", v18);

                if (v16)
                {

                  if (v19)
                  {
LABEL_12:
                    v20 = objc_msgSend(v5, "deviceType");
                    v21 = v20 == -[PNPDeviceState deviceType](self, "deviceType");
LABEL_16:

                    goto LABEL_17;
                  }
                }
                else
                {

                  if ((v19 & 1) != 0)
                    goto LABEL_12;
                }
              }
            }
          }
        }
      }
    }
    v21 = 0;
    goto LABEL_16;
  }
  v21 = 0;
LABEL_17:

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PNPDeviceState name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("name"));

  -[PNPDeviceState batteryLevel](self, "batteryLevel");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("batteryLevel"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[PNPDeviceState edge](self, "edge"), CFSTR("edge"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[PNPDeviceState orientation](self, "orientation"), CFSTR("orientation"));
  objc_msgSend(v6, "encodeBool:forKey:", -[PNPDeviceState batteryLevelUnknown](self, "batteryLevelUnknown"), CFSTR("batteryLevelUnknown"));
  objc_msgSend(v6, "encodeBool:forKey:", -[PNPDeviceState isCharging](self, "isCharging"), CFSTR("charging"));
  -[PNPDeviceState identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[PNPDeviceState deviceType](self, "deviceType"), CFSTR("deviceType"));
}

- (PNPDeviceState)initWithCoder:(id)a3
{
  id v4;
  PNPDeviceState *v5;
  uint64_t v6;
  NSString *name;
  double v8;
  uint64_t v9;
  NSUUID *identifier;

  v4 = a3;
  v5 = -[PNPDeviceState init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = objc_claimAutoreleasedReturnValue();
  name = v5->_name;
  v5->_name = (NSString *)v6;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("batteryLevel"));
  v5->_batteryLevel = v8;
  v5->_edge = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("edge"));
  v5->_orientation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("orientation"));
  v5->_batteryLevelUnknown = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("batteryLevelUnknown"));
  v5->_isCharging = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("charging"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v9 = objc_claimAutoreleasedReturnValue();

  identifier = v5->_identifier;
  v5->_identifier = (NSUUID *)v9;

  return v5;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  -[PNPDeviceState name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APPLE_PENCIL_NAME"), &stru_24F4E5CD0, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[PNPDeviceState deviceType](self, "deviceType") == 4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("APPLE_PENCIL_NAME_PRO"), &stru_24F4E5CD0, CFSTR("PencilPairingSqueeze-B532"));
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  if (v5)
  {
    v9 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("APPLE_PENCIL_NAME"), &stru_24F4E5CD0, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v9;
}

- (double)batteryLevel
{
  float batteryLevel;

  batteryLevel = self->_batteryLevel;
  return BatteryLevel(batteryLevel);
}

- (BOOL)isOnLeftOrRightSide
{
  return -[PNPDeviceState edge](self, "edge") == 2 || -[PNPDeviceState edge](self, "edge") == 8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setBatteryLevel:(double)a3
{
  self->_batteryLevel = a3;
}

- (unint64_t)edge
{
  return self->_edge;
}

- (void)setEdge:(unint64_t)a3
{
  self->_edge = a3;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
}

- (BOOL)batteryLevelUnknown
{
  return self->_batteryLevelUnknown;
}

- (void)setBatteryLevelUnknown:(BOOL)a3
{
  self->_batteryLevelUnknown = a3;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (void)setIsCharging:(BOOL)a3
{
  self->_isCharging = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
