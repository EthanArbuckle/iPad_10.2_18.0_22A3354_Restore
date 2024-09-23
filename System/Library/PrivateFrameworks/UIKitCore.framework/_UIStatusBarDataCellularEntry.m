@implementation _UIStatusBarDataCellularEntry

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataCellularEntry;
  v3 = *(_QWORD *)&self->_wifiCallingEnabled ^ -[_UIStatusBarDataNetworkEntry hash](&v7, sel_hash);
  v4 = v3 ^ objc_msgSend((id)self->_type, "hash");
  v5 = -[NSString hash](self->_string, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_crossfadeString, "hash") ^ LOBYTE(self->super._status) ^ (unint64_t)BYTE1(self->super._status) ^ BYTE2(self->super._status) ^ BYTE3(self->super._status) ^ BYTE4(self->super._status);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataCellularEntry;
  v4 = -[_UIStatusBarDataNetworkEntry copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setType:", *(_QWORD *)&self->_wifiCallingEnabled);
  objc_msgSend(v4, "setString:", self->_type);
  objc_msgSend(v4, "setCrossfadeString:", self->_string);
  objc_msgSend(v4, "setBadgeString:", self->_crossfadeString);
  objc_msgSend(v4, "setWifiCallingEnabled:", LOBYTE(self->super._status));
  objc_msgSend(v4, "setCallForwardingEnabled:", BYTE1(self->super._status));
  objc_msgSend(v4, "setShowsSOSWhenDisabled:", BYTE2(self->super._status));
  objc_msgSend(v4, "setSosAvailable:", BYTE3(self->super._status));
  objc_msgSend(v4, "setIsBootstrapCellular:", BYTE4(self->super._status));
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
  v5.super_class = (Class)_UIStatusBarDataCellularEntry;
  v4 = a3;
  -[_UIStatusBarDataNetworkEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", *(_QWORD *)&self->_wifiCallingEnabled, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("string"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_string, CFSTR("crossfadeString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_crossfadeString, CFSTR("badgeString"));
  objc_msgSend(v4, "encodeBool:forKey:", LOBYTE(self->super._status), CFSTR("wifiCallingEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", BYTE1(self->super._status), CFSTR("callForwardingEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", BYTE2(self->super._status), CFSTR("showsSOSWhenDisabled"));
  objc_msgSend(v4, "encodeBool:forKey:", BYTE3(self->super._status), CFSTR("sosAvailable"));
  objc_msgSend(v4, "encodeBool:forKey:", BYTE4(self->super._status), CFSTR("isBootstrapCellular"));

}

- (_UIStatusBarDataCellularEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataCellularEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarDataCellularEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataNetworkEntry initWithCoder:](&v10, sel_initWithCoder_, v3);
  -[_UIStatusBarDataCellularEntry setType:](v4, "setType:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"), v10.receiver, v10.super_class));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarDataCellularEntry setString:](v4, "setString:", v5);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("crossfadeString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarDataCellularEntry setCrossfadeString:](v4, "setCrossfadeString:", v6);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("badgeString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarDataCellularEntry setBadgeString:](v4, "setBadgeString:", v7);

  -[_UIStatusBarDataCellularEntry setWifiCallingEnabled:](v4, "setWifiCallingEnabled:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("wifiCallingEnabled")));
  -[_UIStatusBarDataCellularEntry setCallForwardingEnabled:](v4, "setCallForwardingEnabled:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("callForwardingEnabled")));
  -[_UIStatusBarDataCellularEntry setShowsSOSWhenDisabled:](v4, "setShowsSOSWhenDisabled:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("showsSOSWhenDisabled")));
  -[_UIStatusBarDataCellularEntry setSosAvailable:](v4, "setSosAvailable:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("sosAvailable")));
  v8 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isBootstrapCellular"));

  -[_UIStatusBarDataCellularEntry setIsBootstrapCellular:](v4, "setIsBootstrapCellular:", v8);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *type;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  BOOL v12;
  BOOL v13;
  NSString *v14;
  int v15;
  NSString *string;
  void *v17;
  NSString *v18;
  int v19;
  NSString *crossfadeString;
  void *v21;
  NSString *v22;
  NSString *v23;
  int v24;
  int status_low;
  int v26;
  int v27;
  int v28;
  int v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UIStatusBarDataCellularEntry;
  if (-[_UIStatusBarDataNetworkEntry isEqual:](&v31, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      v6 = *(_QWORD *)&self->_wifiCallingEnabled;
      if (v6 == objc_msgSend(v5, "type"))
      {
        type = (void *)self->_type;
        objc_msgSend(v5, "string");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = type;
        v10 = v8;
        v11 = v10;
        if (v9 == v10)
        {

        }
        else
        {
          if (v9)
            v12 = v10 == 0;
          else
            v12 = 1;
          if (v12)
          {
            v13 = 0;
            v14 = v10;
            goto LABEL_38;
          }
          v15 = -[NSString isEqual:](v9, "isEqual:", v10);

          if (!v15)
          {
            v13 = 0;
LABEL_40:

            goto LABEL_41;
          }
        }
        string = self->_string;
        objc_msgSend(v5, "crossfadeString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = string;
        v18 = v17;
        v9 = v18;
        if (v14 == v18)
        {

        }
        else
        {
          if (!v14 || !v18)
          {

            goto LABEL_37;
          }
          v19 = -[NSString isEqual:](v14, "isEqual:", v18);

          if (!v19)
          {
            v13 = 0;
LABEL_39:

            goto LABEL_40;
          }
        }
        crossfadeString = self->_crossfadeString;
        objc_msgSend(v5, "badgeString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = crossfadeString;
        v23 = v21;
        v14 = v23;
        if (v22 == v23)
        {

LABEL_31:
          status_low = LOBYTE(self->super._status);
          if (status_low != objc_msgSend(v5, "wifiCallingEnabled"))
            goto LABEL_37;
          v26 = BYTE1(self->super._status);
          if (v26 != objc_msgSend(v5, "callForwardingEnabled"))
            goto LABEL_37;
          v27 = BYTE2(self->super._status);
          if (v27 != objc_msgSend(v5, "showsSOSWhenDisabled"))
            goto LABEL_37;
          v28 = BYTE3(self->super._status);
          if (v28 != objc_msgSend(v5, "sosAvailable"))
            goto LABEL_37;
          v29 = BYTE4(self->super._status);
          v13 = v29 == objc_msgSend(v5, "isBootstrapCellular");
LABEL_38:

          goto LABEL_39;
        }
        if (v22 && v23)
        {
          v24 = -[NSString isEqual:](v22, "isEqual:", v23);

          if (!v24)
            goto LABEL_37;
          goto LABEL_31;
        }

LABEL_37:
        v13 = 0;
        goto LABEL_38;
      }
      v13 = 0;
    }
    else
    {
      v13 = 1;
    }
LABEL_41:

    goto LABEL_42;
  }
  v13 = 0;
LABEL_42:

  return v13;
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
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[10];

  v16[9] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)_UIStatusBarDataCellularEntry;
  -[_UIStatusBarDataNetworkEntry _ui_descriptionBuilder](&v15, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_type);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  NSStringFromSelector(sel_string);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  NSStringFromSelector(sel_crossfadeString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v3;
  NSStringFromSelector(sel_badgeString);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v4;
  NSStringFromSelector(sel_wifiCallingEnabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v5;
  NSStringFromSelector(sel_callForwardingEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v6;
  NSStringFromSelector(sel_showsSOSWhenDisabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v7;
  NSStringFromSelector(sel_sosAvailable);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v8;
  NSStringFromSelector(sel_isBootstrapCellular);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)type
{
  return *(_QWORD *)&self->_wifiCallingEnabled;
}

- (void)setType:(int64_t)a3
{
  *(_QWORD *)&self->_wifiCallingEnabled = a3;
}

- (NSString)string
{
  return (NSString *)self->_type;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)crossfadeString
{
  return self->_string;
}

- (void)setCrossfadeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)badgeString
{
  return self->_crossfadeString;
}

- (void)setBadgeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)wifiCallingEnabled
{
  return self->super._status;
}

- (void)setWifiCallingEnabled:(BOOL)a3
{
  LOBYTE(self->super._status) = a3;
}

- (BOOL)callForwardingEnabled
{
  return BYTE1(self->super._status);
}

- (void)setCallForwardingEnabled:(BOOL)a3
{
  BYTE1(self->super._status) = a3;
}

- (BOOL)showsSOSWhenDisabled
{
  return BYTE2(self->super._status);
}

- (void)setShowsSOSWhenDisabled:(BOOL)a3
{
  BYTE2(self->super._status) = a3;
}

- (BOOL)sosAvailable
{
  return BYTE3(self->super._status);
}

- (void)setSosAvailable:(BOOL)a3
{
  BYTE3(self->super._status) = a3;
}

- (BOOL)isBootstrapCellular
{
  return BYTE4(self->super._status);
}

- (void)setIsBootstrapCellular:(BOOL)a3
{
  BYTE4(self->super._status) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeString, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
