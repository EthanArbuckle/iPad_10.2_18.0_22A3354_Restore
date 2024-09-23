@implementation CRLayoutParagraph

- (unint64_t)layoutDirection
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[CRLayoutParagraph subregions](self, "subregions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[CRLayoutParagraph subregions](self, "subregions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "layoutDirection");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)textRegionType
{
  return 3;
}

- (CRLayoutParagraph)initWithLines:(id)a3
{
  id v4;
  CRLayoutParagraph *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  __double2 v18;
  __double2 v19;
  __CFString *v20;
  void *v21;
  float v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  double v31;
  void *v32;
  uint64_t v33;
  CRLayoutParagraph *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CRLayoutParagraph;
  v5 = -[CRLayoutParagraph init](&v45, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    -[CRLayoutParagraph setSubregions:](v5, "setSubregions:", v6);

    v7 = (void *)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v9)
    {
      v10 = v9;
      v35 = v5;
      v36 = v4;
      v11 = 0;
      v12 = *(_QWORD *)v42;
      v13 = 0.0;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v12)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v15, "boundingQuad");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "baselineAngle");
          v18 = __sincos_stret(v17);
          v19 = __sincos_stret(v13);
          v13 = atan2(v19.__sinval * (double)(v11 + (int)i) + v18.__sinval, v19.__cosval * (double)(v11 + (int)i) + v18.__cosval);

          v20 = &stru_1E98DC948;
          if (v11 + i != objc_msgSend(v8, "count") - 1)
          {
            +[CRLineWrapper joiningDelimiterForLine:](CRLineWrapper, "joiningDelimiterForLine:", v15);
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v15, "text");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR("%@%@"), v21, v20);

        }
        v11 += v10;
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v10);
      v22 = v13;
      v5 = v35;
      v4 = v36;
    }
    else
    {
      v22 = 0.0;
    }
    v23 = v4;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v24 = v8;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "boundingQuad");
          v30 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v30;
          if (v27)
          {
            *(float *)&v31 = v22;
            objc_msgSend(v27, "unionWithNormalizedQuad:baselineAngle:", v30, v31);
            v33 = objc_claimAutoreleasedReturnValue();

            v27 = (void *)v33;
          }
          else
          {
            v27 = (void *)v30;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v26);
    }
    else
    {
      v27 = 0;
    }

    -[CRLayoutParagraph setText:](v5, "setText:", v7);
    -[CRLayoutParagraph setBoundingQuad:](v5, "setBoundingQuad:", v27);

    v4 = v23;
  }

  return v5;
}

- (BOOL)canWrapToNextGroup
{
  return self->_canWrapToNextGroup;
}

- (void)setCanWrapToNextGroup:(BOOL)a3
{
  self->_canWrapToNextGroup = a3;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBoundingQuad:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)subregions
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSubregions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_subregions, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

@end
