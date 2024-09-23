@implementation CRFormTextBasedDetector

- (CRFormTextBasedDetector)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  CRFormTextBasedDetector *v7;
  CRFormTextBasedDetector *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRFormTextBasedDetector;
  v7 = -[CRFormTextBasedDetector init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_configuration, a3);

  return v8;
}

+ (BOOL)_isTextRegion:(id)a3 aboveField:(id)a4 withTolerance:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  BOOL v27;
  BOOL v28;

  v7 = a4;
  objc_msgSend(a3, "boundingQuad");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "boundingQuad");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v11 = v10;
  objc_msgSend(v9, "topRight");
  v13 = v12;
  objc_msgSend(v8, "bottomRight");
  v15 = v14;
  objc_msgSend(v8, "size");
  v17 = v16;
  objc_msgSend(v8, "topLeft");
  v19 = v18;
  objc_msgSend(v9, "topLeft");
  v21 = v20;
  objc_msgSend(v8, "topRight");
  v23 = v22;
  objc_msgSend(v9, "topRight");
  v24 = vabdd_f64(v19, v21) < v17 / 5.0;
  v25 = v13 - v15;
  if (vabdd_f64(v23, v26) < v17 / 5.0)
    v24 = 1;
  v27 = v25 < v11 * a5;
  if (v25 <= v11 * -0.5)
    v27 = 0;
  v28 = v27 && v24;

  return v28;
}

+ (BOOL)_isTextRegion:(id)a3 onLeftOfField:(id)a4 withTolerance:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  char v24;
  double v25;
  double v26;
  double v27;
  double v28;
  char v29;
  BOOL v30;

  v7 = a4;
  objc_msgSend(a3, "boundingQuad");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "boundingQuad");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v11 = v10;
  objc_msgSend(v9, "topLeft");
  v13 = v12;
  objc_msgSend(v8, "topRight");
  v15 = v14;
  objc_msgSend(v8, "topRight");
  v17 = v16;
  objc_msgSend(v9, "topRight");
  v19 = v18;
  objc_msgSend(v8, "bottomRight");
  v21 = v20;
  objc_msgSend(v9, "bottomRight");
  v22 = vabdd_f64(v17, v19) < v11 * 0.5;
  v24 = vabdd_f64(v21, v23) < v11 * 0.5 || v22;
  objc_msgSend(v9, "topRight");
  v26 = v25;
  objc_msgSend(v8, "topRight");
  v27 = v13 - v15;
  if (v26 > v28)
    v29 = v24;
  else
    v29 = 0;
  if (v27 >= v11 * a5)
    v29 = 0;
  if (v27 > -(a5 * v11))
    v30 = v29;
  else
    v30 = 0;

  return v30;
}

+ (id)bestFieldCandidate:(id)a3 secondCandidate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
  {
    v15 = v5;
LABEL_9:
    v14 = v15;
    goto LABEL_10;
  }
  if (!v5)
  {
    v15 = v6;
    goto LABEL_9;
  }
  objc_msgSend(v5, "boundingQuad");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundingBox");
  v10 = v9;
  objc_msgSend(v7, "boundingQuad");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "boundingBox");
  if (v10 <= v12)
    v13 = v7;
  else
    v13 = v5;
  v14 = v13;

LABEL_10:
  return v14;
}

- (id)detectFormFieldsInImage:(id)a3 document:(id)a4 candidateFields:(id)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL4 v15;
  unint64_t j;
  void *v17;
  unint64_t k;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  BOOL v29;
  _BOOL4 v30;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v33 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "contentsWithTypes:", 8);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v13, "text");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = +[CRFormUtilities stringEndsWithColon:](CRFormUtilities, "stringEndsWithColon:", v14);

        if (v15)
          objc_msgSend(v8, "addObject:", v13);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v10);
  }

  for (j = 0; j < objc_msgSend(v8, "count"); ++j)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", j);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    for (k = 0; k < objc_msgSend(v7, "count"); ++k)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", k);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "fieldType") == 1)
      {
        objc_msgSend(v17, "boundingQuad");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "boundingQuad");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "boundingBoxIOUWithQuad:", v21);
        v23 = v22;

        if (v23 <= 0.2)
        {
          objc_msgSend(v19, "boundingQuad");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "size");
          v26 = v25;
          objc_msgSend(v17, "boundingQuad");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "size");
          v29 = v26 < v28 * 3.0;

          if (!v29)
          {
            v30 = +[CRFormTextBasedDetector _isTextRegion:onLeftOfField:withTolerance:](CRFormTextBasedDetector, "_isTextRegion:onLeftOfField:withTolerance:", v17, v19, 1.0);
            if ((v30 | +[CRFormTextBasedDetector _isTextRegion:aboveField:withTolerance:](CRFormTextBasedDetector, "_isTextRegion:aboveField:withTolerance:", v17, v19, 2.0)) == 1)
            {
              objc_msgSend(v19, "setFieldType:", 1);
              objc_msgSend(v19, "setFieldSource:", 3);
              objc_msgSend(v34, "addObject:", v19);
            }
          }
        }
      }

    }
  }

  return v34;
}

- (CRFormAnalyzerConfiguration)configuration
{
  return (CRFormAnalyzerConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
