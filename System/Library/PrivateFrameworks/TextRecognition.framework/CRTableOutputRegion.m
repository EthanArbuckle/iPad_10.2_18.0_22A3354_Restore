@implementation CRTableOutputRegion

- (CRTableOutputRegion)initWithCells:(id)a3 quad:(id)a4 rowQuads:(id)a5 colQuads:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CRTableOutputRegion *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[CROutputRegion init](self, "init");
  if (v14)
  {
    if (objc_msgSend(v10, "count"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v15 = v10;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v23;
        v19 = 0.0;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v23 != v18)
              objc_enumerationMutation(v15);
            v19 = v19
                + (double)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "confidence", (_QWORD)v22);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v17);
      }
      else
      {
        v19 = 0.0;
      }

      -[CROutputRegion setConfidence:](v14, "setConfidence:", (v19 / (double)(unint64_t)objc_msgSend(v15, "count")));
      -[CROutputRegion setChildren:](v14, "setChildren:", v15);
    }
    objc_msgSend(v11, "baselineAngle", (_QWORD)v22);
    -[CROutputRegion setBaselineAngle:](v14, "setBaselineAngle:");
    -[CROutputRegion setBoundingQuad:](v14, "setBoundingQuad:", v11);
    -[CROutputRegion setShouldComputeBoundsFromChildren:](v14, "setShouldComputeBoundsFromChildren:", 0);
    -[CROutputRegion setShouldComputeTranscriptFromChildren:](v14, "setShouldComputeTranscriptFromChildren:", 1);
    -[CRTableOutputRegion setRowQuads:](v14, "setRowQuads:", v12);
    -[CRTableOutputRegion setColQuads:](v14, "setColQuads:", v13);
  }

  return v14;
}

- (CRTableOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8;
  CRTableOutputRegion *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRTableOutputRegion;
  v9 = -[CROutputRegion initWithCRCodableDataRepresentation:version:offset:](&v13, sel_initWithCRCodableDataRepresentation_version_offset_, v8, a4, a5);
  if (v9)
  {
    if (a4 >= 3)
      +[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v8, a5);
    +[CRCodingUtilities arrayFromEncodingData:offset:objectProviderBlock:](CRCodingUtilities, "arrayFromEncodingData:offset:objectProviderBlock:", v8, a5, &__block_literal_global_34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTableOutputRegion setRowQuads:](v9, "setRowQuads:", v10);

    +[CRCodingUtilities arrayFromEncodingData:offset:objectProviderBlock:](CRCodingUtilities, "arrayFromEncodingData:offset:objectProviderBlock:", v8, a5, &__block_literal_global_2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTableOutputRegion setColQuads:](v9, "setColQuads:", v11);

  }
  return v9;
}

CRNormalizedQuad *__74__CRTableOutputRegion_initWithCRCodableDataRepresentation_version_offset___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CRNormalizedQuad *v3;

  v2 = a2;
  v3 = -[CRNormalizedQuad initWithCRCodableDataRepresentation:]([CRNormalizedQuad alloc], "initWithCRCodableDataRepresentation:", v2);

  return v3;
}

CRNormalizedQuad *__74__CRTableOutputRegion_initWithCRCodableDataRepresentation_version_offset___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  CRNormalizedQuad *v3;

  v2 = a2;
  v3 = -[CRNormalizedQuad initWithCRCodableDataRepresentation:]([CRNormalizedQuad alloc], "initWithCRCodableDataRepresentation:", v2);

  return v3;
}

- (unint64_t)type
{
  return 64;
}

- (id)crCodableDataRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v9.receiver = self;
  v9.super_class = (Class)CRTableOutputRegion;
  -[CROutputRegion crCodableDataRepresentation](&v9, sel_crCodableDataRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", 1, v5);
  -[CRTableOutputRegion rowQuads](self, "rowQuads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v6, v5);

  -[CRTableOutputRegion colQuads](self, "colQuads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v7, v5);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CRTableOutputRegion;
  v8 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](&v16, sel_copyWithZone_copyChildren_copyCandidates_deepCopy_, a3, a4, a5);
  v9 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[CRTableOutputRegion rowQuads](self, "rowQuads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:copyItems:", v10, v6);
  objc_msgSend(v8, "setRowQuads:", v11);

  v12 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[CRTableOutputRegion colQuads](self, "colQuads");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithArray:copyItems:", v13, v6);
  objc_msgSend(v8, "setColQuads:", v14);

  return v8;
}

- (BOOL)contributesToDocumentHierarchy
{
  return 0;
}

- (NSArray)rowQuads
{
  return self->_rowQuads;
}

- (void)setRowQuads:(id)a3
{
  objc_storeStrong((id *)&self->_rowQuads, a3);
}

- (NSArray)colQuads
{
  return self->_colQuads;
}

- (void)setColQuads:(id)a3
{
  objc_storeStrong((id *)&self->_colQuads, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colQuads, 0);
  objc_storeStrong((id *)&self->_rowQuads, 0);
}

@end
