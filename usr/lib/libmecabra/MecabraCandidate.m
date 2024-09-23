@implementation MecabraCandidate

- (void)rawCandidate
{
  return self->_rawCandidate;
}

- (void)dealloc
{
  void *rawCandidate;
  objc_super v4;

  rawCandidate = self->_rawCandidate;
  if (rawCandidate)
  {
    (*(void (**)(void *, SEL))(*(_QWORD *)rawCandidate + 16))(rawCandidate, a2);
    self->_rawCandidate = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MecabraCandidate;
  -[MecabraCandidate dealloc](&v4, sel_dealloc);
}

- (id)surface
{
  uint64_t v2;
  id result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  result = (id)objc_msgSend_rawCandidate(self, a2, v2);
  if (result)
  {
    v4 = result;
    v5 = (*(uint64_t (**)(id))(*(_QWORD *)result + 40))(result);
    v6 = 40;
    if (!v5)
      v6 = 24;
    return (id)(*(uint64_t (**)(_QWORD *))(*v4 + v6))(v4);
  }
  return result;
}

- (id)string
{
  uint64_t v2;
  id result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  result = (id)objc_msgSend_rawCandidate(self, a2, v2);
  if (result)
  {
    v4 = result;
    v5 = (*(uint64_t (**)(id))(*(_QWORD *)result + 40))(result);
    v6 = 40;
    if (!v5)
      v6 = 24;
    return (id)(*(uint64_t (**)(_QWORD *))(*v4 + v6))(v4);
  }
  return result;
}

- (id)category
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = objc_msgSend_rawCandidate(self, a2, v2);
  if (!v3)
    return 0;
  v4 = v3;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v3 + 72))(v3) != 1
    && (*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 72))(v4) != 7)
  {
    return 0;
  }
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 136))(v4);
  return (id)MEMORY[0x24BEDD108](v5, sel_valueForKey_, CFSTR("category"));
}

- (id)analysisString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend_rawCandidate(self, a2, v2);
  if (v3
    && ((v4 = v3, (*(unsigned int (**)(uint64_t))(*(_QWORD *)v3 + 72))(v3) == 1)
     || (*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 72))(v4) == 7
     || (*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 72))(v4) == 6))
  {
    return (id)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 56))(v4);
  }
  else
  {
    return 0;
  }
}

- (id)convertedAnalysisString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = objc_msgSend_rawCandidate(self, a2, v2);
  if (v3)
  {
    v4 = v3;
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v3 + 72))(v3) == 1
      || (*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 72))(v4) == 7)
    {
      v5 = 28;
      return (id)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 8 * v5))(v4);
    }
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 72))(v4) == 6)
    {
      v5 = 22;
      return (id)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 8 * v5))(v4);
    }
  }
  return 0;
}

- (id)dictionaryReading
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = objc_msgSend_rawCandidate(self, a2, v2);
  if (v3)
  {
    v4 = v3;
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v3 + 72))(v3) == 1
      || (*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 72))(v4) == 7)
    {
      v5 = 29;
      return (id)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 8 * v5))(v4);
    }
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 72))(v4) == 6)
    {
      v5 = 23;
      return (id)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 8 * v5))(v4);
    }
  }
  return 0;
}

- (id)attributes
{
  uint64_t v2;
  id result;

  result = (id)objc_msgSend_rawCandidate(self, a2, v2);
  if (result)
    return (id)(*(uint64_t (**)(id))(*(_QWORD *)result + 136))(result);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  const char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;

  result = (id)objc_msgSend_rawCandidate(self, a2, (uint64_t)a3);
  if (result)
  {
    v8 = (char *)objc_msgSend_rawCandidate(self, v6, v7);
    v9 = (**(uint64_t (***)(char *))&v8[*(_QWORD *)(*(_QWORD *)v8 - 32)])(&v8[*(_QWORD *)(*(_QWORD *)v8 - 32)]);
    v11 = (void *)objc_msgSend_allocWithZone_(MecabraCandidate, v10, (uint64_t)a3);
    return (id)objc_msgSend_initWithCandidate_(v11, v12, v9);
  }
  return result;
}

- (MecabraCandidate)initWithCandidate:(void *)a3
{
  MecabraCandidate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MecabraCandidate;
  result = -[MecabraCandidate init](&v5, sel_init);
  if (result)
    result->_rawCandidate = a3;
  return result;
}

- (id)convertedAnalysisStringForFirstSyllable
{
  uint64_t v2;
  __CFArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  const char *v24;

  v4 = MecabraCandidateCopySyllableLengthArrayInAnalysisString(self, a2, v2);
  if (objc_msgSend_count(v4, v5, v6))
  {
    v8 = (void *)objc_msgSend_objectAtIndex_(v4, v7, 0);
    v11 = objc_msgSend_intValue(v8, v9, v10);
    v14 = (void *)objc_msgSend_analysisString(self, v12, v13);
    v19 = 0;
    if (objc_msgSend_length(v14, v15, v16) >= (unint64_t)v11)
    {
      v20 = (void *)objc_msgSend_convertedAnalysisString(self, v17, v18);
      v23 = objc_msgSend_intValue(v8, v21, v22);
      v19 = (void *)objc_msgSend_substringToIndex_(v20, v24, v23);
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)description
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  double v30;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;

  v4 = objc_msgSend_rawCandidate(self, a2, v2);
  if (v4
    && ((v7 = v4, (*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 72))(v4) == 1)
     || (*(unsigned int (**)(uint64_t))(*(_QWORD *)v7 + 72))(v7) == 7))
  {
    v8 = objc_msgSend_rawCandidate(self, v5, v6);
    v9 = (*(double (**)(uint64_t))(*(_QWORD *)v8 + 392))(v8);
    v10 = (void *)MEMORY[0x24BDD17C8];
    v13 = objc_msgSend_rawCandidate(self, v11, v12);
    v16 = (_QWORD *)v13;
    if (v13)
    {
      v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v13 + 40))(v13);
      v18 = 40;
      if (!v17)
        v18 = 24;
      v16 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v16 + v18))(v16);
    }
    v19 = objc_msgSend_analysisString(self, v14, v15);
    v22 = objc_msgSend_convertedAnalysisString(self, v20, v21);
    v25 = objc_msgSend_dictionaryReading(self, v23, v24);
    v28 = objc_msgSend_rawCandidate(self, v26, v27);
    if (v28)
      v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v28 + 112))(v28);
    v30 = -1000.0;
    if (v9 != -1.79769313e308)
      v30 = v9;
    return (id)objc_msgSend_stringWithFormat_(v10, v29, (uint64_t)CFSTR("%@ (AS:%@ CAS:%@ DR:%@), %d, %f"), v16, v19, v22, v25, v28, *(_QWORD *)&v30);
  }
  else
  {
    v32 = (void *)MEMORY[0x24BDD17C8];
    v33 = objc_msgSend_rawCandidate(self, v5, v6);
    v36 = (_QWORD *)v33;
    if (v33)
    {
      v37 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v33 + 40))(v33);
      v38 = 40;
      if (!v37)
        v38 = 24;
      v36 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v36 + v38))(v36);
    }
    v39 = objc_msgSend_analysisString(self, v34, v35);
    v42 = objc_msgSend_convertedAnalysisString(self, v40, v41);
    v45 = objc_msgSend_dictionaryReading(self, v43, v44);
    v48 = objc_msgSend_rawCandidate(self, v46, v47);
    if (v48)
      v48 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v48 + 112))(v48);
    return (id)objc_msgSend_stringWithFormat_(v32, v49, (uint64_t)CFSTR("%@ (AS:%@ CAS:%@ DR:%@), %d"), v36, v39, v42, v45, v48);
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int isEqualToString;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;

  v5 = objc_msgSend_rawCandidate(self, a2, (uint64_t)a3);
  v8 = v5;
  if (v5)
  {
    v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 40))(v5);
    v10 = 40;
    if (!v9)
      v10 = 24;
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + v10))(v8);
  }
  v11 = objc_msgSend_rawCandidate(a3, v6, v7);
  if (v11)
  {
    v13 = (_QWORD *)v11;
    v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 40))(v11);
    v15 = 40;
    if (!v14)
      v15 = 24;
    v16 = (*(uint64_t (**)(_QWORD *))(*v13 + v15))(v13);
  }
  else
  {
    v16 = 0;
  }
  if (!(v8 | v16) || (isEqualToString = objc_msgSend_isEqualToString_((void *)v8, v12, v16)) != 0)
  {
    v18 = objc_msgSend_analysisString(self, v12, v16);
    v21 = objc_msgSend_analysisString(a3, v19, v20);
    if (!(v18 | v21) || (isEqualToString = objc_msgSend_isEqualToString_((void *)v18, v22, v21)) != 0)
    {
      v24 = objc_msgSend_convertedAnalysisString(self, v22, v23);
      v27 = objc_msgSend_convertedAnalysisString(a3, v25, v26);
      if (!(v24 | v27) || (isEqualToString = objc_msgSend_isEqualToString_((void *)v24, v28, v27)) != 0)
      {
        v30 = objc_msgSend_dictionaryReading(self, v28, v29);
        v33 = objc_msgSend_dictionaryReading(a3, v31, v32);
        if (v30 | v33)
          LOBYTE(isEqualToString) = objc_msgSend_isEqualToString_((void *)v30, v34, v33);
        else
          LOBYTE(isEqualToString) = 1;
      }
    }
  }
  return isEqualToString;
}

- (id)syllabifiedAnalysisString
{
  uint64_t v2;
  void *v3;
  const char *v4;

  v3 = (void *)objc_msgSend_syllablesInAnalysisString(self, a2, v2);
  return (id)objc_msgSend_componentsJoinedByString_(v3, v4, (uint64_t)CFSTR("'"));
}

- (id)syllabifiedConvertedAnalysisString
{
  uint64_t v2;
  void *v3;
  const char *v4;

  v3 = (void *)objc_msgSend_syllablesInConvertedAnalysisString(self, a2, v2);
  return (id)objc_msgSend_componentsJoinedByString_(v3, v4, (uint64_t)CFSTR("'"));
}

- (id)syllabifiedDictionaryReading
{
  uint64_t v2;
  void *v3;
  const char *v4;

  v3 = (void *)objc_msgSend_syllablesInDictionaryReading(self, a2, v2);
  return (id)objc_msgSend_componentsJoinedByString_(v3, v4, (uint64_t)CFSTR("'"));
}

- (id)syllablesInString:(id)a3 syllableLengths:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v7, (uint64_t)&v35, v39, 16);
  if (v8)
  {
    v11 = v8;
    v12 = 0;
    v13 = *(_QWORD *)v36;
    do
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(a4);
        v16 = objc_msgSend_unsignedIntegerValue(*(void **)(*((_QWORD *)&v35 + 1) + 8 * v14), v9, v10);
        v19 = objc_msgSend_length(a3, v17, v18);
        v12 = v16 + v15;
        if (v16 < 1 || v19 < v12)
        {
          v12 = v15;
          goto LABEL_13;
        }
        v21 = objc_msgSend_substringWithRange_(a3, v9, v15, v16);
        objc_msgSend_addObject_(v6, v22, v21);
        ++v14;
        v15 += v16;
      }
      while (v11 != v14);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v9, (uint64_t)&v35, v39, 16);
    }
    while (v11);
LABEL_13:
    if (v12 > objc_msgSend_length(a3, v9, v10))
      objc_msgSend_addObject_(v6, v23, (uint64_t)CFSTR("GARBAGE"));
  }
  else
  {
    objc_msgSend_length(a3, v9, v10);
    v12 = 0;
  }
  if (v12 < objc_msgSend_length(a3, v23, v24))
  {
    v27 = (void *)MEMORY[0x24BDD17C8];
    v28 = objc_msgSend_length(a3, v25, v26);
    v30 = objc_msgSend_substringWithRange_(a3, v29, v12, v28 - v12);
    v32 = objc_msgSend_stringWithFormat_(v27, v31, (uint64_t)CFSTR("(%@)"), v30);
    objc_msgSend_addObject_(v6, v33, v32);
  }
  return v6;
}

- (id)syllablesInAnalysisString
{
  uint64_t v2;
  __CFArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;

  v4 = MecabraCandidateCopySyllableLengthArrayInAnalysisString(self, a2, v2);
  v7 = objc_msgSend_analysisString(self, v5, v6);
  v9 = (void *)objc_msgSend_syllablesInString_syllableLengths_(self, v8, v7, v4);

  return v9;
}

- (id)syllablesInConvertedAnalysisString
{
  uint64_t v2;
  __CFArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;

  v4 = MecabraCandidateCopySyllableLengthArrayInConvertedAnalysisString(self, a2, v2);
  v7 = objc_msgSend_convertedAnalysisString(self, v5, v6);
  v9 = (void *)objc_msgSend_syllablesInString_syllableLengths_(self, v8, v7, v4);

  return v9;
}

- (id)syllablesInDictionaryReading
{
  uint64_t v2;
  __CFArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;

  v4 = MecabraCandidateCopySyllableLengthArrayInDictionaryReading(self, a2, v2);
  v7 = objc_msgSend_dictionaryReading(self, v5, v6);
  v9 = (void *)objc_msgSend_syllablesInString_syllableLengths_(self, v8, v7, v4);

  return v9;
}

- (id)words
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  unsigned int WordLengthAtIndex;
  const char *v11;
  uint64_t v12;
  _QWORD *v13;
  const char *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_msgSend_rawCandidate(self, v4, v5);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6))
  {
    v8 = 0;
    v9 = 0;
    do
    {
      WordLengthAtIndex = MecabraCandidateGetWordLengthAtIndex(self, v9, v7);
      v13 = (_QWORD *)objc_msgSend_rawCandidate(self, v11, v12);
      if (v13)
      {
        v15 = v13;
        if ((*(uint64_t (**)(_QWORD *))(*v13 + 40))(v13))
          v16 = 40;
        else
          v16 = 24;
        v13 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v15 + v16))(v15);
      }
      v17 = (void *)objc_msgSend_substringWithRange_(v13, v14, v8, WordLengthAtIndex);
      if (objc_msgSend_length(v17, v18, v19))
        objc_msgSend_addObject_(v3, v20, (uint64_t)v17);
      v8 += WordLengthAtIndex;
      ++v9;
      v22 = objc_msgSend_rawCandidate(self, v20, v21);
    }
    while ((unint64_t)v9 < (*(uint64_t (**)(uint64_t))(*(_QWORD *)v22 + 48))(v22));
  }
  return v3;
}

- (id)wordReadings
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t WordReadingLengthAtIndex;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_msgSend_rawCandidate(self, v4, v5);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6))
  {
    v8 = 0;
    v9 = 0;
    do
    {
      WordReadingLengthAtIndex = MecabraCandidateGetWordReadingLengthAtIndex(self, v9, v7);
      v13 = (void *)objc_msgSend_analysisString(self, v11, v12);
      v15 = (void *)objc_msgSend_substringWithRange_(v13, v14, v8, WordReadingLengthAtIndex);
      if (objc_msgSend_length(v15, v16, v17))
        objc_msgSend_addObject_(v3, v18, (uint64_t)v15);
      v8 += WordReadingLengthAtIndex;
      ++v9;
      v20 = objc_msgSend_rawCandidate(self, v18, v19);
    }
    while ((unint64_t)v9 < (*(uint64_t (**)(uint64_t))(*(_QWORD *)v20 + 48))(v20));
  }
  return v3;
}

- (id)wordIDs
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;

  v3 = objc_msgSend_rawCandidate(self, a2, v2);
  if (!v3)
    return 0;
  v6 = v3;
  v7 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6))
  {
    v8 = 0;
    do
    {
      v9 = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v6 + 120))(v6, v8);
      v11 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v10, *(unsigned int *)(v9 + 8));
      objc_msgSend_addObject_(v7, v12, v11);
      ++v8;
    }
    while (v8 < (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6));
  }
  return v7;
}

+ (id)syntheticCandidateFromWords:(id)a3 withLexicon:(Lexicon *)a4 language:(int)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  int *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  int *v19;
  int v20;
  uint64_t v21;
  id v22;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *__p;
  char *v30;
  char *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  __p = 0;
  v30 = 0;
  v31 = 0;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v25, v32, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v24 = 0;
        if (a4 && (sub_20B968A64((uint64_t *)a4, (const __CFString *)v10, &v24) & 1) != 0)
          v11 = &v24;
        else
          v11 = &dword_20BA5FB24;
        v12 = v30;
        if (v30 >= v31)
        {
          v14 = (char *)__p;
          v15 = (v30 - (_BYTE *)__p) >> 2;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
            sub_20B80CDD8();
          v17 = v31 - (_BYTE *)__p;
          if ((v31 - (_BYTE *)__p) >> 1 > v16)
            v16 = v17 >> 1;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
            v10 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v10 = v16;
          if (v10)
          {
            v18 = (char *)sub_20B8127BC((uint64_t)&v31, v10);
            v14 = (char *)__p;
            v12 = v30;
          }
          else
          {
            v18 = 0;
          }
          v19 = (int *)&v18[4 * v15];
          *v19 = *v11;
          v13 = (char *)(v19 + 1);
          while (v12 != v14)
          {
            v20 = *((_DWORD *)v12 - 1);
            v12 -= 4;
            *--v19 = v20;
          }
          __p = v19;
          v30 = v13;
          v31 = &v18[4 * v10];
          if (v14)
            operator delete(v14);
        }
        else
        {
          *(_DWORD *)v30 = *v11;
          v13 = v12 + 4;
        }
        v30 = v13;
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, (const char *)v10, (uint64_t)&v25, v32, 16);
    }
    while (v7);
  }
  v21 = operator new();
  sub_20B89FD78(v21, 0, 1, (CFArrayRef)a3, &__p);
  v22 = (id)sub_20B8E1754(v21);
  if (__p)
  {
    v30 = (char *)__p;
    operator delete(__p);
  }
  return v22;
}

@end
