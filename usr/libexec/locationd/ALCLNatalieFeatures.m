@implementation ALCLNatalieFeatures

- (id)fEpochTypeAsString:(int)a3
{
  if (a3 >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_10213EB88 + a3);
}

- (int)StringAsFEpochType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kInvalidEpoch")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("K2560MsType")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("k10240MsType")))
    return 2;
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLNatalieFeatures;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLNatalieFeatures description](&v3, "description"), -[ALCLNatalieFeatures dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t fEpochType;
  NSString *v10;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  *(float *)&v4 = self->_fVectorMagnitude;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("fVectorMagnitude"));
  *(float *)&v5 = self->_fIQRX;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5), CFSTR("fIQRX"));
  *(float *)&v6 = self->_fIQRY;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("fIQRY"));
  *(float *)&v7 = self->_fIQRZ;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7), CFSTR("fIQRZ"));
  *(float *)&v8 = self->_fMachineFrequency;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8), CFSTR("fMachineFrequency"));
  fEpochType = self->_fEpochType;
  if (fEpochType >= 3)
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_fEpochType);
  else
    v10 = (NSString *)*(&off_10213EB88 + fEpochType);
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("fEpochType"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_fStanding), CFSTR("fStanding"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004C642C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteFloatField(a3, 1, self->_fVectorMagnitude);
  PBDataWriterWriteFloatField(a3, 2, self->_fIQRX);
  PBDataWriterWriteFloatField(a3, 3, self->_fIQRY);
  PBDataWriterWriteFloatField(a3, 4, self->_fIQRZ);
  PBDataWriterWriteFloatField(a3, 5, self->_fMachineFrequency);
  PBDataWriterWriteInt32Field(a3, self->_fEpochType, 6);
  PBDataWriterWriteBOOLField(a3, self->_fStanding, 7);
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 7) = LODWORD(self->_fVectorMagnitude);
  *((_DWORD *)a3 + 3) = LODWORD(self->_fIQRX);
  *((_DWORD *)a3 + 4) = LODWORD(self->_fIQRY);
  *((_DWORD *)a3 + 5) = LODWORD(self->_fIQRZ);
  *((_DWORD *)a3 + 6) = LODWORD(self->_fMachineFrequency);
  *((_DWORD *)a3 + 2) = self->_fEpochType;
  *((_BYTE *)a3 + 32) = self->_fStanding;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 7) = LODWORD(self->_fVectorMagnitude);
  *((_DWORD *)result + 3) = LODWORD(self->_fIQRX);
  *((_DWORD *)result + 4) = LODWORD(self->_fIQRY);
  *((_DWORD *)result + 5) = LODWORD(self->_fIQRZ);
  *((_DWORD *)result + 6) = LODWORD(self->_fMachineFrequency);
  *((_DWORD *)result + 2) = self->_fEpochType;
  *((_BYTE *)result + 32) = self->_fStanding;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_fVectorMagnitude == *((float *)a3 + 7)
      && self->_fIQRX == *((float *)a3 + 3)
      && self->_fIQRY == *((float *)a3 + 4)
      && self->_fIQRZ == *((float *)a3 + 5)
      && self->_fMachineFrequency == *((float *)a3 + 6)
      && self->_fEpochType == *((_DWORD *)a3 + 2))
    {
      v6 = *((unsigned __int8 *)a3 + 32);
      if (self->_fStanding)
        LOBYTE(v5) = v6 != 0;
      else
        LOBYTE(v5) = v6 == 0;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  float fVectorMagnitude;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float fIQRX;
  float v13;
  float v14;
  float v15;
  float v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  float fIQRY;
  float v22;
  float v23;
  float v24;
  float v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  float fIQRZ;
  float v31;
  float v32;
  float v33;
  float v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  float fMachineFrequency;
  float v40;
  float v41;
  float v42;
  float v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;

  fVectorMagnitude = self->_fVectorMagnitude;
  v4 = -fVectorMagnitude;
  if (fVectorMagnitude >= 0.0)
    v4 = self->_fVectorMagnitude;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = fmodf(v5, 1.8447e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  fIQRX = self->_fIQRX;
  v13 = -fIQRX;
  if (fIQRX >= 0.0)
    v13 = self->_fIQRX;
  v14 = floorf(v13 + 0.5);
  v15 = (float)(v13 - v14) * 1.8447e19;
  v16 = fmodf(v14, 1.8447e19);
  v17 = 2654435761u * (unint64_t)v16;
  v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0)
    v18 = 2654435761u * (unint64_t)v16;
  v19 = v17 - (unint64_t)fabsf(v15);
  if (v15 < 0.0)
    v20 = v19;
  else
    v20 = v18;
  fIQRY = self->_fIQRY;
  v22 = -fIQRY;
  if (fIQRY >= 0.0)
    v22 = self->_fIQRY;
  v23 = floorf(v22 + 0.5);
  v24 = (float)(v22 - v23) * 1.8447e19;
  v25 = fmodf(v23, 1.8447e19);
  v26 = 2654435761u * (unint64_t)v25;
  v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0)
    v27 = 2654435761u * (unint64_t)v25;
  v28 = v26 - (unint64_t)fabsf(v24);
  if (v24 < 0.0)
    v29 = v28;
  else
    v29 = v27;
  fIQRZ = self->_fIQRZ;
  v31 = -fIQRZ;
  if (fIQRZ >= 0.0)
    v31 = self->_fIQRZ;
  v32 = floorf(v31 + 0.5);
  v33 = (float)(v31 - v32) * 1.8447e19;
  v34 = fmodf(v32, 1.8447e19);
  v35 = 2654435761u * (unint64_t)v34;
  v36 = v35 + (unint64_t)v33;
  if (v33 <= 0.0)
    v36 = 2654435761u * (unint64_t)v34;
  v37 = v35 - (unint64_t)fabsf(v33);
  if (v33 < 0.0)
    v38 = v37;
  else
    v38 = v36;
  fMachineFrequency = self->_fMachineFrequency;
  v40 = -fMachineFrequency;
  if (fMachineFrequency >= 0.0)
    v40 = self->_fMachineFrequency;
  v41 = floorf(v40 + 0.5);
  v42 = (float)(v40 - v41) * 1.8447e19;
  v43 = fmodf(v41, 1.8447e19);
  v44 = 2654435761u * (unint64_t)v43;
  v45 = v44 + (unint64_t)v42;
  if (v42 <= 0.0)
    v45 = 2654435761u * (unint64_t)v43;
  v46 = v44 - (unint64_t)fabsf(v42);
  if (v42 >= 0.0)
    v46 = v45;
  return v20 ^ v11 ^ v29 ^ v38 ^ v46 ^ (2654435761 * self->_fEpochType) ^ (2654435761 * self->_fStanding);
}

- (void)mergeFrom:(id)a3
{
  self->_fVectorMagnitude = *((float *)a3 + 7);
  self->_fIQRX = *((float *)a3 + 3);
  self->_fIQRY = *((float *)a3 + 4);
  self->_fIQRZ = *((float *)a3 + 5);
  self->_fMachineFrequency = *((float *)a3 + 6);
  self->_fEpochType = *((_DWORD *)a3 + 2);
  self->_fStanding = *((_BYTE *)a3 + 32);
}

- (float)fVectorMagnitude
{
  return self->_fVectorMagnitude;
}

- (void)setFVectorMagnitude:(float)a3
{
  self->_fVectorMagnitude = a3;
}

- (float)fIQRX
{
  return self->_fIQRX;
}

- (void)setFIQRX:(float)a3
{
  self->_fIQRX = a3;
}

- (float)fIQRY
{
  return self->_fIQRY;
}

- (void)setFIQRY:(float)a3
{
  self->_fIQRY = a3;
}

- (float)fIQRZ
{
  return self->_fIQRZ;
}

- (void)setFIQRZ:(float)a3
{
  self->_fIQRZ = a3;
}

- (float)fMachineFrequency
{
  return self->_fMachineFrequency;
}

- (void)setFMachineFrequency:(float)a3
{
  self->_fMachineFrequency = a3;
}

- (int)fEpochType
{
  return self->_fEpochType;
}

- (void)setFEpochType:(int)a3
{
  self->_fEpochType = a3;
}

- (BOOL)fStanding
{
  return self->_fStanding;
}

- (void)setFStanding:(BOOL)a3
{
  self->_fStanding = a3;
}

@end
