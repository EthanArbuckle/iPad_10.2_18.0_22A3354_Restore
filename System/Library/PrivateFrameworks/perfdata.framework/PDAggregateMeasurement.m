@implementation PDAggregateMeasurement

- (PDAggregateMeasurement)initWithContainer:(id)a3 metric:(id)a4 unitString:(id)a5
{
  id v8;
  id v9;
  id v10;
  PDAggregateMeasurement *v11;
  PDAggregateMeasurement *v12;
  PDAggregateMeasurement *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PDAggregateMeasurement;
  v11 = -[PDAggregateMeasurement init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[PDAggregateMeasurement setContainer:](v11, "setContainer:", v8);
    -[PDAggregateMeasurement setMetric:](v12, "setMetric:", v9);
    -[PDAggregateMeasurement setUnitString:](v12, "setUnitString:", v10);
    -[PDAggregateMeasurement setValues_mean:](v12, "setValues_mean:", malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL));
    -[PDAggregateMeasurement setStats_mean:](v12, "setStats_mean:", malloc_type_calloc(1uLL, 0x30uLL, 0x1000040EED21634uLL));
    -[PDAggregateMeasurement setValidMin:](v12, "setValidMin:", 1);
    -[PDAggregateMeasurement setMin:](v12, "setMin:", 1.79769313e308);
    -[PDAggregateMeasurement setValidMax:](v12, "setValidMax:", 1);
    -[PDAggregateMeasurement setMax:](v12, "setMax:", 2.22507386e-308);
    v13 = v12;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  free(-[PDAggregateMeasurement values_mean](self, "values_mean"));
  free(-[PDAggregateMeasurement stats_mean](self, "stats_mean"));
  v3.receiver = self;
  v3.super_class = (Class)PDAggregateMeasurement;
  -[PDAggregateMeasurement dealloc](&v3, sel_dealloc);
}

- (void)updateWithMeasurement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  running_mean *v39;
  void *v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  pooled_mean *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  int64x2_t v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  PDAggregateMeasurement *v90;
  PDAggregateMeasurement *v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PDAggregateMeasurement variables](self, "variables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v90 = self;
  v92 = v4;
  if (v5)
  {
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    -[PDAggregateMeasurement variables](self, "variables");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v98 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i);
          objc_msgSend(v4, "variables", v90);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDAggregateMeasurement variables](self, "variables");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v14, "isEqual:", v16);

          self = v90;
          if ((v17 & 1) == 0)
          {
            -[PDAggregateMeasurement variables](v90, "variables");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "removeObjectForKey:", v12);

          }
          v4 = v92;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
      }
      while (v9);
    }

  }
  else
  {
    objc_msgSend(v4, "variables");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");
    -[PDAggregateMeasurement setVariables:](self, "setVariables:", v20);

  }
  -[PDAggregateMeasurement labels](self, "labels", v90);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDAggregateMeasurement setLabels:](self, "setLabels:", v22);

  }
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend(v4, "labels");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v24;
  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v94;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v94 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * j);
        -[PDAggregateMeasurement labels](self, "labels");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v4, "labels");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "unionSet:", v34);
        }
        else
        {
          -[PDAggregateMeasurement labels](self, "labels");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v4, "labels");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v30);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setWithSet:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setValue:forKey:", v37, v30);

          self = v91;
          v4 = v92;
        }

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
    }
    while (v27);
  }

  objc_msgSend(v4, "value");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = -[PDAggregateMeasurement values_mean](self, "values_mean");
    objc_msgSend(v4, "value");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleValue");
    v41 = v39->var2 + 1;
    v43 = v42 - v39->var0;
    v44 = v39->var0 + v43 / (double)(unint64_t)v41;
    v45 = v39->var1 + v43 * (v42 - v44);
    v39->var0 = v44;
    v39->var1 = v45;
    v39->var2 = v41;

    objc_msgSend(v4, "value");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "doubleValue");
    v48 = v47;
    -[PDAggregateMeasurement min](self, "min");
    v50 = v49;

    if (v48 < v50)
    {
      objc_msgSend(v4, "value");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "doubleValue");
      -[PDAggregateMeasurement setMin:](self, "setMin:");

    }
    objc_msgSend(v4, "value");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "doubleValue");
    v54 = v53;
    -[PDAggregateMeasurement max](self, "max");
    v56 = v55;

    if (v54 > v56)
    {
      objc_msgSend(v4, "value");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "doubleValue");
      -[PDAggregateMeasurement setMax:](self, "setMax:");

    }
    -[PDAggregateMeasurement setSamples:](self, "setSamples:", -[PDAggregateMeasurement samples](self, "samples") + 1);
  }
  else
  {
    objc_msgSend(v4, "sampleCount");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      objc_msgSend(v4, "mean");
      v59 = objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        v60 = (void *)v59;
        objc_msgSend(v4, "standardDeviation");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (v61)
        {
          v62 = -[PDAggregateMeasurement stats_mean](self, "stats_mean");
          objc_msgSend(v4, "sampleCount");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "unsignedIntegerValue");
          objc_msgSend(v4, "mean");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "doubleValue");
          v67 = v66;
          objc_msgSend(v4, "standardDeviation");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "doubleValue");
          v69 = vdupq_n_s64(1uLL);
          v69.i64[0] = v64;
          *(int64x2_t *)&v62->var2 = vaddq_s64(*(int64x2_t *)&v62->var2, v69);
          v69.i64[0] = *(_QWORD *)&v62->var1.var0;
          v71 = v70 * v70 * (double)(v64 - 1) - v62->var1.var1;
          v62->var1.var0 = *(double *)v69.i64 + v71;
          v62->var1.var1 = *(double *)v69.i64 + v71 - *(double *)v69.i64 - v71;
          v72 = v67 * (double)v64 - v62->var0.var1;
          v73 = v62->var0.var0 + v72;
          v74 = v73 - v62->var0.var0 - v72;
          v62->var0.var0 = v73;
          v62->var0.var1 = v74;

        }
      }
      objc_msgSend(v4, "minimum");
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (v75)
      {
        objc_msgSend(v4, "minimum");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "doubleValue");
        v78 = v77;
        -[PDAggregateMeasurement min](self, "min");
        v80 = v79;

        if (v78 < v80)
        {
          objc_msgSend(v4, "minimum");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "doubleValue");
          -[PDAggregateMeasurement setMin:](self, "setMin:");

        }
      }
      else
      {
        -[PDAggregateMeasurement setValidMin:](self, "setValidMin:", 0);
      }
      objc_msgSend(v4, "maximum");
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (v82)
      {
        objc_msgSend(v4, "maximum");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "doubleValue");
        v85 = v84;
        -[PDAggregateMeasurement max](self, "max");
        v87 = v86;

        if (v85 > v87)
        {
          objc_msgSend(v4, "maximum");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "doubleValue");
          -[PDAggregateMeasurement setMax:](self, "setMax:");

        }
      }
      else
      {
        -[PDAggregateMeasurement setValidMax:](self, "setValidMax:", 0);
      }
      objc_msgSend(v4, "sampleCount");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDAggregateMeasurement setSamples:](self, "setSamples:", -[PDAggregateMeasurement samples](self, "samples") + objc_msgSend(v89, "unsignedIntegerValue"));

    }
  }

}

- (PDMeasurement)measurement
{
  PDMeasurement *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  pooled_mean *v11;
  double v12;
  pooled_mean *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  running_mean *v24;
  unint64_t var2;
  unint64_t v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  pooled_mean *v31;
  void *v32;
  void *v33;
  pooled_mean *v34;
  double var0;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  PDMeasurement *v48;
  void *v50;
  running_mean *v51;
  unint64_t v52;

  v3 = objc_alloc_init(PDMeasurement);
  -[PDAggregateMeasurement container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement setContainer:](v3, "setContainer:", v4);

  -[PDAggregateMeasurement metric](self, "metric");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement setMetric:](v3, "setMetric:", v5);

  -[PDAggregateMeasurement unitString](self, "unitString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement setUnitString:](v3, "setUnitString:", v6);

  -[PDAggregateMeasurement variables](self, "variables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement setVariables:](v3, "setVariables:", v7);

  -[PDAggregateMeasurement labels](self, "labels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement setLabels:](v3, "setLabels:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PDAggregateMeasurement samples](self, "samples"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement setSampleCount:](v3, "setSampleCount:", v9);

  if ((_QWORD)-[PDAggregateMeasurement stats_mean](self, "stats_mean")[40]
    && (_QWORD)-[PDAggregateMeasurement values_mean](self, "values_mean")[16])
  {
    v10 = (unint64_t)-[PDAggregateMeasurement stats_mean](self, "stats_mean")[40];
    v11 = -[PDAggregateMeasurement stats_mean](self, "stats_mean");
    v12 = v11->var0.var0 / (double)v11->var2;
    v13 = -[PDAggregateMeasurement stats_mean](self, "stats_mean");
    v14 = sqrt(v13->var1.var0 / (double)(v13->var2 - v13->var3));
    v15 = v14 * v14 * (double)(v10 - 1);
    v16 = 0.0;
    v17 = v15 + 0.0;
    v18 = v15 + 0.0 - v15;
    v19 = v12 * (double)v10;
    v20 = v19 + 0.0;
    v21 = v19 + 0.0 - v19;
    v22 = (unint64_t)-[PDAggregateMeasurement values_mean](self, "values_mean")[16];
    v23 = *(double *)-[PDAggregateMeasurement values_mean](self, "values_mean");
    v24 = -[PDAggregateMeasurement values_mean](self, "values_mean");
    var2 = v24->var2;
    if (var2 >= 2)
      v16 = sqrt(v24->var1 / (double)(var2 - 1));
    v26 = v22 + v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v20 + v23 * (double)v22 - v21) / (double)(v22 + v10));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDMeasurement setMean:](v3, "setMean:", v27);

    v28 = (void *)MEMORY[0x1E0CB37E8];
    v29 = sqrt((v17 + v16 * v16 * (double)(v22 - 1) - v18) / (double)(v26 - 2));
    goto LABEL_10;
  }
  if ((_QWORD)-[PDAggregateMeasurement stats_mean](self, "stats_mean")[40])
  {
    v30 = (void *)MEMORY[0x1E0CB37E8];
    v31 = -[PDAggregateMeasurement stats_mean](self, "stats_mean");
    objc_msgSend(v30, "numberWithDouble:", v31->var0.var0 / (double)v31->var2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDMeasurement setMean:](v3, "setMean:", v32);

    v33 = (void *)MEMORY[0x1E0CB37E8];
    v34 = -[PDAggregateMeasurement stats_mean](self, "stats_mean");
    var0 = v34->var1.var0;
    v36 = v34->var2 - v34->var3;
  }
  else
  {
    if (!(_QWORD)-[PDAggregateMeasurement values_mean](self, "values_mean")[16])
    {
      v48 = 0;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)-[PDAggregateMeasurement values_mean](self, "values_mean"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDMeasurement setMean:](v3, "setMean:", v50);

    v33 = (void *)MEMORY[0x1E0CB37E8];
    v51 = -[PDAggregateMeasurement values_mean](self, "values_mean");
    v52 = v51->var2;
    v29 = 0.0;
    if (v52 < 2)
      goto LABEL_9;
    var0 = v51->var1;
    v36 = v52 - 1;
  }
  v29 = sqrt(var0 / (double)v36);
LABEL_9:
  v28 = v33;
LABEL_10:
  objc_msgSend(v28, "numberWithDouble:", v29);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement setStandardDeviation:](v3, "setStandardDeviation:", v37);

  -[PDMeasurement sampleCount](v3, "sampleCount");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    v40 = -[PDAggregateMeasurement validMin](self, "validMin");

    if (v40)
    {
      v41 = (void *)MEMORY[0x1E0CB37E8];
      -[PDAggregateMeasurement min](self, "min");
      objc_msgSend(v41, "numberWithDouble:");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDMeasurement setMinimum:](v3, "setMinimum:", v42);

    }
  }
  -[PDMeasurement sampleCount](v3, "sampleCount");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    v45 = -[PDAggregateMeasurement validMax](self, "validMax");

    if (v45)
    {
      v46 = (void *)MEMORY[0x1E0CB37E8];
      -[PDAggregateMeasurement max](self, "max");
      objc_msgSend(v46, "numberWithDouble:");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDMeasurement setMaximum:](v3, "setMaximum:", v47);

    }
  }
  v48 = v3;
LABEL_17:

  return v48;
}

- (NSMutableDictionary)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (PDContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (NSString)metric
{
  return self->_metric;
}

- (void)setMetric:(id)a3
{
  objc_storeStrong((id *)&self->_metric, a3);
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void)setUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_unitString, a3);
}

- (NSMutableDictionary)variables
{
  return self->_variables;
}

- (void)setVariables:(id)a3
{
  objc_storeStrong((id *)&self->_variables, a3);
}

- (running_mean)values_mean
{
  return self->_values_mean;
}

- (void)setValues_mean:(running_mean *)a3
{
  self->_values_mean = a3;
}

- (pooled_mean)stats_mean
{
  return self->_stats_mean;
}

- (void)setStats_mean:(pooled_mean *)a3
{
  self->_stats_mean = a3;
}

- (BOOL)validMin
{
  return self->_validMin;
}

- (void)setValidMin:(BOOL)a3
{
  self->_validMin = a3;
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (BOOL)validMax
{
  return self->_validMax;
}

- (void)setValidMax:(BOOL)a3
{
  self->_validMax = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (unint64_t)samples
{
  return self->_samples;
}

- (void)setSamples:(unint64_t)a3
{
  self->_samples = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
