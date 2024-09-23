@implementation SignpostAggregationValueStats

+ (id)zeroedValue
{
  SignpostAggregationValueStats *v2;
  id v3;

  v2 = objc_alloc_init(SignpostAggregationValueStats);
  -[SignpostAggregationValueStats setCount:](v2, "setCount:", &unk_1E462E900);
  -[SignpostAggregationValueStats set_rawTotal:](v2, "set_rawTotal:", &unk_1E462E900);
  v3 = -[SignpostAggregationValueStats _finalizeState](v2, "_finalizeState");
  return v2;
}

- (id)_finalizeState
{
  uint64_t v3;
  void *v4;
  void *v5;
  id result;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;

  -[SignpostAggregationValueStats _rawTotal](self, "_rawTotal");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[SignpostAggregationValueStats _rawAverage](self, "_rawAverage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return CFSTR("Cannot specify both raw total and average value");
  }
  -[SignpostAggregationValueStats _rawTotal](self, "_rawTotal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    -[SignpostAggregationValueStats _rawAverage](self, "_rawAverage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      return CFSTR("Either total or average is required");
  }
  -[SignpostAggregationValueStats count](self, "count");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    return CFSTR("Missing 'count'");
  -[SignpostAggregationValueStats count](self, "count");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v12 < 0.0)
    return CFSTR("Negative count not supported");
  -[SignpostAggregationValueStats _rawTotal](self, "_rawTotal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAggregationValueStats count](self, "count");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (double)(unint64_t)objc_msgSend(v15, "unsignedLongLongValue");
    -[SignpostAggregationValueStats _rawAverage](self, "_rawAverage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    objc_msgSend(v14, "numberWithDouble:", v18 * v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAggregationValueStats set_rawTotal:](self, "set_rawTotal:", v19);

  }
  -[SignpostAggregationValueStats _rawAverage](self, "_rawAverage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    -[SignpostAggregationValueStats count](self, "count");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedLongLongValue");

    if (v22)
    {
      v23 = (void *)MEMORY[0x1E0CB37E8];
      -[SignpostAggregationValueStats _rawTotal](self, "_rawTotal");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "doubleValue");
      v26 = v25;
      -[SignpostAggregationValueStats count](self, "count");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "numberWithDouble:", v26 / (double)(unint64_t)objc_msgSend(v27, "unsignedLongLongValue"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregationValueStats set_rawAverage:](self, "set_rawAverage:", v28);

    }
    else
    {
      -[SignpostAggregationValueStats set_rawAverage:](self, "set_rawAverage:", &unk_1E462E900);
    }
  }
  -[SignpostAggregationValueStats count](self, "count");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "unsignedLongLongValue");

  if (!v30)
  {
    -[SignpostAggregationValueStats setMin:](self, "setMin:", 0);
    -[SignpostAggregationValueStats setMax:](self, "setMax:", 0);
    -[SignpostAggregationValueStats setStddev:](self, "setStddev:", 0);
  }
  -[SignpostAggregationValueStats stddev](self, "stddev");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "doubleValue");
  v33 = v32;

  if (v33 < 0.0)
    return CFSTR("Negative stddev is invalid");
  -[SignpostAggregationValueStats _rawTotal](self, "_rawTotal");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[SignpostAggregationValueStats count](self, "count");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "unsignedLongLongValue"))
    {

    }
    else
    {
      -[SignpostAggregationValueStats _rawTotal](self, "_rawTotal");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "doubleValue");
      v51 = v50;

      if (v51 != 0.0)
        return CFSTR("Non-zero raw total with zero count");
    }
  }
  -[SignpostAggregationValueStats _rawAverage](self, "_rawAverage");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[SignpostAggregationValueStats count](self, "count");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "unsignedLongLongValue"))
    {

    }
    else
    {
      -[SignpostAggregationValueStats _rawAverage](self, "_rawAverage");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "doubleValue");
      v54 = v53;

      if (v54 != 0.0)
        return CFSTR("Non-zero average with zero count");
    }
  }
  -[SignpostAggregationValueStats min](self, "min");
  result = (id)objc_claimAutoreleasedReturnValue();
  if (!result)
    return result;
  v40 = result;
  -[SignpostAggregationValueStats max](self, "max");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[SignpostAggregationValueStats min](self, "min");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "doubleValue");
    v45 = v44;
    -[SignpostAggregationValueStats max](self, "max");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "doubleValue");
    v48 = v47;

    if (v45 > v48)
      return CFSTR("Min is greather than max");
  }
  else
  {

  }
  return 0;
}

+ (id)sumOfStats0:(id)a3 stats1:(id)a4 errorOut:(id *)a5
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  SignpostAggregationValueStats *v10;
  SignpostAggregationValueStats *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  uint64_t v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  unint64_t v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  double v107;
  void *v108;
  unint64_t v109;
  void *v110;
  unint64_t v111;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  v9 = (void *)v8;
  if (v7 | v8)
  {
    if (v7 && !v8)
    {
      v8 = v7;
LABEL_8:
      v10 = (SignpostAggregationValueStats *)objc_msgSend((id)v8, "copy");
      goto LABEL_87;
    }
    if (!v7 && v8)
      goto LABEL_8;
    v11 = objc_alloc_init(SignpostAggregationValueStats);
    objc_msgSend((id)v7, "count");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "unsignedLongLongValue"))
    {
      objc_msgSend(v9, "count");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedLongLongValue");

      if (v14)
      {
        objc_msgSend((id)v7, "_rawAverage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v9, "_rawAverage");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {

            goto LABEL_38;
          }
        }
        objc_msgSend((id)v7, "_rawAverage");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {

          if (v15)
          {

          }
        }
        else
        {
          objc_msgSend(v9, "_rawAverage");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {

          }
          if (v37)
          {
LABEL_38:
            if (a5)
            {
              v38 = (void *)MEMORY[0x1E0CB35C8];
              v39 = CFSTR("Cannot add stats with and without average value");
LABEL_84:
              objc_msgSend(v38, "errorWithCode:description:", 9, v39);
              v10 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_86:

              goto LABEL_87;
            }
            goto LABEL_85;
          }
        }
        objc_msgSend((id)v7, "_rawTotal");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          objc_msgSend(v9, "_rawTotal");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {

            goto LABEL_49;
          }
        }
        objc_msgSend((id)v7, "_rawTotal");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {

          if (v40)
          {

          }
        }
        else
        {
          objc_msgSend(v9, "_rawTotal");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {

          }
          if (v42)
          {
LABEL_49:
            if (a5)
            {
              v38 = (void *)MEMORY[0x1E0CB35C8];
              v39 = CFSTR("Cannot add stats with and without total value");
              goto LABEL_84;
            }
LABEL_85:
            v10 = 0;
            goto LABEL_86;
          }
        }
        objc_msgSend((id)v7, "min");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          objc_msgSend(v9, "min");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {

            goto LABEL_60;
          }
        }
        objc_msgSend((id)v7, "min");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
        {

          if (v43)
          {

          }
        }
        else
        {
          objc_msgSend(v9, "min");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {

          }
          if (v45)
          {
LABEL_60:
            if (a5)
            {
              v38 = (void *)MEMORY[0x1E0CB35C8];
              v39 = CFSTR("Cannot add stats with and without minimum value");
              goto LABEL_84;
            }
            goto LABEL_85;
          }
        }
        objc_msgSend((id)v7, "max");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          objc_msgSend(v9, "max");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {

            goto LABEL_71;
          }
        }
        objc_msgSend((id)v7, "max");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
        {

          if (v46)
          {

          }
        }
        else
        {
          objc_msgSend(v9, "max");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {

          }
          if (v48)
          {
LABEL_71:
            if (a5)
            {
              v38 = (void *)MEMORY[0x1E0CB35C8];
              v39 = CFSTR("Cannot add stats with and without maximum value");
              goto LABEL_84;
            }
            goto LABEL_85;
          }
        }
        objc_msgSend((id)v7, "stddev");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          objc_msgSend(v9, "stddev");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {

            goto LABEL_82;
          }
        }
        objc_msgSend((id)v7, "stddev");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {

          if (v49)
          {

          }
        }
        else
        {
          objc_msgSend(v9, "stddev");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {

          }
          if (v51)
          {
LABEL_82:
            if (a5)
            {
              v38 = (void *)MEMORY[0x1E0CB35C8];
              v39 = CFSTR("Cannot add stats with and without stddev value");
              goto LABEL_84;
            }
            goto LABEL_85;
          }
        }
        objc_msgSend((id)v7, "count");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "unsignedLongLongValue");
        objc_msgSend(v9, "count");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "unsignedLongLongValue") + v54;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostAggregationValueStats setCount:](v11, "setCount:", v57);

        objc_msgSend((id)v7, "min");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          v59 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend((id)v7, "min");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "doubleValue");
          v62 = v61;

          objc_msgSend(v9, "min");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "doubleValue");
          v65 = v64;

          if (v62 >= v65)
            v66 = v65;
          else
            v66 = v62;
          objc_msgSend(v59, "numberWithDouble:", v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostAggregationValueStats setMin:](v11, "setMin:", v67);

        }
        objc_msgSend((id)v7, "max");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          v69 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend((id)v7, "max");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "doubleValue");
          v72 = v71;

          objc_msgSend(v9, "max");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "doubleValue");
          v75 = v74;

          if (v72 >= v75)
            v76 = v72;
          else
            v76 = v75;
          objc_msgSend(v69, "numberWithDouble:", v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostAggregationValueStats setMax:](v11, "setMax:", v77);

        }
        objc_msgSend((id)v7, "stddev");
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        if (v78)
        {
          objc_msgSend((id)v7, "count");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = objc_msgSend(v110, "unsignedLongLongValue");
          objc_msgSend((id)v7, "total");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "doubleValue");
          v81 = v80;
          objc_msgSend((id)v7, "stddev");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "doubleValue");
          v84 = v83;
          objc_msgSend(v9, "count");
          v111 = v56;
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "unsignedLongLongValue");
          objc_msgSend(v9, "total");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "doubleValue");
          v89 = v88;
          objc_msgSend(v9, "stddev");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "doubleValue");
          _combinedStdDev(v109, v86, v81, v84, v89, v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostAggregationValueStats setStddev:](v11, "setStddev:", v92);

          v56 = v111;
        }
        objc_msgSend((id)v7, "_rawAverage");
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        if (v93)
        {
          v94 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend((id)v7, "total");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "doubleValue");
          v97 = v96;
          objc_msgSend(v9, "total");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "doubleValue");
          objc_msgSend(v94, "numberWithDouble:", (v97 + v99) / (double)v56);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostAggregationValueStats set_rawAverage:](v11, "set_rawAverage:", v100);

        }
        objc_msgSend((id)v7, "_rawTotal");
        v101 = (void *)objc_claimAutoreleasedReturnValue();

        if (v101)
        {
          v102 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend((id)v7, "_rawTotal");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "doubleValue");
          v105 = v104;
          objc_msgSend(v9, "_rawTotal");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "doubleValue");
          objc_msgSend(v102, "numberWithDouble:", v105 + v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostAggregationValueStats set_rawTotal:](v11, "set_rawTotal:", v108);

        }
LABEL_26:
        -[SignpostAggregationValueStats _finalizeState](v11, "_finalizeState");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        if (a5 && v32)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v32);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        v10 = v11;

        goto LABEL_86;
      }
    }
    else
    {

    }
    objc_msgSend((id)v7, "count");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "unsignedLongLongValue"))
    {

    }
    else
    {
      objc_msgSend(v9, "count");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "unsignedLongLongValue");

      if (v26)
      {
        objc_msgSend(v9, "count");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostAggregationValueStats setCount:](v11, "setCount:", v27);

        objc_msgSend(v9, "min");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostAggregationValueStats setMin:](v11, "setMin:", v28);

        objc_msgSend(v9, "max");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostAggregationValueStats setMax:](v11, "setMax:", v29);

        objc_msgSend(v9, "stddev");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostAggregationValueStats setStddev:](v11, "setStddev:", v30);

        v24 = v9;
        goto LABEL_22;
      }
    }
    objc_msgSend((id)v7, "count");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "unsignedLongLongValue"))
    {
      objc_msgSend(v9, "count");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "unsignedLongLongValue");

      if (!v19)
      {
        objc_msgSend((id)v7, "count");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostAggregationValueStats setCount:](v11, "setCount:", v20);

        objc_msgSend((id)v7, "min");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostAggregationValueStats setMin:](v11, "setMin:", v21);

        objc_msgSend((id)v7, "max");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostAggregationValueStats setMax:](v11, "setMax:", v22);

        objc_msgSend((id)v7, "stddev");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostAggregationValueStats setStddev:](v11, "setStddev:", v23);

        v24 = (void *)v7;
LABEL_22:
        objc_msgSend(v24, "_rawTotal");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostAggregationValueStats set_rawTotal:](v11, "set_rawTotal:", v31);
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {

    }
    objc_msgSend((id)v7, "count");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v31, "unsignedLongLongValue"))
    {
      objc_msgSend(v9, "count");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "unsignedLongLongValue");

      if (!v36)
      {
        -[SignpostAggregationValueStats setCount:](v11, "setCount:", &unk_1E462E900);
        -[SignpostAggregationValueStats setMin:](v11, "setMin:", 0);
        -[SignpostAggregationValueStats setMax:](v11, "setMax:", 0);
        -[SignpostAggregationValueStats setStddev:](v11, "setStddev:", 0);
        -[SignpostAggregationValueStats set_rawTotal:](v11, "set_rawTotal:", &unk_1E462E900);
      }
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  v10 = 0;
LABEL_87:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SignpostAggregationValueStats *v4;
  SignpostAggregationValueStats *v5;
  SignpostAggregationValueStats *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  SignpostAggregationValueStats *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  SignpostAggregationValueStats *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  SignpostAggregationValueStats *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  SignpostAggregationValueStats *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  SignpostAggregationValueStats *v49;
  void *v50;
  char v51;
  void *v52;
  void *v54;
  void *v55;

  v4 = (SignpostAggregationValueStats *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      v11 = 1;
      goto LABEL_80;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[SignpostAggregationValueStats _rawAverage](self, "_rawAverage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregationValueStats _rawAverage](v6, "_rawAverage");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

        goto LABEL_21;
      }
      v9 = (void *)v8;
      -[SignpostAggregationValueStats _rawAverage](self, "_rawAverage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[SignpostAggregationValueStats _rawAverage](v6, "_rawAverage");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v55)
          goto LABEL_69;
      }
      -[SignpostAggregationValueStats _rawAverage](self, "_rawAverage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (-[SignpostAggregationValueStats _rawAverage](v6, "_rawAverage"),
            (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v13 = v9;
        -[SignpostAggregationValueStats _rawAverage](self, "_rawAverage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v6;
        -[SignpostAggregationValueStats _rawAverage](v6, "_rawAverage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "isEqual:", v16) ^ 1;

        if (v12)
        {

          v6 = v15;
          v9 = v13;
          goto LABEL_18;
        }
        v18 = 0;
        v6 = v15;
        v9 = v13;
      }
      else
      {
        v17 = 1;
      }

LABEL_18:
      if (v10)
      {

      }
      if ((v17 & 1) != 0)
        goto LABEL_76;
LABEL_21:
      -[SignpostAggregationValueStats _rawTotal](self, "_rawTotal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregationValueStats _rawTotal](v6, "_rawTotal");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v19)
      {

        goto LABEL_36;
      }
      v9 = (void *)v19;
      -[SignpostAggregationValueStats _rawTotal](self, "_rawTotal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[SignpostAggregationValueStats _rawTotal](v6, "_rawTotal");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v55)
          goto LABEL_69;
      }
      -[SignpostAggregationValueStats _rawTotal](self, "_rawTotal");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20
        || (-[SignpostAggregationValueStats _rawTotal](v6, "_rawTotal"),
            (v27 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v21 = v9;
        -[SignpostAggregationValueStats _rawTotal](self, "_rawTotal");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v6;
        -[SignpostAggregationValueStats _rawTotal](v6, "_rawTotal");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v22, "isEqual:", v24) ^ 1;

        if (v20)
        {

          v6 = v23;
          v9 = v21;
          v26 = v55;
          if (!v10)
          {
LABEL_35:

            if ((v25 & 1) != 0)
              goto LABEL_76;
LABEL_36:
            -[SignpostAggregationValueStats min](self, "min");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[SignpostAggregationValueStats min](v6, "min");
            v28 = objc_claimAutoreleasedReturnValue();
            if (v7 == (void *)v28)
            {

              goto LABEL_51;
            }
            v9 = (void *)v28;
            -[SignpostAggregationValueStats min](self, "min");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              -[SignpostAggregationValueStats min](v6, "min");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v55)
                goto LABEL_69;
            }
            -[SignpostAggregationValueStats min](self, "min");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29
              || (-[SignpostAggregationValueStats min](v6, "min"),
                  (v35 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              v30 = v9;
              -[SignpostAggregationValueStats min](self, "min");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v6;
              -[SignpostAggregationValueStats min](v6, "min");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v31, "isEqual:", v33) ^ 1;

              if (v29)
              {

                v6 = v32;
                v9 = v30;
                goto LABEL_48;
              }
              v35 = 0;
              v6 = v32;
              v9 = v30;
            }
            else
            {
              v34 = 1;
            }

LABEL_48:
            if (v10)
            {

            }
            if ((v34 & 1) != 0)
              goto LABEL_76;
LABEL_51:
            -[SignpostAggregationValueStats max](self, "max");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[SignpostAggregationValueStats max](v6, "max");
            v36 = objc_claimAutoreleasedReturnValue();
            if (v7 == (void *)v36)
            {

              goto LABEL_66;
            }
            v9 = (void *)v36;
            -[SignpostAggregationValueStats max](self, "max");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              -[SignpostAggregationValueStats max](v6, "max");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v55)
                goto LABEL_69;
            }
            -[SignpostAggregationValueStats max](self, "max");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37
              || (-[SignpostAggregationValueStats max](v6, "max"),
                  (v44 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              v38 = v9;
              -[SignpostAggregationValueStats max](self, "max");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v6;
              -[SignpostAggregationValueStats max](v6, "max");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v39, "isEqual:", v41) ^ 1;

              if (v37)
              {

                v6 = v40;
                v9 = v38;
                v43 = v55;
                if (!v10)
                {
LABEL_65:

                  if ((v42 & 1) == 0)
                  {
LABEL_66:
                    -[SignpostAggregationValueStats stddev](self, "stddev");
                    v7 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SignpostAggregationValueStats stddev](v6, "stddev");
                    v45 = objc_claimAutoreleasedReturnValue();
                    if (v7 == (void *)v45)
                    {

                      goto LABEL_77;
                    }
                    v9 = (void *)v45;
                    -[SignpostAggregationValueStats stddev](self, "stddev");
                    v10 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v10)
                    {
                      -[SignpostAggregationValueStats stddev](v6, "stddev");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v55)
                      {
LABEL_69:

                        v11 = 0;
LABEL_78:

                        goto LABEL_79;
                      }
                    }
                    -[SignpostAggregationValueStats stddev](self, "stddev");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v46
                      || (-[SignpostAggregationValueStats stddev](v6, "stddev"),
                          (v54 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
                    {
                      v47 = v9;
                      -[SignpostAggregationValueStats stddev](self, "stddev");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      v49 = v6;
                      -[SignpostAggregationValueStats stddev](v6, "stddev");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v51 = objc_msgSend(v48, "isEqual:", v50) ^ 1;

                      if (v46)
                      {

                        v6 = v49;
                        v9 = v47;
                        v52 = v55;
                        if (!v10)
                          goto LABEL_75;
                        goto LABEL_74;
                      }
                      v54 = 0;
                      v6 = v49;
                      v9 = v47;
                    }
                    else
                    {
                      v51 = 1;
                    }
                    v52 = v55;

                    if (!v10)
                    {
LABEL_75:

                      if ((v51 & 1) != 0)
                        goto LABEL_76;
LABEL_77:
                      -[SignpostAggregationValueStats count](self, "count");
                      v7 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SignpostAggregationValueStats count](v6, "count");
                      v9 = (void *)objc_claimAutoreleasedReturnValue();
                      v11 = v7 == v9;
                      goto LABEL_78;
                    }
LABEL_74:

                    goto LABEL_75;
                  }
LABEL_76:
                  v11 = 0;
LABEL_79:

                  goto LABEL_80;
                }
LABEL_64:

                goto LABEL_65;
              }
              v44 = 0;
              v6 = v40;
              v9 = v38;
            }
            else
            {
              v42 = 1;
            }
            v43 = v55;

            if (!v10)
              goto LABEL_65;
            goto LABEL_64;
          }
LABEL_34:

          goto LABEL_35;
        }
        v27 = 0;
        v6 = v23;
        v9 = v21;
      }
      else
      {
        v25 = 1;
      }
      v26 = v55;

      if (!v10)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  v11 = 0;
LABEL_80:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SignpostAggregationValueStats *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc_init(SignpostAggregationValueStats);
  -[SignpostAggregationValueStats count](self, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationValueStats setCount:](v4, "setCount:", v5);

  -[SignpostAggregationValueStats _rawAverage](self, "_rawAverage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationValueStats set_rawAverage:](v4, "set_rawAverage:", v6);

  -[SignpostAggregationValueStats _rawTotal](self, "_rawTotal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationValueStats set_rawTotal:](v4, "set_rawTotal:", v7);

  -[SignpostAggregationValueStats min](self, "min");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationValueStats setMin:](v4, "setMin:", v8);

  -[SignpostAggregationValueStats max](self, "max");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationValueStats setMax:](v4, "setMax:", v9);

  -[SignpostAggregationValueStats stddev](self, "stddev");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationValueStats setStddev:](v4, "setStddev:", v10);

  return v4;
}

- (NSNumber)count
{
  return self->_count;
}

- (void)setCount:(id)a3
{
  objc_storeStrong((id *)&self->_count, a3);
}

- (NSNumber)min
{
  return self->_min;
}

- (void)setMin:(id)a3
{
  objc_storeStrong((id *)&self->_min, a3);
}

- (NSNumber)max
{
  return self->_max;
}

- (void)setMax:(id)a3
{
  objc_storeStrong((id *)&self->_max, a3);
}

- (NSNumber)stddev
{
  return self->_stddev;
}

- (void)setStddev:(id)a3
{
  objc_storeStrong((id *)&self->_stddev, a3);
}

- (NSNumber)_rawTotal
{
  return self->__rawTotal;
}

- (void)set_rawTotal:(id)a3
{
  objc_storeStrong((id *)&self->__rawTotal, a3);
}

- (NSNumber)_rawAverage
{
  return self->__rawAverage;
}

- (void)set_rawAverage:(id)a3
{
  objc_storeStrong((id *)&self->__rawAverage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__rawAverage, 0);
  objc_storeStrong((id *)&self->__rawTotal, 0);
  objc_storeStrong((id *)&self->_stddev, 0);
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);
  objc_storeStrong((id *)&self->_count, 0);
}

@end
