@implementation _UIStatusBarDataBatteryEntry

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataBatteryEntry;
  v3 = *(_QWORD *)&self->_saverModeActive ^ -[_UIStatusBarDataEntry hash](&v5, sel_hash) ^ self->_capacity;
  return v3 ^ objc_msgSend((id)self->_state, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataBatteryEntry;
  v4 = -[_UIStatusBarDataEntry copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setCapacity:", *(_QWORD *)&self->_saverModeActive);
  objc_msgSend(v4, "setState:", self->_capacity);
  objc_msgSend(v4, "setSaverModeActive:", *((unsigned __int8 *)&self->super._enabled + 1));
  objc_msgSend(v4, "setProminentlyShowsDetailString:", *((unsigned __int8 *)&self->super._enabled + 2));
  objc_msgSend(v4, "setDetailString:", self->_state);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataBatteryEntry;
  v4 = a3;
  -[_UIStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", *(_QWORD *)&self->_saverModeActive, CFSTR("capacity"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_capacity, CFSTR("state"));
  objc_msgSend(v4, "encodeInteger:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), CFSTR("saverModeActive"));
  objc_msgSend(v4, "encodeInteger:forKey:", *((unsigned __int8 *)&self->super._enabled + 2), CFSTR("prominentlyShowsDetailString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_state, CFSTR("detailString"));

}

- (_UIStatusBarDataBatteryEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataBatteryEntry *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBatteryEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  -[_UIStatusBarDataBatteryEntry setCapacity:](v4, "setCapacity:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("capacity"), v7.receiver, v7.super_class));
  -[_UIStatusBarDataBatteryEntry setState:](v4, "setState:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("state")));
  -[_UIStatusBarDataBatteryEntry setSaverModeActive:](v4, "setSaverModeActive:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("saverModeActive")) != 0);
  -[_UIStatusBarDataBatteryEntry setProminentlyShowsDetailString:](v4, "setProminentlyShowsDetailString:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("prominentlyShowsDetailString")) != 0);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarDataBatteryEntry setDetailString:](v4, "setDetailString:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int64_t capacity;
  int v8;
  int v9;
  void *state;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIStatusBarDataBatteryEntry;
  if (-[_UIStatusBarDataEntry isEqual:](&v17, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      v6 = *(_QWORD *)&self->_saverModeActive;
      if (v6 == objc_msgSend(v5, "capacity")
        && (capacity = self->_capacity, capacity == objc_msgSend(v5, "state"))
        && (v8 = *((unsigned __int8 *)&self->super._enabled + 1), v8 == objc_msgSend(v5, "saverModeActive"))&& (v9 = *((unsigned __int8 *)&self->super._enabled + 2), v9 == objc_msgSend(v5, "prominentlyShowsDetailString")))
      {
        state = (void *)self->_state;
        objc_msgSend(v5, "detailString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = state;
        v13 = v11;
        v14 = v13;
        if (v12 == v13)
        {
          v15 = 1;
        }
        else
        {
          v15 = 0;
          if (v12 && v13)
            v15 = objc_msgSend(v12, "isEqual:", v13);
        }

      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = 1;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_ui_descriptionBuilder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarDataBatteryEntry;
  -[_UIStatusBarDataEntry _ui_descriptionBuilder](&v11, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_capacity);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  NSStringFromSelector(sel_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  NSStringFromSelector(sel_saverModeActive);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  NSStringFromSelector(sel_prominentlyShowsDetailString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  NSStringFromSelector(sel_detailString);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)capacity
{
  return *(_QWORD *)&self->_saverModeActive;
}

- (void)setCapacity:(int64_t)a3
{
  *(_QWORD *)&self->_saverModeActive = a3;
}

- (int64_t)state
{
  return self->_capacity;
}

- (void)setState:(int64_t)a3
{
  self->_capacity = a3;
}

- (BOOL)saverModeActive
{
  return *(&self->super._enabled + 1);
}

- (void)setSaverModeActive:(BOOL)a3
{
  *(&self->super._enabled + 1) = a3;
}

- (BOOL)prominentlyShowsDetailString
{
  return *(&self->super._enabled + 2);
}

- (void)setProminentlyShowsDetailString:(BOOL)a3
{
  *(&self->super._enabled + 2) = a3;
}

- (NSString)detailString
{
  return (NSString *)self->_state;
}

- (void)setDetailString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

@end
