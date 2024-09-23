@implementation TIKeyboardCandidateResultSetCoder

- (id)initForEncoding
{
  void *v3;
  TIKeyboardCandidateResultSetCoder *v4;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 57);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TIKeyboardCandidateResultSetCoder initWithData:mutableData:](self, "initWithData:mutableData:", 0, v3);

  return v4;
}

- (id)initForDecodingWithData:(id)a3
{
  id v4;
  TIKeyboardCandidateResultSetCoder *v5;
  TIKeyboardCandidateResultSetCoder *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    self = -[TIKeyboardCandidateResultSetCoder initWithData:mutableData:](self, "initWithData:mutableData:", v4, 0);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (TIKeyboardCandidateResultSetCoder)initWithData:(id)a3 mutableData:(id)a4
{
  id v7;
  id v8;
  TIKeyboardCandidateResultSetCoder *v9;
  TIKeyboardCandidateResultSetCoder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardCandidateResultSetCoder;
  v9 = -[TIKeyboardCandidateResultSetCoder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_mutableData, a4);
    v10->_offset = 0;
    v10->_offsetHasPassedEndOfData = 0;
  }

  return v10;
}

- (void)setOffset:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;

  if (-[TIKeyboardCandidateResultSetCoder isDecoding](self, "isDecoding"))
  {
    -[TIKeyboardCandidateResultSetCoder data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      -[TIKeyboardCandidateResultSetCoder data](self, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8 <= a3)
      {
        -[TIKeyboardCandidateResultSetCoder offsetHasPassedEndOfData](self, "offsetHasPassedEndOfData");
        -[TIKeyboardCandidateResultSetCoder setOffsetHasPassedEndOfData:](self, "setOffsetHasPassedEndOfData:", 1);
        -[TIKeyboardCandidateResultSetCoder data](self, "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        a3 = objc_msgSend(v9, "length") - 1;

      }
    }
    else
    {
      -[TIKeyboardCandidateResultSetCoder offsetHasPassedEndOfData](self, "offsetHasPassedEndOfData");
      -[TIKeyboardCandidateResultSetCoder setOffsetHasPassedEndOfData:](self, "setOffsetHasPassedEndOfData:", 1);
      a3 = 0;
    }
  }
  self->_offset = a3;
}

- (BOOL)isDecoding
{
  void *v2;
  BOOL v3;

  -[TIKeyboardCandidateResultSetCoder data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (const)bytes
{
  id v2;
  const char *v3;

  -[TIKeyboardCandidateResultSetCoder data](self, "data");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "bytes");

  return v3;
}

- (const)currentPosition
{
  const char *v3;

  v3 = -[TIKeyboardCandidateResultSetCoder bytes](self, "bytes");
  return &v3[-[TIKeyboardCandidateResultSetCoder offset](self, "offset")];
}

- (id)decodeCandidate
{
  objc_class *v3;

  v3 = (objc_class *)objc_msgSend((id)objc_opt_class(), "classFromCandidateType:", -[TIKeyboardCandidateResultSetCoder bytes](self, "bytes")[-[TIKeyboardCandidateResultSetCoder offset](self, "offset")]);
  if (v3)
    v3 = (objc_class *)objc_msgSend([v3 alloc], "initWithCandidateResultSetCoder:", self);
  return v3;
}

- (BOOL)decodeBool
{
  return -[TIKeyboardCandidateResultSetCoder decodeByte](self, "decodeByte") != 0;
}

- (void)encodeByte:(unsigned __int8)a3
{
  void *v3;
  unsigned __int8 v4;

  v4 = a3;
  -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBytes:length:", &v4, 1);

}

- (unsigned)decodeByte
{
  unsigned __int8 v3;

  if (-[TIKeyboardCandidateResultSetCoder offsetHasPassedEndOfData](self, "offsetHasPassedEndOfData"))
    return 0;
  v3 = *-[TIKeyboardCandidateResultSetCoder currentPosition](self, "currentPosition");
  -[TIKeyboardCandidateResultSetCoder setOffset:](self, "setOffset:", -[TIKeyboardCandidateResultSetCoder offset](self, "offset") + 1);
  return v3;
}

- (void)readNumberOfBytes:(unint64_t)a3 into:(void *)a4
{
  unint64_t v7;
  void *v8;
  int v9;

  if (a3 && a4)
  {
    if (-[TIKeyboardCandidateResultSetCoder offsetHasPassedEndOfData](self, "offsetHasPassedEndOfData"))
    {
      v7 = 0;
    }
    else
    {
      -[TIKeyboardCandidateResultSetCoder data](self, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");
      v7 = (int)(v9 - -[TIKeyboardCandidateResultSetCoder offset](self, "offset"));

    }
    if (v7 >= a3)
    {
      memcpy(a4, -[TIKeyboardCandidateResultSetCoder currentPosition](self, "currentPosition"), a3);
      -[TIKeyboardCandidateResultSetCoder setOffset:](self, "setOffset:", -[TIKeyboardCandidateResultSetCoder offset](self, "offset") + a3);
    }
  }
}

- (void)encodeShort:(unsigned __int16)a3
{
  void *v3;
  unsigned __int16 v4;

  v4 = a3;
  -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBytes:length:", &v4, 2);

}

- (unsigned)decodeShort
{
  unsigned __int16 v3;

  v3 = 0;
  -[TIKeyboardCandidateResultSetCoder readNumberOfBytes:into:](self, "readNumberOfBytes:into:", 2, &v3);
  return v3;
}

- (void)encodeDouble:(double)a3
{
  void *v3;
  double v4;

  v4 = a3;
  -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBytes:length:", &v4, 8);

}

- (double)decodeDouble
{
  double v3;

  v3 = 0.0;
  -[TIKeyboardCandidateResultSetCoder readNumberOfBytes:into:](self, "readNumberOfBytes:into:", 8, &v3);
  return v3;
}

- (void)encodeUInt32:(unsigned int)a3
{
  void *v3;
  unsigned int v4;

  v4 = a3;
  -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBytes:length:", &v4, 4);

}

- (unsigned)decodeUInt32
{
  unsigned int v3;

  v3 = 0;
  -[TIKeyboardCandidateResultSetCoder readNumberOfBytes:into:](self, "readNumberOfBytes:into:", 4, &v3);
  return v3;
}

- (void)encodeUInt64:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  v4 = a3;
  -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBytes:length:", &v4, 8);

}

- (unint64_t)decodeUInt64
{
  unint64_t v3;

  v3 = 0;
  -[TIKeyboardCandidateResultSetCoder readNumberOfBytes:into:](self, "readNumberOfBytes:into:", 8, &v3);
  return v3;
}

- (void)encodeString:(id)a3
{
  uint64_t v4;
  const char *v5;
  id v6;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (v4)
    v5 = (const char *)v4;
  else
    v5 = "";
  -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendBytes:length:", v5, strlen(v5) + 1);

}

- (id)decodeString
{
  const char *v3;
  __CFString *v4;

  v3 = -[TIKeyboardCandidateResultSetCoder currentPosition](self, "currentPosition");
  -[TIKeyboardCandidateResultSetCoder setOffset:](self, "setOffset:", strlen(v3) + -[TIKeyboardCandidateResultSetCoder offset](self, "offset") + 1);
  if (-[TIKeyboardCandidateResultSetCoder offsetHasPassedEndOfData](self, "offsetHasPassedEndOfData"))
  {
    v4 = &stru_1E243B990;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)encodeStringArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = objc_msgSend(v4, "count");
  -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendBytes:length:", &v15, 4);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[TIKeyboardCandidateResultSetCoder encodeString:](self, "encodeString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (id)decodeStringArray
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = -[TIKeyboardCandidateResultSetCoder decodeUInt32](self, "decodeUInt32");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    do
    {
      -[TIKeyboardCandidateResultSetCoder decodeString](self, "decodeString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

      --v4;
    }
    while (v4);
  }
  return v5;
}

- (void)encodePointerValueArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = objc_msgSend(v4, "count");
  -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendBytes:length:", &v15, 4);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[TIKeyboardCandidateResultSetCoder encodeUInt64:](self, "encodeUInt64:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "unsignedLongLongValue", (_QWORD)v11));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (id)decodePointerValueArray
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v3 = -[TIKeyboardCandidateResultSetCoder decodeUInt32](self, "decodeUInt32");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    do
    {
      v6 = -[TIKeyboardCandidateResultSetCoder decodeUInt64](self, "decodeUInt64");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      --v4;
    }
    while (v4);
  }
  return v5;
}

- (id)dataFromCandidateResultSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  unsigned __int16 v36;
  void *v37;
  id v38;
  int v39;
  int v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t n;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t ii;
  uint64_t v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  uint64_t v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  void *v99;
  id obj;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  void *v105;
  id v106;
  int v107;
  uint64_t v108;
  int v109;
  uint64_t v110;
  int v111;
  uint64_t v112;
  void *v113;
  void *v114;
  int v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "initialSelectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
    v96 = -1;
  else
    v96 = objc_msgSend(v4, "initialSelectedIndex");
  objc_msgSend(v4, "defaultCandidate");
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v5, "count");

  v94 = objc_msgSend(v4, "generatedCandidateCount");
  v93 = objc_msgSend(v4, "batchCandidateLocation");
  objc_msgSend(v4, "disambiguationCandidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v6, "count");

  objc_msgSend(v4, "sortMethodGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v7, "count");

  if (objc_msgSend(v4, "selectedDisambiguationCandidateIndex") == 0x7FFFFFFFFFFFFFFFLL)
    v92 = 0xFFFFFFFFLL;
  else
    v92 = objc_msgSend(v4, "selectedDisambiguationCandidateIndex");
  v105 = v4;
  if (v97)
  {
    v8 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "candidates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithArray:", v9);
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "candidates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0x1E0CB3000uLL;
    v14 = v4;
    if (v11)
    {
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i, v92);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "candidates");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndex:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v16, v18);

        v13 = 0x1E0CB3000uLL;
      }
    }
    objc_msgSend(v14, "sortMethodGroups", v92);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardCandidateResultSetCoder encodeStringArray:](self, "encodeStringArray:", v20);
    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    obj = v20;
    v4 = v14;
    v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v150, 16);
    if (v102)
    {
      v101 = *(_QWORD *)v141;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v141 != v101)
            objc_enumerationMutation(obj);
          v103 = v21;
          v22 = *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * v21);
          objc_msgSend(v4, "sortMethodGroups");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          -[TIKeyboardCandidateResultSetCoder encodeUInt32:](self, "encodeUInt32:", objc_msgSend(v24, "count"));
          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          v106 = v24;
          v110 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v136, v149, 16);
          if (v110)
          {
            v108 = *(_QWORD *)v137;
            do
            {
              v25 = 0;
              do
              {
                if (*(_QWORD *)v137 != v108)
                  objc_enumerationMutation(v106);
                v112 = v25;
                v26 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v25);
                objc_msgSend(v26, "title");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[TIKeyboardCandidateResultSetCoder encodeString:](self, "encodeString:", v27);

                objc_msgSend(v26, "candidates");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[TIKeyboardCandidateResultSetCoder encodeUInt32:](self, "encodeUInt32:", objc_msgSend(v28, "count"));

                v134 = 0u;
                v135 = 0u;
                v132 = 0u;
                v133 = 0u;
                objc_msgSend(v26, "candidates");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v132, v148, 16);
                if (v30)
                {
                  v31 = v30;
                  v32 = *(_QWORD *)v133;
                  do
                  {
                    for (j = 0; j != v31; ++j)
                    {
                      if (*(_QWORD *)v133 != v32)
                        objc_enumerationMutation(v29);
                      v34 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * j);
                      objc_msgSend(v12, "objectForKey:", v34);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = objc_msgSend(v35, "integerValue");
                      if (!v35)
                      {
                        objc_msgSend(v114, "addObject:", v34);
                        objc_msgSend(*(id *)(v13 + 2024), "numberWithUnsignedInteger:", v11);
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v12, "setObject:forKey:", v37, v34);

                        v13 = 0x1E0CB3000;
                        v36 = v11++;
                      }
                      -[TIKeyboardCandidateResultSetCoder encodeShort:](self, "encodeShort:", v36);

                    }
                    v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v132, v148, 16);
                  }
                  while (v31);
                }

                v25 = v112 + 1;
              }
              while (v112 + 1 != v110);
              v110 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v136, v149, 16);
            }
            while (v110);
          }

          v21 = v103 + 1;
          v4 = v105;
        }
        while (v103 + 1 != v102);
        v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v150, 16);
      }
      while (v102);
    }

    if (v114)
    {
      v38 = v114;
      v115 = 57;
      v113 = v38;
      goto LABEL_39;
    }
    v39 = 57;
  }
  else
  {
    v39 = -1;
  }
  v115 = v39;
  objc_msgSend(v4, "candidates", v92);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v113 = 0;
LABEL_39:
  v111 = objc_msgSend(v38, "count");
  v40 = v98 + objc_msgSend(v38, "count");
  if (v99)
    ++v40;
  v109 = v40;
  if (v40)
  {
    -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v41, "length");

    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v42 = v38;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v128, v147, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v129;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v129 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * k), "encodeWithCandidateResultSetCoder:", self);
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v128, v147, 16);
      }
      while (v44);
    }

    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    objc_msgSend(v105, "disambiguationCandidates");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v124, v146, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v125;
      do
      {
        for (m = 0; m != v49; ++m)
        {
          if (*(_QWORD *)v125 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * m), "encodeWithCandidateResultSetCoder:", self);
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v124, v146, 16);
      }
      while (v49);
    }

    v4 = v105;
    objc_msgSend(v105, "defaultCandidate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v105, "defaultCandidate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "encodeWithCandidateResultSetCoder:", self);

    }
  }
  else
  {
    v107 = -1;
  }
  objc_msgSend(v4, "sortMethods");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v4;
  v56 = objc_msgSend(v54, "count");

  if (v56)
  {
    -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v57, "length");

    objc_msgSend(v55, "sortMethods");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidateResultSetCoder encodeStringArray:](self, "encodeStringArray:", v58);

  }
  else
  {
    v104 = -1;
  }
  v59 = v55;
  objc_msgSend(v55, "indexTitles");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "count");

  if (v61)
  {
    -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "length");

    objc_msgSend(v55, "indexTitles");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "allKeys");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidateResultSetCoder encodeStringArray:](self, "encodeStringArray:", v65);

    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    objc_msgSend(v55, "indexTitles");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v120, v145, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v121;
      do
      {
        for (n = 0; n != v68; ++n)
        {
          if (*(_QWORD *)v121 != v69)
            objc_enumerationMutation(v66);
          v71 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * n);
          objc_msgSend(v59, "indexTitles");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectForKey:", v71);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          -[TIKeyboardCandidateResultSetCoder encodeStringArray:](self, "encodeStringArray:", v73);
        }
        v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v120, v145, 16);
      }
      while (v68);
    }

  }
  else
  {
    v63 = -1;
  }
  objc_msgSend(v59, "showExtensionCandidates");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "count");

  if (v75)
  {
    -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "length");

    objc_msgSend(v59, "showExtensionCandidates");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "allKeys");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidateResultSetCoder encodeStringArray:](self, "encodeStringArray:", v79);

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    objc_msgSend(v59, "showExtensionCandidates");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v116, v144, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v117;
      do
      {
        for (ii = 0; ii != v82; ++ii)
        {
          if (*(_QWORD *)v117 != v83)
            objc_enumerationMutation(v80);
          v85 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * ii);
          objc_msgSend(v105, "showExtensionCandidates");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "objectForKey:", v85);
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          -[TIKeyboardCandidateResultSetCoder encodeByte:](self, "encodeByte:", objc_msgSend(v87, "integerValue") != 0);
        }
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v116, v144, 16);
      }
      while (v82);
    }

    v59 = v105;
  }
  else
  {
    v77 = -1;
  }
  -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
  v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v89 = objc_msgSend(v88, "bytes");

  *(_DWORD *)v89 = v96;
  *(_BYTE *)(v89 + 4) = v99 != 0;
  *(_DWORD *)(v89 + 5) = v95;
  *(_DWORD *)(v89 + 9) = v109;
  *(_DWORD *)(v89 + 13) = v94;
  *(_DWORD *)(v89 + 17) = v93;
  *(_DWORD *)(v89 + 21) = v111;
  *(_DWORD *)(v89 + 25) = v98;
  *(_DWORD *)(v89 + 29) = v115;
  *(_DWORD *)(v89 + 33) = v107;
  *(_DWORD *)(v89 + 37) = v97;
  *(_DWORD *)(v89 + 41) = v104;
  *(_DWORD *)(v89 + 45) = v63;
  *(_DWORD *)(v89 + 49) = v77;
  *(_DWORD *)(v89 + 53) = v92;
  -[TIKeyboardCandidateResultSetCoder mutableData](self, "mutableData");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  return v90;
}

- (id)candidateResultSet
{
  TIKeyboardCandidateResultSet *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  const char *v7;
  uint32_t v8;
  id v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  TIKeyboardCandidateGroup *v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  uint64_t v62;
  void *v63;
  TIKeyboardCandidateResultSet *v64;
  int v65;
  int v66;
  NSObject *v67;
  const char *v68;
  int v69;
  int v70;
  int v71;
  TIKeyboardCandidateResultSet *v73;
  TIKeyboardCandidateResultSet *v74;
  void *v75;
  void *v76;
  unsigned int *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint8_t v87[128];
  uint8_t buf[4];
  int v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(TIKeyboardCandidateResultSet);
  -[TIKeyboardCandidateResultSetCoder data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5 <= 0x38)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = MEMORY[0x1E0C81028];
      v7 = "TIKeyboardCandidateResultSet cannot be decoded : size of header is bigger than the data being decoded";
      v8 = 2;
LABEL_59:
      _os_log_error_impl(&dword_18C56E000, v6, OS_LOG_TYPE_ERROR, v7, buf, v8);
      goto LABEL_70;
    }
    goto LABEL_70;
  }
  -[TIKeyboardCandidateResultSetCoder data](self, "data");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (unsigned int *)objc_msgSend(v9, "bytes");

  if (*v10 == -1)
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = *v10;
  -[TIKeyboardCandidateResultSet setInitialSelectedIndex:](v3, "setInitialSelectedIndex:", v11);
  -[TIKeyboardCandidateResultSet setGeneratedCandidateCount:](v3, "setGeneratedCandidateCount:", *(unsigned int *)((char *)v10 + 13));
  -[TIKeyboardCandidateResultSet setBatchCandidateLocation:](v3, "setBatchCandidateLocation:", *(unsigned int *)((char *)v10 + 17));
  if (*(unsigned int *)((char *)v10 + 53) == -1)
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v12 = *(unsigned int *)((char *)v10 + 53);
  -[TIKeyboardCandidateResultSet setSelectedDisambiguationCandidateIndex:](v3, "setSelectedDisambiguationCandidateIndex:", v12);
  v13 = *(unsigned int *)((char *)v10 + 33);
  if ((_DWORD)v13 == -1)
  {
    v17 = 0;
  }
  else
  {
    -[TIKeyboardCandidateResultSetCoder data](self, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15 <= v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v65 = *(unsigned int *)((char *)v10 + 33);
        *(_DWORD *)buf = 67109120;
        v89 = v65;
        v6 = MEMORY[0x1E0C81028];
        v7 = "TIKeyboardCandidateResultSet cannot be decoded : header candidates offset [%d] is not within the bounds of "
             "the data being decoded";
        v8 = 8;
        goto LABEL_59;
      }
LABEL_70:
      v64 = 0;
      goto LABEL_71;
    }
    -[TIKeyboardCandidateResultSetCoder setOffset:](self, "setOffset:", *(unsigned int *)((char *)v10 + 33));
    v16 = *(unsigned int *)((char *)v10 + 9);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v16)
    {
      do
      {
        -[TIKeyboardCandidateResultSetCoder decodeCandidate](self, "decodeCandidate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v17, "addObject:", v18);

        --v16;
      }
      while (v16);
    }
    objc_msgSend(v17, "subarrayWithRange:", 0, *(unsigned int *)((char *)v10 + 5));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidateResultSet setCandidates:](v3, "setCandidates:", v19);

    if (*(unsigned int *)((char *)v10 + 25))
    {
      objc_msgSend(v17, "subarrayWithRange:", *(unsigned int *)((char *)v10 + 21));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardCandidateResultSet setDisambiguationCandidates:](v3, "setDisambiguationCandidates:", v20);

    }
    if (*((_BYTE *)v10 + 4))
    {
      objc_msgSend(v17, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardCandidateResultSet setDefaultCandidate:](v3, "setDefaultCandidate:", v21);

    }
  }
  v22 = *(unsigned int *)((char *)v10 + 29);
  v77 = v10;
  if ((_DWORD)v22 != -1)
  {
    -[TIKeyboardCandidateResultSetCoder data](self, "data");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length");

    if (v24 <= v22)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_69;
      v66 = *(unsigned int *)((char *)v10 + 29);
      *(_DWORD *)buf = 67109120;
      v89 = v66;
      v67 = MEMORY[0x1E0C81028];
      v68 = "TIKeyboardCandidateResultSet cannot be decoded : header sort method group offset [%d] is not within the boun"
            "ds of the data being decoded";
LABEL_68:
      _os_log_error_impl(&dword_18C56E000, v67, OS_LOG_TYPE_ERROR, v68, buf, 8u);
      goto LABEL_69;
    }
    v73 = v3;
    -[TIKeyboardCandidateResultSetCoder setOffset:](self, "setOffset:", *(unsigned int *)((char *)v10 + 29));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(unsigned int *)((char *)v10 + 37));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidateResultSetCoder decodeStringArray](self, "decodeStringArray");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(unsigned int *)((char *)v10 + 37))
    {
      v25 = 0;
      do
      {
        v26 = -[TIKeyboardCandidateResultSetCoder decodeUInt32](self, "decodeUInt32");
        v27 = v26;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v29 = 0;
          do
          {
            v30 = objc_alloc_init(TIKeyboardCandidateGroup);
            -[TIKeyboardCandidateResultSetCoder decodeString](self, "decodeString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardCandidateGroup setTitle:](v30, "setTitle:", v31);

            v32 = -[TIKeyboardCandidateResultSetCoder decodeUInt32](self, "decodeUInt32");
            if (v32)
            {
              v33 = v32;
              do
              {
                objc_msgSend(v17, "objectAtIndex:", -[TIKeyboardCandidateResultSetCoder decodeShort](self, "decodeShort"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[TIKeyboardCandidateGroup addCandidate:](v30, "addCandidate:", v34);

                --v33;
              }
              while (v33);
            }
            objc_msgSend(v28, "addObject:", v30);

            ++v29;
          }
          while (v29 != v27);
        }
        objc_msgSend(v75, "objectAtIndex:", v25);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setObject:forKey:", v28, v35);

        ++v25;
        v10 = v77;
      }
      while (v25 < *(unsigned int *)((char *)v77 + 37));
    }
    v3 = v73;
    -[TIKeyboardCandidateResultSet setSortMethodGroups:](v73, "setSortMethodGroups:", v76);

  }
  v36 = *(unsigned int *)((char *)v10 + 41);
  if ((_DWORD)v36 == -1)
    goto LABEL_36;
  -[TIKeyboardCandidateResultSetCoder data](self, "data");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "length");

  if (v38 <= v36)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_69;
    v69 = *(unsigned int *)((char *)v10 + 41);
    *(_DWORD *)buf = 67109120;
    v89 = v69;
    v67 = MEMORY[0x1E0C81028];
    v68 = "TIKeyboardCandidateResultSet cannot be decoded : header sort method offset [%d] is not within the bounds of th"
          "e data being decoded";
    goto LABEL_68;
  }
  -[TIKeyboardCandidateResultSetCoder setOffset:](self, "setOffset:", *(unsigned int *)((char *)v10 + 41));
  -[TIKeyboardCandidateResultSetCoder decodeStringArray](self, "decodeStringArray");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidateResultSet setSortMethods:](v3, "setSortMethods:", v39);

LABEL_36:
  v40 = *(unsigned int *)((char *)v10 + 45);
  if ((_DWORD)v40 == -1)
    goto LABEL_46;
  -[TIKeyboardCandidateResultSetCoder data](self, "data");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "length");

  if (v42 <= v40)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_69;
    v70 = *(unsigned int *)((char *)v10 + 45);
    *(_DWORD *)buf = 67109120;
    v89 = v70;
    v67 = MEMORY[0x1E0C81028];
    v68 = "TIKeyboardCandidateResultSet cannot be decoded : index titles offset [%d] is not within the bounds of the data being decoded";
    goto LABEL_68;
  }
  -[TIKeyboardCandidateResultSetCoder setOffset:](self, "setOffset:", *(unsigned int *)((char *)v10 + 45));
  -[TIKeyboardCandidateResultSetCoder decodeStringArray](self, "decodeStringArray");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v43, "count"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v45 = v43;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v83 != v48)
          objc_enumerationMutation(v45);
        v50 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
        -[TIKeyboardCandidateResultSetCoder decodeStringArray](self, "decodeStringArray");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKey:", v51, v50);

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
    }
    while (v47);
  }

  -[TIKeyboardCandidateResultSet setIndexTitles:](v3, "setIndexTitles:", v44);
  v10 = v77;
LABEL_46:
  v52 = *(unsigned int *)((char *)v10 + 49);
  if ((_DWORD)v52 != -1)
  {
    -[TIKeyboardCandidateResultSetCoder data](self, "data");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "length");

    if (v54 > v52)
    {
      v74 = v3;
      -[TIKeyboardCandidateResultSetCoder setOffset:](self, "setOffset:", *(unsigned int *)((char *)v10 + 49));
      -[TIKeyboardCandidateResultSetCoder decodeStringArray](self, "decodeStringArray");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v55, "count"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v57 = v55;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v79;
        do
        {
          for (j = 0; j != v59; ++j)
          {
            if (*(_QWORD *)v79 != v60)
              objc_enumerationMutation(v57);
            v62 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardCandidateResultSetCoder decodeByte](self, "decodeByte") != 0);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setObject:forKey:", v63, v62);

          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
        }
        while (v59);
      }

      v3 = v74;
      -[TIKeyboardCandidateResultSet setShowExtensionCandidates:](v74, "setShowExtensionCandidates:", v56);

      goto LABEL_56;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v71 = *(unsigned int *)((char *)v10 + 49);
      *(_DWORD *)buf = 67109120;
      v89 = v71;
      v67 = MEMORY[0x1E0C81028];
      v68 = "TIKeyboardCandidateResultSet cannot be decoded : show extension candidates offset [%d] is not within the bou"
            "nds of the data being decoded";
      goto LABEL_68;
    }
LABEL_69:

    goto LABEL_70;
  }
LABEL_56:
  v64 = v3;

LABEL_71:
  return v64;
}

- (NSMutableData)mutableData
{
  return self->_mutableData;
}

- (void)setMutableData:(id)a3
{
  objc_storeStrong((id *)&self->_mutableData, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (unint64_t)offset
{
  return self->_offset;
}

- (BOOL)offsetHasPassedEndOfData
{
  return self->_offsetHasPassedEndOfData;
}

- (void)setOffsetHasPassedEndOfData:(BOOL)a3
{
  self->_offsetHasPassedEndOfData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_mutableData, 0);
}

+ (id)candidateTypeToClassNameMap
{
  if (candidateTypeToClassNameMap___onceToken != -1)
    dispatch_once(&candidateTypeToClassNameMap___onceToken, &__block_literal_global_3771);
  return (id)candidateTypeToClassNameMap___candidateTypeToClassNameMap;
}

+ (Class)classFromCandidateType:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  Class v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)classFromCandidateType____candidateTypeToClassMap;
  if (!classFromCandidateType____candidateTypeToClassMap)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)classFromCandidateType____candidateTypeToClassMap;
    classFromCandidateType____candidateTypeToClassMap = (uint64_t)v6;

    v5 = (void *)classFromCandidateType____candidateTypeToClassMap;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (Class)(id)objc_msgSend(v5, "objectForKey:", v8);

  if (!v9)
  {
    objc_msgSend(a1, "candidateTypeToClassNameMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v9 = NSClassFromString(v12);
      if (v9)
      {
        v13 = (void *)classFromCandidateType____candidateTypeToClassMap;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v9, v14);

      }
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

+ (id)encodeWithCandidateResultSet:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = -[TIKeyboardCandidateResultSetCoder initForEncoding]([TIKeyboardCandidateResultSetCoder alloc], "initForEncoding");
  objc_msgSend(v4, "dataFromCandidateResultSet:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)decodeWithData:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = -[TIKeyboardCandidateResultSetCoder initForDecodingWithData:]([TIKeyboardCandidateResultSetCoder alloc], "initForDecodingWithData:", v3);

  objc_msgSend(v4, "candidateResultSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __64__TIKeyboardCandidateResultSetCoder_candidateTypeToClassNameMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E24C03B8;
  v2[1] = &unk_1E24C03D0;
  v3[0] = CFSTR("TIKeyboardCandidate");
  v3[1] = CFSTR("TIKeyboardCandidateSingle");
  v2[2] = &unk_1E24C03E8;
  v2[3] = &unk_1E24C0400;
  v3[2] = CFSTR("TIMecabraCandidate");
  v3[3] = CFSTR("TIPinyinDisambiguationCandidate");
  v2[4] = &unk_1E24C0418;
  v2[5] = &unk_1E24C0430;
  v3[4] = CFSTR("TIHandwritingCandidate");
  v3[5] = CFSTR("TIZephyrCandidate");
  v2[6] = &unk_1E24C0448;
  v2[7] = &unk_1E24C0460;
  v3[6] = CFSTR("TIShortcutConversionCandidate");
  v3[7] = CFSTR("TICompositeMecabraCandidate");
  v2[8] = &unk_1E24C0478;
  v2[9] = &unk_1E24C0490;
  v3[8] = CFSTR("TIMecabraFacemarkCandidate");
  v3[9] = CFSTR("TITextAnimationCandidate");
  v2[10] = &unk_1E24C04A8;
  v2[11] = &unk_1E24C04C0;
  v3[10] = CFSTR("TILiveConversionCandidate");
  v3[11] = CFSTR("TILabeledKeyboardCandidate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)candidateTypeToClassNameMap___candidateTypeToClassNameMap;
  candidateTypeToClassNameMap___candidateTypeToClassNameMap = v0;

}

@end
