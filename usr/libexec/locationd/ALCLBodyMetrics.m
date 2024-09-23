@implementation ALCLBodyMetrics

- (id)genderAsString:(int)a3
{
  if (!a3)
    return CFSTR("kGenderMale");
  if (a3 == 1)
    return CFSTR("kGenderFemale");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsGender:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kGenderMale")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("kGenderFemale"));
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLBodyMetrics;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLBodyMetrics description](&v3, "description"), -[ALCLBodyMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  int gender;
  const __CFString *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  gender = self->_gender;
  if (gender)
  {
    if (gender == 1)
      v5 = CFSTR("kGenderFemale");
    else
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_gender);
  }
  else
  {
    v5 = CFSTR("kGenderMale");
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("gender"));
  *(float *)&v6 = self->_heightM;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("heightM"));
  *(float *)&v7 = self->_weightKG;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7), CFSTR("weightKG"));
  *(float *)&v8 = self->_vo2max;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8), CFSTR("vo2max"));
  *(float *)&v9 = self->_age;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9), CFSTR("age"));
  *(float *)&v10 = self->_hrmin;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10), CFSTR("hrmin"));
  *(float *)&v11 = self->_hrmax;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11), CFSTR("hrmax"));
  *(float *)&v12 = self->_hronset;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v12), CFSTR("hronset"));
  *(float *)&v13 = self->_pal;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13), CFSTR("pal"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004CF5F0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field(a3, self->_gender, 1);
  PBDataWriterWriteFloatField(a3, 2, self->_heightM);
  PBDataWriterWriteFloatField(a3, 3, self->_weightKG);
  PBDataWriterWriteFloatField(a3, 4, self->_vo2max);
  PBDataWriterWriteFloatField(a3, 5, self->_age);
  PBDataWriterWriteFloatField(a3, 6, self->_hrmin);
  PBDataWriterWriteFloatField(a3, 7, self->_hrmax);
  PBDataWriterWriteFloatField(a3, 8, self->_hronset);
  PBDataWriterWriteFloatField(a3, 9, self->_pal);
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = self->_gender;
  *((_DWORD *)a3 + 4) = LODWORD(self->_heightM);
  *((_DWORD *)a3 + 10) = LODWORD(self->_weightKG);
  *((_DWORD *)a3 + 9) = LODWORD(self->_vo2max);
  *((_DWORD *)a3 + 2) = LODWORD(self->_age);
  *((_DWORD *)a3 + 6) = LODWORD(self->_hrmin);
  *((_DWORD *)a3 + 5) = LODWORD(self->_hrmax);
  *((_DWORD *)a3 + 7) = LODWORD(self->_hronset);
  *((_DWORD *)a3 + 8) = LODWORD(self->_pal);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = self->_gender;
  *((_DWORD *)result + 4) = LODWORD(self->_heightM);
  *((_DWORD *)result + 10) = LODWORD(self->_weightKG);
  *((_DWORD *)result + 9) = LODWORD(self->_vo2max);
  *((_DWORD *)result + 2) = LODWORD(self->_age);
  *((_DWORD *)result + 6) = LODWORD(self->_hrmin);
  *((_DWORD *)result + 5) = LODWORD(self->_hrmax);
  *((_DWORD *)result + 7) = LODWORD(self->_hronset);
  *((_DWORD *)result + 8) = LODWORD(self->_pal);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
    LOBYTE(v5) = self->_gender == *((_DWORD *)a3 + 3)
              && self->_heightM == *((float *)a3 + 4)
              && self->_weightKG == *((float *)a3 + 10)
              && self->_vo2max == *((float *)a3 + 9)
              && self->_age == *((float *)a3 + 2)
              && self->_hrmin == *((float *)a3 + 6)
              && self->_hrmax == *((float *)a3 + 5)
              && self->_hronset == *((float *)a3 + 7)
              && self->_pal == *((float *)a3 + 8);
  return v5;
}

- (unint64_t)hash
{
  uint64_t gender;
  float heightM;
  float v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  float weightKG;
  float v14;
  float v15;
  float v16;
  float v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  float vo2max;
  float v23;
  float v24;
  float v25;
  float v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  float age;
  float v32;
  float v33;
  float v34;
  float v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  float hrmin;
  float v41;
  float v42;
  float v43;
  float v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  float hrmax;
  float v50;
  float v51;
  float v52;
  float v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  float hronset;
  float v59;
  float v60;
  float v61;
  float v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  float pal;
  float v68;
  float v69;
  float v70;
  float v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;

  gender = self->_gender;
  heightM = self->_heightM;
  v5 = -heightM;
  if (heightM >= 0.0)
    v5 = self->_heightM;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = fmodf(v6, 1.8447e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabsf(v7);
  if (v7 < 0.0)
    v12 = v11;
  else
    v12 = v10;
  weightKG = self->_weightKG;
  v14 = -weightKG;
  if (weightKG >= 0.0)
    v14 = self->_weightKG;
  v15 = floorf(v14 + 0.5);
  v16 = (float)(v14 - v15) * 1.8447e19;
  v17 = fmodf(v15, 1.8447e19);
  v18 = 2654435761u * (unint64_t)v17;
  v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0)
    v19 = 2654435761u * (unint64_t)v17;
  v20 = v18 - (unint64_t)fabsf(v16);
  if (v16 < 0.0)
    v21 = v20;
  else
    v21 = v19;
  vo2max = self->_vo2max;
  v23 = -vo2max;
  if (vo2max >= 0.0)
    v23 = self->_vo2max;
  v24 = floorf(v23 + 0.5);
  v25 = (float)(v23 - v24) * 1.8447e19;
  v26 = fmodf(v24, 1.8447e19);
  v27 = 2654435761u * (unint64_t)v26;
  v28 = v27 + (unint64_t)v25;
  if (v25 <= 0.0)
    v28 = 2654435761u * (unint64_t)v26;
  v29 = v27 - (unint64_t)fabsf(v25);
  if (v25 < 0.0)
    v30 = v29;
  else
    v30 = v28;
  age = self->_age;
  v32 = -age;
  if (age >= 0.0)
    v32 = self->_age;
  v33 = floorf(v32 + 0.5);
  v34 = (float)(v32 - v33) * 1.8447e19;
  v35 = fmodf(v33, 1.8447e19);
  v36 = 2654435761u * (unint64_t)v35;
  v37 = v36 + (unint64_t)v34;
  if (v34 <= 0.0)
    v37 = 2654435761u * (unint64_t)v35;
  v38 = v36 - (unint64_t)fabsf(v34);
  if (v34 < 0.0)
    v39 = v38;
  else
    v39 = v37;
  hrmin = self->_hrmin;
  v41 = -hrmin;
  if (hrmin >= 0.0)
    v41 = self->_hrmin;
  v42 = floorf(v41 + 0.5);
  v43 = (float)(v41 - v42) * 1.8447e19;
  v44 = fmodf(v42, 1.8447e19);
  v45 = 2654435761u * (unint64_t)v44;
  v46 = v45 + (unint64_t)v43;
  if (v43 <= 0.0)
    v46 = 2654435761u * (unint64_t)v44;
  v47 = v45 - (unint64_t)fabsf(v43);
  if (v43 < 0.0)
    v48 = v47;
  else
    v48 = v46;
  hrmax = self->_hrmax;
  v50 = -hrmax;
  if (hrmax >= 0.0)
    v50 = self->_hrmax;
  v51 = floorf(v50 + 0.5);
  v52 = (float)(v50 - v51) * 1.8447e19;
  v53 = fmodf(v51, 1.8447e19);
  v54 = 2654435761u * (unint64_t)v53;
  v55 = v54 + (unint64_t)v52;
  if (v52 <= 0.0)
    v55 = 2654435761u * (unint64_t)v53;
  v56 = v54 - (unint64_t)fabsf(v52);
  if (v52 < 0.0)
    v57 = v56;
  else
    v57 = v55;
  hronset = self->_hronset;
  v59 = -hronset;
  if (hronset >= 0.0)
    v59 = self->_hronset;
  v60 = floorf(v59 + 0.5);
  v61 = (float)(v59 - v60) * 1.8447e19;
  v62 = fmodf(v60, 1.8447e19);
  v63 = 2654435761u * (unint64_t)v62;
  v64 = v63 + (unint64_t)v61;
  if (v61 <= 0.0)
    v64 = 2654435761u * (unint64_t)v62;
  v65 = v63 - (unint64_t)fabsf(v61);
  if (v61 < 0.0)
    v66 = v65;
  else
    v66 = v64;
  pal = self->_pal;
  v68 = -pal;
  if (pal >= 0.0)
    v68 = self->_pal;
  v69 = floorf(v68 + 0.5);
  v70 = (float)(v68 - v69) * 1.8447e19;
  v71 = fmodf(v69, 1.8447e19);
  v72 = 2654435761u * (unint64_t)v71;
  v73 = v72 + (unint64_t)v70;
  if (v70 <= 0.0)
    v73 = 2654435761u * (unint64_t)v71;
  v74 = v72 - (unint64_t)fabsf(v70);
  if (v70 >= 0.0)
    v74 = v73;
  return v12 ^ v30 ^ (2654435761 * gender) ^ v21 ^ v39 ^ v48 ^ v57 ^ v66 ^ v74;
}

- (void)mergeFrom:(id)a3
{
  self->_gender = *((_DWORD *)a3 + 3);
  self->_heightM = *((float *)a3 + 4);
  self->_weightKG = *((float *)a3 + 10);
  self->_vo2max = *((float *)a3 + 9);
  self->_age = *((float *)a3 + 2);
  self->_hrmin = *((float *)a3 + 6);
  self->_hrmax = *((float *)a3 + 5);
  self->_hronset = *((float *)a3 + 7);
  self->_pal = *((float *)a3 + 8);
}

- (int)gender
{
  return self->_gender;
}

- (void)setGender:(int)a3
{
  self->_gender = a3;
}

- (float)heightM
{
  return self->_heightM;
}

- (void)setHeightM:(float)a3
{
  self->_heightM = a3;
}

- (float)weightKG
{
  return self->_weightKG;
}

- (void)setWeightKG:(float)a3
{
  self->_weightKG = a3;
}

- (float)vo2max
{
  return self->_vo2max;
}

- (void)setVo2max:(float)a3
{
  self->_vo2max = a3;
}

- (float)age
{
  return self->_age;
}

- (void)setAge:(float)a3
{
  self->_age = a3;
}

- (float)hrmin
{
  return self->_hrmin;
}

- (void)setHrmin:(float)a3
{
  self->_hrmin = a3;
}

- (float)hrmax
{
  return self->_hrmax;
}

- (void)setHrmax:(float)a3
{
  self->_hrmax = a3;
}

- (float)hronset
{
  return self->_hronset;
}

- (void)setHronset:(float)a3
{
  self->_hronset = a3;
}

- (float)pal
{
  return self->_pal;
}

- (void)setPal:(float)a3
{
  self->_pal = a3;
}

@end
