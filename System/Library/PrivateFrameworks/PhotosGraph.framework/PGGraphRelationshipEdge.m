@implementation PGGraphRelationshipEdge

- (PGGraphRelationshipEdge)initWithRelationship:(id)a3 fromPersonNode:(id)a4 toPersonNode:(id)a5 confidence:(double)a6 status:(unint64_t)a7 familyHolidayAttendanceRate:(double)a8 hasParentContactName:(BOOL)a9 hasSameFamilyNameAsMePerson:(BOOL)a10 numberOfMomentsAtHome:(unint64_t)a11 hasAnniversaryDate:(BOOL)a12 isTopTwoPersonsSocialGroup:(BOOL)a13 numberOfLoveEmojisExchanged:(unint64_t)a14 isTopPerson:(BOOL)a15 friendNightOutAttendanceRate:(double)a16 partnerTripAttendanceRate:(double)a17 friendsAndFamilyTripAttendanceRate:(double)a18 weekendAppearanceRatio:(double)a19 momentsAtWorkAppearanceRate:(double)a20 calendarAttendanceRatio:(double)a21 isPersonAgeDifferentThanMeNode:(BOOL)a22 isPersonOldEnoughToBeParentOrGrandparent:(BOOL)a23 isPersonYoungEnoughToBeMeNodeChild:(BOOL)a24 source:(unsigned __int8)a25
{
  _BOOL4 v25;
  id v39;
  PGGraphRelationshipEdge *v40;
  uint64_t v41;
  NSString *relationship;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  objc_super v50;

  v25 = a10;
  v39 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PGGraphRelationshipEdge;
  v40 = -[PGGraphEdge initWithSourceNode:targetNode:](&v50, sel_initWithSourceNode_targetNode_, a4, a5);
  if (v40)
  {
    v41 = objc_msgSend(v39, "copy");
    relationship = v40->_relationship;
    v40->_relationship = (NSString *)v41;

    v40->_confidence = a6;
    v40->_status = a7;
    v40->_familyHolidayAttendanceRate = a8;
    *((_BYTE *)v40 + 48) = *((_BYTE *)v40 + 48) & 0xFE | a9;
    if (v25)
      v43 = 2;
    else
      v43 = 0;
    *((_BYTE *)v40 + 48) = *((_BYTE *)v40 + 48) & 0xFD | v43;
    *((_DWORD *)v40 + 10) = a11;
    if (a12)
      v44 = 4;
    else
      v44 = 0;
    *((_BYTE *)v40 + 48) = *((_BYTE *)v40 + 48) & 0xFB | v44;
    if (a13)
      v45 = 8;
    else
      v45 = 0;
    *((_BYTE *)v40 + 48) = *((_BYTE *)v40 + 48) & 0xF7 | v45;
    *((_DWORD *)v40 + 11) = a14;
    if (a15)
      v46 = 16;
    else
      v46 = 0;
    *((_BYTE *)v40 + 48) = *((_BYTE *)v40 + 48) & 0xEF | v46;
    v40->_friendNightOutAttendanceRate = a16;
    v40->_partnerTripAttendanceRate = a17;
    v40->_friendsAndFamilyTripAttendanceRate = a18;
    v40->_weekendAppearanceRatio = a19;
    v40->_momentsAtWorkAppearanceRate = a20;
    v40->_calendarAttendanceRatio = a21;
    if (a22)
      v47 = 32;
    else
      v47 = 0;
    *((_BYTE *)v40 + 48) = *((_BYTE *)v40 + 48) & 0xDF | v47;
    if (a23)
      v48 = 64;
    else
      v48 = 0;
    *((_BYTE *)v40 + 48) = *((_BYTE *)v40 + 48) & 0xBF | v48;
    v40->_isPersonYoungEnoughToBeMeNodeChild = a24;
    v40->_source = a25;
  }

  return v40;
}

- (PGGraphRelationshipEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  uint64_t v50;
  void *v51;
  PGGraphRelationshipEdge *v52;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  unsigned int v58;
  unsigned int v59;
  id v60;
  id v61;

  v10 = a7;
  v61 = a5;
  v60 = a4;
  v11 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("confidence"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rfamhol"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rparnam"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rfamnam"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("gwnummmtshome"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rhasanniv"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rtop2sg"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rlovexch"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rtop"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = objc_msgSend(v26, "BOOLValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rfrndnghtout"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v29 = v28;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rprtnrtrip"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v32 = v31;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rfrfamtrip"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "doubleValue");
  v35 = v34;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rwkend"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "doubleValue");
  v38 = v37;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rwork"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "doubleValue");
  v41 = v40;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rcal"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "doubleValue");
  v44 = v43;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ragediff"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v42) = objc_msgSend(v45, "BOOLValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rold"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v45) = objc_msgSend(v46, "BOOLValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rchild"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "BOOLValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("relstatus"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("relsource"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = objc_msgSend(v51, "unsignedIntValue");
  BYTE4(v55) = (_BYTE)v10;
  BYTE3(v55) = v48;
  BYTE2(v55) = (_BYTE)v45;
  BYTE1(v55) = (_BYTE)v42;
  LOBYTE(v55) = (_BYTE)v24;
  BYTE1(v54) = v23;
  LOBYTE(v54) = v56;
  v52 = -[PGGraphRelationshipEdge initWithRelationship:fromPersonNode:toPersonNode:confidence:status:familyHolidayAttendanceRate:hasParentContactName:hasSameFamilyNameAsMePerson:numberOfMomentsAtHome:hasAnniversaryDate:isTopTwoPersonsSocialGroup:numberOfLoveEmojisExchanged:isTopPerson:friendNightOutAttendanceRate:partnerTripAttendanceRate:friendsAndFamilyTripAttendanceRate:weekendAppearanceRatio:momentsAtWorkAppearanceRate:calendarAttendanceRatio:isPersonAgeDifferentThanMeNode:isPersonOldEnoughToBeParentOrGrandparent:isPersonYoungEnoughToBeMeNodeChild:source:](self, "initWithRelationship:fromPersonNode:toPersonNode:confidence:status:familyHolidayAttendanceRate:hasParentContactName:hasSameFamilyNameAsMePerson:numberOfMomentsAtHome:hasAnniversaryDate:isTopTwoPersonsSocialGroup:numberOfLoveEmojisExchanged:isTopPerson:friendNightOutAttendanceRate:partnerTripAttendanceRate:friendsAndFamilyTripAttendanceRate:weekendAppearanceRatio:momentsAtWorkAppearanceRate:calendarAttendanceRatio:isPersonAgeDifferentThanMeNode:isPersonOldEnoughToBeParentOrGrandparent:isPersonYoungEnoughToBeMeNodeChild:source:", v11, v60, v61, v50, v59, v58, v14, v17, v29, v32, v35, v38, v41,
          v44,
          v57,
          v54,
          v25,
          v55);

  return v52;
}

- (PGGraphRelationshipEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  PGGraphRelationshipEdge *v22;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("confidence"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v17);
    *(float *)&v20 = a7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("confidence"));

    v17 = v19;
  }
  v22 = -[PGGraphRelationshipEdge initWithLabel:sourceNode:targetNode:domain:properties:](self, "initWithLabel:sourceNode:targetNode:domain:properties:", v14, v15, v16, v10, v17);

  return v22;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidence"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      if (v8 != self->_confidence)
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rfamhol"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      if (v10 != self->_familyHolidayAttendanceRate)
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rparnam"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "BOOLValue") == ((*((_BYTE *)self + 48) & 1) == 0))
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rfamnam"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "BOOLValue") == ((*((_BYTE *)self + 48) & 2) == 0))
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwnummmtshome"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v13)
    {
      if (objc_msgSend(v13, "unsignedIntegerValue") != *((_DWORD *)self + 10))
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rhasanniv"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "BOOLValue") == ((*((_BYTE *)self + 48) & 4) == 0))
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rtop2sg"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v15)
    {
      if (objc_msgSend(v15, "BOOLValue") == ((*((_BYTE *)self + 48) & 8) == 0))
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rlovexch"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;
    if (v16)
    {
      if (objc_msgSend(v16, "unsignedIntegerValue") != *((_DWORD *)self + 11))
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rtop"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v17)
    {
      if (objc_msgSend(v17, "BOOLValue") == ((*((_BYTE *)self + 48) & 0x10) == 0))
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rfrndnghtout"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    if (v18)
    {
      objc_msgSend(v18, "doubleValue");
      if (v19 != self->_friendNightOutAttendanceRate)
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rprtnrtrip"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v20;
    if (v20)
    {
      objc_msgSend(v20, "doubleValue");
      if (v21 != self->_partnerTripAttendanceRate)
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rfrfamtrip"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
    if (v22)
    {
      objc_msgSend(v22, "doubleValue");
      if (v23 != self->_friendsAndFamilyTripAttendanceRate)
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rwkend"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v24;
    if (v24)
    {
      objc_msgSend(v24, "doubleValue");
      if (v25 != self->_weekendAppearanceRatio)
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rwork"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v26;
    if (v26)
    {
      objc_msgSend(v26, "doubleValue");
      if (v27 != self->_momentsAtWorkAppearanceRate)
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rcal"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v28;
    if (v28)
    {
      objc_msgSend(v28, "doubleValue");
      if (v29 != self->_calendarAttendanceRatio)
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ragediff"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v30;
    if (v30)
    {
      if (objc_msgSend(v30, "BOOLValue") == ((*((_BYTE *)self + 48) & 0x20) == 0))
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rold"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v31;
    if (v31)
    {
      if (objc_msgSend(v31, "BOOLValue") == ((*((_BYTE *)self + 48) & 0x40) == 0))
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rchild"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v32;
    if (v32)
    {
      if (self->_isPersonYoungEnoughToBeMeNodeChild != objc_msgSend(v32, "BOOLValue"))
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relstatus"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v33;
    if (v33)
    {
      if (objc_msgSend(v33, "unsignedIntegerValue") != self->_status)
        goto LABEL_45;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relsource"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v34;
    if (v34 && objc_msgSend(v34, "unsignedIntValue") != self->_source)
LABEL_45:
      v35 = 0;
    else
      v35 = 1;

  }
  else
  {
    v35 = 1;
  }

  return v35;
}

- (id)propertyDictionary
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[20];
  _QWORD v26[22];

  v26[20] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v24;
  v25[1] = CFSTR("rfamhol");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_familyHolidayAttendanceRate);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v23;
  v25[2] = CFSTR("rparnam");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((_BYTE *)self + 48) & 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v22;
  v25[3] = CFSTR("rfamnam");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 48) >> 1) & 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v21;
  v25[4] = CFSTR("gwnummmtshome");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 10));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v20;
  v25[5] = CFSTR("rhasanniv");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 48) >> 2) & 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v19;
  v25[6] = CFSTR("rtop2sg");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 48) >> 3) & 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v18;
  v25[7] = CFSTR("rlovexch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 11));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v17;
  v25[8] = CFSTR("rtop");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 48) >> 4) & 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v16;
  v25[9] = CFSTR("rfrndnghtout");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_friendNightOutAttendanceRate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[9] = v15;
  v25[10] = CFSTR("rprtnrtrip");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_partnerTripAttendanceRate);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[10] = v14;
  v25[11] = CFSTR("rfrfamtrip");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_friendsAndFamilyTripAttendanceRate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[11] = v3;
  v25[12] = CFSTR("rwkend");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_weekendAppearanceRatio);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[12] = v4;
  v25[13] = CFSTR("rwork");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_momentsAtWorkAppearanceRate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[13] = v5;
  v25[14] = CFSTR("rcal");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_calendarAttendanceRatio);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[14] = v6;
  v25[15] = CFSTR("ragediff");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 48) >> 5) & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[15] = v7;
  v25[16] = CFSTR("rold");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 48) >> 6) & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[16] = v8;
  v25[17] = CFSTR("rchild");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPersonYoungEnoughToBeMeNodeChild);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[17] = v9;
  v25[18] = CFSTR("relstatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_status);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[18] = v10;
  v25[19] = CFSTR("relsource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_source);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[19] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)edgeDescription
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *relationship;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[PGGraphRelationshipEdge propertyDictionary](self, "propertyDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[PGGraphRelationshipEdge _readableStringForProperty:](self, "_readableStringForProperty:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), v11, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v15);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB3940];
  v25.receiver = self;
  v25.super_class = (Class)PGGraphRelationshipEdge;
  -[PGGraphOptimizedEdge edgeDescription](&v25, sel_edgeDescription);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  relationship = self->_relationship;
  -[PGGraphRelationshipEdge confidence](self, "confidence");
  v21 = v20;
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ (%@, confidence = %f, %@)"), v18, relationship, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)label
{
  return self->_relationship;
}

- (unsigned)domain
{
  return 300;
}

- (id)_readableStringForProperty:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[20];
  _QWORD v11[21];

  v11[20] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("confidence");
  v10[1] = CFSTR("rfamhol");
  v11[0] = CFSTR("SignalConfidence");
  v11[1] = CFSTR("SignalFamilyHolidayAttendanceRatio");
  v10[2] = CFSTR("rparnam");
  v10[3] = CFSTR("rfamnam");
  v11[2] = CFSTR("SignalHasParentContactName");
  v11[3] = CFSTR("SignalHasSameFamilyNameAsMePerson");
  v10[4] = CFSTR("gwnummmtshome");
  v10[5] = CFSTR("rhasanniv");
  v11[4] = CFSTR("SignalNumberOfMomentsAtHome");
  v11[5] = CFSTR("SignalHasAnniversaryDate");
  v10[6] = CFSTR("rtop2sg");
  v10[7] = CFSTR("rlovexch");
  v11[6] = CFSTR("SignalIsTopTwoPersonsSocialGroup");
  v11[7] = CFSTR("SignalNumberOfLoveEmojisExchanged");
  v10[8] = CFSTR("rtop");
  v10[9] = CFSTR("rfrndnghtout");
  v11[8] = CFSTR("SignalTopPerson");
  v11[9] = CFSTR("SignalFriendNightOutAttendanceRatio");
  v10[10] = CFSTR("rprtnrtrip");
  v10[11] = CFSTR("rfrfamtrip");
  v11[10] = CFSTR("SignalPartnerTripAttendanceRatio");
  v11[11] = CFSTR("SignalFriendsAndFamilyTripAttendanceRatio");
  v10[12] = CFSTR("rwkend");
  v10[13] = CFSTR("rwork");
  v11[12] = CFSTR("SignalWeekendAppearanceRatio");
  v11[13] = CFSTR("SignalCoworkerWorkMomentsRatio");
  v10[14] = CFSTR("rcal");
  v10[15] = CFSTR("ragediff");
  v11[14] = CFSTR("SignalCalendarAttendanceRatio");
  v11[15] = CFSTR("SignalAgeDifferentThanMeNode");
  v10[16] = CFSTR("rold");
  v10[17] = CFSTR("rchild");
  v11[16] = CFSTR("SignalAgeOldEnoughToBeParentOrGrandparent");
  v11[17] = CFSTR("SignalAgeYoungEnoughToBeMeNodeChild");
  v10[18] = CFSTR("relstatus");
  v10[19] = CFSTR("relsource");
  v11[18] = CFSTR("RelationshipStatus");
  v11[19] = CFSTR("RelationshipSource");
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v11, v10, 20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v4;
  v8 = v6;

  return v8;
}

- (NSString)relationship
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (double)confidence
{
  return self->_confidence;
}

- (double)familyHolidayAttendanceRate
{
  return self->_familyHolidayAttendanceRate;
}

- (BOOL)hasParentContactName
{
  return *((_BYTE *)self + 48) & 1;
}

- (BOOL)hasSameFamilyNameAsMePerson
{
  return (*((unsigned __int8 *)self + 48) >> 1) & 1;
}

- (unint64_t)numberOfMomentsAtHome
{
  return *((unsigned int *)self + 10);
}

- (BOOL)hasAnniversaryDate
{
  return (*((unsigned __int8 *)self + 48) >> 2) & 1;
}

- (BOOL)isTopTwoPersonsSocialGroup
{
  return (*((unsigned __int8 *)self + 48) >> 3) & 1;
}

- (unint64_t)numberOfLoveEmojisExchanged
{
  return *((unsigned int *)self + 11);
}

- (BOOL)isTopPerson
{
  return (*((unsigned __int8 *)self + 48) >> 4) & 1;
}

- (double)friendNightOutAttendanceRate
{
  return self->_friendNightOutAttendanceRate;
}

- (double)partnerTripAttendanceRate
{
  return self->_partnerTripAttendanceRate;
}

- (double)friendsAndFamilyTripAttendanceRate
{
  return self->_friendsAndFamilyTripAttendanceRate;
}

- (double)weekendAppearanceRatio
{
  return self->_weekendAppearanceRatio;
}

- (double)momentsAtWorkAppearanceRate
{
  return self->_momentsAtWorkAppearanceRate;
}

- (double)calendarAttendanceRatio
{
  return self->_calendarAttendanceRatio;
}

- (BOOL)isPersonAgeDifferentThanMeNode
{
  return (*((unsigned __int8 *)self + 48) >> 5) & 1;
}

- (BOOL)isPersonOldEnoughToBeParentOrGrandparent
{
  return (*((unsigned __int8 *)self + 48) >> 6) & 1;
}

- (BOOL)isPersonYoungEnoughToBeMeNodeChild
{
  return self->_isPersonYoungEnoughToBeMeNodeChild;
}

- (unint64_t)status
{
  return self->_status;
}

- (unsigned)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationship, 0);
}

+ (id)supportedRelationshipLabels
{
  if (supportedRelationshipLabels_onceToken != -1)
    dispatch_once(&supportedRelationshipLabels_onceToken, &__block_literal_global_3267);
  return (id)supportedRelationshipLabels_supportedRelationshipLabels;
}

+ (id)relationshipSourceToString:(unsigned __int8)a3
{
  if (a3)
    return CFSTR("Megadome");
  else
    return CFSTR("Graph");
}

+ (id)propertiesWithRelationshipSource:(unsigned __int8)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("relsource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)filter
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D42A00]);
  objc_msgSend(a1, "supportedRelationshipLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithLabels:domain:properties:", v4, 300, MEMORY[0x1E0C9AA70]);

  return v5;
}

+ (MAEdgeFilter)confirmedRelationshipFilter
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphRelationshipEdge filter](PGGraphRelationshipEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("relstatus");
  v7[0] = &unk_1E84E2810;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MAEdgeFilter *)v4;
}

+ (MAEdgeFilter)inferredRelationshipFilter
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphRelationshipEdge filter](PGGraphRelationshipEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("relstatus");
  v7[0] = &unk_1E84E2828;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MAEdgeFilter *)v4;
}

+ (id)filterWithRelationship:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D42A00];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithLabel:domain:", v4, 300);

  return v5;
}

+ (id)filterWithRelationship:(id)a3 status:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filterWithRelationship:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("relstatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterBySettingProperties:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)filterWithConfirmedRelationship:(id)a3
{
  return (id)objc_msgSend(a1, "filterWithRelationship:status:", a3, 0);
}

+ (id)filterWithInferredRelationship:(id)a3
{
  return (id)objc_msgSend(a1, "filterWithRelationship:status:", a3, 1);
}

+ (MAEdgeFilter)partnerFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("PARTNER"));
}

+ (MAEdgeFilter)inferredPartnerFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("PARTNER"));
}

+ (MAEdgeFilter)fatherFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("FATHER"));
}

+ (MAEdgeFilter)inferredFatherFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("FATHER"));
}

+ (MAEdgeFilter)motherFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("MOTHER"));
}

+ (MAEdgeFilter)inferredMotherFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("MOTHER"));
}

+ (MAEdgeFilter)brotherFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("BROTHER"));
}

+ (MAEdgeFilter)inferredBrotherFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("BROTHER"));
}

+ (MAEdgeFilter)sisterFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("SISTER"));
}

+ (MAEdgeFilter)inferredSisterFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("SISTER"));
}

+ (MAEdgeFilter)daughterFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("DAUGHTER"));
}

+ (MAEdgeFilter)inferredDaughterFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("DAUGHTER"));
}

+ (MAEdgeFilter)sonFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("SON"));
}

+ (MAEdgeFilter)inferredSonFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("SON"));
}

+ (MAEdgeFilter)parentFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("PARENT"));
}

+ (MAEdgeFilter)inferredParentFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("PARENT"));
}

+ (MAEdgeFilter)familyFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("FAMILY"));
}

+ (MAEdgeFilter)inferredFamilyFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("FAMILY"));
}

+ (MAEdgeFilter)familySocialGroupFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("FAMILY_SOCIALGROUP"));
}

+ (MAEdgeFilter)inferredFamilySocialGroupFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("FAMILY_SOCIALGROUP"));
}

+ (MAEdgeFilter)childFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("CHILD"));
}

+ (MAEdgeFilter)inferredChildFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("CHILD"));
}

+ (MAEdgeFilter)friendFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("FRIEND"));
}

+ (MAEdgeFilter)inferredFriendFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("FRIEND"));
}

+ (MAEdgeFilter)coworkerFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("COWORKER"));
}

+ (MAEdgeFilter)inferredCoworkerFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("COWORKER"));
}

+ (MAEdgeFilter)coworkerSocialGroupFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("COWORKER_SOCIALGROUP"));
}

+ (MAEdgeFilter)inferredCoworkerSocialGroupFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("COWORKER_SOCIALGROUP"));
}

+ (MAEdgeFilter)acquaintanceFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("ACQUAINTANCE"));
}

+ (MAEdgeFilter)inferredAcquaintanceFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("ACQUAINTANCE"));
}

+ (MAEdgeFilter)vipFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithConfirmedRelationship:", CFSTR("VIP"));
}

+ (MAEdgeFilter)inferredVipFilter
{
  return (MAEdgeFilter *)objc_msgSend(a1, "filterWithInferredRelationship:", CFSTR("VIP"));
}

+ (id)filterWithSource:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphRelationshipEdge filter](PGGraphRelationshipEdge, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("relsource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)familyRelationshipLabels
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[10];

  v6[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("FAMILY");
  v6[1] = CFSTR("SISTER");
  v6[2] = CFSTR("BROTHER");
  v6[3] = CFSTR("PARENT");
  v6[4] = CFSTR("MOTHER");
  v6[5] = CFSTR("FATHER");
  v6[6] = CFSTR("CHILD");
  v6[7] = CFSTR("DAUGHTER");
  v6[8] = CFSTR("SON");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __54__PGGraphRelationshipEdge_supportedRelationshipLabels__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[18];

  v4[17] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("PARTNER");
  v4[1] = CFSTR("FATHER");
  v4[2] = CFSTR("MOTHER");
  v4[3] = CFSTR("BROTHER");
  v4[4] = CFSTR("SISTER");
  v4[5] = CFSTR("DAUGHTER");
  v4[6] = CFSTR("SON");
  v4[7] = CFSTR("PARENT");
  v4[8] = CFSTR("FAMILY");
  v4[9] = CFSTR("FAMILY_SOCIALGROUP");
  v4[10] = CFSTR("CHILD");
  v4[11] = CFSTR("FRIEND");
  v4[12] = CFSTR("COWORKER");
  v4[13] = CFSTR("COWORKER_SOCIALGROUP");
  v4[14] = CFSTR("ACQUAINTANCE");
  v4[15] = CFSTR("VIP");
  v4[16] = CFSTR("HOUSEHOLD_MEMBER");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 17);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportedRelationshipLabels_supportedRelationshipLabels;
  supportedRelationshipLabels_supportedRelationshipLabels = v2;

}

@end
