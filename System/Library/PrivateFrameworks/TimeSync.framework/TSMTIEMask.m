@implementation TSMTIEMask

+ (id)UDPHardwareMask
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  TSMTIEMaskElement *v6;
  TSMTIEMaskElement *v7;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("UDP End-to-End Ports over peer-to-peer wireless with Hardware Timestamping"), &stru_1E694C148, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 1.0, 0.000206, 0.0, 0.000006);
  objc_msgSend(v5, "addObject:", v6);
  v7 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.0, 0.000212, 0.000006, INFINITY);

  objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(v2, "setElements:", v5);

  return v2;
}

+ (id)UDPSoftwareMask
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  TSMTIEMaskElement *v6;
  TSMTIEMaskElement *v7;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("UDP End-to-End Ports over wired or wireless infrastructure"), &stru_1E694C148, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 1.0, 0.000206, 0.0, 0.006);
  objc_msgSend(v5, "addObject:", v6);
  v7 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.0, 0.006206, 0.006, INFINITY);

  objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(v2, "setElements:", v5);

  return v2;
}

+ (id)gPTPMask1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  TSMTIEMaskElement *v6;
  TSMTIEMaskElement *v7;
  TSMTIEMaskElement *v8;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("802.1AS MTIE Mask 1"), &stru_1E694C148, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.0000069548, 0.0, 0.0, 0.0637);
  objc_msgSend(v5, "addObject:", v6);
  v7 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.0, 0.000000443, 0.0637, 0.3183);

  objc_msgSend(v5, "addObject:", v7);
  v8 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.00005, 0.0, 0.3183, INFINITY);

  objc_msgSend(v5, "addObject:", v8);
  objc_msgSend(v2, "setElements:", v5);

  return v2;
}

+ (id)gPTPMask2
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  TSMTIEMaskElement *v6;
  TSMTIEMaskElement *v7;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("802.1AS MTIE Mask 2"), &stru_1E694C148, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.0, 0.000000407, 0.0, 0.4069);
  objc_msgSend(v5, "addObject:", v6);
  v7 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.000001, 0.0, 0.4069, INFINITY);

  objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(v2, "setElements:", v5);

  return v2;
}

+ (id)gPTPMask3
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  TSMTIEMaskElement *v6;
  TSMTIEMaskElement *v7;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("802.1AS MTIE Mask 3"), &stru_1E694C148, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.00000005, 0.0, 0.0, 4.0);
  objc_msgSend(v5, "addObject:", v6);
  v7 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.0, 0.0000002, 4.0, INFINITY);

  objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(v2, "setElements:", v5);

  return v2;
}

+ (id)gPTP7Hop
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  TSMTIEMaskElement *v6;
  TSMTIEMaskElement *v7;
  TSMTIEMaskElement *v8;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("gPTP MTIE Mask for 7 Hops"), &stru_1E694C148, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.0, 0.000000407, 0.0, 0.4069);
  objc_msgSend(v5, "addObject:", v6);
  v7 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.000001, 0.0, 0.4069, 1.0);

  objc_msgSend(v5, "addObject:", v7);
  v8 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.0, 0.0000001, 1.0, INFINITY);

  objc_msgSend(v5, "addObject:", v8);
  objc_msgSend(v2, "setElements:", v5);

  return v2;
}

+ (id)gPTP1Hop
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  TSMTIEMaskElement *v6;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("gPTP MTIE Mask for 7 Hops"), &stru_1E694C148, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:]([TSMTIEMaskElement alloc], "initWithCoefficient:offset:lowerLimit:upperLimit:", 0.0, 0.00000016, 0.0, INFINITY);
  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(v2, "setElements:", v5);

  return v2;
}

- (TSMTIEMask)initWithDictionary:(id)a3
{
  id v4;
  TSMTIEMask *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  TSMTIEMaskElement *v15;
  uint64_t v16;
  NSArray *elements;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TSMTIEMask;
  v5 = -[TSMTIEMask init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("equation"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = -[TSMTIEMaskElement initWithDictionary:]([TSMTIEMaskElement alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14));
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v9);
    elements = v5->_elements;
    v5->_elements = (NSArray *)v16;

    if (!-[NSArray count](v5->_elements, "count"))
    {

      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)mtieConformsToMask:(id)a3 withErrors:(id *)a4
{
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  TSMTIEMaskError *v34;
  id *v36;
  id v37;
  id obj;
  uint64_t v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    if (a4)
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v6 = 0;
    v36 = a4;
    v37 = v5;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v8)
    {
      v9 = v8;
      v39 = *(_QWORD *)v46;
      v10 = 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v46 != v39)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          -[TSMTIEMask elements](self, "elements");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v14)
          {
            v15 = v14;
            v16 = v6;
            v17 = *(_QWORD *)v42;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v42 != v17)
                  objc_enumerationMutation(v13);
                v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                objc_msgSend(v12, "observationInterval");
                v21 = v20;
                objc_msgSend(v19, "lowerLimit");
                if (v21 >= v22)
                {
                  objc_msgSend(v12, "observationInterval");
                  v24 = v23;
                  objc_msgSend(v19, "upperLimit");
                  if (v24 < v25)
                  {
                    objc_msgSend(v19, "a");
                    v27 = v26;
                    objc_msgSend(v12, "observationInterval");
                    v29 = v28 / 1000000000.0;
                    objc_msgSend(v19, "b");
                    v31 = (v30 + v27 * v29) * 1000000000.0;
                    objc_msgSend(v12, "mtie");
                    if (v32 > v31)
                      v10 = 0;
                    v6 = v16;
                    if (v32 > v31 && v16 != 0)
                    {
                      v34 = objc_alloc_init(TSMTIEMaskError);
                      objc_msgSend(v12, "observationInterval");
                      -[TSMTIEMaskError setObservationInterval:](v34, "setObservationInterval:");
                      objc_msgSend(v12, "mtie");
                      -[TSMTIEMaskError setMtie:](v34, "setMtie:");
                      -[TSMTIEMaskError setMask:](v34, "setMask:", v31);
                      objc_msgSend(v16, "addObject:", v34);

                      v10 = 0;
                    }
                    goto LABEL_28;
                  }
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              if (v15)
                continue;
              break;
            }
            v6 = v16;
          }
LABEL_28:

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 1;
    }

    if (v36)
      *v36 = objc_retainAutorelease(v6);

    v7 = v10 & 1;
    v5 = v37;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)mtieMaskFromStart:(double)a3 toEnd:(double)a4 withStep:(double)a5
{
  void *i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  TSMTIEValue *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3 <= a4; a3 = a3 + a5)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[TSMTIEMask elements](self, "elements", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      while (2)
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          objc_msgSend(v15, "lowerLimit");
          if (a3 >= v16)
          {
            objc_msgSend(v15, "upperLimit");
            if (a3 < v17)
            {
              objc_msgSend(v15, "a");
              v20 = v19;
              objc_msgSend(v15, "b");
              v18 = (v21 + v20 * (a3 / 1000000000.0)) * 1000000000.0;
              goto LABEL_13;
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v12)
          continue;
        break;
      }
    }
    v18 = NAN;
LABEL_13:

    v22 = -[TSMTIEValue initWithObservationInterval:andMTIE:]([TSMTIEValue alloc], "initWithObservationInterval:andMTIE:", a3, v18);
    objc_msgSend(i, "addObject:", v22);

  }
  return i;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
