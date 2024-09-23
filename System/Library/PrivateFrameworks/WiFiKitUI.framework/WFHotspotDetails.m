@implementation WFHotspotDetails

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[WFHotspotDetails isEqualHotspotDetails:](self, "isEqualHotspotDetails:", v4);

  return v5;
}

- (BOOL)isEqualHotspotDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[WFHotspotDetails batteryLife](self, "batteryLife");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "batteryLife");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[WFHotspotDetails cellularProtocolString](self, "cellularProtocolString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellularProtocolString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[WFHotspotDetails signalStrength](self, "signalStrength");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "signalStrength");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[WFHotspotDetails batteryLife](self, "batteryLife");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFHotspotDetails cellularProtocolString](self, "cellularProtocolString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[WFHotspotDetails signalStrength](self, "signalStrength");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotDetails batteryLife](self, "batteryLife");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotDetails cellularProtocolString](self, "cellularProtocolString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotDetails signalStrength](self, "signalStrength");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@) batteryLife: %@ | cellularProtocolString: %@ | signalStrength: %@"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSNumber)batteryLife
{
  return self->_batteryLife;
}

- (void)setBatteryLife:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLife, a3);
}

- (NSString)cellularProtocolString
{
  return self->_cellularProtocolString;
}

- (void)setCellularProtocolString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)signalStrength
{
  return self->_signalStrength;
}

- (void)setSignalStrength:(id)a3
{
  objc_storeStrong((id *)&self->_signalStrength, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalStrength, 0);
  objc_storeStrong((id *)&self->_cellularProtocolString, 0);
  objc_storeStrong((id *)&self->_batteryLife, 0);
}

@end
