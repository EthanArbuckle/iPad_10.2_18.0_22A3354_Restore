@implementation SiriNLUExternalTypesUsoGraphConverter

+ (id)convertFromUsoGraph:(id)a3
{
  id v4;
  SIRINLUEXTERNALUsoGraph *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init(SIRINLUEXTERNALUsoGraph);
    objc_msgSend(v4, "nodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromUsoNodes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUsoGraph setNodes:](v5, "setNodes:", v7);

    objc_msgSend(v4, "edges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromGraphEdges:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUsoGraph setEdges:](v5, "setEdges:", v9);

    objc_msgSend(v4, "alignments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromUtteranceAlignments:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUsoGraph setAlignments:](v5, "setAlignments:", v11);

    objc_msgSend(v4, "identifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "convertFromUsoEntityIdentifiers:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUsoGraph setIdentifiers:](v5, "setIdentifiers:", v13);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)convertFromUsoGraphs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromUsoGraph:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromUtteranceAlignment:(id)a3
{
  id v4;
  SIRINLUEXTERNALUtteranceAlignment *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init(SIRINLUEXTERNALUtteranceAlignment);
    objc_msgSend(v4, "spans");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromUtteranceSpans:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUtteranceAlignment setSpans:](v5, "setSpans:", v7);

    -[SIRINLUEXTERNALUtteranceAlignment setAsrHypothesisIndex:](v5, "setAsrHypothesisIndex:", objc_msgSend(v4, "asrHypothesisIndex"));
    v8 = objc_msgSend(v4, "nodeIndex");

    -[SIRINLUEXTERNALUtteranceAlignment setNodeIndex:](v5, "setNodeIndex:", v8);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)convertFromUtteranceAlignments:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromUtteranceAlignment:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromUtteranceSpan:(id)a3
{
  id v3;
  SIRINLUEXTERNALUtteranceSpan *v4;
  uint64_t v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALUtteranceSpan);
    -[SIRINLUEXTERNALUtteranceSpan setEndIndex:](v4, "setEndIndex:", objc_msgSend(v3, "endIndex"));
    -[SIRINLUEXTERNALUtteranceSpan setStartIndex:](v4, "setStartIndex:", objc_msgSend(v3, "startIndex"));
    -[SIRINLUEXTERNALUtteranceSpan setStartUnicodeScalarIndex:](v4, "setStartUnicodeScalarIndex:", objc_msgSend(v3, "startUnicodeScalarIndex"));
    -[SIRINLUEXTERNALUtteranceSpan setEndUnicodeScalarIndex:](v4, "setEndUnicodeScalarIndex:", objc_msgSend(v3, "endUnicodeScalarIndex"));
    -[SIRINLUEXTERNALUtteranceSpan setStartMilliSeconds:](v4, "setStartMilliSeconds:", objc_msgSend(v3, "startMilliSeconds"));
    v5 = objc_msgSend(v3, "endMilliSeconds");

    -[SIRINLUEXTERNALUtteranceSpan setEndMilliSeconds:](v4, "setEndMilliSeconds:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromUsoEntityIdentifier:(id)a3
{
  id v3;
  SIRINLUEXTERNALUsoEntityIdentifier *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SIRICOMMONDoubleValue *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALUsoEntityIdentifier);
    objc_msgSend(v3, "appBundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUsoEntityIdentifier setBackingAppBundleId:](v4, "setBackingAppBundleId:", v5);

    objc_msgSend(v3, "namespaceString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromString:](SiriNLUExternalTypesConverter, "convertFromString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUsoEntityIdentifier setNamespaceA:](v4, "setNamespaceA:", v7);

    -[SIRINLUEXTERNALUsoEntityIdentifier setNodeIndex:](v4, "setNodeIndex:", objc_msgSend(v3, "nodeIndex"));
    objc_msgSend(v3, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUsoEntityIdentifier setValue:](v4, "setValue:", v8);

    objc_msgSend(v3, "probability");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc_init(SIRICOMMONDoubleValue);
      -[SIRINLUEXTERNALUsoEntityIdentifier setProbability:](v4, "setProbability:", v10);

      objc_msgSend(v3, "probability");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;
      -[SIRINLUEXTERNALUsoEntityIdentifier probability](v4, "probability");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:", v13);

    }
    objc_msgSend(v3, "sourceComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v3, "sourceComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALUsoEntityIdentifier setSourceComponent:](v4, "setSourceComponent:", objc_msgSend(v16, "intValue"));

    }
    objc_msgSend(v3, "groupIndex");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v3, "groupIndex");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALUsoEntityIdentifier setGroupIndex:](v4, "setGroupIndex:", objc_msgSend(v18, "unsignedIntValue"));

    }
    objc_msgSend(v3, "interpretationGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v3, "interpretationGroup");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALUsoEntityIdentifier setInterpretationGroup:](v4, "setInterpretationGroup:", objc_msgSend(v20, "unsignedIntValue"));

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromUsoEntityIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromUsoEntityIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromUtteranceSpans:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromUtteranceSpan:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromGraphEdge:(id)a3
{
  id v3;
  SIRINLUEXTERNALUsoEdge *v4;
  SIRINLUEXTERNALUsoLabel *v5;
  void *v6;
  SIRINLUEXTERNALUsoEdgeLabel *v7;
  uint64_t v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALUsoEdge);
    -[SIRINLUEXTERNALUsoEdge setFromIndex:](v4, "setFromIndex:", objc_msgSend(v3, "fromVertex"));
    -[SIRINLUEXTERNALUsoEdge setToIndex:](v4, "setToIndex:", objc_msgSend(v3, "toVertex"));
    v5 = objc_alloc_init(SIRINLUEXTERNALUsoLabel);
    objc_msgSend(v3, "edgeLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUsoLabel setValue:](v5, "setValue:", v6);

    v7 = objc_alloc_init(SIRINLUEXTERNALUsoEdgeLabel);
    -[SIRINLUEXTERNALUsoEdgeLabel setUsoElementId:](v7, "setUsoElementId:", objc_msgSend(v3, "usoElementId"));
    v8 = objc_msgSend(v3, "enumeration");

    -[SIRINLUEXTERNALUsoEdgeLabel setEnumeration:](v7, "setEnumeration:", v8);
    -[SIRINLUEXTERNALUsoEdgeLabel setBaseEdgeLabel:](v7, "setBaseEdgeLabel:", v5);
    -[SIRINLUEXTERNALUsoEdge setLabel:](v4, "setLabel:", v7);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromGraphEdges:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromGraphEdge:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromUsoNodes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromUsoNode:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromUsoNode:(id)a3
{
  id v3;
  SIRINLUEXTERNALUsoNode *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  SIRICOMMONUInt32Value *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALUsoNode);
    objc_msgSend(v3, "entityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUsoNode setEntityLabel:](v4, "setEntityLabel:", v5);

    objc_msgSend(v3, "integerPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromNumber:](SiriNLUExternalTypesConverter, "convertFromNumber:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUsoNode setIntegerPayload:](v4, "setIntegerPayload:", v7);

    objc_msgSend(v3, "stringPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromString:](SiriNLUExternalTypesConverter, "convertFromString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUsoNode setStringPayload:](v4, "setStringPayload:", v9);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v3, "normalizedStringPayloads", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          -[SIRINLUEXTERNALUsoNode addNormalizedStringPayloads:](v4, "addNormalizedStringPayloads:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "verbLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUsoNode setVerbLabel:](v4, "setVerbLabel:", v15);

    -[SIRINLUEXTERNALUsoNode setUsoElementId:](v4, "setUsoElementId:", objc_msgSend(v3, "usoElementId"));
    objc_msgSend(v3, "usoVerbId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_alloc_init(SIRICOMMONUInt32Value);
      objc_msgSend(v3, "usoVerbId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRICOMMONUInt32Value setValue:](v17, "setValue:", objc_msgSend(v18, "intValue"));

      -[SIRINLUEXTERNALUsoNode setUsoVerbElementId:](v4, "setUsoVerbElementId:", v17);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
