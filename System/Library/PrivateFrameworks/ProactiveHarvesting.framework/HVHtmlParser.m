@implementation HVHtmlParser

- (HVHtmlParser)initWithString:(id)a3
{
  uint64_t v5;
  void *v6;
  const char *CStringPtr;
  const char *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _HVNSStringEncodingEnumerator *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  HVHtmlParser *v23;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v13 = 0;
    goto LABEL_16;
  }
  v5 = objc_msgSend(a3, "length");
  v6 = (void *)MEMORY[0x22074FDF0]();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBD1A8], "objectEnumerator");
    v13 = (_HVNSStringEncodingEnumerator *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
  if (CStringPtr)
  {
    v8 = CStringPtr;
    v9 = (void *)MEMORY[0x22074FDF0]();
    v10 = objc_alloc(MEMORY[0x24BDBCE50]);
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = __70__NSString_HVNSString__hv_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_2;
    v28 = &unk_24DD7F3D8;
    v29 = a3;
    v11 = (void *)objc_msgSend(v10, "initWithBytesNoCopy:length:deallocator:", v8, v5, &v25);
    v34[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectEnumerator");
    v13 = (_HVNSStringEncodingEnumerator *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v9);
LABEL_15:
    objc_autoreleasePoolPop(v6);
    goto LABEL_16;
  }
  if (objc_msgSend(a3, "fastestEncoding") == 4)
  {
    v14 = (void *)MEMORY[0x22074FDF0]();
    objc_msgSend(a3, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v14);
    v16 = objc_msgSend(v15, "length");
    if (v16)
    {
      v17 = v16;
      nullByteData();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v15, "rangeOfData:options:range:", v18, 0, v17 - 1, 1);

      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        v20 = v17;
      else
        v20 = v17 - 1;
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
      v25 = MEMORY[0x24BDAC760];
      v26 = 3221225472;
      v27 = __70__NSString_HVNSString__hv_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_3;
      v28 = &unk_24DD7F400;
      v31 = 0;
      v32 = v20;
      v33 = v17;
      v22 = v21;
      v29 = v22;
      v30 = v15;
      objc_msgSend(v30, "enumerateByteRangesUsingBlock:", &v25);
      objc_msgSend(v22, "objectEnumerator");
      v13 = (_HVNSStringEncodingEnumerator *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBD1A8], "objectEnumerator");
      v13 = (_HVNSStringEncodingEnumerator *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_15;
  }
  objc_autoreleasePoolPop(v6);
  v13 = -[_HVNSStringEncodingEnumerator initWithString:encoding:nullTerminated:]([_HVNSStringEncodingEnumerator alloc], "initWithString:encoding:nullTerminated:", a3, 4, 0);
LABEL_16:
  v23 = -[HVHtmlParser initWithUTF8DataEnumerator:](self, "initWithUTF8DataEnumerator:", v13);

  return v23;
}

- (HVHtmlParser)initWithData:(id)a3 encoding:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HVHtmlParser *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 == 4 || a4 == 1)
  {
    v7 = (void *)MEMORY[0x22074FDF0]();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v7);
    v10 = -[HVHtmlParser initWithUTF8DataEnumerator:](self, "initWithUTF8DataEnumerator:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v6, a4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HVHtmlParser initWithString:](self, "initWithString:", v11);

  }
  return v10;
}

- (HVHtmlParser)initWithUTF8DataEnumerator:(id)a3
{
  id v4;
  HVHtmlParser *v5;
  HVHtmlParser *v6;
  uint64_t v7;
  NSMutableIndexSet *depthsWithActiveRegions;
  uint64_t v9;
  NSHashTable *activeRegions;
  uint64_t v11;
  NSMutableArray *activeRegionStartPositionStack;
  uint64_t v13;
  NSMutableArray *activeRegionIndexSetStack;
  uint64_t v15;
  NSMutableIndexSet *quotedRegions;
  uint64_t v17;
  NSMutableIndexSet *tabularRegions;
  uint64_t v19;
  NSMutableIndexSet *sigHtmlBlockRegions;
  uint64_t v21;
  NSMutableArray *mutablePlainTextLines;
  uint64_t v23;
  NSMutableData *currentLineData;
  uint64_t v25;
  NSMutableSet *appleAnchorHrefs;
  uint64_t v27;
  NSMutableIndexSet *hyperlinkDepths;
  uint64_t v29;
  NSMutableArray *partialHyperlinks;
  uint64_t v31;
  NSMutableArray *hyperlinkURLs;
  CFMutableArrayRef Mutable;
  NSMutableArray *hyperlinkRanges;
  id v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t quoteToEndFromPosition;
  uint64_t v41;
  NSArray *plainTextLines;
  NSMutableArray *v43;
  NSHashTable *v44;
  NSMutableArray *v45;
  NSMutableArray *v46;
  NSMutableData *v47;
  NSMutableIndexSet *v48;
  NSMutableArray *v49;
  void *v50;
  uint64_t *v51;
  NSMutableArray *v52;
  NSMutableArray *v53;
  void *v54;
  uint64_t v55;
  HVHtmlParser *v56;
  uint64_t *v57;
  uint64_t v58;
  NSArray *hyperlinks;
  objc_super v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  HVHtmlParser *v66;
  uint64_t *v67;
  uint64_t *v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  HVHtmlParser *v78;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)HVHtmlParser;
  v5 = -[HVHtmlParser init](&v61, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_depth = 0;
    v7 = objc_opt_new();
    depthsWithActiveRegions = v6->_depthsWithActiveRegions;
    v6->_depthsWithActiveRegions = (NSMutableIndexSet *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 2);
    activeRegions = v6->_activeRegions;
    v6->_activeRegions = (NSHashTable *)v9;

    v11 = objc_opt_new();
    activeRegionStartPositionStack = v6->_activeRegionStartPositionStack;
    v6->_activeRegionStartPositionStack = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    activeRegionIndexSetStack = v6->_activeRegionIndexSetStack;
    v6->_activeRegionIndexSetStack = (NSMutableArray *)v13;

    v6->_preBlockDepth = 0;
    v15 = objc_opt_new();
    quotedRegions = v6->_quotedRegions;
    v6->_quotedRegions = (NSMutableIndexSet *)v15;

    v17 = objc_opt_new();
    tabularRegions = v6->_tabularRegions;
    v6->_tabularRegions = (NSMutableIndexSet *)v17;

    v19 = objc_opt_new();
    sigHtmlBlockRegions = v6->_sigHtmlBlockRegions;
    v6->_sigHtmlBlockRegions = (NSMutableIndexSet *)v19;

    v21 = objc_opt_new();
    mutablePlainTextLines = v6->_mutablePlainTextLines;
    v6->_mutablePlainTextLines = (NSMutableArray *)v21;

    v6->_currentLineIsCollapsed = 1;
    v23 = objc_opt_new();
    currentLineData = v6->_currentLineData;
    v6->_currentLineData = (NSMutableData *)v23;

    v6->_renderingSuspended = 0;
    v6->_quoteToEndFromPosition = 0x7FFFFFFFFFFFFFFFLL;
    v6->_parserContext = 0;
    v25 = objc_opt_new();
    appleAnchorHrefs = v6->_appleAnchorHrefs;
    v6->_appleAnchorHrefs = (NSMutableSet *)v25;

    v27 = objc_opt_new();
    hyperlinkDepths = v6->_hyperlinkDepths;
    v6->_hyperlinkDepths = (NSMutableIndexSet *)v27;

    v29 = objc_opt_new();
    partialHyperlinks = v6->_partialHyperlinks;
    v6->_partialHyperlinks = (NSMutableArray *)v29;

    v31 = objc_opt_new();
    hyperlinkURLs = v6->_hyperlinkURLs;
    v6->_hyperlinkURLs = (NSMutableArray *)v31;

    Mutable = CFArrayCreateMutable(0, 0, 0);
    hyperlinkRanges = v6->_hyperlinkRanges;
    v6->_hyperlinkRanges = (NSMutableArray *)Mutable;

    -[HVHtmlParser _respawnParserContext](v6);
    v35 = v4;
    v36 = 0;
    v37 = 0;
    v74 = 0;
    v75 = (uint64_t)&v74;
    v76 = 0x2020000000;
    LODWORD(v77) = 0;
    v70 = 0;
    v71 = &v70;
    v72 = 0x2020000000;
    v73 = 0;
    while (1)
    {
      v38 = (void *)MEMORY[0x22074FDF0]();
      objc_msgSend(v35, "nextObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v38);

      if (!v39)
        break;
      v62 = MEMORY[0x24BDAC760];
      v63 = 3221225472;
      v64 = __43__HVHtmlParser__consumeHtmlDataEnumerator___block_invoke;
      v65 = &unk_24DD7F550;
      v66 = v6;
      v67 = &v74;
      v68 = &v70;
      v69 = v36;
      objc_msgSend(v39, "enumerateByteRangesUsingBlock:", &v62);
      v36 += objc_msgSend(v39, "length");
      v37 = v39;
    }
    if (v71[3] < v36)
    {
      v6->_chunkStart = "";
      v6->_chunkLength = 0;
      htmlParseChunk(v6->_parserContext, "", 0, 1);
    }
    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v74, 8);

    while (v6->_depth)
      -[HVHtmlParser _tagEnd]((uint64_t)v6);
    v6->_renderingSuspended = 0;
    -[HVHtmlParser _newBlock]((uint64_t)v6);
    quoteToEndFromPosition = v6->_quoteToEndFromPosition;
    if (quoteToEndFromPosition != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableIndexSet addIndexesInRange:](v6->_quotedRegions, "addIndexesInRange:", quoteToEndFromPosition, v6->_plainTextLinesTotalLength - quoteToEndFromPosition);
    -[NSMutableIndexSet removeIndex:](v6->_quotedRegions, "removeIndex:", v6->_plainTextLinesTotalLength - 1);
    -[NSMutableIndexSet removeIndex:](v6->_tabularRegions, "removeIndex:", v6->_plainTextLinesTotalLength - 1);
    -[NSMutableIndexSet removeIndex:](v6->_sigHtmlBlockRegions, "removeIndex:", v6->_plainTextLinesTotalLength - 1);
    MEMORY[0x22074FD6C](v6->_parserContext);
    v6->_parserContext = 0;
    v41 = -[NSMutableArray copy](v6->_mutablePlainTextLines, "copy");
    plainTextLines = v6->_plainTextLines;
    v6->_plainTextLines = (NSArray *)v41;

    v43 = v6->_mutablePlainTextLines;
    v6->_mutablePlainTextLines = 0;

    v44 = v6->_activeRegions;
    v6->_activeRegions = 0;

    v45 = v6->_activeRegionStartPositionStack;
    v6->_activeRegionStartPositionStack = 0;

    v46 = v6->_activeRegionIndexSetStack;
    v6->_activeRegionIndexSetStack = 0;

    v47 = v6->_currentLineData;
    v6->_currentLineData = 0;

    v48 = v6->_hyperlinkDepths;
    v6->_hyperlinkDepths = 0;

    v49 = v6->_partialHyperlinks;
    v6->_partialHyperlinks = 0;

    v50 = (void *)-[NSMutableArray copy](v6->_hyperlinkURLs, "copy");
    v51 = (uint64_t *)-[NSMutableArray copy](v6->_hyperlinkRanges, "copy");
    v52 = v6->_hyperlinkURLs;
    v6->_hyperlinkURLs = 0;

    v53 = v6->_hyperlinkRanges;
    v6->_hyperlinkRanges = 0;

    v54 = (void *)MEMORY[0x24BDBCE30];
    v55 = MEMORY[0x24BDAC760];
    v62 = MEMORY[0x24BDAC760];
    v63 = 3221225472;
    v64 = __30__HVHtmlParser__endProcessing__block_invoke;
    v65 = &unk_24DD7F500;
    v66 = v50;
    v67 = v51;
    v74 = v55;
    v75 = 3221225472;
    v76 = (uint64_t)__30__HVHtmlParser__endProcessing__block_invoke_2;
    v77 = &unk_24DD7F528;
    v78 = v66;
    v56 = v66;
    v57 = v51;
    objc_msgSend(v54, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", &v62, &v74);
    v58 = objc_claimAutoreleasedReturnValue();
    hyperlinks = v6->_hyperlinks;
    v6->_hyperlinks = (NSArray *)v58;

    pthread_mutex_init(&v6->_plainTextContentLock, 0);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_plainTextContentLock);
  v3.receiver = self;
  v3.super_class = (Class)HVHtmlParser;
  -[HVHtmlParser dealloc](&v3, sel_dealloc);
}

- (NSArray)textLines
{
  return self->_plainTextLines;
}

- (NSString)textContent
{
  _opaque_pthread_mutex_t *p_plainTextContentLock;
  NSString *v4;

  p_plainTextContentLock = &self->_plainTextContentLock;
  pthread_mutex_lock(&self->_plainTextContentLock);
  v4 = self->_plainTextContent;
  if (!v4)
  {
    -[NSArray _pas_proxyComponentsJoinedByString:](self->_plainTextLines, "_pas_proxyComponentsJoinedByString:", CFSTR("\n"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_plainTextContent, v4);
  }
  pthread_mutex_unlock(p_plainTextContentLock);
  return v4;
}

- (NSIndexSet)quotedRegions
{
  return (NSIndexSet *)self->_quotedRegions;
}

- (NSIndexSet)tabularRegions
{
  return (NSIndexSet *)self->_tabularRegions;
}

- (NSIndexSet)signatureRegions
{
  return (NSIndexSet *)self->_sigHtmlBlockRegions;
}

- (NSSet)appleAnchorHrefs
{
  return &self->_appleAnchorHrefs->super;
}

- (NSArray)hyperlinks
{
  return self->_hyperlinks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperlinks, 0);
  objc_storeStrong((id *)&self->_hyperlinkRanges, 0);
  objc_storeStrong((id *)&self->_hyperlinkURLs, 0);
  objc_storeStrong((id *)&self->_partialHyperlinks, 0);
  objc_storeStrong((id *)&self->_hyperlinkDepths, 0);
  objc_storeStrong((id *)&self->_appleAnchorHrefs, 0);
  objc_storeStrong((id *)&self->_activeRegionIndexSetStack, 0);
  objc_storeStrong((id *)&self->_activeRegionStartPositionStack, 0);
  objc_storeStrong((id *)&self->_activeRegions, 0);
  objc_storeStrong((id *)&self->_depthsWithActiveRegions, 0);
  objc_storeStrong((id *)&self->_sigHtmlBlockRegions, 0);
  objc_storeStrong((id *)&self->_tabularRegions, 0);
  objc_storeStrong((id *)&self->_quotedRegions, 0);
  objc_storeStrong((id *)&self->_currentLineData, 0);
  objc_storeStrong((id *)&self->_plainTextContent, 0);
  objc_storeStrong((id *)&self->_plainTextLines, 0);
  objc_storeStrong((id *)&self->_mutablePlainTextLines, 0);
}

- (uint64_t)_tagEnd
{
  uint64_t v1;
  void *v2;
  NSUInteger v3;
  NSRange v4;
  HVHtmlParserHyperlink *v5;
  void *v6;
  HVHtmlParserHyperlink *v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  NSRange v29;
  NSRange v30;

  v28 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    if (objc_msgSend(*(id *)(result + 240), "containsIndex:", *(_QWORD *)(result + 184)))
    {
      objc_msgSend(*(id *)(v1 + 248), "lastObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[HVHtmlParser _currentOutputLength](v1);
      v29.location = objc_msgSend(v2, "range");
      v30.location = v3;
      v30.length = 0;
      v4 = NSUnionRange(v29, v30);
      v5 = [HVHtmlParserHyperlink alloc];
      objc_msgSend(v2, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HVHtmlParserHyperlink initWithURL:range:](v5, "initWithURL:range:", v6, v4.location, v4.length);
      v8 = -[HVHtmlParserHyperlink range](v7, "range");
      if (HIDWORD(v8))
        v10 = 0;
      else
        v10 = HIDWORD(v9) == 0;
      if (v10)
      {
        CFArrayAppendValue(*(CFMutableArrayRef *)(v1 + 264), (const void *)(v8 | (v9 << 32)));
        v11 = *(void **)(v1 + 256);
        -[HVHtmlParserHyperlink url](v7, "url");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

      }
      objc_msgSend(*(id *)(v1 + 248), "removeLastObject");
      objc_msgSend(*(id *)(v1 + 240), "removeIndex:", *(_QWORD *)(v1 + 184));

    }
    result = objc_msgSend(*(id *)(v1 + 192), "containsIndex:", *(_QWORD *)(v1 + 184));
    if ((_DWORD)result)
    {
      objc_msgSend(*(id *)(v1 + 208), "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

      v15 = *(_QWORD *)(v1 + 112);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(*(id *)(v1 + 216), "lastObject", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v17)
      {
        v18 = v17;
        v19 = v15 - v14;
        v20 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v22, "addIndexesInRange:", v14, v19);
            objc_msgSend(*(id *)(v1 + 200), "removeObject:", v22);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v18);
      }

      objc_msgSend(*(id *)(v1 + 192), "removeIndex:", *(_QWORD *)(v1 + 184));
      objc_msgSend(*(id *)(v1 + 208), "removeLastObject");
      result = objc_msgSend(*(id *)(v1 + 216), "removeLastObject");
    }
    --*(_QWORD *)(v1 + 184);
  }
  return result;
}

- (void)_newBlock
{
  void *v2;
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 128), "length"))
    {
      v2 = (void *)MEMORY[0x22074FDF0]();
      v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", *(_QWORD *)(a1 + 128), 4);
      if (v3)
      {
        if (!*(_BYTE *)(a1 + 145))
        {
          v6 = v3;
          _PASCollapseWhitespaceAndStrip();
          v4 = objc_claimAutoreleasedReturnValue();

          v3 = (__CFString *)v4;
        }
        v7 = v3;
        if (-[__CFString length](v3, "length"))
          *(_BYTE *)(a1 + 120) = 0;
      }
      else
      {
        v7 = &stru_24DD7F8A8;
      }
      objc_autoreleasePoolPop(v2);
    }
    else
    {
      v7 = &stru_24DD7F8A8;
    }
    if (!*(_BYTE *)(a1 + 120))
    {
      objc_msgSend(*(id *)(a1 + 24), "addObject:", v7);
      v5 = *(_QWORD *)(a1 + 112) + -[__CFString length](v7, "length");
      *(_BYTE *)(a1 + 120) = 1;
      *(_QWORD *)(a1 + 112) = v5 + 1;
    }
    objc_msgSend(*(id *)(a1 + 128), "setLength:", 0);

  }
}

HVHtmlParserHyperlink *__30__HVHtmlParser__endProcessing__block_invoke(uint64_t a1, CFIndex a2)
{
  void *v4;
  unint64_t ValueAtIndex;
  HVHtmlParserHyperlink *v6;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ValueAtIndex = (unint64_t)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), a2);
  v6 = -[HVHtmlParserHyperlink initWithURL:range:]([HVHtmlParserHyperlink alloc], "initWithURL:range:", v4, ValueAtIndex, HIDWORD(ValueAtIndex));

  return v6;
}

uint64_t __30__HVHtmlParser__endProcessing__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "count");
}

- (uint64_t)_currentOutputLength
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 112);
  if (objc_msgSend(*(id *)(a1 + 128), "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "_pas_stringWithDataNoCopy:encoding:nullTerminated:", *(_QWORD *)(a1 + 128), 4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      if (!objc_msgSend(v3, "length") || *(_BYTE *)(a1 + 145))
      {
        v6 = v4;
      }
      else
      {
        v5 = objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1);
        _PASCollapseWhitespaceAndStrip();
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v2 += objc_msgSend(v6, "length");
        if (objc_msgSend(v6, "length")
          && objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v6, "length") - 1) != v5)
        {
          ++v2;
        }
      }
    }
    else
    {
      v6 = 0;
    }

  }
  return v2;
}

uint64_t __43__HVHtmlParser__consumeHtmlDataEnumerator___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    __asm { BR              X9 }
  return result;
}

- (_QWORD)_respawnParserContext
{
  _QWORD *v1;
  xmlParserCtxt *PushParserCtxt;

  if (user_data)
  {
    v1 = user_data;
    if (user_data[17])
      MEMORY[0x22074FD6C]();
    PushParserCtxt = htmlCreatePushParserCtxt(&unforwardSAXHandlerStruct, v1, 0, 0, 0, XML_CHAR_ENCODING_UTF8);
    v1[17] = PushParserCtxt;
    return (_QWORD *)htmlCtxtUseOptions(PushParserCtxt, 2164993);
  }
  return user_data;
}

- (void)_enterRegion:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 200), "containsObject:") & 1) == 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 192), "containsIndex:", *(_QWORD *)(a1 + 184)) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 192), "addIndex:", *(_QWORD *)(a1 + 184));
      v3 = *(void **)(a1 + 208);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 112));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v4);

      v5 = *(void **)(a1 + 216);
      v6 = (void *)objc_opt_new();
      objc_msgSend(v5, "addObject:", v6);

    }
    objc_msgSend(*(id *)(a1 + 200), "addObject:", v8);
    objc_msgSend(*(id *)(a1 + 216), "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

@end
