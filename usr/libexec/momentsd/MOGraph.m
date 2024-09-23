@implementation MOGraph

- (MOGraph)initWithNumVertices:(unint64_t)a3 edges:(id)a4
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  unint64_t v22;
  MOGraph *v23;
  MOGraph *v24;
  NSMutableArray *v25;
  NSMutableArray *membership;
  NSMutableDictionary *v27;
  NSMutableDictionary *sparseAdjacencyMatrix;
  unint64_t v29;
  id v30;
  NSMutableDictionary *v31;
  void *v32;
  MOGraph *v33;
  id os_log;
  NSObject *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  SEL v39;
  MOGraph *v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  objc_super v53;

  v8 = a4;
  v9 = v8;
  if (!a3)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[MOGraph initWithNumVertices:edges:].cold.1();

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v37 = v36;
    v38 = CFSTR("Invalid parameter not satisfying: numVertices > 0");
    v39 = a2;
    v40 = self;
    v41 = 18;
    goto LABEL_23;
  }
  if (!v8)
  {
    v42 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      -[MOGraph initWithNumVertices:edges:].cold.2();

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v37 = v36;
    v38 = CFSTR("Invalid parameter not satisfying: edges");
    v39 = a2;
    v40 = self;
    v41 = 19;
LABEL_23:
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v39, v40, CFSTR("MOGraph.m"), v41, v38);

    v33 = 0;
    goto LABEL_24;
  }
  if (objc_msgSend(v8, "count"))
  {
    v10 = 0;
    while (1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
      v13 = objc_msgSend(v12, "intValue");

      if ((v13 & 0x80000000) != 0)
        break;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v10));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
      v16 = (int)objc_msgSend(v15, "intValue");

      if (v16 >= a3)
      {
        v47 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          -[MOGraph initWithNumVertices:edges:].cold.5();

        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v37 = v36;
        v38 = CFSTR("Invalid parameter not satisfying: edges[i][0].intValue < numVertices");
        v39 = a2;
        v40 = self;
        v41 = 22;
        goto LABEL_23;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v10));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 1));
      v19 = objc_msgSend(v18, "intValue");

      if ((v19 & 0x80000000) != 0)
      {
        v49 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          -[MOGraph initWithNumVertices:edges:].cold.4();

        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v37 = v36;
        v38 = CFSTR("Invalid parameter not satisfying: edges[i][1].intValue >= 0");
        v39 = a2;
        v40 = self;
        v41 = 23;
        goto LABEL_23;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v10));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", 1));
      v22 = (int)objc_msgSend(v21, "intValue");

      if (v22 >= a3)
      {
        v51 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        v52 = objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          -[MOGraph initWithNumVertices:edges:].cold.3();

        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v37 = v36;
        v38 = CFSTR("Invalid parameter not satisfying: edges[i][1].intValue < numVertices");
        v39 = a2;
        v40 = self;
        v41 = 24;
        goto LABEL_23;
      }
      if ((unint64_t)objc_msgSend(v9, "count") <= ++v10)
        goto LABEL_10;
    }
    v45 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      -[MOGraph initWithNumVertices:edges:].cold.6();

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v37 = v36;
    v38 = CFSTR("Invalid parameter not satisfying: edges[i][0].intValue >= 0");
    v39 = a2;
    v40 = self;
    v41 = 21;
    goto LABEL_23;
  }
LABEL_10:
  v53.receiver = self;
  v53.super_class = (Class)MOGraph;
  v23 = -[MOGraph init](&v53, "init");
  v24 = v23;
  if (v23)
  {
    v23->_numVertices = a3;
    objc_storeStrong((id *)&v23->_edges, a4);
    v25 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    membership = v24->_membership;
    v24->_membership = v25;

    do
    {
      -[NSMutableArray addObject:](v24->_membership, "addObject:", &off_1002D81C8);
      --a3;
    }
    while (a3);
    v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sparseAdjacencyMatrix = v24->_sparseAdjacencyMatrix;
    v24->_sparseAdjacencyMatrix = v27;

    if (v24->_numVertices)
    {
      v29 = 0;
      do
      {
        v30 = objc_alloc_init((Class)NSMutableArray);
        v31 = v24->_sparseAdjacencyMatrix;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v29));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v30, v32);

        ++v29;
      }
      while (v24->_numVertices > v29);
    }
  }
  self = v24;
  v33 = self;
LABEL_24:

  return v33;
}

- (id)calculateConnectedComponentWithGraphTraversal:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;

  if (-[NSArray count](self->_edges, "count"))
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_edges, "objectAtIndexedSubscript:", v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_edges, "objectAtIndexedSubscript:", v5));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sparseAdjacencyMatrix, "objectForKeyedSubscript:", v7));
      objc_msgSend(v10, "addObject:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sparseAdjacencyMatrix, "objectForKeyedSubscript:", v9));
      objc_msgSend(v11, "addObject:", v7);

      ++v5;
    }
    while (-[NSArray count](self->_edges, "count") > v5);
  }
  if (self->_numVertices)
  {
    v12 = 0;
    v13 = 1;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_membership, "objectAtIndexedSubscript:", v12));
      v15 = objc_msgSend(v14, "isEqual:", &off_1002D81C8);

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v13));
        if (a3 == 1)
          -[MOGraph bfsStartingFrom:connectedPartIndx:](self, "bfsStartingFrom:connectedPartIndx:", v16, v17);
        else
          -[MOGraph dfsStartingFrom:connectedPartIndx:](self, "dfsStartingFrom:connectedPartIndx:", v16, v17);

        v13 = (v13 + 1);
      }
      ++v12;
    }
    while (self->_numVertices > v12);
  }
  return self->_membership;
}

- (void)dfsStartingFrom:(id)a3 connectedPartIndx:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_membership, "objectAtIndexedSubscript:", (int)objc_msgSend(v6, "intValue")));
  v9 = objc_msgSend(v8, "isEqual:", &off_1002D81C8);

  if (v9)
  {
    -[NSMutableArray setObject:atIndexedSubscript:](self->_membership, "setObject:atIndexedSubscript:", v7, (int)objc_msgSend(v6, "intValue"));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sparseAdjacencyMatrix, "objectForKeyedSubscript:", v6, 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          -[MOGraph dfsStartingFrom:connectedPartIndx:](self, "dfsStartingFrom:connectedPartIndx:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), v7);
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (void)bfsStartingFrom:(id)a3 connectedPartIndx:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  char *v10;
  char *v11;
  char *i;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v22 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_membership, "objectAtIndexedSubscript:", (int)objc_msgSend(v6, "intValue")));
  v8 = objc_msgSend(v7, "isEqual:", &off_1002D81C8);

  if (v8)
  {
    v9 = objc_alloc_init((Class)NSMutableArray);
    v21 = v6;
    objc_msgSend(v9, "enqueue:", v6);
    while (objc_msgSend(v9, "count"))
    {
      v10 = (char *)objc_msgSend(v9, "count");
      if (v10)
      {
        v11 = v10;
        for (i = 0; i != v11; ++i)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeue"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_membership, "objectAtIndexedSubscript:", (int)objc_msgSend(v13, "intValue")));
          v15 = objc_msgSend(v14, "isEqual:", &off_1002D81C8);

          if (v15)
          {
            -[NSMutableArray setObject:atIndexedSubscript:](self->_membership, "setObject:atIndexedSubscript:", v22, (int)objc_msgSend(v13, "intValue"));
            v25 = 0u;
            v26 = 0u;
            v23 = 0u;
            v24 = 0u;
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sparseAdjacencyMatrix, "objectForKeyedSubscript:", v13));
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v24;
              do
              {
                v20 = 0;
                do
                {
                  if (*(_QWORD *)v24 != v19)
                    objc_enumerationMutation(v16);
                  objc_msgSend(v9, "enqueue:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v20));
                  v20 = (char *)v20 + 1;
                }
                while (v18 != v20);
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
              }
              while (v18);
            }

          }
        }
      }
    }

    v6 = v21;
  }

}

- (unint64_t)numVertices
{
  return self->_numVertices;
}

- (void)setNumVertices:(unint64_t)a3
{
  self->_numVertices = a3;
}

- (NSArray)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
  objc_storeStrong((id *)&self->_edges, a3);
}

- (NSMutableArray)membership
{
  return self->_membership;
}

- (void)setMembership:(id)a3
{
  objc_storeStrong((id *)&self->_membership, a3);
}

- (NSMutableDictionary)sparseAdjacencyMatrix
{
  return self->_sparseAdjacencyMatrix;
}

- (void)setSparseAdjacencyMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_sparseAdjacencyMatrix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sparseAdjacencyMatrix, 0);
  objc_storeStrong((id *)&self->_membership, 0);
  objc_storeStrong((id *)&self->_edges, 0);
}

- (void)initWithNumVertices:edges:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: numVertices > 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithNumVertices:edges:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: edges", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithNumVertices:edges:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: edges[i][1].intValue < numVertices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithNumVertices:edges:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: edges[i][1].intValue >= 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithNumVertices:edges:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: edges[i][0].intValue < numVertices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithNumVertices:edges:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: edges[i][0].intValue >= 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

@end
