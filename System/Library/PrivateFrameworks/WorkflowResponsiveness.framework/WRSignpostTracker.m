@implementation WRSignpostTracker

- (id)initWithSignpost:(void *)a3 individuationIdentifier:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)WRSignpostTracker;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
    }
  }

  return a1;
}

- (NSArray)intervals
{
  if (self)
    self = (WRSignpostTracker *)objc_getProperty(self, a2, 40, 1);
  return (NSArray *)(id)-[WRSignpostTracker copy](self, "copy");
}

- (id)intervalsMutable
{
  if (result)
    return objc_getProperty(result, a2, 40, 1);
  return result;
}

- (NSArray)emits
{
  if (self)
    self = (WRSignpostTracker *)objc_getProperty(self, a2, 48, 1);
  return (NSArray *)(id)-[WRSignpostTracker copy](self, "copy");
}

- (id)emitsMutable
{
  if (result)
    return objc_getProperty(result, a2, 48, 1);
  return result;
}

- (NSArray)incompleteIntervalStarts
{
  if (self)
    self = (WRSignpostTracker *)objc_getProperty(self, a2, 56, 1);
  return (NSArray *)(id)-[WRSignpostTracker copy](self, "copy");
}

- (id)incompleteIntervalStartsMutable
{
  if (result)
    return objc_getProperty(result, a2, 56, 1);
  return result;
}

- (NSDictionary)environment
{
  if (self)
    self = (WRSignpostTracker *)objc_getProperty(self, a2, 32, 1);
  return (NSDictionary *)(id)-[WRSignpostTracker copy](self, "copy");
}

- (id)environmentMutable
{
  if (result)
    return objc_getProperty(result, a2, 32, 1);
  return result;
}

- ($9113E22C387CB8549570940FFDE4B24C)statsWithEventEndNs:(SEL)a3
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  unint64_t *v30;
  unint64_t *v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  double v35;
  unint64_t var2;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  BOOL v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  NSObject *v48;
  void *v49;
  unint64_t *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  unint64_t var1;
  _QWORD *v55;
  uint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  __int128 v59;
  unint64_t v60;
  unint64_t v61;
  $9113E22C387CB8549570940FFDE4B24C *result;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  $50828A08DC8D0425568E958C1030530A *p_var1;
  void *v68;
  WRSignpostTracker *v69;
  unint64_t v70;
  void *v71;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  unint64_t v77;
  char *__ptr;
  int v79;
  int v80;
  unint64_t v81;
  unint64_t var3;
  unint64_t v83;
  void *v84;
  uint64_t v85;
  int v86;
  char *v87;
  char *v88;
  $9113E22C387CB8549570940FFDE4B24C *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint8_t buf[4];
  const __CFString *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  double v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  double v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&retstr->var1.var2 = 0u;
  *(_OWORD *)&retstr->var1.var4 = 0u;
  *(_OWORD *)&retstr->var0.var2 = 0u;
  *(_OWORD *)&retstr->var0.var4 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var1.var0 = 0u;
  -[WRSignpostTracker intervals](self, "intervals");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v76, "count");
  -[WRSignpostTracker incompleteIntervalStarts](self, "incompleteIntervalStarts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v69 = self;
  -[WRSignpostTracker emits](self, "emits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v85 = v8;
  v11 = v8 + v6;
  v89 = retstr;
  retstr->var0.var0 = v10 + v8 + v6;
  v73 = v6;
  p_var1 = &retstr->var1;
  retstr->var1.var0 = v10 + v6;
  if (!v10)
  {
    v13 = 0;
    v16 = -1;
    v15 = -1;
    if (!v11)
      goto LABEL_58;
    goto LABEL_13;
  }
  v12 = v10;
  v13 = 0;
  v14 = 0;
  v15 = -1;
  v16 = -1;
  do
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "machContTimeNs");
    if (v15 >= v18)
      v15 = v18;
    if (v16 >= v18)
      v16 = v18;
    if (v13 <= v18)
      v13 = v18;

    ++v14;
  }
  while (v12 != v14);
  if (v11)
  {
LABEL_13:
    v92 = 0;
    v93 = 0;
    v90 = 0;
    v91 = 0;
    v19 = v73;
    v68 = v9;
    if (v73)
    {
      v65 = v7;
      v77 = 0;
      v70 = 0;
      __ptr = 0;
      v81 = 0;
      v83 = 0;
      v20 = 0;
      v21 = 0;
      v79 = 0;
      v22 = 16;
      do
      {
        objc_msgSend(v76, "objectAtIndexedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "start");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "machContTimeNs");

        objc_msgSend(v23, "end");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "machContTimeNs");

        v28 = v27 - v25;
        v29 = (char *)reallocf(v20, v22 & 0xFFFFFFFF0);
        v20 = v29;
        v30 = (unint64_t *)&v29[16 * v21];
        *v30 = v25;
        v30[1] = v27;
        if (v81 < v27 - v25)
        {
          v89->var0.var3 = v28;
          v81 = v27 - v25;
        }
        v83 += v28;
        v89->var0.var2 = v83;
        if (v85)
        {
          v87 = v29;
          __ptr = (char *)reallocf(__ptr, 16 * (v79 + 1));
          v31 = (unint64_t *)&__ptr[16 * v79];
          *v31 = v25;
          v31[1] = v27;
          if (v70 < v28)
          {
            v89->var1.var3 = v28;
            v70 = v27 - v25;
          }
          v20 = v87;
          v77 += v28;
          v89->var1.var2 = v77;
          ++v79;
        }
        ++v21;
        if (v15 >= v25)
          v15 = v25;
        if (v16 >= v25)
          v16 = v25;
        if (v13 <= v27)
          v13 = v27;

        v22 += 16;
      }
      while (v73 != v21);
      v93 = v20;
      v91 = __ptr;
      v7 = v65;
      v32 = v21;
      v9 = v68;
      v19 = v79;
    }
    else
    {
      v20 = 0;
      v32 = 0;
    }
    LODWORD(v92) = v32;
    LODWORD(v90) = v19;
    if (!v85)
    {
LABEL_47:
      LODWORD(v92) = v32;
      WRRangesSortAndCoalesce((unsigned int *)&v92);
      v52 = v92;
      v53 = v93;
      if ((_DWORD)v92)
      {
        var1 = v89->var0.var1;
        v55 = (char *)v93 + 8;
        do
        {
          var1 += *v55 - *(v55 - 1);
          v55 += 2;
          --v52;
        }
        while (v52);
        v89->var0.var1 = var1;
      }
      free(v53);
      if (v85)
      {
        WRRangesSortAndCoalesce((unsigned int *)&v90);
        v56 = v90;
        if ((_DWORD)v90)
        {
          v57 = v89->var1.var1;
          v58 = (char *)v91 + 8;
          do
          {
            v57 += *v58 - *(v58 - 1);
            v58 += 2;
            --v56;
          }
          while (v56);
          v89->var1.var1 = v57;
        }
      }
      else
      {
        v59 = *(_OWORD *)&v89->var0.var2;
        *(_OWORD *)&p_var1->var0 = *(_OWORD *)&v89->var0.var0;
        *(_OWORD *)&p_var1->var2 = v59;
      }
      free(v91);
      goto LABEL_58;
    }
    v88 = v20;
    v33 = 0;
    v34 = a4;
    v35 = (double)a4;
    var2 = v89->var0.var2;
    v80 = v32;
    var3 = v89->var0.var3;
    v86 = v32;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v33, v63);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "machContTimeNs");
      v39 = v38;
      v84 = v37;
      if (!v34)
        goto LABEL_39;
      v40 = v34 > v38;
      v34 -= v38;
      if (v40)
        goto LABEL_39;
      v41 = v7;
      -[WRSignpostTracker signpost](v69, "signpost");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "individuationFieldName");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      -[WRSignpostTracker signpost](v69, "signpost");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v43)
      {
        objc_msgSend(v44, "individuationFieldName");

        -[WRSignpostTracker individuationIdentifier](v69, "individuationIdentifier");
        -[WRSignpostTracker signpost](v69, "signpost");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "name");

        v47 = *__error();
        _wrlog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          -[WRSignpostTracker signpost](v69, "signpost");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "name");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[WRSignpostTracker signpost](v69, "signpost");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "individuationFieldName");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[WRSignpostTracker individuationIdentifier](v69, "individuationIdentifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v95 = CFSTR("<workflow>");
          v96 = 2114;
          v97 = v74;
          v98 = 2114;
          v99 = *(double *)&v64;
          v100 = 2112;
          v101 = v63;
          v102 = 2048;
          v103 = ((double)v39 - v35) / 1000000000.0;
          _os_log_error_impl(&dword_24A5B4000, v48, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@->%@: Interval start after event end (%.3f later)", buf, 0x34u);

          v49 = v71;
LABEL_46:

        }
      }
      else
      {
        objc_msgSend(v44, "name");

        v47 = *__error();
        _wrlog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          -[WRSignpostTracker signpost](v69, "signpost");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "name");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v95 = CFSTR("<workflow>");
          v96 = 2114;
          v97 = v51;
          v98 = 2048;
          v99 = ((double)v39 - v35) / 1000000000.0;
          _os_log_error_impl(&dword_24A5B4000, v48, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: Interval start after event end (%.3f later)", buf, 0x20u);

          v49 = v75;
          goto LABEL_46;
        }
      }

      v34 = 0;
      *__error() = v47;
      v7 = v41;
LABEL_39:
      v88 = (char *)reallocf(v88, 16 * (v80 + v33 + 1));
      v50 = (unint64_t *)&v88[16 * (v80 + v33)];
      *v50 = v39;
      v50[1] = v34 + v39;
      if (var3 < v34)
      {
        v89->var0.var3 = v34;
        var3 = v34;
      }
      var2 += v34;
      v89->var0.var2 = var2;
      if (v15 >= v39)
        v15 = v39;

      ++v33;
      v34 = a4;
      if (v85 == v33)
      {
        v93 = v88;
        v32 = v86 + v33;
        v9 = v68;
        goto LABEL_47;
      }
    }
  }
LABEL_58:
  if (v15 == -1)
    v60 = 0;
  else
    v60 = v15;
  v89->var0.var4 = v60;
  v89->var0.var5 = v13;
  if (v16 == -1)
    v61 = 0;
  else
    v61 = v16;
  v89->var1.var4 = v61;
  v89->var1.var5 = v13;

  return result;
}

- (id)diagnosticsExceedingThresholdsWithEventStartNs:(id)a1 eventEndNs:
{
  id v1;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "statsWithEventEndNs:");
    v1 = 0;
  }
  return v1;
}

- (void)reset
{
  SEL v3;
  SEL v4;
  SEL v5;

  if (a1)
  {
    objc_setProperty_atomic(a1, a2, 0, 40);
    objc_setProperty_atomic(a1, v3, 0, 48);
    objc_setProperty_atomic(a1, v4, 0, 56);
    objc_setProperty_atomic(a1, v5, 0, 32);
  }
}

- (void)setIntervalsMutable:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 40);
}

- (void)setEmitsMutable:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 48);
}

- (void)setIncompleteIntervalStartsMutable:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 56);
}

- (void)setEnvironmentMutable:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 32);
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[WRSignpost debugDescription](self->_signpost, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Tracker for %@"), v4);

  return v5;
}

- (id)encodedDict
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v1 = a1;
  v60 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x24BDBCED8]);
    objc_msgSend(v1, "signpost");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v4, CFSTR("st_name"), 0);

    objc_msgSend(v1, "individuationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("st_individuation_identifier"));

    objc_msgSend(v1, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("st_environment"));

    objc_msgSend(v1, "intervals");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v1, "intervals");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      objc_msgSend(v1, "intervals");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v54;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v54 != v16)
              objc_enumerationMutation(v13);
            -[WRIntervalAndThreads encodedDict](*(id *)(*((_QWORD *)&v53 + 1) + 8 * v17));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v18);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
        }
        while (v15);
      }

      v19 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("st_intervals"));

    }
    objc_msgSend(v1, "emits");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      v22 = objc_alloc(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v1, "emits");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend(v1, "emits");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v50;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v50 != v28)
              objc_enumerationMutation(v25);
            -[WRTimestampAndThread encodedDict](*(void **)(*((_QWORD *)&v49 + 1) + 8 * v29));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v30);

            ++v29;
          }
          while (v27 != v29);
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        }
        while (v27);
      }

      v31 = (void *)objc_msgSend(v24, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("st_emits"));

    }
    objc_msgSend(v1, "incompleteIntervalStarts");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33)
    {
      v34 = objc_alloc(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v1, "incompleteIntervalStarts");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v34, "initWithCapacity:", objc_msgSend(v35, "count"));

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v1, "incompleteIntervalStarts");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v46;
        do
        {
          v41 = 0;
          do
          {
            if (*(_QWORD *)v46 != v40)
              objc_enumerationMutation(v37);
            -[WRTimestampAndThread encodedDict](*(void **)(*((_QWORD *)&v45 + 1) + 8 * v41));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v42);

            ++v41;
          }
          while (v39 != v41);
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        }
        while (v39);
      }

      v43 = (void *)objc_msgSend(v36, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("st_incomplete_interval_starts"));

    }
    v1 = (id)objc_msgSend(v5, "copy");

  }
  return v1;
}

- (_QWORD)initWithEncodedDict:(void *)a3 signpost:(uint64_t *)a4 error:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id *v26;
  id *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  id *v34;
  id *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  id *v44;
  id *v45;
  void *v46;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  objc_super v73;
  uint64_t v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v53 = a2;
  v50 = a3;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_65;
  }
  v74 = 0;
  if (a4)
    *a4 = 0;
  else
    a4 = &v74;
  v73.receiver = a1;
  v73.super_class = (Class)WRSignpostTracker;
  v7 = objc_msgSendSuper2(&v73, sel_init);
  v14 = v7;
  if (v7)
  {
    objc_storeStrong((id *)v7 + 2, a3);
    DictGetString(v53, CFSTR("st_individuation_identifier"), a4);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v14[3];
    v14[3] = v15;

    if (!v14[3] && *a4)
    {
      v18 = 0;
      goto LABEL_64;
    }
    DictGetDict(v53, CFSTR("st_environment"), a4);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v51 && *a4)
      goto LABEL_18;
    if (objc_msgSend(v51, "count"))
    {
      v67 = 0;
      v68 = &v67;
      v69 = 0x3032000000;
      v70 = __Block_byref_object_copy_;
      v71 = __Block_byref_object_dispose_;
      v72 = 0;
      v66[0] = MEMORY[0x24BDAC760];
      v66[1] = 3221225472;
      v66[2] = __56__WRSignpostTracker_initWithEncodedDict_signpost_error___block_invoke;
      v66[3] = &unk_251BE4530;
      v66[4] = &v67;
      objc_msgSend(v51, "enumerateKeysAndObjectsUsingBlock:", v66);
      v17 = (void *)v68[5];
      if (v17)
      {
        *a4 = (uint64_t)objc_retainAutorelease(v17);
      }
      else
      {
        v19 = objc_msgSend(v51, "mutableCopy");
        v20 = (void *)v14[4];
        v14[4] = v19;

      }
      _Block_object_dispose(&v67, 8);

      if (v17)
      {
LABEL_18:
        v18 = 0;
LABEL_63:

        goto LABEL_64;
      }
    }
    v21 = objc_opt_class();
    DictGetArrayOfClass(v53, CFSTR("st_intervals"), v21, a4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49 && *a4)
    {
      v18 = 0;
LABEL_62:

      goto LABEL_63;
    }
    if (objc_msgSend(v49, "count"))
    {
      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v49, "count"));
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v22 = v49;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v63;
LABEL_23:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v63 != v24)
            objc_enumerationMutation(v22);
          v26 = -[WRIntervalAndThreads initWithEncodedDict:error:]((id *)[WRIntervalAndThreads alloc], *(void **)(*((_QWORD *)&v62 + 1) + 8 * v25), a4);
          v27 = v26;
          if (!v26)
            goto LABEL_59;
          -[WRIntervalAndThreads insertIntoSortedArray:]((uint64_t)v26, v52);

          if (v23 == ++v25)
          {
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
            if (v23)
              goto LABEL_23;
            break;
          }
        }
      }

      v28 = (void *)v14[5];
      v14[5] = v52;

    }
    v29 = objc_opt_class();
    DictGetArrayOfClass(v53, CFSTR("st_emits"), v29, a4);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v52 && *a4)
    {
      v18 = 0;
LABEL_61:

      goto LABEL_62;
    }
    if (objc_msgSend(v52, "count"))
    {
      v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v52, "count"));
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v30 = v52;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v59;
        while (2)
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v59 != v32)
              objc_enumerationMutation(v30);
            v34 = -[WRTimestampAndThread initWithEncodedDict:error:]((id *)[WRTimestampAndThread alloc], *(void **)(*((_QWORD *)&v58 + 1) + 8 * i), a4);
            v35 = v34;
            if (!v34)
            {

              v18 = 0;
              v52 = v30;
              goto LABEL_60;
            }
            -[WRTimestampAndThread insertIntoSortedArray:]((uint64_t)v34, v22);

          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
          if (v31)
            continue;
          break;
        }
      }

      v36 = (void *)v14[6];
      v14[6] = v22;

    }
    v37 = objc_opt_class();
    DictGetArrayOfClass(v53, CFSTR("st_incomplete_interval_starts"), v37, a4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v38;
    if (v38 || !*a4)
    {
      if (objc_msgSend(v38, "count"))
      {
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v22, "count"));
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v40 = v22;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
        if (v41)
        {
          v42 = *(_QWORD *)v55;
          while (2)
          {
            for (j = 0; j != v41; ++j)
            {
              if (*(_QWORD *)v55 != v42)
                objc_enumerationMutation(v40);
              v44 = -[WRTimestampAndThread initWithEncodedDict:error:]((id *)[WRTimestampAndThread alloc], *(void **)(*((_QWORD *)&v54 + 1) + 8 * j), a4);
              v45 = v44;
              if (!v44)
              {

                v18 = 0;
                v22 = v40;
                goto LABEL_60;
              }
              -[WRTimestampAndThread insertIntoSortedArray:]((uint64_t)v44, v39);

            }
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
            if (v41)
              continue;
            break;
          }
        }

        v46 = (void *)v14[7];
        v14[7] = v39;

      }
      v18 = v14;
      goto LABEL_60;
    }
LABEL_59:
    v18 = 0;
LABEL_60:

    goto LABEL_61;
  }
  WRMakeError(2, CFSTR("Unable to init WRSignpostTracker"), v8, v9, v10, v11, v12, v13, v48);
  v18 = 0;
  *a4 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
LABEL_64:

LABEL_65:
  return v18;
}

void __56__WRSignpostTracker_initWithEncodedDict_signpost_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  const char *ClassName;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    ClassName = object_getClassName(v18);
    object_getClassName(v7);
    WRMakeError(6, CFSTR("Invalid type in environment (%s -> %s)"), v9, v10, v11, v12, v13, v14, (uint64_t)ClassName);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    *a4 = 1;
  }

}

- (BOOL)exceededDiagnosticThreshold
{
  void *v2;
  BOOL v3;

  -[WRSignpostTracker diagnosticsExceedingThresholdsWithEventStartNs:eventEndNs:](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (int64_t)timeUntilFirstSignpostNanoseconds
{
  return 0;
}

- (unint64_t)totalDurationNanoseconds
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WRSignpostTracker intervals](self, "intervals", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "end");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "machContTimeNs");
        objc_msgSend(v8, "start");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += v10 - objc_msgSend(v11, "machContTimeNs");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)count
{
  WRSignpostTracker *v2;
  const char *v3;
  int v4;
  id Property;
  int v6;
  void *v7;
  int v8;

  v2 = self;
  if (self)
    self = (WRSignpostTracker *)objc_getProperty(self, a2, 48, 1);
  v4 = -[WRSignpostTracker count](self, "count");
  if (v2)
    Property = objc_getProperty(v2, v3, 40, 1);
  else
    Property = 0;
  v6 = objc_msgSend(Property, "count") + v4;
  -[WRSignpostTracker incompleteIntervalStarts](v2, "incompleteIntervalStarts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "count");

  return v8;
}

- (WRSignpost)signpost
{
  return (WRSignpost *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)individuationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (uint64_t)isMiddleOfInterval
{
  if (result)
    return *(_BYTE *)(result + 8) & 1;
  return result;
}

- (uint64_t)setIsMiddleOfInterval:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 8) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incompleteIntervalStartsMutable, 0);
  objc_storeStrong((id *)&self->_emitsMutable, 0);
  objc_storeStrong((id *)&self->_intervalsMutable, 0);
  objc_storeStrong((id *)&self->_environmentMutable, 0);
  objc_storeStrong((id *)&self->_individuationIdentifier, 0);
  objc_storeStrong((id *)&self->_signpost, 0);
}

@end
