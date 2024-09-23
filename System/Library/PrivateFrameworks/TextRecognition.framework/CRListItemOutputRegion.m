@implementation CRListItemOutputRegion

- (CRListItemOutputRegion)initWithLayoutListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CRListItemOutputRegion *v8;

  v4 = a3;
  objc_msgSend(v4, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "count");

  objc_msgSend(v4, "groups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (CRListItemOutputRegion *)-[CRListItemOutputRegion initWithParagraphs:marker:](self, v6, v7);
  return v8;
}

- (void)initWithParagraphs:(void *)a3 marker:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  unsigned int v21;
  void *v22;
  void *v23;
  SEL v24;
  id newValue;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (objc_msgSend(v5, "count"))
      {
        newValue = v6;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v7 = v5;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v8)
        {
          v9 = v8;
          v10 = 0;
          v11 = *(_QWORD *)v28;
          v12 = 0.0;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v28 != v11)
                objc_enumerationMutation(v7);
              v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_msgSend(v14, "baselineAngle");
              v16 = v15;
              objc_msgSend(a1, "baselineAngle");
              v18 = v16 - v17;
              if (v16 - v17 <= 3.14159265)
              {
                if (v18 <= -3.14159265)
                  v18 = v18 + 6.28318531;
              }
              else
              {
                v18 = v18 + -6.28318531;
              }
              v19 = v10 + i + 1;
              v20 = v17 + v18 * (float)(1.0 / (float)v19);
              if (v20 <= 3.14159265)
              {
                if (v20 <= -3.14159265)
                  v20 = v20 + 6.28318531;
              }
              else
              {
                v20 = v20 + -6.28318531;
              }
              objc_msgSend(a1, "setBaselineAngle:", v20);
              v21 = objc_msgSend(v14, "confidence");
              if (v19 < (unint64_t)objc_msgSend(v7, "count"))
              {
                objc_msgSend(v14, "setUseLineSeparatorAsJoiningDelimiter:", 1);
                objc_msgSend(v14, "children");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "lastObject");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setUseLineSeparatorAsLineBreak:", 1);

              }
              v12 = v12 + (double)v21;
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
            v10 += i;
          }
          while (v9);
        }
        else
        {
          v12 = 0.0;
        }

        objc_msgSend(a1, "setConfidence:", (v12 / (double)(unint64_t)objc_msgSend(v7, "count")));
        objc_msgSend(a1, "setShouldComputeBoundsFromChildren:", 1);
        objc_msgSend(a1, "setShouldComputeTranscriptFromChildren:", 1);
        objc_msgSend(a1, "setChildren:", v7);
        objc_msgSend(a1, "setParagraphRegions:", v7);
        v6 = newValue;
        objc_setProperty_atomic(a1, v24, newValue, 336);
      }
    }
  }

  return a1;
}

- (id)listItemByAppendingParagraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  CRListItemOutputRegion *v12;
  id Property;
  void *v14;

  v4 = a3;
  -[CROutputRegion paragraphRegions](self, "paragraphRegions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setUseLineSeparatorAsJoiningDelimiter:", 1);
  objc_msgSend(v6, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUseLineSeparatorAsLineBreak:", 1);

  -[CROutputRegion paragraphRegions](self, "paragraphRegions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObject:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [CRListItemOutputRegion alloc];
  if (self)
    Property = objc_getProperty(self, v11, 336, 1);
  else
    Property = 0;
  v14 = -[CRListItemOutputRegion initWithParagraphs:marker:](v12, v10, Property);

  return v14;
}

- (unint64_t)type
{
  return 512;
}

- (BOOL)contributesToDocumentHierarchy
{
  return 0;
}

- (_NSRange)markerRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  if (self)
    self = (CRListItemOutputRegion *)objc_getProperty(self, a2, 336, 1);
  v2 = -[CRListItemOutputRegion range](self, "range");
  result.length = v3;
  result.location = v2;
  return result;
}

- (int64_t)markerType
{
  if (self)
    self = (CRListItemOutputRegion *)objc_getProperty(self, a2, 336, 1);
  return -[CRListItemOutputRegion type](self, "type");
}

+ (BOOL)textStartsWithListItem:(id)a3
{
  void *v3;
  BOOL v4;

  +[CRListItemMarker listItemMarkerForText:requiresAdjacentText:](CRListItemMarker, "listItemMarkerForText:requiresAdjacentText:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)listItemForParagraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  CRListItemOutputRegion *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRListItemMarker listItemMarkerForText:requiresAdjacentText:](CRListItemMarker, "listItemMarkerForText:requiresAdjacentText:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [CRListItemOutputRegion alloc];
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CRListItemOutputRegion initWithParagraphs:marker:](v6, v7, v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marker, 0);
}

@end
