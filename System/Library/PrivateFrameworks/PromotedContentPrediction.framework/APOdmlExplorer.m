@implementation APOdmlExplorer

- (APOdmlExplorer)initWithRankableObjects:(id)a3 pttrArray:(id)a4 assetManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  APOdmlExplorer *v11;
  const char *v12;
  APOdmlExplorer *v13;
  uint64_t v14;
  NSMutableArray *sortableObjects;
  const char *v16;
  uint64_t v17;
  NSNumber *epsilon;
  const char *v19;
  uint64_t v20;
  NSString *mode;
  const char *v22;
  uint64_t v23;
  NSString *noise_type;
  const char *v25;
  uint64_t v26;
  NSNumber *clipping_bound;
  time_t v28;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)APOdmlExplorer;
  v11 = -[APOdmlExplorer init](&v30, sel_init);
  v13 = v11;
  if (v11)
  {
    objc_msgSend_sortableArray_pttrArray_(v11, v12, (uint64_t)v8, v9);
    v14 = objc_claimAutoreleasedReturnValue();
    sortableObjects = v13->_sortableObjects;
    v13->_sortableObjects = (NSMutableArray *)v14;

    objc_msgSend_doubleValueForFactor_(v10, v16, (uint64_t)CFSTR("EpsilonDP"));
    v17 = objc_claimAutoreleasedReturnValue();
    epsilon = v13->_epsilon;
    v13->_epsilon = (NSNumber *)v17;

    objc_msgSend_stringValueForFactor_(v10, v19, (uint64_t)CFSTR("ExploreMode"));
    v20 = objc_claimAutoreleasedReturnValue();
    mode = v13->_mode;
    v13->_mode = (NSString *)v20;

    objc_msgSend_stringValueForFactor_(v10, v22, (uint64_t)CFSTR("ExploreNoiseType"));
    v23 = objc_claimAutoreleasedReturnValue();
    noise_type = v13->_noise_type;
    v13->_noise_type = (NSString *)v23;

    objc_msgSend_doubleValueForFactor_(v10, v25, (uint64_t)CFSTR("ExploreClippingBound"));
    v26 = objc_claimAutoreleasedReturnValue();
    clipping_bound = v13->_clipping_bound;
    v13->_clipping_bound = (NSNumber *)v26;

    v28 = time(0);
    srand48(v28);
  }

  return v13;
}

- (id)sortableArray:(id)a3 pttrArray:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  APOdmlSortableObject *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v6, v10, v11))
  {
    v12 = 0;
    do
    {
      v13 = [APOdmlSortableObject alloc];
      objc_msgSend_objectAtIndexedSubscript_(v5, v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v6, v16, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend_initWithRankable_andPTTR_(v13, v18, (uint64_t)v15, v17);

      objc_msgSend_addObject_(v9, v20, (uint64_t)v19);
      ++v12;
    }
    while (v12 < objc_msgSend_count(v6, v21, v22));
  }

  return v9;
}

- (id)explore
{
  uint64_t v2;
  void *v4;
  const char *v5;
  int isEqualToString;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend_mode(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("greedy"));

  if (isEqualToString)
  {
    objc_msgSend_greedy(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_mode(self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("randomized-response"));

    if (v12)
    {
      objc_msgSend_randomizedResponse(self, v13, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      OdmlLogForCategory(5uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v20 = 138412290;
        v21 = (id)objc_opt_class();
        v16 = v21;
        _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_ERROR, "[%@] Exploration error: exploration type not found.", (uint8_t *)&v20, 0xCu);

      }
      objc_msgSend_rankableObjectsFromSortable(self, v17, v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v9;
}

- (id)randomizedResponse
{
  uint64_t v2;
  void *v4;
  double v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;

  objc_msgSend_cumulativeEpsilonGreedyProbabilityDistribution(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = drand48();
  if (objc_msgSend_count(v4, v6, v7))
  {
    v10 = 0;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v4, v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v11, v12, v13);
      v15 = v14;

      if (v5 < v15)
        break;
      if (++v10 >= (unint64_t)objc_msgSend_count(v4, v8, v9))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v10 = 0;
  }
  v16 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_sortableObjects(self, v8, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithArray_(v16, v18, (uint64_t)v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v19, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v19, v22, v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v19, v24, (uint64_t)v23, 0);

  objc_msgSend_setObject_atIndexedSubscript_(v19, v25, (uint64_t)v21, v10);
  objc_msgSend_setSortableObjects_(self, v26, (uint64_t)v19);
  objc_msgSend_rankableObjectsFromSortable(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)cumulativeEpsilonGreedyProbabilityDistribution
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;

  objc_msgSend_epsilonGreedyProbabilityDistribution(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_count(v3, v4, v5) >= 2)
  {
    v8 = 1;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v3, v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v9, v10, v11);
      v13 = v12;
      objc_msgSend_objectAtIndexedSubscript_(v3, v14, v8 - 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v15, v16, v17);
      v19 = v13 + v18;

      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v20, v21, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_atIndexedSubscript_(v3, v23, (uint64_t)v22, v8);

      ++v8;
    }
    while (v8 < objc_msgSend_count(v3, v24, v25));
  }
  v26 = (void *)objc_msgSend_copy(v3, v6, v7);

  return v26;
}

- (id)epsilonGreedyProbabilityDistribution
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  double v43;
  id v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  long double v57;
  double v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  unint64_t v67;
  double v68;
  double v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  long double v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  unint64_t v81;

  objc_msgSend_sortableObjects(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  objc_msgSend_sortableObjects(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shuffle(v10, v11, v12);

  objc_msgSend_sortableObjects(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pTTR(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sortableObjects(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_count(v23, v24, v25);

  v29 = 0;
  if (v26)
  {
    v30 = 0;
    do
    {
      objc_msgSend_sortableObjects(self, v27, v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v31, v32, v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pTTR(v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_doubleValue(v36, v37, v38);
      v40 = v39;
      objc_msgSend_doubleValue(v20, v41, v42);
      if (v40 > v43)
      {
        v44 = v36;

        v20 = v44;
        v29 = v30;
      }

      ++v30;
      objc_msgSend_sortableObjects(self, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend_count(v47, v48, v49);

    }
    while (v30 < v50);
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v27, v28);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_epsilon(self, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v54, v55, v56);
  v58 = exp(v57);

  objc_msgSend_sortableObjects(self, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend_count(v61, v62, v63);

  if (v64)
  {
    v67 = 0;
    v68 = v58 + (double)(unint64_t)(v7 - 1);
    do
    {
      v69 = 1.0;
      if (v29 == v67)
      {
        objc_msgSend_epsilon(self, v65, v66);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v70, v71, v72);
        v69 = exp(v73);

      }
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v65, v66, v69 / v68);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v51, v75, (uint64_t)v74);

      ++v67;
      objc_msgSend_sortableObjects(self, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend_count(v78, v79, v80);

    }
    while (v67 < v81);
  }

  return v51;
}

- (id)greedy
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_sortableObjects(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v5, (uint64_t)CFSTR("pTTR"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortUsingDescriptors_(v4, v9, (uint64_t)v8);

  objc_msgSend_rankableObjectsFromSortable(self, v10, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)rankableObjectsFromSortable
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_sortableObjects(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v5, v6, v7);
  objc_msgSend_arrayWithCapacity_(v4, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend_sortableObjects(self, v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v27, v31, 16);
  if (v15)
  {
    v18 = v15;
    v19 = *(_QWORD *)v28;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v13);
        objc_msgSend_rankable(*(void **)(*((_QWORD *)&v27 + 1) + 8 * v20), v16, v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v10, v22, (uint64_t)v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v27, v31, 16);
    }
    while (v18);
  }

  v25 = (void *)objc_msgSend_copy(v10, v23, v24);
  return v25;
}

- (NSMutableArray)sortableObjects
{
  return self->_sortableObjects;
}

- (void)setSortableObjects:(id)a3
{
  objc_storeStrong((id *)&self->_sortableObjects, a3);
}

- (NSNumber)epsilon
{
  return self->_epsilon;
}

- (NSString)mode
{
  return self->_mode;
}

- (NSString)noise_type
{
  return self->_noise_type;
}

- (NSNumber)clipping_bound
{
  return self->_clipping_bound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipping_bound, 0);
  objc_storeStrong((id *)&self->_noise_type, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_epsilon, 0);
  objc_storeStrong((id *)&self->_sortableObjects, 0);
}

@end
