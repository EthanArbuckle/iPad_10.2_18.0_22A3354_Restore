@implementation PTCinematographyFocusBlend

- (id)initFocusedOnDetection:(id)a3
{
  id v4;
  PTCinematographyFocusBlend *v5;
  PTCinematographyFocusBlend *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PTCinematographyFocusBlend;
  v5 = -[PTCinematographyFocusBlend init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PTCinematographyFocusBlend _setFocusOnDetection:](v5, "_setFocusOnDetection:", v4);

  return v6;
}

- (id)initFocusedBetweenDetection:(id)a3 detection:(id)a4 coefficient:(float)a5
{
  id v8;
  id v9;
  PTCinematographyFocusBlend *v10;
  double v11;
  PTCinematographyFocusBlend *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PTCinematographyFocusBlend;
  v10 = -[PTCinematographyFocusBlend init](&v14, sel_init);
  v12 = v10;
  if (v10)
  {
    *(float *)&v11 = a5;
    -[PTCinematographyFocusBlend _setFocusBetweenDetection:detection:coefficient:](v10, "_setFocusBetweenDetection:detection:coefficient:", v8, v9, v11);
  }

  return v12;
}

- (PTCinematographyFocusBlend)initWithPrimaryDetection:(id)a3 secondaryDetection:(id)a4 primaryCoefficient:(float)a5
{
  id v8;
  id v9;
  PTCinematographyFocusBlend *v10;
  double v11;
  PTCinematographyFocusBlend *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PTCinematographyFocusBlend;
  v10 = -[PTCinematographyFocusBlend init](&v14, sel_init);
  v12 = v10;
  if (v10)
  {
    *(float *)&v11 = a5;
    -[PTCinematographyFocusBlend _setFocusOnPrimaryDetection:secondaryDetection:primaryCoefficient:](v10, "_setFocusOnPrimaryDetection:secondaryDetection:primaryCoefficient:", v8, v9, v11);
  }

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PTCinematographyFocusBlend *v4;
  uint64_t v5;
  PTCinematographyDetection *primaryFocusDetection;
  uint64_t v7;
  PTCinematographyDetection *secondaryFocusDetection;
  float v9;
  float v10;

  v4 = objc_alloc_init(PTCinematographyFocusBlend);
  if (v4)
  {
    -[PTCinematographyFocusBlend primaryFocusDetection](self, "primaryFocusDetection");
    v5 = objc_claimAutoreleasedReturnValue();
    primaryFocusDetection = v4->_primaryFocusDetection;
    v4->_primaryFocusDetection = (PTCinematographyDetection *)v5;

    -[PTCinematographyFocusBlend secondaryFocusDetection](self, "secondaryFocusDetection");
    v7 = objc_claimAutoreleasedReturnValue();
    secondaryFocusDetection = v4->_secondaryFocusDetection;
    v4->_secondaryFocusDetection = (PTCinematographyDetection *)v7;

    -[PTCinematographyFocusBlend primaryFocusCoefficient](self, "primaryFocusCoefficient");
    v4->_primaryFocusCoefficient = v9;
    -[PTCinematographyFocusBlend secondaryFocusCoefficient](self, "secondaryFocusCoefficient");
    v4->_secondaryFocusCoefficient = v10;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  PTCinematographyFocusBlend *v7;
  PTCinematographyFocusBlend *v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  char v14;
  float v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;

  v7 = (PTCinematographyFocusBlend *)a3;
  if (v7 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[PTCinematographyFocusBlend primaryFocusCoefficient](self, "primaryFocusCoefficient");
      v10 = v9;
      -[PTCinematographyFocusBlend primaryFocusCoefficient](v8, "primaryFocusCoefficient");
      if (v10 != v11)
      {
        v14 = 0;
LABEL_24:

        goto LABEL_25;
      }
      -[PTCinematographyFocusBlend primaryFocusDetection](self, "primaryFocusDetection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (-[PTCinematographyFocusBlend primaryFocusDetection](v8, "primaryFocusDetection"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[PTCinematographyFocusBlend primaryFocusDetection](self, "primaryFocusDetection");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTCinematographyFocusBlend primaryFocusDetection](v8, "primaryFocusDetection");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
        {

          v14 = 0;
          goto LABEL_21;
        }
        LODWORD(v13) = 1;
      }
      else
      {
        LODWORD(v13) = 0;
      }
      -[PTCinematographyFocusBlend secondaryFocusCoefficient](self, "secondaryFocusCoefficient");
      v16 = v15;
      -[PTCinematographyFocusBlend secondaryFocusCoefficient](v8, "secondaryFocusCoefficient");
      if (v16 == v17)
      {
        -[PTCinematographyFocusBlend secondaryFocusDetection](self, "secondaryFocusDetection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18
          || (-[PTCinematographyFocusBlend secondaryFocusDetection](v8, "secondaryFocusDetection"),
              (v23 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v25 = (char)v13;
          v13 = v3;
          -[PTCinematographyFocusBlend secondaryFocusDetection](self, "secondaryFocusDetection", v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PTCinematographyFocusBlend secondaryFocusDetection](v8, "secondaryFocusDetection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v19, "isEqual:", v20);

          if (v18)
          {

            v3 = v13;
            if ((v25 & 1) == 0)
              goto LABEL_21;
            goto LABEL_20;
          }
          v3 = v13;
          LOBYTE(v13) = v25;
          v22 = v24;
        }
        else
        {
          v22 = 0;
          v14 = 1;
        }

        if ((v13 & 1) == 0)
          goto LABEL_21;
LABEL_20:

        goto LABEL_21;
      }
      v14 = 0;
      if ((_DWORD)v13)
        goto LABEL_20;
LABEL_21:
      if (!v12)

      goto LABEL_24;
    }
    v14 = 0;
  }
LABEL_25:

  return v14;
}

- (unint64_t)hash
{
  float v3;
  float v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  unint64_t v10;

  -[PTCinematographyFocusBlend primaryFocusCoefficient](self, "primaryFocusCoefficient");
  v4 = v3;
  -[PTCinematographyFocusBlend primaryFocusDetection](self, "primaryFocusDetection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (float)(unint64_t)objc_msgSend(v5, "hash");
  -[PTCinematographyFocusBlend secondaryFocusCoefficient](self, "secondaryFocusCoefficient");
  v8 = v7;
  -[PTCinematographyFocusBlend secondaryFocusDetection](self, "secondaryFocusDetection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (unint64_t)(float)((float)((float)(v8 * (float)(unint64_t)objc_msgSend(v9, "hash"))
                                        + (float)(v4 * v6))
                                * 1000.0);

  return v10;
}

- (id)description
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PTCinematographyFocusBlend primaryFocusDetection](self, "primaryFocusDetection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFocusBlend primaryFocusCoefficient](self, "primaryFocusCoefficient");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyFocusBlend secondaryFocusDetection](self, "secondaryFocusDetection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "focusIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFocusBlend secondaryFocusCoefficient](self, "secondaryFocusCoefficient");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("FocusBlend(%@: %@; %@: %@)"), v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_initWithDetections:(id)a3 coefficients:(id)a4
{
  id v6;
  id v7;
  PTCinematographyFocusBlend *v8;
  uint64_t v9;
  float *p_primaryFocusCoefficient;
  float *p_secondaryFocusCoefficient;
  void *v12;
  void *v13;
  float v14;
  float v15;
  float *v16;
  id *p_secondaryFocusDetection;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PTCinematographyFocusBlend;
  v8 = -[PTCinematographyFocusBlend init](&v19, sel_init);
  if (v8 && objc_msgSend(v6, "count"))
  {
    v9 = 0;
    p_primaryFocusCoefficient = &v8->_primaryFocusCoefficient;
    p_secondaryFocusCoefficient = &v8->_secondaryFocusCoefficient;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;

      if (v15 > *p_primaryFocusCoefficient)
        break;
      v16 = &v8->_secondaryFocusCoefficient;
      p_secondaryFocusDetection = (id *)&v8->_secondaryFocusDetection;
      if (v15 > *p_secondaryFocusCoefficient)
        goto LABEL_7;
LABEL_8:

      if (++v9 >= (unint64_t)objc_msgSend(v6, "count"))
        goto LABEL_9;
    }
    *p_secondaryFocusCoefficient = *p_primaryFocusCoefficient;
    objc_storeStrong((id *)&v8->_secondaryFocusDetection, v8->_primaryFocusDetection);
    v16 = &v8->_primaryFocusCoefficient;
    p_secondaryFocusDetection = (id *)&v8->_primaryFocusDetection;
LABEL_7:
    *v16 = v15;
    objc_storeStrong(p_secondaryFocusDetection, v12);
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (void)_setFocusOnDetection:(id)a3
{
  id v5;
  PTCinematographyDetection *secondaryFocusDetection;

  objc_storeStrong((id *)&self->_primaryFocusDetection, a3);
  v5 = a3;
  self->_primaryFocusCoefficient = 1.0;
  secondaryFocusDetection = self->_secondaryFocusDetection;
  self->_secondaryFocusDetection = 0;

  self->_secondaryFocusCoefficient = 0.0;
}

- (void)_setFocusBetweenDetection:(id)a3 detection:(id)a4 coefficient:(float)a5
{
  float v9;
  id v10;
  PTCinematographyDetection **p_primaryFocusDetection;
  float v12;
  id v13;
  id v14;
  void *v15;
  float v16;
  void *v17;

  v9 = 1.0 - a5;
  if ((float)(1.0 - a5) > a5)
    v10 = a4;
  else
    v10 = a3;
  p_primaryFocusDetection = &self->_primaryFocusDetection;
  if ((float)(1.0 - a5) > a5)
    v12 = a5;
  else
    v12 = 1.0 - a5;
  objc_storeStrong((id *)p_primaryFocusDetection, v10);
  v13 = a4;
  v14 = a3;
  v15 = v14;
  if (v9 > a5)
    v16 = 1.0 - a5;
  else
    v16 = a5;
  self->_primaryFocusCoefficient = v16;
  if (v9 > a5)
    v17 = v14;
  else
    v17 = v13;
  objc_storeStrong((id *)&self->_secondaryFocusDetection, v17);

  self->_secondaryFocusCoefficient = v12;
}

- (void)_setFocusOnPrimaryDetection:(id)a3 secondaryDetection:(id)a4 primaryCoefficient:(float)a5
{
  id v9;
  id v10;

  v10 = a3;
  v9 = a4;
  objc_storeStrong((id *)&self->_primaryFocusDetection, a3);
  self->_primaryFocusCoefficient = a5;
  if (a5 < 1.0)
  {
    objc_storeStrong((id *)&self->_secondaryFocusDetection, a4);
    self->_secondaryFocusCoefficient = 1.0 - a5;
  }

}

- (id)_initWithDetections:(id)a3 cinematographyDictionary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  int v29;
  int v30;
  double v31;
  PTCinematographyFocusBlend *v32;
  id v34;
  id v36;
  id obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v36 = a4;
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("primary"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    v9 = 0;
    goto LABEL_17;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (!v7)
  {
    v9 = 0;
    goto LABEL_16;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v44 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_msgSend(v12, "trackNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqual:", v38))
      {

      }
      else
      {
        objc_msgSend(v12, "focusIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v38);

        if (!v15)
          continue;
      }
      v16 = v12;

      v9 = v16;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  }
  while (v8);
LABEL_16:

LABEL_17:
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("secondary"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v34 = v5;
    obj = v5;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (!v18)
    {
      v20 = 0;
      goto LABEL_32;
    }
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v40;
    while (1)
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v23, "trackNumber");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "isEqual:", v17))
        {

        }
        else
        {
          objc_msgSend(v23, "focusIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqual:", v17);

          if (!v26)
            continue;
        }
        v27 = v23;

        v20 = v27;
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (!v19)
      {
LABEL_32:

        v5 = v34;
        goto LABEL_33;
      }
    }
  }
  v20 = 0;
LABEL_33:
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("coefficient"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");
  v30 = v29;

  LODWORD(v31) = v30;
  v32 = -[PTCinematographyFocusBlend initWithPrimaryDetection:secondaryDetection:primaryCoefficient:](self, "initWithPrimaryDetection:secondaryDetection:primaryCoefficient:", v9, v20, v31);

  return v32;
}

- (id)_asCinematographyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[PTCinematographyDetection trackNumber](self->_primaryFocusDetection, "trackNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("primary"));
  }
  else
  {
    -[PTCinematographyDetection focusIdentifier](self->_primaryFocusDetection, "focusIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("primary"));

  }
  -[PTCinematographyDetection trackNumber](self->_secondaryFocusDetection, "trackNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("secondary"));
  }
  else
  {
    -[PTCinematographyDetection focusIdentifier](self->_secondaryFocusDetection, "focusIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("secondary"));

  }
  *(float *)&v8 = self->_primaryFocusCoefficient;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("coefficient"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)_initWithDetections:(id)a3 coefficientsDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "focusIdentifier", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (void *)v15;
        else
          v17 = &unk_1E8252580;
        objc_msgSend(v8, "addObject:", v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v18 = -[PTCinematographyFocusBlend _initWithDetections:coefficients:](self, "_initWithDetections:coefficients:", v9, v8);
  return v18;
}

- (id)_asCoefficientsDictionary
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  -[PTCinematographyDetection focusIdentifier](self->_primaryFocusDetection, "focusIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    *(float *)&v5 = self->_primaryFocusCoefficient;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyDetection focusIdentifier](self->_primaryFocusDetection, "focusIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  }
  -[PTCinematographyDetection focusIdentifier](self->_secondaryFocusDetection, "focusIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(float *)&v9 = self->_secondaryFocusCoefficient;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyDetection focusIdentifier](self->_secondaryFocusDetection, "focusIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (PTCinematographyDetection)primaryFocusDetection
{
  return self->_primaryFocusDetection;
}

- (PTCinematographyDetection)secondaryFocusDetection
{
  return self->_secondaryFocusDetection;
}

- (float)primaryFocusCoefficient
{
  return self->_primaryFocusCoefficient;
}

- (float)secondaryFocusCoefficient
{
  return self->_secondaryFocusCoefficient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFocusDetection, 0);
  objc_storeStrong((id *)&self->_primaryFocusDetection, 0);
}

@end
