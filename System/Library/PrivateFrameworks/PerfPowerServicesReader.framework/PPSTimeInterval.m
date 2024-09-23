@implementation PPSTimeInterval

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PPSTimeInterval endTimestamp](self, "endTimestamp");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("endTimestamp"));
  -[PPSTimeInterval startTimestamp](self, "startTimestamp");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("startTimestamp"));
  -[PPSTimeInterval payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("payload"));

}

- (PPSTimeInterval)initWithCoder:(id)a3
{
  id v4;
  PPSTimeInterval *v5;
  double v6;
  double v7;
  uint64_t v8;
  NSDictionary *payload;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSTimeInterval;
  v5 = -[PPSTimeInterval init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("endTimestamp"));
    v5->_endTimestamp = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startTimestamp"));
    v5->_startTimestamp = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
    v8 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSTimeInterval)initWithStartTimestamp:(double)a3 endTimestamp:(double)a4 payload:(id)a5
{
  id v8;
  PPSTimeInterval *v9;
  PPSTimeInterval *v10;
  NSDictionary *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v8 = a5;
  if (a3 >= a4)
  {
    PPSReaderLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PPSTimeInterval initWithStartTimestamp:endTimestamp:payload:].cold.1((uint64_t)self, v12, v13, v14, v15, v16, v17, v18);

    v10 = 0;
    goto LABEL_7;
  }
  v20.receiver = self;
  v20.super_class = (Class)PPSTimeInterval;
  v9 = -[PPSTimeInterval init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_startTimestamp = a3;
    v9->_endTimestamp = a4;
    v11 = (NSDictionary *)v8;
    self = (PPSTimeInterval *)v10->_payload;
    v10->_payload = v11;
LABEL_7:

  }
  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE60];
  -[PPSTimeInterval startTimestamp](self, "startTimestamp");
  objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v4, "startTimestamp");
  objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[PPSTimeInterval startTimestamp](self, "startTimestamp");
  if (v3 == 0.0)
    v4 = 2654435769;
  else
    v4 = *(_QWORD *)&v3 + 2654435769;
  -[PPSTimeInterval endTimestamp](self, "endTimestamp");
  v14 = 0u;
  v15 = 0u;
  if (v5 == 0.0)
    v6 = 2654435769;
  else
    v6 = *(_QWORD *)&v5 + 2654435769;
  v16 = 0uLL;
  v17 = 0uLL;
  -[PPSTimeInterval payload](self, "payload", (_QWORD)v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v10 = (v6 + (v4 << 6) + (v4 >> 2)) ^ v4;
  if (v9)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v10 ^= (v10 << 6) + 2654435769u + (v10 >> 2) + objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "hash");
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  unsigned __int8 v7;
  PPSTimeInterval *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  if (!v5)
  {
    v7 = 0;
    goto LABEL_18;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v8 = (PPSTimeInterval *)v5;
    if (self == v8)
    {
      v7 = 1;
    }
    else
    {
      -[PPSTimeInterval startTimestamp](self, "startTimestamp");
      v10 = v9;
      -[PPSTimeInterval startTimestamp](v8, "startTimestamp");
      if (v10 == v11)
      {
        -[PPSTimeInterval endTimestamp](self, "endTimestamp");
        v13 = v12;
        -[PPSTimeInterval endTimestamp](v8, "endTimestamp");
        if (v13 == v14)
        {
          -[PPSTimeInterval payload](self, "payload");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15
            || (-[PPSTimeInterval payload](v8, "payload"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[PPSTimeInterval payload](self, "payload");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[PPSTimeInterval payload](v8, "payload");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v16, "isEqualToDictionary:", v17);

            if (v15)
            {
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
            v7 = 1;
          }

          goto LABEL_16;
        }
      }
      v7 = 0;
    }
LABEL_17:

    goto LABEL_18;
  }
  v19.receiver = self;
  v19.super_class = (Class)PPSTimeInterval;
  v7 = -[PPSTimeInterval isEqual:](&v19, sel_isEqual_, v5);
LABEL_18:

  return v7;
}

- (id)JSONRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[PPSTimeInterval dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;

  if (v5)
  {
    PPSReaderLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PPSTimeInterval JSONRepresentation].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSTimeInterval description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;

  -[PPSTimeInterval dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("endTimestamp");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[PPSTimeInterval startTimestamp](self, "startTimestamp");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("startTimestamp");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[PPSTimeInterval endTimestamp](self, "endTimestamp");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("payload");
  -[PPSTimeInterval payload](self, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v9;
}

- (double)duration
{
  double v3;
  double v4;
  double v5;

  -[PPSTimeInterval endTimestamp](self, "endTimestamp");
  v4 = v3;
  -[PPSTimeInterval startTimestamp](self, "startTimestamp");
  return v4 - v5;
}

- (BOOL)containsTimeInterval:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[PPSTimeInterval startTimestamp](self, "startTimestamp");
  v6 = v5;
  objc_msgSend(v4, "startTimestamp");
  if (v6 <= v7)
  {
    -[PPSTimeInterval endTimestamp](self, "endTimestamp");
    v10 = v9;
    objc_msgSend(v4, "endTimestamp");
    v8 = v10 >= v11;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)containsTimestamp:(double)a3
{
  double v5;
  double v7;

  -[PPSTimeInterval startTimestamp](self, "startTimestamp");
  if (v5 > a3)
    return 0;
  -[PPSTimeInterval endTimestamp](self, "endTimestamp");
  return v7 > a3;
}

- (id)intersectionWithTimeInterval:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (-[PPSTimeInterval intersectsTimeInterval:](self, "intersectsTimeInterval:", v4))
  {
    v5 = objc_alloc((Class)objc_opt_class());
    -[PPSTimeInterval startTimestamp](self, "startTimestamp");
    v7 = v6;
    objc_msgSend(v4, "startTimestamp");
    v9 = v8;
    -[PPSTimeInterval endTimestamp](self, "endTimestamp");
    v11 = v10;
    objc_msgSend(v4, "endTimestamp");
    v13 = v12;
    -[PPSTimeInterval payload](self, "payload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v5, "initWithStartTimestamp:endTimestamp:payload:", v14, fmax(v7, v9), fmin(v11, v13));

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)intersectsTimeInterval:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(v4, "endTimestamp");
  v6 = v5;
  -[PPSTimeInterval startTimestamp](self, "startTimestamp");
  if (v6 <= v7)
  {
    v11 = 0;
  }
  else
  {
    -[PPSTimeInterval endTimestamp](self, "endTimestamp");
    v9 = v8;
    objc_msgSend(v4, "startTimestamp");
    v11 = v9 > v10;
  }

  return v11;
}

- (BOOL)isAdjacentToTimeInterval:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[PPSTimeInterval startTimestamp](self, "startTimestamp");
  v6 = v5;
  objc_msgSend(v4, "endTimestamp");
  if (v6 == v7)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v4, "startTimestamp");
    v10 = v9;
    -[PPSTimeInterval endTimestamp](self, "endTimestamp");
    v8 = v10 == v11;
  }

  return v8;
}

- (id)subtractTimeInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v45;
  void *v46;
  _QWORD v47[2];
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[PPSTimeInterval intersectsTimeInterval:](self, "intersectsTimeInterval:", v4))
  {
    v49[0] = self;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if ((objc_msgSend(v4, "containsTimeInterval:", self) & 1) == 0)
  {
    -[PPSTimeInterval intersectionWithTimeInterval:](self, "intersectionWithTimeInterval:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PPSTimeInterval compare:](self, "compare:", v4);
    if (v7 != -1)
    {
      if (v7)
      {
        if (v7 == 1)
        {
          -[PPSTimeInterval endTimestamp](self, "endTimestamp");
          v9 = v8;
          objc_msgSend(v4, "endTimestamp");
          if (v9 > v10)
          {
            v11 = objc_alloc((Class)objc_opt_class());
            objc_msgSend(v6, "endTimestamp");
            v13 = v12;
            -[PPSTimeInterval endTimestamp](self, "endTimestamp");
            v15 = v14;
            -[PPSTimeInterval payload](self, "payload");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v11, "initWithStartTimestamp:endTimestamp:payload:", v16, v13, v15);

            v45 = v17;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
        }
      }
      else
      {
        objc_msgSend(v4, "endTimestamp");
        v36 = v35;
        -[PPSTimeInterval endTimestamp](self, "endTimestamp");
        if (v36 > v37)
        {
          v38 = objc_alloc((Class)objc_opt_class());
          objc_msgSend(v6, "endTimestamp");
          v40 = v39;
          objc_msgSend(v4, "endTimestamp");
          v42 = v41;
          objc_msgSend(v4, "payload");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v38, "initWithStartTimestamp:endTimestamp:payload:", v43, v40, v42);

          v46 = v17;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
      }
      v5 = (void *)MEMORY[0x24BDBD1A8];
LABEL_18:

      goto LABEL_19;
    }
    v19 = objc_alloc((Class)objc_opt_class());
    -[PPSTimeInterval startTimestamp](self, "startTimestamp");
    v21 = v20;
    objc_msgSend(v6, "startTimestamp");
    v23 = v22;
    -[PPSTimeInterval payload](self, "payload");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v19, "initWithStartTimestamp:endTimestamp:payload:", v24, v21, v23);

    -[PPSTimeInterval endTimestamp](self, "endTimestamp");
    v26 = v25;
    objc_msgSend(v4, "endTimestamp");
    if (v26 > v27)
    {
      v28 = objc_alloc((Class)objc_opt_class());
      objc_msgSend(v6, "endTimestamp");
      v30 = v29;
      -[PPSTimeInterval endTimestamp](self, "endTimestamp");
      v32 = v31;
      -[PPSTimeInterval payload](self, "payload");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v28, "initWithStartTimestamp:endTimestamp:payload:", v33, v30, v32);

      v47[0] = v17;
      v47[1] = v34;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
      goto LABEL_18;
    }
    v48 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v5 = (void *)v18;
    goto LABEL_17;
  }
  v5 = (void *)MEMORY[0x24BDBD1A8];
LABEL_19:

  return v5;
}

- (id)unionWithTimeInterval:(id)a3
{
  PPSTimeInterval *v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  PPSTimeInterval **v18;
  PPSTimeInterval *v20;
  PPSTimeInterval *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = (PPSTimeInterval *)a3;
  v5 = -[PPSTimeInterval compare:](self, "compare:", v4);
  if (-[PPSTimeInterval intersectsTimeInterval:](self, "intersectsTimeInterval:", v4)
    || -[PPSTimeInterval isAdjacentToTimeInterval:](self, "isAdjacentToTimeInterval:", v4))
  {
    -[PPSTimeInterval startTimestamp](self, "startTimestamp");
    v7 = v6;
    -[PPSTimeInterval startTimestamp](v4, "startTimestamp");
    v9 = v8;
    -[PPSTimeInterval endTimestamp](self, "endTimestamp");
    v11 = v10;
    -[PPSTimeInterval endTimestamp](v4, "endTimestamp");
    v13 = v12;
    v14 = objc_alloc((Class)objc_opt_class());
    -[PPSTimeInterval payload](self, "payload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithStartTimestamp:endTimestamp:payload:", v15, fmin(v7, v9), fmax(v11, v13));
    v22[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5 == -1)
    {
      v21 = self;
      v18 = &v21;
      self = v4;
    }
    else
    {
      v20 = v4;
      v18 = &v20;
    }
    v18[1] = self;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (NSDictionary)payload
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)initWithStartTimestamp:(uint64_t)a3 endTimestamp:(uint64_t)a4 payload:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2439D9000, a2, a3, "Couldn't initialize <PPSTimeInterval>: %p> due to invalid boundaries", a5, a6, a7, a8, 0);
}

- (void)JSONRepresentation
{
  OUTLINED_FUNCTION_0_4(&dword_2439D9000, a2, a3, "Error while parsing JSON data: %@", a5, a6, a7, a8, 2u);
}

@end
