@implementation SACInfo

- (SACInfo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SACInfo;
  return -[SACInfo init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SACInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;

  v4 = -[SACInfo init](+[SACInfo allocWithZone:](SACInfo, "allocWithZone:", a3), "init");
  -[SACInfo angle](self, "angle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[SACInfo setAngle:](v4, "setAngle:", v6);

  -[SACInfo position](self, "position");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[SACInfo setPosition:](v4, "setPosition:", v8);

  -[SACInfo role](self, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[SACInfo setRole:](v4, "setRole:", v10);

  -[SACInfo roomGain](self, "roomGain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[SACInfo setRoomGain:](v4, "setRoomGain:", v12);

  v13 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[SACInfo lfeqIR](self, "lfeqIR");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithArray:copyItems:", v14, 1);
  -[SACInfo setLfeqIR:](v4, "setLfeqIR:", v15);

  -[SACInfo spatialAudio](self, "spatialAudio");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  -[SACInfo setSpatialAudio:](v4, "setSpatialAudio:", v17);

  -[SACInfo calibrationMode](self, "calibrationMode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  -[SACInfo setCalibrationMode:](v4, "setCalibrationMode:", v19);

  v20 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[SACInfo companionInfo](self, "companionInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithArray:copyItems:", v21, 1);
  -[SACInfo setCompanionInfo:](v4, "setCompanionInfo:", v22);

  return v4;
}

- (SACInfo)initWithCoder:(id)a3
{
  id v4;
  SACInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = -[SACInfo init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("lfeqImpulseResponse"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SACInfo setLfeqIR:](v5, "setLfeqIR:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("angle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SACInfo setAngle:](v5, "setAngle:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("position"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SACInfo setPosition:](v5, "setPosition:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("role"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SACInfo setRole:](v5, "setRole:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roomGain"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SACInfo setRoomGain:](v5, "setRoomGain:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calibrationMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SACInfo setCalibrationMode:](v5, "setCalibrationMode:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spatialAudio"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SACInfo setSpatialAudio:](v5, "setSpatialAudio:", v15);

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("companionInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SACInfo setCompanionInfo:](v5, "setCompanionInfo:", v19);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SACInfo lfeqIR](self, "lfeqIR");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("lfeqImpulseResponse"));

  -[SACInfo angle](self, "angle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("angle"));

  -[SACInfo position](self, "position");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("position"));

  -[SACInfo role](self, "role");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("role"));

  -[SACInfo roomGain](self, "roomGain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("roomGain"));

  -[SACInfo calibrationMode](self, "calibrationMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("calibrationMode"));

  -[SACInfo spatialAudio](self, "spatialAudio");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("spatialAudio"));

  -[SACInfo companionInfo](self, "companionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("companionInfo"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)calibrationModeDescription:(unint64_t)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  if ((a3 & 2) != 0)
  {
    v3 = CFSTR("Full LF");
    if ((a3 & 4) != 0)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ + %@"), v3, CFSTR("Full HF"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if ((a3 & 1) == 0)
    {
      if ((a3 & 4) != 0)
        v3 = CFSTR("Full HF");
      else
        v3 = 0;
      goto LABEL_10;
    }
    v3 = CFSTR("Partial LF");
    if ((a3 & 4) != 0)
      goto LABEL_8;
  }
LABEL_10:
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("None");
  v5 = v4;

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  float v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("SACInfo <%lu> {\n"), -[SACInfo hash](self, "hash"));
  -[SACInfo angle](self, "angle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SACInfo angle](self, "angle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    objc_msgSend(v3, "appendFormat:", CFSTR("angle = %1.0f\n"), v6);

  }
  -[SACInfo position](self, "position");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SACInfo position](self, "position");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("position = %@\n"), v8);

  }
  -[SACInfo role](self, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SACInfo role](self, "role");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("role = %@\n"), v10);

  }
  -[SACInfo roomGain](self, "roomGain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SACInfo roomGain](self, "roomGain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("room gain = %@\n"), v12);

  }
  -[SACInfo calibrationMode](self, "calibrationMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SACInfo calibrationMode](self, "calibrationMode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SACInfo calibrationModeDescription:](SACInfo, "calibrationModeDescription:", objc_msgSend(v14, "unsignedIntegerValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("calibration level = %@\n"), v15);

  }
  -[SACInfo lfeqIR](self, "lfeqIR");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SACInfo lfeqIR](self, "lfeqIR");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("lfeqIR = NSArray of Size %d\n"), objc_msgSend(v17, "count"));

  }
  -[SACInfo companionInfo](self, "companionInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[SACInfo role](self, "role");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[SACInfo role](self, "role");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("solo"));

      if ((v21 & 1) == 0)
      {
        objc_msgSend(v3, "appendFormat:", CFSTR("companion info = {\n"));
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        -[SACInfo companionInfo](self, "companionInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v49 != v24)
                objc_enumerationMutation(v22);
              v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v26, "role");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v27 == 0;

              if (!v28)
              {
                objc_msgSend(v26, "role");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR("\tCompanion - %@ "), v29);

              }
              objc_msgSend(v26, "position");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v30 == 0;

              if (!v31)
              {
                objc_msgSend(v26, "position");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR("\tposition = %@ "), v32);

              }
              objc_msgSend(v26, "angle");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v33 == 0;

              if (!v34)
              {
                objc_msgSend(v26, "angle");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "floatValue");
                objc_msgSend(v3, "appendFormat:", CFSTR("\tangle = %1.0f "), v36);

              }
              objc_msgSend(v26, "roomGain");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v37 == 0;

              if (!v38)
              {
                objc_msgSend(v26, "roomGain");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR("\troom gain = %@ "), v39);

              }
              objc_msgSend(v26, "calibrationMode");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v40 == 0;

              if (!v41)
              {
                objc_msgSend(v26, "calibrationMode");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                +[SACInfo calibrationModeDescription:](SACInfo, "calibrationModeDescription:", objc_msgSend(v42, "unsignedIntegerValue"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR("\tcalibration level = %@ "), v43);

              }
              objc_msgSend(v26, "lfeqIR");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v44 == 0;

              if (!v45)
              {
                objc_msgSend(v26, "lfeqIR");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR("\tlfeqIR = NSArray of Size %d "), objc_msgSend(v46, "count"));

              }
              objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
          }
          while (v23);
        }

        objc_msgSend(v3, "appendFormat:", CFSTR("  }\n"));
      }
    }
    else
    {

    }
  }
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (NSNumber)angle
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAngle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)position
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPosition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)role
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRole:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)roomGain
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRoomGain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)lfeqIR
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLfeqIR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)spatialAudio
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSpatialAudio:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)calibrationMode
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCalibrationMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)companionInfo
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCompanionInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionInfo, 0);
  objc_storeStrong((id *)&self->_calibrationMode, 0);
  objc_storeStrong((id *)&self->_spatialAudio, 0);
  objc_storeStrong((id *)&self->_lfeqIR, 0);
  objc_storeStrong((id *)&self->_roomGain, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_angle, 0);
}

@end
