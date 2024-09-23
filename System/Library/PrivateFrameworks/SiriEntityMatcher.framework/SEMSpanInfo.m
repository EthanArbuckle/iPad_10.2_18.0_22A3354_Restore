@implementation SEMSpanInfo

- (SEMSpanInfo)initWithValue:(id)a3 location:(unsigned int)a4 length:(unsigned int)a5 matchScore:(float)a6 maxTokenCount:(unsigned int)a7 matchedTokenCount:(unsigned int)a8 maxStopWordCount:(unsigned int)a9 matchedStopWordCount:(unsigned int)a10 maxAliasCount:(unsigned int)a11 matchedAliasCount:(unsigned int)a12 editDistance:(unsigned int)a13 aliasMatchOptions:(unsigned __int16)a14
{
  id v22;
  const char *v23;
  uint64_t v24;
  SEMSpanInfo *v25;
  SEMSpanInfo *v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SEMSpanInfo;
  v25 = -[SEMSpanInfo init](&v33, sel_init);
  if (!v25)
    goto LABEL_5;
  if (!objc_msgSend_length(v22, v23, v24))
  {
    v27 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      v26 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v35 = "-[SEMSpanInfo initWithValue:location:length:matchScore:maxTokenCount:matchedTokenCount:maxStopWordCount:matche"
          "dStopWordCount:maxAliasCount:matchedAliasCount:editDistance:aliasMatchOptions:]";
    v28 = "%s Cannot initialize span info with empty value";
    v29 = v27;
    v30 = 12;
LABEL_12:
    _os_log_error_impl(&dword_2462C4000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    goto LABEL_9;
  }
  if (!a5)
  {
    v31 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_DWORD *)buf = 136315394;
    v35 = "-[SEMSpanInfo initWithValue:location:length:matchScore:maxTokenCount:matchedTokenCount:maxStopWordCount:matche"
          "dStopWordCount:maxAliasCount:matchedAliasCount:editDistance:aliasMatchOptions:]";
    v36 = 2112;
    v37 = v22;
    v28 = "%s Cannot initialize span info with zero length. value: %@";
    v29 = v31;
    v30 = 22;
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v25->_value, a3);
  v25->_location = a4;
  v25->_length = a5;
  v25->_matchScore = a6;
  v25->_maxTokenCount = a7;
  v25->_matchedTokenCount = a8;
  v25->_maxStopWordCount = a9;
  v25->_matchedStopWordCount = a10;
  v25->_maxAliasCount = a11;
  v25->_matchedAliasCount = a12;
  v25->_editDistance = a13;
  v25->_aliasMatchOptions = a14;
LABEL_5:
  v26 = v25;
LABEL_10:

  return v26;
}

- (SEMSpanInfo)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (_NSRange)spanRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_length;
  location = self->_location;
  result.length = length;
  result.location = location;
  return result;
}

- (id)value
{
  return self->_value;
}

- (float)matchScore
{
  return self->_matchScore;
}

- (unsigned)maxTokenCount
{
  return self->_maxTokenCount;
}

- (unsigned)matchedTokenCount
{
  return self->_matchedTokenCount;
}

- (unsigned)maxStopWordCount
{
  return self->_maxStopWordCount;
}

- (unsigned)matchedStopWordCount
{
  return self->_matchedStopWordCount;
}

- (unsigned)maxAliasCount
{
  return self->_maxAliasCount;
}

- (unsigned)matchedAliasCount
{
  return self->_matchedAliasCount;
}

- (unsigned)editDistance
{
  return self->_editDistance;
}

- (unsigned)aliasMatchOptions
{
  return self->_aliasMatchOptions;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v9 = objc_msgSend_copyWithZone_(self->_value, v8, (uint64_t)a3);
  v10 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = v9;

  *(_DWORD *)(v7 + 16) = self->_location;
  *(_DWORD *)(v7 + 20) = self->_length;
  *(float *)(v7 + 24) = self->_matchScore;
  *(_DWORD *)(v7 + 28) = self->_maxTokenCount;
  *(_DWORD *)(v7 + 32) = self->_matchedTokenCount;
  *(_DWORD *)(v7 + 36) = self->_maxStopWordCount;
  *(_DWORD *)(v7 + 40) = self->_matchedStopWordCount;
  *(_DWORD *)(v7 + 44) = self->_maxAliasCount;
  *(_DWORD *)(v7 + 48) = self->_matchedAliasCount;
  *(_DWORD *)(v7 + 52) = self->_editDistance;
  *(_WORD *)(v7 + 56) = self->_aliasMatchOptions;
  return (id)v7;
}

- (BOOL)isEqual:(id)a3
{
  SEMSpanInfo *v4;
  SEMSpanInfo *v5;
  const char *v6;
  char isEqualToSpanInfo;

  v4 = (SEMSpanInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToSpanInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToSpanInfo = objc_msgSend_isEqualToSpanInfo_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToSpanInfo = 0;
  }

  return isEqualToSpanInfo;
}

- (BOOL)isEqualToSpanInfo:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSString *value;
  NSString *v11;
  const char *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  float matchScore;
  const char *v22;
  uint64_t v23;
  float v24;
  unsigned int maxTokenCount;
  const char *v26;
  uint64_t v27;
  unsigned int matchedTokenCount;
  const char *v29;
  uint64_t v30;
  unsigned int maxStopWordCount;
  const char *v32;
  uint64_t v33;
  unsigned int matchedStopWordCount;
  const char *v35;
  uint64_t v36;
  unsigned int maxAliasCount;
  const char *v38;
  uint64_t v39;
  unsigned int matchedAliasCount;
  const char *v41;
  uint64_t v42;
  unsigned int editDistance;
  const char *v44;
  uint64_t v45;
  int aliasMatchOptions;

  v6 = a3;
  v9 = v6;
  value = self->_value;
  v11 = value;
  if (!value)
  {
    objc_msgSend_value(v6, v7, v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v13 = 0;
      goto LABEL_8;
    }
    v11 = self->_value;
  }
  objc_msgSend_value(v9, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isEqual_(v11, v12, (uint64_t)v4))
  {
    v14 = 0;
    goto LABEL_21;
  }
  v13 = 1;
LABEL_8:
  v15 = objc_msgSend_spanRange(self, v7, v8);
  v17 = v16;
  if (v15 != objc_msgSend_spanRange(v9, v16, v18))
    goto LABEL_20;
  if (v17 != v19)
    goto LABEL_20;
  matchScore = self->_matchScore;
  objc_msgSend_matchScore(v9, v19, v20);
  if (matchScore != v24
    || (maxTokenCount = self->_maxTokenCount, maxTokenCount != objc_msgSend_maxTokenCount(v9, v22, v23))
    || (matchedTokenCount = self->_matchedTokenCount,
        matchedTokenCount != objc_msgSend_matchedTokenCount(v9, v26, v27))
    || (maxStopWordCount = self->_maxStopWordCount,
        maxStopWordCount != objc_msgSend_maxStopWordCount(v9, v29, v30))
    || (matchedStopWordCount = self->_matchedStopWordCount,
        matchedStopWordCount != objc_msgSend_matchedStopWordCount(v9, v32, v33))
    || (maxAliasCount = self->_maxAliasCount, maxAliasCount != objc_msgSend_maxAliasCount(v9, v35, v36))
    || (matchedAliasCount = self->_matchedAliasCount,
        matchedAliasCount != objc_msgSend_matchedAliasCount(v9, v38, v39))
    || (editDistance = self->_editDistance, editDistance != objc_msgSend_editDistance(v9, v41, v42)))
  {
LABEL_20:
    v14 = 0;
    if (!v13)
      goto LABEL_22;
    goto LABEL_21;
  }
  aliasMatchOptions = self->_aliasMatchOptions;
  v14 = aliasMatchOptions == objc_msgSend_aliasMatchOptions(v9, v44, v45);
  if ((v13 & 1) != 0)
LABEL_21:

LABEL_22:
  if (!value)

  return v14;
}

- (id)description
{
  uint64_t v2;
  NSString *value;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
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
  float v33;
  const char *v34;
  void *v35;
  void *v37;

  value = self->_value;
  if (value)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("value: \"%@\" "), value);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_251783AF0;
  }
  v37 = (void *)MEMORY[0x24BDD17C8];
  v6 = (void *)MEMORY[0x24BDD1968];
  v7 = objc_msgSend_spanRange(self, a2, v2);
  objc_msgSend_valueWithRange_(v6, v8, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_matchedTokenCount(self, v10, v11);
  v15 = objc_msgSend_maxTokenCount(self, v13, v14);
  v18 = objc_msgSend_matchedStopWordCount(self, v16, v17);
  v21 = objc_msgSend_maxStopWordCount(self, v19, v20);
  v24 = objc_msgSend_matchedAliasCount(self, v22, v23);
  v27 = objc_msgSend_maxAliasCount(self, v25, v26);
  v30 = objc_msgSend_editDistance(self, v28, v29);
  objc_msgSend_matchScore(self, v31, v32);
  objc_msgSend_stringWithFormat_(v37, v34, (uint64_t)CFSTR("%@%@ tokens matched: (%u/%u) stop words: (%u/%u) alias: (%u/%u) edit distance: %u match score: %f"), v5, v9, v12, v15, v18, v21, v24, v27, v30, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;

  v56 = objc_msgSend_hash(self->_value, a2, v2);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v4, self->_location);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend_hash(v62, v5, v6);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v7, self->_length);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend_hash(v61, v8, v9);
  *(float *)&v10 = self->_matchScore;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v11, v12, v10);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend_hash(v60, v13, v14);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v15, self->_maxTokenCount);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_hash(v59, v16, v17);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v18, self->_matchedTokenCount);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_hash(v58, v19, v20);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v21, self->_maxStopWordCount);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_hash(v57, v22, v23);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v24, self->_matchedStopWordCount);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_hash(v25, v26, v27);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v29, self->_maxAliasCount);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_hash(v30, v31, v32);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v34, self->_matchedAliasCount);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_hash(v35, v36, v37);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v39, self->_editDistance);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_hash(v40, v41, v42);
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v44, self->_aliasMatchOptions);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v55 ^ v56 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v28 ^ v33 ^ v38 ^ v43 ^ objc_msgSend_hash(v45, v46, v47);

  return v48;
}

- (BOOL)isPartialMatch
{
  uint64_t v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_matchedTokenCount(self, a2, v2);
  return v4 != objc_msgSend_maxTokenCount(self, v5, v6);
}

- (BOOL)isApproximateMatch
{
  uint64_t v2;

  return objc_msgSend_editDistance(self, a2, v2) != 0;
}

- (BOOL)isAliasMatch
{
  uint64_t v2;

  return objc_msgSend_matchedAliasCount(self, a2, v2) != 0;
}

- (id)getAliasTypesArray
{
  uint64_t v2;
  const char *v4;
  void *v5;
  unsigned __int16 aliasMatchOptions;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;

  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aliasMatchOptions = self->_aliasMatchOptions;
  if ((aliasMatchOptions & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v8, (uint64_t)v7);

    aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 2) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v4, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v10, (uint64_t)v9);

    aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 4) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v4, 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v12, (uint64_t)v11);

    aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 8) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v4, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v14, (uint64_t)v13);

    aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 0x10) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v4, 9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v16, (uint64_t)v15);

    aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 0x20) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v4, 8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v18, (uint64_t)v17);

    aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 0x40) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v4, 10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v20, (uint64_t)v19);

    aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 0x80) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v4, 11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v22, (uint64_t)v21);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SEMSpanInfo)initWithCoder:(id)a3
{
  id v4;
  SEMSpanInfo *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *value;
  const char *v10;
  const char *v11;
  const char *v12;
  float v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SEMSpanInfo;
  v5 = -[SEMSpanInfo init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("value"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v8;

    v5->_location = objc_msgSend_decodeInt32ForKey_(v4, v10, (uint64_t)CFSTR("location"));
    v5->_length = objc_msgSend_decodeInt32ForKey_(v4, v11, (uint64_t)CFSTR("length"));
    objc_msgSend_decodeFloatForKey_(v4, v12, (uint64_t)CFSTR("matchScore"));
    v5->_matchScore = v13;
    v5->_maxTokenCount = objc_msgSend_decodeInt32ForKey_(v4, v14, (uint64_t)CFSTR("maxTokenCount"));
    v5->_matchedTokenCount = objc_msgSend_decodeInt32ForKey_(v4, v15, (uint64_t)CFSTR("matchedTokenCount"));
    v5->_maxStopWordCount = objc_msgSend_decodeInt32ForKey_(v4, v16, (uint64_t)CFSTR("maxStopWordCount"));
    v5->_matchedStopWordCount = objc_msgSend_decodeInt32ForKey_(v4, v17, (uint64_t)CFSTR("matchedStopWordCount"));
    v5->_maxAliasCount = objc_msgSend_decodeInt32ForKey_(v4, v18, (uint64_t)CFSTR("maxAliasCount "));
    v5->_matchedAliasCount = objc_msgSend_decodeInt32ForKey_(v4, v19, (uint64_t)CFSTR("matchedAliasCount"));
    v5->_editDistance = objc_msgSend_decodeInt32ForKey_(v4, v20, (uint64_t)CFSTR("editDistance"));
    v5->_aliasMatchOptions = objc_msgSend_decodeIntForKey_(v4, v21, (uint64_t)CFSTR("aliasMatchOptions"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  const char *v5;
  const char *v6;
  double v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  id v17;

  v17 = a3;
  objc_msgSend_encodeObject_forKey_(v17, v4, (uint64_t)self->_value, CFSTR("value"));
  objc_msgSend_encodeInt32_forKey_(v17, v5, self->_location, CFSTR("location"));
  objc_msgSend_encodeInt32_forKey_(v17, v6, self->_length, CFSTR("length"));
  *(float *)&v7 = self->_matchScore;
  objc_msgSend_encodeFloat_forKey_(v17, v8, (uint64_t)CFSTR("matchScore"), v7);
  objc_msgSend_encodeInt32_forKey_(v17, v9, self->_maxTokenCount, CFSTR("maxTokenCount"));
  objc_msgSend_encodeInt32_forKey_(v17, v10, self->_matchedTokenCount, CFSTR("matchedTokenCount"));
  objc_msgSend_encodeInt32_forKey_(v17, v11, self->_maxStopWordCount, CFSTR("maxStopWordCount"));
  objc_msgSend_encodeInt32_forKey_(v17, v12, self->_matchedStopWordCount, CFSTR("matchedStopWordCount"));
  objc_msgSend_encodeInt32_forKey_(v17, v13, self->_maxAliasCount, CFSTR("maxAliasCount "));
  objc_msgSend_encodeInt32_forKey_(v17, v14, self->_matchedAliasCount, CFSTR("matchedAliasCount"));
  objc_msgSend_encodeInt32_forKey_(v17, v15, self->_editDistance, CFSTR("editDistance"));
  objc_msgSend_encodeInt_forKey_(v17, v16, self->_aliasMatchOptions, CFSTR("aliasMatchOptions"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
