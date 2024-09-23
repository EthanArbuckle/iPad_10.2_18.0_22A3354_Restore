@implementation TypistCandidateBar

- (TypistCandidateBar)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TypistCandidateBar;
  return -[TypistCandidateBar init](&v3, sel_init);
}

- (id)candidateUIInformation:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("UnsupportedMethodInBaseClassException"), CFSTR("Method should not be called from this class. This should be called from a subclass of this object."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

+ (TypistCandidateBar)initWithTypistKeyboard:(id)a3
{
  int v3;
  __objc2_class **v4;

  v3 = objc_msgSend(a3, "usesMecabraCandidateBar");
  v4 = off_251A7C130;
  if (!v3)
    v4 = off_251A7C128;
  return (TypistCandidateBar *)objc_alloc_init(*v4);
}

- (BOOL)hasCandidates
{
  void *v2;
  BOOL v3;

  -[TypistCandidateBar getVisibleCandidates](self, "getVisibleCandidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasCandidate:(id)a3
{
  return -[TypistCandidateBar getIndexOfCandidate:](self, "getIndexOfCandidate:", a3) != -1;
}

- (BOOL)hasCandidate:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  BOOL v8;

  length = a4.length;
  location = a4.location;
  v6 = -[TypistCandidateBar getIndexOfCandidate:](self, "getIndexOfCandidate:", a3);
  v8 = v6 >= location && v6 - location < length;
  return v6 >= 0 && v8;
}

- (BOOL)hasCandidates:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    v9 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v7 = -[TypistCandidateBar hasCandidate:](self, "hasCandidate:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)) & (v9 | v7);
        v9 = 0;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v9 = 0;
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)hasCandidates:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  length = a4.length;
  location = a4.location;
  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    v12 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v10 = -[TypistCandidateBar hasCandidate:inRange:](self, "hasCandidate:inRange:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), location, length) & (v12 | v10);
        v12 = 0;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v12 = 0;
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (int64_t)getIndexOfCandidate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("UnsupportedMethodInBaseClassException"), CFSTR("Method should not be called from this class. This should be called from a subclass of this object."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

+ (id)candidatesAsStringArray:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = (id)objc_opt_new();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__TypistCandidateBar_candidatesAsStringArray___block_invoke;
  v6[3] = &unk_251A7D3B8;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__TypistCandidateBar_candidatesAsStringArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  objc_msgSend(a2, "candidate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:atIndexedSubscript:", v5, a3);

}

- (BOOL)hasVisibleCandidate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("UnsupportedMethodInBaseClassException"), CFSTR("Method should not be called from this class. This should be called from a subclass of this object."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)getAllCandidates
{
  void *v2;
  void *v3;
  id v4;

  -[objc_class getAllCandidates](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getAllCandidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (id)getVisibleCandidates
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("UnsupportedMethodInBaseClassException"), CFSTR("Method should not be called from this class. This should be called from a subclass of this object."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (int64_t)selectCandidate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("UnsupportedMethodInBaseClassException"), CFSTR("Method should not be called from this class. This should be called from a subclass of this object."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (int64_t)selectCandidateAtIndex:(int64_t)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("UnsupportedMethodInBaseClassException"), CFSTR("Method should not be called from this class. This should be called from a subclass of this object."), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CGPoint)centerOfCandidate:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  v3 = a3;
  -[objc_class getCandidateCenter:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getCandidateCenter:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (double)getCandidateBarHeight
{
  double v2;

  -[objc_class getCandidateBarRect](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getCandidateBarRect");
  return v2;
}

- (double)getCandidateBarWidth
{
  double v2;

  -[objc_class getCandidateBarRect](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getCandidateBarRect");
  return v2;
}

@end
