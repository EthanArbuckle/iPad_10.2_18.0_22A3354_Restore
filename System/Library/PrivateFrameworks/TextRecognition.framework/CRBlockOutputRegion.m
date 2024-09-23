@implementation CRBlockOutputRegion

+ (CRBlockOutputRegion)blockWithGroupRegion:(void *)a3 children:(uint64_t)a4 confidenceThresholdProvider:(uint64_t)a5 canWrapToNextBlock:
{
  id v7;
  id v8;
  CRBlockOutputRegion *v9;
  void *v10;
  CRBlockOutputRegion *v11;
  void *v12;
  uint64_t v13;

  v7 = a3;
  v8 = a2;
  objc_opt_self();
  v9 = [CRBlockOutputRegion alloc];
  objc_msgSend(v8, "boundingQuad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "baselineAngle");
  v11 = -[CROutputRegion initWithConfidence:baselineAngle:](v9, "initWithConfidence:baselineAngle:", 2);

  -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v11, "setShouldComputeBoundsFromChildren:", 0);
  -[CROutputRegion setShouldComputeTranscriptFromChildren:](v11, "setShouldComputeTranscriptFromChildren:", 1);
  objc_msgSend(v8, "boundingQuad");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CROutputRegion setBoundingQuad:](v11, "setBoundingQuad:", v12);
  -[CROutputRegion setChildren:](v11, "setChildren:", v7);
  v13 = objc_msgSend(v7, "count");

  -[CROutputRegion setNumberOfLines:](v11, "setNumberOfLines:", v13);
  -[CRBlockOutputRegion setCanWrapToNextGroup:](v11, "setCanWrapToNextGroup:", a5);
  return v11;
}

+ (id)blockWithBlock:(id)a3 children:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "copyWithZone:copyChildren:copyCandidates:deepCopy:", 0, 0, 0, 0);
  objc_msgSend(v6, "setChildren:", v5);
  v7 = objc_msgSend(v5, "count");

  objc_msgSend(v6, "setNumberOfLines:", v7);
  return v6;
}

+ (id)blockWithLines:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  uint64_t v7;
  id v9;
  id v10;
  CRBlockOutputRegion *v11;

  v7 = *(_QWORD *)&a4;
  v9 = a5;
  v10 = a3;
  v11 = -[CROutputRegion initWithConfidence:baselineAngle:]([CRBlockOutputRegion alloc], "initWithConfidence:baselineAngle:", v7, a6);
  -[CROutputRegion setShouldComputeTranscriptFromChildren:](v11, "setShouldComputeTranscriptFromChildren:", 1);
  if (v9)
  {
    -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v11, "setShouldComputeBoundsFromChildren:", 0);
    -[CROutputRegion setBoundingQuad:](v11, "setBoundingQuad:", v9);
  }
  else
  {
    -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v11, "setShouldComputeBoundsFromChildren:", 1);
  }
  -[CROutputRegion setNumberOfLines:](v11, "setNumberOfLines:", objc_msgSend(v10, "count"));
  -[CROutputRegion setChildren:](v11, "setChildren:", v10);

  return v11;
}

- (unint64_t)type
{
  return 2;
}

- (BOOL)computesNumberOfLinesFromChildren
{
  return 0;
}

- (id)joiningDelimiter
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;

  -[CROutputRegion children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CROutputRegion children](self, "children");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "joiningDelimiter");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("\n");
  }
  return v7;
}

- (void)removeSubregion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t v18[16];

  v4 = a3;
  -[CROutputRegion children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[CROutputRegion children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CROutputRegion children](self, "children");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
          break;
      }
      ++v9;
      -[CROutputRegion children](self, "children");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13 <= v9)
        goto LABEL_8;
    }
    objc_msgSend(v6, "removeObjectAtIndex:", v9);
  }
LABEL_8:
  -[CROutputRegion children](self, "children");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  v16 = objc_msgSend(v6, "count") + 1;

  if (v15 == v16)
  {
    -[CROutputRegion setChildren:](self, "setChildren:", v6);
    -[CROutputRegion setNumberOfLines:](self, "setNumberOfLines:", -[CROutputRegion numberOfLines](self, "numberOfLines") - 1);
    -[CROutputRegion _invalidateTranscript](self, "_invalidateTranscript");
  }
  else
  {
    CROSLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1D4FB8000, v17, OS_LOG_TYPE_FAULT, "Could not find line to remove", v18, 2u);
    }

  }
}

- (BOOL)canWrapToNextGroup
{
  return self->_canWrapToNextGroup;
}

- (void)setCanWrapToNextGroup:(BOOL)a3
{
  self->_canWrapToNextGroup = a3;
}

@end
