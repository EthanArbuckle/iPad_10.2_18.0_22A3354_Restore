@implementation CRImageReaderOutput

- (CRImageReaderOutput)initWithType:(id)a3 outputRegion:(id)a4 isTitle:(BOOL)a5
{
  return -[CRImageReaderOutput initWithType:outputRegion:isTitle:withCandidates:](self, "initWithType:outputRegion:isTitle:withCandidates:", a3, a4, a5, 1);
}

- (CRImageReaderOutput)initWithType:(id)a3 outputRegion:(id)a4 isTitle:(BOOL)a5 withCandidates:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v11;
  id v12;
  CRImageReaderOutput *v13;
  CRImageReaderOutput *v14;
  uint64_t v15;
  NSString *stringValue;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  double v35;
  void *v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  CRImageReaderOutput *v46;
  uint64_t v47;
  NSArray *components;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  CRImageReaderOutput *v57;
  uint64_t v58;
  NSArray *candidates;
  _BOOL4 v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v6 = a6;
  v7 = a5;
  v74 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v71.receiver = self;
  v71.super_class = (Class)CRImageReaderOutput;
  v13 = -[CRImageReaderOutput init](&v71, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_type, a3);
    if (v12)
    {
      objc_msgSend(v12, "text");
      v15 = objc_claimAutoreleasedReturnValue();
      stringValue = v14->_stringValue;
      v14->_stringValue = (NSString *)v15;

      v14->_confidence = objc_msgSend(v12, "confidence");
      objc_msgSend(v12, "boundingQuad");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "boundingBox");
      v14->_boundingBox.origin.x = v18;
      v14->_boundingBox.origin.y = v19;
      v14->_boundingBox.size.width = v20;
      v14->_boundingBox.size.height = v21;

      objc_msgSend(v12, "boundingQuad");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "topLeft");
      v14->_topLeft.x = v23;
      v14->_topLeft.y = v24;

      objc_msgSend(v12, "boundingQuad");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "topRight");
      v14->_topRight.x = v26;
      v14->_topRight.y = v27;

      objc_msgSend(v12, "boundingQuad");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bottomRight");
      v14->_bottomRight.x = v29;
      v14->_bottomRight.y = v30;

      objc_msgSend(v12, "boundingQuad");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bottomLeft");
      v14->_bottomLeft.x = v32;
      v14->_bottomLeft.y = v33;

      objc_msgSend(v12, "boundingQuad");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "baselineAngle");
      *(float *)&v35 = v35;
      v14->_baselineAngle = *(float *)&v35;

      objc_msgSend(v12, "boundingQuad");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "normalizationSize");
      v14->_imageSize.width = v37;
      v14->_imageSize.height = v38;

      v14->_isTitle = v7;
      objc_msgSend(v12, "contentsWithTypes:", 48);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v12;
      if (objc_msgSend(v39, "count"))
      {
        v61 = v6;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v39, "count"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v41 = v39;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v43; ++i)
            {
              if (*(_QWORD *)v68 != v44)
                objc_enumerationMutation(v41);
              v46 = -[CRImageReaderOutput initWithType:outputRegion:isTitle:]([CRImageReaderOutput alloc], "initWithType:outputRegion:isTitle:", v11, *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i), 0);
              objc_msgSend(v40, "addObject:", v46);

            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
          }
          while (v43);
        }

        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v40);
        v47 = objc_claimAutoreleasedReturnValue();
        components = v14->_components;
        v14->_components = (NSArray *)v47;

        v12 = v62;
        v6 = v61;
      }
      if (v6)
      {
        v49 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v12, "candidates");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "arrayWithCapacity:", objc_msgSend(v50, "count"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        objc_msgSend(v12, "candidates");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
        if (v53)
        {
          v54 = v53;
          v55 = *(_QWORD *)v64;
          do
          {
            for (j = 0; j != v54; ++j)
            {
              if (*(_QWORD *)v64 != v55)
                objc_enumerationMutation(v52);
              v57 = -[CRImageReaderOutput initWithType:outputRegion:isTitle:withCandidates:]([CRImageReaderOutput alloc], "initWithType:outputRegion:isTitle:withCandidates:", v11, *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j), v7, 0);
              objc_msgSend(v51, "addObject:", v57);

            }
            v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
          }
          while (v54);
        }

        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v51);
        v58 = objc_claimAutoreleasedReturnValue();
        candidates = v14->_candidates;
        v14->_candidates = (NSArray *)v58;

        v12 = v62;
      }

    }
  }

  return v14;
}

+ (id)outputWithType:(id)a3 outputRegion:(id)a4 isTitle:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  CRImageReaderOutput *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[CRImageReaderOutput initWithType:outputRegion:isTitle:]([CRImageReaderOutput alloc], "initWithType:outputRegion:isTitle:", v8, v7, v5);

  return v9;
}

+ (int)confidenceLevelForConfidenceScore:(double)a3 confidenceThresholds:(id)a4
{
  id v5;
  float v6;
  double v7;
  float v8;
  float v9;
  int v10;

  v5 = a4;
  objc_msgSend(v5, "mediumConfidenceThreshold");
  v7 = v6;
  objc_msgSend(v5, "highConfidenceThreshold");
  v9 = v8;

  if (v9 > a3)
    v10 = 1;
  else
    v10 = 2;
  if (v7 <= a3)
    return v10;
  else
    return 0;
}

- (id)boundingQuad
{
  CRNormalizedQuad *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  uint64_t v20;
  uint64_t v21;

  v3 = [CRNormalizedQuad alloc];
  -[CRImageReaderOutput topLeft](self, "topLeft");
  v5 = v4;
  v7 = v6;
  -[CRImageReaderOutput topRight](self, "topRight");
  v9 = v8;
  v11 = v10;
  -[CRImageReaderOutput bottomRight](self, "bottomRight");
  v13 = v12;
  v15 = v14;
  -[CRImageReaderOutput bottomLeft](self, "bottomLeft");
  v17 = v16;
  v19 = v18;
  -[CRImageReaderOutput imageSize](self, "imageSize");
  return -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v3, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v5, v7, v9, v11, v13, v15, v17, v19, v20, v21);
}

- (id)cornersForCharacterRange:(_NSRange)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  -[CRImageReaderOutput quadForCharacterRange:error:](self, "quadForCharacterRange:error:", a3.location, a3.length, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v4, "topLeft");
    objc_msgSend(v6, "valueWithPoint:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    v8 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v5, "topRight");
    objc_msgSend(v8, "valueWithPoint:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v9;
    v10 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v5, "bottomRight");
    objc_msgSend(v10, "valueWithPoint:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v11;
    v12 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v5, "bottomLeft");
    objc_msgSend(v12, "valueWithPoint:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)quadForCharacterRange:(_NSRange)a3 error:(id *)a4
{
  NSUInteger location;
  NSUInteger v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSUInteger v13;
  unint64_t v14;
  void *v15;
  char v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  CRNormalizedQuad *v38;
  CRNormalizedQuad *v40;
  CRNormalizedQuad *v41;
  CRNormalizedQuad *v42;
  double v43;
  double v44;
  char v45;
  NSUInteger v46;
  NSUInteger v47;
  void *v48;
  CRNormalizedQuad *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_25;
  location = a3.location;
  v7 = a3.location + a3.length;
  -[CRImageReaderOutput stringValue](self, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 > objc_msgSend(v8, "length"))
  {

LABEL_25:
    if (a4)
    {
      v36 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB2D50];
      v53[0] = CFSTR("Invalid input range.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("CRImageReaderOutputErrorDomain"), -1, v37);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v38 = 0;
    return v38;
  }
  -[CRImageReaderOutput components](self, "components");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    goto LABEL_25;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v7)
  {
    v40 = 0;
    goto LABEL_35;
  }
  v13 = 0;
  v49 = 0;
  v50 = 0;
  v14 = 0;
  v45 = 0;
  v51 = 0;
  v47 = v7;
  v48 = (void *)v11;
  v46 = location;
  while (1)
  {
    -[CRImageReaderOutput stringValue](self, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v15, "characterAtIndex:", v13));

    if ((v16 & 1) == 0)
      break;
LABEL_23:
    if (++v13 == v7)
      goto LABEL_31;
  }
  -[CRImageReaderOutput components](self, "components");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v14 >= v18)
    goto LABEL_31;
  -[CRImageReaderOutput components](self, "components");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E98DC948);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51 - v50 >= (unint64_t)objc_msgSend(v22, "length"))
  {
    v23 = v14 + 1;
    while (1)
    {
      v14 = v23;
      -[CRImageReaderOutput components](self, "components");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (v14 >= v25)
        break;
      -[CRImageReaderOutput components](self, "components");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "stringValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E98DC948);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = objc_msgSend(v29, "length");
      v23 = v14 + 1;
      v22 = v29;
      v20 = v27;
      if (v30)
      {
        v20 = v27;
        v22 = v29;
        break;
      }
    }
    v50 = v51;
  }
  -[CRImageReaderOutput components](self, "components");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v14 < v32)
  {
    if (v13 >= location)
    {
      objc_msgSend(v20, "boundingQuad");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v49)
      {
        -[CRImageReaderOutput baselineAngle](self, "baselineAngle");
        -[CRNormalizedQuad unionWithNormalizedQuad:baselineAngle:](v49, "unionWithNormalizedQuad:baselineAngle:", v34);
        v35 = objc_claimAutoreleasedReturnValue();

        v49 = (CRNormalizedQuad *)v35;
      }
      else
      {
        v49 = v33;
        v45 = 1;
      }

      v12 = v48;
      location = v46;
    }
    else
    {
      v12 = v48;
    }
    v7 = v47;
    ++v51;

    goto LABEL_23;
  }

  v12 = v48;
LABEL_31:
  if ((v45 & 1) != 0)
  {
    v40 = v49;
    if (v49)
    {
      v41 = v49;
      v40 = v41;
      goto LABEL_36;
    }
  }
  else
  {
    v40 = v49;
  }
LABEL_35:
  v42 = [CRNormalizedQuad alloc];
  -[CRImageReaderOutput imageSize](self, "imageSize");
  v41 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:](v42, "initWithNormalizedBoundingBox:size:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v43, v44);
LABEL_36:
  v38 = v41;

  return v38;
}

- (CGPoint)_rotatePointIfNeccessary:(CGPoint)a3 anchor:(CGPoint)a4 angle:(double)a5
{
  double y;
  double x;
  double v7;
  double v8;
  __double2 v9;
  float v10;
  float v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (fabs(a5) > 0.05)
  {
    v7 = a4.y;
    v8 = a4.x;
    v9 = __sincos_stret(a5);
    v10 = (x - v8) * v9.__cosval - (y - v7) * v9.__sinval;
    v11 = (y - v7) * v9.__cosval + (x - v8) * v9.__sinval;
    x = v8 + v10;
    y = v7 + v11;
  }
  v12 = x;
  v13 = y;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRImageReaderOutput *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
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
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = +[CRImageReaderOutput allocWithZone:](CRImageReaderOutput, "allocWithZone:");
  -[CRImageReaderOutput type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRImageReaderOutput initWithType:outputRegion:isTitle:](v5, "initWithType:outputRegion:isTitle:", v6, 0, -[CRImageReaderOutput isTitle](self, "isTitle"));

  -[CRImageReaderOutput stringValue](self, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copyWithZone:", a3);
  v10 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v9;

  *(_DWORD *)(v7 + 12) = -[CRImageReaderOutput confidence](self, "confidence");
  -[CRImageReaderOutput boundingBox](self, "boundingBox");
  *(_QWORD *)(v7 + 136) = v11;
  *(_QWORD *)(v7 + 144) = v12;
  *(_QWORD *)(v7 + 152) = v13;
  *(_QWORD *)(v7 + 160) = v14;
  -[CRImageReaderOutput topLeft](self, "topLeft");
  *(_QWORD *)(v7 + 56) = v15;
  *(_QWORD *)(v7 + 64) = v16;
  -[CRImageReaderOutput topRight](self, "topRight");
  *(_QWORD *)(v7 + 72) = v17;
  *(_QWORD *)(v7 + 80) = v18;
  -[CRImageReaderOutput bottomRight](self, "bottomRight");
  *(_QWORD *)(v7 + 88) = v19;
  *(_QWORD *)(v7 + 96) = v20;
  -[CRImageReaderOutput bottomLeft](self, "bottomLeft");
  *(_QWORD *)(v7 + 104) = v21;
  *(_QWORD *)(v7 + 112) = v22;
  -[CRImageReaderOutput baselineAngle](self, "baselineAngle");
  *(_DWORD *)(v7 + 16) = v23;
  -[CRImageReaderOutput imageSize](self, "imageSize");
  *(_QWORD *)(v7 + 120) = v24;
  *(_QWORD *)(v7 + 128) = v25;
  -[CRImageReaderOutput components](self, "components");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = (void *)MEMORY[0x1E0C99DE8];
    -[CRImageReaderOutput components](self, "components");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "arrayWithCapacity:", objc_msgSend(v28, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[CRImageReaderOutput components](self, "components");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v54;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v54 != v33)
            objc_enumerationMutation(v30);
          v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v34), "copyWithZone:", a3);
          objc_msgSend(v29, "addObject:", v35);

          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v32);
    }

    v36 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = v29;

  }
  -[CRImageReaderOutput candidates](self, "candidates");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    v38 = (void *)MEMORY[0x1E0C99DE8];
    -[CRImageReaderOutput candidates](self, "candidates");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "arrayWithCapacity:", objc_msgSend(v39, "count"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[CRImageReaderOutput candidates](self, "candidates", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v50;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v50 != v44)
            objc_enumerationMutation(v41);
          v46 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v45), "copyWithZone:", a3);
          objc_msgSend(v40, "addObject:", v46);

          ++v45;
        }
        while (v43 != v45);
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v43);
    }

    v47 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v40;

  }
  return (id)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 2, CFSTR("CROutputEncodingVersion"));
  -[CRImageReaderOutput crCodableDataRepresentation](self, "crCodableDataRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  compressData(v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CROutputEncodingData"));
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v6, "length"), CFSTR("CROutputEncodingUncompressedDataSize"));

}

- (id)crCodableDataRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[CRImageReaderOutput type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v4, v3);

  -[CRImageReaderOutput stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v5, v3);

  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", -[CRImageReaderOutput confidence](self, "confidence"), v3);
  -[CRImageReaderOutput boundingBox](self, "boundingBox");
  +[CRCodingUtilities appendRect:toData:](CRCodingUtilities, "appendRect:toData:", v3);
  -[CRImageReaderOutput topLeft](self, "topLeft");
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3);
  -[CRImageReaderOutput topRight](self, "topRight");
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3);
  -[CRImageReaderOutput bottomRight](self, "bottomRight");
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3);
  -[CRImageReaderOutput bottomLeft](self, "bottomLeft");
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3);
  -[CRImageReaderOutput imageSize](self, "imageSize");
  +[CRCodingUtilities appendSize:toData:](CRCodingUtilities, "appendSize:toData:", v3);
  +[CRCodingUtilities appendBool:toData:](CRCodingUtilities, "appendBool:toData:", -[CRImageReaderOutput isTitle](self, "isTitle"), v3);
  -[CRImageReaderOutput baselineAngle](self, "baselineAngle");
  +[CRCodingUtilities appendFloat:toData:](CRCodingUtilities, "appendFloat:toData:", v3);
  -[CRImageReaderOutput components](self, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v6, v3);

  -[CRImageReaderOutput candidates](self, "candidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v7, v3);

  return v3;
}

- (CRImageReaderOutput)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRImageReaderOutput *v7;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CROutputEncodingVersion")) == 2)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CROutputEncodingData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    uncompressDataOfSize(v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CROutputEncodingUncompressedDataSize")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CRImageReaderOutput *)-[CRImageReaderOutput initV2WithDataRepresentation:](self, "initV2WithDataRepresentation:", v6);

  }
  else
  {
    v7 = (CRImageReaderOutput *)-[CRImageReaderOutput initV1WithCoder:](self, "initV1WithCoder:", v4);
  }

  return v7;
}

- (id)initV1WithCoder:(id)a3
{
  id v4;
  CRImageReaderOutput *v5;
  uint64_t v6;
  NSString *type;
  uint64_t v8;
  NSString *stringValue;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  float v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSArray *components;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSArray *candidates;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CRImageReaderOutput;
  v5 = -[CRImageReaderOutput init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CROutputType"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CROutputStringValue")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CROutputStringValue"));
      v8 = objc_claimAutoreleasedReturnValue();
      stringValue = v5->_stringValue;
      v5->_stringValue = (NSString *)v8;

    }
    v5->_confidence = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("CROutputConfidence"));
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("CROutputBoundingBox"));
    v5->_boundingBox.origin.x = v10;
    v5->_boundingBox.origin.y = v11;
    v5->_boundingBox.size.width = v12;
    v5->_boundingBox.size.height = v13;
    objc_msgSend(v4, "decodePointForKey:", CFSTR("CROutputTopLeft"));
    v5->_topLeft.x = v14;
    v5->_topLeft.y = v15;
    objc_msgSend(v4, "decodePointForKey:", CFSTR("CROutputTopRight"));
    v5->_topRight.x = v16;
    v5->_topRight.y = v17;
    objc_msgSend(v4, "decodePointForKey:", CFSTR("CROutputBottomRight"));
    v5->_bottomRight.x = v18;
    v5->_bottomRight.y = v19;
    objc_msgSend(v4, "decodePointForKey:", CFSTR("CROutputBottomLeft"));
    v5->_bottomLeft.x = v20;
    v5->_bottomLeft.y = v21;
    objc_msgSend(v4, "decodeSizeForKey:", CFSTR("CROutputImageSize"));
    v5->_imageSize.width = v22;
    v5->_imageSize.height = v23;
    v5->_isTitle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CROutputIsTitle"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("CROutputBaselineAngle"));
    v5->_baselineAngle = v24;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CROutputComponents")))
    {
      v25 = (void *)MEMORY[0x1E0C99E60];
      v26 = objc_opt_class();
      objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("CROutputComponents"));
      v28 = objc_claimAutoreleasedReturnValue();
      components = v5->_components;
      v5->_components = (NSArray *)v28;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CROutputCandidatesKey")))
    {
      v30 = (void *)MEMORY[0x1E0C99E60];
      v31 = objc_opt_class();
      objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("CROutputCandidatesKey"));
      v33 = objc_claimAutoreleasedReturnValue();
      candidates = v5->_candidates;
      v5->_candidates = (NSArray *)v33;

    }
  }

  return v5;
}

- (id)initV2WithDataRepresentation:(id)a3
{
  id v4;
  CRImageReaderOutput *v5;
  uint64_t v6;
  NSString *type;
  uint64_t v8;
  NSString *stringValue;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  float v24;
  uint64_t v25;
  NSArray *components;
  uint64_t v27;
  NSArray *candidates;
  uint64_t v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CRImageReaderOutput;
  v5 = -[CRImageReaderOutput init](&v31, sel_init);
  if (v5)
  {
    v30 = 0;
    +[CRCodingUtilities stringFromEncodingData:offset:](CRCodingUtilities, "stringFromEncodingData:offset:", v4, &v30);
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

    +[CRCodingUtilities stringFromEncodingData:offset:](CRCodingUtilities, "stringFromEncodingData:offset:", v4, &v30);
    v8 = objc_claimAutoreleasedReturnValue();
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v8;

    v5->_confidence = +[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v4, &v30);
    +[CRCodingUtilities rectFromEncodingData:offset:](CRCodingUtilities, "rectFromEncodingData:offset:", v4, &v30);
    v5->_boundingBox.origin.x = v10;
    v5->_boundingBox.origin.y = v11;
    v5->_boundingBox.size.width = v12;
    v5->_boundingBox.size.height = v13;
    +[CRCodingUtilities pointFromEncodingData:offset:](CRCodingUtilities, "pointFromEncodingData:offset:", v4, &v30);
    v5->_topLeft.x = v14;
    v5->_topLeft.y = v15;
    +[CRCodingUtilities pointFromEncodingData:offset:](CRCodingUtilities, "pointFromEncodingData:offset:", v4, &v30);
    v5->_topRight.x = v16;
    v5->_topRight.y = v17;
    +[CRCodingUtilities pointFromEncodingData:offset:](CRCodingUtilities, "pointFromEncodingData:offset:", v4, &v30);
    v5->_bottomRight.x = v18;
    v5->_bottomRight.y = v19;
    +[CRCodingUtilities pointFromEncodingData:offset:](CRCodingUtilities, "pointFromEncodingData:offset:", v4, &v30);
    v5->_bottomLeft.x = v20;
    v5->_bottomLeft.y = v21;
    +[CRCodingUtilities sizeFromEncodingData:offset:](CRCodingUtilities, "sizeFromEncodingData:offset:", v4, &v30);
    v5->_imageSize.width = v22;
    v5->_imageSize.height = v23;
    v5->_isTitle = +[CRCodingUtilities BOOLFromEncodingData:offset:](CRCodingUtilities, "BOOLFromEncodingData:offset:", v4, &v30);
    +[CRCodingUtilities floatFromEncodingData:offset:](CRCodingUtilities, "floatFromEncodingData:offset:", v4, &v30);
    v5->_baselineAngle = v24;
    -[CRImageReaderOutput decodeOutputsArrayFromData:offset:version:](v5, "decodeOutputsArrayFromData:offset:version:", v4, &v30, 2);
    v25 = objc_claimAutoreleasedReturnValue();
    components = v5->_components;
    v5->_components = (NSArray *)v25;

    -[CRImageReaderOutput decodeOutputsArrayFromData:offset:version:](v5, "decodeOutputsArrayFromData:offset:version:", v4, &v30, 2);
    v27 = objc_claimAutoreleasedReturnValue();
    candidates = v5->_candidates;
    v5->_candidates = (NSArray *)v27;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToImageReaderOutput:(id)a3
{
  id v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  char v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v48;
  float v49;
  float v50;
  int v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;

  v4 = a3;
  v5 = -[CRImageReaderOutput confidence](self, "confidence");
  if (v5 != objc_msgSend(v4, "confidence"))
    goto LABEL_11;
  -[CRImageReaderOutput boundingBox](self, "boundingBox");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "boundingBox");
  v18 = vabdd_f64(v13, v17);
  if (vabdd_f64(v11, v16) > 4.4408921e-16 || v18 > 4.4408921e-16)
    goto LABEL_11;
  v20 = vabdd_f64(v9, v15);
  if (vabdd_f64(v7, v14) > 4.4408921e-16 || v20 > 4.4408921e-16)
    goto LABEL_11;
  -[CRImageReaderOutput topLeft](self, "topLeft", 4.4408921e-16, v20);
  v25 = v24;
  v27 = v26;
  objc_msgSend(v4, "topLeft");
  v22 = 0;
  if (v25 == v28 && v27 == v29)
  {
    -[CRImageReaderOutput topRight](self, "topRight");
    v31 = v30;
    v33 = v32;
    objc_msgSend(v4, "topRight");
    v22 = 0;
    if (v31 == v35 && v33 == v34)
    {
      -[CRImageReaderOutput bottomRight](self, "bottomRight");
      v37 = v36;
      v39 = v38;
      objc_msgSend(v4, "bottomRight");
      v22 = 0;
      if (v37 == v41 && v39 == v40)
      {
        -[CRImageReaderOutput bottomLeft](self, "bottomLeft");
        v43 = v42;
        v45 = v44;
        objc_msgSend(v4, "bottomLeft");
        v22 = 0;
        if (v43 == v47 && v45 == v46)
        {
          -[CRImageReaderOutput baselineAngle](self, "baselineAngle");
          v49 = v48;
          objc_msgSend(v4, "baselineAngle");
          if (v49 != v50)
            goto LABEL_11;
          v51 = -[CRImageReaderOutput isTitle](self, "isTitle");
          if (v51 != objc_msgSend(v4, "isTitle"))
            goto LABEL_11;
          -[CRImageReaderOutput type](self, "type");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "type");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v52, "isEqualToString:", v53);

          if (!(_DWORD)v54)
            goto LABEL_11;
          -[CRImageReaderOutput stringValue](self, "stringValue");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (v55 || (objc_msgSend(v4, "stringValue"), (v53 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[CRImageReaderOutput stringValue](self, "stringValue");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "stringValue");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v56, "isEqualToString:", v57);

            if (v55)
            {

              if (!(_DWORD)v54)
                goto LABEL_11;
            }
            else
            {

              if ((v54 & 1) == 0)
                goto LABEL_11;
            }
          }
          -[CRImageReaderOutput components](self, "components");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v58)
          {
            objc_msgSend(v4, "components");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v53)
              goto LABEL_36;
          }
          -[CRImageReaderOutput components](self, "components");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "components");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v59, "isEqualToArray:", v60);

          if (v58)
          {

            if ((_DWORD)v54)
              goto LABEL_36;
            goto LABEL_11;
          }

          if ((v54 & 1) != 0)
          {
LABEL_36:
            -[CRImageReaderOutput candidates](self, "candidates");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            if (v61 || (objc_msgSend(v4, "candidates"), (v54 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[CRImageReaderOutput candidates](self, "candidates");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "candidates");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v62, "isEqualToArray:", v63);

              if (v61)
              {
LABEL_42:

                goto LABEL_12;
              }
            }
            else
            {
              v22 = 1;
            }

            goto LABEL_42;
          }
LABEL_11:
          v22 = 0;
        }
      }
    }
  }
LABEL_12:

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  CRImageReaderOutput *v4;
  CRImageReaderOutput *v5;
  BOOL v6;

  v4 = (CRImageReaderOutput *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CRImageReaderOutput isEqualToImageReaderOutput:](self, "isEqualToImageReaderOutput:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[CRImageReaderOutput stringValue](self, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRImageReaderOutput components](self, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CRImageReaderOutput candidates](self, "candidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)decodeOutputsArrayFromData:(id)a3 offset:(unint64_t *)a4 version:(int64_t)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__CRImageReaderOutput_decodeOutputsArrayFromData_offset_version___block_invoke;
  v6[3] = &__block_descriptor_40_e37___NSObject_CRCodable__16__0__NSData_8l;
  v6[4] = a5;
  +[CRCodingUtilities arrayFromEncodingData:offset:objectProviderBlock:](CRCodingUtilities, "arrayFromEncodingData:offset:objectProviderBlock:", a3, a4, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __65__CRImageReaderOutput_decodeOutputsArrayFromData_offset_version___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  if (*(_QWORD *)(a1 + 32) == 2)
  {
    v2 = a2;
    v3 = -[CRImageReaderOutput initV2WithDataRepresentation:]([CRImageReaderOutput alloc], "initV2WithDataRepresentation:", v2);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int)a3
{
  self->_confidence = a3;
}

- (CGRect)boundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)topLeft
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_topLeft, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topRight
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_topRight, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_bottomRight, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomLeft
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_bottomLeft, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (NSArray)candidates
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)components
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (float)baselineAngle
{
  return self->_baselineAngle;
}

- (void)setBaselineAngle:(float)a3
{
  self->_baselineAngle = a3;
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_imageSize, &v3, 16, 1, 0);
}

- (BOOL)isTitle
{
  return self->_isTitle;
}

- (void)setIsTitle:(BOOL)a3
{
  self->_isTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
