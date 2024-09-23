@implementation pidMapper

- (pidMapper)initWithCtx:(id)a3
{
  id v4;
  pidMapper *v5;
  NSMutableArray *v6;
  NSMutableArray *colTableArr;
  id *p_colTableArr;
  colOffsetMap *v9;
  NSMutableArray *v10;
  NSMutableArray *pidMap;
  fullPropSpec *v12;
  fullPropSpec *v13;
  fullPropSpec *v14;
  uint64_t v15;
  void *v16;
  fullPropSpec *v17;
  uint64_t v18;
  NSMutableArray *columnSet;
  unint64_t v20;
  NSMutableArray *v21;
  void *v22;
  uint64_t v23;
  cTableColumn *v24;
  fullPropSpec *v25;
  cTableColumn *v26;
  fullPropSpec *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  pidMapper *v34;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  _BOOL8 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BOOL8 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  cTableColumn *v71;
  objc_super v72;

  v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)pidMapper;
  v5 = -[pidMapper init](&v72, sel_init);
  if (!v5)
  {
    v16 = 0;
    v12 = 0;
    v17 = 0;
    v9 = 0;
    v13 = 0;
    goto LABEL_44;
  }
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  p_colTableArr = (id *)&v5->_colTableArr;
  colTableArr = v5->_colTableArr;
  v5->_colTableArr = v6;

  if (!v5->_colTableArr)
  {

    v16 = 0;
    v12 = 0;
    v17 = 0;
    v9 = 0;
LABEL_42:
    v13 = 0;
LABEL_43:
    v5 = 0;
    goto LABEL_44;
  }
  v9 = -[colOffsetMap initWithCtx:]([colOffsetMap alloc], "initWithCtx:", v4);
  if (!v9
    || (v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]),
        pidMap = v5->_pidMap,
        v5->_pidMap = v10,
        pidMap,
        !v5->_pidMap))
  {

    v16 = 0;
    v12 = 0;
LABEL_41:
    v17 = 0;
    goto LABEL_42;
  }
  v12 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 0);
  if (!v12)
    goto LABEL_40;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v12);
  v13 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 1);

  if (!v13)
    goto LABEL_48;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v13);
  v12 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 2);

  if (!v12)
    goto LABEL_40;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v12);
  v13 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 3);

  if (!v13)
    goto LABEL_48;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v13);
  v12 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 22);

  if (!v12)
    goto LABEL_40;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v12);
  v13 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 5);

  if (!v13)
    goto LABEL_48;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v13);
  v12 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 6);

  if (!v12)
    goto LABEL_40;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v12);
  v13 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 23);

  if (!v13)
    goto LABEL_48;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v13);
  v12 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 21);

  if (!v12)
    goto LABEL_40;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v12);
  v13 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 8);

  if (!v13)
  {
LABEL_48:

    v16 = 0;
    v12 = 0;
LABEL_49:
    v17 = 0;
    goto LABEL_43;
  }
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v13);
  if (objc_msgSend(v4, "queryType") == 1)
  {
    v14 = [fullPropSpec alloc];
    v15 = 9;
  }
  else
  {
    if (objc_msgSend(v4, "queryType") != 4)
      goto LABEL_24;
    v14 = [fullPropSpec alloc];
    v15 = 24;
  }
  v12 = -[fullPropSpec initWithPropertyNumber:](v14, "initWithPropertyNumber:", v15);

  if (!v12)
  {
LABEL_40:

    v16 = 0;
    goto LABEL_41;
  }
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v12);
  v13 = v12;
LABEL_24:
  v12 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 10);

  if (!v12)
    goto LABEL_40;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v12);
  v13 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 11);

  if (!v13)
    goto LABEL_48;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v13);
  v12 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 12);

  if (!v12)
    goto LABEL_40;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v12);
  v13 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 13);

  if (!v13)
    goto LABEL_48;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v13);
  v12 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 14);

  if (!v12)
    goto LABEL_40;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v12);
  v17 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 15);

  if (!v17)
  {

    v16 = 0;
    v12 = 0;
    goto LABEL_42;
  }
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v17);
  v13 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 16);

  if (!v13)
    goto LABEL_48;
  -[NSMutableArray addObject:](v5->_pidMap, "addObject:", v13);
  v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](v5->_pidMap, "count"));
  columnSet = v5->_columnSet;
  v5->_columnSet = (NSMutableArray *)v18;

  if (!v5->_columnSet)
  {
    v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v36)
      -[pidMapper initWithCtx:].cold.1(v36, v37, v38, v39, v40, v41, v42, v43);
    goto LABEL_48;
  }
  if (-[NSMutableArray count](v5->_pidMap, "count"))
  {
    v20 = 0;
    do
    {
      v21 = v5->_columnSet;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v21, "addObject:", v22);

      v20 = (v20 + 1);
    }
    while (-[NSMutableArray count](v5->_pidMap, "count") > v20);
  }
  v69 = -[NSMutableArray count](v5->_pidMap, "count");
  if ((_DWORD)v69)
  {
    v23 = 0;
    v24 = 0;
    v12 = 0;
    v70 = v69;
    while (1)
    {
      v25 = v12;
      v26 = v24;
      v27 = v13;
      -[NSMutableArray objectAtIndex:](v5->_columnSet, "objectAtIndex:", v23, v69);
      v12 = (fullPropSpec *)objc_claimAutoreleasedReturnValue();

      -[NSMutableArray objectAtIndex:](v5->_pidMap, "objectAtIndex:", -[fullPropSpec integerValue](v12, "integerValue"));
      v13 = (fullPropSpec *)objc_claimAutoreleasedReturnValue();

      v24 = -[cTableColumn initWithPropertyNumber:WspCtx:]([cTableColumn alloc], "initWithPropertyNumber:WspCtx:", -[fullPropSpec propNumber](v13, "propNumber"), v4);
      if (!v24)
        break;
      -[colOffsetMap statusOffsets](v9, "statusOffsets");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", v23);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[cTableColumn setStatusOffset:](v24, "setStatusOffset:", (unsigned __int16)objc_msgSend(v29, "integerValue"));

      -[colOffsetMap lengthOffsets](v9, "lengthOffsets");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", v23);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[cTableColumn setLengthOffset:](v24, "setLengthOffset:", (unsigned __int16)objc_msgSend(v31, "integerValue"));

      -[colOffsetMap valueOffsets](v9, "valueOffsets");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", v23);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[cTableColumn setValueOffset:](v24, "setValueOffset:", (unsigned __int16)objc_msgSend(v33, "integerValue"));

      objc_msgSend(*p_colTableArr, "addObject:", v24);
      if (v70 == ++v23)
      {

        goto LABEL_51;
      }
    }
    v51 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v51)
      -[pidMapper initWithCtx:].cold.4(v51, v52, v53, v54, v55, v56, v57, v58);
    goto LABEL_60;
  }
  v12 = 0;
LABEL_51:
  v71 = -[cTableColumn initWithPropertyNumber:WspCtx:]([cTableColumn alloc], "initWithPropertyNumber:WspCtx:", 20, v4);
  if (!v71)
  {
    v59 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v59)
      -[pidMapper initWithCtx:].cold.2(v59, v60, v61, v62, v63, v64, v65, v66);
LABEL_60:

    v16 = 0;
    goto LABEL_49;
  }
  -[colOffsetMap statusOffsets](v9, "statusOffsets");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectAtIndex:", v69);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[cTableColumn setStatusOffset:](v71, "setStatusOffset:", (unsigned __int16)objc_msgSend(v45, "integerValue"));

  -[colOffsetMap lengthOffsets](v9, "lengthOffsets");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectAtIndex:", v69);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[cTableColumn setLengthOffset:](v71, "setLengthOffset:", (unsigned __int16)objc_msgSend(v47, "integerValue"));

  -[colOffsetMap valueOffsets](v9, "valueOffsets");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectAtIndex:", v69);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[cTableColumn setValueOffset:](v71, "setValueOffset:", (unsigned __int16)objc_msgSend(v49, "integerValue"));

  -[cTableColumn setLengthUsed:](v71, "setLengthUsed:", 0);
  objc_msgSend(*p_colTableArr, "addObject:", v71);
  v50 = (v69 + 1);
  if (objc_msgSend(*p_colTableArr, "count") >= v50)
  {
    -[colOffsetMap valueOffsets](v9, "valueOffsets");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "objectAtIndex:", v50);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_rowLength = objc_msgSend(v16, "unsignedIntValue");
    if (objc_msgSend(v4, "serverSupports64BitOffsets"))
      v68 = 24;
    else
      v68 = 16;
    v5->_colValueLen = v68;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[pidMapper initWithCtx:].cold.3((id *)&v5->_colTableArr, v50);

    v16 = 0;
    v5 = 0;
  }
  v17 = (fullPropSpec *)v71;
LABEL_44:
  v34 = v5;

  return v34;
}

- (NSMutableArray)pidMap
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPidMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)columnSet
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setColumnSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)rowLength
{
  return self->_rowLength;
}

- (void)setRowLength:(unsigned int)a3
{
  self->_rowLength = a3;
}

- (unsigned)colValueLen
{
  return self->_colValueLen;
}

- (void)setColValueLen:(unsigned int)a3
{
  self->_colValueLen = a3;
}

- (NSMutableArray)colTableArr
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setColTableArr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colTableArr, 0);
  objc_storeStrong((id *)&self->_columnSet, 0);
  objc_storeStrong((id *)&self->_pidMap, 0);
}

- (void)initWithCtx:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "pidMapper:init: no memory for columnSet\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "pidMapper:init: no memory for Query column\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(id *)a1 .cold.3(id *a1, int a2)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*a1, "count");
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 2048;
  v6 = v3;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "pidMapper:init: columns: %u exceed offsetMap size: %lu\n", (uint8_t *)v4, 0x12u);
}

- (void)initWithCtx:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "pidMapper:init: no memory for a cTableColumn\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
