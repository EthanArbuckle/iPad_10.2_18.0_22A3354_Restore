@implementation _UIStatusBarDataBluetoothEntry

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataBluetoothEntry;
  v3 = self->_state ^ -[_UIStatusBarDataEntry hash](&v5, sel_hash);
  return v3 ^ -[_UIStatusBarDataBatteryEntry hash](self->_batteryEntry, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBluetoothEntry;
  v4 = -[_UIStatusBarDataEntry copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setState:", self->_state);
  v5 = (void *)-[_UIStatusBarDataBatteryEntry copy](self->_batteryEntry, "copy");
  objc_msgSend(v4, "setBatteryEntry:", v5);

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
  v5.super_class = (Class)_UIStatusBarDataBluetoothEntry;
  v4 = a3;
  -[_UIStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_state, CFSTR("state"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_batteryEntry, CFSTR("batteryEntry"));

}

- (_UIStatusBarDataBluetoothEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataBluetoothEntry *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBluetoothEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  -[_UIStatusBarDataBluetoothEntry setState:](v4, "setState:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("state"), v7.receiver, v7.super_class));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batteryEntry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarDataBluetoothEntry setBatteryEntry:](v4, "setBatteryEntry:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *state;
  BOOL v7;
  _UIStatusBarDataBatteryEntry *batteryEntry;
  void *v9;
  _UIStatusBarDataBatteryEntry *v10;
  _UIStatusBarDataBatteryEntry *v11;
  _UIStatusBarDataBatteryEntry *v12;
  char v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIStatusBarDataBluetoothEntry;
  if (-[_UIStatusBarDataEntry isEqual:](&v15, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      state = (void *)self->_state;
      if (state == (void *)objc_msgSend(v5, "state"))
      {
        v7 = -[_UIStatusBarDataEntry isEnabled](self->_batteryEntry, "isEnabled");
        if (v7
          || (objc_msgSend(v5, "batteryEntry"),
              state = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(state, "isEnabled")))
        {
          batteryEntry = self->_batteryEntry;
          objc_msgSend(v5, "batteryEntry");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = batteryEntry;
          v11 = v9;
          v12 = v11;
          if (v10 == v11)
          {
            v13 = 1;
          }
          else
          {
            v13 = 0;
            if (v10 && v11)
              v13 = -[_UIStatusBarDataBatteryEntry isEqual:](v10, "isEqual:", v11);
          }

          if (v7)
            goto LABEL_19;
        }
        else
        {
          v13 = 1;
        }

      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 1;
    }
LABEL_19:

    goto LABEL_20;
  }
  v13 = 0;
LABEL_20:

  return v13;
}

- (id)_ui_descriptionBuilder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDataBluetoothEntry;
  -[_UIStatusBarDataEntry _ui_descriptionBuilder](&v8, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_state);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  NSStringFromSelector(sel_batteryEntry);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (_UIStatusBarDataBatteryEntry)batteryEntry
{
  return self->_batteryEntry;
}

- (void)setBatteryEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryEntry, 0);
}

@end
