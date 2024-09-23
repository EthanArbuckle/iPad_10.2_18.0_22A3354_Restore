@implementation SBPBDisplayItemLayoutAttributes

- (__CFString)semanticSizeTypeForSizeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 0xA)
      return off_1E8EB6070[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsSemanticSizeTypeForSize:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("None")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FullWidth")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FullHeight")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FullWidthAndHeight")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DefaultWidth")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DefaultHeight")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DefaulWidthAndHeight")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ScreenEdgePaddingWidth")) & 1) != 0)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ScreenEdgePaddingHeight")) & 1) != 0)
    {
      v6 = 8;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("ScreenEdgePaddingWidthAndHeight")))
    {
      v6 = 9;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SBPBDisplayItemLayoutAttributes;
  -[SBPBDisplayItemLayoutAttributes description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPBDisplayItemLayoutAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t semanticSizeTypeForSize;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t semanticSizeTypeBeforeOverlapping;
  __CFString *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sizeWidth);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("sizeWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sizeHeight);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sizeHeight"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_centerX);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("centerX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_centerY);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("centerY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastInteractionTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("lastInteractionTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sizingPolicy);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sizingPolicy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_userSizeBeforeOverlappingInBoundsWidth);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("userSizeBeforeOverlappingInBoundsWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_userSizeBeforeOverlappingInBoundsHeight);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("userSizeBeforeOverlappingInBoundsHeight"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_contentOrientation);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("contentOrientation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_referenceBoundsWidthForSize);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("referenceBoundsWidthForSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_referenceBoundsHeightForSize);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("referenceBoundsHeightForSize"));

  semanticSizeTypeForSize = self->_semanticSizeTypeForSize;
  if (semanticSizeTypeForSize >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_semanticSizeTypeForSize);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E8EB6070[semanticSizeTypeForSize];
  }
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("semanticSizeTypeForSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_referenceBoundsWidthBeforeOverlapping);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("referenceBoundsWidthBeforeOverlapping"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_referenceBoundsHeightBeforeOverlapping);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("referenceBoundsHeightBeforeOverlapping"));

  semanticSizeTypeBeforeOverlapping = self->_semanticSizeTypeBeforeOverlapping;
  if (semanticSizeTypeBeforeOverlapping >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_semanticSizeTypeBeforeOverlapping);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E8EB6070[semanticSizeTypeBeforeOverlapping];
  }
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("semanticSizeTypeBeforeOverlapping"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_positionIsSystemManaged);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("positionIsSystemManaged"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SBPBDisplayItemLayoutAttributesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();

}

- (double)copyTo:(uint64_t)a1
{
  double result;

  if (a1)
  {
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 80);
    *(_QWORD *)(a2 + 72) = *(_QWORD *)(a1 + 72);
    *(_QWORD *)(a2 + 8) = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a2 + 88) = *(_QWORD *)(a1 + 88);
    *(_QWORD *)(a2 + 104) = *(_QWORD *)(a1 + 104);
    *(_QWORD *)(a2 + 96) = *(_QWORD *)(a1 + 96);
    *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a2 + 64) = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a2 + 48) = *(_QWORD *)(a1 + 48);
    *(_DWORD *)(a2 + 116) = *(_DWORD *)(a1 + 116);
    *(_QWORD *)(a2 + 56) = *(_QWORD *)(a1 + 56);
    result = *(double *)(a1 + 40);
    *(double *)(a2 + 40) = result;
    *(_DWORD *)(a2 + 112) = *(_DWORD *)(a1 + 112);
    *(_BYTE *)(a2 + 120) = *(_BYTE *)(a1 + 120);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 10) = *(_QWORD *)&self->_sizeWidth;
  *((_QWORD *)result + 9) = *(_QWORD *)&self->_sizeHeight;
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_centerX;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_centerY;
  *((_QWORD *)result + 4) = self->_lastInteractionTime;
  *((_QWORD *)result + 11) = self->_sizingPolicy;
  *((_QWORD *)result + 13) = *(_QWORD *)&self->_userSizeBeforeOverlappingInBoundsWidth;
  *((_QWORD *)result + 12) = *(_QWORD *)&self->_userSizeBeforeOverlappingInBoundsHeight;
  *((_QWORD *)result + 3) = self->_contentOrientation;
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_referenceBoundsWidthForSize;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_referenceBoundsHeightForSize;
  *((_DWORD *)result + 29) = self->_semanticSizeTypeForSize;
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_referenceBoundsWidthBeforeOverlapping;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_referenceBoundsHeightBeforeOverlapping;
  *((_DWORD *)result + 28) = self->_semanticSizeTypeBeforeOverlapping;
  *((_BYTE *)result + 120) = self->_positionIsSystemManaged;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  int v5;
  BOOL v6;

  v4 = (unsigned __int8 *)a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_sizeWidth == *((double *)v4 + 10)
    && self->_sizeHeight == *((double *)v4 + 9)
    && self->_centerX == *((double *)v4 + 1)
    && self->_centerY == *((double *)v4 + 2)
    && self->_lastInteractionTime == *((_QWORD *)v4 + 4)
    && self->_sizingPolicy == *((_QWORD *)v4 + 11)
    && self->_userSizeBeforeOverlappingInBoundsWidth == *((double *)v4 + 13)
    && self->_userSizeBeforeOverlappingInBoundsHeight == *((double *)v4 + 12)
    && self->_contentOrientation == *((_QWORD *)v4 + 3)
    && self->_referenceBoundsWidthForSize == *((double *)v4 + 8)
    && self->_referenceBoundsHeightForSize == *((double *)v4 + 6)
    && self->_semanticSizeTypeForSize == *((_DWORD *)v4 + 29)
    && self->_referenceBoundsWidthBeforeOverlapping == *((double *)v4 + 7)
    && self->_referenceBoundsHeightBeforeOverlapping == *((double *)v4 + 5)
    && self->_semanticSizeTypeBeforeOverlapping == *((_DWORD *)v4 + 28))
  {
    v5 = v4[120];
    if (self->_positionIsSystemManaged)
      v6 = v5 != 0;
    else
      v6 = v5 == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  double sizeWidth;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double sizeHeight;
  double v12;
  long double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  double centerX;
  double v20;
  long double v21;
  double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  double centerY;
  double v28;
  long double v29;
  double v30;
  double v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  double userSizeBeforeOverlappingInBoundsWidth;
  double v37;
  long double v38;
  double v39;
  double v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  double userSizeBeforeOverlappingInBoundsHeight;
  double v46;
  long double v47;
  double v48;
  double v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  int64_t contentOrientation;
  double referenceBoundsWidthForSize;
  double v56;
  long double v57;
  double v58;
  double v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  double referenceBoundsHeightForSize;
  double v65;
  long double v66;
  double v67;
  double v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t semanticSizeTypeForSize;
  double referenceBoundsWidthBeforeOverlapping;
  double v75;
  long double v76;
  double v77;
  double v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  double referenceBoundsHeightBeforeOverlapping;
  double v84;
  long double v85;
  double v86;
  double v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  int64_t sizingPolicy;
  int64_t lastInteractionTime;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;

  sizeWidth = self->_sizeWidth;
  v4 = -sizeWidth;
  if (sizeWidth >= 0.0)
    v4 = self->_sizeWidth;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 >= 0.0)
    v10 = v9;
  v96 = v10;
  sizeHeight = self->_sizeHeight;
  v12 = -sizeHeight;
  if (sizeHeight >= 0.0)
    v12 = self->_sizeHeight;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = fmod(v13, 1.84467441e19);
  v16 = 2654435761u * (unint64_t)v15;
  v17 = v16 + (unint64_t)v14;
  if (v14 <= 0.0)
    v17 = 2654435761u * (unint64_t)v15;
  v18 = v16 - (unint64_t)fabs(v14);
  if (v14 >= 0.0)
    v18 = v17;
  v95 = v18;
  centerX = self->_centerX;
  v20 = -centerX;
  if (centerX >= 0.0)
    v20 = self->_centerX;
  v21 = floor(v20 + 0.5);
  v22 = (v20 - v21) * 1.84467441e19;
  v23 = fmod(v21, 1.84467441e19);
  v24 = 2654435761u * (unint64_t)v23;
  v25 = v24 + (unint64_t)v22;
  if (v22 <= 0.0)
    v25 = 2654435761u * (unint64_t)v23;
  v26 = v24 - (unint64_t)fabs(v22);
  if (v22 >= 0.0)
    v26 = v25;
  v94 = v26;
  centerY = self->_centerY;
  v28 = -centerY;
  if (centerY >= 0.0)
    v28 = self->_centerY;
  v29 = floor(v28 + 0.5);
  v30 = (v28 - v29) * 1.84467441e19;
  v31 = fmod(v29, 1.84467441e19);
  v32 = 2654435761u * (unint64_t)v31;
  v33 = v32 + (unint64_t)v30;
  if (v30 <= 0.0)
    v33 = 2654435761u * (unint64_t)v31;
  v34 = v32 - (unint64_t)fabs(v30);
  if (v30 < 0.0)
    v35 = v34;
  else
    v35 = v33;
  sizingPolicy = self->_sizingPolicy;
  lastInteractionTime = self->_lastInteractionTime;
  userSizeBeforeOverlappingInBoundsWidth = self->_userSizeBeforeOverlappingInBoundsWidth;
  v37 = -userSizeBeforeOverlappingInBoundsWidth;
  if (userSizeBeforeOverlappingInBoundsWidth >= 0.0)
    v37 = self->_userSizeBeforeOverlappingInBoundsWidth;
  v38 = floor(v37 + 0.5);
  v39 = (v37 - v38) * 1.84467441e19;
  v40 = fmod(v38, 1.84467441e19);
  v41 = 2654435761u * (unint64_t)v40;
  v42 = v41 + (unint64_t)v39;
  if (v39 <= 0.0)
    v42 = 2654435761u * (unint64_t)v40;
  v43 = v41 - (unint64_t)fabs(v39);
  if (v39 < 0.0)
    v44 = v43;
  else
    v44 = v42;
  userSizeBeforeOverlappingInBoundsHeight = self->_userSizeBeforeOverlappingInBoundsHeight;
  v46 = -userSizeBeforeOverlappingInBoundsHeight;
  if (userSizeBeforeOverlappingInBoundsHeight >= 0.0)
    v46 = self->_userSizeBeforeOverlappingInBoundsHeight;
  v47 = floor(v46 + 0.5);
  v48 = (v46 - v47) * 1.84467441e19;
  v49 = fmod(v47, 1.84467441e19);
  v50 = 2654435761u * (unint64_t)v49;
  v51 = v50 + (unint64_t)v48;
  if (v48 <= 0.0)
    v51 = 2654435761u * (unint64_t)v49;
  v52 = v50 - (unint64_t)fabs(v48);
  if (v48 < 0.0)
    v53 = v52;
  else
    v53 = v51;
  contentOrientation = self->_contentOrientation;
  referenceBoundsWidthForSize = self->_referenceBoundsWidthForSize;
  v56 = -referenceBoundsWidthForSize;
  if (referenceBoundsWidthForSize >= 0.0)
    v56 = self->_referenceBoundsWidthForSize;
  v57 = floor(v56 + 0.5);
  v58 = (v56 - v57) * 1.84467441e19;
  v59 = fmod(v57, 1.84467441e19);
  v60 = 2654435761u * (unint64_t)v59;
  v61 = v60 + (unint64_t)v58;
  if (v58 <= 0.0)
    v61 = 2654435761u * (unint64_t)v59;
  v62 = v60 - (unint64_t)fabs(v58);
  if (v58 < 0.0)
    v63 = v62;
  else
    v63 = v61;
  referenceBoundsHeightForSize = self->_referenceBoundsHeightForSize;
  v65 = -referenceBoundsHeightForSize;
  if (referenceBoundsHeightForSize >= 0.0)
    v65 = self->_referenceBoundsHeightForSize;
  v66 = floor(v65 + 0.5);
  v67 = (v65 - v66) * 1.84467441e19;
  v68 = fmod(v66, 1.84467441e19);
  v69 = 2654435761u * (unint64_t)v68;
  v70 = v69 + (unint64_t)v67;
  if (v67 <= 0.0)
    v70 = 2654435761u * (unint64_t)v68;
  v71 = v69 - (unint64_t)fabs(v67);
  if (v67 < 0.0)
    v72 = v71;
  else
    v72 = v70;
  semanticSizeTypeForSize = self->_semanticSizeTypeForSize;
  referenceBoundsWidthBeforeOverlapping = self->_referenceBoundsWidthBeforeOverlapping;
  v75 = -referenceBoundsWidthBeforeOverlapping;
  if (referenceBoundsWidthBeforeOverlapping >= 0.0)
    v75 = self->_referenceBoundsWidthBeforeOverlapping;
  v76 = floor(v75 + 0.5);
  v77 = (v75 - v76) * 1.84467441e19;
  v78 = fmod(v76, 1.84467441e19);
  v79 = 2654435761u * (unint64_t)v78;
  v80 = v79 + (unint64_t)v77;
  if (v77 <= 0.0)
    v80 = 2654435761u * (unint64_t)v78;
  v81 = v79 - (unint64_t)fabs(v77);
  if (v77 < 0.0)
    v82 = v81;
  else
    v82 = v80;
  referenceBoundsHeightBeforeOverlapping = self->_referenceBoundsHeightBeforeOverlapping;
  v84 = -referenceBoundsHeightBeforeOverlapping;
  if (referenceBoundsHeightBeforeOverlapping >= 0.0)
    v84 = self->_referenceBoundsHeightBeforeOverlapping;
  v85 = floor(v84 + 0.5);
  v86 = (v84 - v85) * 1.84467441e19;
  v87 = fmod(v85, 1.84467441e19);
  v88 = 2654435761u * (unint64_t)v87;
  v89 = v88 + (unint64_t)v86;
  if (v86 <= 0.0)
    v89 = 2654435761u * (unint64_t)v87;
  v90 = v88 - (unint64_t)fabs(v86);
  if (v86 >= 0.0)
    v90 = v89;
  return v95 ^ v96 ^ v94 ^ v35 ^ (2654435761 * lastInteractionTime) ^ (2654435761 * sizingPolicy) ^ v44 ^ v53 ^ (2654435761 * contentOrientation) ^ v63 ^ v72 ^ (2654435761 * semanticSizeTypeForSize) ^ v82 ^ v90 ^ (2654435761 * self->_semanticSizeTypeBeforeOverlapping) ^ (2654435761 * self->_positionIsSystemManaged);
}

- (double)mergeFrom:(uint64_t)a1
{
  double result;

  if (a1)
  {
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_DWORD *)(a1 + 116) = *(_DWORD *)(a2 + 116);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    result = *(double *)(a2 + 40);
    *(double *)(a1 + 40) = result;
    *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
    *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  }
  return result;
}

- (double)sizeWidth
{
  if (a1)
    return *(double *)(a1 + 80);
  else
    return 0.0;
}

- (uint64_t)setSizeWidth:(uint64_t)result
{
  if (result)
    *(double *)(result + 80) = a2;
  return result;
}

- (double)sizeHeight
{
  if (a1)
    return *(double *)(a1 + 72);
  else
    return 0.0;
}

- (uint64_t)setSizeHeight:(uint64_t)result
{
  if (result)
    *(double *)(result + 72) = a2;
  return result;
}

- (double)centerX
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (uint64_t)setCenterX:(uint64_t)result
{
  if (result)
    *(double *)(result + 8) = a2;
  return result;
}

- (double)centerY
{
  if (a1)
    return *(double *)(a1 + 16);
  else
    return 0.0;
}

- (uint64_t)setCenterY:(uint64_t)result
{
  if (result)
    *(double *)(result + 16) = a2;
  return result;
}

- (uint64_t)lastInteractionTime
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)setLastInteractionTime:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 32) = a2;
  return result;
}

- (uint64_t)sizingPolicy
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (uint64_t)setSizingPolicy:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 88) = a2;
  return result;
}

- (double)userSizeBeforeOverlappingInBoundsWidth
{
  if (a1)
    return *(double *)(a1 + 104);
  else
    return 0.0;
}

- (uint64_t)setUserSizeBeforeOverlappingInBoundsWidth:(uint64_t)result
{
  if (result)
    *(double *)(result + 104) = a2;
  return result;
}

- (double)userSizeBeforeOverlappingInBoundsHeight
{
  if (a1)
    return *(double *)(a1 + 96);
  else
    return 0.0;
}

- (uint64_t)setUserSizeBeforeOverlappingInBoundsHeight:(uint64_t)result
{
  if (result)
    *(double *)(result + 96) = a2;
  return result;
}

- (uint64_t)contentOrientation
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)setContentOrientation:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 24) = a2;
  return result;
}

- (double)referenceBoundsWidthForSize
{
  if (a1)
    return *(double *)(a1 + 64);
  else
    return 0.0;
}

- (uint64_t)setReferenceBoundsWidthForSize:(uint64_t)result
{
  if (result)
    *(double *)(result + 64) = a2;
  return result;
}

- (double)referenceBoundsHeightForSize
{
  if (a1)
    return *(double *)(a1 + 48);
  else
    return 0.0;
}

- (uint64_t)setReferenceBoundsHeightForSize:(uint64_t)result
{
  if (result)
    *(double *)(result + 48) = a2;
  return result;
}

- (uint64_t)semanticSizeTypeForSize
{
  if (result)
    return *(unsigned int *)(result + 116);
  return result;
}

- (uint64_t)setSemanticSizeTypeForSize:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 116) = a2;
  return result;
}

- (double)referenceBoundsWidthBeforeOverlapping
{
  if (a1)
    return *(double *)(a1 + 56);
  else
    return 0.0;
}

- (uint64_t)setReferenceBoundsWidthBeforeOverlapping:(uint64_t)result
{
  if (result)
    *(double *)(result + 56) = a2;
  return result;
}

- (double)referenceBoundsHeightBeforeOverlapping
{
  if (a1)
    return *(double *)(a1 + 40);
  else
    return 0.0;
}

- (uint64_t)setReferenceBoundsHeightBeforeOverlapping:(uint64_t)result
{
  if (result)
    *(double *)(result + 40) = a2;
  return result;
}

- (uint64_t)semanticSizeTypeBeforeOverlapping
{
  if (result)
    return *(unsigned int *)(result + 112);
  return result;
}

- (uint64_t)setSemanticSizeTypeBeforeOverlapping:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 112) = a2;
  return result;
}

- (BOOL)positionIsSystemManaged
{
  if (result)
    return *(_BYTE *)(result + 120) != 0;
  return result;
}

- (uint64_t)setPositionIsSystemManaged:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 120) = a2;
  return result;
}

@end
