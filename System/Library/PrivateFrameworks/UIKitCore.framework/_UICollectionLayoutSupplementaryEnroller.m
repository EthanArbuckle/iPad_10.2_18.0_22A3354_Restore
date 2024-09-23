@implementation _UICollectionLayoutSupplementaryEnroller

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kindEnrollmentsDict, 0);
  objc_storeStrong((id *)&self->_enrollmentsDict, 0);
  objc_storeStrong((id *)&self->_uncommittedEnrollmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_enrollmentIdentifiers, 0);
}

- (_UICollectionLayoutSupplementaryEnroller)init
{
  _UICollectionLayoutSupplementaryEnroller *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *enrollmentIdentifiers;
  NSMutableSet *v5;
  NSMutableSet *uncommittedEnrollmentIdentifiers;
  NSMutableDictionary *v7;
  NSMutableDictionary *enrollmentsDict;
  NSMutableDictionary *v9;
  NSMutableDictionary *kindEnrollmentsDict;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UICollectionLayoutSupplementaryEnroller;
  v2 = -[_UICollectionLayoutSupplementaryEnroller init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    enrollmentIdentifiers = v2->_enrollmentIdentifiers;
    v2->_enrollmentIdentifiers = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    uncommittedEnrollmentIdentifiers = v2->_uncommittedEnrollmentIdentifiers;
    v2->_uncommittedEnrollmentIdentifiers = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    enrollmentsDict = v2->_enrollmentsDict;
    v2->_enrollmentsDict = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    kindEnrollmentsDict = v2->_kindEnrollmentsDict;
    v2->_kindEnrollmentsDict = v9;

  }
  return v2;
}

- (uint64_t)commitEnrollment:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_commitEnrollment_, v3, CFSTR("_UICollectionLayoutSupplementaryEnroller.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enrollmentIdentifier"));

    }
    return objc_msgSend(*(id *)(v3 + 16), "removeObject:", a2);
  }
  return result;
}

- (uint64_t)pruneUncommittedEnrollments
{
  id *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (id *)result;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(result + 16);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          -[_UICollectionLayoutSupplementaryEnroller _removeEnrollmentWithIdentifier:](v1, *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

    return objc_msgSend(v1[2], "removeAllObjects", (_QWORD)v7);
  }
  return result;
}

- (uint64_t)kindIndexForEnrollmentIdentifier:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;

  v2 = a1;
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_kindIndexForEnrollmentIdentifier_, v2, CFSTR("_UICollectionLayoutSupplementaryEnroller.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enrollmentIdentifier"));

    }
    objc_msgSend(*(id *)(v2 + 24), "objectForKeyedSubscript:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      v6 = *(_QWORD *)(v4 + 8);
      v7 = *(id *)(v2 + 32);
      objc_msgSend(v7, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_kindIndexForEnrollmentIdentifier_, v2, CFSTR("_UICollectionLayoutSupplementaryEnroller.m"), 93, CFSTR("Failed to retrieve the kind enrollments."));

      }
      v2 = objc_msgSend(v8, "indexOfObject:", v5);

    }
    else
    {
      v2 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  return v2;
}

- (id)enrollSupplementaryForKind:(id *)a1
{
  _UICollectionLayoutSupplementaryEnrollment *v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  if (!a1)
    return 0;
  if (!objc_msgSend(a2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel_enrollSupplementaryForKind_, a1, CFSTR("_UICollectionLayoutSupplementaryEnroller.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

  }
  v4 = [_UICollectionLayoutSupplementaryEnrollment alloc];
  if (v4
    && (v19.receiver = v4,
        v19.super_class = (Class)_UICollectionLayoutSupplementaryEnrollment,
        (v5 = objc_msgSendSuper2(&v19, sel_init)) != 0))
  {
    v6 = v5;
    objc_storeStrong((id *)v5 + 1, a2);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v6[2];
    v6[2] = v7;

    v9 = 0;
    v10 = (void *)v6[2];
  }
  else
  {
    v6 = 0;
    v10 = 0;
    v9 = 1;
  }
  v11 = v10;
  objc_msgSend(a1[3], "setObject:forKeyedSubscript:", v6, v11);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__addEnrollmentToKindDict_, a1, CFSTR("_UICollectionLayoutSupplementaryEnroller.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enrollment"));

    v12 = 0;
  }
  else
  {
    v12 = (void *)v6[1];
  }
  v13 = v12;
  if (!objc_msgSend(v13, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__addEnrollmentToKindDict_, a1, CFSTR("_UICollectionLayoutSupplementaryEnroller.m"), 143, CFSTR("Fatal: enrollment has an empty kind."));

  }
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v14, v13);
  }
  objc_msgSend(v14, "addObject:", v6);

  objc_msgSend(a1[1], "addObject:", v11);
  objc_msgSend(a1[2], "addObject:", v11);

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_enrollmentsDict, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: %@ enrollments=%@; uncommittedEnrollments=%@>"),
    v5,
    self,
    v6,
    self->_kindEnrollmentsDict,
    self->_uncommittedEnrollmentIdentifiers);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)countForKind:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v7;

  v2 = a1;
  if (a1)
  {
    if (!objc_msgSend(a2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_countForKind_, v2, CFSTR("_UICollectionLayoutSupplementaryEnroller.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

    }
    objc_msgSend(*(id *)(v2 + 32), "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v2 = objc_msgSend(v4, "count");
    else
      v2 = 0;

  }
  return v2;
}

- (void)_removeEnrollmentWithIdentifier:(id *)a1
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__removeEnrollmentWithIdentifier_, a1, CFSTR("_UICollectionLayoutSupplementaryEnroller.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enrollmentIdentifier"));

    }
    objc_msgSend(a1[3], "objectForKeyedSubscript:", a2);
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__removeEnrollmentWithIdentifier_, a1, CFSTR("_UICollectionLayoutSupplementaryEnroller.m"), 157, CFSTR("Failed to retrieve enrollment."));

    }
    objc_msgSend(a1[3], "removeObjectForKey:", a2);
    objc_msgSend(a1[1], "removeObject:", a2);
    if (v10)
      v4 = v10[1];
    else
      v4 = 0;
    v5 = a1[4];
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__removeEnrollmentWithIdentifier_, a1, CFSTR("_UICollectionLayoutSupplementaryEnroller.m"), 165, CFSTR("Failed to find the enrollment kind set"));

    }
    objc_msgSend(v6, "removeObject:", v10);

  }
}

@end
