@implementation TVLALSData

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<TVLALSData (%p) "), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[TVLALSData x](self, "x");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[TVLALSData x](self, "x");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    objc_msgSend(v6, "stringWithFormat:", CFSTR("X: %.2f, "), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v9);

  }
  -[TVLALSData y](self, "y");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[TVLALSData y](self, "y");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Y: %.2f, "), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v14);

  }
  -[TVLALSData z](self, "z");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    -[TVLALSData z](self, "z");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Z: %.2f, "), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v19);

  }
  -[TVLALSData lux](self, "lux");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    -[TVLALSData lux](self, "lux");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Lux: %.2f, "), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v24);

  }
  -[TVLALSData cct](self, "cct");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    -[TVLALSData cct](self, "cct");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    objc_msgSend(v26, "stringWithFormat:", CFSTR("CCT: %.2f, "), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v29);

  }
  -[TVLALSData channelData](self, "channelData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = (void *)MEMORY[0x24BDD17C8];
    -[TVLALSData channelData](self, "channelData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("Channel Data: %@"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v33);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  -[TVLALSData x](self, "x");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return MEMORY[0x24BDBD1B8];
  v4 = (void *)v3;
  -[TVLALSData y](self, "y");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_11;
  v6 = (void *)v5;
  -[TVLALSData y](self, "y");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_10:

LABEL_11:
    return MEMORY[0x24BDBD1B8];
  }
  v8 = (void *)v7;
  -[TVLALSData lux](self, "lux");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_9:

    goto LABEL_10;
  }
  v10 = (void *)v9;
  -[TVLALSData cct](self, "cct");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {

    goto LABEL_9;
  }
  v12 = (void *)v11;
  -[TVLALSData channelData](self, "channelData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v22[0] = CFSTR("ALS_DATA_X");
    -[TVLALSData x](self, "x");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    v22[1] = CFSTR("ALS_DATA_Y");
    -[TVLALSData y](self, "y");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v15;
    v22[2] = CFSTR("ALS_DATA_Z");
    -[TVLALSData z](self, "z");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v16;
    v22[3] = CFSTR("ALS_DATA_LUX");
    -[TVLALSData lux](self, "lux");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v17;
    v22[4] = CFSTR("ALS_DATA_CCT");
    -[TVLALSData cct](self, "cct");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[4] = v18;
    v22[5] = CFSTR("ALS_DATA_CHANNELS");
    -[TVLALSData channelData](self, "channelData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[5] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    return v20;
  }
  return MEMORY[0x24BDBD1B8];
}

+ (id)instanceFromDictionary:(id)a3
{
  id v3;
  TVLALSData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TVLALSData *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = objc_alloc_init(TVLALSData);
  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_DATA_X"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSData setX:](v4, "setX:", v5);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_DATA_Y"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSData setY:](v4, "setY:", v6);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_DATA_Z"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSData setZ:](v4, "setZ:", v7);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_DATA_LUX"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSData setLux:](v4, "setLux:", v8);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_DATA_CCT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLALSData setCct:](v4, "setCct:", v9);

  objc_msgSend(v3, "objectForKey:", CFSTR("ALS_DATA_CHANNELS"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVLALSData setChannelData:](v4, "setChannelData:", v10);
  -[TVLALSData x](v4, "x");
  v11 = (TVLALSData *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[TVLALSData y](v4, "y");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[TVLALSData y](v4, "y");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        -[TVLALSData lux](v4, "lux");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[TVLALSData cct](v4, "cct");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            -[TVLALSData channelData](v4, "channelData");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v11 = v4;
              goto LABEL_13;
            }
LABEL_12:
            v11 = 0;
            goto LABEL_13;
          }

        }
      }

    }
    goto LABEL_12;
  }
LABEL_13:

  return v11;
}

- (NSNumber)x
{
  return self->_x;
}

- (void)setX:(id)a3
{
  objc_storeStrong((id *)&self->_x, a3);
}

- (NSNumber)y
{
  return self->_y;
}

- (void)setY:(id)a3
{
  objc_storeStrong((id *)&self->_y, a3);
}

- (NSNumber)z
{
  return self->_z;
}

- (void)setZ:(id)a3
{
  objc_storeStrong((id *)&self->_z, a3);
}

- (NSNumber)lux
{
  return self->_lux;
}

- (void)setLux:(id)a3
{
  objc_storeStrong((id *)&self->_lux, a3);
}

- (NSNumber)cct
{
  return self->_cct;
}

- (void)setCct:(id)a3
{
  objc_storeStrong((id *)&self->_cct, a3);
}

- (NSArray)channelData
{
  return self->_channelData;
}

- (void)setChannelData:(id)a3
{
  objc_storeStrong((id *)&self->_channelData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_cct, 0);
  objc_storeStrong((id *)&self->_lux, 0);
  objc_storeStrong((id *)&self->_z, 0);
  objc_storeStrong((id *)&self->_y, 0);
  objc_storeStrong((id *)&self->_x, 0);
}

@end
