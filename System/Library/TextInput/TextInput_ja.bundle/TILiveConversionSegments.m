@implementation TILiveConversionSegments

- (TILiveConversionSegments)initWithSegments:(id)a3 at:(unint64_t)a4
{
  id v6;
  TILiveConversionSegments *v7;
  uint64_t v8;
  NSMutableArray *rawSegments;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TILiveConversionSegments;
  v7 = -[TILiveConversionSegments init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "mutableCopy");
    rawSegments = v7->_rawSegments;
    v7->_rawSegments = (NSMutableArray *)v8;

    v7->_index = a4;
    -[TILiveConversionSegments buildMarkedText](v7, "buildMarkedText");
  }

  return v7;
}

- (void)clear
{
  NSMutableArray *v3;
  NSMutableArray *rawSegments;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  rawSegments = self->_rawSegments;
  self->_rawSegments = v3;

  self->_index = 0x7FFFFFFFFFFFFFFFLL;
  -[TILiveConversionSegments buildMarkedText](self, "buildMarkedText");
}

- (void)commit
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *rawSegments;
  void *v13;
  id v14;

  -[TILiveConversionSegments currentCandidate](self, "currentCandidate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[TILiveConversionSegments index](self, "index");
    v6 = -[NSMutableArray count](self->_rawSegments, "count");

    if (v5 < v6)
    {
      v14 = objc_alloc_init(MEMORY[0x24BEB5410]);
      -[TILiveConversionSegments currentCandidate](self, "currentCandidate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSurface:", v8);

      -[TILiveConversionSegments currentCandidate](self, "currentCandidate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "input");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setReading:", v10);

      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_rawSegments, "replaceObjectAtIndex:withObject:", -[TILiveConversionSegments index](self, "index"), v14);
      -[TILiveConversionSegments currentSegment](self, "currentSegment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        rawSegments = self->_rawSegments;
        -[TILiveConversionSegments currentSegment](self, "currentSegment");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray insertObject:atIndex:](rawSegments, "insertObject:atIndex:", v13, -[TILiveConversionSegments index](self, "index") + 1);

      }
      -[TILiveConversionSegments setCurrentCandidate:](self, "setCurrentCandidate:", 0);
      -[TILiveConversionSegments setCurrentSegment:](self, "setCurrentSegment:", 0);
      -[TILiveConversionSegments buildMarkedText](self, "buildMarkedText");

    }
  }
}

- (BOOL)canMove:(BOOL)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  BOOL v9;

  if (!a3)
    return -[TILiveConversionSegments index](self, "index") != 0;
  -[TILiveConversionSegments currentSegment](self, "currentSegment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[TILiveConversionSegments index](self, "index");
  -[TILiveConversionSegments rawSegments](self, "rawSegments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v4)
    v8 = v5 >= v7;
  else
    v8 = v5 >= v7 - 1;
  v9 = !v8;

  return v9;
}

- (void)move:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  v5 = -[TILiveConversionSegments index](self, "index");
  v6 = v5 - 1;
  if (v3)
    v6 = v5 + 1;
  self->_index = v6;
  -[TILiveConversionSegments buildMarkedText](self, "buildMarkedText");
}

- (void)didUpdateCandidate:(id)a3 with:(id)a4
{
  id v6;

  v6 = a4;
  -[TILiveConversionSegments setCurrentCandidate:](self, "setCurrentCandidate:", a3);
  -[TILiveConversionSegments setCurrentSegment:](self, "setCurrentSegment:", v6);

  -[TILiveConversionSegments buildMarkedText](self, "buildMarkedText");
}

- (BOOL)didAccept
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[TILiveConversionSegments rawSegments](self, "rawSegments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsInRange:", 0, -[TILiveConversionSegments index](self, "index") + 1);

  -[TILiveConversionSegments currentSegment](self, "currentSegment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TILiveConversionSegments rawSegments](self, "rawSegments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILiveConversionSegments currentSegment](self, "currentSegment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertObject:atIndex:", v6, 0);

  }
  -[TILiveConversionSegments setCurrentCandidate:](self, "setCurrentCandidate:", 0);
  -[TILiveConversionSegments setCurrentSegment:](self, "setCurrentSegment:", 0);
  -[TILiveConversionSegments rawSegments](self, "rawSegments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[TILiveConversionSegments setIndex:](self, "setIndex:", 0);
    -[TILiveConversionSegments buildMarkedText](self, "buildMarkedText");
  }
  return v8 != 0;
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  void *v5;
  _QWORD v6[7];
  _QWORD v7[4];

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  -[TILiveConversionSegments rawSegments](self, "rawSegments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__TILiveConversionSegments_setPhraseBoundary___block_invoke;
  v6[3] = &unk_250122998;
  v6[5] = v7;
  v6[6] = a3;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  -[TILiveConversionSegments buildMarkedText](self, "buildMarkedText");
  _Block_object_dispose(v7, 8);
}

void __46__TILiveConversionSegments_setPhraseBoundary___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;

  objc_msgSend(a2, "surface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v7, "length");

  if (*(_QWORD *)(a1 + 48) <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIndex:", a3);
    *a4 = 1;
  }
}

- (void)buildMarkedText
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  id v50;
  id v51;
  unsigned int v52;

  v51 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v50 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILiveConversionSegments rawSegments](self, "rawSegments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v52 = 0;
    v8 = 0;
    v9 = 0x24BDD1000uLL;
    while (1)
    {
      -[TILiveConversionSegments rawSegments](self, "rawSegments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 == -[TILiveConversionSegments index](self, "index")
        && (-[TILiveConversionSegments currentCandidate](self, "currentCandidate"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v12,
            v12))
      {
        -[TILiveConversionSegments currentCandidate](self, "currentCandidate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "input");
        v14 = v4;
        v15 = v3;
        v16 = v9;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "appendString:", v17);

        -[TILiveConversionSegments currentCandidate](self, "currentCandidate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "label");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appendString:", v19);

        -[TILiveConversionSegments currentCandidate](self, "currentCandidate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "label");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v52 += objc_msgSend(v21, "length");

        -[TILiveConversionSegments currentCandidate](self, "currentCandidate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "label");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

        v9 = v16;
        objc_msgSend(*(id *)(v16 + 2408), "valueWithRange:", v8, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v25);

        -[TILiveConversionSegments currentCandidate](self, "currentCandidate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "label");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v8 += objc_msgSend(v27, "length");

        -[TILiveConversionSegments currentSegment](self, "currentSegment");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          v3 = v15;
          v4 = v14;
          goto LABEL_13;
        }
        -[TILiveConversionSegments currentSegment](self, "currentSegment");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "reading");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "appendString:", v30);

        -[TILiveConversionSegments currentSegment](self, "currentSegment");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "surface");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appendString:", v32);

        -[TILiveConversionSegments currentSegment](self, "currentSegment");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "surface");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "length");

        v36 = v35;
        v9 = v16;
        objc_msgSend(*(id *)(v16 + 2408), "valueWithRange:", v8, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v37);

        -[TILiveConversionSegments currentSegment](self, "currentSegment");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "surface");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v8 += objc_msgSend(v39, "length");

        v3 = v15;
        v4 = v14;
      }
      else
      {
        objc_msgSend(v11, "reading");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "appendString:", v40);

        objc_msgSend(v11, "surface");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v41);

        if (-[TILiveConversionSegments index](self, "index") >= v7)
        {
          objc_msgSend(v11, "surface");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v52 += objc_msgSend(v42, "length");

        }
        if (-[TILiveConversionSegments index](self, "index") > v7)
        {
          objc_msgSend(v11, "surface");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "appendString:", v43);

        }
        objc_msgSend(v11, "surface");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "length");

        objc_msgSend(*(id *)(v9 + 2408), "valueWithRange:", v8, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v46);

        objc_msgSend(v11, "surface");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v8 += objc_msgSend(v38, "length");
      }

LABEL_13:
      ++v7;
      -[TILiveConversionSegments rawSegments](self, "rawSegments");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");

      if (v48 <= v7)
        goto LABEL_17;
    }
  }
  v52 = 0;
LABEL_17:
  -[TILiveConversionSegments setRawInputString:](self, "setRawInputString:", v51);
  -[TILiveConversionSegments setInputString:](self, "setInputString:", v3);
  -[TILiveConversionSegments setInputIndex:](self, "setInputIndex:", v52);
  -[TILiveConversionSegments setAutoCommitString:](self, "setAutoCommitString:", v50);
  v49 = (void *)objc_msgSend(v4, "copy");
  -[TILiveConversionSegments setSegmentRanges:](self, "setSegmentRanges:", v49);

}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (unsigned)inputIndex
{
  return self->_inputIndex;
}

- (void)setInputIndex:(unsigned int)a3
{
  self->_inputIndex = a3;
}

- (NSString)rawInputString
{
  return self->_rawInputString;
}

- (void)setRawInputString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)inputString
{
  return self->_inputString;
}

- (void)setInputString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)autoCommitString
{
  return self->_autoCommitString;
}

- (void)setAutoCommitString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)segmentRanges
{
  return self->_segmentRanges;
}

- (void)setSegmentRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (TIKeyboardCandidate)currentCandidate
{
  return self->_currentCandidate;
}

- (void)setCurrentCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (TIMecabraSegment)currentSegment
{
  return self->_currentSegment;
}

- (void)setCurrentSegment:(id)a3
{
  objc_storeStrong((id *)&self->_currentSegment, a3);
}

- (NSMutableArray)rawSegments
{
  return self->_rawSegments;
}

- (void)setRawSegments:(id)a3
{
  objc_storeStrong((id *)&self->_rawSegments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSegments, 0);
  objc_storeStrong((id *)&self->_currentSegment, 0);
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_segmentRanges, 0);
  objc_storeStrong((id *)&self->_autoCommitString, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
  objc_storeStrong((id *)&self->_rawInputString, 0);
}

@end
